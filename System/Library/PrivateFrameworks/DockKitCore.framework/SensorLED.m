@implementation SensorLED

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore14SensorLEDState)state
{
  return (_TtC11DockKitCore14SensorLEDState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC11DockKitCore9SensorLED_state));
}

- (void)setState:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore9SensorLED_state);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore9SensorLED_state) = (Class)a3;
  v3 = a3;

}

- (NSString)description
{
  return (NSString *)sub_23A5C0220(self, (uint64_t)a2, (void (*)(void))sub_23A62D6EC);
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _TtC11DockKitCore9SensorLED *v8;

  v5 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore9SensorLED_state);
  v6 = a3;
  v8 = self;
  v7 = (void *)sub_23A690E04();
  objc_msgSend(v6, sel_encodeObject_forKey_, v5, v7);

  sub_23A62DFC8(v6);
}

- (_TtC11DockKitCore9SensorLED)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore9SensorLED *)SensorLED.init(coder:)(a3);
}

- (void).cxx_destruct
{

}

@end
