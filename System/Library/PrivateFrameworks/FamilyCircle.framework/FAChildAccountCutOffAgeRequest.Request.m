@implementation FAChildAccountCutOffAgeRequest.Request

+ (Class)responseClass
{
  type metadata accessor for FAChildAccountCutOffAgeResponse();
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)urlString
{
  _TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request *v2;
  void *v3;

  v2 = self;
  sub_1CAF2007C();

  v3 = (void *)sub_1CAF203DC();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request)initWithURLString:(id)a3
{
  _TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request *result;

  result = (_TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request)init
{
  _TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request *result;

  result = (_TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request_url;
  v3 = sub_1CAF200D0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
