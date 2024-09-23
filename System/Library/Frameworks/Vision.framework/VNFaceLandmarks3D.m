@implementation VNFaceLandmarks3D

- (VNFaceLandmarks3D)initWithOriginatingRequestSpecifier:(id)a3 pointsData:(id)a4 pointCount:(unint64_t)a5 userFacingBBox:(CGRect)a6 alignedBBox:(_Geometry2D_rect2D_)a7 landmarkScore:(float)a8
{
  float height;
  float y;
  float x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  VNFaceLandmarks3D *v24;
  VNFaceLandmarks3D *v25;
  VNFaceLandmarks3D *v26;
  float width;
  objc_super v30;

  width = a7.size.width;
  height = a7.size.height;
  y = a7.origin.y;
  x = a7.origin.x;
  v11 = a6.size.height;
  v12 = a6.size.width;
  v13 = a6.origin.y;
  v14 = a6.origin.x;
  v18 = a3;
  v19 = a4;
  v30.receiver = self;
  v30.super_class = (Class)VNFaceLandmarks3D;
  *(float *)&v20 = x;
  *(float *)&v21 = y;
  *(float *)&v22 = height;
  *(float *)&v23 = width;
  v24 = -[VNFaceLandmarks initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:](&v30, sel_initWithOriginatingRequestSpecifier_pointsData_pointCount_userFacingBBox_alignedBBox_landmarkScore_, v18, v19, a5, v14, v13, v12, v11, v20, v21, v22, v23, LODWORD(a8));
  v25 = v24;
  if (v24)
  {
    -[VNFaceLandmarks3D _initLocks](v24, "_initLocks");
    v26 = v25;
  }

  return v25;
}

- (VNFaceLandmarks3D)initWithCoder:(id)a3
{
  id v4;
  VNFaceLandmarks3D *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNFaceLandmarks3D;
  v5 = -[VNFaceLandmarks initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("VNFaceLandmarks3D"));
    if ((_DWORD)v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive VNFaceLandmarks3D object due to coding version mismatch: Currently supported: %u; encoded: %u"),
                     0,
                     v6);
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v8);

      v5 = 0;
    }
    else
    {
      -[VNFaceLandmarks3D _initLocks](v5, "_initLocks");
    }
  }

  return v5;
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
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNFaceLandmarks3D;
  -[VNFaceLandmarks encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", 0, CFSTR("VNFaceLandmarks3D"));

}

- (void)_createPointArray:(const int *)a3 count:(unint64_t)a4
{
  const int *v5;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *i;
  int v12;
  unint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", a3 != 0, CFSTR("pointIndices must not be nullptr"));
  v7 = malloc_type_calloc(0x10uLL, a4, 0x6F0307D7uLL);
  -[VNFaceLandmarks pointsData](self, "pointsData");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");

  v10 = -[VNFaceLandmarks pointCount](self, "pointCount");
  if (a4)
  {
    for (i = v7; ; i += 2)
    {
      v13 = *v5++;
      v12 = v13;
      if (v10 <= v13)
        break;
      v14 = (_DWORD *)(v9 + 12 * v12);
      v15 = i[1];
      LODWORD(v16) = *v14;
      *(_DWORD *)i = *v14;
      HIDWORD(v16) = v14[1];
      *((_DWORD *)i + 2) = v15;
      *i = v16;
      *((_DWORD *)i + 2) = v14[2];
      *i = v16;
      if (!--a4)
        return v7;
    }
    free(v7);
    return 0;
  }
  return v7;
}

- (VNFaceLandmarkRegion3D)allPoints
{
  os_unfair_lock_s *p_allPointsLock;
  unint64_t v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  VNFaceLandmarkRegion3D *v9;
  void *v10;
  VNFaceLandmarkRegion3D *v11;
  VNFaceLandmarkRegion3D *allPoints;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  p_allPointsLock = &self->_allPointsLock;
  os_unfair_lock_lock(&self->_allPointsLock);
  if (self->_allPoints)
    goto LABEL_2;
  v5 = -[VNFaceLandmarks pointCount](self, "pointCount");
  v6 = +[VNFaceGeometryEstimator allLandmarksPointsIndexes](VNFaceGeometryEstimator, "allLandmarksPointsIndexes");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v13, (const void *)*v6, v6[1], (v6[1] - *v6) >> 2);
  v7 = v13;
  if (v5 == (v14 - (uint64_t)v13) >> 2)
  {
    v8 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", v13, v5);
    v9 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v11 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v9, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v10, v8, v5);
    allPoints = self->_allPoints;
    self->_allPoints = v11;

    if (v7)
      operator delete(v7);
LABEL_2:
    os_unfair_lock_unlock(p_allPointsLock);
    return self->_allPoints;
  }
  if (v13)
    operator delete(v13);
  os_unfair_lock_unlock(p_allPointsLock);
  return (VNFaceLandmarkRegion3D *)0;
}

- (VNFaceLandmarkRegion3D)faceContour
{
  os_unfair_lock_s *p_faceContourLock;
  void *v4;
  VNFaceLandmarkRegion3D *v5;
  void *v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *faceContour;

  p_faceContourLock = &self->_faceContourLock;
  os_unfair_lock_lock(&self->_faceContourLock);
  if (!self->_faceContour)
  {
    v4 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", &unk_1A15F9980, 11);
    v5 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 11);
    faceContour = self->_faceContour;
    self->_faceContour = v7;

  }
  os_unfair_lock_unlock(p_faceContourLock);
  return self->_faceContour;
}

- (VNFaceLandmarkRegion3D)leftEye
{
  os_unfair_lock_s *p_leftEyeLock;
  void *v4;
  VNFaceLandmarkRegion3D *v5;
  void *v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *leftEye;

  p_leftEyeLock = &self->_leftEyeLock;
  os_unfair_lock_lock(&self->_leftEyeLock);
  if (!self->_leftEye)
  {
    v4 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", &unk_1A15F9BC0, 8);
    v5 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 8);
    leftEye = self->_leftEye;
    self->_leftEye = v7;

  }
  os_unfair_lock_unlock(p_leftEyeLock);
  return self->_leftEye;
}

- (VNFaceLandmarkRegion3D)rightEye
{
  os_unfair_lock_s *p_rightEyeLock;
  void *v4;
  VNFaceLandmarkRegion3D *v5;
  void *v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *rightEye;

  p_rightEyeLock = &self->_rightEyeLock;
  os_unfair_lock_lock(&self->_rightEyeLock);
  if (!self->_rightEye)
  {
    v4 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", &unk_1A15F9D40, 8);
    v5 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 8);
    rightEye = self->_rightEye;
    self->_rightEye = v7;

  }
  os_unfair_lock_unlock(p_rightEyeLock);
  return self->_rightEye;
}

- (VNFaceLandmarkRegion3D)leftEyebrow
{
  os_unfair_lock_s *p_leftEyebrowLock;
  void *v4;
  VNFaceLandmarkRegion3D *v5;
  void *v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *leftEyebrow;

  p_leftEyebrowLock = &self->_leftEyebrowLock;
  os_unfair_lock_lock(&self->_leftEyebrowLock);
  if (!self->_leftEyebrow)
  {
    v4 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", &unk_1A15F9B60, 4);
    v5 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 4);
    leftEyebrow = self->_leftEyebrow;
    self->_leftEyebrow = v7;

  }
  os_unfair_lock_unlock(p_leftEyebrowLock);
  return self->_leftEyebrow;
}

- (VNFaceLandmarkRegion3D)rightEyebrow
{
  os_unfair_lock_s *p_rightEyebrowLock;
  void *v4;
  VNFaceLandmarkRegion3D *v5;
  void *v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *rightEyebrow;

  p_rightEyebrowLock = &self->_rightEyebrowLock;
  os_unfair_lock_lock(&self->_rightEyebrowLock);
  if (!self->_rightEyebrow)
  {
    v4 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", &unk_1A15F9CE0, 4);
    v5 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 4);
    rightEyebrow = self->_rightEyebrow;
    self->_rightEyebrow = v7;

  }
  os_unfair_lock_unlock(p_rightEyebrowLock);
  return self->_rightEyebrow;
}

- (VNFaceLandmarkRegion3D)nose
{
  os_unfair_lock_s *p_noseLock;
  void *v4;
  VNFaceLandmarkRegion3D *v5;
  void *v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *nose;

  p_noseLock = &self->_noseLock;
  os_unfair_lock_lock(&self->_noseLock);
  if (!self->_nose)
  {
    v4 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", &unk_1A15F9AA0, 9);
    v5 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 9);
    nose = self->_nose;
    self->_nose = v7;

  }
  os_unfair_lock_unlock(p_noseLock);
  return self->_nose;
}

- (VNFaceLandmarkRegion3D)noseCrest
{
  os_unfair_lock_s *p_noseCrestLock;
  void *v4;
  VNFaceLandmarkRegion3D *v5;
  void *v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *noseCrest;

  p_noseCrestLock = &self->_noseCrestLock;
  os_unfair_lock_lock(&self->_noseCrestLock);
  if (!self->_noseCrest)
  {
    v4 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", &unk_1A15F9A40, 3);
    v5 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 3);
    noseCrest = self->_noseCrest;
    self->_noseCrest = v7;

  }
  os_unfair_lock_unlock(p_noseCrestLock);
  return self->_noseCrest;
}

- (VNFaceLandmarkRegion3D)medianLine
{
  os_unfair_lock_s *p_medianLineLock;
  void *v4;
  VNFaceLandmarkRegion3D *v5;
  void *v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *medianLine;

  p_medianLineLock = &self->_medianLineLock;
  os_unfair_lock_lock(&self->_medianLineLock);
  if (!self->_medianLine)
  {
    v4 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", &unk_1A15F9F20, 9);
    v5 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 9);
    medianLine = self->_medianLine;
    self->_medianLine = v7;

  }
  os_unfair_lock_unlock(p_medianLineLock);
  return self->_medianLine;
}

- (VNFaceLandmarkRegion3D)outerLips
{
  os_unfair_lock_s *p_outerLipsLock;
  void *v4;
  VNFaceLandmarkRegion3D *v5;
  void *v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *outerLips;

  p_outerLipsLock = &self->_outerLipsLock;
  os_unfair_lock_lock(&self->_outerLipsLock);
  if (!self->_outerLips)
  {
    v4 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", &unk_1A15F9E60, 10);
    v5 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 10);
    outerLips = self->_outerLips;
    self->_outerLips = v7;

  }
  os_unfair_lock_unlock(p_outerLipsLock);
  return self->_outerLips;
}

- (VNFaceLandmarkRegion3D)innerLips
{
  os_unfair_lock_s *p_innerLipsLock;
  void *v4;
  VNFaceLandmarkRegion3D *v5;
  void *v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *innerLips;

  p_innerLipsLock = &self->_innerLipsLock;
  os_unfair_lock_lock(&self->_innerLipsLock);
  if (!self->_innerLips)
  {
    v4 = -[VNFaceLandmarks3D _createPointArray:count:](self, "_createPointArray:count:", &unk_1A15F9EC0, 6);
    v5 = [VNFaceLandmarkRegion3D alloc];
    -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 6);
    innerLips = self->_innerLips;
    self->_innerLips = v7;

  }
  os_unfair_lock_unlock(p_innerLipsLock);
  return self->_innerLips;
}

- (void).cxx_destruct
{
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
  return 12;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNDetectFace3DLandmarksRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
