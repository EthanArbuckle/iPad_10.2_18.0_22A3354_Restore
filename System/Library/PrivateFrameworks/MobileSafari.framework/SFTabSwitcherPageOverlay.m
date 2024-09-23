@implementation SFTabSwitcherPageOverlay

+ (SFTabSwitcherPageOverlay)emptyPrivateBrowsing
{
  char *v2;
  char *v3;
  objc_super v5;

  v2 = (char *)objc_allocWithZone((Class)SFTabSwitcherPageOverlay);
  v3 = &v2[OBJC_IVAR___SFTabSwitcherPageOverlay_wrapped];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v5.receiver = v2;
  v5.super_class = (Class)SFTabSwitcherPageOverlay;
  return (SFTabSwitcherPageOverlay *)objc_msgSendSuper2(&v5, sel_init);
}

+ (id)lockedPrivateBrowsingOverlayWithUnlockHandler:(id)a3
{
  void *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  objc_super v8;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  v5 = (char *)objc_allocWithZone((Class)SFTabSwitcherPageOverlay);
  v6 = &v5[OBJC_IVAR___SFTabSwitcherPageOverlay_wrapped];
  *(_QWORD *)v6 = sub_18B92A178;
  *((_QWORD *)v6 + 1) = v4;
  v8.receiver = v5;
  v8.super_class = (Class)SFTabSwitcherPageOverlay;
  return objc_msgSendSuper2(&v8, sel_init);
}

- (SFTabSwitcherPageOverlay)init
{
  SFTabSwitcherPageOverlay *result;

  result = (SFTabSwitcherPageOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18B998BCC(*(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPageOverlay_wrapped));
}

@end
