@implementation String:

- (Class)NSObject
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  NSDictionary v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for NSObject);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

- (uint64_t)()
{
  return swift_release();
}

- (void)AnyDatagramChannelStream
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Published<[String : AnyDatagramChannelStream]>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : AnyDatagramChannelStream]);
    v0 = type metadata accessor for Published();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Published<[String : AnyDatagramChannelStream]>);
  }
}

- (uint64_t)Date
{
  swift_bridgeObjectRelease();
  return a1;
}

@end
