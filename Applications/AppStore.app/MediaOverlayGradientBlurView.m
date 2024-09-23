@implementation MediaOverlayGradientBlurView

- (_TtC8AppStore28MediaOverlayGradientBlurView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100233B60();
}

- (void)layoutSubviews
{
  _TtC8AppStore28MediaOverlayGradientBlurView *v2;

  v2 = self;
  sub_100232BCC();

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  _TtC8AppStore28MediaOverlayGradientBlurView *v2;

  v2 = self;
  sub_100232FE8();

}

- (_TtC8AppStore28MediaOverlayGradientBlurView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore28MediaOverlayGradientBlurView *result;

  result = (_TtC8AppStore28MediaOverlayGradientBlurView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.MediaOverlayGradientBlurView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_blurGradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_colorGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_secondaryColorGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_todayCardStyleColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_secondaryColor));
}

@end
