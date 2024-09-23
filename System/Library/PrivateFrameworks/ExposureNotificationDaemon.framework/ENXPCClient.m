@implementation ENXPCClient

- (NSString)signingIdentity
{
  return self->_signingIdentity;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)entitledToSkipFileSigningVerification
{
  return self->_entitledToSkipFileSigningVerification;
}

- (BOOL)entitledForLogging
{
  return self->_entitledForLogging;
}

- (id)description
{
  id v3;
  id v4;
  ENRegion *appRegion;
  id v6;
  ENRegion *v8;
  id v9;

  -[NSString length](self->_signingIdentity, "length");
  NSAppendPrintF_safe();
  v9 = 0;
  NSAppendPrintF();
  v3 = v9;

  NSAppendPrintF_safe();
  v4 = v3;

  appRegion = self->_appRegion;
  if (appRegion)
  {
    v8 = appRegion;
    NSAppendPrintF_safe();
    v6 = v4;

    v4 = v6;
  }
  return v4;
}

- (int)appAPIVersion
{
  return self->_appAPIVersion;
}

- (void)activateWithAppAPIVersion:(int)a3 regionISO:(id)a4
{
  ENRegion *v5;
  ENRegion *appRegion;

  self->_appAPIVersion = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CAA378], "regionWithCode:", a4);
    v5 = (ENRegion *)objc_claimAutoreleasedReturnValue();
    appRegion = self->_appRegion;
    self->_appRegion = v5;

  }
}

- (int)accessLevel
{
  return self->_accessLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appRegion, 0);
  objc_storeStrong((id *)&self->_signingIdentity, 0);
}

+ (ENXPCClient)clientWithAuditToken:(id *)a3 pid:(int)a4
{
  ENXPCClient *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;

  v5 = objc_alloc_init(ENXPCClient);
  v5->_pid = a4;
  v6 = xpc_copy_code_signing_identity_for_token();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(MEMORY[0x1E0CB3938], "stringWithUTF8String:", v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(v7);
  }
  else
  {
    v8 = 0;
  }
  if (v8)
    v9 = v8;
  else
    v9 = &stru_1E87DD6B8;
  objc_storeStrong((id *)&v5->_signingIdentity, v9);
  v10 = (void *)xpc_copy_entitlement_for_token();
  v11 = v10;
  if (!v10)
    goto LABEL_27;
  if (xpc_dictionary_get_BOOL(v10, "com.apple.private.exposure-notification"))
  {
    v12 = 4;
LABEL_14:
    v5->_accessLevel = v12;
    goto LABEL_15;
  }
  if (xpc_dictionary_get_BOOL(v11, "com.apple.developer.exposure-notification-test"))
  {
    v12 = 3;
    goto LABEL_14;
  }
  if (xpc_dictionary_get_BOOL(v11, "com.apple.developer.exposure-notification"))
  {
    v12 = 2;
    goto LABEL_14;
  }
LABEL_15:
  if (xpc_dictionary_get_BOOL(v11, "com.apple.developer.exposure-notification-test-skip-file-verification"))
    v5->_entitledToSkipFileSigningVerification = 1;
  if (xpc_dictionary_get_BOOL(v11, "com.apple.developer.exposure-notification-logging"))
    v5->_entitledForLogging = 1;
  if (xpc_dictionary_get_BOOL(v11, "com.apple.private.exposure-notification-differential-privacy"))
    v5->_entitledForDifferentialPrivacy = 1;
  if (xpc_dictionary_get_BOOL(v11, "com.apple.private.exposure-notification-bypass-key-release-prompt"))
    v5->_entitledToSkipKeyReleasePrompt = 1;
  if (xpc_dictionary_get_BOOL(v11, "com.apple.private.exposure-notification-test-verification"))
    v5->_entitledForTestVerification = 1;
  if (xpc_dictionary_get_BOOL(v11, "com.apple.private.exposure-notification-show-buddy"))
    v5->_entitledToShowBuddy = 1;
LABEL_27:

  return v5;
}

- (void)setAccessLevel:(int)a3
{
  self->_accessLevel = a3;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setSigningIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ENRegion)appRegion
{
  return self->_appRegion;
}

- (BOOL)entitledForDifferentialPrivacy
{
  return self->_entitledForDifferentialPrivacy;
}

- (void)setEntitledForLogging:(BOOL)a3
{
  self->_entitledForLogging = a3;
}

- (BOOL)entitledForTestVerification
{
  return self->_entitledForTestVerification;
}

- (void)setEntitledToSkipFileSigningVerification:(BOOL)a3
{
  self->_entitledToSkipFileSigningVerification = a3;
}

- (BOOL)entitledToSkipKeyReleasePrompt
{
  return self->_entitledToSkipKeyReleasePrompt;
}

- (void)setEntitledToSkipKeyReleasePrompt:(BOOL)a3
{
  self->_entitledToSkipKeyReleasePrompt = a3;
}

- (BOOL)entitledToShowBuddy
{
  return self->_entitledToShowBuddy;
}

- (void)setEntitledToShowBuddy:(BOOL)a3
{
  self->_entitledToShowBuddy = a3;
}

@end
