@implementation JSArcadeObject

- (id)getMarketingItemFromMarketingItems:(id)a3
{
  id v5;
  _TtC19AppStoreKitInternal14JSArcadeObject *v6;
  void *v7;
  void *v8;

  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D892B870();
  v8 = (void *)sub_1D892B87C();

  return v8;
}

- (id)getMarketingItemWithTimeout:(id)a3 :(id)a4
{
  id v7;
  id v8;
  _TtC19AppStoreKitInternal14JSArcadeObject *v9;
  void *v10;
  void *v11;

  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = (void *)sub_1D892B870();
  v11 = (void *)sub_1D892B87C();

  return v11;
}

- (id)getRecentlyPlayedGamesWithTimeout:(id)a3
{
  id v5;
  _TtC19AppStoreKitInternal14JSArcadeObject *v6;
  void *v7;
  void *v8;

  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D892B870();
  v8 = (void *)sub_1D892B87C();

  return v8;
}

- (id)getDownloadPackGames:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternal14JSArcadeObject *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1D867C7E8(v4);

  return v6;
}

- (_TtC19AppStoreKitInternal14JSArcadeObject)init
{
  _TtC19AppStoreKitInternal14JSArcadeObject *result;

  result = (_TtC19AppStoreKitInternal14JSArcadeObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

}

@end
