@implementation ICNestedScrollViewPanInteraction

- (UIView)view
{
  return (UIView *)(id)MEMORY[0x1DF0DF9A8]((char *)self + OBJC_IVAR___ICNestedScrollViewPanInteraction_view, a2);
}

- (void)setView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)willMoveToView:(id)a3
{
  id v5;
  ICNestedScrollViewPanInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_1DD995674((uint64_t)a3);

}

- (void)didMoveToView:(id)a3
{
  id v5;
  ICNestedScrollViewPanInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_1DD9957F0(a3);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICNestedScrollViewPanInteraction_nestedScrollVerticalPanBlocker));

  sub_1DD8FF058((uint64_t)self + OBJC_IVAR___ICNestedScrollViewPanInteraction_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (ICNestedScrollViewPanInteraction)init
{
  ICNestedScrollViewPanInteraction *result;

  result = (ICNestedScrollViewPanInteraction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6;
  id v7;
  ICNestedScrollViewPanInteraction *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DD9974E8((uint64_t)v6, (uint64_t)v7);

  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  ICNestedScrollViewPanInteraction *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DD9976D8((uint64_t)v6, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  ICNestedScrollViewPanInteraction *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DD997A0C(v6, v7);

  return v9 & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  ICNestedScrollViewPanInteraction *v5;
  uint64_t (*v6)();
  uint64_t v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  v5 = self;
  v6 = sub_1DD995A70();
  if (*(_QWORD *)(v7 + 56))
  {
    objc_msgSend(v4, sel_contentOffset);
    sub_1DD997CD4(v8);
  }
  ((void (*)(uint64_t *, _QWORD))v6)(&v9, 0);
  sub_1DD99662C();

}

@end
