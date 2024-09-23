@implementation AudioBoxController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  AudioBoxController *v7;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1000181E4((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (void)start
{
  AudioBoxController *v2;

  v2 = self;
  sub_10001845C();

}

- (void)teardown
{
  AudioBoxController *v2;

  v2 = self;
  sub_10001894C();

}

- (AudioBoxController)init
{
  return (AudioBoxController *)sub_10001C390();
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  swift_unknownObjectRelease(*(_QWORD *)&self->DKDiagnosticController_opaque[OBJC_IVAR___AudioBoxController_responder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->DKDiagnosticController_opaque[OBJC_IVAR___AudioBoxController_fileNameToURLMap]);
  v3 = &self->DKDiagnosticController_opaque[OBJC_IVAR___AudioBoxController_audioFileFolderURL];
  v4 = type metadata accessor for URL(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
