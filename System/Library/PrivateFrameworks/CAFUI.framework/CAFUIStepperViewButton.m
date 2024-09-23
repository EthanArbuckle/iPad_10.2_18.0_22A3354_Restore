@implementation CAFUIStepperViewButton

- (_TtC5CAFUI22CAFUIStepperViewButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI22CAFUIStepperViewButton_hasCellBackground) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CAFUIStepperViewButton();
  return -[CAFUIStepperViewButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC5CAFUI22CAFUIStepperViewButton)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI22CAFUIStepperViewButton_hasCellBackground) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUIStepperViewButton();
  return -[CAFUIStepperViewButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
