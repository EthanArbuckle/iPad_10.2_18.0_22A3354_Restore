@implementation FBACustomBehavior

- (BOOL)makeVisible
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_makeVisible);
}

- (void)setMakeVisible:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_makeVisible) = a3;
}

- (BOOL)notifyOnUpload
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_notifyOnUpload);
}

- (void)setNotifyOnUpload:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_notifyOnUpload) = a3;
}

- (NSNumber)formId
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_formId));
}

- (void)setFormId:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_formId);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_formId) = (Class)a3;
  v3 = a3;

}

- (NSDictionary)answers
{
  uint64_t v2;
  NSDictionary v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_answers);
  if (v2)
  {
    swift_bridgeObjectRetain(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_answers));
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSDictionary *)v3.super.isa;
}

- (void)setAnswers:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  if (a3)
    v4 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Swift.AnyObject + 8, &protocol witness table for String);
  else
    v4 = 0;
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_answers);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_answers) = v4;
  swift_bridgeObjectRelease(v5);
}

- (BOOL)launchNewDraft
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_launchNewDraft);
}

- (void)setLaunchNewDraft:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_launchNewDraft) = a3;
}

- (BOOL)isCaptive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_isCaptive);
}

- (void)setIsCaptive:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_isCaptive) = a3;
}

- (_TtC18Feedback_Assistant17FBACustomBehavior)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Swift.AnyObject + 8, &protocol witness table for String);
  return (_TtC18Feedback_Assistant17FBACustomBehavior *)FBACustomBehavior.init(dictionary:)(v3);
}

- (NSString)description
{
  _TtC18Feedback_Assistant17FBACustomBehavior *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  FBACustomBehavior.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC18Feedback_Assistant17FBACustomBehavior)init
{
  _TtC18Feedback_Assistant17FBACustomBehavior *result;

  result = (_TtC18Feedback_Assistant17FBACustomBehavior *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBACustomBehavior", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_answers));
}

@end
