@implementation SKAuthenticationRequestEvent

- (_TtC12AppleIDSetup28SKAuthenticationRequestEvent)init
{
  objc_super v3;

  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12AppleIDSetup28SKAuthenticationRequestEvent_passwordType) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12AppleIDSetup28SKAuthenticationRequestEvent_pairingFlags) = 0;
  *(_DWORD *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC12AppleIDSetup28SKAuthenticationRequestEvent_throttleSeconds) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SKAuthenticationRequestEvent();
  return -[SKEvent init](&v3, sel_init);
}

@end
