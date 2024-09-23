@implementation HDXPCEventManager

- (HDXPCEventManager)init
{
  HDXPCEventManager *v2;
  id v3;
  uint64_t v4;
  HDXPCEventPublisher *authorizationPublisher;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDXPCEventManager;
  v2 = -[HDXPCEventManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D298F0]);
    v4 = objc_msgSend(v3, "initWithStream:entitlement:", *MEMORY[0x1E0CB47E8], objc_msgSend((id)*MEMORY[0x1E0CB47F0], "UTF8String"));
    authorizationPublisher = v2->_authorizationPublisher;
    v2->_authorizationPublisher = (HDXPCEventPublisher *)v4;

  }
  return v2;
}

- (void)authorizationChangedForBundleIdentifier:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  xpc_object_t xdict;

  v4 = a3;
  xdict = xpc_dictionary_create(0, 0, 0);
  v5 = (const char *)*MEMORY[0x1E0CB47E0];
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  xpc_dictionary_set_string(xdict, v5, v7);
  -[HDXPCEventPublisher broadcastEvent:](self->_authorizationPublisher, "broadcastEvent:", xdict);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationPublisher, 0);
}

@end
