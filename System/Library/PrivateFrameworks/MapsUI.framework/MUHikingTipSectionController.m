@implementation MUHikingTipSectionController

- (NSArray)sectionViews
{
  void *v2;

  sub_191E0922C();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (int)analyticsModuleType
{
  return 44;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUHikingTipSectionController)initWithPlaceItem:(id)a3 tipDelegate:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (MUHikingTipSectionController *)HikingTipSectionController.init(placeItem:tipDelegate:)((uint64_t)a3);
}

- (BOOL)hasContentBeforePersonalizedSuggestionArbitration
{
  unint64_t v2;
  uint64_t v3;
  MUHikingTipSectionController *v5;

  v2 = *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MUHikingTipSectionController__sectionViews);
  if (v2 >> 62)
  {
    v5 = self;
    swift_bridgeObjectRetain();
    v3 = sub_191EEB2D8();

    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v3 != 0;
}

- (BOOL)hasContent
{
  MUHikingTipSectionController *v2;
  MUPersonalizedSuggestionSectionArbiterDelegate *v3;
  unsigned __int8 v4;
  unint64_t v6;
  uint64_t v7;

  v2 = self;
  v3 = -[MUPlaceSectionController personalizedSuggestionsArbiterDelegate](v2, sel_personalizedSuggestionsArbiterDelegate);
  if (v3)
  {
    v4 = -[MUPersonalizedSuggestionSectionArbiterDelegate shouldShowHikingTipSection](v3, sel_shouldShowHikingTipSection);

    swift_unknownObjectRelease();
    return v4;
  }
  else
  {
    v6 = *(unint64_t *)((char *)&v2->super.super.isa + OBJC_IVAR___MUHikingTipSectionController__sectionViews);
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      v7 = sub_191EEB2D8();

      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);

    }
    return v7 != 0;
  }
}

- (void)fetchHikingTip
{
  MUHikingTipSectionController *v2;

  v2 = self;
  HikingTipSectionController.fetchHikingTip()();

}

- (void)tipTapped
{
  uint64_t v3;
  void *v4;
  MUHikingTipSectionController *v5;

  v3 = MEMORY[0x1940213B8]((char *)self + OBJC_IVAR___MUHikingTipSectionController_tipDelegate, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    objc_msgSend(v4, sel_didTapHikingTip_, v5);

    swift_unknownObjectRelease();
  }
}

- (MUHikingTipSectionController)initWithMapItem:(id)a3
{
  id v3;
  MUHikingTipSectionController *result;

  v3 = a3;
  result = (MUHikingTipSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_191DBE818((uint64_t)self + OBJC_IVAR___MUHikingTipSectionController_tipDelegate);
  swift_bridgeObjectRelease();
}

- (CLLocationCoordinate2D)coordinateForTooltip
{
  MUHikingTipSectionController *v2;
  MKMapItem *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CLLocationCoordinate2D result;

  v2 = self;
  v3 = -[MUPlaceSectionController mapItem](v2, sel_mapItem);
  -[MKMapItem _coordinate](v3, sel__coordinate);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

- (BOOL)displayHikingTipWithViewModel:(id)a3
{
  id v4;
  MUHikingTipSectionController *v5;

  v4 = a3;
  v5 = self;
  sub_191E08A34((uint64_t)v4);

  return 1;
}

- (void)requestHikingToolTipRegionIDForLocationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  uint64_t v6;
  void *v7;
  MUHikingTipSectionController *v8;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = MEMORY[0x1940213B8]((char *)self + OBJC_IVAR___MUHikingTipSectionController_tipDelegate, a2);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = self;
    objc_msgSend(v7, sel_requestHikingToolTipRegionIDForLocationCoordinate_, latitude, longitude);

    swift_unknownObjectRelease();
  }
}

@end
