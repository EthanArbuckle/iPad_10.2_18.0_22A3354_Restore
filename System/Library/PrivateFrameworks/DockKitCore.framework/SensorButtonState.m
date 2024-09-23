@implementation SensorButtonState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_23A5C0220(self, (uint64_t)a2, (void (*)(void))sub_23A6337FC);
}

- (_TtC11DockKitCore17SensorButtonState)initWithState:(int64_t)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore17SensorButtonState_state) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SensorButtonState();
  return -[SensorData init](&v4, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC11DockKitCore17SensorButtonState *v6;
  id v7;

  v4 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore17SensorButtonState_state);
  v5 = a3;
  v6 = self;
  v7 = (id)sub_23A690E04();
  objc_msgSend(v5, sel_encodeInteger_forKey_, v4, v7);

}

- (_TtC11DockKitCore17SensorButtonState)initWithCoder:(id)a3
{
  id v3;
  _TtC11DockKitCore17SensorButtonState *v4;

  v3 = a3;
  v4 = (_TtC11DockKitCore17SensorButtonState *)sub_23A63420C(v3);

  return v4;
}

- (_TtC11DockKitCore17SensorButtonState)init
{
  _TtC11DockKitCore17SensorButtonState *result;

  result = (_TtC11DockKitCore17SensorButtonState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
