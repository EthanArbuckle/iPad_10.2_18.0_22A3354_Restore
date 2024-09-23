@implementation SNFileServer

- (SNFileServer)initWithRootDirectory:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1D451A6EC();
  return (SNFileServer *)sub_1D43E2F9C(v3, v4);
}

- (void)activateWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  SNFileServer *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1D43E5654((uint64_t)&unk_1EFE50168, v5);
}

- (SNFileServer)init
{
  SNFileServer.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
