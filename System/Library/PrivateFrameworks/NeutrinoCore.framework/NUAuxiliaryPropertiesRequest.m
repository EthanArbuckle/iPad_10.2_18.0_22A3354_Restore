@implementation NUAuxiliaryPropertiesRequest

- (NUAuxiliaryPropertiesRequest)initWithComposition:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUAuxiliaryPropertiesRequest;
  return -[NURenderRequest initWithComposition:](&v4, sel_initWithComposition_, a3);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([NUAuxiliaryPropertiesRenderJob alloc], "initWithRequest:", self);
}

@end
