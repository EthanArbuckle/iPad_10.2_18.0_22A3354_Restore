@implementation ImageSaverAndFileConfigRegistrator

- (ImageSaverAndFileConfigRegistrator)init
{
  ImageSaverAndFileConfigRegistrator *v2;
  ImageSaverAndFileConfigRegistrator *v3;
  ImageSaverAndFileConfigRegistrator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ImageSaverAndFileConfigRegistrator;
  v2 = -[ImageSaverRegistrator init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    sub_1B568E5F0(v2);
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  if (self)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B568E060(v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)ImageSaverAndFileConfigRegistrator;
  -[ImageSaverRegistrator dealloc](&v5, sel_dealloc);
}

@end
