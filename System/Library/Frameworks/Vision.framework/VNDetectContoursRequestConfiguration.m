@implementation VNDetectContoursRequestConfiguration

- (VNDetectContoursRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectContoursRequestConfiguration *v3;
  double v4;
  VNDetectContoursRequestConfiguration *v5;
  uint64_t v6;
  NSNumber *contrastPivot;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNDetectContoursRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v9, sel_initWithRequestClass_, a3);
  v5 = v3;
  if (v3)
  {
    v3->_contrastAdjustment = 2.0;
    LODWORD(v4) = 0.5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    contrastPivot = v5->_contrastPivot;
    v5->_contrastPivot = (NSNumber *)v6;

    v5->_detectsDarkOnLight = 1;
    v5->_maximumImageDimension = 512;
    v5->_inHierarchy = 1;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNDetectContoursRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v6 = v4;
  if (v4)
  {
    *(float *)&v5 = self->_contrastAdjustment;
    objc_msgSend(v4, "setContrastAdjustment:", v5);
    objc_msgSend(v6, "setContrastPivot:", self->_contrastPivot);
    objc_msgSend(v6, "setDetectsDarkOnLight:", self->_detectsDarkOnLight);
    objc_msgSend(v6, "setMaximumImageDimension:", self->_maximumImageDimension);
    objc_msgSend(v6, "setInHierarchy:", self->_inHierarchy);
    objc_msgSend(v6, "setForceUseInputCVPixelBufferDirectly:", self->_forceUseInputCVPixelBufferDirectly);
  }
  return v6;
}

- (float)contrastAdjustment
{
  return self->_contrastAdjustment;
}

- (void)setContrastAdjustment:(float)a3
{
  self->_contrastAdjustment = a3;
}

- (NSNumber)contrastPivot
{
  return self->_contrastPivot;
}

- (void)setContrastPivot:(id)a3
{
  objc_storeStrong((id *)&self->_contrastPivot, a3);
}

- (BOOL)detectsDarkOnLight
{
  return self->_detectsDarkOnLight;
}

- (void)setDetectsDarkOnLight:(BOOL)a3
{
  self->_detectsDarkOnLight = a3;
}

- (unint64_t)maximumImageDimension
{
  return self->_maximumImageDimension;
}

- (void)setMaximumImageDimension:(unint64_t)a3
{
  self->_maximumImageDimension = a3;
}

- (BOOL)inHierarchy
{
  return self->_inHierarchy;
}

- (void)setInHierarchy:(BOOL)a3
{
  self->_inHierarchy = a3;
}

- (BOOL)forceUseInputCVPixelBufferDirectly
{
  return self->_forceUseInputCVPixelBufferDirectly;
}

- (void)setForceUseInputCVPixelBufferDirectly:(BOOL)a3
{
  self->_forceUseInputCVPixelBufferDirectly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contrastPivot, 0);
}

@end
