@implementation ISTimestampedEvent

- (double)timestamp
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___ISTimestampedEvent_timestamp);
}

- (SIOrderedEvent)orderedEvent
{
  return (SIOrderedEvent *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___ISTimestampedEvent_orderedEvent));
}

- (id)dictionaryRepresentation
{
  ISTimestampedEvent *v2;
  void *v3;

  v2 = self;
  sub_21DC4D814();

  v3 = (void *)sub_21DC71A14();
  swift_bridgeObjectRelease();
  return v3;
}

- (ISTimestampedEvent)init
{
  ISTimestampedEvent *result;

  result = (ISTimestampedEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
