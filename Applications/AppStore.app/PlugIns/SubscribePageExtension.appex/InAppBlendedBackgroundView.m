@implementation InAppBlendedBackgroundView

- (_TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView *)sub_10021F47C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10021FDA8();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView *v3;

  v3 = self;
  sub_10021F9BC((uint64_t)v3, v2);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView_topLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView_bottomLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView_shadowView));
}

@end
