@implementation ModernButton

- (void)touchDown:(id)a3
{
  id v4;
  _TtC9FitnessUI12ModernButton *v5;

  v4 = a3;
  v5 = self;
  sub_2130F1700();

}

- (void)touchDownRepeat:(id)a3
{
  id v4;
  _TtC9FitnessUI12ModernButton *v5;

  v4 = a3;
  v5 = self;
  sub_2130F17BC();

}

- (void)touchDragInside:(id)a3
{
  id v4;
  _TtC9FitnessUI12ModernButton *v5;

  v4 = a3;
  v5 = self;
  sub_2130F1878();

}

- (void)touchDragOutside:(id)a3
{
  id v4;
  _TtC9FitnessUI12ModernButton *v5;

  v4 = a3;
  v5 = self;
  sub_2130F1934();

}

- (void)touchDragEnter:(id)a3
{
  id v4;
  _TtC9FitnessUI12ModernButton *v5;

  v4 = a3;
  v5 = self;
  sub_2130F19F0();

}

- (void)touchDragExit:(id)a3
{
  id v4;
  _TtC9FitnessUI12ModernButton *v5;

  v4 = a3;
  v5 = self;
  sub_2130F1AAC();

}

- (void)touchUpInside:(id)a3
{
  id v4;
  _TtC9FitnessUI12ModernButton *v5;

  v4 = a3;
  v5 = self;
  sub_2130F1B68();

}

- (void)touchUpOutside:(id)a3
{
  id v4;
  _TtC9FitnessUI12ModernButton *v5;

  v4 = a3;
  v5 = self;
  sub_2130F1C24();

}

- (void)touchCancel:(id)a3
{
  id v4;
  _TtC9FitnessUI12ModernButton *v5;

  v4 = a3;
  v5 = self;
  sub_2130F1CE0();

}

- (_TtC9FitnessUI12ModernButton)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents) = (Class)MEMORY[0x24BEE4B00];
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ModernButton();
  return -[ModernButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9FitnessUI12ModernButton)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents) = (Class)MEMORY[0x24BEE4B00];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ModernButton();
  return -[ModernButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
