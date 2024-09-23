@implementation MAGObjectUnderstandingService

- (void)session:(id)a3 didUpdateDetectedObjects:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC16MagnifierSupport29MAGObjectUnderstandingService *v8;

  sub_22730BA80(0, &qword_2558D7538);
  v6 = sub_22758E3DC();
  v7 = a3;
  v8 = self;
  sub_2273753B4(v6);

  swift_bridgeObjectRelease();
}

- (_TtC16MagnifierSupport29MAGObjectUnderstandingService)init
{
  _TtC16MagnifierSupport29MAGObjectUnderstandingService *result;

  result = (_TtC16MagnifierSupport29MAGObjectUnderstandingService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_arService));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_pulseFeedbackProcessor));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_detectedObjectsRootNode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_detectedPlanesRootNode));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_detectedTargetObject));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_objectPointerParentNode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_objectPointer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_pointerHitTestDebugNode));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_ouSession));
}

@end
