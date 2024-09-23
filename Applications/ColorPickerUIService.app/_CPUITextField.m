@implementation _CPUITextField

- (void)tintColorDidChange
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _CPUITextField();
  v2 = v6.receiver;
  -[_CPUITextField tintColorDidChange](&v6, "tintColorDidChange");
  v3 = objc_msgSend(v2, "inputAccessoryView", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "tintColor");
    objc_msgSend(v4, "setTintColor:", v5);

    v2 = v4;
  }

}

- (BOOL)_becomeFirstResponderWhenPossible
{
  return 0;
}

- (void)buildMenuWithBuilder:(id)a3
{
  _TtC20ColorPickerUIServiceP33_B2FE14F7DB151A9888581FFCE687814914_CPUITextField *v5;

  swift_unknownObjectRetain(a3, a2);
  v5 = self;
  sub_100004E70(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC20ColorPickerUIServiceP33_B2FE14F7DB151A9888581FFCE687814914_CPUITextField)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for _CPUITextField();
  return -[_CPUITextField initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC20ColorPickerUIServiceP33_B2FE14F7DB151A9888581FFCE687814914_CPUITextField)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _CPUITextField();
  return -[_CPUITextField initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
