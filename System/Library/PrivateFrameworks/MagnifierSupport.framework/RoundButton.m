@implementation RoundButton

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v10.receiver;
  -[RoundButton menuAttachmentPointForConfiguration:](&v10, sel_menuAttachmentPointForConfiguration_, v4);
  objc_msgSend(v5, sel_frame, v10.receiver, v10.super_class);
  v7 = v6;

  v8 = -24.0;
  v9 = v7;
  result.y = v8;
  result.x = v9;
  return result;
}

- (_TtC16MagnifierSupport11RoundButton)initWithCoder:(id)a3
{
  _TtC16MagnifierSupport11RoundButton *result;

  result = (_TtC16MagnifierSupport11RoundButton *)sub_22758ECC4();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport11RoundButton)initWithFrame:(CGRect)a3
{
  sub_2274411A8();
}

@end
