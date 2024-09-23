@implementation MultiCornerGradientView

- (_TtC20ProductPageExtension23MultiCornerGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23MultiCornerGradientView *)sub_1005E6FD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23MultiCornerGradientView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005E751C();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension23MultiCornerGradientView *v2;

  v2 = self;
  sub_1005E71AC();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension23MultiCornerGradientView_colors));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23MultiCornerGradientView_baseGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23MultiCornerGradientView_secondaryGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23MultiCornerGradientView_secondaryGradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23MultiCornerGradientView_bottomRightOverlayView));
}

@end
