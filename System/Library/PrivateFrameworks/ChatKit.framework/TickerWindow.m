@implementation TickerWindow

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_18E7550BC(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TickerWindow();
  return -[TickerWindow initWithWindowScene:](&v5, sel_initWithWindowScene_, a3);
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TickerWindow();
  return -[TickerWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TickerWindow();
  return -[TickerWindow initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithContentRect:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TickerWindow();
  return -[TickerWindow initWithContentRect:](&v8, sel_initWithContentRect_, x, y, width, height);
}

@end
