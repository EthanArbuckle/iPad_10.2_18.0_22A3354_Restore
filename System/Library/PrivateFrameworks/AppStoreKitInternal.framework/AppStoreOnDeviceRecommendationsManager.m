@implementation AppStoreOnDeviceRecommendationsManager

- (id)performRequest:(id)a3
{
  id v5;
  _TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager *v6;
  void *v7;
  void *v8;

  swift_getObjectType();
  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D892B870();
  v8 = (void *)sub_1D892B87C();

  return v8;
}

- (_TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager)init
{
  _TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager *result;

  result = (_TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager_amsEngagement));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager_accountStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager_activeStoreAccount));
  swift_release();
}

@end
