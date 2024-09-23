@implementation CIBurstFaceStat

- (CIBurstFaceStat)initWithFaceStat:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  float v13;
  float v14;
  float v15;
  float v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  float v26;
  float v27;
  float v28;

  self->leftEyeOpen = objc_msgSend(a3, "leftEyeOpen");
  self->rightEyeOpen = objc_msgSend(a3, "rightEyeOpen");
  self->smiling = objc_msgSend(a3, "smiling");
  self->foundByFaceCore = objc_msgSend(a3, "foundByFaceCore");
  objc_msgSend(a3, "faceRect");
  self->faceRect.origin.x = v5;
  self->faceRect.origin.y = v6;
  self->faceRect.size.width = v7;
  self->faceRect.size.height = v8;
  objc_msgSend(a3, "normalizedFaceRect");
  self->normalizedFaceRect.origin.x = v9;
  self->normalizedFaceRect.origin.y = v10;
  self->normalizedFaceRect.size.width = v11;
  self->normalizedFaceRect.size.height = v12;
  objc_msgSend(a3, "normalizedSigma");
  self->normalizedSigma = v13;
  self->faceId = objc_msgSend(a3, "faceId");
  self->hwFaceId = objc_msgSend(a3, "hwFaceId");
  self->framesSinceLast = objc_msgSend(a3, "framesSinceLast");
  objc_msgSend(a3, "focusScore");
  self->focusScore = v14;
  objc_msgSend(a3, "normalizedFocusScore");
  self->normalizedFocusScore = v15;
  objc_msgSend(a3, "faceScore");
  self->faceScore = v16;
  self->hasLeftEye = objc_msgSend(a3, "hasLeftEye");
  self->hasRightEye = objc_msgSend(a3, "hasRightEye");
  objc_msgSend(a3, "leftEyeRect");
  self->leftEyeRect.origin.x = v17;
  self->leftEyeRect.origin.y = v18;
  self->leftEyeRect.size.width = v19;
  self->leftEyeRect.size.height = v20;
  objc_msgSend(a3, "rightEyeRect");
  self->rightEyeRect.origin.x = v21;
  self->rightEyeRect.origin.y = v22;
  self->rightEyeRect.size.width = v23;
  self->rightEyeRect.size.height = v24;
  objc_msgSend(a3, "timestamp");
  self->timestamp = v25;
  objc_msgSend(a3, "leftEyeBlinkScore");
  self->leftEyeBlinkScore = v26;
  objc_msgSend(a3, "rightEyeBlinkScore");
  self->rightEyeBlinkScore = v27;
  objc_msgSend(a3, "smileScore");
  self->smileScore = v28;
  self->smallFace = 0;
  self->FCRLeftEyeFeaturesOffset = objc_msgSend(a3, "FCRLeftEyeFeaturesOffset");
  self->FCRRightEyeFeaturesOffset = objc_msgSend(a3, "FCRRightEyeFeaturesOffset");
  self->FCRSmileFeaturesOffset = objc_msgSend(a3, "FCRSmileFeaturesOffset");
  self->FCRBlinkFeaturesSize = objc_msgSend(a3, "FCRBlinkFeaturesSize");
  self->FCRSmileFeaturesSize = objc_msgSend(a3, "FCRSmileFeaturesSize");
  self->FCRSmileAndBlinkFeatures = 0;
  -[CIBurstFaceStat setIsSyncedWithImage:](self, "setIsSyncedWithImage:", 1);
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CIBurstFaceStat initWithFaceStat:](+[CIBurstFaceStat allocWithZone:](CIBurstFaceStat, "allocWithZone:", a3), "initWithFaceStat:", self);
}

- (BOOL)leftEyeOpen
{
  return self->leftEyeOpen;
}

- (void)setLeftEyeOpen:(BOOL)a3
{
  self->leftEyeOpen = a3;
}

- (BOOL)rightEyeOpen
{
  return self->rightEyeOpen;
}

- (void)setRightEyeOpen:(BOOL)a3
{
  self->rightEyeOpen = a3;
}

- (BOOL)smiling
{
  return self->smiling;
}

- (void)setSmiling:(BOOL)a3
{
  self->smiling = a3;
}

- (BOOL)foundByFaceCore
{
  return self->foundByFaceCore;
}

- (void)setFoundByFaceCore:(BOOL)a3
{
  self->foundByFaceCore = a3;
}

- (CGRect)faceRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->faceRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFaceRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->faceRect, &v3, 32, 1, 0);
}

- (CGRect)normalizedFaceRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->normalizedFaceRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setNormalizedFaceRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->normalizedFaceRect, &v3, 32, 1, 0);
}

- (float)normalizedSigma
{
  return self->normalizedSigma;
}

- (void)setNormalizedSigma:(float)a3
{
  self->normalizedSigma = a3;
}

- (int)faceId
{
  return self->faceId;
}

- (void)setFaceId:(int)a3
{
  self->faceId = a3;
}

- (int)hwFaceId
{
  return self->hwFaceId;
}

- (void)setHwFaceId:(int)a3
{
  self->hwFaceId = a3;
}

- (int)framesSinceLast
{
  return self->framesSinceLast;
}

- (void)setFramesSinceLast:(int)a3
{
  self->framesSinceLast = a3;
}

- (float)focusScore
{
  return self->focusScore;
}

- (void)setFocusScore:(float)a3
{
  self->focusScore = a3;
}

- (float)normalizedFocusScore
{
  return self->normalizedFocusScore;
}

- (void)setNormalizedFocusScore:(float)a3
{
  self->normalizedFocusScore = a3;
}

- (float)faceScore
{
  return self->faceScore;
}

- (void)setFaceScore:(float)a3
{
  self->faceScore = a3;
}

- (BOOL)hasLeftEye
{
  return self->hasLeftEye;
}

- (void)setHasLeftEye:(BOOL)a3
{
  self->hasLeftEye = a3;
}

- (BOOL)hasRightEye
{
  return self->hasRightEye;
}

- (void)setHasRightEye:(BOOL)a3
{
  self->hasRightEye = a3;
}

- (CGRect)leftEyeRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->leftEyeRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setLeftEyeRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->leftEyeRect, &v3, 32, 1, 0);
}

- (CGRect)rightEyeRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->rightEyeRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRightEyeRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->rightEyeRect, &v3, 32, 1, 0);
}

- (float)leftEyeBlinkScore
{
  return self->leftEyeBlinkScore;
}

- (void)setLeftEyeBlinkScore:(float)a3
{
  self->leftEyeBlinkScore = a3;
}

- (float)rightEyeBlinkScore
{
  return self->rightEyeBlinkScore;
}

- (void)setRightEyeBlinkScore:(float)a3
{
  self->rightEyeBlinkScore = a3;
}

- (float)smileScore
{
  return self->smileScore;
}

- (void)setSmileScore:(float)a3
{
  self->smileScore = a3;
}

- (int)FCRLeftEyeFeaturesOffset
{
  return self->FCRLeftEyeFeaturesOffset;
}

- (void)setFCRLeftEyeFeaturesOffset:(int)a3
{
  self->FCRLeftEyeFeaturesOffset = a3;
}

- (int)FCRRightEyeFeaturesOffset
{
  return self->FCRRightEyeFeaturesOffset;
}

- (void)setFCRRightEyeFeaturesOffset:(int)a3
{
  self->FCRRightEyeFeaturesOffset = a3;
}

- (int)FCRSmileFeaturesOffset
{
  return self->FCRSmileFeaturesOffset;
}

- (void)setFCRSmileFeaturesOffset:(int)a3
{
  self->FCRSmileFeaturesOffset = a3;
}

- (int)FCRBlinkFeaturesSize
{
  return self->FCRBlinkFeaturesSize;
}

- (void)setFCRBlinkFeaturesSize:(int)a3
{
  self->FCRBlinkFeaturesSize = a3;
}

- (int)FCRSmileFeaturesSize
{
  return self->FCRSmileFeaturesSize;
}

- (void)setFCRSmileFeaturesSize:(int)a3
{
  self->FCRSmileFeaturesSize = a3;
}

- (NSMutableArray)FCRSmileAndBlinkFeatures
{
  return self->FCRSmileAndBlinkFeatures;
}

- (void)setFCRSmileAndBlinkFeatures:(id)a3
{
  self->FCRSmileAndBlinkFeatures = (NSMutableArray *)a3;
}

- (BOOL)hasRollAngle
{
  return self->hasRollAngle;
}

- (void)setHasRollAngle:(BOOL)a3
{
  self->hasRollAngle = a3;
}

- (BOOL)hasYawAngle
{
  return self->hasYawAngle;
}

- (void)setHasYawAngle:(BOOL)a3
{
  self->hasYawAngle = a3;
}

- (float)rollAngle
{
  return self->rollAngle;
}

- (void)setRollAngle:(float)a3
{
  self->rollAngle = a3;
}

- (float)yawAngle
{
  return self->yawAngle;
}

- (void)setYawAngle:(float)a3
{
  self->yawAngle = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (BOOL)smallFace
{
  return self->smallFace;
}

- (void)setSmallFace:(BOOL)a3
{
  self->smallFace = a3;
}

- (CGRect)hwFaceRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_hwFaceRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setHwFaceRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_hwFaceRect, &v3, 32, 1, 0);
}

- (BOOL)isSyncedWithImage
{
  return self->_isSyncedWithImage;
}

- (void)setIsSyncedWithImage:(BOOL)a3
{
  self->_isSyncedWithImage = a3;
}

@end
