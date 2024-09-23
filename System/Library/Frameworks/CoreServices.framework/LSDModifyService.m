@implementation LSDModifyService

void __33___LSDModifyService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCE0F20);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[_LSDModifyService XPCInterface]::result;
  +[_LSDModifyService XPCInterface]::result = v2;

  if (+[_LSDModifyService XPCInterface]::result
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v32 = (id)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("LSDModifyService.mm"), 91, CFSTR("Failed to create XPC interface object.")), v32, +[_LSDModifyService XPCInterface]::result))
  {
    XNSGetPropertyListClasses();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setDatabaseIsSeeded_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_, 3, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_, 4, 0);
    v4 = (void *)+[_LSDModifyService XPCInterface]::result;
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_, 2, 1);

    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_, 4, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unregisterBundleUnit_options_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerContainerURL_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerContainerURL_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateContainerUnit_completionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateContainerUnit_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler_, 3, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler_, 3, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setHandler_version_roles_forContentType_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setHandler_version_roles_forContentType_completionHandler_, 3, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setHandler_version_roles_forContentType_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeHandlerForContentType_roles_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeHandlerForContentType_roles_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setHandler_version_forURLScheme_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setHandler_version_forURLScheme_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setHandler_version_forURLScheme_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeHandlerForURLScheme_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeHandlerForURLScheme_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_resetServerStoreWithCompletionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_, 3, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_, 5, 0);
    v8 = (void *)+[_LSDModifyService XPCInterface]::result;
    pendingSaveTokenInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_, 1, 1);

    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_, 2, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_rebuildApplicationDatabasesForSystem_internal_user_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_installApplication_atURL_withOptions_installType_reply_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_installApplication_atURL_withOptions_installType_reply_, 1, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_installApplication_atURL_withOptions_installType_reply_, 2, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_installApplication_atURL_withOptions_installType_reply_, 0, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_installApplication_atURL_withOptions_installType_reply_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_uninstallApplication_withOptions_uninstallType_reply_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_uninstallApplication_withOptions_uninstallType_reply_, 1, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_uninstallApplication_withOptions_uninstallType_reply_, 0, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_uninstallApplication_withOptions_uninstallType_reply_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unregisterApplicationAtURL_reply_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unregisterApplicationAtURL_reply_, 0, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_refreshContentInFrameworkAtURL_reply_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_refreshContentInFrameworkAtURL_reply_, 0, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unregisterApplicationsAtMountPoint_operationUUID_reply_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unregisterApplicationsAtMountPoint_operationUUID_reply_, 1, 0);
    v10 = (void *)+[_LSDModifyService XPCInterface]::result;
    pendingSaveTokenInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_unregisterApplicationsAtMountPoint_operationUUID_reply_, 0, 1);

    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_unregisterApplicationsAtMountPoint_operationUUID_reply_, 1, 1);
    v12 = (void *)+[_LSDModifyService XPCInterface]::result;
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_setUpdateAvailabilities_completionHandler_, 0, 0);

    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setUpdateAvailabilities_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_garbageCollectDatabaseWithCompletionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_setPreferenceValue_forKey_forApplicationAtURL_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setPreferenceValue_forKey_forApplicationAtURL_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setPreferenceValue_forKey_forApplicationAtURL_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setPreferenceValue_forKey_forApplicationAtURL_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_setPreferenceValueForCallingApplication_forKey_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setPreferenceValueForCallingApplication_forKey_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setPreferenceValueForCallingApplication_forKey_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_, 0, 0);
    v17 = (void *)+[_LSDModifyService XPCInterface]::result;
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_, 1, 0);

    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_, 2, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_, 0, 1);
    v21 = (void *)+[_LSDModifyService XPCInterface]::result;
    pendingSaveTokenInterface();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInterface:forSelector:argumentIndex:ofReply:", v22, sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_, 1, 1);

    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_, 2, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_, 0, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_, 1, 0);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_, 3, 0);
    v23 = (void *)+[_LSDModifyService XPCInterface]::result;
    pendingSaveTokenInterface();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInterface:forSelector:argumentIndex:ofReply:", v24, sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_, 0, 1);

    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performUpdateOfPersonasOfBundleID_toPersonaUniqueStrings_operationUUID_reply_, 0, 0);
    v25 = (void *)+[_LSDModifyService XPCInterface]::result;
    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_performUpdateOfPersonasOfBundleID_toPersonaUniqueStrings_operationUUID_reply_, 1, 0);

    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performUpdateOfPersonasOfBundleID_toPersonaUniqueStrings_operationUUID_reply_, 2, 0);
    v29 = (void *)+[_LSDModifyService XPCInterface]::result;
    pendingSaveTokenInterface();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setInterface:forSelector:argumentIndex:ofReply:", v30, sel_performUpdateOfPersonasOfBundleID_toPersonaUniqueStrings_operationUUID_reply_, 0, 1);

    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performUpdateOfPersonasOfBundleID_toPersonaUniqueStrings_operationUUID_reply_, 1, 1);
    objc_msgSend((id)+[_LSDModifyService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_forceSaveForTestingWithCompletion_, 0, 1);

  }
}

void __34___LSDModifyService_dispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.launchservices.modify-service-queue", v2);
  v1 = (void *)+[_LSDModifyService dispatchQueue]::result;
  +[_LSDModifyService dispatchQueue]::result = (uint64_t)v0;

}

@end
