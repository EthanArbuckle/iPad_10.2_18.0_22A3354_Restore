@implementation MRIRRouteRecommendationCandidateResult

- (int64_t)classification
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_classification);
  swift_beginAccess();
  return *v2;
}

- (void)setClassification:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_classification);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)classificationDescription
{
  return (NSString *)sub_1AAA7F1D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRIRRouteRecommendationCandidateResult_classificationDescription);
}

- (void)setClassificationDescription:(id)a3
{
  sub_1AAA7F260((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MRIRRouteRecommendationCandidateResult_classificationDescription);
}

- (MRIRRouteRecommendationCandidate)candidate
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_candidate);
  swift_beginAccess();
  return (MRIRRouteRecommendationCandidate *)*v2;
}

- (void)setCandidate:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_candidate);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSNumber)sortingHint
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_sortingHint);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setSortingHint:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_sortingHint);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isCallToAction
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isCallToAction;
  swift_beginAccess();
  return *v2;
}

- (void)setIsCallToAction:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isCallToAction;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isLockScreenControl
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isLockScreenControl;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLockScreenControl:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isLockScreenControl;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isConservativeFiltered
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isConservativeFiltered;
  swift_beginAccess();
  return *v2;
}

- (void)setIsConservativeFiltered:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isConservativeFiltered;
  swift_beginAccess();
  *v4 = a3;
}

- (MRIRRouteRecommendationCandidateResult)initWithClassification:(int64_t)a3 classificationDescription:(id)a4 candidate:(id)a5 sortingHint:(id)a6 isCallToAction:(BOOL)a7 isLockScreenControl:(BOOL)a8 isConservativeFiltered:(BOOL)a9
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  MRIRRouteRecommendationCandidateResult *v19;

  if (a4)
  {
    v14 = sub_1AAABA478();
    v16 = v15;
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  v17 = a5;
  v18 = a6;
  v19 = (MRIRRouteRecommendationCandidateResult *)sub_1AAA805FC(a3, v14, v16, v17, a6, a7, a8, a9);

  return v19;
}

- (NSString)description
{
  return (NSString *)sub_1AAA7DDF8(self, (uint64_t)a2, type metadata accessor for RouteRecommendationCandidateResult, &qword_1EEB92930, (uint64_t)&unk_1AAAD7200);
}

- (MRIRRouteRecommendationCandidateResult)init
{
  MRIRRouteRecommendationCandidateResult *result;

  result = (MRIRRouteRecommendationCandidateResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
