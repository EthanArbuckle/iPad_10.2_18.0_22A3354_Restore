@implementation MUPlaceActionDispatcher

- (MUPlaceActionManager)actionManager
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUPlaceActionDispatcher_actionManager);
  swift_beginAccess();
  return (MUPlaceActionManager *)*v2;
}

- (void)setActionManager:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUPlaceActionDispatcher_actionManager);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtP6MapsUI31MUPlaceActionDispatcherDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC6MapsUI23MUPlaceActionDispatcher_delegate;
  swift_beginAccess();
  return (_TtP6MapsUI31MUPlaceActionDispatcherDelegate_ *)(id)MEMORY[0x1940213B8](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC6MapsUI23MUPlaceActionDispatcher)initWithActionManager:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUPlaceActionDispatcher_actionManager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[MUPlaceActionDispatcher init](&v8, sel_init);
}

- (_TtC6MapsUI23MUPlaceActionDispatcher)init
{
  _TtC6MapsUI23MUPlaceActionDispatcher *result;

  result = (_TtC6MapsUI23MUPlaceActionDispatcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_191DBE818((uint64_t)self + OBJC_IVAR____TtC6MapsUI23MUPlaceActionDispatcher_delegate);
}

- (void)performActionFor:(id)a3 completion:(id)a4
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t (*v8)(void);
  _TtC6MapsUI23MUPlaceActionDispatcher *v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (uint64_t (*)(uint64_t))sub_191DCB678;
  }
  else
  {
    v7 = 0;
  }
  v8 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)a3) + 0x50);
  v11 = a3;
  v9 = self;
  v10 = v8();
  if ((MUPlaceActionDispatcher.ActionType.buttonItemType.getter(v10) & 0x100000000) != 0)
    sub_191DCB4B8(v11, v6);
  else
    sub_191DCB350(v11, (void (*)(_QWORD))v6, v7);
  sub_191DCB644((uint64_t)v6);

}

@end
