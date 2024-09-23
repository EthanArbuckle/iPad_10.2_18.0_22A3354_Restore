@implementation SavedFeedDataManager

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC7NewsUI220SavedFeedDataManager *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI220SavedFeedDataManager_readingList);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[SavedFeedDataManager dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI220SavedFeedDataManager_delegate);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220SavedFeedDataManager_dataProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220SavedFeedDataManager_headlineService);

  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220SavedFeedDataManager_historyService);
}

- (_TtC7NewsUI220SavedFeedDataManager)init
{
  _TtC7NewsUI220SavedFeedDataManager *result;

  result = (_TtC7NewsUI220SavedFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC7NewsUI220SavedFeedDataManager *v11;

  v8 = sub_1D6E26D80();
  v9 = sub_1D6E26D80();
  v10 = a3;
  v11 = self;
  sub_1D60942EC(v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
