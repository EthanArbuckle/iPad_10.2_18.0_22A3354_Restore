@implementation ClearSavedCommandHandler

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC8NewsFeed24ClearSavedCommandHandler *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed24ClearSavedCommandHandler_readingList);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[ClearSavedCommandHandler dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24ClearSavedCommandHandler_sceneProvider);
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24ClearSavedCommandHandler_commandCenter);
}

- (_TtC8NewsFeed24ClearSavedCommandHandler)init
{
  _TtC8NewsFeed24ClearSavedCommandHandler *result;

  result = (_TtC8NewsFeed24ClearSavedCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  uint64_t v8;
  id v9;
  _TtC8NewsFeed24ClearSavedCommandHandler *v10;

  if (MEMORY[0x1BCCE5D40]((char *)self + OBJC_IVAR____TtC8NewsFeed24ClearSavedCommandHandler_commandCenter, a2, a3, a4, a5, a6))
  {
    swift_getObjectType();
    v8 = qword_1ED3BA8C8;
    v9 = a3;
    v10 = self;
    if (v8 != -1)
      swift_once();
    sub_1BA82F318(0);
    sub_1BB86FF1C();

    swift_unknownObjectRelease();
  }
}

@end
