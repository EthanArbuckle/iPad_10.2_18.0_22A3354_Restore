@implementation ProfileGradientView

- (void)updateGradient
{
  _TtC18HealthExperienceUI19ProfileGradientView *v2;

  v2 = self;
  sub_1A996FE98();

}

- (void)didMoveToWindow
{
  _TtC18HealthExperienceUI19ProfileGradientView *v2;

  v2 = self;
  sub_1A9970018();

}

- (void)dealloc
{
  void *v2;
  _TtC18HealthExperienceUI19ProfileGradientView *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI19ProfileGradientView_displayLink);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_invalidate);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for ProfileGradientView();
    -[ProfileGradientView dealloc](&v4, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19ProfileGradientView_displayLink));
}

- (_TtC18HealthExperienceUI19ProfileGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI19ProfileGradientView *)sub_1A9970724(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI19ProfileGradientView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9973074();
}

+ (Class)layerClass
{
  type metadata accessor for GradientLayer();
  return (Class)swift_getObjCClassFromMetadata();
}

@end
