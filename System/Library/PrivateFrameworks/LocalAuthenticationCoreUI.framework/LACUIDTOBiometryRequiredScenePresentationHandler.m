@implementation LACUIDTOBiometryRequiredScenePresentationHandler

- (BOOL)canHandle:(id)a3
{
  id v4;
  _TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler *v5;
  id v6;
  unsigned int v7;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_userInterfaceRequest);
  v7 = objc_msgSend(v6, sel_identifier);

  return v7 == 5;
}

- (void)handle:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  _TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(v7);

}

- (_TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler)init
{
  _TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler *result;

  result = (_TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
