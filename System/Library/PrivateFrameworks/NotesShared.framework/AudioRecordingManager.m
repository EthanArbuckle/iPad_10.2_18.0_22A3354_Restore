@implementation AudioRecordingManager

- (_TtC11NotesShared21AudioRecordingManager)init
{
  _TtC11NotesShared21AudioRecordingManager *result;

  result = (_TtC11NotesShared21AudioRecordingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC11NotesShared21AudioRecordingManager__recordingState;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF50F2F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11NotesShared21AudioRecordingManager__seconds;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF50F300);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11NotesShared21AudioRecordingManager__samples;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF50F310);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

}

@end
