@implementation RecentSearchManager

- (_TtC7NewsUI219RecentSearchManager)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI219RecentSearchManager_observers) = (Class)MEMORY[0x1E0DEE9D8];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[RecentSearchManager init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)readingHistoryDidClear:(id)a3
{
  id v4;
  _TtC7NewsUI219RecentSearchManager *v5;

  v4 = a3;
  v5 = self;
  RecentSearchManager.clearRecentSearches()();

  swift_release();
}

@end
