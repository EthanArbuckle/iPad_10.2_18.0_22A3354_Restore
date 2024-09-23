@implementation ModelDownloadRequest

- (NSProgress)progress
{
  return (NSProgress *)ModelDownloadRequest.progress.getter();
}

- (void)downloadWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC6Speech20ModelDownloadRequest *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  ModelDownloadRequest.download(withCompletion:)((uint64_t)sub_1B25593C8, v5);
  swift_release();

}

- (_TtC6Speech20ModelDownloadRequest)init
{
  ModelDownloadRequest.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
