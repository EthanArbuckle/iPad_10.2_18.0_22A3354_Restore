@implementation FBATargetedSurvey

+ (void)reportFailureToLaunchFormWithFormIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  static FBKSAdmin.reportFailureToLaunchForm(formIdentifier:completion:)(v3, v4, 0, 0);
  swift_bridgeObjectRelease(v5);
}

- (_TtC18Feedback_Assistant17FBATargetedSurvey)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBATargetedSurvey();
  return -[FBATargetedSurvey init](&v3, "init");
}

@end
