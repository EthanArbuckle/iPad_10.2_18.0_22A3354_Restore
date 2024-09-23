@implementation APSubject

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___APSubject_clientArenaStorage);
}

+ (id)subjectMonitorRegistry
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  if (qword_2542A5598 != -1)
    swift_once();
  v2 = qword_2542A5938;
  v3 = __swift_project_boxed_opaque_existential_1(qword_2542A5920, qword_2542A5938);
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v3, v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  v7 = (void *)*((_QWORD *)v6 + 6);
  v8 = *(void (**)(char *, uint64_t))(v4 + 8);
  swift_unknownObjectRetain();
  v8(v6, v2);
  return v7;
}

- (APSubject)initWithArena:(id)a3
{
  objc_super v5;

  sub_23624E76C((uint64_t)a3 + OBJC_IVAR____TtC13AppProtectionP33_215D8CF8FF516198782505704A9473C518ClientArenaWrapper_arena, (uint64_t)self + OBJC_IVAR___APSubject_clientArenaStorage);
  v5.receiver = self;
  v5.super_class = (Class)APSubject;
  return -[APSubject init](&v5, sel_init);
}

- (BOOL)hidden
{
  BOOL result;

  result = sub_2362CBB00();
  __break(1u);
  return result;
}

- (BOOL)locked
{
  BOOL result;

  result = sub_2362CBB00();
  __break(1u);
  return result;
}

+ (APSubject)hiddenMetaSubject
{
  return (APSubject *)sub_2362C15A0((uint64_t)a1, (uint64_t)a2, qword_2563D5998, (id *)&qword_2563DB610);
}

+ (APSubject)lockedMetaSubject
{
  return (APSubject *)sub_2362C15A0((uint64_t)a1, (uint64_t)a2, qword_2563D6A10, (id *)&qword_2563DB680);
}

- (APSubject)init
{
  APSubject *result;

  result = (APSubject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)effectiveBundleIdentifier
{
  id result;

  result = (id)sub_2362CBB00();
  __break(1u);
  return result;
}

- (BOOL)shieldable
{
  return 1;
}

@end
