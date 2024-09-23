@implementation FBAAvatarHelper

+ (id)monogramForPreferredName:(id)a3 familyName:(id)a4
{
  return sub_100076260((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100076308);
}

- (_TtC18Feedback_Assistant15FBAAvatarHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBAAvatarHelper();
  return -[FBAAvatarHelper init](&v3, "init");
}

+ (id)monogramBarButtonImageForPreferredName:(id)a3 familyName:(id)a4
{
  return sub_100076260((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100076768);
}

+ (id)monogramAvatarImageForPreferredName:(id)a3 familyName:(id)a4
{
  return sub_100076260((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100076994);
}

+ (id)contactImageForEmailAddress:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = sub_100076C48(v3, v4);
  swift_bridgeObjectRelease(v5);
  return v6;
}

@end
