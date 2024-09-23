@implementation OnDeviceSearchHistoryManager

- (id)fetchRecentsWithLimit:(int64_t)a3
{
  _TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager *v4;
  void *v5;
  void *v6;

  sub_1D8501868();
  v4 = self;
  v5 = (void *)sub_1D892B870();
  v6 = (void *)sub_1D892B87C();

  return v6;
}

- (void)saveRecentSearchWithLimit:(id)a3 :(int64_t)a4
{
  id v6;
  _TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager *v7;
  void *v8;
  void *v9;

  sub_1D8501868();
  v6 = a3;
  v7 = self;
  v8 = (void *)sub_1D892B870();
  v9 = (void *)sub_1D892B87C();

}

- (void)removeRecentSearchTerm:(id)a3
{
  _TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager *v4;
  void *v5;
  void *v6;

  sub_1D892ADB4();
  sub_1D8501868();
  v4 = self;
  v5 = (void *)sub_1D892B870();
  v6 = (void *)sub_1D892B87C();

  swift_bridgeObjectRelease();
}

- (void)clearRecents
{
  _TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager *v3;
  void *v4;
  void *v5;

  sub_1D8501868();
  v3 = self;
  v4 = (void *)sub_1D892B870();
  v5 = (void *)sub_1D892B87C();

}

- (_TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager)init
{
  _TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager *result;

  result = (_TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager_defaults));
  swift_bridgeObjectRelease();
  swift_release();
}

@end
