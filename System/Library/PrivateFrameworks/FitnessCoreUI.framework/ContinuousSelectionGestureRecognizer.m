@implementation ContinuousSelectionGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  _TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer *v6;

  v5 = a4;
  v6 = self;
  if (!-[ContinuousSelectionGestureRecognizer state](v6, sel_state))
    -[ContinuousSelectionGestureRecognizer setState:](v6, sel_setState_, 1);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  _TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer *v6;

  v5 = a4;
  v6 = self;
  sub_23C033718((uint64_t)v5);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  _TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer *v7;

  v5 = a4;
  v7 = self;
  if (-[ContinuousSelectionGestureRecognizer state](v7, sel_state) == (id)1
    || -[ContinuousSelectionGestureRecognizer state](v7, sel_state) == (id)2)
  {
    v6 = 3;
  }
  else
  {
    v6 = 5;
  }
  -[ContinuousSelectionGestureRecognizer setState:](v7, sel_setState_, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  _TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer *v7;

  v5 = a4;
  v7 = self;
  if (-[ContinuousSelectionGestureRecognizer state](v7, sel_state))
    v6 = 4;
  else
    v6 = 5;
  -[ContinuousSelectionGestureRecognizer setState:](v7, sel_setState_, v6);

}

- (_TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_23C054248();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer *)sub_23C033428((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  sub_23C0338B4((uint64_t)self + OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_dragCoordinator);
}

@end
