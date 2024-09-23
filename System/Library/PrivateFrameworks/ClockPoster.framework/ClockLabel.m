@implementation ClockLabel

- (void)layoutSubviews
{
  _TtC11ClockPoster10ClockLabel *v2;

  v2 = self;
  sub_237E34228();

}

- (_TtC11ClockPoster10ClockLabel)initWithTimeLabelOptions:(unint64_t)a3
{
  return (_TtC11ClockPoster10ClockLabel *)sub_237E349A4(self, (uint64_t)a2, a3, (SEL *)&selRef_initWithTimeLabelOptions_);
}

- (_TtC11ClockPoster10ClockLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4
{
  objc_super v7;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11ClockPoster10ClockLabel_observingOverrideDate) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClockLabel();
  return -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:](&v7, sel_initWithTimeLabelOptions_forDevice_, a3, a4);
}

- (_TtC11ClockPoster10ClockLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4 clockTimer:(id)a5
{
  objc_super v9;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11ClockPoster10ClockLabel_observingOverrideDate) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ClockLabel();
  return -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:clockTimer:](&v9, sel_initWithTimeLabelOptions_forDevice_clockTimer_, a3, a4, a5);
}

- (_TtC11ClockPoster10ClockLabel)initWithFrame:(CGRect)a3
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
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11ClockPoster10ClockLabel_observingOverrideDate) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ClockLabel();
  return -[CLKUITimeLabel initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11ClockPoster10ClockLabel)initWithCoder:(id)a3
{
  return (_TtC11ClockPoster10ClockLabel *)sub_237E349A4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end
