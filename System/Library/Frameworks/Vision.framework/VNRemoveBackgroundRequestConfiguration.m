@implementation VNRemoveBackgroundRequestConfiguration

- (VNRemoveBackgroundRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNRemoveBackgroundRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNRemoveBackgroundRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_performInPlace = 0;
    result->_cropResult = 0;
    result->_returnMask = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNRemoveBackgroundRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPerformInPlace:", self->_performInPlace);
  objc_msgSend(v4, "setCropResult:", self->_cropResult);
  objc_msgSend(v4, "setReturnMask:", self->_returnMask);
  return v4;
}

- (BOOL)performInPlace
{
  return self->_performInPlace;
}

- (void)setPerformInPlace:(BOOL)a3
{
  self->_performInPlace = a3;
}

- (BOOL)cropResult
{
  return self->_cropResult;
}

- (void)setCropResult:(BOOL)a3
{
  self->_cropResult = a3;
}

- (BOOL)returnMask
{
  return self->_returnMask;
}

- (void)setReturnMask:(BOOL)a3
{
  self->_returnMask = a3;
}

@end
