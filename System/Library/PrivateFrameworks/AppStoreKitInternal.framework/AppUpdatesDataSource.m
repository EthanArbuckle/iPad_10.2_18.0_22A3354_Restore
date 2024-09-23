@implementation AppUpdatesDataSource

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  unint64_t v6;
  _TtC19AppStoreKitInternal20AppUpdatesDataSource *v7;
  id v8;

  sub_1D832F5B8(0, &qword_1EDA3AF50);
  v6 = sub_1D892B060();
  v8 = a3;
  v7 = self;
  sub_1D843C348(v6);
  swift_bridgeObjectRelease();

}

- (_TtC19AppStoreKitInternal20AppUpdatesDataSource)init
{
  _TtC19AppStoreKitInternal20AppUpdatesDataSource *result;

  result = (_TtC19AppStoreKitInternal20AppUpdatesDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal20AppUpdatesDataSource_updatesQuery));
  sub_1D83371E4((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal20AppUpdatesDataSource_lastServerReloadTime, &qword_1EDA3B670);
  swift_bridgeObjectRelease();
}

@end
