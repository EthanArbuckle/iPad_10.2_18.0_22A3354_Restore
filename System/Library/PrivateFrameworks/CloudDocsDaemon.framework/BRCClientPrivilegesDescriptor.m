@implementation BRCClientPrivilegesDescriptor

- (BOOL)hasAuditToken
{
  return self->_hasAuditToken;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (char)_computeCloudEnabledStatusWithoutLogOutStatus
{
  char v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;

  if (-[BRCClientPrivilegesDescriptor isAutomationEntitled](self, "isAutomationEntitled")
    || -[BRCClientPrivilegesDescriptor isProxyEntitled](self, "isProxyEntitled"))
  {
    return 1;
  }
  if (!-[BRCClientPrivilegesDescriptor isAllowedToAccessAnyCloudService](self, "isAllowedToAccessAnyCloudService"))
    return -3;
  if (!-[BRCClientPrivilegesDescriptor isNonAppSandboxed](self, "isNonAppSandboxed"))
  {
    -[BRCClientPrivilegesDescriptor auditToken](self, "auditToken");
    if (!TCCAccessCheckAuditToken())
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BRCClientPrivilegesDescriptor _computeCloudEnabledStatusWithoutLogOutStatus].cold.2();
      v3 = -1;
      goto LABEL_17;
    }
  }
  -[BRCClientPrivilegesDescriptor applicationIdentifier](self, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientPrivilegesDescriptor applicationIdentifier](self, "applicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isCloudSyncAllowed:", v7);

    if ((v8 & 1) == 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BRCClientPrivilegesDescriptor _computeCloudEnabledStatusWithoutLogOutStatus].cold.1();
      v3 = -2;
LABEL_17:

      return v3;
    }
  }
  return 1;
}

- (BRCClientPrivilegesDescriptor)initWithAuditToken:(id *)a3
{
  char *v4;
  char *v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BRCClientPrivilegesDescriptor;
  v4 = -[BRCClientPrivilegesDescriptor init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)a3->var0;
    *(_OWORD *)(v4 + 72) = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)(v4 + 56) = v6;
    v4[26] = 1;
    v14 = *(_OWORD *)a3->var0;
    v15 = *(_OWORD *)&a3->var0[4];
    v7 = (void *)BRCopyEntitlementsForAuditToken();
    BREntitledApplicationIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v8;

    v5[24] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x1E0D10C28], v14, v15);
    v5[25] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x1E0D10C30]);
    if (v5[18])
    {
      v5[17] = 1;
      *(_DWORD *)(v5 + 19) = 16843009;
      v5[23] = 1;
LABEL_10:
      BREntitledContainerIdentifiers();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_finishSetupWithClientContainerIDs:", v12);

      return (BRCClientPrivilegesDescriptor *)v5;
    }
    v5[19] = BRIsEntitledForAnyiCloudService();
    v5[17] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x1E0D10B60]);
    if (v5[24])
    {
      v5[20] = 1;
    }
    else
    {
      v10 = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x1E0D10BA8]);
      v5[20] = v10;
      if (!v10)
      {
        v5[21] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x1E0D10C60]);
        v5[23] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x1E0D10C58]);
        v11 = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x1E0D10C38]);
        goto LABEL_9;
      }
    }
    v11 = 1;
    v5[21] = 1;
    v5[23] = 1;
LABEL_9:
    v5[22] = v11;
    v5[27] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x1E0D10C70]);
    goto LABEL_10;
  }
  return (BRCClientPrivilegesDescriptor *)v5;
}

- (void)_finishSetupWithClientContainerIDs:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *appLibraryIDs;
  NSString *v7;
  NSString *defaultAppLibraryID;
  NSString *applicationIdentifier;
  NSString *v10;
  NSString *debugIdentifier;
  NSString *v12;
  NSString *v13;
  BRCClientPrivilegesDescriptor *v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    appLibraryIDs = self->_appLibraryIDs;
    self->_appLibraryIDs = v5;

    v4 = v15;
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    defaultAppLibraryID = self->_defaultAppLibraryID;
    self->_defaultAppLibraryID = v7;

  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
  {
    v10 = applicationIdentifier;
  }
  else
  {
    if (!-[BRCClientPrivilegesDescriptor hasPid](self, "hasPid"))
      goto LABEL_10;
    -[BRCClientPrivilegesDescriptor pid](self, "pid");
    BRCExecutableNameForProcessIdentifier();
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  debugIdentifier = self->_debugIdentifier;
  self->_debugIdentifier = v10;

LABEL_10:
  if (!self->_debugIdentifier)
  {
    self->_debugIdentifier = (NSString *)CFSTR("Client");

  }
  if (-[BRCClientPrivilegesDescriptor hasPid](self, "hasPid"))
  {
    -[NSString stringByAppendingFormat:](self->_debugIdentifier, "stringByAppendingFormat:", CFSTR("[%d]"), -[BRCClientPrivilegesDescriptor pid](self, "pid"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_debugIdentifier;
    self->_debugIdentifier = v12;

  }
  v14 = self;
  objc_sync_enter(v14);
  v14->_cloudEnabledStatusWithoutLogOutStatus = -[BRCClientPrivilegesDescriptor _computeCloudEnabledStatusWithoutLogOutStatus](v14, "_computeCloudEnabledStatusWithoutLogOutStatus");
  objc_sync_exit(v14);

}

- (BOOL)isProxyEntitled
{
  return self->_isProxyEntitled;
}

- (BOOL)isAutomationEntitled
{
  return self->_isAutomationEntitled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppLibraryID, 0);
  objc_storeStrong((id *)&self->_appLibraryIDs, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
}

- (int)pid
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!-[BRCClientPrivilegesDescriptor hasPid](self, "hasPid"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCClientPrivilegesDescriptor pid].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return self->_auditToken.val[5];
}

- (BOOL)canFetchUserQuota
{
  return self->_isAutomationEntitled || self->_canGetApplicationInfo;
}

- (BRCClientPrivilegesDescriptor)initWithNonSandboxedAppWithAppLibraryIDs:(id)a3 bundleID:(id)a4 auditToken:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  BRCClientPrivilegesDescriptor *v12;
  BRCClientPrivilegesDescriptor *v13;
  __int128 v14;
  void *v15;
  BOOL v16;
  __int128 v17;
  BRCClientPrivilegesDescriptor *v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  v11 = *(_OWORD *)&self->_auditToken.val[4];
  v21 = *(_OWORD *)self->_auditToken.val;
  v22 = v11;
  if ((objc_msgSend(v10, "_isNonSandboxedForAuditToken:", &v21) & 1) != 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)BRCClientPrivilegesDescriptor;
    v12 = -[BRCClientPrivilegesDescriptor init](&v20, sel_init);
    v13 = v12;
    if (v12)
    {
      v12->_isNonAppSandboxed = 1;
      objc_storeStrong((id *)&v12->_applicationIdentifier, a4);
      v13->_isAllowedToAccessAnyCloudService = 1;
      v14 = *(_OWORD *)a5->var0;
      *(_OWORD *)&v13->_auditToken.val[4] = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)v13->_auditToken.val = v14;
      v13->_hasAuditToken = 1;
      *(_DWORD *)&v13->_isProxyEntitled = 16843009;
      objc_msgSend((id)*MEMORY[0x1E0D10C30], "UTF8String");
      v15 = (void *)xpc_copy_entitlement_for_token();
      v16 = MEMORY[0x1D17A7440]() == MEMORY[0x1E0C812D0] && xpc_BOOL_get_value(v15);
      v13->_isBRCTL = v16;
      -[BRCClientPrivilegesDescriptor _finishSetupWithClientContainerIDs:](v13, "_finishSetupWithClientContainerIDs:", v8);

    }
  }
  else
  {
    v17 = *(_OWORD *)&a5->var0[4];
    v21 = *(_OWORD *)a5->var0;
    v22 = v17;
    v13 = -[BRCClientPrivilegesDescriptor initWithAuditToken:](self, "initWithAuditToken:", &v21);
  }
  v18 = v13;

  return v18;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *v3;
  __int128 v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = self;
  if (!BYTE2(self->var0[6]))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCClientPrivilegesDescriptor auditToken].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v5 = *(_OWORD *)&v3[2].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&v3[1].var0[6];
  *(_OWORD *)&retstr->var0[4] = v5;
  return self;
}

- (id)description
{
  return self->_debugIdentifier;
}

+ (BOOL)_isNonSandboxedForAuditToken:(id *)a3
{
  return 0;
}

- (char)cloudEnabledStatusWithHasSession:(BOOL)a3
{
  _BOOL4 v3;
  BRCClientPrivilegesDescriptor *v4;
  char v5;
  char cloudEnabledStatusWithoutLogOutStatus;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v3)
    v5 = 1;
  else
    v5 = -4;
  if (v4->_cloudEnabledStatusWithoutLogOutStatus == 1)
    cloudEnabledStatusWithoutLogOutStatus = v5;
  else
    cloudEnabledStatusWithoutLogOutStatus = v4->_cloudEnabledStatusWithoutLogOutStatus;
  objc_sync_exit(v4);

  return cloudEnabledStatusWithoutLogOutStatus;
}

- (void)updateCloudEnabledStatus
{
  BRCClientPrivilegesDescriptor *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cloudEnabledStatusWithoutLogOutStatus = -[BRCClientPrivilegesDescriptor _computeCloudEnabledStatusWithoutLogOutStatus](obj, "_computeCloudEnabledStatusWithoutLogOutStatus");
  objc_sync_exit(obj);

}

- (BOOL)isNonAppSandboxed
{
  return self->_isNonAppSandboxed;
}

- (BOOL)isAllowedToAccessAnyCloudService
{
  return self->_isAllowedToAccessAnyCloudService;
}

- (BOOL)isSharingProxyEntitled
{
  return self->_isSharingProxyEntitled;
}

- (BOOL)isFolderSharingProxyEntitled
{
  return self->_isFolderSharingProxyEntitled;
}

- (BOOL)isSharingPrivateInterfaceEntitled
{
  return self->_isSharingPrivateInterfaceEntitled;
}

- (BOOL)isBRCTL
{
  return self->_isBRCTL;
}

- (NSSet)appLibraryIDs
{
  return self->_appLibraryIDs;
}

- (NSString)defaultAppLibraryID
{
  return self->_defaultAppLibraryID;
}

- (BOOL)isSyncBubbleClientEntitled
{
  return self->_isSyncBubbleClientEntitled;
}

- (void)pid
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: self.hasPid%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)auditToken
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: _hasAuditToken%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_computeCloudEnabledStatusWithoutLogOutStatus
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] %@ is restricted from sync (TCC)%@");
  OUTLINED_FUNCTION_2();
}

@end
