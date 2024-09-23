@implementation DockKitCorePairingService

- (_TtC11DockKitCore25DockKitCorePairingService)init
{
  return (_TtC11DockKitCore25DockKitCorePairingService *)DockKitCorePairingService.init()();
}

- (void)dealloc
{
  _TtC11DockKitCore25DockKitCorePairingService *v3;
  objc_super v4;

  swift_unknownObjectWeakAssign();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DockKitCorePairingService();
  v3 = self;
  -[DockKitCorePairingService dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore25DockKitCorePairingService_logger;
  v4 = sub_23A690D14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11DockKitCore25DockKitCorePairingService__xpcConnectionError));

  sub_23A5F234C((uint64_t)self + OBJC_IVAR____TtC11DockKitCore25DockKitCorePairingService__pairingDelegate);
}

- (void)setSetupPayloadWithUri:(NSURL *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSURL *v15;
  _TtC11DockKitCore25DockKitCorePairingService *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A1270;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A03C0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_25699FF10, (uint64_t)v14);
  swift_release();
}

- (void)pairingStatusWithInfo:(id)a3 state:(int64_t)a4 metadata:(id)a5 error:(id)a6
{
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _TtC11DockKitCore25DockKitCorePairingService *v16;

  sub_23A690E1C();
  sub_23A690DBC();
  v9 = (char *)self + OBJC_IVAR____TtC11DockKitCore25DockKitCorePairingService__pairingDelegate;
  v10 = MEMORY[0x23B853C6C]((char *)self + OBJC_IVAR____TtC11DockKitCore25DockKitCorePairingService__pairingDelegate);
  v16 = self;
  v11 = a6;
  swift_unknownObjectRelease();
  if (v10 && (v12 = MEMORY[0x23B853C6C](v9)) != 0)
  {
    v13 = (void *)v12;
    v14 = (void *)sub_23A690E04();
    v15 = (void *)sub_23A690DB0();
    objc_msgSend(v13, sel_pairingStatusWithInfo_state_metadata_error_, v14, a4, v15, v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

}

@end
