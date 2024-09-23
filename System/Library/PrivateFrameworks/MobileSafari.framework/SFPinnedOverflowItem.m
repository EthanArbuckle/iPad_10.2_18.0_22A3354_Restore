@implementation SFPinnedOverflowItem

- (SFPinnedOverflowItem)init
{
  SFPinnedOverflowItem *v2;
  SFPinnedOverflowItem *v3;
  SFPinnedOverflowItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFPinnedOverflowItem;
  v2 = -[SFPinnedOverflowItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SFUnifiedBarItem setPinned:](v2, "setPinned:", 1);
    -[SFUnifiedBarItem setViewReuseIdentifier:](v3, "setViewReuseIdentifier:", CFSTR("SFPinnedOverflowItem"));
    v4 = v3;
  }

  return v3;
}

@end
