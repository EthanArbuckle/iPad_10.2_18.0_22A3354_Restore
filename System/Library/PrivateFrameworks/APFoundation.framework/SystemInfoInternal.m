@implementation SystemInfoInternal

+ (NSString)osName
{
  return (NSString *)(id)sub_1CF372140();
}

+ (NSString)longBuildVersion
{
  id v2;
  void *v3;
  NSString *result;
  void *v5;

  v2 = objc_msgSend((id)objc_opt_self(), sel_kBuildVersionString);
  v3 = (void *)MGGetStringAnswer();

  if (v3)
  {
    sub_1CF37214C();

    v5 = (void *)sub_1CF372140();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (NSString)deviceModel
{
  return (NSString *)sub_1CF265754((uint64_t)a1, (uint64_t)a2, (void (*)(void))_s12APFoundation10SystemInfoC11deviceModelSSvgZ_0);
}

+ (NSString)osVersion
{
  return (NSString *)sub_1CF265754((uint64_t)a1, (uint64_t)a2, (void (*)(void))_s12APFoundation10SystemInfoC9osVersionSSvgZ_0);
}

+ (NSString)systemDescription
{
  return (NSString *)sub_1CF265754((uint64_t)a1, (uint64_t)a2, _s12APFoundation10SystemInfoC17systemDescriptionSSvgZ_0);
}

+ (NSString)osIdentifier
{
  return (NSString *)(id)sub_1CF372140();
}

+ (NSString)shortBuildVersion
{
  uint64_t v2;
  void *v3;

  _s12APFoundation10SystemInfoC17shortBuildVersionSSSgvgZ_0();
  if (v2)
  {
    v3 = (void *)sub_1CF372140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

+ (NSString)bundleIdentifier
{
  id v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v3 = objc_msgSend(v2, sel_bundleIdentifier);

  if (v3)
  {
    sub_1CF37214C();

    v3 = (id)sub_1CF372140();
    swift_bridgeObjectRelease();
  }
  return (NSString *)v3;
}

+ (NSString)locale
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v9;

  v2 = sub_1CF37205C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF372050();
  sub_1CF372044();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v7 = (void *)sub_1CF372140();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

+ (NSString)modelType
{
  return (NSString *)sub_1CF265754((uint64_t)a1, (uint64_t)a2, (void (*)(void))_s12APFoundation10SystemInfoC9modelTypeSSvgZ_0);
}

+ (BOOL)firstRunSinceReboot
{
  if (qword_1ED2BBDC0 != -1)
    swift_once();
  return byte_1ED2BB3E0;
}

- (SystemInfoInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SystemInfo();
  return -[SystemInfoInternal init](&v3, sel_init);
}

@end
