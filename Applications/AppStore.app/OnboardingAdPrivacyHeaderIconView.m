@implementation OnboardingAdPrivacyHeaderIconView

- (_TtC8AppStore33OnboardingAdPrivacyHeaderIconView)init
{
  return (_TtC8AppStore33OnboardingAdPrivacyHeaderIconView *)sub_1001081D8((uint64_t)self, (uint64_t)a2);
}

- (_TtC8AppStore33OnboardingAdPrivacyHeaderIconView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8AppStore33OnboardingAdPrivacyHeaderIconView *result;

  v5 = OBJC_IVAR____TtC8AppStore33OnboardingAdPrivacyHeaderIconView_label;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC8AppStore33OnboardingAdPrivacyHeaderIconView_backgroundView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  result = (_TtC8AppStore33OnboardingAdPrivacyHeaderIconView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/OnboardingAdPrivacyHeaderIconView.swift", 48, 2, 44, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore33OnboardingAdPrivacyHeaderIconView *v2;

  v2 = self;
  sub_100108578();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC8AppStore33OnboardingAdPrivacyHeaderIconView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1001087B0();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC8AppStore33OnboardingAdPrivacyHeaderIconView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore33OnboardingAdPrivacyHeaderIconView *result;

  result = (_TtC8AppStore33OnboardingAdPrivacyHeaderIconView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.OnboardingAdPrivacyHeaderIconView", 42, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33OnboardingAdPrivacyHeaderIconView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33OnboardingAdPrivacyHeaderIconView_backgroundView));
}

@end
