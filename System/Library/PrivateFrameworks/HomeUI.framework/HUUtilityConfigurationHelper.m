@implementation HUUtilityConfigurationHelper

- (NSArray)fields
{
  void *v2;

  type metadata accessor for HUTAFField();
  sub_1B93ECF74();
  v2 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSString)name
{
  HUUtilityConfigurationHelper *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  sub_1B93EC1A0();
  if (!v3)
    sub_1B93EC188();

  v4 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (NSURL)OAuthURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  HUUtilityConfigurationHelper *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20A8E0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1B93EC194();

  v7 = sub_1B93EB798();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1B93EB768();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (NSString)logoURL
{
  HUUtilityConfigurationHelper *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  v3 = (void *)sub_1B93EC17C();
  v4 = (void *)sub_1B93EC14C();

  sub_1B93EC284();
  v5 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSArray)sections
{
  HUUtilityConfigurationHelper *v2;
  void *v3;

  v2 = self;
  sub_1B8F73BD4();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20D4E0);
  v3 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)isTAFEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  HUUtilityConfigurationHelper *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF20E2A8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF209370;
  v12[5] = v11;
  v13 = self;
  sub_1B901BAB4((uint64_t)v7, (uint64_t)&unk_1EF20E5B0, (uint64_t)v12);
  swift_release();
}

- (HUUtilityConfigurationHelper)init
{
  HUUtilityConfigurationHelper *result;

  result = (HUUtilityConfigurationHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
