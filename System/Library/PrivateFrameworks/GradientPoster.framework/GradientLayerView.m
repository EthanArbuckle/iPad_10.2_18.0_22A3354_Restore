@implementation GradientLayerView

+ (Class)layerClass
{
  sub_223134728(0, &qword_2540B2AB0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC14GradientPoster17GradientLayerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC14GradientPoster17GradientLayerView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GradientLayerView();
  v7 = -[GradientLayerView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  -[GradientLayerView setTranslatesAutoresizingMaskIntoConstraints:](v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v7;
}

- (_TtC14GradientPoster17GradientLayerView)initWithCoder:(id)a3
{
  _TtC14GradientPoster17GradientLayerView *result;

  result = (_TtC14GradientPoster17GradientLayerView *)sub_223137294();
  __break(1u);
  return result;
}

@end
