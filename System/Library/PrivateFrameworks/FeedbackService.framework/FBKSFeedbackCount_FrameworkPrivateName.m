@implementation FBKSFeedbackCount_FrameworkPrivateName

- (NSData)asJSON
{
  FBKSFeedbackCount_FrameworkPrivateName *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = FBKSFeedbackCount.asJSON.getter();
  v5 = v4;

  v6 = (void *)sub_23B483338();
  sub_23B43ED7C(v3, v5);
  return (NSData *)v6;
}

+ (id)fromJSONWithData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = a3;
  v4 = sub_23B483344();
  v6 = v5;

  v7 = (void *)_s15FeedbackService17FBKSFeedbackCountC8fromJSON4dataACSg10Foundation4DataV_tFZ_0();
  sub_23B43ED7C(v4, v6);
  return v7;
}

- (FBKSCampaign_FrameworkPrivateName)currentCampaign
{
  return (FBKSCampaign_FrameworkPrivateName *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_currentCampaign));
}

- (NSArray)feedbackFiled
{
  return (NSArray *)sub_23B47D7A0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_feedbackFiled, (void (*)(_QWORD))type metadata accessor for FBKSFeedback);
}

- (NSArray)errors
{
  return (NSArray *)sub_23B47D7A0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_errors, (void (*)(_QWORD))type metadata accessor for FBKSCampaignError);
}

- (int64_t)declineCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_declineCount);
}

+ (void)fetchCountsForFormWithIdentifier:(id)a3 completion:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = _Block_copy(a4);
  v5 = sub_23B483434();
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  _s15FeedbackService17FBKSFeedbackCountC18fetchCountsForForm10identifier10completionySS_yACSg_So7NSErrorCSgtctFZ_0(v5, v7, (uint64_t)sub_23B482878, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

- (NSString)debugDescription
{
  return (NSString *)sub_23B480C6C(self, (uint64_t)a2, (void (*)(void))FBKSFeedbackCount.debugDescription.getter);
}

- (NSString)description
{
  return (NSString *)sub_23B480C6C(self, (uint64_t)a2, (void (*)(void))FBKSFeedbackCount.description.getter);
}

- (FBKSFeedbackCount_FrameworkPrivateName)init
{
  FBKSFeedbackCount_FrameworkPrivateName *result;

  result = (FBKSFeedbackCount_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
