@implementation __KVOKeyPathBridgeMachinery.BridgeKey

- (int64_t)hash
{
  _TtCC10FoundationP33_6DA0945A07226B3278459E9368612FF427__KVOKeyPathBridgeMachinery9BridgeKey *v2;
  Swift::Int v3;

  v2 = self;
  v3 = __KVOKeyPathBridgeMachinery.BridgeKey.hash.getter();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  _TtCC10FoundationP33_6DA0945A07226B3278459E9368612FF427__KVOKeyPathBridgeMachinery9BridgeKey *v4;
  _TtCC10FoundationP33_6DA0945A07226B3278459E9368612FF427__KVOKeyPathBridgeMachinery9BridgeKey *v5;
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
  v6 = __KVOKeyPathBridgeMachinery.BridgeKey.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (_TtCC10FoundationP33_6DA0945A07226B3278459E9368612FF427__KVOKeyPathBridgeMachinery9BridgeKey)init
{
  _TtCC10FoundationP33_6DA0945A07226B3278459E9368612FF427__KVOKeyPathBridgeMachinery9BridgeKey *result;

  result = (_TtCC10FoundationP33_6DA0945A07226B3278459E9368612FF427__KVOKeyPathBridgeMachinery9BridgeKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
