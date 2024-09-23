@implementation CPPresenceSessionCreationRequest

- (BOOL)isEqual:(id)a3
{
  CPPresenceSessionCreationRequest *v4;
  CPPresenceSessionCreationRequest *v5;
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
  v6 = PresenceSessionCreationRequest.isEqual(_:)((uint64_t)v8);

  outlined destroy of UUID?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (int64_t)hash
{
  CPPresenceSessionCreationRequest *v3;
  Swift::UInt v4;
  Swift::Int v5;

  Hasher.init()();
  v3 = self;
  v4 = UUID.hashValue.getter();
  Hasher._combine(_:)(v4);
  Hasher._combine(_:)(*((_BYTE *)&v3->super.isa + OBJC_IVAR___CPPresenceSessionCreationRequest_isCrossAccount));
  v5 = Hasher.finalize()();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPPresenceSessionCreationRequest)initWithCoder:(id)a3
{
  return (CPPresenceSessionCreationRequest *)PresenceSessionCreationRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CPPresenceSessionCreationRequest *v5;
  Class isa;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = self;
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v7 = (void *)MEMORY[0x1AF4480F4](25705, 0xE200000000000000);
  objc_msgSend(v4, sel_encodeObject_forKey_, isa, v7);

  v8 = *((unsigned __int8 *)&v5->super.isa + OBJC_IVAR___CPPresenceSessionCreationRequest_isCrossAccount);
  v9 = (id)MEMORY[0x1AF4480F4](0x4173736F72437369, 0xEE00746E756F6363);
  objc_msgSend(v4, sel_encodeBool_forKey_, v8, v9);

}

- (NSString)description
{
  CPPresenceSessionCreationRequest *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = PresenceSessionCreationRequest.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1AF4480F4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (CPPresenceSessionCreationRequest)init
{
  CPPresenceSessionCreationRequest *result;

  result = (CPPresenceSessionCreationRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___CPPresenceSessionCreationRequest_id;
  v3 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
