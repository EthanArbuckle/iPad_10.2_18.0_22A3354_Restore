@implementation HDXPCProcess

- (_HKEntitlements)entitlements
{
  return self->_entitlements;
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (NSString)name
{
  NSString *name;
  NSString *bundleIdentifier;

  name = self->_name;
  if (name)
    return name;
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    return bundleIdentifier;
  else
    return (NSString *)CFSTR("Unknown");
}

- (NSString)applicationIdentifier
{
  return (NSString *)-[_HKEntitlements applicationIdentifier](self->_entitlements, "applicationIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_containerAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_droppedEntitlements, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)hasRequiredArrayEntitlement:(id)a3 containing:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a3;
  v9 = a4;
  v10 = -[HDXPCProcess hasArrayEntitlement:containing:](self, "hasArrayEntitlement:containing:", v8, v9);
  if (!v10)
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a5, 4, CFSTR("Missing %@[%@] entitlement."), v8, v9);

  return v10;
}

- (BOOL)hasArrayEntitlement:(id)a3 containing:(id)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a4;
  -[HDXPCProcess valueForEntitlement:](self, "valueForEntitlement:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = objc_msgSend(v7, "containsObject:", v6);
  else
    v8 = 0;

  return v8;
}

- (BOOL)hasRequiredEntitlement:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = -[HDXPCProcess hasEntitlement:](self, "hasEntitlement:", v6);
  if (!v7)
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 4, CFSTR("Missing %@ entitlement."), v6);

  return v7;
}

- (BOOL)hasEntitlement:(id)a3
{
  void *v3;
  char isKindOfClass;

  -[HDXPCProcess valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)valueForEntitlement:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_droppedEntitlements, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[_HKEntitlements valueForEntitlement:](self->_entitlements, "valueForEntitlement:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int)processIdentifier
{
  return -[_HKXPCAuditToken processIdentifier](self->_auditToken, "processIdentifier");
}

- (HDXPCProcess)initWithAuditToken:(id)a3 entitlements:(id)a4 isExtension:(BOOL)a5 containerAppBundleIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDXPCProcess *v13;
  uint64_t v14;
  _HKXPCAuditToken *v15;
  id v16;
  int v17;
  uint64_t v18;
  int v19;
  void *v20;
  NSString *name;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *bundleIdentifier;
  uint64_t v28;
  NSString *containerAppBundleIdentifier;
  objc_super v31[2];
  objc_super v32;
  audit_token_t audittoken;
  _BYTE buffer[1024];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)HDXPCProcess;
  v13 = -[HDXPCProcess init](&v32, sel_init);
  if (!v13)
    goto LABEL_19;
  v14 = objc_msgSend(v10, "copy");
  v15 = v13->_auditToken;
  v13->_auditToken = (_HKXPCAuditToken *)v14;

  objc_storeStrong((id *)&v13->_entitlements, a4);
  v16 = v10;
  if (HDXPCProcessNameFromAuditToken_onceToken != -1)
    dispatch_once(&HDXPCProcessNameFromAuditToken_onceToken, &__block_literal_global_3);
  if (!HDXPCProcessNameFromAuditToken_pidInfoAllowed)
    goto LABEL_11;
  v17 = proc_name(objc_msgSend(v16, "processIdentifier"), buffer, 0x400u);
  if (v17 < 1)
  {
    memset(&audittoken, 0, sizeof(audittoken));
    if (v16)
      objc_msgSend(v16, "auditToken");
    v19 = proc_pidpath_audittoken(&audittoken, buffer, 0x400u);
    if (v19 >= 1)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", buffer, v19, 4);
      objc_msgSend(v20, "lastPathComponent");
      v18 = objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", buffer, v17, 4);
LABEL_12:

  name = v13->_name;
  v13->_name = (NSString *)v18;

  v22 = (void *)MEMORY[0x24BDD4258];
  if (v16)
    objc_msgSend(v16, "auditToken");
  else
    memset(v31, 0, sizeof(v31));
  objc_msgSend(v22, "signingIdentifierFromAuditToken:", v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    objc_msgSend(v11, "applicationIdentifier");
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  bundleIdentifier = v13->_bundleIdentifier;
  v13->_bundleIdentifier = v26;

  v13->_isExtension = a5;
  v28 = objc_msgSend(v12, "copy");
  containerAppBundleIdentifier = v13->_containerAppBundleIdentifier;
  v13->_containerAppBundleIdentifier = (NSString *)v28;

LABEL_19:
  return v13;
}

+ (HDXPCProcess)processWithConnection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _OWORD v15[2];

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD41E0], "entitlementsWithConnection:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_msgSend(v6, "hk_isAppExtension");
    if ((_DWORD)v8)
    {
      objc_msgSend(MEMORY[0x24BDC1550], "hk_appExtensionContainerBundleForConnection:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    v12 = objc_alloc(MEMORY[0x24BDD4258]);
    if (v6)
      objc_msgSend(v6, "auditToken");
    else
      memset(v15, 0, sizeof(v15));
    v13 = (void *)objc_msgSend(v12, "initWithAuditToken:", v15);
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAuditToken:entitlements:isExtension:containerAppBundleIdentifier:", v13, v7, v8, v10);

  }
  else
  {
    v11 = 0;
  }

  return (HDXPCProcess *)v11;
}

- (BOOL)isWidgetKitExtension
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  HDXPCProcess *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!self->_isExtension)
    return 0;
  -[HDXPCProcess _pluginBundleForCurrentProcess](self, "_pluginBundleForCurrentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "hk_extensionPointIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.widgetkit-extension"));
    }
    else
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x24BDD2FE8];
      v7 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = self;
        _os_log_impl(&dword_210F9A000, v9, OS_LOG_TYPE_DEFAULT, "Bundle extension point not found for process: %{public}@", (uint8_t *)&v11, 0xCu);
        v7 = 0;
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEBUG))
      -[HDXPCProcess isWidgetKitExtension].cold.1((uint64_t)self, v8);
    v7 = 0;
  }

  return v7;
}

- (id)_pluginBundleForCurrentProcess
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE72FB8], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "informationForPlugInWithPid:", -[HDXPCProcess processIdentifier](self, "processIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD2FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEBUG))
    -[HDXPCProcess _pluginBundleForCurrentProcess].cold.1((uint64_t)self, (uint64_t)v4, v5);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE72FD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)currentProcess
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD41E0], "entitlementsForCurrentTaskWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD41E0], "entitlementsWithDictionary:", MEMORY[0x24BDBD1B8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD4258], "auditTokenForCurrentTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAuditToken:entitlements:isExtension:containerAppBundleIdentifier:", v5, v3, 0, 0);

  return v6;
}

- (void)dropEntitlement:(id)a3
{
  id v4;
  NSMutableSet *droppedEntitlements;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  droppedEntitlements = self->_droppedEntitlements;
  v8 = v4;
  if (!droppedEntitlements)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v7 = self->_droppedEntitlements;
    self->_droppedEntitlements = v6;

    v4 = v8;
    droppedEntitlements = self->_droppedEntitlements;
  }
  -[NSMutableSet addObject:](droppedEntitlements, "addObject:", v4);

}

- (id)unitTest_copyProcessWithEntitlements:(id)a3
{
  id v4;
  HDXPCProcess *v5;

  v4 = a3;
  v5 = -[HDXPCProcess initWithAuditToken:entitlements:isExtension:containerAppBundleIdentifier:]([HDXPCProcess alloc], "initWithAuditToken:entitlements:isExtension:containerAppBundleIdentifier:", self->_auditToken, v4, self->_isExtension, self->_containerAppBundleIdentifier);

  return v5;
}

- (void)restoreEntitlement:(id)a3
{
  -[NSMutableSet removeObject:](self->_droppedEntitlements, "removeObject:", a3);
}

- (id)description
{
  __CFString *v3;
  void *v4;

  if (self->_name)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR(": \"%@\"), self->_name);
  else
    v3 = &stru_24CB19CC0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %@(%d)%@>"), objc_opt_class(), self->_bundleIdentifier, -[HDXPCProcess processIdentifier](self, "processIdentifier"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_HKXPCAuditToken)auditToken
{
  return self->_auditToken;
}

- (NSString)containerAppBundleIdentifier
{
  return self->_containerAppBundleIdentifier;
}

- (void)isWidgetKitExtension
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_210F9A000, a2, OS_LOG_TYPE_DEBUG, "Plugin bundle not found for process: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_pluginBundleForCurrentProcess
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_210F9A000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Retrieved plugin bundle info (%{public}@)", (uint8_t *)&v3, 0x16u);
}

@end
