@implementation NUAuxiliaryImageRenderRequest

- (NUAuxiliaryImageRenderRequest)initWithComposition:(id)a3
{
  NUAuxiliaryImageRenderRequest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUAuxiliaryImageRenderRequest;
  result = -[NURenderRequest initWithComposition:](&v4, sel_initWithComposition_, a3);
  result->_auxiliaryImageType = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUAuxiliaryImageRenderRequest;
  result = -[NURenderRequest copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 20) = self->_auxiliaryImageType;
  *((_BYTE *)result + 152) = self->_skipRenderIfNotRequired;
  return result;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([NUAuxiliaryImageRenderJob alloc], "initWithRequest:", self);
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (void)setAuxiliaryImageType:(int64_t)a3
{
  self->_auxiliaryImageType = a3;
}

- (BOOL)skipRenderIfNotRequired
{
  return self->_skipRenderIfNotRequired;
}

- (void)setSkipRenderIfNotRequired:(BOOL)a3
{
  self->_skipRenderIfNotRequired = a3;
}

@end
