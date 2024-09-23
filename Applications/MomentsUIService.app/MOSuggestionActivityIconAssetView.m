@implementation MOSuggestionActivityIconAssetView

- (_TtC16MomentsUIService33MOSuggestionActivityIconAssetView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionActivityIconAssetView.init(coder:)();
}

- (void)handleTraitChange
{
  void (*v2)(void);
  _TtC16MomentsUIService33MOSuggestionActivityIconAssetView *v3;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x110);
  v3 = self;
  v2();

}

- (_TtC16MomentsUIService33MOSuggestionActivityIconAssetView)initWithFrame:(CGRect)a3
{
  @objc MOSuggestionCutoutView.init(frame:)((uint64_t)self, (uint64_t)a2, (uint64_t)"MomentsUIService.MOSuggestionActivityIconAssetView", 50);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_name]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_calories]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_distance]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_averageHeartRate]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_distanceBlue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_timeYellow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_movePink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_heartRed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_exerciseNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_workoutDataLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_labelStack));
}

@end
