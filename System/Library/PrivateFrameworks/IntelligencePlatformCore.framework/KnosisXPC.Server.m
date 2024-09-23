@implementation KnosisXPC.Server

- (void)executeKGQ:(id)a3 withCompletion:(id)a4
{
  sub_1C0BC1120(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1C0BBEF2C);
}

- (void)executeIntent:(id)a3 withCompletion:(id)a4
{
  sub_1C0BC1120(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1C0BBFA30);
}

- (_TtCC24IntelligencePlatformCore9KnosisXPC6Server)init
{
  KnosisXPC.Server.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtCC24IntelligencePlatformCore9KnosisXPC6Server_accessConfig;
  v3 = sub_1C106E704();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
