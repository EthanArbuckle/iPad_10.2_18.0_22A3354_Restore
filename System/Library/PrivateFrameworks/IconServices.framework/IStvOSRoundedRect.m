@implementation IStvOSRoundedRect

- (IStvOSRoundedRect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IStvOSRoundedRect;
  return (IStvOSRoundedRect *)-[ISShapeCompositorResource _init](&v3, sel__init);
}

- (double)_cornerRadiusForSize:(CGSize)a3
{
  if (a3.width >= a3.height)
    a3.width = a3.height;
  return a3.width * 0.2;
}

@end
