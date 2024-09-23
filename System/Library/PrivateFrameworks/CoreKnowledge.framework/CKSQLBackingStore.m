@implementation CKSQLBackingStore

- (_TtC13CoreKnowledge17CKSQLBackingStore)initWithName:(id)a3
{
  sub_1A4920D3C();
  sub_1A48D0730();
  return self;
}

+ (NSURL)directory
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE77C760);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1A48D059C();
  swift_beginAccess();
  sub_1A48D2D0C(v6, (uint64_t)v5);
  v7 = sub_1A4920B14();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_1A4920AD8();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  return (NSURL *)v8;
}

+ (void)setDirectory:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE77C760);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A4920AFC();
    v8 = sub_1A4920B14();
    v9 = 0;
  }
  else
  {
    v8 = sub_1A4920B14();
    v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = sub_1A48D059C();
  swift_beginAccess();
  sub_1A48D2C88((uint64_t)v7, v10);
  swift_endAccess();
  sub_1A48D2CD0((uint64_t)v7, &qword_1EE77C760);
}

@end
