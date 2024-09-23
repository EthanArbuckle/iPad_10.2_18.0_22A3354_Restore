@implementation DeviceAppStateDataSource

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC19AppStoreKitInternal24DeviceAppStateDataSource *v8;

  sub_1D832F5B8(0, &qword_1EDA3AF50);
  v6 = sub_1D892B060();
  v7 = a3;
  v8 = self;
  sub_1D866B94C(v6);

  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal24DeviceAppStateDataSource)init
{
  _TtC19AppStoreKitInternal24DeviceAppStateDataSource *result;

  result = (_TtC19AppStoreKitInternal24DeviceAppStateDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal24DeviceAppStateDataSource_logger;
  v4 = sub_1D892AA00();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal24DeviceAppStateDataSource_appQuery));
  sub_1D8374F48((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal24DeviceAppStateDataSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal24DeviceAppStateDataSource_accessQueue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal24DeviceAppStateDataSource_greenTeaLogger));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
