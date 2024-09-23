@implementation VNCreateFaceprintRequestConfiguration

- (VNCreateFaceprintRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNCreateFaceprintRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNCreateFaceprintRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
    result->_forceFaceprintCreation = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNCreateFaceprintRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setForceFaceprintCreation:", self->_forceFaceprintCreation);
  return v5;
}

- (void)setForceFaceprintCreation:(BOOL)a3
{
  self->_forceFaceprintCreation = a3;
}

- (BOOL)forceFaceprintCreation
{
  return self->_forceFaceprintCreation;
}

@end
