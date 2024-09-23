@implementation TwoFingerPanGestureRecognizer

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC11CalculateUI29TwoFingerPanGestureRecognizer *v8;

  sub_23766917C();
  sub_2376691B8();
  v6 = sub_2376A3CEC();
  v7 = a4;
  v8 = self;
  sub_237668644(v6, a4);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC11CalculateUI29TwoFingerPanGestureRecognizer *v8;

  sub_23766917C();
  sub_2376691B8();
  v6 = sub_2376A3CEC();
  v7 = a4;
  v8 = self;
  sub_2376687A0(v6, (uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (_TtC11CalculateUI29TwoFingerPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_2376A3DDC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC11CalculateUI29TwoFingerPanGestureRecognizer *)sub_237668964((uint64_t)v6, (uint64_t)a4);
}

@end
