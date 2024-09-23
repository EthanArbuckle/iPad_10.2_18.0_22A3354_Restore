@implementation FBKSInteraction

- (NSString)description
{
  void *v2;

  sub_23B465F10();
  v2 = (void *)sub_23B483428();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC15FeedbackService15FBKSInteraction)init
{
  _TtC15FeedbackService15FBKSInteraction *result;

  result = (_TtC15FeedbackService15FBKSInteraction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23B45B370(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain), *(_QWORD *)&self->featureDomain[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B45A430(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent), *(_QWORD *)&self->featureDomain[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent], *(_QWORD *)&self->featureDomain[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent + 8], *(_QWORD *)&self->_bundleID[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent], self->_bundleID[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent + 8]);
  sub_23B45A430(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent), *(_QWORD *)&self->featureDomain[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent], *(_QWORD *)&self->featureDomain[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent + 8], *(_QWORD *)&self->_bundleID[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent], self->_bundleID[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent + 8]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B448B30((uint64_t)self + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID, &qword_256A1A650);
}

@end
