@implementation BWFaceSegmentsWithLandmarksInferenceConfiguration

- (BOOL)includesInvalidContent
{
  return self->_skipFoodAndDrinkDetection;
}

- (BOOL)skipSkinToneClassification
{
  return self->_skipFaceLandmarkDetection;
}

- (BOOL)skipFaceLandmarkDetection
{
  return *((_BYTE *)&self->super._landmarksInferenceVersion + 7);
}

- (BOOL)detectFacesInFullSizeInput
{
  return *((_BYTE *)&self->super._landmarksInferenceVersion + 6);
}

- (BOOL)skipFoodAndDrinkDetection
{
  return self->_detectFacesInFullSizeInput;
}

- (void)setSkipFoodAndDrinkDetection:(BOOL)a3
{
  self->_detectFacesInFullSizeInput = a3;
}

- (void)setSkipFaceLandmarkDetection:(BOOL)a3
{
  *((_BYTE *)&self->super._landmarksInferenceVersion + 7) = a3;
}

- (void)setIncludesInvalidContent:(BOOL)a3
{
  self->_skipFoodAndDrinkDetection = a3;
}

- (void)setDetectFacesInFullSizeInput:(BOOL)a3
{
  *((_BYTE *)&self->super._landmarksInferenceVersion + 6) = a3;
}

- (BWFaceSegmentsWithLandmarksInferenceConfiguration)initWithInferenceType:(int)a3
{
  BWFaceSegmentsWithLandmarksInferenceConfiguration *v3;
  BWFaceSegmentsWithLandmarksInferenceConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWFaceSegmentsWithLandmarksInferenceConfiguration;
  v3 = -[BWLandmarksInferenceConfiguration initWithInferenceType:](&v6, sel_initWithInferenceType_, *(_QWORD *)&a3);
  v4 = v3;
  if (v3)
  {
    v3->_detectFacesInFullSizeInput = 1;
    v3->_skipFoodAndDrinkDetection = 1;
    -[BWLandmarksInferenceConfiguration setDetectsBlinking:](v3, "setDetectsBlinking:", 0);
  }
  return v4;
}

+ (id)configuration
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInferenceType:", 802);
}

- (void)setSkipSkinToneClassification:(BOOL)a3
{
  self->_skipFaceLandmarkDetection = a3;
}

@end
