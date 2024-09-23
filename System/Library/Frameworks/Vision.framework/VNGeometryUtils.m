@implementation VNGeometryUtils

+ (VNCircle)boundingCircleForContour:(VNContour *)contour error:(NSError *)error
{
  VNContour *v5;
  float32x2_t *v6;
  int64_t v7;
  float v8;
  float v9;
  void *v10;

  v5 = contour;
  v6 = (float32x2_t *)-[VNContour createNormalizedPointsCorrectedForAspectRatio](v5);
  if (v6)
  {
    v7 = -[VNContour pointCount](v5, "pointCount");
    -[VNContour aspectRatio](v5, "aspectRatio");
    v9 = v8;
    objc_opt_self();
    +[VNBoundingCircleAlgorithm boundingCircleForSIMDPoints:pointCount:aspectRatioForCentroid:error:](v9, (uint64_t)VNBoundingCircleAlgorithm, v6, v7, error);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }
  else if (error)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Invalid contour passed in"));
    v10 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return (VNCircle *)v10;
}

+ (VNCircle)boundingCircleForPoints:(NSArray *)points error:(NSError *)error
{
  NSArray *v5;
  NSArray *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int rep;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  void *__p;
  void *v21;
  __int128 v22;

  v5 = points;
  objc_opt_self();
  if (-[NSArray count](v5, "count"))
  {
    v6 = v5;
    objc_opt_self();
    v7 = -[NSArray count](v6, "count");
    v22 = 0uLL;
    std::vector<CGPoint>::vector(&__p, v7, &v22);
    if (v7)
    {
      v8 = 0;
      for (i = 0; i != v7; ++i)
      {
        -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "location");
        v11 = (char *)__p + v8;
        *v11 = v12;
        v11[1] = v13;

        v8 += 16;
      }
    }
    rep = std::chrono::system_clock::now().__d_.__rep_;
    v15 = rep + ((rep / 0x7FFFFFFF) | ((rep / 0x7FFFFFFF) << 31));
    if (v15 <= 1)
      v15 = 1;
    LODWORD(v22) = v15;
    std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<CGPoint *>,std::__wrap_iter<CGPoint *>,std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((unint64_t)__p, (uint64_t)v21, (uint64_t)&v22);

    +[VNBoundingCircleAlgorithm _boundingCircleForPoints:aspectRatioForCentroid:](1.0, (uint64_t)VNBoundingCircleAlgorithm, (double **)&__p);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else if (error)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot calculate minimum enclosing circle for the given set of points"));
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }

    if (__p)
    {
      v21 = __p;
      operator delete(__p);
    }
  }
  else if (error)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Invalid number of points passed for minimum enclosing circle calculation"));
    v17 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return (VNCircle *)v17;
}

+ (VNCircle)boundingCircleForSIMDPoints:(const simd_float2 *)points pointCount:(NSInteger)pointCount error:(NSError *)error
{
  objc_opt_self();
  return (VNCircle *)+[VNBoundingCircleAlgorithm boundingCircleForSIMDPoints:pointCount:aspectRatioForCentroid:error:](1.0, (uint64_t)VNBoundingCircleAlgorithm, (float32x2_t *)points, pointCount, error);
}

+ (BOOL)calculateArea:(double *)area forContour:(VNContour *)contour orientedArea:(BOOL)orientedArea error:(NSError *)error
{
  _BOOL4 v7;
  VNContour *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t *v14;
  uint64_t v15;
  double v16;
  double v17;
  BOOL v18;
  void *v19;

  v7 = orientedArea;
  v9 = contour;
  objc_opt_self();
  v10 = -[VNContour createNormalizedPointsCorrectedForAspectRatio](v9);
  if (v10)
  {
    v11 = -[VNContour pointCount](v9, "pointCount");
    objc_opt_self();
    if (area)
    {
      if (v11 > 0)
      {
        v12 = v10[v11 - 1];
        v13 = 0.0;
        v14 = v10;
        do
        {
          v15 = *v14++;
          v13 = v13 + vmlas_n_f32((float)-*((float *)&v12 + 1) * *(float *)&v15, *((float *)&v15 + 1), *(float *)&v12);
          v12 = v15;
          --v11;
        }
        while (v11);
        v16 = v13 * 0.5;
        v17 = fabs(v16);
        if (!v7)
          v16 = v17;
        *area = v16;
        v18 = 1;
        goto LABEL_16;
      }
      if (error)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid points count %ld"), v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v19);
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (error)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("null area pointer"));
      v18 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      free(v10);
      goto LABEL_17;
    }
    v18 = 0;
    goto LABEL_16;
  }
  if (error)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Invalid contour passed in"));
    v18 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_17:

  return v18;
}

+ (BOOL)calculatePerimeter:(double *)perimeter forContour:(VNContour *)contour error:(NSError *)error
{
  VNContour *v7;
  _QWORD *v8;
  VNContour *v9;
  const simd_float2 *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  simd_float2 v15;
  VNPoint *v16;
  double v17;
  uint64_t i;
  simd_float2 v19;
  VNPoint *v20;
  double v21;
  VNPoint *v22;
  simd_float2 v23;
  VNPoint *v24;
  double v25;
  double v26;

  v7 = contour;
  objc_opt_self();
  v8 = -[VNContour createNormalizedPointsCorrectedForAspectRatio](v7);
  if (v8)
  {
    v9 = objc_retainAutorelease(v7);
    v10 = -[VNContour normalizedPoints](v9, "normalizedPoints");
    v11 = -[VNContour pointCount](v9, "pointCount");
    objc_opt_self();
    if (perimeter)
    {
      if (v10)
      {
        if (v11 > 0)
        {
          if (v11 == 1)
          {
            *perimeter = 0.0;
          }
          else
          {
            v15 = *v10;
            v16 = -[VNPoint initWithX:y:]([VNPoint alloc], "initWithX:y:", v15.f32[0], v15.f32[1]);
            v17 = 0.0;
            for (i = 1; i != v11; ++i)
            {
              v19 = v10[i];
              v20 = -[VNPoint initWithX:y:]([VNPoint alloc], "initWithX:y:", v19.f32[0], v19.f32[1]);
              -[VNPoint distanceToPoint:](v16, "distanceToPoint:", v20);
              v17 = v17 + v21;

              v16 = v20;
            }
            v22 = -[VNPoint initWithX:y:]([VNPoint alloc], "initWithX:y:", COERCE_FLOAT(*v10), COERCE_FLOAT(HIDWORD(*(unint64_t *)v10)));
            v23 = v10[v11 - 1];
            v24 = -[VNPoint initWithX:y:]([VNPoint alloc], "initWithX:y:", v23.f32[0], v23.f32[1]);
            -[VNPoint distanceToPoint:](v22, "distanceToPoint:", v24);
            v26 = v25;

            *perimeter = v17 + v26;
          }
          v12 = 1;
          goto LABEL_22;
        }
        if (error)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid points count %ld"), v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v14);
          *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_17;
      }
      if (error)
      {
        +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("null points array"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else if (error)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("null perimeter pointer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v12 = 0;
      *error = (NSError *)v13;
LABEL_22:
      free(v8);
      goto LABEL_23;
    }
LABEL_17:
    v12 = 0;
    goto LABEL_22;
  }
  if (error)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Invalid contour passed in"));
    v12 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_23:

  return v12;
}

@end
