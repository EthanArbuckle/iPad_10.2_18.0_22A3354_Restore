@implementation MRIRRouteRecommendationCandidate

- (NSString)candidateIdentifier
{
  return (NSString *)sub_1AAA7E5D4();
}

- (void)setCandidateIdentifier:(id)a3
{
  sub_1AAA7E6A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MRIRRouteRecommendationCandidate_candidateIdentifier);
}

- (NSSet)nodes
{
  return (NSSet *)sub_1AAA7E7CC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___MRIRRouteRecommendationCandidate_nodes, type metadata accessor for RouteRecommendationNode, &qword_1EEB92AF0);
}

- (void)setNodes:(id)a3
{
  sub_1AAA7E8CC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for RouteRecommendationNode, &qword_1EEB92AF0, &OBJC_IVAR___MRIRRouteRecommendationCandidate_nodes);
}

- (MRIRRouteRecommendationCandidate)init
{
  MRIRRouteRecommendationCandidate *result;

  result = (MRIRRouteRecommendationCandidate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
