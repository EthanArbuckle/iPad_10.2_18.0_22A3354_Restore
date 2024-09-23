@implementation CallRecordingCountdownView

- (_TtC16CommunicationsUI26CallRecordingCountdownView)init
{
  return (_TtC16CommunicationsUI26CallRecordingCountdownView *)CallRecordingCountdownView.init()();
}

- (_TtC16CommunicationsUI26CallRecordingCountdownView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23839EF08();
}

- (void)handleTapClose
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  _TtC16CommunicationsUI26CallRecordingCountdownView *v7;

  v3 = (char *)self + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate;
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

- (_TtC16CommunicationsUI26CallRecordingCountdownView)initWithFrame:(CGRect)a3
{
  _TtC16CommunicationsUI26CallRecordingCountdownView *result;

  result = (_TtC16CommunicationsUI26CallRecordingCountdownView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23839EFAC((uint64_t)self + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___title));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitle));
}

@end
