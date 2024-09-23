@implementation LSDOpenService

void __31___LSDOpenService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCE1B10);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[_LSDOpenService XPCInterface]::result;
  +[_LSDOpenService XPCInterface]::result = v2;

  if (+[_LSDOpenService XPCInterface]::result
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("LSDOpenService.mm"), 59, CFSTR("Failed to create XPC interface object.")), v12, +[_LSDOpenService XPCInterface]::result))
  {
    _LSGetFrontBoardOptionsDictionaryClasses();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_, 3, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_, 6, 0);
    objc_msgSend(v11, "setByAddingObject:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_, 7, 0);
    v5 = (void *)+[_LSDOpenService XPCInterface]::result;
    _LSOpenResourceOperationDelegateGetXPCInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInterface:forSelector:argumentIndex:ofReply:", v6, sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_, 8, 0);

    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openApplicationWithIdentifier_options_useClientProcessHandle_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_openApplicationWithIdentifier_options_useClientProcessHandle_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openApplicationWithIdentifier_options_useClientProcessHandle_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openURL_fileHandle_options_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openURL_fileHandle_options_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_openURL_fileHandle_options_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openURL_fileHandle_options_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_, 3, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_, 4, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_canOpenURL_publicSchemes_privateSchemes_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_canOpenURL_publicSchemes_privateSchemes_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getURLOverrideForURL_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getURLOverrideForURL_completionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getURLOverrideForURL_completionHandler_, 1, 1);
    v7 = (void *)+[_LSDOpenService XPCInterface]::result;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getiCloudHostNamesWithCompletionHandler_, 0, 1);

    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openAppLink_state_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openAppLink_state_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openAppLink_state_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_failedToOpenApplication_withURL_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_failedToOpenApplication_withURL_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_failedToOpenApplication_withURL_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDOpenService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateRestrictionKnowledgeWithCompletionHandler_, 1, 1);

  }
}

id __39___LSDOpenService_initWithXPCListener___block_invoke()
{
  return +[LSOpenStagingDirectoryManager sharedServerInstance](LSOpenStagingDirectoryManager, "sharedServerInstance");
}

@end
