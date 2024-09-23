@implementation NestedScrollViewPanInteraction.VerticalPanGestureRecognizer

- (_TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  return (_TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer *)sub_1DD997320((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(_OWORD *, uint64_t))sub_1DD996A84);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1DD996D04(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_1DD999324);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1DD996D04(self, (uint64_t)a2, (uint64_t)a3, a4, sub_1DD9993BC);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1DD996DA4(self, (uint64_t)a2, (uint64_t)a3, a4, &OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer_touch, 5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1DD996DA4(self, (uint64_t)a2, (uint64_t)a3, a4, &OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer_touch, 5);
}

- (void)reset
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NestedScrollViewPanInteraction.VerticalPanGestureRecognizer();
  v2 = (char *)v5.receiver;
  -[NestedScrollViewPanInteraction.VerticalPanGestureRecognizer reset](&v5, sel_reset);
  v3 = *(void **)&v2[OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer_touch];
  *(_QWORD *)&v2[OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer_touch] = 0;

  v4 = &v2[OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer_startPoint];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;

}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v4;
  _TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer *v5;

  v4 = a3;
  v5 = self;
  sub_1DD996EC0(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer_touch));
}

@end
