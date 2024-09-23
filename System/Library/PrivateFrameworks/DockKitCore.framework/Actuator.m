@implementation Actuator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_23A5C0220(self, (uint64_t)a2, (void (*)(void))Actuator.description.getter);
}

- (_TtC11DockKitCore8Actuator)initWithId:(int64_t)a3 name:(id)a4 type:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_23A690E1C();
  return (_TtC11DockKitCore8Actuator *)Actuator.init(id:name:type:)(a3, v7, v8, a5);
}

- (_TtC11DockKitCore8Actuator)initWithId:(int64_t)a3 type:(int64_t)a4 name:(id)a5 minPosition:(double)a6 maxPosition:(double)a7 maxSpeed:(double)a8 maxAcceleration:(double)a9 homePosition:(double)a10 controlParams:(id)a11 cameraLimits:(id)a12
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v19 = sub_23A690E1C();
  v21 = v20;
  v22 = sub_23A690DBC();
  type metadata accessor for CameraLimit();
  v23 = sub_23A690F18();
  return (_TtC11DockKitCore8Actuator *)Actuator.init(id:type:name:minPosition:maxPosition:maxSpeed:maxAcceleration:homePosition:controlParams:cameraLimits:)(a3, a4, v19, v21, v22, v23, a6, a7, a8, a9, a10);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore8Actuator *v5;

  v4 = a3;
  v5 = self;
  Actuator.encode(with:)((NSCoder)v4);

}

- (_TtC11DockKitCore8Actuator)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore8Actuator *)Actuator.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
