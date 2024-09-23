@implementation APWelcomeControllerWithBraveButtonTrayView

- (_TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView) = 0;
  v5 = OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray;
  v6 = objc_allocWithZone((Class)type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView *)sub_2362FFAC4();
  __break(1u);
  return result;
}

- (_TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView)initWithFrame:(CGRect)a3
{
  return (_TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView *)sub_2362F978C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView *v2;

  v2 = self;
  sub_2362F9898();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray));
}

@end
