@implementation CallRecordingView

- (_TtC16CommunicationsUI17CallRecordingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2383B5570();
}

- (void)handleTapContainer
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  _TtC16CommunicationsUI17CallRecordingView *v7;

  v3 = (char *)self + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_delegate;
  swift_beginAccess();
  if (MEMORY[0x23B832F68](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (void)handleTapStopRecording
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  _TtC16CommunicationsUI17CallRecordingView *v7;

  v3 = (char *)self + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_delegate;
  swift_beginAccess();
  if (MEMORY[0x23B832F68](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (_TtC16CommunicationsUI17CallRecordingView)initWithFrame:(CGRect)a3
{
  _TtC16CommunicationsUI17CallRecordingView *result;

  result = (_TtC16CommunicationsUI17CallRecordingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23839EFAC((uint64_t)self + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView____lazy_storage___stopwatch));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI17CallRecordingView_waveform));
}

@end
