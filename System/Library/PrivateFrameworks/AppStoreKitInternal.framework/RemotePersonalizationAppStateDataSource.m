@implementation RemotePersonalizationAppStateDataSource

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[RemotePersonalizationAppStateDataSource dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1D8374F48((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource_accessQueue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource_urlSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource_process));
}

- (void)storeAccountDidChange
{
  _TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource *v2;

  v2 = self;
  sub_1D87C5F58();

}

- (void)didCompletePurchase:(id)a3
{
  sub_1D87C6EC0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D87C61CC);
}

- (void)registerPersonalizedAdamIds:(id)a3
{
  sub_1D87C6EC0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D87C6858);
}

- (_TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource)init
{
  _TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource *result;

  result = (_TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
