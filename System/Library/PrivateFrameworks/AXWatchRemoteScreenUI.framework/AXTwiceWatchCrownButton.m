@implementation AXTwiceWatchCrownButton

- (void)accessibilityElementDidLoseFocus
{
  _TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton *v2;

  v2 = self;
  sub_21EC696BC();

}

- (_TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchInterval) = (Class)0x3FF0000000000000;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AXTwiceWatchCrownButton();
  return -[AXTwiceWatchCrownButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchInterval) = (Class)0x3FF0000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AXTwiceWatchCrownButton();
  return -[AXTwiceWatchCrownButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer));
}

@end
