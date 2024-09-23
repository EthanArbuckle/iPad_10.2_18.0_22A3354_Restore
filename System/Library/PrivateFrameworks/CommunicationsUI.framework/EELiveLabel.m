@implementation EELiveLabel

- (_TtC16CommunicationsUI11EELiveLabel)init
{
  return (_TtC16CommunicationsUI11EELiveLabel *)EELiveLabel.init()();
}

- (void)drawTextInRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _TtC16CommunicationsUI11EELiveLabel *v11;
  objc_super v12;

  v4 = UIEdgeInsetsInsetRect(a3.origin.x);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for EELiveLabel();
  v11 = self;
  -[EELiveLabel drawTextInRect:](&v12, sel_drawTextInRect_, v4, v6, v8, v10);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EELiveLabel();
  -[EELiveLabel intrinsicContentSize](&v6, sel_intrinsicContentSize);
  v3 = v2 + 10.0;
  v5 = v4 + 2.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (_TtC16CommunicationsUI11EELiveLabel)initWithCoder:(id)a3
{
  _TtC16CommunicationsUI11EELiveLabel *result;

  result = (_TtC16CommunicationsUI11EELiveLabel *)sub_2383D045C();
  __break(1u);
  return result;
}

- (_TtC16CommunicationsUI11EELiveLabel)initWithFrame:(CGRect)a3
{
  sub_238398CDC();
}

@end
