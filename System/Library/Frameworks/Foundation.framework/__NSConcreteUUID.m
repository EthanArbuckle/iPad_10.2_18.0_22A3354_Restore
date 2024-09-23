@implementation __NSConcreteUUID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)getUUIDBytes:(char *)a3
{
  __int128 v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR_____NSConcreteUUID__storage);
  if (&v3 < (__int128 *)a3 + 1 && v4 > (_QWORD *)a3)
  {
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *(_OWORD *)a3 = v3;
  }
}

- (Class)classForCoder
{
  type metadata accessor for NSUUID();
  return (Class)swift_getObjCClassFromMetadata();
}

- (__NSConcreteUUID)initWithCoder:(id)a3
{
  return (__NSConcreteUUID *)__NSConcreteUUID.init(coder:)(a3);
}

- (NSString)description
{
  __NSConcreteUUID *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[__NSConcreteUUID UUIDString](v2, sel_UUIDString);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);

  v4 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (NSString)UUIDString
{
  void *v2;

  UUID.uuidString.getter();
  v2 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  __NSConcreteUUID *v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR_____NSConcreteUUID__storage);
  v5 = String._bridgeToObjectiveCImpl()();
  v6 = a3;
  v7 = self;
  objc_msgSend(v6, sel_encodeBytes_length_forKey_, &v8, 16, v5);

  swift_unknownObjectRelease();
}

- (__NSConcreteUUID)initWithUUIDString:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (__NSConcreteUUID *)__NSConcreteUUID.init(uuidString:)();
}

- (__NSConcreteUUID)init
{
  return (__NSConcreteUUID *)__NSConcreteUUID.init()();
}

- (__NSConcreteUUID)initWithUUIDBytes:(const char *)a3
{
  return (__NSConcreteUUID *)__NSConcreteUUID.init(uuidBytes:)((__int128 *)a3);
}

- (NSString)debugDescription
{
  __NSConcreteUUID *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  swift_getObjectType();
  v3 = self;
  closure #1 in __NSConcreteUUID.debugDescription.getter(v3, v6);

  v4 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

@end
