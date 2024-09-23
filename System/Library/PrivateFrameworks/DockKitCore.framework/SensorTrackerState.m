@implementation SensorTrackerState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_23A5C0220(self, (uint64_t)a2, (void (*)(void))sub_23A5F3058);
}

- (_TtC11DockKitCore18SensorTrackerState)initWithState:(int64_t)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore18SensorTrackerState_state) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SensorTrackerState();
  return -[SensorData init](&v4, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC11DockKitCore18SensorTrackerState *v6;
  id v7;

  v4 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore18SensorTrackerState_state);
  v5 = a3;
  v6 = self;
  v7 = (id)sub_23A690E04();
  objc_msgSend(v5, sel_encodeInteger_forKey_, v4, v7);

}

- (_TtC11DockKitCore18SensorTrackerState)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore18SensorTrackerState *)SensorTrackerState.init(coder:)(a3);
}

- (_TtC11DockKitCore18SensorTrackerState)init
{
  _TtC11DockKitCore18SensorTrackerState *result;

  result = (_TtC11DockKitCore18SensorTrackerState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
