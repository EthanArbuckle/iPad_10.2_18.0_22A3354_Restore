@implementation HandyLoggerNeo

+ (void)logAtLevel:(int)a3 withPrivacy:(int)a4 withLogArea:(id)a5 inFile:(id)a6 onLine:(int64_t)a7 message:(id)a8
{
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD v22[4];
  uint64_t v23[4];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  type metadata accessor for HandyLoggerNeo();
  static LogArea.from(description:)(v8, v10, (uint64_t)&v24);
  v18 = v24;
  v17 = v25;
  v23[0] = v24;
  v23[1] = v25;
  v23[2] = v26;
  v23[3] = v27;
  v22[3] = MEMORY[0x24BEE0D00];
  v22[0] = v14;
  v22[1] = v16;
  swift_bridgeObjectRetain();
  static HandyLoggerNeo.log(atLevel:withPrivacy:withLogArea:inFile:onLine:message:withArgs:)(a3, a4, v23, v11, v13, a7, (uint64_t)v22, MEMORY[0x24BEE4AF8]);
  outlined consume of LogArea(v18, v17);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC5Hands14HandyLoggerNeo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HandyLoggerNeo();
  return -[HandyLoggerNeo init](&v3, sel_init);
}

@end
