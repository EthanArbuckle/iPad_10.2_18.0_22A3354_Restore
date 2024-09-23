@implementation LabelAndImageView

- (_TtC18HealthExperienceUI17LabelAndImageView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI17LabelAndImageView *)LabelAndImageView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI17LabelAndImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9635C10();
}

- (void)layoutSubviews
{
  _TtC18HealthExperienceUI17LabelAndImageView *v2;

  v2 = self;
  sub_1A9634FE4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC18HealthExperienceUI17LabelAndImageView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1A963527C(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSString)description
{
  _TtC18HealthExperienceUI17LabelAndImageView *v2;
  void *v3;

  v2 = self;
  sub_1A9635420();

  v3 = (void *)sub_1A9A9580C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17LabelAndImageView_font));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17LabelAndImageView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17LabelAndImageView_imageView));
}

@end
