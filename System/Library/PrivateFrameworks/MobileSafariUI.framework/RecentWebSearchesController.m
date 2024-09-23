@implementation RecentWebSearchesController

+ (id)sharedController
{
  if (+[RecentWebSearchesController sharedController]::onceToken != -1)
    dispatch_once(&+[RecentWebSearchesController sharedController]::onceToken, &__block_literal_global_24);
  return (id)+[RecentWebSearchesController sharedController]::sharedController;
}

void __47__RecentWebSearchesController_sharedController__block_invoke()
{
  RecentWebSearchesController *v0;
  void *v1;

  v0 = objc_alloc_init(RecentWebSearchesController);
  v1 = (void *)+[RecentWebSearchesController sharedController]::sharedController;
  +[RecentWebSearchesController sharedController]::sharedController = (uint64_t)v0;

}

+ (BOOL)_shouldTrackSearches
{
  void *v2;
  char v3;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesDefaultBrowsingModeInAllWindows");

  return v3;
}

@end
