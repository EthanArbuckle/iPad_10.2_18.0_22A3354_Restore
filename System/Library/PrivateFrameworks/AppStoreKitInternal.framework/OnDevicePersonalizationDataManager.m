@implementation OnDevicePersonalizationDataManager

- (void)appEnteredWhileAppeared
{
  _TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager *v2;

  v2 = self;
  sub_1D8349068();

}

- (void)storeAccountDidChange
{
  _TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager *v2;

  v2 = self;
  sub_1D8803BF0();

}

- (_TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager)init
{
  _TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager *result;

  result = (_TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_accountStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_requestQueue));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_amsEngagement));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_dataCacheAvailabilityConditionLock));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_activeStoreAccount));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_timeoutTimer));
}

@end
