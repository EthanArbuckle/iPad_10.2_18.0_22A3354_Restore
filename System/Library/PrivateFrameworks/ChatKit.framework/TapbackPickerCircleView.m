@implementation TapbackPickerCircleView

- (void)layoutSubviews
{
  _TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF323TapbackPickerCircleView *v2;

  v2 = self;
  sub_18E6A84CC();

}

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF323TapbackPickerCircleView)initWithFrame:(CGRect)a3
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
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerCircleView();
  return -[TapbackPickerCircleView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF323TapbackPickerCircleView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerCircleView();
  return -[TapbackPickerCircleView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
