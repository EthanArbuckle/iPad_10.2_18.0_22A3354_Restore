@implementation SFTabSwitcherPagePeekingOverlay

+ (SFTabSwitcherPagePeekingOverlay)lockedPrivateBrowsing
{
  _BYTE *v2;
  objc_super v4;

  v2 = objc_allocWithZone((Class)SFTabSwitcherPagePeekingOverlay);
  v2[OBJC_IVAR___SFTabSwitcherPagePeekingOverlay_wrapped] = 0;
  v4.receiver = v2;
  v4.super_class = (Class)SFTabSwitcherPagePeekingOverlay;
  return (SFTabSwitcherPagePeekingOverlay *)objc_msgSendSuper2(&v4, sel_init);
}

+ (SFTabSwitcherPagePeekingOverlay)privateBrowsing
{
  _BYTE *v2;
  objc_super v4;

  v2 = objc_allocWithZone((Class)SFTabSwitcherPagePeekingOverlay);
  v2[OBJC_IVAR___SFTabSwitcherPagePeekingOverlay_wrapped] = 2;
  v4.receiver = v2;
  v4.super_class = (Class)SFTabSwitcherPagePeekingOverlay;
  return (SFTabSwitcherPagePeekingOverlay *)objc_msgSendSuper2(&v4, sel_init);
}

- (SFTabSwitcherPagePeekingOverlay)init
{
  SFTabSwitcherPagePeekingOverlay *result;

  result = (SFTabSwitcherPagePeekingOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
