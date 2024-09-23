@implementation NestedScrollViewPanInteraction.ExclusionGestureRecognizer

- (_TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  return (_TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer *)sub_1DD997320((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(_OWORD *, uint64_t))sub_1DD99708C);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1DD996D04(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_1DD99946C);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1DD996DA4(self, (uint64_t)a2, (uint64_t)a3, a4, &OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer_touch, 3);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1DD996DA4(self, (uint64_t)a2, (uint64_t)a3, a4, &OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer_touch, 5);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1DD996DA4(self, (uint64_t)a2, (uint64_t)a3, a4, &OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer_touch, 5);
}

- (void)reset
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer_touch);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer_touch) = 0;

}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v4;
  _TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer *v5;

  v4 = a3;
  v5 = self;
  if (!-[NestedScrollViewPanInteraction.ExclusionGestureRecognizer state](v5, sel_state))
    -[NestedScrollViewPanInteraction.ExclusionGestureRecognizer setState:](v5, sel_setState_, 3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer_touch));
}

@end
