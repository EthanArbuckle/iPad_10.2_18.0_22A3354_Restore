@implementation AUGenericViewClumpBackground

- (_TtC12CoreAudioKit28AUGenericViewClumpBackground)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC12CoreAudioKit28AUGenericViewClumpBackground *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AUGenericViewClumpBackground();
  v7 = -[AUGenericViewClumpBackground initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_2131C9F2C();

  return v7;
}

- (_TtC12CoreAudioKit28AUGenericViewClumpBackground)initWithCoder:(id)a3
{
  _TtC12CoreAudioKit28AUGenericViewClumpBackground *result;

  result = (_TtC12CoreAudioKit28AUGenericViewClumpBackground *)sub_2131E1DF4();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUGenericViewClumpBackground();
  return -[AUGenericViewClumpBackground tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewClumpBackground();
  v4 = a3;
  v5 = v6.receiver;
  -[AUGenericViewClumpBackground setTintColor:](&v6, sel_setTintColor_, v4);
  sub_2131CA1E0();

}

@end
