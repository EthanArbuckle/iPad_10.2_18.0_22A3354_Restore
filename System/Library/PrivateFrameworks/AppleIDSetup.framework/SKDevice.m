@implementation SKDevice

- (_TtC12AppleIDSetup8SKDevice)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup8SKDevice_blePSM) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup8SKDevice_identifier);
  v4 = (objc_class *)type metadata accessor for SKDevice();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[SKDevice init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
