@implementation MOSuggestionActivityRouteAssetView

- (_TtC16MomentsUIService34MOSuggestionActivityRouteAssetView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionActivityRouteAssetView.init(coder:)();
}

- (void)handleTraitChange
{
  void (*v2)(void);
  _TtC16MomentsUIService34MOSuggestionActivityRouteAssetView *v3;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xC8);
  v3 = self;
  v2();

}

- (_TtC16MomentsUIService34MOSuggestionActivityRouteAssetView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService34MOSuggestionActivityRouteAssetView *result;

  result = (_TtC16MomentsUIService34MOSuggestionActivityRouteAssetView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionActivityRouteAssetView", 51, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_routeMap));
  swift_bridgeObjectRelease(*(_QWORD *)&self->routeMap[OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_name]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->routeMap[OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_calories]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->routeMap[OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_distance]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_distanceBlue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_timeYellow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_movePink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_exerciseNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_workoutDataLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_labelStack));
}

@end
