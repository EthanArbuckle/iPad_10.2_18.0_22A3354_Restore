@implementation RoomCaptureCoachingOverlayView

- (_TtC8RoomPlan30RoomCaptureCoachingOverlayView)initWithFrame:(CGRect)a3
{
  sub_2265134A4();
}

- (_TtC8RoomPlan30RoomCaptureCoachingOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2265134A4();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)didPanWithPanGesture:(id)a3
{
  sub_226512FC4((uint64_t)self, (uint64_t)a2, a3, sub_226530660);
}

- (void)didPinchWithPinchGesture:(id)a3
{
  sub_226512FC4((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_22652FD1C);
}

- (void)didTouchDownWithLongPressGesture:(id)a3
{
  id v4;
  _TtC8RoomPlan30RoomCaptureCoachingOverlayView *v5;

  v4 = a3;
  v5 = self;
  sub_226513038(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_dollHouseARView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_arGlyphView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_coachingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_coachingLabelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_pinchGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_immediateLongPressRecognizer));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22643D7E4((uint64_t)self + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_sceneObserver, &qword_255847158);
  swift_release();
  swift_release();
  swift_release();
}

@end
