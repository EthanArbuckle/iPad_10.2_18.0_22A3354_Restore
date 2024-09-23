@implementation PurchaseHistoryAppStateDataSource

- (void)dealloc
{
  void *v3;
  _TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PurchaseHistoryAppStateDataSource();
  -[PurchaseHistoryAppStateDataSource dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1D8374F48((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource_accessQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource_callbackQueue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource_purchaseHistory);
  swift_release();
  swift_release();
}

- (void)purchaseHistoryUpdated:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_1D88CA19C((uint64_t)sub_1D88CA3AC, (uint64_t)&block_descriptor_42_3);

}

- (void)accountsDidChange
{
  _TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource *v2;

  v2 = self;
  sub_1D88C8854();

}

- (_TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource)init
{
  _TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource *result;

  result = (_TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
