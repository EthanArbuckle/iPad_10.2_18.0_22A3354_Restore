@implementation MultiCornerGradientView

- (_TtC22SubscribePageExtension23MultiCornerGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension23MultiCornerGradientView *)sub_100055A48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension23MultiCornerGradientView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100056F34();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension23MultiCornerGradientView *v2;

  v2 = self;
  sub_100055CE0();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_colors));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_baseGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_secondaryGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_secondaryGradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_bottomRightOverlayView));
}

@end
