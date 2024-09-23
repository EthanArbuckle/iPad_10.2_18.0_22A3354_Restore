@implementation CPBackgroundSessionCreationRequest

- (BOOL)isEqual:(id)a3
{
  CPBackgroundSessionCreationRequest *v4;
  CPBackgroundSessionCreationRequest *v5;
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
  v6 = BackgroundSessionCreationRequest.isEqual(_:)((uint64_t)v8);

  outlined destroy of UUID?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (int64_t)hash
{
  CPBackgroundSessionCreationRequest *v2;
  Swift::Int v3;

  v2 = self;
  v3 = BackgroundSessionCreationRequest.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPBackgroundSessionCreationRequest)initWithCoder:(id)a3
{
  return (CPBackgroundSessionCreationRequest *)BackgroundSessionCreationRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CPBackgroundSessionCreationRequest *v5;

  v4 = a3;
  v5 = self;
  BackgroundSessionCreationRequest.encode(with:)((NSCoder)v4);

}

- (NSString)description
{
  CPBackgroundSessionCreationRequest *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = BackgroundSessionCreationRequest.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1AF4480F4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (CPBackgroundSessionCreationRequest)init
{
  CPBackgroundSessionCreationRequest *result;

  result = (CPBackgroundSessionCreationRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___CPBackgroundSessionCreationRequest_id;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
