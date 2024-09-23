@implementation BlurredColorEffectBackgroundView

- (_TtC16CommunicationsUI32BlurredColorEffectBackgroundView)initWithCoder:(id)a3
{
  id v4;
  _TtC16CommunicationsUI32BlurredColorEffectBackgroundView *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView____lazy_storage___hasBackgroundImage) = 2;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView_blurEffect) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView____lazy_storage___backgroundBlurView) = 0;
  v4 = a3;

  result = (_TtC16CommunicationsUI32BlurredColorEffectBackgroundView *)sub_2383D045C();
  __break(1u);
  return result;
}

- (_TtC16CommunicationsUI32BlurredColorEffectBackgroundView)initWithFrame:(CGRect)a3
{
  _TtC16CommunicationsUI32BlurredColorEffectBackgroundView *result;

  result = (_TtC16CommunicationsUI32BlurredColorEffectBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView_colorEffect));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI32BlurredColorEffectBackgroundView____lazy_storage___backgroundBlurView));
}

@end
