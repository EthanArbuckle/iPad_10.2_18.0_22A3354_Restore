@implementation GKWelcomeBannerVisibility

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_2);
  return (id)shared_sharedInstance;
}

void __35__GKWelcomeBannerVisibility_shared__block_invoke()
{
  GKWelcomeBannerVisibility *v0;
  void *v1;

  v0 = objc_alloc_init(GKWelcomeBannerVisibility);
  v1 = (void *)shared_sharedInstance;
  shared_sharedInstance = (uint64_t)v0;

}

- (BOOL)isShowingRemoteUI
{
  return self->_isShowingRemoteUI;
}

- (void)setIsShowingRemoteUI:(BOOL)a3
{
  self->_isShowingRemoteUI = a3;
}

@end
