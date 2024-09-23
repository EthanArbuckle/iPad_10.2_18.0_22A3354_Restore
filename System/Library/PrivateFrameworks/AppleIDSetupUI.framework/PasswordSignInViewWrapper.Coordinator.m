@implementation PasswordSignInViewWrapper.Coordinator

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  uint64_t v6;
  id v7;
  _TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator *v8;

  sub_2366EAA8C();
  v6 = sub_236737288();
  v7 = a3;
  v8 = self;
  sub_2366EA818(v6);

  swift_bridgeObjectRelease();
}

- (void)signInControllerDidSkip:(id)a3
{
  void (*v3)(uint64_t);
  id v5;
  uint64_t v6;
  _TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator *v7;

  v3 = (void (*)(uint64_t))(*(_QWORD **)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator_settings))[5];
  if (v3)
  {
    v5 = a3;
    v7 = self;
    v6 = sub_2366E8DD0((uint64_t)v3);
    v3(v6);
    sub_2366E8868((uint64_t)v3);

  }
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4;
  _TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2366EA8F0();

}

- (void)signInControllerDidSelectChildSignIn:(id)a3
{
  id v4;
  _TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2366E9AA4(v4);

}

- (_TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator)init
{
  _TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator *result;

  result = (_TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2366EA518((uint64_t)self+ OBJC_IVAR____TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator__navigationPath);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator_childSetupController));
}

@end
