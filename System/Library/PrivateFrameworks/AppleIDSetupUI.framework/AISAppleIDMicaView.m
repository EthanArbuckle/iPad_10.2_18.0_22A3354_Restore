@implementation AISAppleIDMicaView

- (_TtC14AppleIDSetupUI18AISAppleIDMicaView)initWithCoder:(id)a3
{
  id v4;
  _TtC14AppleIDSetupUI18AISAppleIDMicaView *v5;
  _TtC14AppleIDSetupUI18AISAppleIDMicaView *v6;
  _TtC14AppleIDSetupUI18AISAppleIDMicaView *v7;
  objc_super v9;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14AppleIDSetupUI18AISAppleIDMicaView_micaPlayer) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AISAppleIDMicaView();
  v4 = a3;
  v5 = -[AISAppleIDMicaView initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_2366BF744();

  }
  return v6;
}

- (_TtC14AppleIDSetupUI18AISAppleIDMicaView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC14AppleIDSetupUI18AISAppleIDMicaView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14AppleIDSetupUI18AISAppleIDMicaView_micaPlayer) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AISAppleIDMicaView();
  v7 = -[AISAppleIDMicaView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_2366BF744();

  return v7;
}

- (void)layoutSubviews
{
  _TtC14AppleIDSetupUI18AISAppleIDMicaView *v2;

  v2 = self;
  sub_2366BF93C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI18AISAppleIDMicaView_micaPlayer));
}

@end
