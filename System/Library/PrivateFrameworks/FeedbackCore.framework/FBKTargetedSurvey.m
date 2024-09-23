@implementation FBKTargetedSurvey

- (NSString)identifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_21DAC481C();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore17FBKTargetedSurvey_identifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)teamId
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore17FBKTargetedSurvey_teamId);
  swift_beginAccess();
  return *v2;
}

- (void)setTeamId:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore17FBKTargetedSurvey_teamId);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC12FeedbackCore17FBKTargetedSurvey *v4;
  _TtC12FeedbackCore17FBKTargetedSurvey *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_21DAC4BB8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_21DA37940((uint64_t)v8);

  sub_21DA37AB4((uint64_t)v8);
  return v6 & 1;
}

- (_TtC12FeedbackCore17FBKTargetedSurvey)init
{
  _TtC12FeedbackCore17FBKTargetedSurvey *result;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore17FBKTargetedSurvey_teamId) = 0;

  result = (_TtC12FeedbackCore17FBKTargetedSurvey *)sub_21DAC4DA4();
  __break(1u);
  return result;
}

+ (id)inboxTargetedSurveysWithTeamType:(unint64_t)a3
{
  void *v3;

  if (_s12FeedbackCore17FBKTargetedSurveyC20inboxTargetedSurveys8teamTypeShyACGSgSo07FBKTeamI0V_tFZ_0(a3))
  {
    type metadata accessor for FBKTargetedSurvey();
    sub_21DA383CC();
    v3 = (void *)sub_21DAC49CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (void)didFinishSubmissionWithFormIdentifier:(id)a3 feedbackId:(id)a4 isSurvey:(BOOL)a5 error:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v9 = sub_21DAC481C();
  v11 = v10;
  v12 = a4;
  v13 = a6;
  _s12FeedbackCore17FBKTargetedSurveyC19didFinishSubmission14formIdentifier10feedbackId02isD05errorySS_So8NSNumberCSgSbSo7NSErrorCSgtFZ_0(v9, v11, (uint64_t)a4, a5);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
