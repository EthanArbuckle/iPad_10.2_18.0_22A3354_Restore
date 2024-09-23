@implementation CKShare.BlockedIdentity

- (_TtCE8CloudKitCSo7CKShare15BlockedIdentity)init
{
  sub_18A614784();
}

- (NSString)description
{
  _TtCE8CloudKitCSo7CKShare15BlockedIdentity *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CKShare.BlockedIdentity.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x18D76C7CC](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (id)copyWithZone:(void *)a3
{
  _TtCE8CloudKitCSo7CKShare15BlockedIdentity *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  CKShare.BlockedIdentity.copy(with:)(v6);

  sub_18A608B00(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_18A608B60((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _TtCE8CloudKitCSo7CKShare15BlockedIdentity *v4;
  _TtCE8CloudKitCSo7CKShare15BlockedIdentity *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = CKShare.BlockedIdentity.isEqual(_:)((uint64_t)v8);

  sub_18A60B87C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtCE8CloudKitCSo7CKShare15BlockedIdentity *v2;
  id v3;

  v2 = self;
  v3 = CKShare.BlockedIdentity.hash.getter();

  return (int64_t)v3;
}

- (void).cxx_destruct
{

}

@end
