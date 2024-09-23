@implementation LSDAppProtectionService

void __40___LSDAppProtectionService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCDDF78);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[_LSDAppProtectionService XPCInterface]::result;
  +[_LSDAppProtectionService XPCInterface]::result = v2;

  v4 = (void *)+[_LSDAppProtectionService XPCInterface]::result;
  if (+[_LSDAppProtectionService XPCInterface]::result
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v20 = (id)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("LSDAppProtectionService.m"), 348, CFSTR("Failed to create XPC interface object.")), v20, (v4 = (void *)+[_LSDAppProtectionService XPCInterface]::result) != 0))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:");

    objc_msgSend((id)+[_LSDAppProtectionService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setHiddenApplications_completion_, 0, 1);
    v7 = (void *)+[_LSDAppProtectionService XPCInterface]::result;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:");

    objc_msgSend((id)+[_LSDAppProtectionService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setLockedApplications_completion_, 0, 1);
    v10 = (void *)+[_LSDAppProtectionService XPCInterface]::result;
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:");

    v13 = (void *)+[_LSDAppProtectionService XPCInterface]::result;
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:");

  }
}

@end
