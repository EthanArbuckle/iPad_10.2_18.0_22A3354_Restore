@implementation LockScreenMastheadView

- (NSString)symbolImageName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_215688A80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC15FocusSettingsUI22LockScreenMastheadView_keyColor));
}

- (_TtC15FocusSettingsUI22LockScreenMastheadView)initWithKeyColor:(id)a3 symbolImageName:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC15FocusSettingsUI22LockScreenMastheadView *result;

  v5 = sub_215688AB0();
  v7 = v6;
  v8 = a3;
  LockScreenMastheadView.init(keyColor:symbolImageName:)(a3, v5, v7);
  return result;
}

- (_TtC15FocusSettingsUI22LockScreenMastheadView)initWithCoder:(id)a3
{
  id v4;
  _TtC15FocusSettingsUI22LockScreenMastheadView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15FocusSettingsUI22LockScreenMastheadView_rootView) = 0;
  v4 = a3;

  result = (_TtC15FocusSettingsUI22LockScreenMastheadView *)sub_215688FC0();
  __break(1u);
  return result;
}

- (_TtC15FocusSettingsUI22LockScreenMastheadView)initWithFrame:(CGRect)a3
{
  _TtC15FocusSettingsUI22LockScreenMastheadView *result;

  result = (_TtC15FocusSettingsUI22LockScreenMastheadView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUI22LockScreenMastheadView_keyColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUI22LockScreenMastheadView_rootView));
}

@end
