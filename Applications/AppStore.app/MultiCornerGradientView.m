@implementation MultiCornerGradientView

- (_TtC8AppStore23MultiCornerGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23MultiCornerGradientView *)sub_1000DB37C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23MultiCornerGradientView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000DC868();
}

- (void)layoutSubviews
{
  _TtC8AppStore23MultiCornerGradientView *v2;

  v2 = self;
  sub_1000DB614();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore23MultiCornerGradientView_colors));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23MultiCornerGradientView_baseGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23MultiCornerGradientView_secondaryGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23MultiCornerGradientView_secondaryGradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23MultiCornerGradientView_bottomRightOverlayView));
}

@end
