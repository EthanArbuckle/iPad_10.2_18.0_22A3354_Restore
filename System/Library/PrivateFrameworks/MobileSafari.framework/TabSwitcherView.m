@implementation TabSwitcherView

- (_TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView *result;

  v4 = (char *)self
     + OBJC_IVAR____TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView_lastLayoutBounds;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v5 = a3;

  result = (_TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView *v6;

  v5 = a3;
  v6 = self;
  sub_18B9E54B0((uint64_t)a3);

}

- (void)layoutSubviews
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TabSwitcherView();
  v2 = (char *)v8.receiver;
  -[TabSwitcherView layoutSubviews](&v8, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v8.receiver, v8.super_class);
  v3 = &v2[OBJC_IVAR____TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView_lastLayoutBounds];
  *(_QWORD *)v3 = v4;
  *((_QWORD *)v3 + 1) = v5;
  *((_QWORD *)v3 + 2) = v6;
  *((_QWORD *)v3 + 3) = v7;
  v3[32] = 0;

}

- (_TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView)initWithFrame:(CGRect)a3
{
  _TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView *result;

  result = (_TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
}

@end
