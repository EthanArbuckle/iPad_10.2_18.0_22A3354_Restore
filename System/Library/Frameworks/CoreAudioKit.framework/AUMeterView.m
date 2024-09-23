@implementation AUMeterView

- (_TtC12CoreAudioKit11AUMeterView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit11AUMeterView *)sub_2131659D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit11AUMeterView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit11AUMeterView *)sub_213165B20(a3);
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUMeterView();
  return -[AUMeterView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUMeterView();
  v4 = a3;
  v5 = v6.receiver;
  -[AUMeterView setTintColor:](&v6, sel_setTintColor_, v4);
  sub_213165D10();

}

- (void)layoutSubviews
{
  _TtC12CoreAudioKit11AUMeterView *v2;

  v2 = self;
  sub_213166034();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit11AUMeterView____lazy_storage___meterFillLayer));
}

@end
