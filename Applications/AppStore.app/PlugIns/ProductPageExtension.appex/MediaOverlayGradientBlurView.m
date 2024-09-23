@implementation MediaOverlayGradientBlurView

- (_TtC20ProductPageExtension28MediaOverlayGradientBlurView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003BC0D0();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension28MediaOverlayGradientBlurView *v2;

  v2 = self;
  sub_1003BB3A0();

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  _TtC20ProductPageExtension28MediaOverlayGradientBlurView *v2;

  v2 = self;
  sub_1003BB558();

}

- (_TtC20ProductPageExtension28MediaOverlayGradientBlurView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension28MediaOverlayGradientBlurView *result;

  result = (_TtC20ProductPageExtension28MediaOverlayGradientBlurView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.MediaOverlayGradientBlurView", 49, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_blurGradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_colorGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_secondaryColorGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_todayCardStyleColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MediaOverlayGradientBlurView_secondaryColor));
}

@end
