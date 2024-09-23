@implementation MUTransitDeparturesSectionViewProvider

- (BOOL)needsRebuild
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___MUTransitDeparturesSectionViewProvider_needsRebuild;
  swift_beginAccess();
  return *v2;
}

- (void)setNeedsRebuild:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___MUTransitDeparturesSectionViewProvider_needsRebuild;
  swift_beginAccess();
  *v4 = a3;
}

- (MUTransitDeparturesSectionViewProvider)initWithDataSource:(id)a3 userInteractionDelegate:(id)a4
{
  id v4;
  MUTransitDeparturesSectionViewProvider *v5;

  v4 = a3;
  swift_unknownObjectRetain();
  v5 = (MUTransitDeparturesSectionViewProvider *)sub_191E16F3C(v4);

  swift_unknownObjectRelease();
  return v5;
}

- (id)sectionViewsForCurrentState
{
  MUTransitDeparturesSectionViewProvider *v2;
  void *v3;

  v2 = self;
  TransitDeparturesSectionViewProvider.sectionViewsForCurrentState()();

  sub_191E1883C();
  v3 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)filterView:(id)a3 didChangeSystemSelection:(id)a4
{
  id v7;
  MUTransitDeparturesSectionViewProvider *v8;

  swift_unknownObjectRetain_n();
  v7 = a3;
  v8 = self;
  sub_191E0A2F8((uint64_t)a4);

  swift_unknownObjectRelease();
}

- (MUTransitDeparturesSectionViewProvider)init
{
  MUTransitDeparturesSectionViewProvider *result;

  result = (MUTransitDeparturesSectionViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_191DBE818((uint64_t)self + OBJC_IVAR___MUTransitDeparturesSectionViewProvider_userInteractionDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MUTransitDeparturesSectionViewProvider_footerAttributionViewModel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MUTransitDeparturesSectionViewProvider____lazy_storage___systemFilterView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MUTransitDeparturesSectionViewProvider____lazy_storage___overallIncidentsView));
}

@end
