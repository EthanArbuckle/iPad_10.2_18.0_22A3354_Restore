@implementation DOCButtonGestureRecognizer

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (_TtC26DocumentManagerExecutables26DOCButtonGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_21EB031B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC26DocumentManagerExecutables26DOCButtonGestureRecognizer *)DOCButtonGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_21EAB0954(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))DOCButtonGestureRecognizer.touchesBegan(_:with:));
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_21EAB0954(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))DOCButtonGestureRecognizer.touchesMoved(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_21EAB0954(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))DOCButtonGestureRecognizer.touchesEnded(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC26DocumentManagerExecutables26DOCButtonGestureRecognizer *v8;
  void *v9;
  objc_super v10;

  sub_21EAB05BC();
  sub_21EAB05F8();
  v6 = sub_21EB02E1C();
  swift_beginAccess();
  v7 = a4;
  v8 = self;
  sub_21EAB0F4C(v6);
  swift_endAccess();
  v9 = (void *)sub_21EB02E10();
  v10.receiver = v8;
  v10.super_class = (Class)type metadata accessor for DOCButtonGestureRecognizer();
  -[DOCButtonGestureRecognizer touchesCancelled:withEvent:](&v10, sel_touchesCancelled_withEvent_, v9, v7);

  -[DOCButtonGestureRecognizer setState:](v8, sel_setState_, 4);
  swift_bridgeObjectRelease();
}

- (void)reset
{
  _TtC26DocumentManagerExecutables26DOCButtonGestureRecognizer *v2;

  v2 = self;
  DOCButtonGestureRecognizer.reset()();

}

@end
