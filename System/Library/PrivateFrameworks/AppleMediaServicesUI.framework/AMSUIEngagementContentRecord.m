@implementation AMSUIEngagementContentRecord

- (NSString)app
{
  return (NSString *)sub_2111E730C((uint64_t)self, (uint64_t)a2, EngagementContentRecord.app.getter);
}

- (NSString)cacheKey
{
  return (NSString *)sub_2111E730C((uint64_t)self, (uint64_t)a2, EngagementContentRecord.cacheKey.getter);
}

- (NSString)contentExtension
{
  return (NSString *)sub_2111E7450((uint64_t)self, (uint64_t)a2, EngagementContentRecord.contentExtension.getter);
}

- (NSURL)fallbackURL
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  EngagementContentRecord.fallbackURL.getter((uint64_t)v4);
  v5 = sub_211244FE0();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_211244F98();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSURL *)v6;
}

- (NSString)version
{
  return (NSString *)sub_2111E7450((uint64_t)self, (uint64_t)a2, EngagementContentRecord.version.getter);
}

+ (BOOL)isURLEngagementContent:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;

  v3 = sub_211244FE0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211244FA4();
  v7 = static EngagementContentRecord.isURLEngagementContent(url:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

- (AMSUIEngagementContentRecord)initWithURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v3 = sub_211244FE0();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211244FA4();
  return (AMSUIEngagementContentRecord *)EngagementContentRecord.init(url:)((uint64_t)v5);
}

- (AMSUIEngagementContentRecord)init
{
  EngagementContentRecord.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_9_7();
  sub_2111C7E2C((uint64_t)self + OBJC_IVAR___AMSUIEngagementContentRecord_fallbackURL, &qword_253D2B140);
  swift_bridgeObjectRelease();
}

@end
