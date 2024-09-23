@implementation CKDeviceCapability

- (CKDeviceCapability)init
{
  return (CKDeviceCapability *)sub_18A60C76C();
}

- (CKDeviceCapability)initWithLevel:(int)a3 name:(id)a4 value:(id)a5
{
  CKDeviceCapability *result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  CKDeviceCapability.init(level:name:value:)(a3);
  return result;
}

- (NSString)name
{
  sub_18A60F650(self, (uint64_t)a2, (void (*)(void))CKDeviceCapability.name.getter);
}

- (NSString)value
{
  sub_18A60F650(self, (uint64_t)a2, (void (*)(void))CKDeviceCapability.value.getter);
}

- (int)level
{
  return CKDeviceCapability.level.getter();
}

- (id)sqliteRepresentation
{
  sub_18A60F650(self, (uint64_t)a2, (void (*)(void))CKDeviceCapability.sqliteRepresentation());
}

+ (id)fromSqliteRepresentation:(id)a3
{
  void *v3;
  void *v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static CKDeviceCapability.fromSqliteRepresentation(_:)();
  v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)sqliteRepresentations:(id)a3
{
  unint64_t v3;
  Class isa;

  type metadata accessor for CKDeviceCapability((uint64_t)a1);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static CKDeviceCapability.sqliteRepresentations(_:)(v3);
  swift_bridgeObjectRelease();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

+ (id)fromSqliteRepresentations:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  static CKDeviceCapability.fromSqliteRepresentations(_:)(v3);
  v4 = swift_bridgeObjectRelease();
  type metadata accessor for CKDeviceCapability(v4);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  self;
  CKDeviceCapability.encode(with:)((NSCoder)v4);
}

- (CKDeviceCapability)initWithCoder:(id)a3
{
  return (CKDeviceCapability *)CKDeviceCapability.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18A60F094(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKDeviceCapability.isEqual(_:));
}

- (NSString)description
{
  sub_18A60F650(self, (uint64_t)a2, (void (*)(void))CKDeviceCapability.description.getter);
}

- (void).cxx_destruct
{
  sub_18A60FA88(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CKDeviceCapability__wrapped), *(_QWORD *)&self->_wrapped[OBJC_IVAR___CKDeviceCapability__wrapped], *(_QWORD *)&self->_wrapped[OBJC_IVAR___CKDeviceCapability__wrapped + 8]);
}

@end
