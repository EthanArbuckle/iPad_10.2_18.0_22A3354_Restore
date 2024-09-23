@implementation CategoryGradientView

+ (Class)layerClass
{
  sub_1A9627620(0, &qword_1ED279750);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18HealthExperienceUI20CategoryGradientView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC18HealthExperienceUI20CategoryGradientView *v7;
  id v8;
  id v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CategoryGradientView();
  v7 = -[CategoryGradientView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v8 = -[CategoryGradientView layer](v7, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setStartPoint_, 0.5, 0.0);

  v9 = -[CategoryGradientView layer](v7, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setEndPoint_, 0.5, 1.0);

  return v7;
}

- (_TtC18HealthExperienceUI20CategoryGradientView)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI20CategoryGradientView *result;

  result = (_TtC18HealthExperienceUI20CategoryGradientView *)sub_1A9A96970();
  __break(1u);
  return result;
}

@end
