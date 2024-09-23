@implementation ViewXPC.Server

- (void)performUpdateForViewNames:(NSArray *)a3 includeDependencies:(BOOL)a4 completion:(id)a5
{
  sub_1C0F0C0A4(self, (int)a2, a3, a4, a5);
}

- (void)accessTokenForViewName:(NSString *)a3 isSandboxed:(BOOL)a4 completion:(id)a5
{
  sub_1C0F0C0A4(self, (int)a2, a3, a4, a5);
}

- (void)accessTokenForFeaturesWithIsSandboxed:(BOOL)a3 completion:(id)a4
{
  void *v6;
  _TtCC24IntelligencePlatformCore7ViewXPC6Server *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1C0F0C110(a3, (uint64_t)v7, v6);
  _Block_release(v6);

}

- (void)reportUnknownErrorForViewName:(NSString *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSString *v8;
  _TtCC24IntelligencePlatformCore7ViewXPC6Server *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF64E2B0, (uint64_t)v7);
}

- (void)reportSQLiteErrorForViewName:(NSString *)a3 sqliteErrorCode:(int64_t)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  _TtCC24IntelligencePlatformCore7ViewXPC6Server *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = self;
  sub_1C0F09A4C((uint64_t)&unk_1EF64E268, (uint64_t)v9);
}

- (_TtCC24IntelligencePlatformCore7ViewXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore7ViewXPC6Server *)ViewXPC.Server.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
