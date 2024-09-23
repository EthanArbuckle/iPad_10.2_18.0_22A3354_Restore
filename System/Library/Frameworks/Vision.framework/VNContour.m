@implementation VNContour

- (VNContour)initWithPoints:(const void *)a3 topLevelIndex:(unint64_t)a4 indexPath:(id)a5 aspectRatio:(float)a6
{
  id v11;
  char *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void **v24;
  _BYTE *v25;
  unint64_t v26;
  char *v27;
  void *v28;
  char *v29;
  objc_super v31;

  v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)VNContour;
  v12 = -[VNContour init](&v31, sel_init);
  v13 = v12;
  if (v12)
  {
    v14 = v12 + 16;
    if (v12 + 16 == a3)
    {
LABEL_22:
      *((_QWORD *)v13 + 5) = a4;
      objc_storeStrong((id *)v13 + 9, a5);
      *((_DWORD *)v13 + 12) = 0;
      *((float *)v13 + 16) = a6;
      goto LABEL_23;
    }
    v15 = *(char **)a3;
    v16 = (char *)*((_QWORD *)a3 + 1);
    v17 = (int64_t)&v16[-*(_QWORD *)a3];
    v18 = v17 >> 3;
    v19 = *((_QWORD *)v12 + 4);
    v20 = (char *)*((_QWORD *)v12 + 2);
    if (v17 >> 3 <= (unint64_t)((v19 - (uint64_t)v20) >> 3))
    {
      v23 = a4;
      v24 = (void **)(v12 + 24);
      v25 = (_BYTE *)*((_QWORD *)v12 + 3);
      v26 = (v25 - v20) >> 3;
      if (v26 < v18)
      {
        v27 = &v15[8 * v26];
        if (v25 != v20)
        {
          memmove(*((void **)v12 + 2), v15, v25 - v20);
          v20 = (char *)*v24;
        }
        v17 = v16 - v27;
        if (v16 == v27)
          goto LABEL_21;
        v28 = v20;
        v29 = v27;
        goto LABEL_20;
      }
    }
    else
    {
      if (v20)
      {
        *((_QWORD *)v12 + 3) = v20;
        operator delete(v20);
        v19 = 0;
        *v14 = 0;
        *((_QWORD *)v13 + 3) = 0;
        *((_QWORD *)v13 + 4) = 0;
      }
      if (v17 < 0)
        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
      v21 = v19 >> 2;
      if (v19 >> 2 <= v18)
        v21 = v17 >> 3;
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
        v22 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v22 = v21;
      std::vector<long long>::__vallocate[abi:ne180100]((_QWORD *)v13 + 2, v22);
      v23 = a4;
      v24 = (void **)(v13 + 24);
      v20 = (char *)*((_QWORD *)v13 + 3);
    }
    if (v16 == v15)
    {
LABEL_21:
      *v24 = &v20[v17];
      a4 = v23;
      goto LABEL_22;
    }
    v28 = v20;
    v29 = v15;
LABEL_20:
    memmove(v28, v29, v17);
    goto LABEL_21;
  }
LABEL_23:

  return (VNContour *)v13;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_normalizedPath);
  v3.receiver = self;
  v3.super_class = (Class)VNContour;
  -[VNContour dealloc](&v3, sel_dealloc);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (NSInteger)childContourCount
{
  NSInteger result;
  _QWORD *v4;

  result = (NSInteger)self->_observation;
  if (result)
  {
    v4 = (_QWORD *)objc_msgSend((id)result, "childContourIndicesAtIndex:", self->_topLevelIndex);
    return (uint64_t)(v4[1] - *v4) >> 2;
  }
  return result;
}

- (NSArray)childContours
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id *v12;

  if (self->_observation)
  {
    v3 = (void *)MEMORY[0x1A1B0B060]();
    v4 = -[VNContoursObservation childContourIndicesAtIndex:](self->_observation, "childContourIndicesAtIndex:", self->_topLevelIndex);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)(v4[1] - *v4) >> 2);
    -[VNContour indexPath](self, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4[1] - *v4;
    if (v7)
    {
      v8 = 0;
      v9 = v7 >> 2;
      if (v9 <= 1)
        v10 = 1;
      else
        v10 = v9;
      do
      {
        objc_msgSend(v6, "indexPathByAddingIndex:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[VNContour initWithObservation:topLevelIndex:indexPath:aspectRatio:]((id *)[VNContour alloc], self->_observation, (void *)*(unsigned int *)(*v4 + 4 * v8), v11, self->_aspectRatio);
        objc_msgSend(v5, "addObject:", v12);

        ++v8;
      }
      while (v10 != v8);
    }

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v5;
}

- (VNContour)childContourAtIndex:(NSUInteger)childContourIndex error:(NSError *)error
{
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id *v11;

  v7 = -[VNContoursObservation childContourIndicesAtIndex:](self->_observation, "childContourIndicesAtIndex:", self->_topLevelIndex);
  if (childContourIndex >= (uint64_t)(v7[1] - *v7) >> 2)
  {
    if (!error)
    {
      v11 = 0;
      return (VNContour *)v11;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", childContourIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", v10, CFSTR("childIndex"));
    v11 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
    -[VNContour indexPath](self, "indexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathByAddingIndex:", childContourIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[VNContour initWithObservation:topLevelIndex:indexPath:aspectRatio:]((id *)[VNContour alloc], self->_observation, (void *)*(unsigned int *)(*v8 + 4 * childContourIndex), v10, self->_aspectRatio);
  }

  return (VNContour *)v11;
}

- (NSInteger)pointCount
{
  VNContoursObservation *observation;

  observation = self->_observation;
  if (observation)
    return *(int *)((_QWORD)-[VNContoursObservation polygonList](observation, "polygonList")[8]
                  + 40 * self->_topLevelIndex);
  else
    return (uint64_t)(*(_QWORD *)&self->_anon_10[8] - *(_QWORD *)self->_anon_10) >> 3;
}

- (const)normalizedPoints
{
  VNContoursObservation *observation;
  unsigned __int8 *anon_10;

  observation = self->_observation;
  if (observation)
    anon_10 = (unsigned __int8 *)((_QWORD)-[VNContoursObservation polygonList](observation, "polygonList")[8]
                                + 40 * self->_topLevelIndex
                                + 8);
  else
    anon_10 = self->_anon_10;
  return *(const simd_float2 **)anon_10;
}

- (VNContour)polygonApproximationWithEpsilon:(float)epsilon error:(NSError *)error
{
  uint64_t v7;
  VNContour *v8;
  unint64_t v9;
  float v10;
  float v11;
  _QWORD *v12;
  void *v13;
  char *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  float *v19;
  float *v20;
  void *v21;
  VNContour *v22;
  void *v23;
  VNContour *v24;
  void *__p;
  float *v27;
  uint64_t v28;
  _QWORD v29[3];

  v7 = -[VNContour pointCount](self, "pointCount");
  if (v7 <= 1)
  {
    if (error)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("The contour is too small for polygon approximation"));
      v8 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      return v8;
    }
LABEL_11:
    v8 = 0;
    return v8;
  }
  if (epsilon <= 0.0)
  {
    if (error)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The value for epsilon is invalid. It needs to be bigger than zero but it is %f"), epsilon);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v21);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_11;
  }
  v9 = v7;
  -[VNContour aspectRatio](self, "aspectRatio");
  v11 = v10;
  v12 = -[VNContour createNormalizedPointsCorrectedForAspectRatio](self);
  if (v9 >> 61)
    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
  v13 = v12;
  v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v9);
  v29[0] = v14;
  v29[2] = &v14[8 * v15];
  memmove(v14, v13, 8 * v9);
  v29[1] = &v14[8 * v9];
  __p = 0;
  v27 = 0;
  v28 = 0;
  RamerDouglasPeucker((uint64_t)v29, &__p, epsilon, v16, v17, v18);
  v19 = (float *)__p;
  v20 = v27;
  while (v19 != v20)
  {
    v19[1] = v11 * v19[1];
    v19 += 2;
  }
  v22 = [VNContour alloc];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNContour aspectRatio](self, "aspectRatio");
  v24 = -[VNContour initWithPoints:topLevelIndex:indexPath:aspectRatio:](v22, "initWithPoints:topLevelIndex:indexPath:aspectRatio:", &__p, 0, v23);

  free(v13);
  v8 = v24;
  if (__p)
  {
    v27 = (float *)__p;
    operator delete(__p);
  }
  if (v14)
    operator delete(v14);

  return v8;
}

- (CGPathRef)normalizedPath
{
  os_unfair_lock_s *p_pathLock;
  VNContoursObservation *observation;
  const EPolygonList *v5;
  EPolygon *var2;
  unint64_t topLevelIndex;
  float v8;
  uint64_t v9;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  CGPath *Mutable;
  unint64_t v15;
  const simd_float2 *v16;
  const simd_float2 *v17;
  unint64_t v18;
  const simd_float2 *v19;
  CGPathRef v21[2];
  CGPath *v22;

  p_pathLock = &self->_pathLock;
  os_unfair_lock_lock(&self->_pathLock);
  if (!self->_normalizedPath)
  {
    observation = self->_observation;
    if (observation)
    {
      v5 = -[VNContoursObservation polygonList](observation, "polygonList");
      var2 = v5->var2;
      topLevelIndex = self->_topLevelIndex;
      apple::vision::libraries::autotrace::ContourToPath::ContourToPath((apple::vision::libraries::autotrace::ContourToPath *)v21, v8);
      if ((apple::vision::libraries::autotrace::ContourToPath::autoTrace((apple::vision::libraries::autotrace::ContourToPath *)v21, (const apple::vision::libraries::autotrace::EPolygonList *)v5, (const apple::vision::libraries::autotrace::EPolygon *)((char *)var2 + 40 * topLevelIndex), v9, v10, v11, v12, v13) & 1) != 0)
      {
        Mutable = v22;
        v22 = 0;
      }
      else
      {
        Mutable = 0;
      }
      apple::vision::libraries::autotrace::ContourToPath::~ContourToPath(v21);
    }
    else
    {
      Mutable = CGPathCreateMutable();
      v15 = -[VNContour pointCount](self, "pointCount");
      if (v15)
      {
        v16 = -[VNContour normalizedPoints](objc_retainAutorelease(self), "normalizedPoints");
        v17 = v16;
        if (v16)
        {
          CGPathMoveToPoint(Mutable, 0, COERCE_FLOAT(*v16), COERCE_FLOAT(HIDWORD(*(unint64_t *)v16)));
          if (v15 >= 2)
          {
            v18 = v15 - 1;
            v19 = v17 + 1;
            do
            {
              CGPathAddLineToPoint(Mutable, 0, COERCE_FLOAT(*v19), COERCE_FLOAT(HIDWORD(*(unint64_t *)v19)));
              ++v19;
              --v18;
            }
            while (v18);
          }
        }
      }
    }
    self->_normalizedPath = Mutable;
  }
  os_unfair_lock_unlock(p_pathLock);
  return self->_normalizedPath;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  VNContour *v8;
  const simd_float2 *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int32 v12;
  unsigned int **v13;
  unsigned int *i;
  unsigned int v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VNContour;
  v3 = -[VNContour hash](&v17, sel_hash);
  v4 = -[VNContour requestRevision](self, "requestRevision");
  -[VNContour indexPath](self, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ __ROR8__(v4 ^ __ROR8__(v3, 51), 51);

  v7 = -[VNContour topLevelIndex](self, "topLevelIndex") ^ __ROR8__(v6, 51);
  v8 = objc_retainAutorelease(self);
  v9 = -[VNContour normalizedPoints](v8, "normalizedPoints");
  v10 = -[VNContour pointCount](v8, "pointCount");
  if (v10)
  {
    v11 = 2 * v10;
    if ((unint64_t)(2 * v10) <= 1)
      v11 = 1;
    do
    {
      v12 = v9->i32[0];
      v9 = (const simd_float2 *)((char *)v9 + 4);
      v7 = v12 ^ __ROR8__(v7, 51);
      --v11;
    }
    while (v11);
  }
  v13 = -[VNContoursObservation childContourIndicesAtIndex:](v8->_observation, "childContourIndicesAtIndex:", v8->_topLevelIndex);
  for (i = *v13; i != v13[1]; ++i)
  {
    v15 = *i;
    v7 = v15 ^ __ROR8__(v7, 51);
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VNContour *v4;
  VNContour *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  NSInteger v10;
  VNContour *v11;
  float32x2_t *v12;
  VNContour *v13;
  float32x2_t *v14;
  uint64_t v15;
  float32x2_t v16;
  int8x8_t v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  BOOL v22;

  v4 = (VNContour *)a3;
  if (self == v4)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNContour requestRevision](self, "requestRevision");
      if (v6 == -[VNContour requestRevision](v5, "requestRevision"))
      {
        -[VNContour indexPath](self, "indexPath");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNContour indexPath](v5, "indexPath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if ((v9 & 1) != 0)
        {
          v10 = -[VNContour pointCount](self, "pointCount");
          if (v10 == -[VNContour pointCount](v5, "pointCount"))
          {
            v11 = objc_retainAutorelease(self);
            v12 = -[VNContour normalizedPoints](v11, "normalizedPoints");
            v13 = objc_retainAutorelease(v5);
            v14 = -[VNContour normalizedPoints](v13, "normalizedPoints");
            if (v10)
            {
              v15 = 8 * v10;
              v16 = (float32x2_t)vdup_n_s32(0x358637BDu);
              while (1)
              {
                v17 = vmvn_s8((int8x8_t)vcge_f32(v16, vabd_f32(*v12, *v14)));
                if (((v17.i32[0] | v17.i32[1]) & 1) != 0)
                  break;
                ++v12;
                ++v14;
                v15 -= 8;
                if (!v15)
                  goto LABEL_10;
              }
            }
            else
            {
LABEL_10:
              v18 = -[VNContour childContourCount](v11, "childContourCount");
              if (v18 == -[VNContour childContourCount](v13, "childContourCount"))
              {
                -[VNContour aspectRatio](v11, "aspectRatio");
                v20 = v19;
                -[VNContour aspectRatio](v13, "aspectRatio");
                v22 = v20 == v21;
LABEL_15:

                goto LABEL_16;
              }
            }
          }
        }
      }
      v22 = 0;
      goto LABEL_15;
    }
    v22 = 0;
  }
LABEL_16:

  return v22;
}

- (unint64_t)requestRevision
{
  unint64_t result;

  result = (unint64_t)self->_observation;
  if (result)
    return objc_msgSend((id)result, "requestRevision");
  return result;
}

- (id)debugQuickLookObject
{
  float v3;

  -[VNContour aspectRatio](self, "aspectRatio");
  return VNDebugPathFromNormalizedCGPath((uint64_t)-[VNContour normalizedPath](objc_retainAutorelease(self), "normalizedPath"), 1000.0, v3 * 1000.0);
}

- (unint64_t)topLevelIndex
{
  return self->_topLevelIndex;
}

- (float)aspectRatio
{
  return self->_aspectRatio;
}

- (void).cxx_destruct
{
  void *v3;

  objc_storeStrong((id *)&self->_indexPath, 0);
  v3 = *(void **)self->_anon_10;
  if (v3)
  {
    *(_QWORD *)&self->_anon_10[8] = v3;
    operator delete(v3);
  }
  objc_storeStrong((id *)&self->_observation, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (_QWORD)createNormalizedPointsCorrectedForAspectRatio
{
  uint64_t v2;
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  float v8;
  uint64_t v9;
  float v10;
  int v12;

  if (!a1)
    return 0;
  v2 = objc_msgSend(a1, "pointCount");
  v3 = malloc_type_malloc(8 * v2, 0x100004000313F17uLL);
  v4 = objc_retainAutorelease(a1);
  v5 = objc_msgSend(v4, "normalizedPoints");
  objc_msgSend(v4, "aspectRatio");
  if (v3 && v2 >= 1)
  {
    for (i = 0; i != v2; ++i)
    {
      LODWORD(v8) = HIDWORD(*(_QWORD *)(v5 + 8 * i));
      objc_msgSend(v4, "aspectRatio", *(_QWORD *)(v5 + 8 * i), v6);
      LODWORD(v9) = v12;
      *((float *)&v9 + 1) = v8 / v10;
      v3[i] = v9;
    }
  }
  return v3;
}

- (id)initWithObservation:(void *)a3 topLevelIndex:(void *)a4 indexPath:(float)a5 aspectRatio:
{
  id v10;
  id v11;
  id *v12;
  objc_super v14;

  v10 = a2;
  v11 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)VNContour;
    v12 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 1, a2);
      a1[5] = a3;
      objc_storeStrong(a1 + 9, a4);
      *((_DWORD *)a1 + 12) = 0;
      *((float *)a1 + 16) = a5;
    }
  }

  return a1;
}

- (uint64_t)normalizedPointsInTopLeftOrigin:(unsigned int)a3 orientation:(uint64_t)a4
{
  int v4;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  float32x2_t *v15;
  uint64_t *v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;

  v4 = a4;
  if ((a4 - 2) >= 7 && (a3 & 1) == 0)
    return objc_msgSend(objc_retainAutorelease(a1), "normalizedPoints");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d_%d"), a4, a3);
  v9 = a1;
  objc_sync_enter(v9);
  objc_getAssociatedObject(v9, (const void *)-[VNContour(OrientationAdditions) normalizedPointsInTopLeftOrigin:orientation:]::kNormalizedPointsDictionaryAssociatedObjectKey);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_setAssociatedObject(v9, (const void *)-[VNContour(OrientationAdditions) normalizedPointsInTopLeftOrigin:orientation:]::kNormalizedPointsDictionaryAssociatedObjectKey, v10, (void *)1);
  }
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = (void *)MEMORY[0x1A1B0B060]();
    v13 = objc_msgSend(v9, "pointCount");
    v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 8 * v13));
    v15 = (float32x2_t *)objc_msgSend(v14, "mutableBytes");
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    VNAffineTransformForVisionToTopLeftOriginOrientation(a3, v4, (uint64_t)&v23);
    v16 = (uint64_t *)objc_msgSend(objc_retainAutorelease(v9), "normalizedPoints");
    if (v13)
    {
      v17 = v23;
      v18 = v24;
      v19 = v25;
      do
      {
        v20 = *v16++;
        *v15++ = vcvt_f32_f64(vaddq_f64(v19, vmlaq_n_f64(vmulq_n_f64(v18, *(float *)&v20), v17, *(float *)&v20)));
        --v13;
      }
      while (v13);
    }
    v11 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v10, "setObject:forKey:", v11, v8);

    objc_autoreleasePoolPop(v12);
  }
  v21 = objc_retainAutorelease(v11);
  v22 = objc_msgSend(v21, "bytes");

  objc_sync_exit(v9);
  return v22;
}

- (CGPath)normalizedPathInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  const void *v5;
  _OWORD v7[3];

  memset(v7, 0, sizeof(v7));
  VNAffineTransformForVisionToTopLeftOriginOrientation(a3, a4, (uint64_t)v7);
  v5 = (const void *)MEMORY[0x1A1B09D7C](-[VNContour normalizedPath](objc_retainAutorelease(self), "normalizedPath"), v7);
  CFAutorelease(v5);
  return (CGPath *)v5;
}

- (float)aspectRatioInOrientation:(unsigned int)a3
{
  float result;

  -[VNContour aspectRatio](self, "aspectRatio");
  if (result != 0.0 && a3 <= 7 && ((1 << a3) & 0xB4) != 0)
    return 1.0 / result;
  return result;
}

@end
