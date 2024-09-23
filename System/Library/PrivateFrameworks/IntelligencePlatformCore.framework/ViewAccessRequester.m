@implementation ViewAccessRequester

- (id)requestAssertionForViewName:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  _TtC24IntelligencePlatformCore19ViewAccessRequester *v8;
  id v9;

  v5 = sub_1C106FB14();
  v7 = v6;
  v8 = self;
  v9 = sub_1C0DA2114(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (_TtC24IntelligencePlatformCore19ViewAccessRequester)init
{
  sub_1C0DA23D0();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC24IntelligencePlatformCore19ViewAccessRequester_artifactURL;
  v4 = sub_1C07815A8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
