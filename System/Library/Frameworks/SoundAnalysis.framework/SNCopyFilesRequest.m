@implementation SNCopyFilesRequest

- (SNCopyFilesRequest)initWithServerInfo:(id)a3 serverBasePath:(id)a4 serverFilePaths:(id)a5 localDestinationPath:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = sub_1D451A6EC();
  v9 = v8;
  v10 = sub_1D451A92C();
  v11 = sub_1D451A6EC();
  return (SNCopyFilesRequest *)sub_1D44C43A8((char *)a3, v7, v9, v10, v11, v12);
}

- (SNCopyFilesRequest)init
{
  SNCopyFilesRequest.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D42CB0C4();
  sub_1D42B7204();
  sub_1D4429DE8();
}

@end
