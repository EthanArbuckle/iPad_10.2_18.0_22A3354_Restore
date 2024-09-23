@implementation FigCaptureClientApplicationStateMonitorClient

- (FigCaptureClientApplicationStateMonitorClient)initWithAuditToken:(id *)a3 mediaEnvironment:(id)a4 forThirdPartyTorch:(BOOL)a5 applicationAndLayoutStateHandler:(id)a6
{
  FigCaptureClientApplicationStateMonitorClient *v10;
  FigCaptureClientApplicationStateMonitorClient *v11;
  __int128 v12;
  _OWORD v14[2];
  objc_super v15;

  if (!a6)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("An application and layout state handler is required to create this object."), 0));
  }
  v15.receiver = self;
  v15.super_class = (Class)FigCaptureClientApplicationStateMonitorClient;
  v10 = -[FigCaptureClientApplicationStateMonitorClient init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v12 = *(_OWORD *)&a3->var0[4];
    v14[0] = *(_OWORD *)a3->var0;
    v14[1] = v12;
    -[FigCaptureClientApplicationStateMonitorClient _setUpClientInfoWithAuditToken:]((uint64_t)v10, v14);
    v11->_mediaEnvironment = (NSString *)objc_msgSend(a4, "copy");
    v11->_isForThirdPartyTorch = a5;
    v11->_applicationAndLayoutStateHandler = (id)objc_msgSend(a6, "copy");
  }
  return v11;
}

- (void)_setUpClientInfoWithAuditToken:(uint64_t)a1
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  int PIDFromAuditToken;
  const __CFAllocator **v8;
  const __CFAllocator *v9;
  __int128 v10;
  SecTaskRef v11;
  __SecTask *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  int v16;
  void *v17;
  void *v18;
  char v19;
  int v20;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v22;
  _QWORD v23[4];
  audit_token_t token;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (_setUpClientInfoWithAuditToken__onceToken != -1)
      dispatch_once(&_setUpClientInfoWithAuditToken__onceToken, &__block_literal_global_42);
    v4 = a2[1];
    *(_OWORD *)token.val = *a2;
    *(_OWORD *)&token.val[4] = v4;
    *(_QWORD *)(a1 + 8) = +[FigCaptureProcessHandle handleForAuditToken:error:](FigCaptureProcessHandle, "handleForAuditToken:error:", &token, 0);
    v5 = a2[1];
    *(_OWORD *)(a1 + 16) = *a2;
    *(_OWORD *)(a1 + 32) = v5;
    v6 = a2[1];
    *(_OWORD *)token.val = *a2;
    *(_OWORD *)&token.val[4] = v6;
    PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(&token);
    v8 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
    *(_DWORD *)(a1 + 48) = PIDFromAuditToken;
    v9 = *v8;
    v10 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)token.val = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&token.val[4] = v10;
    v11 = SecTaskCreateWithAuditToken(v9, &token);
    if (!v11)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return;
    }
    v12 = v11;
    v22 = 0;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48)), &v22);
    v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "bundle"), "identifier"), "copy");
    *(_QWORD *)(a1 + 56) = v14;
    if (!v14)
      *(_QWORD *)(a1 + 56) = SecTaskCopySigningIdentifier(v12, 0);
    *(_BYTE *)(a1 + 93) = FigCaptureClientIsSwiftPlaygroundsDevelopmentAppWithSecTask(v12) != 0;
    v15 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)token.val = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&token.val[4] = v15;
    if (FigCaptureClientIsAllowedToRunInBackground(&token)
      && objc_msgSend((id)_setUpClientInfoWithAuditToken__sApplicationIDsEligibleForBackgroundCameraAccess, "containsObject:", *(_QWORD *)(a1 + 56)))
    {
      *(_BYTE *)(a1 + 95) = 1;
    }
    if ((objc_msgSend(v13, "isApplication") & 1) != 0
      || objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", 0x1E493D878))
    {
      v16 = 1;
    }
    else if (objc_msgSend((id)_setUpClientInfoWithAuditToken__sLaunchAngelApplicationIDsEligibleForCameraUsage, "containsObject:", *(_QWORD *)(a1 + 56)))
    {
      v16 = 2;
    }
    else if (objc_msgSend(v13, "isXPCService"))
    {
      *(_BYTE *)(a1 + 96) = 1;
      *(_BYTE *)(a1 + 94) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "bundle"), "extensionPointIdentifier"), "isEqualToString:", 0x1E493D958);
      v17 = v13;
      do
      {
        v18 = (void *)objc_msgSend(v17, "hostProcess");
        v17 = (void *)objc_msgSend(v17, "hostProcess");
      }
      while (objc_msgSend(v17, "hostProcess"));
      *(_DWORD *)(a1 + 100) = objc_msgSend(v18, "pid");
      *(_QWORD *)(a1 + 104) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "bundle"), "identifier"), "copy");
      if (FigCaptureClientHasPrivateCaptureEntitlement(v12)
        || (objc_msgSend((id)_setUpClientInfoWithAuditToken__sExtensionApplicationIDsEligibleForCameraUsage, "containsObject:", *(_QWORD *)(a1 + 56)) & 1) != 0|| (objc_msgSend((id)_setUpClientInfoWithAuditToken__sExtensionPointIDsEligibleForCameraUsage, "containsObject:", objc_msgSend((id)objc_msgSend(v13, "bundle"), "extensionPointIdentifier")) & 1) != 0|| objc_msgSend((id)_setUpClientInfoWithAuditToken__sHostApplicationIDsEligibleForCameraUsageInExtension, "containsObject:", *(_QWORD *)(a1 + 104)))
      {
        v16 = 3;
      }
      else
      {
        v16 = 4;
      }
    }
    else if (FigCaptureClientIsRunningInXCTestWithSecTask(v12))
    {
      v16 = 8;
    }
    else
    {
      if (FigCaptureClientIsNonStandardWithSecTask(v12)
        || FigCaptureClientHasPrivateCaptureEntitlement(v12))
      {
        v19 = 0;
      }
      else
      {
        v19 = objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", 0x1E492D178) ^ 1;
      }
      v20 = objc_msgSend((id)_setUpClientInfoWithAuditToken__sNonstandardClientCodeSigningIDsEligibleForCameraUsage, "containsObject:", *(_QWORD *)(a1 + 56));
      if ((v19 & 1) == 0 && v20)
      {
        *(_DWORD *)(a1 + 88) = 6;
        if ((objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", 0x1E493D498) & 1) != 0
          || objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", 0x1E492D178))
        {

          *(_QWORD *)(a1 + 56) = objc_msgSend(CFSTR("com.apple.facetime"), "copy");
          *(_DWORD *)(a1 + 88) = 5;
          v23[0] = 0x1E493D718;
          v23[1] = 0x1E493D5B8;
          v23[2] = CFSTR("com.apple.VideoConference.AVConferenceTestRunneriOS");
          v23[3] = CFSTR("com.apple.AVConferenceTestRunnertvOS");
          *(_QWORD *)(a1 + 128) = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
        }
        goto LABEL_14;
      }
      v16 = 7;
    }
    *(_DWORD *)(a1 + 88) = v16;
LABEL_14:
    CFRelease(v12);
  }
}

- (BOOL)isForThirdPartyTorch
{
  return self->_isForThirdPartyTorch;
}

- (NSString)mediaEnvironment
{
  return self->_mediaEnvironment;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("pid: %d, ID: %@"), self->_pid, self->_applicationID);
  v4 = v3;
  if (self->_mediaEnvironment)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(", mediaEnvironment: %@"), self->_mediaEnvironment);
    if (self->_mediaEnvironmentBundleID)
      objc_msgSend(v4, "appendFormat:", CFSTR(" (%@)"), self->_mediaEnvironmentBundleID);
  }
  if (self->_isXPCService)
    objc_msgSend(v4, "appendFormat:", CFSTR(", host: %@[%d]"), self->_xpcServiceRootHostApplicationID, self->_xpcServiceRootHostPID);
  v5 = self->_clientType - 1;
  if (v5 > 7)
    v6 = CFSTR("--- Undefined client type ---");
  else
    v6 = *(&off_1E4921028 + v5);
  objc_msgSend(v4, "appendFormat:", CFSTR(", clientType: %@"), v6);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
}

- (int)clientType
{
  return self->_clientType;
}

- (BOOL)hasBackgroundCameraAccess
{
  return self->_hasBackgroundCameraAccess;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (int)pid
{
  return self->_pid;
}

- (id)applicationAndLayoutStateHandler
{
  return self->_applicationAndLayoutStateHandler;
}

- (BOOL)isSwiftPlaygroundsDevelopmentApp
{
  return self->_isSwiftPlaygroundsDevelopmentApp;
}

- (NSString)applicationIDToInheritAppStateFrom
{
  return self->_applicationIDToInheritAppStateFrom;
}

- (NSArray)avconferenceClientApplicationIDs
{
  return self->_avconferenceClientApplicationIDs;
}

- (void)invalidate
{

  self->_applicationAndLayoutStateHandler = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[FigCaptureClientApplicationStateMonitorClient invalidate](self, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureClientApplicationStateMonitorClient;
  -[FigCaptureClientApplicationStateMonitorClient dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[FigCaptureClientApplicationStateMonitorClient debugDescription](self, "debugDescription"));
}

uint64_t __80__FigCaptureClientApplicationStateMonitorClient__setUpClientInfoWithAuditToken___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v0 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", 0x1E493D658, 0x1E493D598, 0x1E493D6B8, 0x1E493D838, 0);
  v1 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", 0x1E493D758, 0);
  v2 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", CFSTR("com.apple.AppleAccountUI.AAUIFollowUpExtension"), CFSTR("com.apple.AssetViewer.ASVAssetViewer"), CFSTR("com.apple.ist.colosseum.action.extension"), CFSTR("com.apple.ist.concierge-development.extension-queue"), CFSTR("com.apple.ist.concierge.extension.queue"), CFSTR("com.apple.ist.easypay-uat.extension"), CFSTR("com.apple.ist.easypay.extension"), CFSTR("com.apple.ist.wtb-uat.extension"), CFSTR("com.apple.ist.wtb.extension"), CFSTR("com.apple.ist.runner5.submissionextension"), CFSTR("com.apple.ist.catalog.extension"), CFSTR("com.apple.ist.scanner.extension"), CFSTR("com.apple.ist.mysteryshop.extension"), CFSTR("com.apple.ist.sprinter.extension"), CFSTR("com.apple.MLKit.MLModelPreview"), CFSTR("com.apple.MLKit.MLPackagePreview"), CFSTR("com.apple.NewDeviceOutreach.Extension"),
         CFSTR("com.apple.quicklook.extension.previewUI"),
         CFSTR("com.apple.sidecar.extension.camera"),
         CFSTR("com.apple.tula.extension"),
         0x1E493D5D8,
         CFSTR("com.apple.WebKit.WebContent"),
         CFSTR("com.apple.WebKit.WebContent.Development"),
         CFSTR("com.apple.WebKit.GPU"),
         CFSTR("com.apple.WebKit.GPU.Development"),
         0);
  v3 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", CFSTR("com.apple.ar.viewer"), CFSTR("com.apple.contact-view"), CFSTR("com.apple.diagnostics-restricted-ui-service"), CFSTR("com.apple.gamecenter-services"), CFSTR("com.apple.message-payload-provider"), CFSTR("com.apple.message-payload-provider.highmemory"), CFSTR("com.apple.people-picker"), 0x1E493D958, CFSTR("com.apple.web-browser-engine.gpu"), CFSTR("com.apple.web-browser-engine.rendering"), 0);
  v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", 0x1E493D678, 0x1E493D458, 0x1E493D478, 0x1E493D498, 0x1E493D4B8, CFSTR("com.apple.biometrickitd"), CFSTR("com.apple.CheckerBoard"), CFSTR("com.apple.companionfindlocallyd"), 0x1E493D538, CFSTR("com.apple.FactoryOTAd"), CFSTR("com.apple.facemetricsd"), 0x1E492D178, CFSTR("com.apple.monkeybars"), CFSTR("com.apple.NanoLeash"), CFSTR("com.apple.nearbyd"), 0x1E493D6B8, CFSTR("com.apple.pearloid"),
         CFSTR("com.apple.pebblefusiond"),
         CFSTR("com.apple.peopleawarenessd"),
         CFSTR("com.apple.perceptiond"),
         0x1E493D798,
         CFSTR("com.apple.TVSystemUIService"),
         0);
  v5 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", 0x1E493D658, 0x1E493D598, CFSTR("com.apple.ShortcutsUI"), 0);
  _setUpClientInfoWithAuditToken__sApplicationIDsEligibleForBackgroundCameraAccess = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v0);
  _setUpClientInfoWithAuditToken__sHostApplicationIDsEligibleForCameraUsageInExtension = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v1);
  _setUpClientInfoWithAuditToken__sExtensionApplicationIDsEligibleForCameraUsage = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v2);
  _setUpClientInfoWithAuditToken__sExtensionPointIDsEligibleForCameraUsage = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v3);
  _setUpClientInfoWithAuditToken__sNonstandardClientCodeSigningIDsEligibleForCameraUsage = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v4);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
  _setUpClientInfoWithAuditToken__sLaunchAngelApplicationIDsEligibleForCameraUsage = result;
  return result;
}

- (FigCaptureProcessHandle)processHandle
{
  return self->_processHandle;
}

- (NSString)mediaEnvironmentBundleID
{
  return self->_mediaEnvironmentBundleID;
}

- (void)setMediaEnvironmentBundleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (OS_tcc_identity)mediaEnvironmentTCCIdentity
{
  return self->_mediaEnvironmentTCCIdentity;
}

- (void)setMediaEnvironmentTCCIdentity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (BOOL)isSecureCaptureExtension
{
  return self->_isSecureCaptureExtension;
}

- (BOOL)isXPCService
{
  return self->_isXPCService;
}

- (int)xpcServiceRootHostPID
{
  return self->_xpcServiceRootHostPID;
}

- (NSString)xpcServiceRootHostApplicationID
{
  return self->_xpcServiceRootHostApplicationID;
}

- (int)pidToInheritAppStateFrom
{
  return self->_pidToInheritAppStateFrom;
}

- (void)setPidToInheritAppStateFrom:(int)a3
{
  self->_pidToInheritAppStateFrom = a3;
}

- (void)setApplicationIDToInheritAppStateFrom:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
