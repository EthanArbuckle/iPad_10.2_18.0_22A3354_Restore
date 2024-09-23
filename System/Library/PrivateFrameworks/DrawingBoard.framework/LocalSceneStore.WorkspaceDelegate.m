@implementation LocalSceneStore.WorkspaceDelegate

- (void)workspace:(id)a3 didAddScene:(id)a4
{
  id v6;
  id v7;
  _TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A6F41F0(v7);

}

- (void)workspace:(id)a3 willRemoveScene:(id)a4
{
  id v6;
  id v7;
  _TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A6F4BC0(v7);

}

- (_TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate__scenes) = (Class)MEMORY[0x24BEE4AF8];
  sub_23A70D030();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LocalSceneStore.WorkspaceDelegate(0);
  return -[LocalSceneStore.WorkspaceDelegate init](&v4, sel_init);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate___observationRegistrar;
  v4 = sub_23A70D03C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
