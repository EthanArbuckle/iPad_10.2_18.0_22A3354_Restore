@implementation SignInOptionAuthenticationController

- (_TtC14AppleIDSetupUI36SignInOptionAuthenticationController)init
{
  _TtC14AppleIDSetupUI36SignInOptionAuthenticationController *result;

  result = (_TtC14AppleIDSetupUI36SignInOptionAuthenticationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI36SignInOptionAuthenticationController_aidaOwnersManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI36SignInOptionAuthenticationController_aidaSignInController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI36SignInOptionAuthenticationController_navigationController));
  v3 = (char *)self + OBJC_IVAR____TtC14AppleIDSetupUI36SignInOptionAuthenticationController__isBluetoothDisabled;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256426270);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
