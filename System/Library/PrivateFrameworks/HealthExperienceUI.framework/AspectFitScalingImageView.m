@implementation AspectFitScalingImageView

- (_TtC18HealthExperienceUI25AspectFitScalingImageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC18HealthExperienceUI25AspectFitScalingImageView *v7;
  id v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView____lazy_storage___contentView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AspectFitScalingImageView();
  v7 = -[AspectFitScalingImageView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  v8 = sub_1A99CAC58();
  -[AspectFitScalingImageView addSubview:](v7, sel_addSubview_, v8);

  return v7;
}

- (_TtC18HealthExperienceUI25AspectFitScalingImageView)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI25AspectFitScalingImageView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView____lazy_storage___contentView) = 0;
  v4 = a3;

  result = (_TtC18HealthExperienceUI25AspectFitScalingImageView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AspectFitScalingImageView();
  v2 = v3.receiver;
  -[AspectFitScalingImageView layoutSubviews](&v3, sel_layoutSubviews);
  sub_1A99CAE64();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView____lazy_storage___contentView));
}

@end
