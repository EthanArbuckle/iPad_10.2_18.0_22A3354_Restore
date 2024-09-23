@implementation DKDiagnosticAttributes

- (DKDiagnosticAttributes)initWithExtension:(id)a3
{
  id v5;
  DKDiagnosticAttributes *v6;
  DKDiagnosticAttributes *v7;
  void *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  void *v11;
  void *v12;
  uint64_t v13;
  NSNumber *identifier;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSNumber *v21;
  DKDiagnosticAttributes *v22;
  NSNumber *freeSpaceRequired;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *supportedDevices;
  void *v30;
  int v31;
  __int16 v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  NSObject *v40;
  objc_super v41;

  v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)DKDiagnosticAttributes;
  v6 = -[DKDiagnosticAttributes init](&v41, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_40;
  objc_storeStrong((id *)&v6->_extension, a3);
  objc_msgSend(v5, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DKBundleIdentifier"));
  v9 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v7->_bundleIdentifier;
  v7->_bundleIdentifier = (NSString *)v9;

  if (!v7->_bundleIdentifier)
    objc_storeStrong((id *)&v7->_bundleIdentifier, CFSTR("Default"));
  objc_msgSend(v5, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DKDiagnosticIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "integerValue"));
      v13 = objc_claimAutoreleasedReturnValue();
      identifier = v7->_identifier;
      v7->_identifier = (NSNumber *)v13;

      objc_msgSend(v5, "infoDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1E0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)&v7->_version, v16);
          objc_msgSend(v5, "attributes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DKDiagnosticName"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_storeStrong((id *)&v7->_name, v18);
              objc_msgSend(v5, "attributes");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("DKDiagnosticFreeSpaceRequired"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v20)
                goto LABEL_20;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = v20;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_20;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v20, "longLongValue"));
                v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              }
              freeSpaceRequired = v7->_freeSpaceRequired;
              v7->_freeSpaceRequired = v21;

LABEL_20:
              if (!v7->_freeSpaceRequired)
              {
                v7->_freeSpaceRequired = (NSNumber *)&unk_24F9A3660;

              }
              v7->_requiresUnlock = 0;
              objc_msgSend(v5, "attributes");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DKDiagnosticRequiresUnlock"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  v7->_requiresUnlock = objc_msgSend(v25, "BOOLValue");
              }
              objc_msgSend(v5, "attributes");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("DKDiagnosticSupportedDevices"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v28 = v27;
                supportedDevices = v7->_supportedDevices;
                v7->_supportedDevices = v28;
              }
              else
              {
                supportedDevices = v7->_supportedDevices;
                v7->_supportedDevices = (NSArray *)MEMORY[0x24BDBD1A8];
              }

              objc_msgSend(v5, "extensionPointIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.diagnostics-service"));

              if (v31)
              {
                v32 = 1;
              }
              else
              {
                objc_msgSend(v5, "extensionPointIdentifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.diagnostics-ui-service"));

                if (v34)
                {
                  *(_WORD *)&v7->_headless = 0;
LABEL_39:

LABEL_40:
                  v7 = v7;
                  v22 = v7;
                  goto LABEL_41;
                }
                objc_msgSend(v5, "extensionPointIdentifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.diagnostics-restricted-service"));

                if (v36)
                {
                  v32 = 257;
                }
                else
                {
                  objc_msgSend(v5, "extensionPointIdentifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.diagnostics-restricted-ui-service"));

                  if (!v38)
                  {
                    DiagnosticsKitLogHandleForCategory(1);
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                      -[DKDiagnosticAttributes initWithExtension:].cold.1(v5, v40);

                    v7 = 0;
                    goto LABEL_39;
                  }
                  v32 = 256;
                }
              }
              *(_WORD *)&v7->_headless = v32;
              goto LABEL_39;
            }
          }

        }
      }

    }
  }

  v22 = 0;
LABEL_41:

  return v22;
}

- (DKDiagnosticAttributes)initWithIdentifier:(id)a3 version:(id)a4 name:(id)a5 serviceName:(id)a6
{
  return -[DKDiagnosticAttributes initWithIdentifier:version:freeSpaceRequired:name:serviceName:headless:](self, "initWithIdentifier:version:freeSpaceRequired:name:serviceName:headless:", a3, a4, &unk_24F9A3660, a5, a6, 1);
}

- (DKDiagnosticAttributes)initWithIdentifier:(id)a3 version:(id)a4 freeSpaceRequired:(id)a5 name:(id)a6 serviceName:(id)a7 headless:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  DKDiagnosticAttributes *v18;
  DKDiagnosticAttributes *v19;
  NSExtension *extension;
  id v23;
  objc_super v24;

  v23 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)DKDiagnosticAttributes;
  v18 = -[DKDiagnosticAttributes init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    extension = v18->_extension;
    v18->_extension = 0;

    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v19->_version, a4);
    objc_storeStrong((id *)&v19->_name, a6);
    objc_storeStrong((id *)&v19->_serviceName, a7);
    v19->_headless = a8;
    objc_storeStrong((id *)&v19->_freeSpaceRequired, a5);
    if (!v19->_freeSpaceRequired)
    {
      v19->_freeSpaceRequired = (NSNumber *)&unk_24F9A3660;

    }
    v19->_restricted = 1;
  }

  return v19;
}

- (BOOL)isEqualTo:(id)a3
{
  DKDiagnosticAttributes *v4;
  BOOL v5;

  v4 = (DKDiagnosticAttributes *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[DKDiagnosticAttributes isEqualToAttributes:](self, "isEqualToAttributes:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  BOOL v16;
  _BOOL4 v18;
  void *v19;

  v4 = a3;
  -[DKDiagnosticAttributes identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToNumber:", v6))
  {
    -[DKDiagnosticAttributes name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqualToString:", v8))
    {
      LOBYTE(v14) = 0;
LABEL_14:

      goto LABEL_15;
    }
    -[DKDiagnosticAttributes version](self, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", v10))
    {
      LOBYTE(v14) = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[DKDiagnosticAttributes freeSpaceRequired](self, "freeSpaceRequired");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "freeSpaceRequired");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToNumber:", v12))
    {
      v19 = v11;
      v13 = -[DKDiagnosticAttributes isHeadless](self, "isHeadless");
      if (v13 != objc_msgSend(v4, "isHeadless"))
      {
        LOBYTE(v14) = 0;
        v11 = v19;
LABEL_12:

        goto LABEL_13;
      }
      v15 = -[DKDiagnosticAttributes isRestricted](self, "isRestricted");
      v16 = v15 == objc_msgSend(v4, "isRestricted");
      v11 = v19;
      if (v16)
      {
        v18 = -[DKDiagnosticAttributes requiresUnlock](self, "requiresUnlock");
        v14 = v18 ^ objc_msgSend(v4, "requiresUnlock") ^ 1;
        goto LABEL_12;
      }
    }
    LOBYTE(v14) = 0;
    goto LABEL_12;
  }
  LOBYTE(v14) = 0;
LABEL_15:

  return v14;
}

- (BOOL)isHeadless
{
  return self->_headless;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSNumber)freeSpaceRequired
{
  return self->_freeSpaceRequired;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (BOOL)requiresUnlock
{
  return self->_requiresUnlock;
}

- (NSArray)supportedDevices
{
  return self->_supportedDevices;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_supportedDevices, 0);
  objc_storeStrong((id *)&self->_freeSpaceRequired, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)initWithExtension:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extensionPointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_22DE4C000, a2, OS_LOG_TYPE_ERROR, "Unknown extension point: %@", (uint8_t *)&v4, 0xCu);

}

@end
