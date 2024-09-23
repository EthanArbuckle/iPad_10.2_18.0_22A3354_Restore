@implementation HGManagerInternal

- (HGConfigurationInternal)configuration
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  return (HGConfigurationInternal *)*v2;
}

- (void)setConfiguration:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (HGManagerInternal)initWithDelegate:(id)a3 config:(id)a4
{
  id v6;
  HGManagerInternal *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = (HGManagerInternal *)sub_23DA8EF80((uint64_t)a3, v6);
  swift_unknownObjectRelease();

  return v7;
}

- (void)start
{
  HGManagerInternal *v2;

  v2 = self;
  sub_23DA8BF60();

}

- (void)stopWith:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  HGManagerInternal *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_23DA8F6CC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_23DA8CEA0((uint64_t)v7, v6);
  sub_23DA6EA08((uint64_t)v7);

}

- (void)muteAudioFeedbackWithSetting:(BOOL)a3
{
  HGManagerInternal *v4;

  v4 = self;
  sub_23DA8E46C(a3);

}

- (HGManagerInternal)init
{
  HGManagerInternal *result;

  result = (HGManagerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___HGManagerInternal_id;
  v4 = sub_23DA9B818();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  sub_23DA8F6D8((uint64_t)self + OBJC_IVAR___HGManagerInternal_delegate);

}

@end
