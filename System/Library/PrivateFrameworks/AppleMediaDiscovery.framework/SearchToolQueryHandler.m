@implementation SearchToolQueryHandler

- (void)querySearchToolWithSearchtoolQueryConfig:(NSDictionary *)a3 completionHandler:(id)a4
{
  NSDictionary *v4;
  _TtC19AppleMediaDiscovery22SearchToolQueryHandler *v5;
  _QWORD *v6;
  void *v9;

  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_1DC74D468((uint64_t)&unk_1F039AB90, (uint64_t)v6);
}

- (_TtC19AppleMediaDiscovery22SearchToolQueryHandler)init
{
  return (_TtC19AppleMediaDiscovery22SearchToolQueryHandler *)SearchToolQueryHandler.init()();
}

@end
