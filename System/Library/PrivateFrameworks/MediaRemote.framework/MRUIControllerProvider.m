@implementation MRUIControllerProvider

+ (id)quickControlsControllerWithDelegate:(id)a3
{
  return objc_alloc_init(MRUIController);
}

+ (id)screenMirroringControllerWithDelegate:(id)a3
{
  void *v3;
  MRUIController *v4;

  if (softLinkSBSIsSystemApertureAvailable())
  {
    +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "supportSessionBasedUI"))
      v4 = objc_alloc_init(MRUIController);
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)nowPlayingActivityController
{
  return objc_alloc_init(MRUIController);
}

+ (id)serverController
{
  return objc_alloc_init(MRUIController);
}

@end
