@implementation CycleTimelineCollectionViewLayoutInvalidationContext

- (NSString)description
{
  _TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext *v2;
  void *v3;

  v2 = self;
  sub_23195F788();

  v3 = (void *)sub_231CA1BD8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext)init
{
  objc_super v3;

  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateItemHeight) = 0;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateZoomArea) = 0;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateForHorizontalSizeChanges) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleTimelineCollectionViewLayoutInvalidationContext();
  return -[CycleTimelineCollectionViewLayoutInvalidationContext init](&v3, sel_init);
}

@end
