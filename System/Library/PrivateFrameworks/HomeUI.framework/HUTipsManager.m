@implementation HUTipsManager

- (void)warmUp
{
  id v2;

  +[HUTipsManager_Swift sharedManager](HUTipsManager_Swift, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "warmUp");

}

+ (id)sharedManager
{
  if (qword_1ED580BD8 != -1)
    dispatch_once(&qword_1ED580BD8, &__block_literal_global_191);
  return (id)_MergedGlobals_633;
}

void __30__HUTipsManager_sharedManager__block_invoke()
{
  HUTipsManager *v0;
  void *v1;

  v0 = objc_alloc_init(HUTipsManager);
  v1 = (void *)_MergedGlobals_633;
  _MergedGlobals_633 = (uint64_t)v0;

}

- (void)donateAppLaunchEvent
{
  id v2;

  +[HUTipsManager_Swift sharedManager](HUTipsManager_Swift, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "donateAppLaunchEvent");

}

@end
