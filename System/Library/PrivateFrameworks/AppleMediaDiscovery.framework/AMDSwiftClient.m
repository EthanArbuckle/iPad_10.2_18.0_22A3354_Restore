@implementation AMDSwiftClient

- (void)queryLLMWithRequestPayload:(NSDictionary *)a3 usecase:(NSString *)a4 capability:(NSString *)a5 completionHandler:(id)a6
{
  NSDictionary *v6;
  NSString *v7;
  NSString *v8;
  _TtC19AppleMediaDiscovery14AMDSwiftClient *v9;
  _QWORD *v10;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v15 = _Block_copy(a6);
  v9 = self;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a5;
  v10[5] = v15;
  v10[6] = self;
  sub_1DC74D468((uint64_t)&unk_1F039A998, (uint64_t)v10);
}

- (_TtC19AppleMediaDiscovery14AMDSwiftClient)init
{
  return (_TtC19AppleMediaDiscovery14AMDSwiftClient *)AMDSwiftClient.init()();
}

@end
