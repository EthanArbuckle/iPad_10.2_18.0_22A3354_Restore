@implementation ASUIAppHeaderView

- (_TtC16AccessorySetupUI17ASUIAppHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001D46C();
}

- (_TtC16AccessorySetupUI17ASUIAppHeaderView)initWithFrame:(CGRect)a3
{
  _TtC16AccessorySetupUI17ASUIAppHeaderView *result;

  result = (_TtC16AccessorySetupUI17ASUIAppHeaderView *)_swift_stdlib_reportUnimplementedInitializer("AccessorySetupUI.ASUIAppHeaderView", 34, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appIcon));
  swift_bridgeObjectRelease(*(_QWORD *)&self->appIcon[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->appIcon[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsage]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsageLabel));
}

@end
