@implementation ContinuousGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC19ContactlessReaderUI27ContinuousGestureRecognizer *v8;
  id v9;
  id v10;

  sub_22F898D28(0, (unint64_t *)&qword_255E20840);
  sub_22F898D60();
  v6 = sub_22F98EFF8();
  v7 = a4;
  v8 = self;
  v9 = -[ContinuousGestureRecognizer view](v8, sel_view);
  sub_22F9423B4(v6, (uint64_t)v9);

  v10 = -[ContinuousGestureRecognizer view](v8, sel_view);
  sub_22F8CBDC0();

  -[ContinuousGestureRecognizer setState:](v8, sel_setState_, 1);
  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_22F896EDC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_22F898B78);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_22F896EDC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_22F898C54);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;
  id v7;
  _TtC19ContactlessReaderUI27ContinuousGestureRecognizer *v8;

  v5 = a4;
  v8 = self;
  v6 = -[ContinuousGestureRecognizer view](v8, sel_view);
  sub_22F942B10();

  v7 = -[ContinuousGestureRecognizer view](v8, sel_view);
  sub_22F8CC620();

  -[ContinuousGestureRecognizer setState:](v8, sel_setState_, 4);
}

- (_TtC19ContactlessReaderUI27ContinuousGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtC19ContactlessReaderUI27ContinuousGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_22F98F25C();
    swift_unknownObjectRelease();
  }
  result = (_TtC19ContactlessReaderUI27ContinuousGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI27ContinuousGestureRecognizer_gestureView));
}

@end
