@implementation MRIRRouteRecommendationContext

- (NSSet)candidateResults
{
  return (NSSet *)sub_1AAA7E7CC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___MRIRRouteRecommendationContext_candidateResults, type metadata accessor for RouteRecommendationCandidateResult, &qword_1EEB92AF8);
}

- (void)setCandidateResults:(id)a3
{
  sub_1AAA7E8CC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for RouteRecommendationCandidateResult, &qword_1EEB92AF8, &OBJC_IVAR___MRIRRouteRecommendationContext_candidateResults);
}

- (NSString)contextIdentifier
{
  return (NSString *)sub_1AAA7E5D4();
}

- (void)setContextIdentifier:(id)a3
{
  sub_1AAA7E6A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MRIRRouteRecommendationContext_contextIdentifier);
}

+ (id)fromObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)sub_1AAA7FE94(v3);

  return v4;
}

- (MRIRRouteRecommendationContext)initWithCandidateResults:(id)a3 contextIdentifier:(id)a4
{
  objc_class *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  objc_super v10;

  type metadata accessor for RouteRecommendationCandidateResult();
  sub_1AAA811E8(&qword_1EEB92AF8, type metadata accessor for RouteRecommendationCandidateResult, MEMORY[0x1E0DEFCF8]);
  v5 = (objc_class *)sub_1AAABA5BC();
  v6 = sub_1AAABA478();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationContext_candidateResults) = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MRIRRouteRecommendationContext_contextIdentifier);
  *v7 = v6;
  v7[1] = v8;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RouteRecommendationContext();
  return -[MRIRRouteRecommendationContext init](&v10, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_1AAA7DDF8(self, (uint64_t)a2, type metadata accessor for RouteRecommendationContext, &qword_1EEB92918, (uint64_t)&unk_1AAAD70A8);
}

- (MRIRRouteRecommendationContext)init
{
  MRIRRouteRecommendationContext *result;

  result = (MRIRRouteRecommendationContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
