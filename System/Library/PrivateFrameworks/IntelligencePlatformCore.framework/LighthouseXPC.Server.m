@implementation LighthouseXPC.Server

- (void)collectDBStatsWithCompletion:(id)a3
{
  sub_1C0BABC20(self, (int)a2, a3, (void (*)(void))sub_1C0BD903C);
}

- (void)collectDBStatusWithCompletion:(id)a3
{
  sub_1C0BABC20(self, (int)a2, a3, (void (*)(void))sub_1C0BD9420);
}

- (_TtCC24IntelligencePlatformCore13LighthouseXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore13LighthouseXPC6Server *)LighthouseXPC.Server.init()();
}

@end
