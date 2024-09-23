@implementation VNDetectHumanRectanglesRequestConfiguration

- (VNDetectHumanRectanglesRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectHumanRectanglesRequestConfiguration *v3;
  VNDetectHumanRectanglesRequestConfiguration *v4;
  VNDetectHumanRectanglesRequestConfiguration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectHumanRectanglesRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v7, sel_initWithRequestClass_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_upperBodyOnly = 1;
    v5 = v3;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectHumanRectanglesRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setUpperBodyOnly:", self->_upperBodyOnly);
  return v5;
}

- (BOOL)upperBodyOnly
{
  return self->_upperBodyOnly;
}

- (void)setUpperBodyOnly:(BOOL)a3
{
  self->_upperBodyOnly = a3;
}

@end
