@implementation _EXExtensionRecordIdentity

- (_EXExtensionRecordIdentity)initWithApplicationExtensionRecord:(id)a3
{
  id v5;
  id *v6;
  _EXExtensionRecordIdentity *v7;
  uint64_t v8;
  LSExtensionPointRecord *extensionPoint;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EXExtensionRecordIdentity;
  v6 = -[_EXExtensionIdentity _init](&v11, sel__init);
  v7 = (_EXExtensionRecordIdentity *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 3, a3);
    objc_msgSend(v5, "extensionPointRecord");
    v8 = objc_claimAutoreleasedReturnValue();
    extensionPoint = v7->_extensionPoint;
    v7->_extensionPoint = (LSExtensionPointRecord *)v8;

  }
  return v7;
}

- (id)sdkDictionary
{
  void *v2;
  void *v3;
  void *v4;

  -[LSApplicationExtensionRecord extensionPointRecord](self->_record, "extensionPointRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SDKDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_expensiveDictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

- (id)attributes
{
  void *v2;
  void *v3;
  void *v4;

  -[_EXExtensionRecordIdentity record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("EXAppExtensionAttributes"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (LSApplicationExtensionRecord)record
{
  return (LSApplicationExtensionRecord *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPoint, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

- (id)bundleIdentifier
{
  return (id)-[LSApplicationExtensionRecord bundleIdentifier](self->_record, "bundleIdentifier");
}

- (id)extensionPointIdentifier
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord extensionPointRecord](self->_record, "extensionPointRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)UUID
{
  return (id)-[LSApplicationExtensionRecord uniqueIdentifier](self->_record, "uniqueIdentifier");
}

- (id)url
{
  return (id)-[LSApplicationExtensionRecord URL](self->_record, "URL");
}

- (id)entitlementNamed:(id)a3 ofClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_EXExtensionRecordIdentity record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:ofClass:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unsigned)userElection
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_EXExtensionRecordIdentity extensionSettingsKey](self, "extensionSettingsKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class sharedInstance](NSClassFromString(CFSTR("LSSettingsStore")), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userElectionForExtensionKey:", v2);

  return v4;
}

- (unsigned)platform
{
  return -[LSApplicationExtensionRecord platform](self->_record, "platform");
}

- (id)localizedName
{
  return (id)-[LSApplicationExtensionRecord localizedName](self->_record, "localizedName");
}

- (id)extensionSettingsKey
{
  void *v3;
  int v4;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  -[_EXExtensionRecordIdentity extensionPointIdentifier](self, "extensionPointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple."));

  if (v4)
  {
    -[_EXExtensionRecordIdentity bundleIdentifier](self, "bundleIdentifier");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_EXExtensionRecordIdentity extensionPoint](self, "extensionPoint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "parentAppRecord");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1E2CFF9B8;
    v26[0] = v8;
    -[_EXExtensionRecordIdentity extensionPoint](self, "extensionPoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentAppRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "teamIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = &stru_1E2CFF9B8;
    v26[1] = v13;
    -[_EXExtensionRecordIdentity extensionPointIdentifier](self, "extensionPointIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = &stru_1E2CFF9B8;
    v26[2] = v16;
    -[_EXExtensionRecordIdentity bundleIdentifier](self, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v17;
    -[_EXExtensionRecordIdentity record](self, "record");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "teamIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (const __CFString *)v19;
    else
      v21 = &stru_1E2CFF9B8;
    v26[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR(":"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    return v23;
  }
}

- (id)extensionDictionary
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord infoDictionary](self->_record, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)entitlements
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord entitlements](self->_record, "entitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_expensiveDictionaryRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v3;
}

- (unsigned)defaultUserElection
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  -[_EXExtensionRecordIdentity sdkDictionary](self, "sdkDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_EX_objectForKey:ofClass:", CFSTR("EXDefaultUserElection"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 > 2uLL)
    v5 = 0;
  if (v5 == 1)
    return 1;
  -[LSApplicationExtensionRecord extensionPointRecord](self->_record, "extensionPointRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentAppRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[LSApplicationExtensionRecord containingBundleRecord](self->_record, "containingBundleRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }
  if (objc_msgSend(v8, "isEqual:", v9))
    v6 = 1;
  else
    v6 = v5;

  return v6;
}

- (id)containingURL
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord containingBundleRecord](self->_record, "containingBundleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)containingBundleRecord
{
  return (id)-[LSApplicationExtensionRecord containingBundleRecord](self->_record, "containingBundleRecord");
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)bundleVersion
{
  return (id)-[LSApplicationExtensionRecord bundleVersion](self->_record, "bundleVersion");
}

- (_EXExtensionRecordIdentity)initWithPlugInKitProxy:(id)a3
{
  id v4;
  _EXExtensionRecordIdentity *v5;
  id v6;
  void *v7;
  uint64_t v8;
  LSApplicationExtensionRecord *record;
  uint64_t v10;
  LSExtensionPointRecord *extensionPoint;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EXExtensionRecordIdentity;
  v5 = -[_EXExtensionIdentity _init](&v13, sel__init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CA5848]);
    objc_msgSend(v4, "pluginUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithUUID:error:", v7, 0);
    record = v5->_record;
    v5->_record = (LSApplicationExtensionRecord *)v8;

    -[LSApplicationExtensionRecord extensionPointRecord](v5->_record, "extensionPointRecord");
    v10 = objc_claimAutoreleasedReturnValue();
    extensionPoint = v5->_extensionPoint;
    v5->_extensionPoint = (LSExtensionPointRecord *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXExtensionRecordIdentity)initWithCoder:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  _EXExtensionRecordIdentity *result;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;

  v3 = a3;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315906;
    v9 = "false";
    v10 = 2080;
    v11 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/EXE"
          "xtensionIdentity.m";
    v12 = 1024;
    v13 = 94;
    v14 = 2112;
    v15 = v6;
    _os_log_fault_impl(&dword_190C25000, v4, OS_LOG_TYPE_FAULT, "%s - %s:%d: %@ cannot be decoded.", (uint8_t *)&v8, 0x26u);

  }
  __break(1u);
  return result;
}

- (BOOL)setUserElection:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[_EXExtensionRecordIdentity extensionSettingsKey](self, "extensionSettingsKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class sharedInstance](NSClassFromString(CFSTR("LSSettingsStore")), "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setUserElection:forExtensionKey:error:", v5, v6, a4);

  return (char)a4;
}

- (id)applicationExtensionRecord
{
  return self->_record;
}

- (id)developerName
{
  void *v2;
  int v3;

  -[LSApplicationExtensionRecord containingBundleRecord](self->_record, "containingBundleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "developerType");

  if (v3 == 1)
    return CFSTR("Apple");
  else
    return &stru_1E2CFF9B8;
}

- (BOOL)isSystemComponent
{
  void *v2;
  void *v3;
  BOOL v4;

  -[LSApplicationExtensionRecord containingBundleRecord](self->_record, "containingBundleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "developerType") == 1;
  else
    v4 = 1;

  return v4;
}

- (LSExtensionPointRecord)extensionPoint
{
  return (LSExtensionPointRecord *)objc_getProperty(self, a2, 32, 1);
}

@end
