@implementation ClarityCameraModel

- (_TtC7ChatKit18ClarityCameraModel)init
{
  return (_TtC7ChatKit18ClarityCameraModel *)sub_18E6A8F6C();
}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC7ChatKit18ClarityCameraModel *v14;
  id v15;
  uint64_t v16;

  v9 = sub_18E7661A0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E76617C();
  v13 = a3;
  v14 = self;
  v15 = a6;
  sub_18E6AA700((uint64_t)v12, a6);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_18E00FA98((uint64_t)self + OBJC_IVAR____TtC7ChatKit18ClarityCameraModel_captureSessionRuntimeErrorSubscription, &qword_1EE10FA68);
  sub_18E011A40(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7ChatKit18ClarityCameraModel_videoRecordCompletionBlock));
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit18ClarityCameraModel__currentVideoURL;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10FA98);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
