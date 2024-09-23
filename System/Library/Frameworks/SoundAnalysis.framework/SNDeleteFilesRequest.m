@implementation SNDeleteFilesRequest

- (SNDeleteFilesRequest)initWithFiles:(id)a3 serverBasePath:(id)a4 serverInfo:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1D451A92C();
  v7 = sub_1D451A6EC();
  return (SNDeleteFilesRequest *)sub_1D43633FC(v6, v7, v8, (char *)a5);
}

- (SNDeleteFilesRequest)init
{
  SNDeleteFilesRequest.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D42CB0C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
