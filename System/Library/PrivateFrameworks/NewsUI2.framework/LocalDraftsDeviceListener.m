@implementation LocalDraftsDeviceListener

- (_TtC7NewsUI225LocalDraftsDeviceListener)init
{
  return (_TtC7NewsUI225LocalDraftsDeviceListener *)sub_1D66E4670();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC7NewsUI225LocalDraftsDeviceListener *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI225LocalDraftsDeviceListener_serviceBrowser);
  v5 = self;
  objc_msgSend(v4, sel_stopBrowsingForPeers);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[LocalDraftsDeviceListener dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI225LocalDraftsDeviceListener_delegate);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI225LocalDraftsDeviceListener____lazy_storage___session));
}

- (void)browser:(id)a3 didNotStartBrowsingForPeers:(id)a4
{
  id v6;
  _TtC7NewsUI225LocalDraftsDeviceListener *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1D66E51B4();

}

- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5
{
  id v8;
  id v9;
  _TtC7NewsUI225LocalDraftsDeviceListener *v10;

  if (a5)
    sub_1D6E267D4();
  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1D66E52F8(v8, v9);

  swift_bridgeObjectRelease();
}

- (void)browser:(id)a3 lostPeer:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI225LocalDraftsDeviceListener *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D66E5484(v7);

}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _TtC7NewsUI225LocalDraftsDeviceListener *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = self;
  v11 = sub_1D6E15C68();
  v13 = v12;

  sub_1D66E55AC();
  sub_1D5F6AEF0(v11, v13);

}

- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  _TtC7NewsUI225LocalDraftsDeviceListener *v22;
  id v23;
  uint64_t v24;

  sub_1D5F53614();
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1D6E26978();
  v17 = v16;
  if (a6)
  {
    sub_1D6E15B78();
    v18 = sub_1D6E15BE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v14, 0, 1, v18);
  }
  else
  {
    v19 = sub_1D6E15BE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v14, 1, 1, v19);
  }
  v20 = a3;
  v21 = a5;
  v22 = self;
  v23 = a7;
  sub_1D66E585C(v15, v17, (uint64_t)v14);

  swift_bridgeObjectRelease();
  sub_1D60178E0((uint64_t)v14);
}

- (void)session:(id)a3 didReceiveCertificate:(id)a4 fromPeer:(id)a5 certificateHandler:(id)a6
{
  _QWORD *v10;
  void (*v11)(_QWORD *, uint64_t);
  id v12;
  id v13;
  _TtC7NewsUI225LocalDraftsDeviceListener *v14;

  v10 = _Block_copy(a6);
  if (a4)
    sub_1D6E26D80();
  v11 = (void (*)(_QWORD *, uint64_t))v10[2];
  v12 = a3;
  v13 = a5;
  v14 = self;
  v11(v10, 1);
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

@end
