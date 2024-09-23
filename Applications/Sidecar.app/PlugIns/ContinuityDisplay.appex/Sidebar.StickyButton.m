@implementation Sidebar.StickyButton

- (void)_keyboardButtonGestureTriggeredWithRecognizer:(id)a3
{
  id v4;
  _TtCO17ContinuityDisplay7Sidebar12StickyButton *v5;

  v4 = a3;
  v5 = self;
  sub_100037E78(v4);

}

- (void)_buttonDownWithSender:(id)a3
{
  id v4;
  _TtCO17ContinuityDisplay7Sidebar12StickyButton *v5;

  v4 = a3;
  v5 = self;
  sub_100037F98();

}

- (void)_buttonUpWithSender:(id)a3
{
  id v4;
  _TtCO17ContinuityDisplay7Sidebar12StickyButton *v5;

  v4 = a3;
  v5 = self;
  sub_100038158();

}

- (_TtCO17ContinuityDisplay7Sidebar12StickyButton)initWithCoder:(id)a3
{
  return (_TtCO17ContinuityDisplay7Sidebar12StickyButton *)sub_10003874C(a3);
}

- (void).cxx_destruct
{
  sub_100038C6C((uint64_t)self + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar12StickyButton_downUpHandler);
  sub_100038C6C((uint64_t)self + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar12StickyButton_stickyHandler);
  sub_100038C6C((uint64_t)self + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar12StickyButton_tapHandler);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar12StickyButton_doubleTapRecognizer));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar12StickyButton__tapTimer));
}

@end
