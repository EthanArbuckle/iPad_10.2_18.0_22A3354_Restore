@implementation MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex

- (int64_t)anchorPointIndex
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex);
}

- (_TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex)initWithAnchorPointIndex:(int64_t)a3
{
  return (_TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex *)sub_1B0ADAA04((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex, type metadata accessor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex);
}

- (unint64_t)type
{
  return 12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex)initWithCoder:(id)a3
{
  return (_TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex *)MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  sub_1B0ADAB80(self, (uint64_t)a2, a3, type metadata accessor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex, &OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex);
}

- (_TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex)init
{
  _TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex *result;

  result = (_TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
