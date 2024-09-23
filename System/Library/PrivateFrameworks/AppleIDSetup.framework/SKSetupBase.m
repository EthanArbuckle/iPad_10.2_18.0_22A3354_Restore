@implementation SKSetupBase

- (_TtC12AppleIDSetup11SKSetupBase)init
{
  return (_TtC12AppleIDSetup11SKSetupBase *)SKSetupBase.init()();
}

- (void).cxx_destruct
{
  sub_23646A42C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_authTagOverride), *(_QWORD *)&self->authTagOverride[OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_authTagOverride]);

  sub_236450690(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_eventHandler));
  swift_bridgeObjectRelease();
  sub_236450690(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_passwordTypeChangedHandler));

  sub_23646A42C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_pskData), *(_QWORD *)&self->authTagOverride[OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_pskData]);
  swift_bridgeObjectRelease();
}

@end
