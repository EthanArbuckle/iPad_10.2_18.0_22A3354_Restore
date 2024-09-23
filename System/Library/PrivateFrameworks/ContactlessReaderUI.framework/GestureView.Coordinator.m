@implementation GestureView.Coordinator

- (void)handleTapWithSender:(id)a3
{
  id v4;
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22F8960DC(0, v4);

}

- (void)handleDoubleTapWithSender:(id)a3
{
  id v4;
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22F8960DC(1, v4);

}

- (void)handleTap3FingersWithSender:(id)a3
{
  id v4;
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22F8960DC(9, v4);

}

- (void)handleDoubleTap2FingersWithSender:(id)a3
{
  id v4;
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22F8960DC(2, v4);

}

- (void)handleDoubleTap3FingersWithSender:(id)a3
{
  id v4;
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22F8960DC(3, v4);

}

- (void)handleSwipeWithSender:(id)a3
{
  id v4;
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22F896410(v4);

}

- (void)handleSwipe2FingersWithSender:(id)a3
{
  id v4;
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22F896548(v4);

}

- (void)handleLongPressWithSender:(id)a3
{
  id v4;
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22F896680(v4);

}

- (void)handlePanWithSender:(id)a3
{
  id v4;
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22F896770(v4);

}

- (void)handleVeryLongPressWithSender:(id)a3
{
  id v4;
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22F8968C8(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  return ObjectType == type metadata accessor for ContinuousGestureRecognizer();
}

- (_TtCV19ContactlessReaderUI11GestureView11Coordinator)init
{
  _TtCV19ContactlessReaderUI11GestureView11Coordinator *result;

  result = (_TtCV19ContactlessReaderUI11GestureView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v2;

  v2 = *(void **)&self->parent[OBJC_IVAR____TtCV19ContactlessReaderUI11GestureView11Coordinator_parent + 72];
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
