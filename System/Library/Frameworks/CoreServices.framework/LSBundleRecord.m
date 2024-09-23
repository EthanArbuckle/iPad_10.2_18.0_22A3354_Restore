@implementation LSBundleRecord

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_infoDictionary, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "detach");

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_entitlements);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "detach");

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedName);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "detach");

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedShortName);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "detach");

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedMicrophoneUsageDescription);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "detach");

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedIdentityUsageDescription);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "detach");

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_claimRecords);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v42;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v22++), "detach");
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v20);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_exportedTypeRecords);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v38;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v26++), "detach");
      }
      while (v24 != v26);
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v24);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_importedTypeRecords, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v34;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v30++), "detach");
      }
      while (v28 != v30);
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v28);
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__rawGroupContainerURLs);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
    objc_msgSend(v31, "detach");

}

- (id)entitlementsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  void *v9;
  void *v10;

  v9 = (void *)MEMORY[0x186DAE7A0](self, a2, a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  if (!self->_auditToken
    || (__LAUNCH_SERVICES_IS_GETTING_ENTITLEMENTS_FROM_THE_KERNEL__((uint64_t)self),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a6->entitlements);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_autoreleasePoolPop(v9);
  return v10;
}

- (id)_localizedShort:(BOOL)a3 nameWithContext:(LSContext *)a4 tableID:(unsigned int)a5 unitID:(unsigned int)a6 bundleData:(const LSBundleBaseData *)a7
{
  unsigned int *p_localizedShortDisplayName;
  _LSLocalizedStringRecord *v10;

  if (a3 || (p_localizedShortDisplayName = &a7->localizedDisplayName, !a7->localizedDisplayName))
  {
    v10 = [_LSLocalizedStringRecord alloc];
    p_localizedShortDisplayName = &a7->localizedShortDisplayName;
  }
  else
  {
    v10 = [_LSLocalizedStringRecord alloc];
  }
  return -[_LSLocalizedStringRecord _initWithContext:unitID:](v10, "_initWithContext:unitID:", a4, *p_localizedShortDisplayName);
}

- (void)dealloc
{
  $115C4C562B26FF47E01F9F4EA65B5887 *auditToken;
  objc_super v4;

  auditToken = self->_auditToken;
  if (auditToken)
    MEMORY[0x186DADEF4](auditToken, 0x1000C40E0EAB150);
  v4.receiver = self;
  v4.super_class = (Class)LSBundleRecord;
  -[LSRecord dealloc](&v4, sel_dealloc);
}

- (id)_localizedNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return -[LSBundleRecord _localizedShort:nameWithContext:tableID:unitID:bundleData:](self, "_localizedShort:nameWithContext:tableID:unitID:bundleData:", 0, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

- (id)executableURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  -[LSBundleRecord URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[LSBundleRecord executableURLWithContext:tableID:unitID:unitBytes:].cold.1();
    goto LABEL_9;
  }
  v7 = _CSStringCopyCFString();
  if (!v7)
  {
    _LSDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[LSBundleRecord executableURLWithContext:tableID:unitID:unitBytes:].cold.2();

LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:relativeToURL:", v7, 0, v6);
LABEL_10:

  return v8;
}

- (id)infoDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a6->infoDictionary, *(_QWORD *)&a5);
}

- (id)exported:(BOOL)a3 typesWithContext:(LSContext *)a4 tableID:(unsigned int)a5 unitID:(unsigned int)a6 unitBytes:(const LSBundleData *)a7
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  LSBundleRecord *v18;
  id v19;

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = v10;
  if (a4->db->schema.bundleTable == a5)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __69__LSBundleRecord_exported_typesWithContext_tableID_unitID_unitBytes___block_invoke;
    v17 = &unk_1E1041FA8;
    v18 = self;
    v19 = v10;
    _CSArrayEnumerateAllValues();

  }
  v12 = (void *)objc_msgSend(v11, "copy", v14, v15, v16, v17, v18);

  return v12;
}

- (BOOL)isLinkEnabled
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isLinkEnabledWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isLinkEnabledWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (*(_BYTE *)&a6->base.flags >> 3) & 1;
}

- (id)_dataContainerURLFromDatabaseWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  void *v6;
  void *v7;
  void *v8;

  v6 = _LSAliasCopyResolvedNode(a3->db, a6->dataContainerAlias, 0, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)platformWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return a6->platform;
}

- (id)teamIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (void)_LSRecord_resolve__dataContainerURLFromDatabase
{
  id v2;

  v2 = -[LSBundleRecord _dataContainerURLFromDatabase](self, "_dataContainerURLFromDatabase");
}

- (unsigned)codeSignatureVersion
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_codeSignatureVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_infoDictionary
{
  id v2;

  v2 = -[LSBundleRecord infoDictionary](self, "infoDictionary");
}

- (BOOL)isAppleInternal
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isAppleInternalWithContext_tableID_unitID_unitBytes_);
}

- (id)_localizedShortNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return -[LSBundleRecord _localizedShort:nameWithContext:tableID:unitID:bundleData:](self, "_localizedShort:nameWithContext:tableID:unitID:bundleData:", 1, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

- (unsigned)_profileValidationStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return a6->profileValidationState;
}

- (id)signerOrganizationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (id)claimRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  LSBundleRecord *v17;
  id v18;

  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = v9;
  if (a3->db->schema.bundleTable == a4)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __67__LSBundleRecord_claimRecordsWithContext_tableID_unitID_unitBytes___block_invoke;
    v16 = &unk_1E1041F80;
    v17 = self;
    v18 = v9;
    _CSArrayEnumerateAllValues();

  }
  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16, v17);

  return v11;
}

- (id)SDKVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  __int128 v6;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = *(_OWORD *)&a6->execSDKVersion._opaque[16];
  v8[0] = *(_OWORD *)a6->execSDKVersion._opaque;
  v8[1] = v6;
  _LSVersionNumberGetStringRepresentation(v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)machOUUIDsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  _LSDatabaseGetStringArray(a3->db);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
        if (v13)
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        else
        {
          _LSDefaultLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v12;
            _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "Launch Services: Failed to create a UUID from invalid string %@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  return v15;
}

- (id)_rawGroupContainerURLsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a6->groupContainers, *(_QWORD *)&a5);
}

- (id)_localizedMicrophoneUsageDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return -[_LSLocalizedStringRecord _initWithContext:unitID:]([_LSLocalizedStringRecord alloc], "_initWithContext:unitID:", a3, a6->localizedMicrophoneUsageDescription);
}

- (id)_localizedIdentityUsageDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return -[_LSLocalizedStringRecord _initWithContext:unitID:]([_LSLocalizedStringRecord alloc], "_initWithContext:unitID:", a3, a6->localizedIdentityUsageDescription);
}

- (unsigned)codeSignatureVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return a6->signatureVersion;
}

- (id)signerIdentityWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (id)exportedTypeRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return -[LSBundleRecord exported:typesWithContext:tableID:unitID:unitBytes:](self, "exported:typesWithContext:tableID:unitID:unitBytes:", 1, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

- (BOOL)isAppleInternalWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return *(_BYTE *)&a6->base.flags & 1;
}

- (id)importedTypeRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return -[LSBundleRecord exported:typesWithContext:tableID:unitID:unitBytes:](self, "exported:typesWithContext:tableID:unitID:unitBytes:", 0, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

- (char)developerTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v8;
  char v9;
  int containingDirectoryClass;
  $115C4C562B26FF47E01F9F4EA65B5887 *auditToken;

  if (a3->db->schema.bundleTable != a4)
    return -1;
  if (a6->_clas == 14)
    return 1;
  v8 = (void *)_CSStringCopyCFString();
  if (v8)
  {
    if (-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::once != -1)
      dispatch_once(&-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::once, &__block_literal_global_30);
    if ((objc_msgSend((id)-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::systemTypes, "containsObject:", v8) & 1) != 0)
    {

      return 1;
    }
  }

  containingDirectoryClass = a6->base.containingDirectoryClass;
  v9 = 1;
  if (containingDirectoryClass != 1 && containingDirectoryClass != 4)
  {
    if ((*(_BYTE *)&a6->base.flags & 1) == 0)
      return 3;
    auditToken = self->_auditToken;
    if (auditToken)
    {
      if (_LSIsAuditTokenPlatformBinary(auditToken))
        return 1;
      else
        return -1;
    }
    return -1;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__personasWithAttributes, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong(&self->_cachedDataContainerURL, 0);
}

- (void)_LSRecord_resolve_executableURL
{
  id v2;

  v2 = -[LSBundleRecord executableURL](self, "executableURL");
}

- (NSURL)executableURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_executableURLWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_registrationDate
{
  id v2;

  v2 = -[LSBundleRecord registrationDate](self, "registrationDate");
}

- (NSDate)registrationDate
{
  return (NSDate *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_registrationDateWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_intentDefinitionURLs
{
  id v2;

  v2 = -[LSBundleRecord intentDefinitionURLs](self, "intentDefinitionURLs");
}

- (NSDictionary)intentDefinitionURLs
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_intentDefinitionURLsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_signerOrganization
{
  id v2;

  v2 = -[LSBundleRecord signerOrganization](self, "signerOrganization");
}

- (NSString)signerOrganization
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_signerOrganizationWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_SDKVersion
{
  id v2;

  v2 = -[LSBundleRecord SDKVersion](self, "SDKVersion");
}

- (NSString)SDKVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_SDKVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedMicrophoneUsageDescription
{
  id v2;

  v2 = -[LSBundleRecord _localizedMicrophoneUsageDescription](self, "_localizedMicrophoneUsageDescription");
}

- (_LSLocalizedStringRecord)_localizedMicrophoneUsageDescription
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedMicrophoneUsageDescriptionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedIdentityUsageDescription
{
  id v2;

  v2 = -[LSBundleRecord _localizedIdentityUsageDescription](self, "_localizedIdentityUsageDescription");
}

- (_LSLocalizedStringRecord)_localizedIdentityUsageDescription
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedIdentityUsageDescriptionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_exportedTypeRecords
{
  id v2;

  v2 = -[LSBundleRecord exportedTypeRecords](self, "exportedTypeRecords");
}

- (NSSet)exportedTypeRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_exportedTypeRecordsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_signerIdentity
{
  id v2;

  v2 = -[LSBundleRecord signerIdentity](self, "signerIdentity");
}

- (NSString)signerIdentity
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_signerIdentityWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_machOUUIDs
{
  id v2;

  v2 = -[LSBundleRecord machOUUIDs](self, "machOUUIDs");
}

- (NSArray)machOUUIDs
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_machOUUIDsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_importedTypeRecords
{
  id v2;

  v2 = -[LSBundleRecord importedTypeRecords](self, "importedTypeRecords");
}

- (NSSet)importedTypeRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_importedTypeRecordsWithContext_tableID_unitID_unitBytes_);
}

- (id)registrationDateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)a6->registrationTime);
}

- (NSString)applicationIdentifier
{
  void *v2;
  void *v3;

  -[LSBundleRecord entitlements](self, "entitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_LSRecord_resolve_entitlements
{
  id v2;

  v2 = -[LSBundleRecord entitlements](self, "entitlements");
}

- (LSPropertyList)entitlements
{
  return (LSPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_entitlementsWithContext_tableID_unitID_unitBytes_);
}

- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 context:(LSContext *)a5 tableID:(unsigned int)a6 unitID:(unsigned int)a7 bundleBaseData:(const LSBundleBaseData *)a8 error:(id *)a9
{
  uint64_t v10;
  uint64_t v11;
  id v15;
  id *v16;
  id *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *p_super;
  void *v22;
  NSObject *v23;
  objc_super v25;
  _QWORD v26[8];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v10 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a6;
  v38 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  v32 = a3;
  if (!v28[5])
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__10;
    v36 = __Block_byref_object_dispose__10;
    v37 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __93__LSBundleRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke;
    v26[3] = &unk_1E1041FD0;
    v26[6] = a5;
    v26[7] = a8;
    v26[4] = &v27;
    v26[5] = &buf;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v26);
    if (a9 && !v28[5])
      *a9 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    _Block_object_dispose(&buf, 8);

    if (!v28[5])
    {
      _LSDefaultLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:].cold.1(v23);

      v17 = 0;
      p_super = &self->super.super;
      goto LABEL_19;
    }
  }
  if (!v15)
    v15 = (id)_CSStringCopyCFString();
  v25.receiver = self;
  v25.super_class = (Class)LSBundleRecord;
  v16 = -[LSRecord _initWithContext:tableID:unitID:](&v25, sel__initWithContext_tableID_unitID_, a5, v11, v10);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(v16 + 7, (id)v28[5]);
    v18 = objc_msgSend(v15, "copy");
    v19 = v17[8];
    v17[8] = (id)v18;

    v20 = (void *)v28[5];
    if (_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::onceToken != -1)
      dispatch_once(&_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::onceToken, &__block_literal_global_482);
    if (_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::myBundleIDIfEnabledAndFirstParty
      && (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.mobilecoretypes")) & 1) == 0
      && (objc_msgSend(v15, "isEqualToString:", _LSBundleRecordMaybeLogInit(FSNode *,NSString *)::myBundleIDIfEnabledAndFirstParty) & 1) == 0)
    {
      _LSPrivacyLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v20, "URL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_182882000, p_super, OS_LOG_TYPE_INFO, "constructing bundle record for %@", (uint8_t *)&buf, 0xCu);

      }
LABEL_19:

    }
  }
  _Block_object_dispose(&v27, 8);

  return v17;
}

void __93__LSBundleRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = **(void ***)(a1 + 48);
  v4 = **(_DWORD **)(a1 + 56);
  v5 = *(_QWORD *)(v2 + 8);
  obj = *(id *)(v5 + 40);
  v6 = _LSAliasCopyResolvedNode(v3, v4, 0, 0, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = _LSGetBundleClassForNode(0, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (LSPropertyList)infoDictionary
{
  return (LSPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_infoDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (NSURL)_dataContainerURLFromDatabase
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__dataContainerURLFromDatabaseWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LSBundleRecord URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = a3;
  -[LSBundleRecord URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  return v8;
}

- (NSURL)URL
{
  return (NSURL *)-[FSNode URL](self->_node, "URL");
}

- (void)_LSRecord_resolve_claimRecords
{
  id v2;

  v2 = -[LSBundleRecord claimRecords](self, "claimRecords");
}

- (NSSet)claimRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_claimRecordsWithContext_tableID_unitID_unitBytes_);
}

- (NSString)localizedShortName
{
  void *v3;
  NSString *v4;
  void *v5;

  -[LSBundleRecord _localizedShortName](self, "_localizedShortName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  postprocessLocalizedNameishStringFromStringRecord(self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)_LSRecord_resolve__localizedShortName
{
  id v2;

  v2 = -[LSBundleRecord _localizedShortName](self, "_localizedShortName");
}

- (_LSLocalizedStringRecord)_localizedShortName
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedShortNameWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_teamIdentifier
{
  id v2;

  v2 = -[LSBundleRecord teamIdentifier](self, "teamIdentifier");
}

- (NSString)teamIdentifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_teamIdentifierWithContext_tableID_unitID_unitBytes_);
}

+ (LSBundleRecord)coreTypesBundleRecord
{
  return (LSBundleRecord *)objc_alloc_init(_LSCoreTypesRecordProxy);
}

- (id)intentDefinitionURLsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a6->intentDefinitionURLs);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    -[_LSLazyPropertyList propertyList](v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__LSBundleRecord_Intents__intentDefinitionURLsWithContext_tableID_unitID_unitBytes___block_invoke;
    v14[3] = &unk_1E1042020;
    v15 = v8;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
  v12 = (void *)objc_msgSend(v8, "copy");

  return v12;
}

- (void)_LSRecord_resolve__localizedName
{
  id v2;

  v2 = -[LSBundleRecord _localizedName](self, "_localizedName");
}

- (NSString)localizedName
{
  void *v3;
  NSString *v4;
  void *v5;

  -[LSBundleRecord _localizedName](self, "_localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  postprocessLocalizedNameishStringFromStringRecord(self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (_LSLocalizedStringRecord)_localizedName
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedNameWithContext_tableID_unitID_unitBytes_);
}

- (NSString)_fallbackLocalizedName
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__LSBundleRecord__fallbackLocalizedName__block_invoke;
  v7[3] = &unk_1E1041FF8;
  v7[4] = self;
  v7[5] = &v8;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v7);
  if (v9[5])
  {
    +[_LSLocalizedStringRecord sanitizeString:](_LSLocalizedStringRecord, "sanitizeString:");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v9[5];
    v9[5] = v2;
  }
  else
  {
    _LSDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[LSBundleRecord _fallbackLocalizedName].cold.1();

    v3 = (void *)v9[5];
    v9[5] = (uint64_t)CFSTR("(no path)");
  }

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __84__LSBundleRecord_Intents__intentDefinitionURLsWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", a3, 0);
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, a2);

}

- (void)_LSRecord_resolve__bundleVersion
{
  -[LSBundleRecord _bundleVersion](self, "_bundleVersion");
}

- (LSVersionNumber)_bundleVersion
{
  LSVersionNumber *result;

  __LSRECORD_GETTER__<LSVersionNumber>(self, (LSRecord *)a3, sel__bundleVersionWithContext_tableID_unitID_unitBytes_, retstr);
  return result;
}

- (LSVersionNumber)_bundleVersionWithContext:(SEL)a3 tableID:(LSContext *)a4 unitID:(unsigned int)a5 unitBytes:(unsigned int)a6
{
  __int128 v7;

  v7 = *(_OWORD *)&a7->version._opaque[16];
  *(_OWORD *)retstr->_opaque = *(_OWORD *)a7->version._opaque;
  *(_OWORD *)&retstr->_opaque[16] = v7;
  return self;
}

- (BOOL)wasBuiltWithThreadSanitizer
{
  return (-[LSBundleRecord _baseFlags](self, "_baseFlags") >> 2) & 1;
}

- (LSBundleBaseFlags)_baseFlags
{
  return (LSBundleBaseFlags)__LSRECORD_GETTER__<LSBundleBaseFlags>(self, (LSRecord *)a2, sel__baseFlagsWithContext_tableID_unitID_unitBytes_);
}

- (LSBundleBaseFlags)_baseFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (LSBundleBaseFlags)*(_BYTE *)&a6->flags;
}

- (char)developerType
{
  return __LSRECORD_GETTER__<unsigned char>(self, (LSRecord *)a2, sel_developerTypeWithContext_tableID_unitID_unitBytes_);
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LSBundleRecord;
  -[LSRecord encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_node, CFSTR("node"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  if (self->_auditToken)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", self->_auditToken, "{?=[8I]}");
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("auditToken"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  v6 = self->_cachedDataContainerURL;
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("cachedDataContainerURL"));
  objc_msgSend(a3, "encodeBool:forKey:", *(_BYTE *)&self->_flags & 1, CFSTR("redacted"));

}

- (LSBundleRecord)initWithCoder:(id)a3
{
  LSBundleRecord *v4;
  uint64_t v5;
  FSNode *node;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  void *v10;
  id v11;
  $115C4C562B26FF47E01F9F4EA65B5887 *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id cachedDataContainerURL;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  id *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)LSBundleRecord;
  v4 = -[LSRecord initWithCoder:](&v45, sel_initWithCoder_);
  if (v4)
  {
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("node"));
    v5 = objc_claimAutoreleasedReturnValue();
    node = v4->_node;
    v4->_node = (FSNode *)v5;

    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v4->_bundleIdentifier;
    v4->_bundleIdentifier = (NSString *)v7;

    if (!v4->_auditToken)
    {
      objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = objc_retainAutorelease(v9);
        if (!strcmp((const char *)objc_msgSend(v11, "objCType"), "{?=[8I]}"))
        {
          v12 = ($115C4C562B26FF47E01F9F4EA65B5887 *)operator new();
          *(_OWORD *)v12->var0 = 0u;
          *(_OWORD *)&v12->var0[4] = 0u;
          v4->_auditToken = v12;
          objc_msgSend(v11, "getValue:size:", v12, 32);
        }
      }

    }
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    objc_msgSend(a3, "ls_decodeObjectOfClasses:forKey:", v15, CFSTR("cachedDataContainerURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    cachedDataContainerURL = v4->_cachedDataContainerURL;
    v4->_cachedDataContainerURL = (id)v16;

    *(_BYTE *)&v4->_flags = *(_BYTE *)&v4->_flags & 0xFE | objc_msgSend(a3, "decodeBoolForKey:", CFSTR("redacted"));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[LSRecord _resolvedPropertyValueForGetter:](v4, "_resolvedPropertyValueForGetter:", sel_claimRecords);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(v18);
          objc_storeWeak((id *)(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i) + 32), v4);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v19);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[LSRecord _resolvedPropertyValueForGetter:](v4, "_resolvedPropertyValueForGetter:", sel_exportedTypeRecords);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v22);
          v26 = *(id **)(*((_QWORD *)&v37 + 1) + 8 * j);
          if (objc_msgSend(v26, "isDeclared"))
            objc_storeWeak(v26 + 4, v4);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v23);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[LSRecord _resolvedPropertyValueForGetter:](v4, "_resolvedPropertyValueForGetter:", sel_importedTypeRecords);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(v27);
          v31 = *(id **)(*((_QWORD *)&v33 + 1) + 8 * k);
          if (objc_msgSend(v31, "isDeclared"))
            objc_storeWeak(v31 + 4, v4);
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      }
      while (v28);
    }

  }
  return v4;
}

+ (id)_propertyClasses
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __69__LSBundleRecord_exported_typesWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id *v6;

  v5 = _UTTypeGet();
  if (v5 && ((*(_DWORD *)(v5 + 8) >> 4) & 1) == *(_BYTE *)(a1 + 60))
  {
    v6 = -[LSRecord _initWithContext:tableID:unitID:]([_UTDeclaredTypeRecord alloc], "_initWithContext:tableID:unitID:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), a3);
    if (v6)
    {
      objc_storeWeak(v6 + 4, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    }

  }
}

void __67__LSBundleRecord_claimRecordsWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v5;

  if (_LSClaimGet())
  {
    v5 = -[LSRecord _initWithContext:tableID:unitID:]([LSClaimRecord alloc], "_initWithContext:tableID:unitID:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), a3);
    if (v5)
    {
      objc_storeWeak(v5 + 4, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    }

  }
}

id __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[6];
  void (*v7[5])(_QWORD, _QWORD);
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v7[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v7[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v7[2] = (void (*)(_QWORD, _QWORD))__75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_4;
  v7[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FB88;
  v7[4] = (void (*)(_QWORD, _QWORD))&v8;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_5;
  v6[3] = &unk_1E1041F30;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = &v8;
  objc_msgSend(v3, "getBundleRecordForCurrentProcessWithCompletionHandler:", v6);
  v4 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v4;
}

- (NSDictionary)groupContainerURLs
{
  return (NSDictionary *)-[LSBundleRecord _getGroupContainersCreatingIfNecessary:checkNonContainerizedBundles:](self, "_getGroupContainersCreatingIfNecessary:checkNonContainerizedBundles:", 1, 0);
}

- (unsigned)platform
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_platformWithContext_tableID_unitID_unitBytes_);
}

- (void)redact
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    if (-[LSBundleRecord eligibleForRedaction](self, "eligibleForRedaction"))
    {
      -[LSRecord _resolveAllProperties](self, "_resolveAllProperties");
      -[LSRecord detach](self, "detach");
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      objc_msgSend((id)objc_opt_class(), "redactedProperties", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
      {
        v5 = *(_QWORD *)v9;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v9 != v5)
              objc_enumerationMutation(v3);
            -[LSRecord _removeResolvedPropertyValueForGetter:](self, "_removeResolvedPropertyValueForGetter:", NSSelectorFromString(*(NSString **)(*((_QWORD *)&v8 + 1) + 8 * v6++)));
          }
          while (v4 != v6);
          v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        }
        while (v4);
      }

      *(_BYTE *)&self->_flags |= 1u;
    }
    else
    {
      _LSDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[LSBundleRecord(Redaction) redact].cold.1();

    }
  }
}

+ (LSBundleRecord)bundleRecordWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  LSApplicationRecord *v7;
  LSApplicationExtensionRecord *v8;
  void *v9;
  LSApplicationExtensionRecord *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]([LSApplicationRecord alloc], "initWithBundleIdentifier:allowPlaceholder:error:", a3, a4, 0);
  if (v7)
  {
    v8 = (LSApplicationExtensionRecord *)v7;
LABEL_3:
    v9 = 0;
    goto LABEL_4;
  }
  v11 = [LSApplicationExtensionRecord alloc];
  if (a5)
    v12 = &v16;
  else
    v12 = 0;
  if (a5)
    v16 = 0;
  v8 = -[LSApplicationExtensionRecord initWithBundleIdentifier:error:](v11, "initWithBundleIdentifier:error:", a3, v12, v16);
  if (!a5)
    goto LABEL_3;
  v13 = v16;
  v9 = v13;
  if (!v8)
  {
    v14 = (void *)*MEMORY[0x1E0CB2F90];
    if (v13)
    {
      v17 = *MEMORY[0x1E0CB3388];
      v18[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl(v14, -10814, (uint64_t)"+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]", 163, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v8 = 0;
    }
    else
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]", 165, 0);
      v8 = 0;
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_4:

  return (LSBundleRecord *)v8;
}

+ (id)bundleRecordForAuditToken:(id *)a3 error:(id *)a4
{
  __int128 v4;
  _OWORD v6[2];

  v4 = *(_OWORD *)&a3->var0[4];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v4;
  objc_msgSend(a1, "_bundleRecordForAuditToken:checkNSBundleMainBundle:error:", v6, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (LSBundleRecord)bundleRecordForCurrentProcess
{
  _OWORD *v3;
  __int128 v4;
  void *v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  _OWORD *v9;
  __int128 v10;
  id v11;
  NSObject *v12;
  dispatch_time_t v14;
  id v15;
  _OWORD v16[2];
  id v17;
  _OWORD v18[2];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (_LSCurrentProcessMayMapDatabase())
  {
    v3 = (_OWORD *)_LSGetAuditTokenForSelf();
    if (!v3)
      return (LSBundleRecord *)0;
    v4 = v3[1];
    v18[0] = *v3;
    v18[1] = v4;
    v17 = 0;
    objc_msgSend(a1, "_bundleRecordForAuditToken:checkNSBundleMainBundle:error:", v18, 1, &v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v17;
    if (!v5)
    {
      _LSDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_INFO, "failure to find bundle record for our audit token: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
    WeakRetained = (id)+[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord;
    if (!WeakRetained)
    {
      WeakRetained = objc_loadWeakRetained(&LaunchServices::Record::weakCurrentProcessRecord);
      if (!WeakRetained)
      {
        v9 = (_OWORD *)_LSGetAuditTokenForSelf();
        if (v9)
        {
          v10 = v9[1];
          v16[0] = *v9;
          v16[1] = v10;
          v15 = 0;
          objc_msgSend(a1, "_bundleRecordForAuditToken:checkNSBundleMainBundle:error:", v16, 1, &v15);
          WeakRetained = (id)objc_claimAutoreleasedReturnValue();
          v11 = v15;
          if (v11)
          {
            _LSDefaultLog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              +[LSBundleRecord bundleRecordForCurrentProcess].cold.1();

          }
          LaunchServices::Record::storeWeakSharedRecord(WeakRetained, &LaunchServices::Record::weakCurrentProcessRecord);

        }
        else
        {
          WeakRetained = 0;
        }
      }
      objc_storeStrong((id *)&+[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord, WeakRetained);
      v14 = dispatch_time(0, 5000000000);
      dispatch_after(v14, MEMORY[0x1E0C80D38], &__block_literal_global_17);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
    v5 = WeakRetained;
  }
  return (LSBundleRecord *)v5;
}

+ (id)_bundleRecordForAuditToken:(id *)a3 checkNSBundleMainBundle:(unsigned __int8)a4 error:(id *)a5
{
  LaunchServices::DatabaseContext *MayMapDatabase;
  _LSDServiceDomain *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  int v13;
  uint64_t v14;
  LSApplicationExtensionRecord *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  _LSDServiceDomain *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  LSApplicationRecord *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  _OWORD *v35;
  __int128 v36;
  _QWORD *v37;
  _QWORD v39[5];
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  unsigned __int8 v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  void **CurrentContext;
  id v56;
  char v57;
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  id v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  uint64_t v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x1E0C80C00];
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__10;
  v63 = __Block_byref_object_dispose__10;
  v64 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if ((_DWORD)MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    v56 = 0;
    v57 = 0;
    v58 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v9, 0);

    if (!v10)
    {
      if (a5)
      {
        +[_LSDServiceDomain defaultServiceDomain]();
        v24 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
        v25 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v24, 0);

        if (v25)
          v26 = 0;
        else
          v26 = objc_retainAutorelease(v58);
        *a5 = v26;
      }
      goto LABEL_36;
    }
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__10;
    v53 = __Block_byref_object_dispose__10;
    v54 = 0;
    v11 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v12 = *(_OWORD *)&a3->var0[4];
    v46 = *(_OWORD *)a3->var0;
    v45[1] = 3221225472;
    v45[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke;
    v45[3] = &unk_1E1041EE0;
    v47 = v12;
    v48 = a4;
    v45[4] = &v49;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v45);
    if (!v50[5])
    {
      if (a5)
      {
        v68 = *MEMORY[0x1E0CB2938];
        v69 = CFSTR("The file system path for this process could not be determined. It may not be running, or it may have been deleted or moved while running.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -600, (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]", 371, v28);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_35;
    }
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v40[0] = v11;
    v40[1] = 3221225472;
    v40[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_2;
    v40[3] = &unk_1E1041F08;
    v40[4] = &v41;
    v40[5] = &v49;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v40);
    v13 = *((_DWORD *)v42 + 6);
    if (v13 == 2)
    {
      v29 = [LSApplicationRecord alloc];
      v30 = -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:](v29, "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:", v50[5], 0, 0, 0, 0, 0, v10, a5);
      v19 = (void *)v60[5];
      v60[5] = v30;
LABEL_33:

      goto LABEL_34;
    }
    if (v13 == 12)
    {
      v14 = v50[5];
      v15 = [LSApplicationExtensionRecord alloc];
      v65 = 0;
      v16 = -[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:context:requireValid:error:](v15, "_initWithUUID:node:bundleIdentifier:context:requireValid:error:", 0, v14, 0, v10, 0, &v65);
      v17 = v65;
      v18 = v17;
      if (a5 && !v16)
        *a5 = objc_retainAutorelease(v17);

      v19 = (void *)v60[5];
      v60[5] = v16;
      goto LABEL_33;
    }
    if (objc_msgSend((id)v50[5], "isDirectory"))
    {
      if (a5)
      {
        v72 = *MEMORY[0x1E0CB2938];
        v73[0] = CFSTR("This process' bundle type is not something Launch Services registers.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]", 363, v19);
        v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
        *a5 = v31;
        goto LABEL_33;
      }
    }
    else if (a5)
    {
      v70 = *MEMORY[0x1E0CB2938];
      v71 = CFSTR("This process is not the executable of a bundle.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]", 365, v19);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
LABEL_34:
    _Block_object_dispose(&v41, 8);
LABEL_35:
    _Block_object_dispose(&v49, 8);

LABEL_36:
    if (CurrentContext && v57)
      _LSContextDestroy(CurrentContext);
    v32 = v56;
    CurrentContext = 0;
    v56 = 0;

    v57 = 0;
    v33 = v58;
    v58 = 0;

    goto LABEL_40;
  }
  v20 = _LSGetPIDFromToken(a3);
  if (v20 == getpid())
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_3;
    v39[3] = &unk_1E1041F58;
    v39[4] = &v59;
    _LSRetryForConnectionInterrupted(v39);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v60[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)v60[5], "extensionPointRecord");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[LSExtensionPointRecord setExtensionPointRecordForCurrentProcess:](LSExtensionPointRecord, "setExtensionPointRecordForCurrentProcess:", v23);

      }
    }
    else if (a5)
    {
      *a5 = objc_retainAutorelease(v21);
    }

  }
  else if (a5)
  {
    v66 = *MEMORY[0x1E0CB2938];
    v67 = CFSTR("unknown entitlement");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]", 407, v27);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_40:
  v34 = (_QWORD *)v60[5];
  if (v34 && !v34[4])
  {
    v35 = (_OWORD *)operator new();
    v36 = *(_OWORD *)&a3->var0[4];
    *v35 = *(_OWORD *)a3->var0;
    v35[1] = v36;
    *(_QWORD *)(v60[5] + 32) = v35;
    v34 = (_QWORD *)v60[5];
  }
  v37 = v34;
  _Block_object_dispose(&v59, 8);

  return v37;
}

+ (id)redactedProperties
{
  if (+[LSBundleRecord(Redaction) redactedProperties]::once != -1)
    dispatch_once(&+[LSBundleRecord(Redaction) redactedProperties]::once, &__block_literal_global_414);
  return (id)+[LSBundleRecord(Redaction) redactedProperties]::properties;
}

- (NSURL)dataContainerURL
{
  id v3;

  v3 = 0;
  -[LSBundleRecord getDataContainerURL:error:](self, "getDataContainerURL:error:", &v3, 0);
  return (NSURL *)v3;
}

- (id)_getGroupContainersCreatingIfNecessary:(BOOL)a3 checkNonContainerizedBundles:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v12;

  v12 = 0;
  -[LSBundleRecord(Personas) _personasWithAttributes](self, "_personasWithAttributes", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LSShouldFetchContainersFromContainermanagerForPersona(v5, -[LSBundleRecord _usesSystemPersona](self, "_usesSystemPersona"), &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) != 0 || !v6 && v12)
  {
    -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    dyld_get_active_platform();
    v8 = (uint64_t)_LSCopyGroupContainerURLSFromContainermanager(v7);
  }
  else
  {
    -[LSBundleRecord _rawGroupContainerURLsCheckingRedaction](self, "_rawGroupContainerURLsCheckingRedaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSLazyPropertyList propertyList](v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = _LSCopyRationalizedGroupContainerURLDict(v7);
  }
  v10 = (void *)v8;

  if (!v10 || v6)
  {

    v10 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

- (BOOL)getDataContainerURL:(id *)a3 error:(id *)a4
{
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  BOOL v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unsigned int active_platform;
  uint64_t v27;
  NSObject *v29;
  BOOL v30;
  id v31;

  if (!-[LSBundleRecord isRedacted](self, "isRedacted"))
  {
LABEL_4:
    -[LSBundleRecord _cachedDataContainerURL](self, "_cachedDataContainerURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    -[LSBundleRecord(Personas) _personasWithAttributes](self, "_personasWithAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSShouldFetchContainersFromContainermanagerForPersona(v11, -[LSBundleRecord _usesSystemPersona](self, "_usesSystemPersona"), &v30);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v13 = -[LSBundleRecord _containerized](self, "_containerized");
    v14 = v12 == 0;
    if (v12)
      v15 = 0;
    else
      v15 = v13;
    if (v15 && (v30 || !v10))
    {
      if (!v30)
      {
        _LSDefaultLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[LSBundleRecord(Containers) getDataContainerURL:error:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

      }
      -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[LSBundleRecord _containerClass](self, "_containerClass");
      active_platform = dyld_get_active_platform();
      v27 = _LSCopyDataContainerURLFromContainermanager(v24, v25, active_platform);

      v10 = (void *)v27;
    }
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    if (a3)
      *a3 = objc_retainAutorelease(v10);

    goto LABEL_20;
  }
  v31 = 0;
  v7 = -[LSBundleRecord unredactWithError:](self, "unredactWithError:", &v31);
  v8 = v31;
  v9 = v8;
  if (v7)
  {

    goto LABEL_4;
  }
  _LSDefaultLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    -[LSBundleRecord _rawGroupContainerURLsCheckingRedaction].cold.1();

  if (a4)
  {
    v12 = objc_retainAutorelease(v9);
    v14 = 0;
    *a4 = v12;
  }
  else
  {
    v14 = 0;
    v12 = v9;
  }
LABEL_20:

  return v14;
}

- (BOOL)isRedacted
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)_cachedDataContainerURL
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int active_platform;
  void *v8;
  void *v9;
  id v10;

  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  v3 = self->_cachedDataContainerURL;
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  if (v3)
  {
    v4 = (id)*MEMORY[0x1E0C9B0D0];
  }
  else
  {
    if (!-[LSBundleRecord _containerized](self, "_containerized")
      || !objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode")
      || (-[LSBundleRecord bundleIdentifier](self, "bundleIdentifier"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = -[LSBundleRecord _containerClass](self, "_containerClass"),
          active_platform = dyld_get_active_platform(),
          v3 = (id)_LSCopyDataContainerURLFromContainermanager(v5, v6, active_platform),
          v5,
          !v3))
    {
      -[LSBundleRecord _dataContainerURLFromDatabase](self, "_dataContainerURLFromDatabase");
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
    v4 = (id)*MEMORY[0x1E0C9B0D0];
    if (v3)
      v8 = v3;
    else
      v8 = (void *)*MEMORY[0x1E0C9B0D0];
    objc_storeStrong(&self->_cachedDataContainerURL, v8);
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  }
  if (v3 == v4)
    v9 = 0;
  else
    v9 = v3;
  v10 = v9;

  return v10;
}

- (id)_rawGroupContainerURLsCheckingRedaction
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v9;

  if (!-[LSBundleRecord isRedacted](self, "isRedacted"))
    goto LABEL_4;
  v9 = 0;
  v3 = -[LSBundleRecord unredactWithError:](self, "unredactWithError:", &v9);
  v4 = v9;
  v5 = v4;
  if (v3)
  {

LABEL_4:
    -[LSBundleRecord _rawGroupContainerURLs](self, "_rawGroupContainerURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  _LSDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[LSBundleRecord _rawGroupContainerURLsCheckingRedaction].cold.1();

  v6 = 0;
  return v6;
}

- (void)_LSRecord_resolve__rawGroupContainerURLs
{
  id v2;

  v2 = -[LSBundleRecord _rawGroupContainerURLs](self, "_rawGroupContainerURLs");
}

- (_LSLazyPropertyList)_rawGroupContainerURLs
{
  return (_LSLazyPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__rawGroupContainerURLsWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isProfileValidated
{
  return -[LSBundleRecord _profileValidationState](self, "_profileValidationState") != 0;
}

- (unsigned)_profileValidationState
{
  return __LSRECORD_GETTER__<unsigned char>(self, (LSRecord *)a2, sel__profileValidationStateWithContext_tableID_unitID_unitBytes_);
}

+ (LSBundleRecord)bundleRecordWithApplicationIdentifier:(id)a3 error:(id *)a4
{
  LaunchServices::DatabaseContext *v6;
  NSObject *v7;
  _LSDServiceDomain *v8;
  uint64_t v9;
  int Options;
  LSApplicationRecord *v11;
  id v12;
  _LSDServiceDomain *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v22;
  uint64_t v23[6];
  char v24;
  void **CurrentContext;
  id v26;
  char v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSBundleRecord.mm"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appID != nil"));

  }
  v6 = (LaunchServices::DatabaseContext *)_LSLogAppRecordInitsForDataSeparation();
  if ((_DWORD)v6)
  {
    _LSDataSeparationLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = a3;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_INFO, "bundle record search with app ID: %@", buf, 0xCu);
    }

  }
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(v6);
  v26 = 0;
  v27 = 0;
  v28 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v9 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v8, 0);

  if (v9)
  {
    LaunchServices::BindingEvaluator::CreateWithApplicationIdentifier((LaunchServices::BindingEvaluator *)a3, 0, (uint64_t)buf);
    Options = LaunchServices::BindingEvaluator::getOptions((LaunchServices::BindingEvaluator *)buf);
    LaunchServices::BindingEvaluator::setOptions((uint64_t)buf, Options | 0x80);
    LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)buf, v23);
    if (v24)
    {
      v11 = [LSApplicationRecord alloc];
      v12 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:](v11, "_initWithContext:bundleID:bundleData:error:", v9, LODWORD(v23[0]), v23[1], a4);
      if (v24)
      {

      }
    }
    else
    {
      v12 = 0;
    }
    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)buf);
  }
  else if (a4)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v13, 0);

    if (v14)
      v15 = 0;
    else
      v15 = objc_retainAutorelease(v28);
    v12 = 0;
    *a4 = v15;
  }
  else
  {
    v12 = 0;
  }
  v16 = v12;
  if (CurrentContext && v27)
    _LSContextDestroy(CurrentContext);
  v17 = v26;
  CurrentContext = 0;
  v26 = 0;

  v27 = 0;
  v18 = v28;
  v28 = 0;

  return (LSBundleRecord *)v16;
}

void __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke(uint64_t a1)
{
  void *v2;
  FSNode *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)_LSCopyBundleURLForAuditToken((_OWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
  if (v2)
  {
    v6 = v2;
    v3 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v2, 0, 0);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

void __40__LSBundleRecord__fallbackLocalizedName__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "URL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
}

- (NSArray)UIBackgroundModes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[LSBundleRecord infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "objectForKey:ofClass:valuesOfClass:", CFSTR("UIBackgroundModes"), v3, objc_opt_class());
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (void *)v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  return (NSArray *)v5;
}

- (NSArray)privacyTrackingDomains
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[LSBundleRecord infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "objectForKey:ofClass:valuesOfClass:", CFSTR("NSPrivacyTrackingDomains"), v3, objc_opt_class());
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (void *)v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  return (NSArray *)v5;
}

void __68__LSBundleRecord_developerTypeWithContext_tableID_unitID_unitBytes___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("System");
  v4[1] = CFSTR("SystemAppPlaceholder");
  v4[2] = CFSTR("Internal");
  v4[3] = CFSTR("Hidden");
  v4[4] = CFSTR("CoreServices");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::systemTypes;
  -[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::systemTypes = v2;

}

- (NSString)bundleVersion
{
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[LSBundleRecord _bundleVersion](self, "_bundleVersion");
  _LSVersionNumberGetStringRepresentation(&v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

void __47__LSBundleRecord_bundleRecordForCurrentProcess__block_invoke()
{
  void *v0;

  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
  v0 = (void *)+[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord;
  +[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
}

void __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSSet)serviceRecords
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (const)_auditToken
{
  return self->_auditToken;
}

- (BOOL)_usesSystemPersona
{
  return 0;
}

- (BOOL)_containerized
{
  return 0;
}

- (unint64_t)_containerClass
{
  return 0;
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  unsigned int var3;
  _LSDatabase *db;
  uint64_t v11;
  _LSCoreTypesRecordProxy *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _LSCoreTypesRecordProxy *v17;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  var3 = a4->var3;
  db = a3->db;
  if (var3 == a3->db->schema.bundleTable)
  {
    v11 = _LSBundleGet(db, a4->var2);
    if (v11)
    {
      if (*(_DWORD *)(v11 + 168) == 11)
        v12 = objc_alloc_init(_LSCoreTypesRecordProxy);
      else
        v12 = -[LSApplicationRecord _initWithContext:persistentIdentifierData:length:]([LSApplicationRecord alloc], "_initWithContext:persistentIdentifierData:length:", a3, a4, a5);
      goto LABEL_15;
    }
    _LSRecordLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a5, 0);
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEBUG, "Failed to initialize application/bundle record with persistent identifier %@ because it was not found in the database.", buf, 0xCu);

    }
  }
  else
  {
    if (var3 != a3->db->schema.pluginTable)
    {

      v19 = (void *)MEMORY[0x1E0C99DA0];
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a4, a5, CFSTR("LSPersistentIdentifier"));
      v24 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("The persistent identifier passed to -[LSBundleRecord initWithPersistentIdentifier:] was for a different type of record."), v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v22);
    }
    v13 = _LSGetPlugin((uint64_t)db, a4->var2);
    if (v13)
    {
      v12 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]([LSApplicationExtensionRecord alloc], "_initWithContext:pluginID:pluginData:error:", a3, a4->var2, v13, 0);
LABEL_15:
      v17 = v12;

      return v17;
    }
    _LSRecordLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a5, 0);
      *(_DWORD *)buf = 138412290;
      v26 = v16;
      _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEBUG, "Failed to initialize application extension record with persistent identifier %@ because it was not found in the database.", buf, 0xCu);

    }
  }

  return 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("{ bundleID: %@, URL: %@ }"), v4, v5);

  return v6;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)LSBundleRecord;
  -[LSRecord debugDescription](&v10, sel_debugDescription);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> { bundleID: %@, URL: %@, super: %@ }"), v4, self, v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  _OWORD *v6;
  $115C4C562B26FF47E01F9F4EA65B5887 *auditToken;
  __int128 v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LSBundleRecord;
  v4 = -[LSRecord copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 7, self->_node);
    objc_storeStrong(v5 + 8, self->_bundleIdentifier);
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
    objc_storeStrong(v5 + 5, self->_cachedDataContainerURL);
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
    if (self->_auditToken)
    {
      if (!v5[4])
      {
        v6 = (_OWORD *)operator new();
        auditToken = self->_auditToken;
        v8 = *(_OWORD *)&auditToken->var0[4];
        *v6 = *(_OWORD *)auditToken->var0;
        v6[1] = v8;
        v5[4] = v6;
      }
    }
  }
  return v5;
}

- (FSNode)_node
{
  return self->_node;
}

- (NSArray)_personasWithAttributes
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (id)getGroupContainersCreatingIfNecessary:(BOOL)a3
{
  return -[LSBundleRecord _getGroupContainersCreatingIfNecessary:checkNonContainerizedBundles:](self, "_getGroupContainersCreatingIfNecessary:checkNonContainerizedBundles:", a3, 1);
}

- (id)groupContainerIdentifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord entitlements](self, "entitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _LSCopyGroupContainerIdentifiersFromEntitlements(v5, v6);

  if (!v7)
LABEL_3:
    v7 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  return v7;
}

- (id)localizedNameWithPreferredLocalizations:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  -[LSBundleRecord _localizedName](self, "_localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValueWithPreferredLocalizations:", a3);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  postprocessLocalizedNameishStringFromStringRecord(self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedShortNameWithPreferredLocalizations:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  -[LSBundleRecord _localizedShortName](self, "_localizedShortName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValueWithPreferredLocalizations:", a3);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  postprocessLocalizedNameishStringFromStringRecord(self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    -[LSBundleRecord _localizedIdentityUsageDescription](self, "_localizedIdentityUsageDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    -[LSBundleRecord _localizedMicrophoneUsageDescription](self, "_localizedMicrophoneUsageDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;

    return v6;
  }
  _LSDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Unknown usage description feature %lu", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3 preferredLocalizations:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    -[LSBundleRecord _localizedIdentityUsageDescription](self, "_localizedIdentityUsageDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValueWithPreferredLocalizations:", a4);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    -[LSBundleRecord _localizedMicrophoneUsageDescription](self, "_localizedMicrophoneUsageDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValueWithPreferredLocalizations:", a4);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;

    return v8;
  }
  _LSDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = a3;
    _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, "Unknown usage description feature %lu", (uint8_t *)&v11, 0xCu);
  }

  return 0;
}

- (BOOL)isUPPValidated
{
  return -[LSBundleRecord _profileValidationState](self, "_profileValidationState") == 2;
}

- (BOOL)isFreeProfileValidated
{
  return -[LSBundleRecord _profileValidationState](self, "_profileValidationState") == 3;
}

- (unint64_t)compatibilityState
{
  return 0;
}

- (NSArray)managedPersonas
{
  return 0;
}

- (NSArray)associatedPersonas
{
  return 0;
}

- (BOOL)personaIsApplicable:(id)a3
{
  char v5;
  void *v6;

  if (-[LSBundleRecord _usesSystemPersona](self, "_usesSystemPersona"))
    return 1;
  -[LSBundleRecord associatedPersonas](self, "associatedPersonas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "containsObject:", a3);

  return v5;
}

- (NSString)accentColorName
{
  void *v2;
  void *v3;

  -[LSBundleRecord infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:ofClass:", CFSTR("NSAccentColorName"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)WKBackgroundModes
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsNowPlaying
{
  return 0;
}

- (NSArray)supportedIntents
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)intentsRestrictedWhileLocked
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)intentsRestrictedWhileProtectedDataUnavailable
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)supportedIntentMediaCategories
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

void __47__LSBundleRecord_Redaction__redactedProperties__block_invoke()
{
  void *v0;

  v0 = (void *)+[LSBundleRecord(Redaction) redactedProperties]::properties;
  +[LSBundleRecord(Redaction) redactedProperties]::properties = (uint64_t)&unk_1E10759F8;

}

- (BOOL)eligibleForRedaction
{
  return 0;
}

- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  abort();
}

- (BOOL)unredactWithError:(id *)a3
{
  BOOL v3;
  _LSDServiceDomain *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const char *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _LSDServiceDomain *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  void **v38;
  id v39;
  char v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return 1;
  if (_LSCurrentProcessMayMapDatabase())
  {
    v41 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v7 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v38, v6, 0);

    if (v7)
    {
      v37 = 0;
      -[LSBundleRecord recordForUnredactingWithContext:error:](self, "recordForUnredactingWithContext:error:", v7, &v37);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v37;
      if (v8)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend((id)objc_opt_class(), "redactedProperties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v34 != v12)
                objc_enumerationMutation(v10);
              v14 = NSSelectorFromString(*(NSString **)(*((_QWORD *)&v33 + 1) + 8 * i));
              objc_msgSend(v8, v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[LSRecord _setResolvedPropertyValue:forGetter:](self, "_setResolvedPropertyValue:forGetter:", v15, v14);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v9, "addObject:", v15);

            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v11);
        }

        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __47__LSBundleRecord_Redaction__unredactWithError___block_invoke_2;
        v31[3] = &unk_1E10418C8;
        v16 = v9;
        v32 = v16;
        -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", &__block_literal_global_422, v31);
        *(_BYTE *)&self->_flags &= ~1u;

        v3 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v25 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v26 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v38, v25, 0);

      if (!v26)
      {
        v30 = v41;
        if (a3)
          goto LABEL_23;
        goto LABEL_26;
      }
      v30 = 0;
    }
    if (a3)
    {
LABEL_23:
      v30 = objc_retainAutorelease(v30);
      v3 = 0;
      v8 = 0;
      *a3 = v30;
      goto LABEL_27;
    }
LABEL_26:
    v3 = 0;
    v8 = 0;
LABEL_27:
    if (v38 && v40)
      _LSContextDestroy(v38);
    v27 = v39;
    v38 = 0;
    v39 = 0;

    v40 = 0;
    v28 = v41;
    v41 = 0;

    return v3;
  }
  _LSDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[LSBundleRecord(Redaction) unredactWithError:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

  if (!a3)
    return 0;
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[LSBundleRecord(Redaction) unredactWithError:]", 1788, 0);
  v3 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v3;
}

uint64_t __47__LSBundleRecord_Redaction__unredactWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_424);
}

uint64_t __47__LSBundleRecord_Redaction__unredactWithError___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "detach");
}

- (BOOL)appProtectionHidden
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_2();
  return 0;
}

- (BOOL)appProtectionLocked
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_2();
  return 0;
}

+ (void)bundleRecordForCurrentProcess
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "failure to find bundle record for our audit token: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)executableURLWithContext:tableID:unitID:unitBytes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Cannot generate executableURL for app %@ because it has no resolvable bundle URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)executableURLWithContext:tableID:unitID:unitBytes:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  v3 = 2048;
  v4 = v0;
  _os_log_debug_impl(&dword_182882000, v1, OS_LOG_TYPE_DEBUG, "Cannot generate executableURL for app %@ because it has no executable path stored (%llx)", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithNode:(os_log_t)log bundleIdentifier:context:tableID:unitID:bundleBaseData:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "could not resolve URL while initializing a bundle record!", v1, 2u);
  OUTLINED_FUNCTION_33();
}

- (void)_rawGroupContainerURLsCheckingRedaction
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_2(&dword_182882000, v0, v1, "could not unredact record %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_fallbackLocalizedName
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_182882000, v0, v1, "Asked for fallback localized name for a bundle for which we could not determine the last path component of its URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
