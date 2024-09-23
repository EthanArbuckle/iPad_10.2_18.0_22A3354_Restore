@implementation VNGenerateFaceSegmentsRequestConfiguration

- (VNGenerateFaceSegmentsRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNGenerateFaceSegmentsRequestConfiguration *v3;
  float v4;
  VNGenerateFaceSegmentsRequestConfiguration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNGenerateFaceSegmentsRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v7, sel_initWithRequestClass_, a3);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "defaultFaceBoundingBoxExpansionRatio");
    v3->_faceBoundingBoxExpansionRatio = v4;
    v5 = v3;
  }

  return v3;
}

+ (float)defaultFaceBoundingBoxExpansionRatio
{
  return 1.2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNGenerateFaceSegmentsRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v6 = v4;
  if (v4)
  {
    *(float *)&v5 = self->_faceBoundingBoxExpansionRatio;
    objc_msgSend(v4, "setFaceBoundingBoxExpansionRatio:", v5);
  }
  return v6;
}

- (void)setFaceBoundingBoxExpansionRatio:(float)a3
{
  void *v5;
  double v6;

  v5 = (void *)objc_opt_class();
  *(float *)&v6 = a3;
  if (objc_msgSend(v5, "expansionRatioWithinValidRange:", v6))
    self->_faceBoundingBoxExpansionRatio = a3;
}

- (float)faceBoundingBoxExpansionRatio
{
  return self->_faceBoundingBoxExpansionRatio;
}

+ (float)beginRangeFaceBoundingBoxExpansionRatio
{
  return 1.0;
}

+ (float)endRangeFaceBoundingBoxExpansionRatio
{
  return 1.5;
}

+ (BOOL)expansionRatioWithinValidRange:(float)a3
{
  void *v4;
  float v5;
  float v7;

  v4 = (void *)objc_opt_class();
  objc_msgSend(v4, "beginRangeFaceBoundingBoxExpansionRatio");
  if (v5 > a3)
    return 0;
  objc_msgSend(v4, "endRangeFaceBoundingBoxExpansionRatio");
  return v7 >= a3;
}

@end
