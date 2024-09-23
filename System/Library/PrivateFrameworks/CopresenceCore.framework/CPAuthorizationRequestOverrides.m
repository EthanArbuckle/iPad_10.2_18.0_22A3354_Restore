@implementation CPAuthorizationRequestOverrides

- (BOOL)isEqual:(id)a3
{
  CPAuthorizationRequestOverrides *v4;
  CPAuthorizationRequestOverrides *v5;
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
  v6 = AuthorizationRequestOverrides.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  CPAuthorizationRequestOverrides *v2;
  Swift::Int v3;

  v2 = self;
  v3 = AuthorizationRequestOverrides.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPAuthorizationRequestOverrides)initWithCoder:(id)a3
{
  id v3;
  CPAuthorizationRequestOverrides *v4;

  v3 = a3;
  v4 = (CPAuthorizationRequestOverrides *)specialized AuthorizationRequestOverrides.init(coder:)(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CPAuthorizationRequestOverrides *v5;

  v4 = a3;
  v5 = self;
  AuthorizationRequestOverrides.encode(with:)((NSCoder)v4);

}

- (CPAuthorizationRequestOverrides)init
{
  CPAuthorizationRequestOverrides *result;

  result = (CPAuthorizationRequestOverrides *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
