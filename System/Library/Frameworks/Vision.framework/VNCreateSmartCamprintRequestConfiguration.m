@implementation VNCreateSmartCamprintRequestConfiguration

- (VNCreateSmartCamprintRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNCreateSmartCamprintRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNCreateSmartCamprintRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
    result->_returnAllResults = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNCreateSmartCamprintRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setReturnAllResults:", self->_returnAllResults);
  return v5;
}

- (BOOL)returnAllResults
{
  return self->_returnAllResults;
}

- (void)setReturnAllResults:(BOOL)a3
{
  self->_returnAllResults = a3;
}

@end
