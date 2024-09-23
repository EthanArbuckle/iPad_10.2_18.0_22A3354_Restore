@implementation LSDRebuildService

void __34___LSDRebuildService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCE0430);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[_LSDRebuildService XPCInterface]::result;
  +[_LSDRebuildService XPCInterface]::result = v2;

  v4 = (void *)+[_LSDRebuildService XPCInterface]::result;
  if (+[_LSDRebuildService XPCInterface]::result
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("LSDRebuildService.mm"), 44, CFSTR("Failed to create XPC interface object.")), v10, (v4 = (void *)+[_LSDRebuildService XPCInterface]::result) != 0))
  {
    XNSGetPropertyListClasses();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_performRebuildRegistration_personaUniqueStrings_reply_, 0, 0);

    v6 = (void *)+[_LSDRebuildService XPCInterface]::result;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_performRebuildRegistration_personaUniqueStrings_reply_, 1, 0);

    objc_msgSend((id)+[_LSDRebuildService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performRebuildRegistration_personaUniqueStrings_reply_, 0, 1);
    objc_msgSend((id)+[_LSDRebuildService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_noteMigratorRunningWithReply_, 0, 1);
  }
}

@end
