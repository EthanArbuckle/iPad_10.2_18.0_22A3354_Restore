@implementation GCGameControllerActivationContext

- (GCGameControllerActivationContext)initWithPreviousApplication:(id)a3
{
  id v3;
  GCGameControllerActivationContext *v4;
  uint64_t v5;
  NSString *previousApplicationBundleID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCGameControllerActivationContext;
  v3 = a3;
  v4 = -[GCGameControllerActivationContext init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  previousApplicationBundleID = v4->_previousApplicationBundleID;
  v4->_previousApplicationBundleID = (NSString *)v5;

  return v4;
}

- (NSString)previousApplicationBundleID
{
  return self->_previousApplicationBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousApplicationBundleID, 0);
}

- (id)asBSActionWithResponder:(id)a3 error:(id *)a4
{
  id v6;
  GCGameControllerActivationContext *v7;
  void *v8;

  lazy protocol witness table accessor for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition();
  v6 = a3;
  v7 = self;
  v8 = (void *)static UISceneConnectionOptionDefinition.createAction(payload:responder:)();

  return v8;
}

@end
