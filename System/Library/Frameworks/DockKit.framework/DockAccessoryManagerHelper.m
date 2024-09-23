@implementation DockAccessoryManagerHelper

- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6
{
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  _TtC7DockKit26DockAccessoryManagerHelper *v16;
  id v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_233147CD4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;
  v14[8] = a6;
  v15 = a3;
  v16 = self;
  v17 = v15;
  sub_233129C78((uint64_t)v12, (uint64_t)&unk_256038C70, (uint64_t)v14);

  swift_release();
}

- (void)xpcDisconnected
{
  _TtC7DockKit26DockAccessoryManagerHelper *v2;

  v2 = self;
  sub_2331237A0();

}

- (_TtC7DockKit26DockAccessoryManagerHelper)init
{
  _TtC7DockKit26DockAccessoryManagerHelper *result;

  result = (_TtC7DockKit26DockAccessoryManagerHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_233129614(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_callback));
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger;
  v4 = sub_233147BB4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
