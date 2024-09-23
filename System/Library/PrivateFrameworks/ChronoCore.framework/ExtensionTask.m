@implementation ExtensionTask

- (NSString)description
{
  _TtC10ChronoCore13ExtensionTask *v2;
  void *v3;

  v2 = self;
  sub_1D2918C74();
  sub_1D29C5AA8();
  swift_bridgeObjectRetain();
  sub_1D29C5AA8();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_1D29C59C4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)hash
{
  _TtC10ChronoCore13ExtensionTask *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1D29C17F4();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC10ChronoCore13ExtensionTask *v4;
  _TtC10ChronoCore13ExtensionTask *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D29C6144();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1D2919704((uint64_t)v8);

  sub_1D271E704((uint64_t)v8, (uint64_t *)&unk_1ED94DEF0);
  return v6 & 1;
}

- (_TtC10ChronoCore13ExtensionTask)init
{
  _TtC10ChronoCore13ExtensionTask *result;

  result = (_TtC10ChronoCore13ExtensionTask *)_swift_stdlib_reportUnimplementedInitializer();
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

  v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_requiredDataProtectionLevel;
  v4 = sub_1D29C5580();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D273C0A8((uint64_t)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_schedulingConfiguration, type metadata accessor for ExtensionTask.SchedulingConfiguration);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_powerlogWakeReason, &qword_1ED94DB08);

  sub_1D273C0A8((uint64_t)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_identifier, type metadata accessor for ExtensionTask.Identifier);
  v5 = (char *)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_taskIdentifier;
  v6 = sub_1D29C180C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  sub_1D273E950(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_syncWorkItem));
  sub_1D273E950(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_asyncWorkItem));
  sub_1D273E950(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_taskWorkItem));
  sub_1D273E950(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_completion));
  v7 = (char *)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_creationDate;
  v8 = sub_1D29C17AC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

@end
