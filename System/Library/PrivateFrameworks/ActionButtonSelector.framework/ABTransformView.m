@implementation ABTransformView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)transformLayer
{
  if (a1)
  {
    objc_msgSend(a1, "layer");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

@end
