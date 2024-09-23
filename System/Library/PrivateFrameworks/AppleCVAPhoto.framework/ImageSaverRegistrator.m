@implementation ImageSaverRegistrator

- (ImageSaverRegistrator)init
{
  ImageSaverRegistrator *v2;
  ImageSaverRegistrator *v3;
  ImageSaverRegistrator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ImageSaverRegistrator;
  v2 = -[ImageSaverRegistrator init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  if (self)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)ImageSaverRegistrator;
  -[ImageSaverRegistrator dealloc](&v4, sel_dealloc);
}

@end
