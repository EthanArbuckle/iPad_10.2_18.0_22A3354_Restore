@implementation LACUIAlertScenePresentationHandler

- (BOOL)canHandle:(id)a3
{
  id v4;
  _TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_userInterfaceRequest);
  v7 = objc_msgSend(v6, sel_identifier);

  v8 = *(uint64_t *)((char *)&v5->super.isa
                  + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration);

  return v8 == v7;
}

- (void)handle:(id)a3 inContext:(id)a4
{
  objc_class *v6;
  LACUserInterfaceRequest *v7;
  LACUIScenePresentationRequest v8;
  Class isa;
  LACUIScenePresentationContext v10;

  v6 = (objc_class *)a3;
  v7 = (LACUserInterfaceRequest *)a4;
  v10.super.isa = (Class)self;
  isa = v10.super.isa;
  v8.super.isa = v6;
  v8._userInterfaceRequest = v7;
  LACUIAlertScenePresentationHandler.handle(request:inContext:)(v8, v10);

}

- (_TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler)init
{
  _TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler *result;

  result = (_TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
