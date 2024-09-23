@implementation HeartPromotionAvailability

- (void)dealloc
{
  void *v2;
  _TtC5Heart26HeartPromotionAvailability *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability_heartRhythmAvailability);
  v3 = self;
  objc_msgSend(v2, sel_removeHeartRhythmAvailabilityObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for HeartPromotionAvailability();
  -[HeartPromotionAvailability dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  char *v7;
  uint64_t v8;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability_heartRhythmAvailability));
  v3 = (char *)self + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability__atrialFibrillationAvailabilityResult;
  sub_2313CA8E4(0, &qword_25415D0B0);
  v5 = v4;
  v6 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(v3, v4);
  v7 = (char *)self + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability__aFibBurdenAvailabilityResult;
  sub_2313CA8E4(0, &qword_25415D0B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v6((char *)self + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability__aFibFeaturesAvailabilityResult, v5);
  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability_irregularRhythmNotificationsStatusManager);
  swift_release();
  sub_2312CEBD4((uint64_t)self + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability_aFibBurdenFeatureStatusManager, (uint64_t (*)(_QWORD))sub_2313CAC9C);
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC5Heart26HeartPromotionAvailability)init
{
  _TtC5Heart26HeartPromotionAvailability *result;

  result = (_TtC5Heart26HeartPromotionAvailability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)heartRhythmAvailabilityDidUpdate
{
  _TtC5Heart26HeartPromotionAvailability *v2;

  v2 = self;
  sub_2313C9650();

}

@end
