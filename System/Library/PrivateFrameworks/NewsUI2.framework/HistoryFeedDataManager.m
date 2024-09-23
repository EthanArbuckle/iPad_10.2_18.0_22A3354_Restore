@implementation HistoryFeedDataManager

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC7NewsUI222HistoryFeedDataManager *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI222HistoryFeedDataManager_readingList);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[HistoryFeedDataManager dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI222HistoryFeedDataManager_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI222HistoryFeedDataManager_headlineService);
  swift_release();
  swift_release();
  swift_release();
}

- (_TtC7NewsUI222HistoryFeedDataManager)init
{
  _TtC7NewsUI222HistoryFeedDataManager *result;

  result = (_TtC7NewsUI222HistoryFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4
{
  sub_1D681F1D8(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1D6C0F558);
}

- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4
{
  sub_1D681F1D8(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1D6C0F634);
}

- (void)readingHistoryDidClear:(id)a3
{
  id v4;
  _TtC7NewsUI222HistoryFeedDataManager *v5;

  v4 = a3;
  v5 = self;
  sub_1D6C0F710();

}

- (void)readingHistory:(id)a3 didChangeOffensiveStateForArticlesWithIDs:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t ObjectType;
  _TtC7NewsUI222HistoryFeedDataManager *v12;

  v6 = sub_1D6E26D80();
  v7 = a3;
  v12 = self;
  v8 = sub_1D5F0953C(v6);
  v9 = (char *)v12 + OBJC_IVAR____TtC7NewsUI222HistoryFeedDataManager_delegate;
  if (MEMORY[0x1D82919D4]((char *)v12 + OBJC_IVAR____TtC7NewsUI222HistoryFeedDataManager_delegate))
  {
    v10 = *((_QWORD *)v9 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(_TtC7NewsUI222HistoryFeedDataManager *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, &off_1E9B3F9B8, v8, ObjectType, v10);
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

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  uint64_t v8;
  id v9;
  _TtC7NewsUI222HistoryFeedDataManager *v10;

  v8 = sub_1D6E26D80();
  sub_1D6E26D80();
  v9 = a3;
  v10 = self;
  sub_1D6C0F7DC(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
