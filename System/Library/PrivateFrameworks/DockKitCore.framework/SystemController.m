@implementation SystemController

- (_TtC11DockKitCore16SystemController)initWithAccessory:(id)a3 id:(int64_t)a4 type:(int64_t)a5 name:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  _TtC11DockKitCore16SystemController *v15;
  objc_super v17;

  v10 = sub_23A690E1C();
  v12 = v11;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore6System_components) = (Class)MEMORY[0x24BEE4B00];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore6System_id) = (Class)a4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore6System_type) = (Class)a5;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11DockKitCore6System_name);
  *v13 = v10;
  v13[1] = v12;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for System();
  v14 = a3;
  v15 = -[System init](&v17, sel_init);
  swift_unknownObjectWeakAssign();

  return v15;
}

- (_TtC11DockKitCore16SystemController)initWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore16SystemController *v5;

  swift_unknownObjectWeakInit();
  v4 = a3;
  v5 = (_TtC11DockKitCore16SystemController *)sub_23A62F264();

  return v5;
}

- (_TtC11DockKitCore16SystemController)initWithId:(int64_t)a3 type:(int64_t)a4 name:(id)a5
{
  _TtC11DockKitCore16SystemController *result;

  result = (_TtC11DockKitCore16SystemController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
