@implementation VNFaceLandmarkRegion2D

- (VNFaceLandmarkRegion2D)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4 pointCount:(unint64_t)a5
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("[VNFaceLandmarkRegion2D -initWithRequestRevision:faceBoundingBox:] is not available, use class designated initializers"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (VNFaceLandmarkRegion2D)initWithCoder:(id)a3
{
  id v4;
  VNFaceLandmarkRegion2D *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  size_t v9;
  size_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *precisionEstimatesPerPoint;
  VNFaceLandmarkRegion2D *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VNFaceLandmarkRegion2D;
  v5 = -[VNFaceLandmarkRegion initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_12;
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("VNFaceLandmarkRegion2D"));
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive VNFaceLandmarkRegion2D object due to coding version mismatch: Currently supported: %u; encoded: %u"),
                   0,
                   v6);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v8);
LABEL_10:

    goto LABEL_11;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("FLMReg2D_PtsClsf")))
    v5->_pointsClassification = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FLMReg2D_PtsClsf"));
  v9 = -[VNFaceLandmarkRegion pointCount](v5, "pointCount");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FLMReg2D_PtsData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "length");
  if (v10 != 8 * v9)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive VNFaceLandmarkRegion2D object. Error: points buffer size mismatch (data size: %lu; expected: %lu)"),
                   v10,
                   8 * v9);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v19);

    goto LABEL_10;
  }
  v11 = malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
  *(_QWORD *)&v5->_points[4] = v11;
  if (!v11)
  {
LABEL_11:

LABEL_12:
    v18 = 0;
    goto LABEL_13;
  }
  v12 = objc_retainAutorelease(v7);
  memcpy(v11, (const void *)objc_msgSend(v12, "bytes"), v10);
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("FLMs_PtsAE"));
  v16 = objc_claimAutoreleasedReturnValue();
  precisionEstimatesPerPoint = v5->_precisionEstimatesPerPoint;
  v5->_precisionEstimatesPerPoint = (NSArray *)v16;

  -[VNFaceLandmarkRegion2D _initLocks](v5, "_initLocks");
  v18 = v5;
LABEL_13:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNFaceLandmarkRegion2D;
  -[VNFaceLandmarkRegion encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", 0, CFSTR("VNFaceLandmarkRegion2D"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_pointsClassification, CFSTR("FLMReg2D_PtsClsf"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", -[VNFaceLandmarkRegion2D points](self, "points"), 8 * -[VNFaceLandmarkRegion pointCount](self, "pointCount"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("FLMReg2D_PtsData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_precisionEstimatesPerPoint, CFSTR("FLMs_PtsAE"));

}

- (double)pointAtIndex:(unint64_t)a3
{
  unint64_t v5;
  double result;

  v5 = objc_msgSend(a1, "pointCount");
  result = 0.0;
  if (v5 > a3)
    return *(double *)(a1[9] + 8 * a3);
  return result;
}

- (const)normalizedPoints
{
  os_unfair_lock_s *p_pointsCalculatorLock;
  void *v4;
  NSUInteger v5;
  uint64_t v6;
  char *v7;
  double *v8;
  float *v9;
  float v10;
  id v11;
  const CGPoint *v12;

  p_pointsCalculatorLock = &self->_pointsCalculatorLock;
  os_unfair_lock_lock(&self->_pointsCalculatorLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sizedPointsCache, "objectForKeyedSubscript:", &unk_1E459CAA8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = -[VNFaceLandmarkRegion pointCount](self, "pointCount");
    v6 = 16 * v5;
    v7 = (char *)malloc_type_malloc(16 * v5, 0x18CEF8C0uLL);
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", v7 != 0, CFSTR("failed to allocate internal points array"));
    if (v5)
    {
      v8 = (double *)(v7 + 8);
      v9 = (float *)(*(_QWORD *)&self->_points[4] + 4);
      do
      {
        *(v8 - 1) = COERCE_FLOAT(*(_QWORD *)(v9 - 1));
        v10 = *v9;
        v9 += 2;
        *v8 = v10;
        v8 += 2;
        --v5;
      }
      while (v5);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sizedPointsCache, "setObject:forKeyedSubscript:", v4, &unk_1E459CAA8);
  }
  os_unfair_lock_unlock(p_pointsCalculatorLock);
  v11 = objc_retainAutorelease(v4);
  v12 = (const CGPoint *)objc_msgSend(v11, "bytes");

  return v12;
}

- (const)pointsInImageOfSize:(CGSize)imageSize
{
  void *v4;
  void *v5;
  NSUInteger v6;
  uint64_t v7;
  float64x2_t *v8;
  float64x2_t v9;
  float64_t v10;
  float64x2_t v11;
  float64_t v12;
  float32x2_t *v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t *v17;
  float32x2_t v18;
  id v19;
  const CGPoint *v20;
  float64x2_t v22;
  CGSize v23;

  v23 = imageSize;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v23, "{CGSize=dd}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_pointsCalculatorLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sizedPointsCache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = -[VNFaceLandmarkRegion pointCount](self, "pointCount");
    v7 = 16 * v6;
    v8 = (float64x2_t *)malloc_type_malloc(16 * v6, 0xB66C930uLL);
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", v8 != 0, CFSTR("failed to allocate internal points array"));
    v22 = (float64x2_t)v23;
    -[VNFaceLandmarkRegion faceBoundingBox](self, "faceBoundingBox");
    if (v6)
    {
      v13 = *(float32x2_t **)&self->_points[4];
      v9.f64[1] = v10;
      v14 = vcvtq_f64_u64(vcvtq_u64_f64(v22));
      v15 = vmulq_f64(v9, v14);
      v11.f64[1] = v12;
      v16 = vmulq_f64(v11, v14);
      v17 = v8;
      do
      {
        v18 = *v13++;
        *v17++ = vmlaq_f64(v15, v16, vcvtq_f64_f32(v18));
        --v6;
      }
      while (v6);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sizedPointsCache, "setObject:forKeyedSubscript:", v5, v4);
  }
  os_unfair_lock_unlock(&self->_pointsCalculatorLock);
  v19 = objc_retainAutorelease(v5);
  v20 = (const CGPoint *)objc_msgSend(v19, "bytes");

  return v20;
}

- (VNFaceLandmarkRegion2D)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4 pointsClassification:(int64_t)a5 points:pointCount:precisionEstimatesPerPoint:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  VNFaceLandmarkRegion2D *v19;
  VNFaceLandmarkRegion2D *v20;
  uint64_t v21;
  NSMutableDictionary *sizedPointsCache;
  uint64_t v23;
  NSArray *precisionEstimatesPerPoint;
  objc_super v26;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3;
  v18 = v8;
  if (v10)
  {
    v26.receiver = self;
    v26.super_class = (Class)VNFaceLandmarkRegion2D;
    v19 = -[VNFaceLandmarkRegion initWithOriginatingRequestSpecifier:faceBoundingBox:pointCount:](&v26, sel_initWithOriginatingRequestSpecifier_faceBoundingBox_pointCount_, v17, v9, x, y, width, height);
    v20 = v19;
    if (v19)
    {
      v19->_pointsClassification = a5;
      *(_QWORD *)&v19->_points[4] = v10;
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
      sizedPointsCache = v20->_sizedPointsCache;
      v20->_sizedPointsCache = (NSMutableDictionary *)v21;

      v23 = objc_msgSend(v18, "copy");
      precisionEstimatesPerPoint = v20->_precisionEstimatesPerPoint;
      v20->_precisionEstimatesPerPoint = (NSArray *)v23;

      -[VNFaceLandmarkRegion2D _initLocks](v20, "_initLocks");
      self = v20;
      v20 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_initLocks
{
  self->_pointsCalculatorLock._os_unfair_lock_opaque = 0;
}

- (void)dealloc
{
  objc_super v3;

  free(*(void **)&self->_points[4]);
  v3.receiver = self;
  v3.super_class = (Class)VNFaceLandmarkRegion2D;
  -[VNFaceLandmarkRegion2D dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNFaceLandmarkRegion2D;
  return -[NSArray hash](self->_precisionEstimatesPerPoint, "hash") ^ __ROR8__(-[VNFaceLandmarkRegion pointCount](self, "pointCount") ^ __ROR8__(-[VNFaceLandmarkRegion hash](&v3, sel_hash), 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNFaceLandmarkRegion2D *v4;
  VNFaceLandmarkRegion2D *v5;
  NSUInteger v6;
  VNFaceLandmarkRegion2D *v7;
  float64x2_t *v8;
  VNFaceLandmarkRegion2D *v9;
  float64x2_t *v10;
  int32x2_t v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v16;

  v4 = (VNFaceLandmarkRegion2D *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VNFaceLandmarkRegion2D;
    if (-[VNFaceLandmarkRegion isEqual:](&v16, sel_isEqual_, v4))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        v6 = -[VNFaceLandmarkRegion pointCount](self, "pointCount");
        if (v6 == -[VNFaceLandmarkRegion pointCount](v5, "pointCount"))
        {
          v7 = objc_retainAutorelease(self);
          v8 = -[VNFaceLandmarkRegion2D normalizedPoints](v7, "normalizedPoints");
          v9 = objc_retainAutorelease(v5);
          v10 = -[VNFaceLandmarkRegion2D normalizedPoints](v9, "normalizedPoints");
          if (!v6)
          {
LABEL_8:
            -[VNFaceLandmarkRegion2D precisionEstimatesPerPoint](v7, "precisionEstimatesPerPoint");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[VNFaceLandmarkRegion2D precisionEstimatesPerPoint](v9, "precisionEstimatesPerPoint");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = VisionCoreEqualOrNilObjects();

LABEL_12:
            goto LABEL_13;
          }
          while (1)
          {
            v11 = vmovn_s64(vceqq_f64(*v8, *v10));
            if ((v11.i32[0] & v11.i32[1] & 1) == 0)
              break;
            ++v10;
            ++v8;
            if (!--v6)
              goto LABEL_8;
          }
        }
        v14 = 0;
        goto LABEL_12;
      }
    }
    v14 = 0;
  }
LABEL_13:

  return v14;
}

- (VNPointsClassification)pointsClassification
{
  return self->_pointsClassification;
}

- (uint64_t)points
{
  return *(_QWORD *)(a1 + 72);
}

- (NSArray)precisionEstimatesPerPoint
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precisionEstimatesPerPoint, 0);
  objc_storeStrong((id *)&self->_sizedPointsCache, 0);
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNDetectFaceLandmarksRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (const)normalizedPointsInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  _BOOL4 v5;
  void *v8;
  VNFaceLandmarkRegion2D *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  float64x2_t *v15;
  uint64_t v16;
  float64x2_t v17;
  float64x2_t v18;
  double *v19;
  float64x2_t v20;
  id v21;
  const CGPoint *v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;

  v5 = a3;
  if (a4 - 2 >= 7 && !a3)
    return -[VNFaceLandmarkRegion2D normalizedPoints](objc_retainAutorelease(self), "normalizedPoints");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d_%d"), *(_QWORD *)&a4, a3);
  v9 = self;
  objc_sync_enter(v9);
  objc_getAssociatedObject(v9, (const void *)-[VNFaceLandmarkRegion2D(OrientationAdditions) normalizedPointsInTopLeftOrigin:orientation:]::kNormalizedPointsDictionaryAssociatedObjectKey);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_setAssociatedObject(v9, (const void *)-[VNFaceLandmarkRegion2D(OrientationAdditions) normalizedPointsInTopLeftOrigin:orientation:]::kNormalizedPointsDictionaryAssociatedObjectKey, v10, (void *)1);
  }
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = (void *)MEMORY[0x1A1B0B060]();
    v13 = -[VNFaceLandmarkRegion pointCount](v9, "pointCount");
    v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 16 * v13));
    v15 = (float64x2_t *)objc_msgSend(v14, "mutableBytes");
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    VNAffineTransformForVisionToTopLeftOriginOrientation(v5, a4, (uint64_t)&v23);
    v16 = -[VNFaceLandmarkRegion2D normalizedPoints](objc_retainAutorelease(v9), "normalizedPoints");
    if (v13)
    {
      v17 = v23;
      v18 = v24;
      v19 = (double *)(v16 + 8);
      v20 = v25;
      do
      {
        *v15++ = vaddq_f64(v20, vmlaq_n_f64(vmulq_n_f64(v18, *v19), v17, *(v19 - 1)));
        v19 += 2;
        --v13;
      }
      while (v13);
    }
    v11 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v10, "setObject:forKey:", v11, v8);

    objc_autoreleasePoolPop(v12);
  }
  v21 = objc_retainAutorelease(v11);
  v22 = (const CGPoint *)objc_msgSend(v21, "bytes");

  objc_sync_exit(v9);
  return v22;
}

@end
