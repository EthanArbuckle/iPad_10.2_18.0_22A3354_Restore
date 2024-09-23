@implementation ChartDragGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  int64_t v6;
  id v7;
  _TtC6Charts26ChartDragGestureRecognizer *v8;

  sub_2141E88F4();
  sub_2141E8930();
  v6 = sub_214425100();
  v7 = a4;
  v8 = self;
  sub_2141E3A8C(v6, (uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_2141E49E0(self, (uint64_t)a2, (uint64_t)a3, a4, sub_2141E8978);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_2141E49E0(self, (uint64_t)a2, (uint64_t)a3, a4, sub_2141E8CC4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[ChartDragGestureRecognizer setState:](self, sel_setState_, 4, a4);
}

- (void)reset
{
  _TtC6Charts26ChartDragGestureRecognizer *v2;

  v2 = self;
  sub_2141E4A70();

}

- (_TtC6Charts26ChartDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_21442540C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC6Charts26ChartDragGestureRecognizer *)sub_2141E4BF4((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6Charts26ChartDragGestureRecognizer_initialFirstTouch));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6Charts26ChartDragGestureRecognizer_initialSecondTouch));

}

@end
