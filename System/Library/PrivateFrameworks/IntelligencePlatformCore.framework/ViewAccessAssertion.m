@implementation ViewAccessAssertion

- (NSString)viewName
{
  void *v2;

  sub_1C0DA1CBC();
  v2 = (void *)sub_1C106FAF0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSURL)viewArtifactURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1C106AB28();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C0DA1D70((uint64_t)v5);
  v6 = (void *)sub_1C106AAB0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v6;
}

- (NSString)viewArtifactTableName
{
  uint64_t v2;
  void *v3;

  sub_1C0DA1DF4();
  if (v2)
  {
    v3 = (void *)sub_1C106FAF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)alwaysAvailable
{
  return sub_1C0DA1E44() & 1;
}

- (_TtC24IntelligencePlatformCore19ViewAccessAssertion)init
{
  sub_1C0DA1F38();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC24IntelligencePlatformCore19ViewAccessAssertion_viewArtifactURL;
  v4 = sub_1C07815A8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end
