@implementation BackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CABackdropLayer, a2);
}

@end
