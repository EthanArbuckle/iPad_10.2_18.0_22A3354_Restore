@implementation VNDetectFaceRectanglesRequestConfiguration

- (VNDetectFaceRectanglesRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectFaceRectanglesRequestConfiguration *v3;
  VNDetectFaceRectanglesRequestConfiguration *v4;
  NSNumber *faceCoreMinFaceSize;
  NSNumber *faceCoreNumberOfDetectionAngles;
  NSNumber *faceCoreInitialAngle;
  float v8;
  VNDetectFaceRectanglesRequestConfiguration *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNDetectFaceRectanglesRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v11, sel_initWithRequestClass_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_faceCoreType = 0;
    faceCoreMinFaceSize = v3->_faceCoreMinFaceSize;
    v3->_faceCoreMinFaceSize = 0;

    faceCoreNumberOfDetectionAngles = v4->_faceCoreNumberOfDetectionAngles;
    v4->_faceCoreNumberOfDetectionAngles = 0;

    faceCoreInitialAngle = v4->_faceCoreInitialAngle;
    v4->_faceCoreInitialAngle = 0;

    v4->_faceCoreEnhanceEyesAndMouthLocalization = 0;
    v4->_faceCoreExtractBlink = 0;
    v4->_faceCoreExtractSmile = 0;
    +[VNShotflowDetectorANODv3 defaultFaceDetectionPrecisionRecallThreshold](VNShotflowDetectorANODv3, "defaultFaceDetectionPrecisionRecallThreshold");
    v4->_precisionRecallThreshold = v8;
    v9 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCoreInitialAngle, 0);
  objc_storeStrong((id *)&self->_faceCoreNumberOfDetectionAngles, 0);
  objc_storeStrong((id *)&self->_faceCoreMinFaceSize, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectFaceRectanglesRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setFaceCoreType:", self->_faceCoreType);
    objc_msgSend(v5, "setFaceCoreMinFaceSize:", self->_faceCoreMinFaceSize);
    objc_msgSend(v5, "setFaceCoreNumberOfDetectionAngles:", self->_faceCoreNumberOfDetectionAngles);
    objc_msgSend(v5, "setFaceCoreInitialAngle:", self->_faceCoreInitialAngle);
    objc_msgSend(v5, "setFaceCoreEnhanceEyesAndMouthLocalization:", self->_faceCoreEnhanceEyesAndMouthLocalization);
    objc_msgSend(v5, "setFaceCoreExtractBlink:", self->_faceCoreExtractBlink);
    objc_msgSend(v5, "setFaceCoreExtractSmile:", self->_faceCoreExtractSmile);
  }
  return v5;
}

- (void)setPrecisionRecallThreshold:(float)a3
{
  unint64_t v5;

  v5 = -[VNRequestConfiguration resolvedRevision](self, "resolvedRevision");
  if ((v5 == 3737841668 || v5 == 3737841666) && a3 >= 0.0 && a3 <= 1.0)
    self->_precisionRecallThreshold = a3;
}

- (float)precisionRecallThreshold
{
  unint64_t v3;
  float result;

  v3 = -[VNRequestConfiguration resolvedRevision](self, "resolvedRevision");
  if (v3 == 3737841668)
    return self->_precisionRecallThreshold;
  result = -1.0;
  if (v3 == 3737841666)
    return self->_precisionRecallThreshold;
  return result;
}

- (unint64_t)faceCoreType
{
  return self->_faceCoreType;
}

- (void)setFaceCoreType:(unint64_t)a3
{
  self->_faceCoreType = a3;
}

- (NSNumber)faceCoreMinFaceSize
{
  return self->_faceCoreMinFaceSize;
}

- (void)setFaceCoreMinFaceSize:(id)a3
{
  objc_storeStrong((id *)&self->_faceCoreMinFaceSize, a3);
}

- (NSNumber)faceCoreNumberOfDetectionAngles
{
  return self->_faceCoreNumberOfDetectionAngles;
}

- (void)setFaceCoreNumberOfDetectionAngles:(id)a3
{
  objc_storeStrong((id *)&self->_faceCoreNumberOfDetectionAngles, a3);
}

- (NSNumber)faceCoreInitialAngle
{
  return self->_faceCoreInitialAngle;
}

- (void)setFaceCoreInitialAngle:(id)a3
{
  objc_storeStrong((id *)&self->_faceCoreInitialAngle, a3);
}

- (BOOL)faceCoreEnhanceEyesAndMouthLocalization
{
  return self->_faceCoreEnhanceEyesAndMouthLocalization;
}

- (void)setFaceCoreEnhanceEyesAndMouthLocalization:(BOOL)a3
{
  self->_faceCoreEnhanceEyesAndMouthLocalization = a3;
}

- (BOOL)faceCoreExtractBlink
{
  return self->_faceCoreExtractBlink;
}

- (void)setFaceCoreExtractBlink:(BOOL)a3
{
  self->_faceCoreExtractBlink = a3;
}

- (BOOL)faceCoreExtractSmile
{
  return self->_faceCoreExtractSmile;
}

- (void)setFaceCoreExtractSmile:(BOOL)a3
{
  self->_faceCoreExtractSmile = a3;
}

@end
