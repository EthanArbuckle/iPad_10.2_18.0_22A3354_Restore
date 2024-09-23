@implementation VNFaceLandmarks2D

- (VNFaceLandmarks2D)initWithOriginatingRequestSpecifier:(id)a3 pointsData:(id)a4 pointCount:(unint64_t)a5 constellation:(unint64_t)a6 precisionEstimatesPerPoint:(id)a7 userFacingBBox:(CGRect)a8 alignedBBox:(_Geometry2D_rect2D_)a9 landmarkScore:(float)a10
{
  float height;
  float y;
  float x;
  double v17;
  double v18;
  double v19;
  double v20;
  id v22;
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  VNFaceLandmarks2D *v29;
  VNFaceLandmarks2D *v30;
  VNFaceLandmarks2D *v31;
  float width;
  objc_super v35;

  width = a9.size.width;
  height = a9.size.height;
  y = a9.origin.y;
  x = a9.origin.x;
  v17 = a8.size.height;
  v18 = a8.size.width;
  v19 = a8.origin.y;
  v20 = a8.origin.x;
  v22 = a3;
  v23 = a4;
  v24 = a7;
  v35.receiver = self;
  v35.super_class = (Class)VNFaceLandmarks2D;
  *(float *)&v25 = x;
  *(float *)&v26 = y;
  *(float *)&v27 = height;
  *(float *)&v28 = width;
  v29 = -[VNFaceLandmarks initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:](&v35, sel_initWithOriginatingRequestSpecifier_pointsData_pointCount_userFacingBBox_alignedBBox_landmarkScore_, v22, v23, a5, v20, v19, v18, v17, v25, v26, v27, v28, LODWORD(a10));
  v30 = v29;
  if (v29)
  {
    v29->_constellation = a6;
    objc_storeStrong((id *)&v29->_precisionEstimatesPerPoint, a7);
    -[VNFaceLandmarks2D _initLocks](v30, "_initLocks");
    v31 = v30;
  }

  return v30;
}

- (VNFaceLandmarks2D)initWithCoder:(id)a3
{
  id v4;
  VNFaceLandmarks2D *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const _LandmarkDetector_faceMeshParts_ *v10;
  uint64_t var0;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *precisionEstimatesPerPoint;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VNFaceLandmarks2D;
  v5 = -[VNFaceLandmarks initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("VNFaceLandmarks2D"));
    if ((_DWORD)v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive VNFaceLandmarks2D object due to coding version mismatch:Currently supported: %u; encoded: %u"),
                     0,
                     v6);
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v8);
    }
    else
    {
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("FLMs2D_CType")))
        v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FLMs2D_CType"));
      else
        v9 = 1;
      v5->_constellation = v9;
      v10 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:");
      if (v5->_constellation == 1)
        var0 = v10->var0 + 2;
      else
        var0 = v10->var0;
      v12 = -[VNFaceLandmarks pointCount](v5, "pointCount");
      if (v12 == var0)
      {
        v13 = (void *)MEMORY[0x1E0C99E60];
        v14 = objc_opt_class();
        objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("FLMs2D_PtsAE"));
        v16 = objc_claimAutoreleasedReturnValue();
        precisionEstimatesPerPoint = v5->_precisionEstimatesPerPoint;
        v5->_precisionEstimatesPerPoint = (NSArray *)v16;

        -[VNFaceLandmarks2D _initLocks](v5, "_initLocks");
LABEL_14:

        goto LABEL_15;
      }
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected number of landmark points: %lu; expected: %lu"),
                     v12,
                     var0);
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v8);
    }

    v15 = v5;
    v5 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNFaceLandmarks2D;
  -[VNFaceLandmarks encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", 0, CFSTR("VNFaceLandmarks2D"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_constellation, CFSTR("FLMs2D_CType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_precisionEstimatesPerPoint, CFSTR("FLMs2D_PtsAE"));

}

- (void)_initLocks
{
  self->_allPointsLock._os_unfair_lock_opaque = 0;
  self->_faceContourLock._os_unfair_lock_opaque = 0;
  self->_leftEyeLock._os_unfair_lock_opaque = 0;
  self->_rightEyeLock._os_unfair_lock_opaque = 0;
  self->_leftEyebrowLock._os_unfair_lock_opaque = 0;
  self->_rightEyebrowLock._os_unfair_lock_opaque = 0;
  self->_noseLock._os_unfair_lock_opaque = 0;
  self->_noseCrestLock._os_unfair_lock_opaque = 0;
  self->_medianLineLock._os_unfair_lock_opaque = 0;
  self->_outerLipsLock._os_unfair_lock_opaque = 0;
  self->_innerLipsLock._os_unfair_lock_opaque = 0;
  self->_leftPupilLock._os_unfair_lock_opaque = 0;
  self->_rightPupilLock._os_unfair_lock_opaque = 0;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNFaceLandmarks2D;
  return -[NSArray hash](self->_precisionEstimatesPerPoint, "hash") ^ __ROR8__(LODWORD(self->_constellation) ^ __ROR8__(-[VNFaceLandmarks hash](&v3, sel_hash), 51), 51);
}

- (void)_createPointArray:(const int *)a3 count:(unint64_t)a4
{
  const int *v5;
  _DWORD *v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  _DWORD *i;
  unint64_t v32;
  unint64_t v33;
  float *v34;
  uint64_t v35;
  float v36;

  v5 = a3;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", a3 != 0, CFSTR("pointIndices must not be nullptr"));
  v7 = malloc_type_calloc(8uLL, a4, 0x10C097uLL);
  -[VNFaceLandmarks pointsData](self, "pointsData");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");

  if (-[VNFaceLandmarks isUserFacingBBoxEquivalentToAlignedBBox](self, "isUserFacingBBoxEquivalentToAlignedBBox"))
  {
    v10 = 1.0;
    v11 = 0.0;
    v12 = 1.0;
    v13 = 0.0;
  }
  else
  {
    -[VNFaceLandmarks alignedBBox](self, "alignedBBox");
    v15 = v14;
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v10 = v15 / v16;
    -[VNFaceLandmarks alignedBBox](self, "alignedBBox");
    v18 = v17;
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v12 = v18 / v19;
    -[VNFaceLandmarks alignedBBox](self, "alignedBBox");
    v21 = v20;
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v23 = v21 - v22;
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v11 = v23 / v24;
    -[VNFaceLandmarks alignedBBox](self, "alignedBBox");
    v26 = v25;
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v28 = v26 - v27;
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v13 = v28 / v29;
  }
  v30 = -[VNFaceLandmarks pointCount](self, "pointCount");
  if (a4)
  {
    for (i = v7; ; i += 2)
    {
      v33 = *v5++;
      v32 = v33;
      if (v30 <= v33)
        break;
      v34 = (float *)(v9 + 8 * v32);
      *(float *)&v35 = v11 + *v34 * v10;
      *i = v35;
      v36 = v13 + v34[1] * v12;
      *((float *)&v35 + 1) = v36;
      *(_QWORD *)i = v35;
      if (!--a4)
        return v7;
    }
    free(v7);
    return 0;
  }
  return v7;
}

- (VNFaceLandmarkRegion2D)allPoints
{
  os_unfair_lock_s *p_allPointsLock;
  unint64_t v4;
  _QWORD *v5;
  void *v6;
  VNFaceLandmarkRegion2D *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  VNFaceLandmarkRegion2D *v18;
  VNFaceLandmarkRegion2D *allPoints;
  VNFaceLandmarkRegion2D *v20;

  p_allPointsLock = &self->_allPointsLock;
  os_unfair_lock_lock(&self->_allPointsLock);
  if (!self->_allPoints)
  {
    v4 = -[VNFaceLandmarks pointCount](self, "pointCount");
    v5 = +[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:](VNFaceLandmarkDetector, "allLandmarksPointsIndexesForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    if (v4 != (uint64_t)(v5[1] - *v5) >> 2)
    {
      os_unfair_lock_unlock(p_allPointsLock);
      v20 = 0;
      return v20;
    }
    v6 = -[VNFaceLandmarks2D _createPointArray:count:](self, "_createPointArray:count:");
    v7 = [VNFaceLandmarkRegion2D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[VNFaceLandmarks2D precisionEstimatesPerPoint](self, "precisionEstimatesPerPoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[VNFaceLandmarkRegion2D initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:](v7, "initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:", v8, 0, v6, v4, v17, v10, v12, v14, v16);
    allPoints = self->_allPoints;
    self->_allPoints = v18;

  }
  os_unfair_lock_unlock(p_allPointsLock);
  v20 = self->_allPoints;
  return v20;
}

- (VNFaceLandmarkRegion2D)faceContour
{
  os_unfair_lock_s *p_faceContourLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VNFaceLandmarkRegion2D *v9;
  void *v10;
  VNFaceLandmarkRegion2D *v11;
  VNFaceLandmarkRegion2D *faceContour;

  p_faceContourLock = &self->_faceContourLock;
  os_unfair_lock_lock(&self->_faceContourLock);
  if (!self->_faceContour)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    v5 = -[VNFaceLandmarks2D _createPointArray:count:](self, "_createPointArray:count:", v4->var2, v4->var1);
    v6 = (void *)objc_opt_class();
    -[VNFaceLandmarks2D precisionEstimatesPerPoint](self, "precisionEstimatesPerPoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_createNSArrayFrom:withPointIndices:andPointCount:", v7, v4->var2, v4->var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [VNFaceLandmarkRegion2D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v11 = -[VNFaceLandmarkRegion2D initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:](v9, "initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:", v10, 1, v5, v4->var1, v8);
    faceContour = self->_faceContour;
    self->_faceContour = v11;

  }
  os_unfair_lock_unlock(p_faceContourLock);
  return self->_faceContour;
}

- (id)_createFaceLandmarks2DRegionOfPoints:(int64_t)a3 fromPointIndexes:(const int *)a4 andPointCount:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  VNFaceLandmarkRegion2D *v13;
  void *v14;
  VNFaceLandmarkRegion2D *v15;

  v9 = (void *)objc_opt_class();
  -[VNFaceLandmarks2D precisionEstimatesPerPoint](self, "precisionEstimatesPerPoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_createNSArrayFrom:withPointIndices:andPointCount:", v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[VNFaceLandmarks2D _createPointArray:count:](self, "_createPointArray:count:", a4, a5);
  v13 = [VNFaceLandmarkRegion2D alloc];
  -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
  v15 = -[VNFaceLandmarkRegion2D initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:](v13, "initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:", v14, a3, v12, a5, v11);

  return v15;
}

- (VNFaceLandmarkRegion2D)leftEye
{
  os_unfair_lock_s *p_leftEyeLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *leftEye;

  p_leftEyeLock = &self->_leftEyeLock;
  os_unfair_lock_lock(&self->_leftEyeLock);
  if (!self->_leftEye)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 2, v4->var14, v4->var13);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    leftEye = self->_leftEye;
    self->_leftEye = v5;

  }
  os_unfair_lock_unlock(p_leftEyeLock);
  return self->_leftEye;
}

- (VNFaceLandmarkRegion2D)rightEye
{
  os_unfair_lock_s *p_rightEyeLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *rightEye;

  p_rightEyeLock = &self->_rightEyeLock;
  os_unfair_lock_lock(&self->_rightEyeLock);
  if (!self->_rightEye)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 2, v4->var22, v4->var21);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    rightEye = self->_rightEye;
    self->_rightEye = v5;

  }
  os_unfair_lock_unlock(p_rightEyeLock);
  return self->_rightEye;
}

- (VNFaceLandmarkRegion2D)leftEyebrow
{
  os_unfair_lock_s *p_leftEyebrowLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *leftEyebrow;

  p_leftEyebrowLock = &self->_leftEyebrowLock;
  os_unfair_lock_lock(&self->_leftEyebrowLock);
  if (!self->_leftEyebrow)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 1, v4->var12, v4->var11);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    leftEyebrow = self->_leftEyebrow;
    self->_leftEyebrow = v5;

  }
  os_unfair_lock_unlock(p_leftEyebrowLock);
  return self->_leftEyebrow;
}

- (VNFaceLandmarkRegion2D)rightEyebrow
{
  os_unfair_lock_s *p_rightEyebrowLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *rightEyebrow;

  p_rightEyebrowLock = &self->_rightEyebrowLock;
  os_unfair_lock_lock(&self->_rightEyebrowLock);
  if (!self->_rightEyebrow)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 1, v4->var20, v4->var19);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    rightEyebrow = self->_rightEyebrow;
    self->_rightEyebrow = v5;

  }
  os_unfair_lock_unlock(p_rightEyebrowLock);
  return self->_rightEyebrow;
}

- (VNFaceLandmarkRegion2D)nose
{
  os_unfair_lock_s *p_noseLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *nose;

  p_noseLock = &self->_noseLock;
  os_unfair_lock_lock(&self->_noseLock);
  if (!self->_nose)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 2, v4->var8, v4->var7);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    nose = self->_nose;
    self->_nose = v5;

  }
  os_unfair_lock_unlock(p_noseLock);
  return self->_nose;
}

- (VNFaceLandmarkRegion2D)noseCrest
{
  os_unfair_lock_s *p_noseCrestLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *noseCrest;

  p_noseCrestLock = &self->_noseCrestLock;
  os_unfair_lock_lock(&self->_noseCrestLock);
  if (!self->_noseCrest)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 1, v4->var6, v4->var5);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    noseCrest = self->_noseCrest;
    self->_noseCrest = v5;

  }
  os_unfair_lock_unlock(p_noseCrestLock);
  return self->_noseCrest;
}

- (VNFaceLandmarkRegion2D)medianLine
{
  os_unfair_lock_s *p_medianLineLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *medianLine;

  p_medianLineLock = &self->_medianLineLock;
  os_unfair_lock_lock(&self->_medianLineLock);
  if (!self->_medianLine)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 1, v4->var32, v4->var31);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    medianLine = self->_medianLine;
    self->_medianLine = v5;

  }
  os_unfair_lock_unlock(p_medianLineLock);
  return self->_medianLine;
}

- (VNFaceLandmarkRegion2D)outerLips
{
  os_unfair_lock_s *p_outerLipsLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *outerLips;

  p_outerLipsLock = &self->_outerLipsLock;
  os_unfair_lock_lock(&self->_outerLipsLock);
  if (!self->_outerLips)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 2, v4->var28, v4->var27);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    outerLips = self->_outerLips;
    self->_outerLips = v5;

  }
  os_unfair_lock_unlock(p_outerLipsLock);
  return self->_outerLips;
}

- (VNFaceLandmarkRegion2D)innerLips
{
  os_unfair_lock_s *p_innerLipsLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *innerLips;

  p_innerLipsLock = &self->_innerLipsLock;
  os_unfair_lock_lock(&self->_innerLipsLock);
  if (!self->_innerLips)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 2, v4->var30, v4->var29);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    innerLips = self->_innerLips;
    self->_innerLips = v5;

  }
  os_unfair_lock_unlock(p_innerLipsLock);
  return self->_innerLips;
}

- (VNFaceLandmarkRegion2D)leftPupil
{
  os_unfair_lock_s *p_leftPupilLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *leftPupil;

  p_leftPupilLock = &self->_leftPupilLock;
  os_unfair_lock_lock(&self->_leftPupilLock);
  if (!self->_leftPupil)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 2, v4->var16, v4->var15);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    leftPupil = self->_leftPupil;
    self->_leftPupil = v5;

  }
  os_unfair_lock_unlock(p_leftPupilLock);
  return self->_leftPupil;
}

- (VNFaceLandmarkRegion2D)rightPupil
{
  os_unfair_lock_s *p_rightPupilLock;
  const _LandmarkDetector_faceMeshParts_ *v4;
  VNFaceLandmarkRegion2D *v5;
  VNFaceLandmarkRegion2D *rightPupil;

  p_rightPupilLock = &self->_rightPupilLock;
  os_unfair_lock_lock(&self->_rightPupilLock);
  if (!self->_rightPupil)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:", -[VNFaceLandmarks2D constellation](self, "constellation"));
    -[VNFaceLandmarks2D _createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:](self, "_createFaceLandmarks2DRegionOfPoints:fromPointIndexes:andPointCount:", 2, v4->var24, v4->var23);
    v5 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
    rightPupil = self->_rightPupil;
    self->_rightPupil = v5;

  }
  os_unfair_lock_unlock(p_rightPupilLock);
  return self->_rightPupil;
}

- (BOOL)isEqual:(id)a3
{
  VNFaceLandmarks2D *v4;
  VNFaceLandmarks2D *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = (VNFaceLandmarks2D *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VNFaceLandmarks2D;
    if (-[VNFaceLandmarks isEqual:](&v11, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = -[VNFaceLandmarks2D constellation](self, "constellation");
      if (v6 == -[VNFaceLandmarks2D constellation](v5, "constellation"))
      {
        -[VNFaceLandmarks2D precisionEstimatesPerPoint](self, "precisionEstimatesPerPoint");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNFaceLandmarks2D precisionEstimatesPerPoint](v5, "precisionEstimatesPerPoint");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)constellation
{
  return self->_constellation;
}

- (NSArray)precisionEstimatesPerPoint
{
  return (NSArray *)objc_getProperty(self, a2, 304, 1);
}

- (void)setPrecisionEstimatesPerPoint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precisionEstimatesPerPoint, 0);
  objc_storeStrong((id *)&self->_rightPupil, 0);
  objc_storeStrong((id *)&self->_leftPupil, 0);
  objc_storeStrong((id *)&self->_innerLips, 0);
  objc_storeStrong((id *)&self->_outerLips, 0);
  objc_storeStrong((id *)&self->_medianLine, 0);
  objc_storeStrong((id *)&self->_noseCrest, 0);
  objc_storeStrong((id *)&self->_nose, 0);
  objc_storeStrong((id *)&self->_rightEyebrow, 0);
  objc_storeStrong((id *)&self->_leftEyebrow, 0);
  objc_storeStrong((id *)&self->_rightEye, 0);
  objc_storeStrong((id *)&self->_leftEye, 0);
  objc_storeStrong((id *)&self->_faceContour, 0);
  objc_storeStrong((id *)&self->_allPoints, 0);
}

+ (unint64_t)landmarkPointSizeInBytes
{
  return 8;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNDetectFaceLandmarksRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_createNSArrayFrom:(id)a3 withPointIndices:(const int *)a4 andPointCount:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v7 = a3;
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
    if (a5)
    {
      v9 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", a4[v9]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v10, v9);

        ++v9;
      }
      while (a5 != v9);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
