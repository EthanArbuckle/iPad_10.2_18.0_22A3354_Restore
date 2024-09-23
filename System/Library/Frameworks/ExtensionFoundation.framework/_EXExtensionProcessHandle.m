@implementation _EXExtensionProcessHandle

- (_EXExtensionProcessHandle)initWithCoder:(id)a3
{
  return (_EXExtensionProcessHandle *)_EXExtensionProcessHandle.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _EXExtensionProcessHandle *v5;

  v4 = a3;
  v5 = self;
  sub_190C2AFC0(v4);

}

- (NSString)description
{
  _EXExtensionProcessHandle *v2;
  void *v3;

  v2 = self;
  sub_190C2A730();

  v3 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  void *v2;
  _EXExtensionProcessHandle *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_assertion);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR____EXExtensionProcessHandle_launchAssertion), sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for _EXExtensionProcessHandle();
  -[_EXExtensionProcessHandle dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();

}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE20C150;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE20C150 = a3;
}

- (_EXExtensionIdentity)extensionIdentity
{
  return (_EXExtensionIdentity *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____EXExtensionProcessHandle_launchConfiguration)
                                                                         + OBJC_IVAR____EXLaunchConfiguration__extensionIdentity));
}

- (_EXLaunchConfiguration)launchConfiguration
{
  return (_EXLaunchConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____EXExtensionProcessHandle_launchConfiguration));
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle), sel_auditToken);
  v5 = v7;
  *(_OWORD *)retstr->var0 = v6;
  *(_OWORD *)&retstr->var0[4] = v5;
  return result;
}

- (int)pid
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle), "pid");
}

- (RBSAssertion)launchAssertion
{
  return (RBSAssertion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____EXExtensionProcessHandle_launchAssertion));
}

- (void)setLaunchAssertion:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_launchAssertion);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_launchAssertion) = (Class)a3;
  v3 = a3;

}

- (RBSAssertion)assertion
{
  return (RBSAssertion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____EXExtensionProcessHandle_assertion));
}

- (void)setAssertion:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_assertion);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_assertion) = (Class)a3;
  v3 = a3;

}

- (RBSProcessIdentity)processIdentity
{
  return (RBSProcessIdentity *)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle), sel_identity);
}

- (void)invalidate
{
  _EXExtensionProcessHandle *v2;

  v2 = self;
  sub_190C8AE5C();

}

- (void)addObserver:(id)a3
{
  sub_190C8AF24(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_addObject_);
}

- (void)removeObserver:(id)a3
{
  sub_190C8AF24(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeObject_);
}

- (id)makeXPCConnectionRetainProcess:(BOOL)a3 error:(id *)a4
{
  _EXExtensionProcessHandle *v5;
  void *v6;

  v5 = self;
  v6 = sub_190C2960C(a3);

  return v6;
}

- (id)makeLibXPCConnectionAndReturnError:(id *)a3
{
  _EXExtensionProcessHandle *v3;
  xpc_connection_t v4;

  v3 = self;
  v4 = sub_190C2D94C();

  return v4;
}

- (id)makeSessionXPCConnection
{
  _EXExtensionProcessHandle *v2;
  id v3;

  v2 = self;
  v3 = sub_190C8B09C();

  return v3;
}

- (BOOL)valid
{
  os_unfair_lock_s *v2;
  _EXExtensionProcessHandle *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_invalidationLock)
                          + 16);
  v3 = self;
  os_unfair_lock_lock(v2);
  v4 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____EXExtensionProcessHandle_assertion);
  if (v4)
    v5 = objc_msgSend(v4, sel_isValid);
  else
    v5 = 0;
  os_unfair_lock_unlock(v2);

  return v5;
}

- (_EXExtensionConfigurationProviding)configuration
{
  return (_EXExtensionConfigurationProviding *)objc_msgSend(*(id *)(*(char **)((char *)&self->super.isa+ OBJC_IVAR____EXExtensionProcessHandle_launchConfiguration)+ OBJC_IVAR____EXLaunchConfiguration__extensionIdentity), sel_configuration);
}

- (_EXExtensionProcessHandle)init
{
  _EXExtensionProcessHandle *result;

  result = (_EXExtensionProcessHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
