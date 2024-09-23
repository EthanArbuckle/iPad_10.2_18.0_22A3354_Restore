@implementation EntityResolutionXPC.Server

- (void)warmupForMode:(int64_t)a3 withCompletion:(id)a4
{
  void *v6;
  _QWORD *v7;
  _TtCC24IntelligencePlatformCore19EntityResolutionXPC6Server *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF635E30, (uint64_t)v7);
}

- (void)submitQuery:(GDEntityResolutionRequest *)a3 withCompletion:(id)a4
{
  sub_1C09589F0(self, (int)a2, a3, a4, (uint64_t)&unk_1E7A16A58, (uint64_t)&unk_1EF635E20);
}

- (void)submitCollectionQuery:(GDEntityResolutionRequest *)a3 withCompletion:(id)a4
{
  sub_1C09589F0(self, (int)a2, a3, a4, (uint64_t)&unk_1E7A16A30, (uint64_t)&unk_1EF635E10);
}

- (void)generateMentionsForQuery:(NSString *)a3 withCompletion:(id)a4
{
  sub_1C09589F0(self, (int)a2, a3, a4, (uint64_t)&unk_1E7A16A08, (uint64_t)&unk_1EF635E00);
}

- (_TtCC24IntelligencePlatformCore19EntityResolutionXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore19EntityResolutionXPC6Server *)EntityResolutionXPC.Server.init()();
}

@end
