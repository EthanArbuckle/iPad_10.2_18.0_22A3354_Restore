@implementation ICAudioAttachmentPlaybackAdaptor

- (void)timeChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7NotesUI32ICAudioAttachmentPlaybackAdaptor *v8;
  uint64_t v9;

  v4 = sub_1ACA3F45C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  v8 = self;
  sub_1AC9E9198((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)playPauseToggled:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7NotesUI32ICAudioAttachmentPlaybackAdaptor *v8;
  uint64_t v9;

  v4 = sub_1ACA3F45C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  v8 = self;
  sub_1AC9E95C8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC7NotesUI32ICAudioAttachmentPlaybackAdaptor)init
{
  _TtC7NotesUI32ICAudioAttachmentPlaybackAdaptor *result;

  result = (_TtC7NotesUI32ICAudioAttachmentPlaybackAdaptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NotesUI32ICAudioAttachmentPlaybackAdaptor_audioController));
  swift_release();
  swift_release();
}

@end
