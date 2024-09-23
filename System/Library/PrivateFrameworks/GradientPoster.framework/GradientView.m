@implementation GradientView

- (_TtC14GradientPoster12GradientView)initWithFrame:(CGRect)a3
{
  return (_TtC14GradientPoster12GradientView *)GradientView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14GradientPoster12GradientView)initWithCoder:(id)a3
{
  GradientView.init(coder:)(a3);
  return 0;
}

- (void)layoutSubviews
{
  _TtC14GradientPoster12GradientView *v2;

  v2 = self;
  sub_223133F44();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView));
}

@end
