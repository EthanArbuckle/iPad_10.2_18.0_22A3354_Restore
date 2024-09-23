@implementation BradycardiaAdvertisableFeatureSource

- (void)dealloc
{
  void *v3;
  _TtC5Heart36BradycardiaAdvertisableFeatureSource *v4;
  objc_super v5;

  v3 = *(void **)(*sub_2312CEA5C((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC5Heart36BradycardiaAdvertisableFeatureSource_heartSettingsUtilityProvider), *(_QWORD *)&self->heartSettingsUtilityProvider[OBJC_IVAR____TtC5Heart36BradycardiaAdvertisableFeatureSource_heartSettingsUtilityProvider])+ 16);
  v4 = self;
  objc_msgSend(v3, sel_removeHeartRhythmAvailabilityObserver_, v4);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for BradycardiaAdvertisableFeatureSource();
  -[BradycardiaAdvertisableFeatureSource dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Heart36BradycardiaAdvertisableFeatureSource_healthStore));

  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart36BradycardiaAdvertisableFeatureSource_heartSettingsUtilityProvider);
  v3 = (char *)self + OBJC_IVAR____TtC5Heart36BradycardiaAdvertisableFeatureSource_identifier;
  v4 = sub_231411D28();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_2312D2854((uint64_t)self + OBJC_IVAR____TtC5Heart36BradycardiaAdvertisableFeatureSource_delegate);
}

- (_TtC5Heart36BradycardiaAdvertisableFeatureSource)init
{
  _TtC5Heart36BradycardiaAdvertisableFeatureSource *result;

  result = (_TtC5Heart36BradycardiaAdvertisableFeatureSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)heartRhythmAvailabilityDidUpdate
{
  _TtC5Heart36BradycardiaAdvertisableFeatureSource *v2;

  v2 = self;
  sub_23132A61C();

}

@end
