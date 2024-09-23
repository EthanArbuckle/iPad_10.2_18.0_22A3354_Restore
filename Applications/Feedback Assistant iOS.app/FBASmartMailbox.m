@implementation FBASmartMailbox

- (id)diffableIdentifier
{
  _TtC18Feedback_Assistant15FBASmartMailbox *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10008C968();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

- (_TtC18Feedback_Assistant15FBASmartMailbox)init
{
  return (_TtC18Feedback_Assistant15FBASmartMailbox *)sub_10008DA84(self, (uint64_t)a2, type metadata accessor for FBASmartMailbox);
}

@end
