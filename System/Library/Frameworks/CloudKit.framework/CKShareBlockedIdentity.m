@implementation CKShareBlockedIdentity

- (CKShareBlockedIdentity)init
{
  return (CKShareBlockedIdentity *)sub_18A60AF58();
}

- (CKShareBlockedIdentity)initWithUserIdentity:(id)a3
{
  return (CKShareBlockedIdentity *)CKShareBlockedIdentity.init(userIdentity:)((uint64_t)a3);
}

- (CKUserIdentity)userIdentity
{
  return (CKUserIdentity *)CKShareBlockedIdentity.userIdentity.getter();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CKShareBlockedIdentity *v5;

  v4 = a3;
  v5 = self;
  CKShareBlockedIdentity.encode(with:)((NSCoder)v4);

}

- (CKShareBlockedIdentity)initWithCoder:(id)a3
{
  return (CKShareBlockedIdentity *)CKShareBlockedIdentity.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  CKShareBlockedIdentity *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  CKShareBlockedIdentity.copy(with:)((uint64_t)v3, v6);

  sub_18A608B00(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_18A608B60((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CKShareBlockedIdentity *v4;
  CKShareBlockedIdentity *v5;
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
  v6 = CKShareBlockedIdentity.isEqual(_:)((uint64_t)v8);

  sub_18A60B87C((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  CKShareBlockedIdentity *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CKShareBlockedIdentity.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x18D76C7CC](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void).cxx_destruct
{

}

@end
