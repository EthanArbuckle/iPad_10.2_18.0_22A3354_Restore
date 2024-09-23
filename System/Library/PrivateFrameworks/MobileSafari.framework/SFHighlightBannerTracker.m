@implementation SFHighlightBannerTracker

- (id)categoryName
{
  return CFSTR("HighlightBannerTracker");
}

void __41__SFHighlightBannerTracker_sharedTracker__block_invoke()
{
  SFHighlightBannerTracker *v0;
  void *v1;

  v0 = objc_alloc_init(SFHighlightBannerTracker);
  v1 = (void *)sharedTracker_sharedTracker_0;
  sharedTracker_sharedTracker_0 = (uint64_t)v0;

}

+ (id)sharedTracker
{
  if (sharedTracker_once_0 != -1)
    dispatch_once(&sharedTracker_once_0, &__block_literal_global_50);
  return (id)sharedTracker_sharedTracker_0;
}

- (void)isBannerBlockedForHighlight:(id)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFHighlightBannerTracker;
  -[WBSBannerTracker isBannerBlockedForIdentifier:completion:](&v4, sel_isBannerBlockedForIdentifier_completion_, a3, a4);
}

- (void)blockBannerForHighlight:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFHighlightBannerTracker;
  -[WBSBannerTracker blockBannerForIdentifier:](&v3, sel_blockBannerForIdentifier_, a3);
}

- (void)unblockBannerForHighlight:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFHighlightBannerTracker;
  -[WBSBannerTracker unblockBannerForIdentifier:](&v3, sel_unblockBannerForIdentifier_, a3);
}

@end
