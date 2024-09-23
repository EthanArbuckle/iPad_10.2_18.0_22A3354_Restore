@implementation GKImageCache

- (GKImageCache)initWithName:(id)a3 maxCount:(unint64_t)a4
{
  id v6;
  GKImageCache *v7;
  GKImageCache *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKImageCache;
  v7 = -[GKImageCache init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    -[GKImageCache setName:](v7, "setName:", v6);
    -[GKImageCache setCountLimit:](v8, "setCountLimit:", a4);
    +[GKScreenConfigurationController sharedController](GKScreenConfigurationController, "sharedController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerListener:", v8);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3A160], "didEnterBackground");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v8, sel_applicationDidEnterBackground_, v11, 0);

  }
  return v8;
}

- (void)greatestScreenScaleDidChange:(double)a3
{
  +[GKImageSource clearCache](GKImageSource, "clearCache", a3);
}

- (void)applicationDidEnterBackground:(id)a3
{
  +[GKImageSource clearCache](GKImageSource, "clearCache", a3);
}

@end
