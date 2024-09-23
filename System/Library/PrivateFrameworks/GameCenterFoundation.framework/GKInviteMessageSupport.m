@implementation GKInviteMessageSupport

+ (id)makeInviteMessageDoneWithProperties:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = (uint64_t)a3;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF49A4A8);
    v3 = sub_1BCF1558C();
  }
  v4 = static InviteMessageSupport.makeInviteMessageDone(properties:)(v3);
  v6 = v5;
  swift_bridgeObjectRelease();
  v7 = (void *)sub_1BCF15010();
  sub_1BCEAC4B8(v4, v6);
  return v7;
}

+ (id)extractPropertiesWithData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = sub_1BCF1501C();
  v6 = v5;

  static InviteMessageSupport.extractProperties(data:)(v4, v6);
  v8 = v7;
  sub_1BCEAC4B8(v4, v6);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF49A4A8);
    v9 = (void *)sub_1BCF15580();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (GKInviteMessageSupport)init
{
  return (GKInviteMessageSupport *)InviteMessageSupport.init()();
}

@end
