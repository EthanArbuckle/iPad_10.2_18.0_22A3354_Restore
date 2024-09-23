@implementation _EXExtensionProcess

- (void)invalidateLaunchAssertion
{
  objc_msgSend(*(id *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle)+ OBJC_IVAR____EXExtensionProcessHandle_assertion), sel_invalidate);
}

- (id)newXPCConnectionWithError:(id *)a3
{
  _EXExtensionProcess *v3;
  void *v4;

  v3 = self;
  v4 = sub_190C2960C(1);

  return v4;
}

- (void).cxx_destruct
{

}

- (void)dealloc
{
  _EXExtensionProcess *v2;

  v2 = self;
  _EXExtensionProcess.__deallocating_deinit();
}

- (id)makeLibXPCConnectionWithError:(id *)a3
{
  _EXExtensionProcess *v3;
  xpc_connection_t v4;

  v3 = self;
  v4 = sub_190C2D94C();

  return v4;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)objc_msgSend(*(id *)(*(char **)((char *)&self->super.isa+ OBJC_IVAR____EXExtensionProcess__processHandle)+ OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle), sel_auditToken);
  v5 = v7;
  *(_OWORD *)retstr->var0 = v6;
  *(_OWORD *)&retstr->var0[4] = v5;
  return result;
}

- (void)invalidate
{
  _EXExtensionProcess *v2;

  v2 = self;
  sub_190C2EF5C();

}

+ (void)extensionProcessWithConfiguration:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  _s19ExtensionFoundation19_EXExtensionProcessC09extensionD013configuration17completionHandleryAA20_EXHostConfigurationC_yACSg_So7NSErrorCSgtctFZ_0(v7, (uint64_t)sub_190C32880, v6);

  swift_release();
}

+ (id)extensionProcessWithConfiguration:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  sub_190C32894(v4);
  v6 = v5;

  return v6;
}

- (_EXExtensionProcess)initWithInternalExtensionProcess:(id)a3
{
  id v3;
  char *v4;
  id v5;
  _EXExtensionProcess *v6;

  v3 = a3;
  v4 = sub_190C802EC();
  v5 = objc_allocWithZone((Class)type metadata accessor for _EXExtensionProcess());
  v6 = (_EXExtensionProcess *)sub_190C357D4(v3, v4);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  _EXExtensionProcess *v3;
  void *v4;

  v3 = self;
  v4 = sub_190C2960C(0);

  return v4;
}

- (BOOL)isValid
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  _EXExtensionProcess *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle);
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(v2 + OBJC_IVAR____EXExtensionProcessHandle_invalidationLock) + 16);
  v4 = self;
  os_unfair_lock_lock(v3);
  v5 = *(void **)(v2 + OBJC_IVAR____EXExtensionProcessHandle_assertion);
  if (v5)
    v6 = objc_msgSend(v5, sel_isValid);
  else
    v6 = 0;
  os_unfair_lock_unlock(v3);

  return v6;
}

- (int)pid
{
  return objc_msgSend(*(id *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle)+ OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle), "pid");
}

- (_EXHostConfiguration)configuration
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess_configuration);
  swift_beginAccess();
  return (_EXHostConfiguration *)*v2;
}

- (void)setConfiguration:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess_configuration);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_EXExtensionProcessHandle)internalExtensionProcess
{
  return (_EXExtensionProcessHandle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR____EXExtensionProcess__processHandle));
}

- (BOOL)matchesProcess:(id)a3
{
  _EXExtensionProcess *v3;
  void *v4;
  id v5;
  _EXExtensionProcess *v6;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v3 = self;
  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle)
                + OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle);
  v5 = a3;
  v6 = v3;
  objc_msgSend(v4, sel_auditToken);
  objc_msgSend(v5, sel_auditToken);
  LOBYTE(v3) = _EXAuditTokenEqual(&v9, &v8);

  return (char)v3;
}

- (id)processPredicate
{
  void *v2;
  _EXExtensionProcess *v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle)
                + OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle);
  v3 = self;
  objc_msgSend(v2, "pid");
  v4 = (void *)sub_190CA8C38();
  v5 = objc_msgSend((id)objc_opt_self(), sel_predicateMatchingIdentifier_, v4);

  return v5;
}

- (int)rbs_pid
{
  return objc_msgSend(*(id *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle)+ OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle), "pid");
}

- (_EXExtensionProcess)init
{
  _EXExtensionProcess *result;

  result = (_EXExtensionProcess *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
