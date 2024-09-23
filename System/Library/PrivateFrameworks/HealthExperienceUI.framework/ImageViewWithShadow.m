@implementation ImageViewWithShadow

- (_TtC18HealthExperienceUI19ImageViewWithShadow)init
{
  return (_TtC18HealthExperienceUI19ImageViewWithShadow *)ImageViewWithShadow.init()();
}

- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI19ImageViewWithShadow *result;

  result = (_TtC18HealthExperienceUI19ImageViewWithShadow *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ImageViewWithShadow();
  v2 = v10.receiver;
  -[ImageViewWithShadow layoutSubviews](&v10, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v10.receiver, v10.super_class);
  objc_msgSend(v2, sel_bounds);
  v8 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRect_, v4, v5, v6, v7);
  v9 = objc_msgSend(v8, sel_CGPath);

  objc_msgSend(v3, sel_setShadowPath_, v9);
}

- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithImage:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI19ImageViewWithShadow *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI19ImageViewWithShadow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC18HealthExperienceUI19ImageViewWithShadow *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC18HealthExperienceUI19ImageViewWithShadow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI19ImageViewWithShadow *result;

  result = (_TtC18HealthExperienceUI19ImageViewWithShadow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
