@implementation MAGAngelDetectionManager

- (_TtC14MagnifierAngel24MAGAngelDetectionManager)init
{
  _TtC14MagnifierAngel24MAGAngelDetectionManager *result;

  result = (_TtC14MagnifierAngel24MAGAngelDetectionManager *)_swift_stdlib_reportUnimplementedInitializer("MagnifierAngel.MAGAngelDetectionManager", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_textDetectionService));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_angelPreferences));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_personDetectionManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_anstPersonDetectionManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_doorDetectionService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pointAndSpeakService));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_imageCaptionService));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pointAndSpeakEventHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_detectionModeFlashlightDispatchItem));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_sceneRenderer));
  v3 = (char *)self + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
