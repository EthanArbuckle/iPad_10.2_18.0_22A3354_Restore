@implementation AXQSMenuHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  return (id)sharedInstance__shared_0;
}

void __32__AXQSMenuHelper_sharedInstance__block_invoke()
{
  AXQSMenuHelper *v0;
  void *v1;

  v0 = objc_alloc_init(AXQSMenuHelper);
  v1 = (void *)sharedInstance__shared_0;
  sharedInstance__shared_0 = (uint64_t)v0;

}

- (void)restoreMenu
{
  -[AXQSMenuHelper setShowingLanguageChoices:](self, "setShowingLanguageChoices:", 0);
}

- (BOOL)isShowingLanguageChoices
{
  return self->_showingLanguageChoices;
}

- (void)setShowingLanguageChoices:(BOOL)a3
{
  self->_showingLanguageChoices = a3;
}

@end
