@implementation CalendarLayoutInvalidationContext

- (_TtC8HealthUI33CalendarLayoutInvalidationContext)init
{
  objc_super v3;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8HealthUI33CalendarLayoutInvalidationContext_shouldInvalidateAllDecorationViews) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CalendarLayoutInvalidationContext();
  return -[UICollectionViewFlowLayoutInvalidationContext init](&v3, sel_init);
}

@end
