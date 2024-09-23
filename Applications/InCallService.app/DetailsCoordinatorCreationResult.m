@implementation DetailsCoordinatorCreationResult

- (int64_t)outcome
{
  return sub_100112348();
}

- (CNKCallDetailsCoordinatorProtocol)coordinator
{
  return (CNKCallDetailsCoordinatorProtocol *)(id)sub_100112378();
}

- (_TtC13InCallService32DetailsCoordinatorCreationResult)initWithOutcome:(int64_t)a3 coordinator:(id)a4
{
  swift_unknownObjectRetain(a4);
  return (_TtC13InCallService32DetailsCoordinatorCreationResult *)sub_100112388(a3, (uint64_t)a4);
}

- (_TtC13InCallService32DetailsCoordinatorCreationResult)init
{
  DetailsCoordinatorCreationResult.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13InCallService32DetailsCoordinatorCreationResult_coordinator));
}

@end
