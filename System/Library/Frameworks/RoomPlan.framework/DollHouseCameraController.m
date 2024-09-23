@implementation DollHouseCameraController

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)didPanWithPanGesture:(id)a3
{
  id v4;
  _TtC8RoomPlan25DollHouseCameraController *v5;

  v4 = a3;
  v5 = self;
  sub_226530660(v4);

}

- (void)didPinchWithPinchGesture:(id)a3
{
  id v4;
  _TtC8RoomPlan25DollHouseCameraController *v5;

  v4 = a3;
  v5 = self;
  sub_226531210(v4);

}

- (void)didTouchDownWithLongPressGesture:(id)a3
{
  id v4;
  _TtC8RoomPlan25DollHouseCameraController *v5;

  v4 = a3;
  v5 = self;
  sub_226531314(v4);

}

- (_TtC8RoomPlan25DollHouseCameraController)init
{
  _TtC8RoomPlan25DollHouseCameraController *result;

  result = (_TtC8RoomPlan25DollHouseCameraController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_226531CD8((uint64_t)self + OBJC_IVAR____TtC8RoomPlan25DollHouseCameraController_delegate);
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8RoomPlan25DollHouseCameraController_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8RoomPlan25DollHouseCameraController_pinchGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8RoomPlan25DollHouseCameraController_immediateLongPressRecognizer));
  v3 = (char *)self + OBJC_IVAR____TtC8RoomPlan25DollHouseCameraController_startTapTime;
  v4 = sub_22655C0E0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
