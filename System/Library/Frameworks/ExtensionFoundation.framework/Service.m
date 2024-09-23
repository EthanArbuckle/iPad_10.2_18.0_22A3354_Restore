@implementation Service

- (void)invalidateLaunchAssertionsForExtensionAuditToken:(id *)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC19ExtensionFoundation7Service *v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = self;
  sub_190C2A858((uint64_t)sub_190C45C28, v6);

  swift_release();
}

- (void)prepareWithLaunchConfiguration:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;
  _TtC19ExtensionFoundation7Service *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_190C2CDEC(v7, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC19ExtensionFoundation7Service *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_190C2DC30(v8);

  swift_unknownObjectRelease();
}

- (_TtC19ExtensionFoundation7Service)init
{
  uint64_t v3;
  id v4;
  _TtC19ExtensionFoundation7Service *v5;
  uint64_t v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC19ExtensionFoundation7Service_discoveryController;
  v4 = objc_allocWithZone((Class)type metadata accessor for _EXDiscoveryController());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR____TtC19ExtensionFoundation7Service_sigtermSource;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)sub_190C6E254();

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for Service();
  return -[Service init](&v8, sel_init);
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

- (void)extensionsWith:(id)a3 reply:(id)a4
{
  _QWORD *v6;
  char *v7;
  _TtC19ExtensionFoundation7Service *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = (char *)a3;
  v8 = self;
  sub_190C6F728(v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)beginExtensionsQuery:(id)a3 listenerEndpoint:(id)a4 reply:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC19ExtensionFoundation7Service *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_190C6FD40(v9, (uint64_t)v10, (char *)v11, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)photoServiceAuthorizationStatusForExtensionUUID:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _TtC19ExtensionFoundation7Service *v11;
  uint64_t v12;

  v6 = sub_190CA84E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_190CA84B8();
  _Block_copy(v10);
  v11 = self;
  sub_190C703B0((uint64_t)v9, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
