@implementation SRFeedbackButton

- (_TtC4Siri16SRFeedbackButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC4Siri16SRFeedbackButton *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC4Siri16SRFeedbackButton_diameter) = (Class)0x4049000000000000;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SRFeedbackButton();
  v7 = -[SRFeedbackButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  sub_1000937F0();

  return v7;
}

- (_TtC4Siri16SRFeedbackButton)initWithCoder:(id)a3
{
  id v4;
  _TtC4Siri16SRFeedbackButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC4Siri16SRFeedbackButton_diameter) = (Class)0x4049000000000000;
  v4 = a3;

  result = (_TtC4Siri16SRFeedbackButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000E1170, "Siri/SRFeedbackButton.swift", 27, 2, 23, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 50.0;
  v4 = 50.0;
  result.height = v4;
  result.width = v3;
  return result;
}

@end
