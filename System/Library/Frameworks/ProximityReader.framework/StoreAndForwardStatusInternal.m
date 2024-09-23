@implementation StoreAndForwardStatusInternal

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_25525ED40;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_25525ED40 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader29StoreAndForwardStatusInternal *v5;

  v4 = a3;
  v5 = self;
  StoreAndForwardStatusInternal.encode(with:)((NSCoder)v4);

}

- (_TtC15ProximityReader29StoreAndForwardStatusInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader29StoreAndForwardStatusInternal *)StoreAndForwardStatusInternal.init(coder:)(a3);
}

- (_TtC15ProximityReader29StoreAndForwardStatusInternal)init
{
  _TtC15ProximityReader29StoreAndForwardStatusInternal *result;

  result = (_TtC15ProximityReader29StoreAndForwardStatusInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15ProximityReader29StoreAndForwardStatusInternal_expiry;
  v4 = sub_21C3A77B8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
