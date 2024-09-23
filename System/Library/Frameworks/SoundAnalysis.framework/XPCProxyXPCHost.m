@implementation XPCProxyXPCHost

- (void)xpcUnsafeSendMessageWithData:(id)a3 proxy:(id)a4 completionHandler:(id)a5
{
  void *v8;
  _TtC13SoundAnalysis15XPCProxyXPCHost *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v8 = _Block_copy(a5);
  swift_unknownObjectRetain();
  v9 = self;
  if (a3)
  {
    v10 = a3;
    a3 = (id)sub_1D4519C54();
    v12 = v11;

  }
  else
  {
    v12 = 0xF000000000000000;
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v8;
  sub_1D431667C((uint64_t)a3, v12, (uint64_t)a4, (uint64_t)sub_1D431B0A4, v13);
  swift_release();
  sub_1D42B8CDC((uint64_t)a3, v12);

  swift_unknownObjectRelease();
}

- (_TtC13SoundAnalysis15XPCProxyXPCHost)init
{
  sub_1D431695C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
