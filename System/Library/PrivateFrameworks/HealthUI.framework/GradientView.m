@implementation GradientView

+ (Class)layerClass
{
  sub_1D7AC8694();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC8HealthUI12GradientView *v5;

  v4 = a3;
  v5 = self;
  sub_1D7AC8C24();

}

- (_TtC8HealthUI12GradientView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8HealthUI12GradientView____lazy_storage___gradientLayer) = (Class)1;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8HealthUI12GradientView_gradientColors);
  v9 = (objc_class *)type metadata accessor for GradientView();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[GradientView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8HealthUI12GradientView)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8HealthUI12GradientView____lazy_storage___gradientLayer) = (Class)1;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8HealthUI12GradientView_gradientColors);
  v6 = (objc_class *)type metadata accessor for GradientView();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[GradientView initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1D7AB1270(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC8HealthUI12GradientView____lazy_storage___gradientLayer));
  sub_1D7AC8DC4(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8HealthUI12GradientView_gradientColors), *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC8HealthUI12GradientView_gradientColors));
}

@end
