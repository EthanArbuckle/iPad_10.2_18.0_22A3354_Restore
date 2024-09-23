@implementation ATXSharedDefaultHomeScreenItemUpdater

void __ATXSharedDefaultHomeScreenItemUpdater_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "histogramForLaunchType:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D80]), "initWithSpotlightAppLaunchHistogram:", v3);
  v2 = (void *)ATXSharedDefaultHomeScreenItemUpdater_updater;
  ATXSharedDefaultHomeScreenItemUpdater_updater = v1;

}

@end
