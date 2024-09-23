@implementation LSApplicationRecord

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)LSApplicationRecord;
  -[LSBundleRecord _detachFromContext:tableID:unitID:unitBytes:](&v29, sel__detachFromContext_tableID_unitID_unitBytes_, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_applicationExtensionRecords);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10++), "detach");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v8);
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__rawEnvironmentVariables);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "detach");

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedNamesWithContext);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_186);

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_supportedGameControllers);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "detach", (_QWORD)v21);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      }
      while (v18);
    }

  }
}

- (unint64_t)_rawBundleFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return *(_QWORD *)(&a6->_clas + 1);
}

- (id)applicationExtensionRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  _CSArrayEnumerateAllValues();
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

- (id)exactBundleVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (id)iTunesMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return -[LSiTunesMetadata _initWithContext:bundleData:]([LSiTunesMetadata alloc], "_initWithContext:bundleData:", a3, a6);
}

- (id)appClipMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v9;
  void *v10;
  _LSPlistHint *v11;
  void *v12;

  if ((-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags", a3, *(_QWORD *)&a4, *(_QWORD *)&a5) & 0x1000000000000000) != 0)
  {
    _LSDatabaseGetStringArray(a3->db);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSPlistGetValueForKey(a3->db, a6->base.infoDictionary, CFSTR("NSAppClip"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (_NSIsNSDictionary() & 1) == 0)
    {

      v12 = (void *)MEMORY[0x1E0C9AA70];
    }
    v9 = -[LSAppClipMetadata _initWithApplicationRecord:parentApplicationIdentifiers:appClipPlist:]([LSAppClipMetadata alloc], "_initWithApplicationRecord:parentApplicationIdentifiers:appClipPlist:", self, v10, v12);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)isPlaceholder
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 18) & 1;
}

- (unint64_t)_rawBundleFlags
{
  return __LSRECORD_GETTER__<unsigned long long>(self, (LSRecord *)a2, sel__rawBundleFlagsWithContext_tableID_unitID_unitBytes_);
}

- (id)shortVersionStringWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (unint64_t)applicationFamilyID
{
  return __LSRECORD_GETTER__<unsigned long long>(self, (LSRecord *)a2, sel_applicationFamilyIDWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)applicationFamilyIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->downloaderDSID;
}

- (id)bundleContainerURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__110;
  v13 = __Block_byref_object_dispose__111;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__LSApplicationRecord_Containers__bundleContainerURLWithContext_tableID_unitID_unitBytes___block_invoke;
  v8[3] = &unk_1E10400B8;
  v8[5] = a3;
  v8[6] = a6;
  v8[4] = &v9;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_iconFileNamesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (id)typeForInstallMachineryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (id)counterpartIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (unsigned)_rawPlistFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return HIDWORD(a6->_bundleFlags);
}

- (id)_personasWithAttributesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v7;
  void *v8;
  unsigned int i;
  _BYTE *v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  _LSPersonaWithAttributes *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, unsigned int);
  void *v23;
  void **p_p;
  void *__p;
  _BYTE *v26;
  uint64_t v27;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  _LSDatabaseGetStringArray(a3->db);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __p = 0;
  v26 = 0;
  v27 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __83__LSApplicationRecord__personasWithAttributesWithContext_tableID_unitID_unitBytes___block_invoke;
  v23 = &__block_descriptor_40_e14_v24__0I8I12_16l;
  p_p = &__p;
  _CSArrayEnumerateAllValues();
  for (i = 0; ; ++i)
  {
    v11 = __p;
    v10 = v26;
    v12 = objc_msgSend(v8, "count", v20, v21, v22, v23, p_p);
    v13 = v12 >= (v10 - v11) >> 3 ? (v10 - v11) >> 3 : v12;
    if (v13 <= i)
      break;
    v14 = [_LSPersonaWithAttributes alloc];
    v15 = *((_QWORD *)__p + i);
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:](v14, v15, v16);
    objc_msgSend(v7, "addObject:", v17);

  }
  objc_msgSend(v7, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v26 = __p;
    operator delete(__p);
  }

  return v18;
}

- (unsigned)_rawIconFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->_itemFlags;
}

- (id)_deviceIdentifierVendorNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return +[_LSDDeviceIdentifierService vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:](_LSDDeviceIdentifierService, "vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:", a3, *(_QWORD *)&a5, a6);
}

- (id)appTagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  uint64_t v7;
  void *v8;

  if ((a6->_bundleFlags & 0x80000000000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(_QWORD *)&a4, *(_QWORD *)&a5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_class(),
        objc_msgSend(v6, "objectForKey:ofClass:valuesOfClass:", CFSTR("SBAppTags"), v7, objc_opt_class()),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v8))
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v8;
}

- (unint64_t)installTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->bundleVersion;
}

- (unint64_t)installType
{
  return __LSRECORD_GETTER__<unsigned long>(self, (LSRecord *)a2, sel_installTypeWithContext_tableID_unitID_unitBytes_);
}

- (id)backgroundTaskSchedulerPermittedIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  void *v7;
  id v8;

  _LSDatabaseGetStringArray(a3->db);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v6;

  return v8;
}

- (id)VPNPluginsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if ((a6->_bundleFlags & 0x100000000000) == 0)
    return MEMORY[0x1E0C9AA60];
  -[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v8, "objectForKey:ofClass:valuesOfClass:", CFSTR("UIVPNPlugin"), v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    return v10;
  -[LSBundleRecord infoDictionary](self, "infoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:ofClass:", CFSTR("UIVPNPlugin"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    return MEMORY[0x1E0C9AA60];
  v13[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    return v10;
  else
    return MEMORY[0x1E0C9AA60];
}

- (id)_defaultCategoryTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (void *)_CSStringCopyCFString();
  if (v7)
    objc_msgSend(v6, "addObject:", v7);

  v8 = (void *)_CSStringCopyCFString();
  if (v8)
    objc_msgSend(v6, "addObject:", v8);

  v9 = (void *)objc_msgSend(v6, "copy");
  return v9;
}

- (unint64_t)applicationDownloaderDSID
{
  return __LSRECORD_GETTER__<unsigned long long>(self, (LSRecord *)a2, sel_applicationDownloaderDSIDWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)applicationDownloaderDSIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->purchaserDSID;
}

- (unint64_t)applicationDSID
{
  return __LSRECORD_GETTER__<unsigned long long>(self, (LSRecord *)a2, sel_applicationDSIDWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)applicationDSIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->staticDiskUsage;
}

- (id)_rawIconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, HIDWORD(a6->genreID), *(_QWORD *)&a5);
}

- (id)appStoreToolsBuildVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v6 = (__CFString *)_CSStringCopyCFString();
  v7 = v6;
  if (!v6)
    v6 = &stru_1E10473A0;
  v8 = v6;

  return v8;
}

- (id)_rawEnvironmentVariablesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a6->queriableSchemes, *(_QWORD *)&a5);
}

- (id)_preferredLaunchArchitectureWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSBundleGetPreferredLaunchArchitecture(a3->db, a5);
}

- (id)_linkedParentApplicationBundleIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (int)_bundleModTimeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSBundleDataGetModTime((uint64_t)a6);
}

- (void)_LSRecord_resolve__iconFileNames
{
  id v2;

  v2 = -[LSApplicationRecord _iconFileNames](self, "_iconFileNames");
}

- (id)managementDomainWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  __CFString *v6;

  v6 = (__CFString *)_CSStringCopyCFString();
  if (!v6)
    v6 = CFSTR("default");
  return v6;
}

- (id)supportedGameControllersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6;
  void *v7;
  uint64_t v9;
  id v10;

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = MEMORY[0x1E0C809B0];
  v10 = v6;
  _CSArrayEnumerateAllValues();
  v7 = (void *)objc_msgSend(v10, "copy", v9, 3221225472, __93__LSApplicationRecord_GameKit__supportedGameControllersWithContext_tableID_unitID_unitBytes___block_invoke, &unk_1E10402B8);

  return v7;
}

- (id)stashedAppMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  LSStashedAppMetadata *v6;

  if (a6->appClipFields.parentAppIDs)
    v6 = -[LSStashedAppMetadata initWithContext:unitID:]([LSStashedAppMetadata alloc], "initWithContext:unitID:", a3, a6->appClipFields.parentAppIDs);
  else
    v6 = 0;
  return v6;
}

- (id)staticShortcutItemsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  -[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend(v6, "objectForKey:ofClass:valuesOfClass:", CFSTR("UIApplicationShortcutItems"), v7, objc_opt_class());
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (void *)v8;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  return v9;
}

- (id)userActivityTypesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  void *v7;

  _LSDatabaseGetStringArray(a3->db);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  else
    v7 = 0;

  return v7;
}

- (id)directionsModesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  uint64_t v7;
  void *v8;

  if ((a6->_bundleFlags & 0x10000000000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(_QWORD *)&a4, *(_QWORD *)&a5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_class(),
        objc_msgSend(v6, "objectForKey:ofClass:valuesOfClass:", CFSTR("MKDirectionsApplicationSupportedModes"), v7, objc_opt_class()), v8 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v8))
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v8;
}

- (id)carPlayInstrumentClusterURLSchemesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  void *v7;
  id v8;

  _LSDatabaseGetStringArray(a3->db);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v6;

  return v8;
}

- (id)maximumSystemVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  __int128 v6;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = *(_OWORD *)&a6->_maxSystemVersion._opaque[8];
  v8[0] = *(_OWORD *)&a6->_minSystemVersion._opaque[24];
  v8[1] = v6;
  _LSVersionNumberGetStringRepresentation(v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)companionBundleIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return 0;
}

- (unint64_t)placeholderFailureReasonWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return *(_QWORD *)&a6->shortVersionString;
}

- (id)requiredDeviceCapabilitiesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((a6->_bundleFlags & 0x200000000000) == 0)
    return MEMORY[0x1E0C9AA70];
  -[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v8, "objectForKey:ofClass:valuesOfClass:", CFSTR("UIRequiredDeviceCapabilities"), v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    return v10;
  -[LSBundleRecord infoDictionary](self, "infoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  objc_msgSend(v11, "objectForKey:ofClass:valuesOfClass:", CFSTR("UIRequiredDeviceCapabilities"), v12, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    return MEMORY[0x1E0C9AA70];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v21;
    v18 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

  v10 = (void *)objc_msgSend(v14, "copy");
  if (v10)
    return v10;
  else
    return MEMORY[0x1E0C9AA70];
}

- (id)externalAccessoryProtocolsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  uint64_t v7;
  void *v8;

  if ((a6->_bundleFlags & 0x800000000000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(_QWORD *)&a4, *(_QWORD *)&a5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_class(),
        objc_msgSend(v6, "objectForKey:ofClass:valuesOfClass:", CFSTR("UISupportedExternalAccessoryProtocols"), v7, objc_opt_class()), v8 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v8))
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v8;
}

- (id)deviceFamiliesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  _CSArrayEnumerateAllValues();
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

- (id)audioComponentsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  uint64_t v7;
  void *v8;

  if ((a6->_bundleFlags & 0x40000000000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(_QWORD *)&a4, *(_QWORD *)&a5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_class(),
        objc_msgSend(v6, "objectForKey:ofClass:valuesOfClass:", CFSTR("AudioComponents"), v7, objc_opt_class()),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v8))
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v8;
}

- (void)_LSRecord_resolve_bundleContainerURL
{
  id v2;

  v2 = -[LSApplicationRecord bundleContainerURL](self, "bundleContainerURL");
}

- (id)minimumSystemVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  __int128 v6;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = *(_OWORD *)&a6->_minSystemVersion._opaque[8];
  v8[0] = *(_OWORD *)&a6->_mtime;
  v8[1] = v6;
  _LSVersionNumberGetStringRepresentation(v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isSystemPlaceholderWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->_clas == 14;
}

- (BOOL)isDeletableSystemApplicationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  int installFailureReason_high;

  return (a6->_bundleFlags & 0x100) != 0
      && (installFailureReason_high = HIDWORD(a6->installFailureReason)) != 0
      && _LSDatabaseGetStringForCFString(a3->db, CFSTR("System"), 0) == installFailureReason_high;
}

- (id)equivalentBundleIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (id)driverExtensionPathsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (unint64_t)compatibilityState
{
  return __LSRECORD_GETTER__<unsigned long>(self, (LSRecord *)a2, sel_compatibilityStateWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)compatibilityStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->sequenceNumber;
}

- (void)_LSRecord_resolve_exactBundleVersion
{
  id v2;

  v2 = -[LSApplicationRecord exactBundleVersion](self, "exactBundleVersion");
}

- (unint64_t)placeholderFailureReason
{
  return __LSRECORD_GETTER__<unsigned long>(self, (LSRecord *)a2, sel_placeholderFailureReasonWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isSystemPlaceholder
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isSystemPlaceholderWithContext_tableID_unitID_unitBytes_);
}

- (int)_bundleModTime
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel__bundleModTimeWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isDeletableSystemApplication
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isDeletableSystemApplicationWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isAppStoreVendable
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isAppStoreVendableWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isDeletable
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isDeletableWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_appClipMetadata
{
  id v2;

  v2 = -[LSApplicationRecord appClipMetadata](self, "appClipMetadata");
}

- (LSAppClipMetadata)appClipMetadata
{
  return (LSAppClipMetadata *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_appClipMetadataWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_shortVersionString
{
  id v2;

  v2 = -[LSApplicationRecord shortVersionString](self, "shortVersionString");
}

- (NSString)shortVersionString
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_shortVersionStringWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_uniqueInstallIdentifier
{
  id v2;

  v2 = -[LSApplicationRecord uniqueInstallIdentifier](self, "uniqueInstallIdentifier");
}

- (NSData)uniqueInstallIdentifier
{
  return (NSData *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_uniqueInstallIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_counterpartIdentifiers
{
  id v2;

  v2 = -[LSApplicationRecord counterpartIdentifiers](self, "counterpartIdentifiers");
}

- (NSArray)counterpartIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_counterpartIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_appTags
{
  id v2;

  v2 = -[LSApplicationRecord appTags](self, "appTags");
}

- (NSArray)appTags
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_appTagsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_VPNPlugins
{
  id v2;

  v2 = -[LSApplicationRecord VPNPlugins](self, "VPNPlugins");
}

- (NSArray)VPNPlugins
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_VPNPluginsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__rawIconDictionary
{
  id v2;

  v2 = -[LSApplicationRecord _rawIconDictionary](self, "_rawIconDictionary");
}

- (_LSLazyPropertyList)_rawIconDictionary
{
  return (_LSLazyPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__rawIconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_appStoreToolsBuildVersion
{
  id v2;

  v2 = -[LSApplicationRecord appStoreToolsBuildVersion](self, "appStoreToolsBuildVersion");
}

- (NSString)appStoreToolsBuildVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_appStoreToolsBuildVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__preferredLaunchArchitecture
{
  id v2;

  v2 = -[LSApplicationRecord _preferredLaunchArchitecture](self, "_preferredLaunchArchitecture");
}

- (NSString)_preferredLaunchArchitecture
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__preferredLaunchArchitectureWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__linkedParentApplicationBundleID
{
  id v2;

  v2 = -[LSApplicationRecord _linkedParentApplicationBundleID](self, "_linkedParentApplicationBundleID");
}

- (NSString)_linkedParentApplicationBundleID
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__linkedParentApplicationBundleIDWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__defaultCategoryTypeIdentifiers
{
  id v2;

  v2 = -[LSApplicationRecord _defaultCategoryTypeIdentifiers](self, "_defaultCategoryTypeIdentifiers");
}

- (NSArray)_defaultCategoryTypeIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__defaultCategoryTypeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_backgroundTaskSchedulerPermittedIdentifiers
{
  id v2;

  v2 = -[LSApplicationRecord backgroundTaskSchedulerPermittedIdentifiers](self, "backgroundTaskSchedulerPermittedIdentifiers");
}

- (NSArray)backgroundTaskSchedulerPermittedIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_backgroundTaskSchedulerPermittedIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedNamesWithContext
{
  id v2;

  v2 = -[LSApplicationRecord _localizedNamesWithContext](self, "_localizedNamesWithContext");
}

- (NSDictionary)_localizedNamesWithContext
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedNamesWithContextWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_stashedAppMetadata
{
  id v2;

  v2 = -[LSApplicationRecord stashedAppMetadata](self, "stashedAppMetadata");
}

- (LSStashedAppMetadata)stashedAppMetadata
{
  return (LSStashedAppMetadata *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_stashedAppMetadataWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_staticShortcutItems
{
  id v2;

  v2 = -[LSApplicationRecord staticShortcutItems](self, "staticShortcutItems");
}

- (NSArray)staticShortcutItems
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_staticShortcutItemsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_deviceFamilies
{
  id v2;

  v2 = -[LSApplicationRecord deviceFamilies](self, "deviceFamilies");
}

- (NSArray)deviceFamilies
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_deviceFamiliesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_equivalentBundleIdentifiers
{
  id v2;

  v2 = -[LSApplicationRecord equivalentBundleIdentifiers](self, "equivalentBundleIdentifiers");
}

- (NSArray)equivalentBundleIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_equivalentBundleIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_carPlayInstrumentClusterURLSchemes
{
  id v2;

  v2 = -[LSApplicationRecord carPlayInstrumentClusterURLSchemes](self, "carPlayInstrumentClusterURLSchemes");
}

- (NSArray)carPlayInstrumentClusterURLSchemes
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_carPlayInstrumentClusterURLSchemesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_supportedGameControllers
{
  id v2;

  v2 = -[LSApplicationRecord supportedGameControllers](self, "supportedGameControllers");
}

- (NSArray)supportedGameControllers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_supportedGameControllersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_audioComponents
{
  id v2;

  v2 = -[LSApplicationRecord audioComponents](self, "audioComponents");
}

- (NSArray)audioComponents
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_audioComponentsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_companionBundleIdentifier
{
  id v2;

  v2 = -[LSApplicationRecord companionBundleIdentifier](self, "companionBundleIdentifier");
}

- (NSString)companionBundleIdentifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_companionBundleIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_requiredDeviceCapabilities
{
  id v2;

  v2 = -[LSApplicationRecord requiredDeviceCapabilities](self, "requiredDeviceCapabilities");
}

- (NSDictionary)requiredDeviceCapabilities
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_requiredDeviceCapabilitiesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_externalAccessoryProtocols
{
  id v2;

  v2 = -[LSApplicationRecord externalAccessoryProtocols](self, "externalAccessoryProtocols");
}

- (NSArray)externalAccessoryProtocols
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_externalAccessoryProtocolsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_directionsModes
{
  id v2;

  v2 = -[LSApplicationRecord directionsModes](self, "directionsModes");
}

- (NSArray)directionsModes
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_directionsModesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_minimumSystemVersion
{
  id v2;

  v2 = -[LSApplicationRecord minimumSystemVersion](self, "minimumSystemVersion");
}

- (NSString)minimumSystemVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_minimumSystemVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_maximumSystemVersion
{
  id v2;

  v2 = -[LSApplicationRecord maximumSystemVersion](self, "maximumSystemVersion");
}

- (NSString)maximumSystemVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_maximumSystemVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_driverExtensionPaths
{
  id v2;

  v2 = -[LSApplicationRecord driverExtensionPaths](self, "driverExtensionPaths");
}

- (NSArray)driverExtensionPaths
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_driverExtensionPathsWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isBeta
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 21) & 1;
}

- (void)_LSRecord_resolve_regulatoryPrivacyDisclosureVersion
{
  id v2;

  v2 = -[LSApplicationRecord regulatoryPrivacyDisclosureVersion](self, "regulatoryPrivacyDisclosureVersion");
}

- (NSString)regulatoryPrivacyDisclosureVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_regulatoryPrivacyDisclosureVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_managementDomain
{
  id v2;

  v2 = -[LSApplicationRecord managementDomain](self, "managementDomain");
}

- (NSString)managementDomain
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_managementDomainWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_diskUsage
{
  id v2;

  v2 = -[LSApplicationRecord diskUsage](self, "diskUsage");
}

- (_LSDiskUsage)diskUsage
{
  return (_LSDiskUsage *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_diskUsageWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_installSessionIdentifier
{
  id v2;

  v2 = -[LSApplicationRecord installSessionIdentifier](self, "installSessionIdentifier");
}

- (NSData)installSessionIdentifier
{
  return (NSData *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_installSessionIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2;

  v2 = -[LSApplicationRecord iconDictionary](self, "iconDictionary");
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isLaunchProhibited
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 41) & 1;
}

- (BOOL)isArcadeApp
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 59) & 1;
}

- (id)diskUsageWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("static");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&a6->vendorName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    v11 = (id *)-[_LSBundleIDValidationToken initWithBundleIdentifier:]([_LSBundleIDValidationToken alloc], v8);
    -[_LSValidationToken setOwner:](v11, self);
  }
  else
  {
    v11 = 0;
  }
  v12 = -[_LSDiskUsage _initWithBundleIdentifier:alreadyKnownUsage:validationToken:]([_LSDiskUsage alloc], "_initWithBundleIdentifier:alreadyKnownUsage:validationToken:", v8, v10, v11);

  return v12;
}

- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 placeholderBehavior:(int64_t)a5 systemPlaceholder:(BOOL)a6 itemID:(unint64_t)a7 forceInBundleContainer:(BOOL)a8 context:(LSContext *)a9 error:(id *)a10
{
  NSObject *v17;
  void **p_db;
  _LSDServiceDomain *v19;
  void **v20;
  int v21;
  uint64_t v22;
  id v23;
  _LSDServiceDomain *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v32[11];
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  void **v39;
  id v40;
  char v41;
  id v42;
  uint64_t v43;
  const __CFString *v44;
  _BYTE buf[24];
  unint64_t v46;
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (_LSLogAppRecordInitsForDataSeparation::onceToken != -1)
    dispatch_once(&_LSLogAppRecordInitsForDataSeparation::onceToken, &__block_literal_global_4);
  if (_LSLogAppRecordInitsForDataSeparation::result)
  {
    _LSDataSeparationLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2048;
      v46 = a7;
      _os_log_impl(&dword_182882000, v17, OS_LOG_TYPE_INFO, "application record search init. Node: %@ bundleID: %@ itemID: %llu", buf, 0x20u);
    }

  }
  p_db = (void **)&a9->db;
  if (!a9)
    p_db = (void **)_LSDatabaseContextGetCurrentContext(0);
  v39 = p_db;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v19 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v20 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v39, v19, 0);

  if (v20)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v46 = (unint64_t)__Block_byref_object_copy__110;
    v47 = __Block_byref_object_dispose__111;
    v48 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke;
    v32[3] = &unk_1E103FF80;
    v33 = a6;
    v32[4] = a4;
    v32[5] = a3;
    v32[8] = v20;
    v32[9] = a7;
    v32[6] = &v35;
    v32[7] = buf;
    v32[10] = a5;
    v34 = a8;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v32);
    if (a10)
      *a10 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v21 = *((_DWORD *)v36 + 6);
    if (v21)
    {
      v22 = _LSBundleGet(*v20, v21);
      if (v22)
      {
        v23 = -[LSApplicationRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:](self, "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", a3, a4, v20, *((unsigned int *)*v20 + 5), *((unsigned int *)v36 + 6), v22, a10);
LABEL_21:
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v35, 8);
        goto LABEL_25;
      }
      if (a10)
      {
        v43 = *MEMORY[0x1E0CB2938];
        v44 = CFSTR("Unable to find this application record in the Launch Services database.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]", 1158, v27);
        *a10 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    v23 = 0;
    goto LABEL_21;
  }
  if (a10)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v24 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v25 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v39, v24, 0);

    if (v25)
      v26 = 0;
    else
      v26 = objc_retainAutorelease(v42);
    *a10 = v26;
  }

  v23 = 0;
LABEL_25:
  v28 = v23;
  if (v39 && v41)
    _LSContextDestroy(v39);
  v29 = v40;
  v39 = 0;
  v40 = 0;

  v41 = 0;
  v30 = v42;
  v42 = 0;

  return v28;
}

- (id)_initWithContext:(LSContext *)a3 bundleID:(unsigned int)a4 bundleData:(const LSBundleData *)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v7 = (uint64_t)a5;
  v8 = *(_QWORD *)&a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (a5)
    return -[LSApplicationRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:](self, "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", 0, 0, a3, a3->db->schema.bundleTable, v8, v7, a6);
  v7 = _LSBundleGet(a3->db, a4);
  if (v7)
    return -[LSApplicationRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:](self, "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", 0, 0, a3, a3->db->schema.bundleTable, v8, v7, a6);
  if (a6)
  {
    v13 = *MEMORY[0x1E0CB2938];
    v14[0] = CFSTR("Unable to find this application record in the Launch Services database.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]", 1302, v12);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

void __87__LSApplicationRecord_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  LSApplicationExtensionRecord *v5;
  uint64_t v6;
  id *v7;
  id v8;
  NSObject *v9;
  id v10;

  v5 = [LSApplicationExtensionRecord alloc];
  v6 = *(_QWORD *)(a1 + 48);
  v10 = 0;
  v7 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:](v5, "_initWithContext:pluginID:pluginData:error:", v6, a3, 0, &v10);
  v8 = v10;
  if (v7)
  {
    objc_storeWeak(v7 + 10, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  else
  {
    _LSDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __87__LSApplicationRecord_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes___block_invoke_cold_1(a3, (uint64_t)v8, v9);

  }
}

- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 context:(LSContext *)a5 tableID:(unsigned int)a6 unitID:(unsigned int)a7 bundleBaseData:(const LSBundleBaseData *)a8 error:(id *)a9
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v15;
  id v16;
  objc_super v18;
  _QWORD v19[7];
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__110;
  v31 = __Block_byref_object_dispose__111;
  v32 = a3;
  v15 = v28[5];
  if (v15)
    goto LABEL_5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__110;
  v25 = __Block_byref_object_dispose__111;
  v26 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__LSApplicationRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke;
  v19[3] = &unk_1E1040008;
  v19[5] = &v21;
  v19[6] = a5;
  v20 = v10;
  v19[4] = &v27;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v19);
  if (a9)
    *a9 = objc_retainAutorelease((id)v22[5]);
  _Block_object_dispose(&v21, 8);

  v15 = v28[5];
  if (v15)
  {
LABEL_5:
    v18.receiver = self;
    v18.super_class = (Class)LSApplicationRecord;
    v16 = -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:](&v18, sel__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error_, v15, a4, a5, v11, v10, a8, a9);
  }
  else
  {

    v16 = 0;
  }
  _Block_object_dispose(&v27, 8);

  return v16;
}

void __98__LSApplicationRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id obj;

  v2 = _LSBundleCopyNode(**(_QWORD **)(a1 + 48), *(unsigned int *)(a1 + 56), 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  _LSGetNSErrorFromOSStatusImpl(v2, &obj, (uint64_t)"-[LSApplicationRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]_block_invoke", 1264);
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id obj;

  if (*(_BYTE *)(a1 + 88))
  {
    v2 = *(void **)(a1 + 64);
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 72);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v6 + 40);
    v7 = _LSFindBundleWithInfo(v2, 7uLL, v3, 0, v4, v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = a1 + 48;
LABEL_15:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24) = v7;

    return;
  }
  v9 = *(_QWORD *)(a1 + 80);
  switch(v9)
  {
    case 1uLL:
    case 3uLL:
      v10 = 3;
      goto LABEL_7;
    case 2uLL:
      v10 = 1;
      v9 = 3;
      goto LABEL_7;
    case 4uLL:
      v10 = 8;
      if (*(_BYTE *)(a1 + 89))
      {
        v9 = 8;
LABEL_11:
        v12 = CFSTR("must be in bundle container");
        v11 = &__block_literal_global_123;
      }
      else
      {
        v12 = CFSTR("must be remote placeholder");
        v9 = 8;
        v11 = &__block_literal_global_126;
      }
      break;
    default:
      v9 = 1;
      v10 = 1;
LABEL_7:
      if (*(_BYTE *)(a1 + 89))
        goto LABEL_11;
      v11 = 0;
      v12 = 0;
      break;
  }
  v13 = *(void **)(a1 + 64);
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 72);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v23 = *(id *)(v17 + 40);
  LODWORD(v13) = _LSFindBundleWithInfo_NoIOFiltered(v13, v9, v14, 0, v15, v16, v12, v11, &v23);
  objc_storeStrong((id *)(v17 + 40), v23);
  v8 = a1 + 48;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)v13;

  if (v9 != v10 && !*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24))
  {
    v18 = *(void **)(a1 + 64);
    v19 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 72);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(id *)(v21 + 40);
    v7 = _LSFindBundleWithInfo_NoIOFiltered(v18, v10, v19, 0, v4, v20, v12, v11, &v22);
    objc_storeStrong((id *)(v21 + 40), v22);
    goto LABEL_15;
  }
}

void __90__LSApplicationRecord_Containers__bundleContainerURLWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = _LSAliasCopyResolvedNode(**(void ***)(a1 + 40), *(_DWORD *)(*(_QWORD *)(a1 + 48) + 504), 0, 0, 0);
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "URL");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v6;
  LSApplicationProxy *v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)&a5;
  v9 = [LSApplicationProxy alloc];
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[LSApplicationProxy _initWithContext:bundleUnit:applicationRecord:bundleID:resolveAndDetach:](v9, "_initWithContext:bundleUnit:applicationRecord:bundleID:resolveAndDetach:", a3, v6, self, v10, 0);

  return v11;
}

- (NSString)exactBundleVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_exactBundleVersionWithContext_tableID_unitID_unitBytes_);
}

- (NSURL)bundleContainerURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_bundleContainerURLWithContext_tableID_unitID_unitBytes_);
}

- (NSArray)_iconFileNames
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__iconFileNamesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_typeForInstallMachinery
{
  id v2;

  v2 = -[LSApplicationRecord typeForInstallMachinery](self, "typeForInstallMachinery");
}

- (NSString)typeForInstallMachinery
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_typeForInstallMachineryWithContext_tableID_unitID_unitBytes_);
}

uint64_t __67__LSApplicationRecord__detachFromContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  if ((void *)*MEMORY[0x1E0C9B0D0] != a3)
    return objc_msgSend(a3, "detach");
  return result;
}

- (void)_LSRecord_resolve_userActivityTypes
{
  id v2;

  v2 = -[LSApplicationRecord userActivityTypes](self, "userActivityTypes");
}

- (NSSet)userActivityTypes
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_userActivityTypesWithContext_tableID_unitID_unitBytes_);
}

void __93__LSApplicationRecord_InfoPlistRarities__deviceFamiliesWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");

}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  _LSDatabase *db;
  uint64_t v10;
  void *v13;

  db = a3->db;
  if (a4->var3 != a3->db->schema.bundleTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationRecord.mm"), 1520, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pi->tableID == ctx->db->schema.bundleTable"));

    db = a3->db;
  }
  v10 = _LSBundleGet(db, a4->var2);
  if (v10 && a5 == 36 && *(_QWORD *)a4->var5 == *(_QWORD *)(v10 + 272))
    return -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:](self, "_initWithContext:bundleID:bundleData:error:", a3, a4->var2, v10, 0);

  return 0;
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LSApplicationRecord;
  -[LSRecord _persistentIdentifierWithContext:tableID:unitID:unitBytes:](&v11, sel__persistentIdentifierWithContext_tableID_unitID_unitBytes_, a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "appendBytes:length:", (char *)a6 + 272, 8);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (BOOL)isManagedAppDistributor
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 18) & 1;
}

- (LSBundleMoreFlags)_rawMoreFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (LSBundleMoreFlags)(*(unsigned __int16 *)((char *)&a6->_itemFlags + 1) | (HIBYTE(a6->_itemFlags) << 16));
}

- (LSBundleMoreFlags)_rawMoreFlags
{
  return (LSBundleMoreFlags)__LSRECORD_GETTER__<LSBundleMoreFlags>(self, (LSRecord *)a2, sel__rawMoreFlagsWithContext_tableID_unitID_unitBytes_);
}

- (NSString)alternateIconName
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__110;
  v10 = __Block_byref_object_dispose__111;
  v11 = 0;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "allowsAlternateIcons")
    && -[LSApplicationRecord supportsAlternateIconNames](self, "supportsAlternateIconNames"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke;
    v5[3] = &unk_1E1040240;
    v5[4] = self;
    v5[5] = &v6;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v5);
  }
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  if (HIDWORD(a6->genreID))
  {
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)_CSStringCopyCFString();
    if (!-[LSApplicationRecord supportsAlternateIconNames](self, "supportsAlternateIconNames"))
      goto LABEL_12;
    -[LSApplicationRecord alternateIconName](self, "alternateIconName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = v9 ? (void *)v9 : v8;
    v12 = v11;

    if (!v12)
      goto LABEL_12;
    objc_msgSend(v7, "objectForKey:ofClass:", CFSTR("CFBundleAlternateIcons"), objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    objc_msgSend(v13, "objectForKey:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v14 && v15 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v16 = 0;
    }

    if (!v16)
    {
LABEL_12:
      objc_msgSend(v7, "objectForKey:ofClass:", CFSTR("CFBundlePrimaryIcon"), objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "objectForKey:ofClass:", CFSTR("ISGraphicIconConfiguration"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)objc_opt_new();
      objc_msgSend(v18, "setObject:forKey:", v17, CFSTR("ISGraphicIconConfiguration"));
      if (v16)
      {
        objc_msgSend(v18, "addEntriesFromDictionary:", v16);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v19;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (BOOL)supportsAlternateIconNames
{
  return (-[LSApplicationRecord _rawIconFlags](self, "_rawIconFlags") >> 3) & 1;
}

- (unsigned)_rawIconFlags
{
  return __LSRECORD_GETTER__<unsigned char>(self, (LSRecord *)a2, sel__rawIconFlagsWithContext_tableID_unitID_unitBytes_);
}

void __83__LSApplicationRecord__personasWithAttributesWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a3;
  v5 = *(_QWORD **)(v3 + 8);
  v6 = *(_QWORD *)(v3 + 16);
  if ((unint64_t)v5 >= v6)
  {
    v8 = *(_QWORD **)v3;
    v9 = ((uint64_t)v5 - *(_QWORD *)v3) >> 3;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      abort();
    v11 = v6 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<os_eligibility_answer_t>>(v3 + 16, v12);
      v8 = *(_QWORD **)v3;
      v5 = *(_QWORD **)(v3 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = v4;
    v7 = v14 + 8;
    while (v5 != v8)
    {
      v16 = *--v5;
      *((_QWORD *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(_QWORD *)v3 = v14;
    *(_QWORD *)(v3 + 8) = v7;
    *(_QWORD *)(v3 + 16) = v15;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v5 = a3;
    v7 = v5 + 1;
  }
  *(_QWORD *)(v3 + 8) = v7;
}

+ (id)_propertyClasses
{
  _QWORD v3[14];

  v3[13] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)jobLabel
{
  void *v3;
  void *v4;

  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x80) != 0)
  {
    -[LSBundleRecord infoDictionary](self, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("LSLaunchDLabel"), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (id)supportedIntentMediaCategories
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x200000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_class(),
        objc_msgSend(v3, "objectForKey:ofClass:valuesOfClass:", CFSTR("INSupportedMediaCategories"), v4, objc_opt_class()), v5 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v5))
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (id)intentsRestrictedWhileProtectedDataUnavailable
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x200000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_class(),
        objc_msgSend(v3, "objectForKey:ofClass:valuesOfClass:", CFSTR("INIntentsRestrictedWhileProtectedDataUnavailable"), v4, objc_opt_class()), v5 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v5))
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (id)intentsRestrictedWhileLocked
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x200000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_class(),
        objc_msgSend(v3, "objectForKey:ofClass:valuesOfClass:", CFSTR("INIntentsRestrictedWhileLocked"), v4, objc_opt_class()), v5 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v5))
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (id)supportedIntents
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x200000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_class(),
        objc_msgSend(v3, "objectForKey:ofClass:valuesOfClass:", CFSTR("INIntentsSupported"), v4, objc_opt_class()),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v5))
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (unsigned)_rawPlistFlags
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel__rawPlistFlagsWithContext_tableID_unitID_unitBytes_);
}

- (id)_localizedNamesWithContextWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__110;
  v13 = __Block_byref_object_dispose__111;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__LSApplicationRecord__localizedNamesWithContextWithContext_tableID_unitID_unitBytes___block_invoke;
  v8[3] = &unk_1E1040050;
  v8[4] = &v9;
  v8[5] = a6;
  v8[6] = a3;
  _LSBundleDisplayNameContextEnumerate(v8);
  v6 = (void *)objc_msgSend((id)v10[5], "copy");
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __86__LSApplicationRecord__localizedNamesWithContextWithContext_tableID_unitID_unitBytes___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = *(_QWORD *)(a1[4] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = -[_LSLocalizedStringRecord _initWithContext:unitID:]([_LSLocalizedStringRecord alloc], "_initWithContext:unitID:", a1[6], *(unsigned int *)(a1[5] + 4 * a2 + 516));
  v10 = v9;
  if (v9)
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "setObject:forKeyedSubscript:", v9, a3);
  else
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9B0D0], a3);

}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  void (*v14[4])(_QWORD, _QWORD);
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    +[LSAltIconManager sharedInstance](LSAltIconManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v3, "alternateIconNameForIdentifier:error:", v2, &v16);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v16;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      if (_LSIconsLog(void)::onceToken != -1)
        dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_879);
      if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEBUG))
        __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2_cold_1((uint64_t)v2);
    }
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v14[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v14[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_586;
    v14[3] = (void (*)(_QWORD, _QWORD))&unk_1E10400E0;
    v9 = v2;
    v15 = v9;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDIconService, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_587;
    v11[3] = &unk_1E1040218;
    v13 = *(_QWORD *)(a1 + 40);
    v12 = v9;
    objc_msgSend(v10, "getAlternateIconNameForIdentifier:reply:", v12, v11);

    v5 = v15;
  }

}

- (NSUUID)deviceIdentifierForVendor
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  void (*v10[5])(_QWORD, _QWORD);
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__110;
  v15 = __Block_byref_object_dispose__111;
  v16 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v10[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v10[2] = __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke;
  v10[3] = (void (*)(_QWORD, _QWORD))&unk_1E10400E0;
  v10[4] = (void (*)(_QWORD, _QWORD))self;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRecord _deviceIdentifierVendorName](self, "_deviceIdentifierVendorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke_470;
  v9[3] = &unk_1E1040108;
  v9[4] = &v11;
  objc_msgSend(v4, "getIdentifierOfType:vendorName:bundleIdentifier:completionHandler:", 0, v5, v6, v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSUUID *)v7;
}

- (void)_LSRecord_resolve__deviceIdentifierVendorName
{
  id v2;

  v2 = -[LSApplicationRecord _deviceIdentifierVendorName](self, "_deviceIdentifierVendorName");
}

- (NSString)_deviceIdentifierVendorName
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__deviceIdentifierVendorNameWithContext_tableID_unitID_unitBytes_);
}

- (LSApplicationRecord)initWithURL:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  return -[LSApplicationRecord initWithURL:fetchingPlaceholder:error:](self, "initWithURL:fetchingPlaceholder:error:", a3, a4, a5);
}

- (BOOL)supportsMultiwindow
{
  int base_platform;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  -[LSBundleRecord platform](self, "platform");
  base_platform = dyld_get_base_platform();
  if ((base_platform - 2) < 2)
  {
LABEL_4:
    -[LSBundleRecord infoDictionary](self, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("UIApplicationSceneManifest"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UIApplicationSupportsMultipleScenes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "BOOLValue");
LABEL_17:

        return v7;
      }
    }
    else
    {
      -[LSBundleRecord infoDictionary](self, "infoDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:ofClass:", CFSTR("UIApplicationInterfaceManifest"), objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UIApplicationSupportsMultiwindow"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
          v7 = objc_msgSend(v9, "BOOLValue");
        else
          v7 = 0;

        goto LABEL_17;
      }
    }
    v7 = 0;
    goto LABEL_17;
  }
  if (base_platform == 1)
    return 1;
  if (base_platform == 11)
    goto LABEL_4;
  return 0;
}

+ (id)enumeratorWithOptions:(unint64_t)a3
{
  return -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]([_LSApplicationRecordEnumerator alloc], "initWithContext:volumeURL:options:", 0, 0, a3);
}

- (void)_LSRecord_resolve_applicationExtensionRecords
{
  id v2;

  v2 = -[LSApplicationRecord applicationExtensionRecords](self, "applicationExtensionRecords");
}

- (NSSet)applicationExtensionRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes_);
}

- (LSApplicationRecord)initWithBundleIdentifierOfSystemPlaceholder:(id)a3 error:(id *)a4
{
  return (LSApplicationRecord *)-[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:](self, "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:", 0, a3, 0, 1, 0, 0, 0, a4);
}

- (void)_LSRecord_resolve_applicationState
{
  id v2;

  v2 = -[LSApplicationRecord applicationState](self, "applicationState");
}

- (_LSApplicationState)applicationState
{
  return (_LSApplicationState *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_applicationStateWithContext_tableID_unitID_unitBytes_);
}

- (id)applicationStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  unint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t bundleVersion;
  _LSApplicationState *v14;
  void *v15;
  _LSApplicationState *v16;

  v8 = -[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v9 = 12;
  v10 = 41;
  if ((v8 & 0x40000) != 0)
    v10 = 12;
  v11 = 32;
  if ((v8 & 0x40000) == 0)
  {
    v11 = 2;
    v9 = 20;
  }
  v12 = (v8 >> v10) & v11 | v9;
  bundleVersion = a6->bundleVersion;
  v14 = [_LSApplicationState alloc];
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_LSApplicationState initWithBundleIdentifier:stateFlags:ratingRank:installType:](v14, "initWithBundleIdentifier:stateFlags:ratingRank:installType:", v15, v12, a6->sourceAppBundleID, bundleVersion);

  return v16;
}

- (LSApplicationRecord)initWithURL:(id)a3 fetchingPlaceholder:(int64_t)a4 error:(id *)a5
{
  FSNode *v8;
  LSApplicationRecord *v9;

  v8 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", a3, 0, 0);
  v9 = -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:](self, "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:", v8, 0, a4, 0, 0, 0, 0, a5);

  return v9;
}

- (LSApplicationRecord)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  return -[LSApplicationRecord initWithBundleIdentifier:fetchingPlaceholder:error:](self, "initWithBundleIdentifier:fetchingPlaceholder:error:", a3, a4, a5);
}

- (LSApplicationRecord)initWithBundleIdentifier:(id)a3 fetchingPlaceholder:(int64_t)a4 error:(id *)a5
{
  return (LSApplicationRecord *)-[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:](self, "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:", 0, a3, a4, 0, 0, 0, 0, a5);
}

- (NSArray)identities
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  LSApplicationIdentity *v9;
  _QWORD *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[LSApplicationRecord _personasWithAttributes](self, "_personasWithAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__LSApplicationRecord_Identities__identities__block_invoke;
    v13[3] = &unk_1E1040300;
    v13[4] = self;
    XNSArrayByMappingBlock(v3, v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) != 0
         || (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isUsingEphemeralStorage") & 1) != 0)
  {
    v5 = -[LSApplicationIdentity initForRecord:personaWithAttributes:]([LSApplicationIdentity alloc], "initForRecord:personaWithAttributes:", self, 0);
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[LSApplicationRecord(Identities) identities].cold.1(v6);

    +[LSApplicationRecord personalPersonaAttributes](LSApplicationRecord, "personalPersonaAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userPersonaUniqueString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [LSApplicationIdentity alloc];
    v10 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], 1, v8);
    v11 = -[LSApplicationIdentity initForRecord:personaWithAttributes:](v9, "initForRecord:personaWithAttributes:", self, v10);
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v4;
}

- (id)managedPersonas
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[LSApplicationRecord _personasWithAttributes](self, "_personasWithAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[_LSPersonaWithAttributes personaType]((uint64_t)v3);

    if (v4 == 1)
    {

      v2 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  XNSArrayByMappingBlock(v2, &__block_literal_global_134);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __45__LSApplicationRecord_Identities__identities__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[LSApplicationIdentity initForRecord:personaWithAttributes:]([LSApplicationIdentity alloc], "initForRecord:personaWithAttributes:", *(_QWORD *)(a1 + 32), a2);
}

- (NSDictionary)additionalEnvironmentVariables
{
  _BOOL4 v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  unsigned int active_platform;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;

  if (!-[LSBundleRecord isRedacted](self, "isRedacted"))
    goto LABEL_4;
  v20 = 0;
  v3 = -[LSBundleRecord unredactWithError:](self, "unredactWithError:", &v20);
  v4 = v20;
  v5 = v4;
  if (v3)
  {

LABEL_4:
    v6 = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode");
    v19 = 0;
    -[LSApplicationRecord _personasWithAttributes](self, "_personasWithAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSShouldFetchContainersFromContainermanagerForPersona(v7, -[LSApplicationRecord _usesSystemPersona](self, "_usesSystemPersona"), &v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v6 & 1) != 0)
    {
      v9 = 1;
    }
    else if (v8)
    {
      _LSDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[LSApplicationRecord additionalEnvironmentVariables].cold.1((uint64_t)v8, v10);

      v9 = 0;
    }
    else
    {
      v9 = v19;
    }
    active_platform = dyld_get_active_platform();
    if (v9)
    {
      v14 = active_platform;
      -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = _LSCopyEnvironmentVariablesFromContainermanager(v15, (void *)-[LSApplicationRecord _containerClass](self, "_containerClass"), v14);
    }
    else
    {
      -[LSApplicationRecord _rawEnvironmentVariables](self, "_rawEnvironmentVariables");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LSLazyPropertyList propertyList](v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (uint64_t)_LSCopyRationalizedEnvironmentVariablesDict(v15);
    }
    v18 = (void *)v16;

    return (NSDictionary *)v18;
  }
  _LSDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[LSApplicationRecord additionalEnvironmentVariables].cold.2((uint64_t)self);

  return (NSDictionary *)0;
}

- (void)_LSRecord_resolve__rawEnvironmentVariables
{
  id v2;

  v2 = -[LSApplicationRecord _rawEnvironmentVariables](self, "_rawEnvironmentVariables");
}

- (_LSLazyPropertyList)_rawEnvironmentVariables
{
  return (_LSLazyPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__rawEnvironmentVariablesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__personasWithAttributes
{
  id v2;

  v2 = -[LSApplicationRecord _personasWithAttributes](self, "_personasWithAttributes");
}

- (id)_personasWithAttributes
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__personasWithAttributesWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)_containerized
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 38) & 1;
}

- (BOOL)_usesSystemPersona
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 56) & 1;
}

uint64_t __38__LSApplicationRecord_managedPersonas__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[_LSDatabase store](a2);
}

- (unint64_t)_containerClass
{
  return 2;
}

- (BOOL)isAppStoreVendableWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v8;
  void *v9;

  v8 = (void *)_CSStringCopyCFString();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("System")))
  {
    LOBYTE(self) = _LSFindBundleWithInfo(a3, 7uLL, -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier"), 0, 0, 0, 0) != 0;
  }
  else
  {
    -[LSApplicationRecord iTunesMetadata](self, "iTunesMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "storeItemIdentifier")
      && (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") & 0x8000001200000) == 0)
    {
      LODWORD(self) = !-[LSBundleRecord isProfileValidated](self, "isProfileValidated");
    }
    else
    {
      LOBYTE(self) = 0;
    }

  }
  return (char)self;
}

- (void)_LSRecord_resolve_iTunesMetadata
{
  id v2;

  v2 = -[LSApplicationRecord iTunesMetadata](self, "iTunesMetadata");
}

- (LSiTunesMetadata)iTunesMetadata
{
  return (LSiTunesMetadata *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iTunesMetadataWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isWebAppPlaceholder
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 39) & 1;
}

- (id)installSessionIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;

  _LSPlistGetValueForKey(a3->db, a6->bundlePersonas, CFSTR("InstallSessionID"), *(_LSPlistHint **)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSData() & 1) == 0)
  {

    v6 = 0;
  }
  return v6;
}

- (id)uniqueInstallIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;

  _LSPlistGetValueForKey(a3->db, a6->bundlePersonas, CFSTR("UniqueInstallID"), *(_LSPlistHint **)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSData() & 1) == 0)
  {

    v6 = 0;
  }
  return v6;
}

void __87__LSApplicationRecord_UserActivity__applicationRecordsForUserActivityType_limit_error___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;

  v5 = _LSBundleGet(**(void ***)(a1 + 48), a3);
  if (v5)
  {
    v6 = v5;
    if (_LSBundleCouldBeSelectedForActivityContinuation(**(void ***)(a1 + 48), a3, v5, *(void **)(a1 + 32)))
    {
      v7 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
      v8 = v7[7];
      v9 = v7[8];
      if (v8 >= v9)
      {
        v11 = v7[6];
        v12 = (uint64_t)(v8 - v11) >> 4;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60)
          abort();
        v14 = v9 - v11;
        if (v14 >> 3 > v13)
          v13 = v14 >> 3;
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
          v15 = 0xFFFFFFFFFFFFFFFLL;
        else
          v15 = v13;
        v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>((uint64_t)(v7 + 8), v15);
        v17 = &v16[16 * v12];
        v19 = &v16[16 * v18];
        *(_DWORD *)v17 = a3;
        *((_QWORD *)v17 + 1) = v6;
        v10 = v17 + 16;
        v21 = (char *)v7[6];
        v20 = (char *)v7[7];
        if (v20 != v21)
        {
          do
          {
            *((_OWORD *)v17 - 1) = *((_OWORD *)v20 - 1);
            v17 -= 16;
            v20 -= 16;
          }
          while (v20 != v21);
          v20 = (char *)v7[6];
        }
        v7[6] = v17;
        v7[7] = v10;
        v7[8] = v19;
        if (v20)
          operator delete(v20);
      }
      else
      {
        *(_DWORD *)v8 = a3;
        *(_QWORD *)(v8 + 8) = v6;
        v10 = (char *)(v8 + 16);
      }
      v7[7] = v10;
    }
  }
}

- (BOOL)isDeletableWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  unint64_t v6;
  uint64_t v8;
  int installFailureReason_high;
  void *v10;
  int v11;
  unint64_t v12;

  v6 = *(_QWORD *)(&a6->_clas + 1);
  if ((v6 & 0x10000000000) == 0)
    return 0;
  v8 = (v6 >> 40) & 1;
  installFailureReason_high = HIDWORD(a6->installFailureReason);
  if (installFailureReason_high
    && _LSDatabaseGetStringForCFString(a3->db, CFSTR("System"), 0) == installFailureReason_high)
  {
    +[LSApplicationRestrictionsManager sharedInstance]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[LSApplicationRestrictionsManager isSystemAppDeletionEnabled]((uint64_t)v10);
    v12 = (v6 & 0x10000000000) >> 40;

    if (v11)
      LODWORD(v8) = v12;
    else
      LODWORD(v8) = 0;
  }
  return (_DWORD)v8 != 0;
}

- (BOOL)applicationHasMIDBasedSINF
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 24) & 1;
}

- (id)regulatoryPrivacyDisclosureVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  void *v6;
  void *v7;
  void *v8;

  -[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:ofClass:", CFSTR("NSRegulatoryPrivacyDisclosure"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("NSRegulatoryPrivacyDisclosureVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend((id)objc_opt_class(), "_alternateIconQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2;
  v3[3] = &unk_1E1040240;
  v4 = *(_OWORD *)(a1 + 32);
  dispatch_sync(v2, v3);

}

+ (id)_alternateIconQueue
{
  if (+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::once != -1)
    dispatch_once(&+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::once, &__block_literal_global_579);
  return (id)+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::result;
}

- (BOOL)hasSettingsBundle
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 32) & 1;
}

- (LSApplicationRecord)initWithCoder:(id)a3
{
  LSApplicationRecord *v3;
  LSApplicationRecord *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)LSApplicationRecord;
  v3 = -[LSBundleRecord initWithCoder:](&v14, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[LSRecord _resolvedPropertyValueForGetter:](v3, "_resolvedPropertyValueForGetter:", sel_applicationExtensionRecords, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          objc_storeWeak((id *)(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++) + 80), v4);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v6);
    }

  }
  return v4;
}

+ (id)applicationRecordsForUserActivityType:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  _LSDServiceDomain *v8;
  void **v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned int *v16;
  unsigned int *v17;
  uint64_t v18;
  void *v19;
  LSApplicationRecord *v20;
  id v21;
  BOOL v22;
  char v23;
  void *v24;
  _LSDServiceDomain *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  __n128 (*v38)(__n128 *, __n128 *);
  void (*v39)(uint64_t);
  const char *v40;
  void *__p;
  void *v42;
  uint64_t v43;
  void **v44;
  void **CurrentContext;
  id v46;
  char v47;
  id v48;
  void ***v49;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSApplicationRecord.mm"), 2203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userActivityType != nil"));

  }
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)a1);
  v46 = 0;
  v47 = 0;
  v48 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v9 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v8, 0);

  v44 = v9;
  if (v9)
  {
    v35 = 0;
    v36 = &v35;
    v38 = __Block_byref_object_copy__623;
    v39 = __Block_byref_object_dispose__624;
    v37 = 0x4812000000;
    v40 = "";
    __p = 0;
    v42 = 0;
    v43 = 0;
    _LSDatabaseGetStringForCFString(*v9, (const __CFString *)a3, 0);
    _LSDatabaseEnumeratingBindingMap();
    v10 = v36[6];
    v11 = v36[7];
    v12 = 126 - 2 * __clz((uint64_t)(v11 - v10) >> 4);
    v49 = &v44;
    if (v11 == v10)
      v13 = 0;
    else
      v13 = v12;
    std::__introsort<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *,false>(v10, v11, &v49, v13, 1);
    v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v15 = (void *)objc_msgSend(v14, "initWithCapacity:", (v36[7] - v36[6]) >> 4);
    v16 = (unsigned int *)v36[6];
    v17 = (unsigned int *)v36[7];
    if (v16 != v17)
    {
      v18 = 0;
      do
      {
        v19 = (void *)MEMORY[0x186DAE7A0]();
        v20 = [LSApplicationRecord alloc];
        v21 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:](v20, "_initWithContext:bundleID:bundleData:error:", v44, *v16, *((_QWORD *)v16 + 1), 0);
        v22 = 0;
        if (v21)
        {
          objc_msgSend(v15, "addObject:", v21);
          if (++v18 >= a4)
            v22 = 1;
        }

        objc_autoreleasePoolPop(v19);
        v16 += 4;
        v23 = v16 == v17 || v22;
      }
      while ((v23 & 1) == 0);
    }
    v24 = (void *)objc_msgSend(v15, "copy");

    _Block_object_dispose(&v35, 8);
    if (__p)
    {
      v42 = __p;
      operator delete(__p);
    }
  }
  else if (a5)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v25 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v26 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v25, 0);

    if (v26)
      v27 = 0;
    else
      v27 = objc_retainAutorelease(v48);
    v24 = 0;
    *a5 = v27;
  }
  else
  {
    v24 = 0;
  }
  v28 = v24;
  if (CurrentContext && v47)
    _LSContextDestroy(CurrentContext);
  v29 = v46;
  CurrentContext = 0;
  v46 = 0;

  v47 = 0;
  v30 = v48;
  v48 = 0;

  return v28;
}

- (LSApplicationRecord)initWithRemotePlaceholderBundleIdentifier:(id)a3 error:(id *)a4
{
  return -[LSApplicationRecord initWithBundleIdentifier:fetchingPlaceholder:error:](self, "initWithBundleIdentifier:fetchingPlaceholder:error:", a3, 4, a4);
}

- (LSApplicationRecord)initWithStoreItemIdentifier:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    return (LSApplicationRecord *)-[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:](self, "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:", 0, 0, 0, 1, a3, 0, 0, a4);

  if (a4)
  {
    v7 = *MEMORY[0x1E0CB2938];
    v8[0] = CFSTR("Item ID 0 never exists.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[LSApplicationRecord initWithStoreItemIdentifier:error:]", 135, v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)extensionPointRecordForIdentifier:(id)a3 platform:(unsigned int)a4 error:(id *)a5
{
  return -[LSExtensionPointRecord initWithIdentifier:platform:parentAppRecord:error:]([LSExtensionPointRecord alloc], "initWithIdentifier:platform:parentAppRecord:error:", a3, *(_QWORD *)&a4, self, a5);
}

- (BOOL)isUpdate
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 19) & 1;
}

- (unint64_t)updateAvailability
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 7) & 1;
}

- (void)setUpdateAvailability:(unint64_t)a3 completionHandler:(id)a4
{
  void *v7;
  Class Class;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    Class = object_getClass(self);
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:](Class, "setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:", v10, a4);
LABEL_5:

    goto LABEL_6;
  }
  if (a4)
  {
    v11 = *MEMORY[0x1E0CB2938];
    v12 = CFSTR("This application does not have a bundle identifier and cannot have its updateAvailability property modified.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[LSApplicationRecord setUpdateAvailability:completionHandler:]", 264, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))a4 + 2))(a4, 0, v10);
    goto LABEL_5;
  }
LABEL_6:

}

+ (void)setUpdateAvailabilityForApplicationsWithBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[5];
  void (*v15[5])(_QWORD, _QWORD);
  _QWORD v16[7];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSApplicationRecord.mm"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateAvailabilities != nil"));

  }
  if (objc_msgSend(a3, "count"))
  {
    if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) != 0
      || (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer") & 1) == 0)
    {
      _LSServer_DatabaseExecutionContext();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke;
      v16[3] = &unk_1E103FDE0;
      v16[4] = a3;
      v16[5] = a4;
      v16[6] = a2;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v9, v16);

    }
    else
    {
      v7 = MEMORY[0x1E0C809B0];
      v15[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
      v15[1] = (void (*)(_QWORD, _QWORD))3221225472;
      v15[2] = (void (*)(_QWORD, _QWORD))__99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_33;
      v15[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FE08;
      v15[4] = (void (*)(_QWORD, _QWORD))a4;
      +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_2;
      v14[3] = &unk_1E103FE30;
      v14[4] = a4;
      objc_msgSend(v8, "setUpdateAvailabilities:completionHandler:", a3, v14);

    }
  }
  else if (a4)
  {
    v17 = *MEMORY[0x1E0CB2938];
    v18[0] = CFSTR("updateAvailabilities");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[LSApplicationRecord setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:]", 364, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))a4 + 2))(a4, 0, v11);

  }
}

void __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  _LSDServiceDomain *v2;
  void **v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  const char *Name;
  uint64_t v17;
  _LSDServiceDomain *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t (*v28)(uint64_t);
  _OWORD v29[2];
  uint64_t v30;
  int v31;
  void **v32;
  id v33;
  char v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v3 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v32, v2, 0);

  if (v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v24 = 0;
    v25 = &v24;
    v26 = 0x5812000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    memset(v29, 0, sizeof(v29));
    v30 = 0;
    v31 = 1065353216;
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>((uint64_t)v29 + 8, (unint64_t)(float)v4);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_29;
    v23[3] = &unk_1E103FDB8;
    v23[5] = &v24;
    v23[6] = v3;
    v5 = *(void **)(a1 + 32);
    v23[4] = *(_QWORD *)(a1 + 40);
    v6 = objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v23);
    if (v25[9] == v4)
    {
      v7 = v25 + 8;
      while (1)
      {
        v7 = (_QWORD *)*v7;
        if (!v7)
          break;
        v8 = *((unsigned int *)v7 + 4);
        v9 = v7[3];
        v10 = (void *)MEMORY[0x186DAE7A0](v6);
        if (_LSBundleGet(*v3, v8))
        {
          if (v9 > 1)
          {
            _LSDefaultLog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              Name = sel_getName(*(SEL *)(a1 + 48));
              *(_DWORD *)buf = 136446722;
              v37 = Name;
              v38 = 2048;
              v39 = v8;
              v40 = 1024;
              LODWORD(v41) = v9;
              _os_log_error_impl(&dword_182882000, v12, OS_LOG_TYPE_ERROR, "%{public}s: Caller told us to set the update availability of bundle 0x%llx to invalid value %u. Ignoring.", buf, 0x1Cu);
            }

          }
          if (!_CSStoreWriteToUnit())
          {
            _LSDefaultLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v15 = sel_getName(*(SEL *)(a1 + 48));
              *(_DWORD *)buf = 136446722;
              v37 = v15;
              v38 = 2048;
              v39 = v8;
              v40 = 2112;
              v41 = 0;
              _os_log_error_impl(&dword_182882000, v13, OS_LOG_TYPE_ERROR, "%{public}s: Failed to write to bundle 0x%llx, ignoring: %@", buf, 0x20u);
            }

          }
        }
        else
        {
          _LSDefaultLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v14 = sel_getName(*(SEL *)(a1 + 48));
            *(_DWORD *)buf = 136446466;
            v37 = v14;
            v38 = 2048;
            v39 = v8;
            _os_log_error_impl(&dword_182882000, v11, OS_LOG_TYPE_ERROR, "%{public}s: While enumerating bundles, lost track of bundle 0x%llx. Ignoring.", buf, 0x16u);
          }

        }
        objc_autoreleasePoolPop(v10);
      }
      _LSDatabaseCommit((uint64_t)*v3);
      _LSArmSaveTimer(1);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    _Block_object_dispose(&v24, 8);
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v29 + 8);
  }
  else
  {
    v17 = *(_QWORD *)(a1 + 40);
    +[_LSDServiceDomain defaultServiceDomain]();
    v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v32, v18, 0);

    if (v19)
      v20 = 0;
    else
      v20 = v35;
    (*(void (**)(uint64_t, _QWORD, id))(v17 + 16))(v17, 0, v20);

  }
  if (v32 && v34)
    _LSContextDestroy(v32);
  v21 = v33;
  v32 = 0;
  v33 = 0;

  v34 = 0;
  v22 = v35;
  v35 = 0;

}

void __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_29(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  _OWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v7 = a1[6];
  memset(v14, 0, sizeof(v14));
  v8 = _LSBundleFindWithInfo(v7, 0, a2, 0, v14, 2, 0, &v13, 0);
  if (v8)
  {
    v9 = a1[4];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v8, (uint64_t)"+[LSApplicationRecord setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:]_block_invoke", 293, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    *a4 = 1;
  }
  else
  {
    v11 = *(_QWORD *)(a1[5] + 8);
    v12 = objc_msgSend(a3, "unsignedLongLongValue");
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::__emplace_unique_key_args<unsigned int,unsigned int &,LSApplicationRecordUpdateAvailability>(v11 + 48, &v13, &v13, &v12);
  }
}

uint64_t __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_33(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)hasParallelPlaceholder
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 46) & 1;
}

- (BOOL)isLaunchDisabled
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 7) & 1;
}

- (BOOL)isInstalledFromDistributorOrWeb
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[LSApplicationRecord iTunesMetadata](self, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distributorInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "distributorID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.AppStore")) & 1) == 0)
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.TestFlight")) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

+ (BOOL)isAnyRegisteredApplicationInstalledFromDistributorOrWeb
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "enumeratorWithOptions:", 192);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x186DAE7A0](v3);
        LOBYTE(v7) = objc_msgSend(v7, "isInstalledFromDistributorOrWeb", (_QWORD)v10);
        objc_autoreleasePoolPop(v8);
        if ((v7 & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)canHandleWebAuthentication
{
  void *v2;
  void *v3;

  -[LSBundleRecord entitlements](self, "entitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:ofClass:", CFSTR("com.apple.AuthenticationServices.canHandleASWebAuthenticationSessionRequest"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (BOOL)supportsOnDemandResources
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 43) & 1;
}

- (BOOL)supportsAudiobooks
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 29) & 1;
}

- (BOOL)supportsCarPlayDashboardScene
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 62) & 1;
}

- (BOOL)supportsCarPlayInstrumentClusterScene
{
  return -[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 63;
}

- (void)getDeviceManagementPolicyWithCompletionHandler:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[LSApplicationRecord getDeviceManagementPolicyWithCompletionHandler:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("LSApplicationRecord.mm"), 758, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__LSApplicationRecord_getDeviceManagementPolicyWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E103FE80;
  v8[4] = a3;
  _LSGetDMFPolicyWithCompletionHandler((uint64_t)v5, v8);

}

uint64_t __70__LSApplicationRecord_getDeviceManagementPolicyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldShowSecurityPromptsOnSignIn
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") & 0x8000) == 0;
}

- (BOOL)isWebBrowser
{
  return -[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") & 1;
}

- (BOOL)isEligibleWebBrowser
{
  uint64_t v3;
  _BOOL4 IsBundleWithFlagsEligibleToBindAsBrowser;
  LSBundleMoreFlags v6;

  v3 = (uint64_t)-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags");
  IsBundleWithFlagsEligibleToBindAsBrowser = LaunchServices::BindingEvaluator::IsBundleWithFlagsEligibleToBindAsBrowser((LaunchServices::BindingEvaluator *)(v3 & 0xFFFFFF), v6);
  if (IsBundleWithFlagsEligibleToBindAsBrowser)
    LOBYTE(IsBundleWithFlagsEligibleToBindAsBrowser) = !-[LSApplicationRecord appProtectionHidden](self, "appProtectionHidden");
  return IsBundleWithFlagsEligibleToBindAsBrowser;
}

- (BOOL)isMailClient
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 1) & 1;
}

- (BOOL)isEligibleMailClient
{
  _BOOL4 v3;

  v3 = -[LSApplicationRecord isMailClient](self, "isMailClient");
  if (v3)
    LOBYTE(v3) = !-[LSApplicationRecord appProtectionHidden](self, "appProtectionHidden");
  return v3;
}

- (BOOL)supportsSpotlightQueryContinuation
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 3) & 1;
}

- (NSArray)spotlightActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  LSSpotlightAction *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") & 0x10) != 0)
  {
    -[LSBundleRecord infoDictionary](self, "infoDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("CoreSpotlightActions"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (!v5)
      goto LABEL_30;
    v6 = *(_QWORD *)v27;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        v9 = objc_opt_class();
        objc_msgSend(v8, "objectForKey:", CFSTR("CoreSpotlightActionIdentifier"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v9)
          v12 = v10 == 0;
        else
          v12 = 1;
        if (!v12 && (objc_opt_isKindOfClass() & 1) == 0)
        {

          v11 = 0;
        }
        v13 = objc_opt_class();
        objc_msgSend(v8, "objectForKey:", CFSTR("CoreSpotlightActionTitle"));
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13 && v14 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = v15;
          v15 = 0;
LABEL_27:

          goto LABEL_28;
        }
        if (v11)
          v16 = v15 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          v17 = [LSSpotlightAction alloc];
          v18 = objc_opt_class();
          objc_msgSend(v8, "objectForKey:", CFSTR("CoreSpotlightActionSymbolImage"));
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v18 && v19 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            v20 = 0;
          }
          v21 = -[LSSpotlightAction _initWithIdentifier:unlocalizedTitle:symbolImageName:](v17, "_initWithIdentifier:unlocalizedTitle:symbolImageName:", v11, v15, v20);

          if (v21)
            objc_msgSend(v24, "addObject:", v21);
          goto LABEL_27;
        }
LABEL_28:

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v5)
      {
LABEL_30:

        break;
      }
    }
  }
  v22 = (void *)objc_msgSend(v24, "copy");

  return (NSArray *)v22;
}

- (BOOL)requiresNativeExecution
{
  return 0;
}

- (BOOL)isSwiftPlaygroundsApp
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 8) & 1;
}

- (LSApplicationRecord)linkedParentApplication
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__110;
  v25 = __Block_byref_object_dispose__111;
  v26 = 0;
  -[LSApplicationRecord _linkedParentApplicationBundleID](self, "_linkedParentApplicationBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v18 = 0;
    v19[0] = &v18;
    v19[1] = 0x3032000000;
    v19[2] = __Block_byref_object_copy__110;
    v19[3] = __Block_byref_object_dispose__111;
    v20 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__LSApplicationRecord_linkedParentApplication__block_invoke;
    v14[3] = &unk_1E103FEA8;
    v16 = &v21;
    v15 = v3;
    v17 = &v18;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __46__LSApplicationRecord_linkedParentApplication__block_invoke_2;
    v10[3] = &unk_1E103FED0;
    v12 = &v21;
    v6 = v15;
    v11 = v6;
    v13 = &v18;
    -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v14, v10);
    if (!v22[5])
    {
      _LSDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[LSApplicationRecord linkedParentApplication].cold.1((uint64_t)v6, (uint64_t)v19, v7);

    }
    _Block_object_dispose(&v18, 8);

  }
  v8 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return (LSApplicationRecord *)v8;
}

void __46__LSApplicationRecord_linkedParentApplication__block_invoke(_QWORD *a1, uint64_t a2)
{
  LSApplicationRecord *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = [LSApplicationRecord alloc];
  v5 = a1[4];
  v12 = 0;
  v6 = -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:](v4, "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:", 0, v5, 0, 0, 0, 0, a2, &v12);
  v7 = v12;
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

}

void __46__LSApplicationRecord_linkedParentApplication__block_invoke_2(_QWORD *a1)
{
  LSApplicationRecord *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = [LSApplicationRecord alloc];
  v3 = a1[4];
  v10 = 0;
  v4 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:](v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v10);
  v5 = v10;
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (id)categoryTypesWithError:(id *)a3
{
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  CFArrayRef theArray;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[LSBundleRecord _node](self, "_node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = self;
  theArray = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __46__LSApplicationRecord_categoryTypesWithError___block_invoke;
  v23[3] = &unk_1E103FEF8;
  v6 = _LSCopyApplicationCategoriesForNodeWithDefaultIdentifierProvider(v5, &theArray, v23);

  if (v6)
  {
    if (a3)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v6, (uint64_t)"-[LSApplicationRecord categoryTypesWithError:]", 996, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v8 = 0;
      *a3 = v7;
      goto LABEL_24;
    }
LABEL_21:
    v8 = 0;
    goto LABEL_24;
  }
  v9 = (void *)_LSGetUTTypeClass();
  if (!v9)
  {
    if (a3)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 78, (uint64_t)"-[LSApplicationRecord categoryTypesWithError:]", 993, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    goto LABEL_21;
  }
  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v11 = (void *)objc_msgSend(v10, "initWithCapacity:", CFArrayGetCount(theArray));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = theArray;
  v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(v9, "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          if (a3)
          {
            _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], 2, (uint64_t)"-[LSApplicationRecord categoryTypesWithError:]", 982, 0);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_17;
        }
        objc_msgSend(v11, "addObject:", v16);

      }
      v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_17:

  v17 = objc_msgSend(v11, "count");
  if (v17 == CFArrayGetCount(theArray))
    v8 = (void *)objc_msgSend(v11, "copy");
  else
    v8 = 0;

LABEL_24:
  if (theArray)
    CFRelease(theArray);
  return v8;
}

uint64_t __46__LSApplicationRecord_categoryTypesWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_defaultCategoryTypeIdentifiers");
}

- (BOOL)isEligibleForWatchAppInstall
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 16) & 1;
}

- (BOOL)appProtectionHiddenWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (HIBYTE(a6->_itemFlags) >> 3) & 1;
}

- (BOOL)appProtectionHidden
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_appProtectionHiddenWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)appProtectionLockedWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (HIBYTE(a6->_itemFlags) >> 4) & 1;
}

- (BOOL)appProtectionLocked
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_appProtectionLockedWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)supportsAlwaysOnDisplay
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 9) & 1;
}

- (BOOL)defaultsToPrivateAlwaysOnDisplayTreatment
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 10) & 1;
}

- (BOOL)isTrustedForBinding
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") & 0x80) == 0;
}

- (id)trustedCDHashes
{
  return 0;
}

BOOL __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return *(_DWORD *)(a4 + 504) != 0;
}

BOOL __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return *(_DWORD *)(a4 + 168) == 16;
}

- (id)_initWithBundleIdentifier:(id)a3 placeholder:(BOOL)a4 error:(id *)a5
{
  uint64_t v5;

  v5 = 3;
  if (!a4)
    v5 = 0;
  return -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:](self, "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:", 0, a3, v5, 0, 0, 0, 0, a5);
}

- (id)bundleVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (id)associatedPersonas
{
  void *v2;
  void *v3;

  -[LSApplicationRecord _personasWithAttributes](self, "_personasWithAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  XNSArrayByMappingBlock(v2, &__block_literal_global_135);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __41__LSApplicationRecord_associatedPersonas__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[_LSDatabase store](a2);
}

- (BOOL)requiresPostProcessing
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 13) & 1;
}

void __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _LSRecordLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138478083;
    v7 = v5;
    v8 = 2112;
    v9 = a2;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_ERROR, "Error getting identifier for vendor for %{private}@: %@", (uint8_t *)&v6, 0x16u);

  }
}

void __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke_470(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSUUID)deviceIdentifierForAdvertising
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  void (*v10[5])(_QWORD, _QWORD);
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__110;
  v15 = __Block_byref_object_dispose__111;
  v16 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v10[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v10[2] = __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke;
  v10[3] = (void (*)(_QWORD, _QWORD))&unk_1E10400E0;
  v10[4] = (void (*)(_QWORD, _QWORD))self;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRecord _deviceIdentifierVendorName](self, "_deviceIdentifierVendorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke_472;
  v9[3] = &unk_1E1040108;
  v9[4] = &v11;
  objc_msgSend(v4, "getIdentifierOfType:vendorName:bundleIdentifier:completionHandler:", 1, v5, v6, v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSUUID *)v7;
}

void __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _LSRecordLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138478083;
    v7 = v5;
    v8 = 2112;
    v9 = a2;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_ERROR, "Error getting identifier for vendor for %{private}@: %@", (uint8_t *)&v6, 0x16u);

  }
}

void __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke_472(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)clearAdvertisingIdentifier
{
  id v2;

  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAllIdentifiersOfType:", 1);

}

- (BOOL)supportsExternallyPlayableContent
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 30) & 1;
}

- (BOOL)supportsOpenInPlace
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 33) & 1;
}

- (BOOL)isFileSharingEnabled
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 31) & 1;
}

- (BOOL)supportsPurgeableLocalStorage
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 34) & 1;
}

- (BOOL)supportsLiveActivitiesFrequentUpdates
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 12) & 1;
}

- (BOOL)supportsLiveActivities
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 11) & 1;
}

- (NSArray)supportedLiveActivityLaunchAttributeTypes
{
  return 0;
}

- (id)localizedNameWithContext:(id)a3
{
  return -[LSApplicationRecord localizedNameWithContext:preferredLocalizations:](self, "localizedNameWithContext:preferredLocalizations:", a3, 0);
}

- (id)localizedNameWithContext:(id)a3 preferredLocalizations:(id)a4
{
  NSObject *v7;
  id v8;
  uint8_t v10[16];
  _QWORD v11[8];
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__110;
  v17 = __Block_byref_object_dispose__111;
  v18 = 0;
  if (a3 && objc_msgSend(a3, "length"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke;
    v12[3] = &unk_1E1040158;
    v12[4] = a3;
    v12[5] = self;
    v12[6] = a4;
    v12[7] = &v13;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_3;
    v11[3] = &unk_1E1040180;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = a4;
    v11[7] = &v13;
    -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v12, v11);
  }
  else
  {
    _LSRecordLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_FAULT, "You must pass a valid context string when using -localizedNameWithContext:. Did you want -localizedName?", v10, 2u);
    }

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __int128 v4;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  int v10;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_2;
  v6[3] = &unk_1E1040130;
  v9 = a2;
  v10 = a4;
  v4 = *(_OWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  v8 = v4;
  return __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v6);
}

void __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = **(void ***)(a1 + 64);
  v3 = *(unsigned int *)(a1 + 72);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_node");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  _LSBundleGetLocalizedName(v2, v3, v4, v8, *(void **)(a1 + 48), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_resolvedPropertyValueForGetter:", sel__localizedNamesWithContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v8 = v2;
    v4 = (id)objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = v8;
    if (v4 != (id)*MEMORY[0x1E0C9B0D0])
    {
      objc_msgSend(v4, "stringValueWithPreferredLocalizations:", *(_QWORD *)(a1 + 48));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v3 = v8;
    }
  }

}

- (BOOL)wasRenamed
{
  return 0;
}

void __58__LSApplicationRecord_AlternateIcons___alternateIconQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("LS alternate icon queue", v2);
  v1 = (void *)+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::result;
  +[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::result = (uint64_t)v0;

}

- (void)setAlternateIconName:(id)a3 completionHandler:(id)a4
{
  NSObject *v7;
  _QWORD block[7];

  objc_msgSend((id)objc_opt_class(), "_alternateIconQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke;
  block[3] = &unk_1E10401F0;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(v7, block);

}

void __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void (*v15)(_QWORD, _QWORD);
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "allowsAlternateIcons"))
  {
    if (_LSIconsLog(void)::onceToken != -1)
      dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_879);
    v2 = _LSIconsLog(void)::log;
    if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v26 = v3;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "Setting preferredIconName to %@ for %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_rawIconDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_expensiveDictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_582;
    v18 = &unk_1E10401C8;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 48);
    v19 = v8;
    v20 = v9;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDIconService, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlternateIconName:forIdentifier:iconsDictionary:reply:", *(_QWORD *)(a1 + 32), v8, v7, *(_QWORD *)(a1 + 48), v15, v16, v17, v18);

  }
  else
  {
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("alternateIcons not allowed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), 110, (uint64_t)"-[LSApplicationRecord(AlternateIcons) setAlternateIconName:completionHandler:]_block_invoke", 2031, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v21 = *MEMORY[0x1E0CB3388];
    v22 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 3328, (uint64_t)"-[LSApplicationRecord(AlternateIcons) setAlternateIconName:completionHandler:]_block_invoke", 2033, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (_LSIconsLog(void)::onceToken != -1)
      dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_879);
    v14 = _LSIconsLog(void)::log;
    if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_ERROR))
      __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_cold_1(a1, (uint64_t)v7, v14);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v8 = (id)v12;
  }

}

uint64_t __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_582(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (_LSIconsLog(void)::onceToken != -1)
    dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_879);
  v4 = _LSIconsLog(void)::log;
  if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = a2;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Failed to set alternate icon name for bundleID %@ with error: %@", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_586(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (_LSIconsLog(void)::onceToken != -1)
    dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_879);
  v4 = _LSIconsLog(void)::log;
  if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = a2;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Failed to retrieve alternate icon name for bundleID %@ with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_587(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    if (_LSIconsLog(void)::onceToken != -1)
      dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_879);
    if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEBUG))
      __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_587_cold_1(a1);
  }
}

+ (id)applicationRecordsForUserActivityDomainName:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  LaunchServices::DatabaseContext *v11;
  _LSDServiceDomain *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _LSDServiceDomain *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  void *v29;
  unint64_t v30;
  _QWORD v31[4];
  void **CurrentContext;
  id v33;
  char v34;
  id v35;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSApplicationRecord.mm"), 2258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domainName != nil"));

  }
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(v11);
  v33 = 0;
  v34 = 0;
  v35 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v12, 0);

  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __93__LSApplicationRecord_UserActivity__applicationRecordsForUserActivityDomainName_limit_error___block_invoke;
    v25[3] = &unk_1E1040290;
    v29 = v13;
    v26 = v10;
    v15 = v14;
    v27 = v15;
    v28 = v31;
    v30 = a4;
    _LSEnumerateViableBundlesOfClass(v13, 2, v25);
    v16 = (void *)objc_msgSend(v15, "copy");

    _Block_object_dispose(v31, 8);
  }
  else if (a5)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v17 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v18 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v17, 0);

    if (v18)
      v19 = 0;
    else
      v19 = objc_retainAutorelease(v35);
    v16 = 0;
    *a5 = v19;
  }
  else
  {
    v16 = 0;
  }
  v20 = v16;
  if (CurrentContext && v34)
    _LSContextDestroy(CurrentContext);
  v21 = v33;
  CurrentContext = 0;
  v33 = 0;

  v34 = 0;
  v22 = v35;
  v35 = 0;

  return v20;
}

void __93__LSApplicationRecord_UserActivity__applicationRecordsForUserActivityDomainName_limit_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  CFSetRef v9;
  CFSetRef v10;
  void *v11;
  id v12;

  v8 = (void *)MEMORY[0x186DAE7A0]();
  v9 = _LSBundleCopyUserActivityDomainNames(**(_QWORD **)(a1 + 56), a2, a3);
  v10 = v9;
  if (v9)
  {
    -[__CFSet member:](v9, "member:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]([LSApplicationRecord alloc], "_initWithContext:bundleID:bundleData:error:", *(_QWORD *)(a1 + 56), a2, a3, 0);
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
        if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 64))
          *a4 = 1;
      }

    }
  }

  objc_autoreleasePoolPop(v8);
}

- (BOOL)supportsControllerUserInteraction
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 2) & 1;
}

void __93__LSApplicationRecord_GameKit__supportedGameControllersWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", *(_QWORD *)(a1 + 40), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (BOOL)isWrapper
{
  return 0;
}

- (BOOL)isWrapped
{
  return 0;
}

- (BOOL)getGenericTranslocationTargetURL:(id *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSApplicationRecord(AppWrappers) getGenericTranslocationTargetURL:error:]", 2369, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)bundleMetadataReturningError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  LSApplicationRecord *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x186DAE7A0](self, a2);
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  ((void (*)(void *, uint64_t))softLinkMobileInstallationCopyAppMetadata[0])(v6, (uint64_t)&v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (!v7)
  {
    _LSRecordLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_ERROR, "Failed to lookup metadata for app %@: %@", buf, 0x16u);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }
  objc_autoreleasePoolPop(v5);

  return v7;
}

- (BOOL)isAdHocCodeSigned
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 26) & 1;
}

- (BOOL)applicationMissingRequiredSINF
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 25) & 1;
}

- (BOOL)hasCustomNotification
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 44) & 1;
}

- (LSApplicationRecord)initWithBundleIdentifierOfCompanionApplication:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v8 = *MEMORY[0x1E0CB2938];
    v9[0] = CFSTR("This platform does not support discovery of companion application identifiers.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSApplicationRecord(watchOS) initWithBundleIdentifierOfCompanionApplication:error:]", 2742, v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (unsigned)watchKitApplicationType
{
  return 0;
}

- (NSString)watchKitVersion
{
  return 0;
}

- (NSString)complicationPrincipalClassName
{
  return 0;
}

- (NSArray)supportedComplicationFamilies
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)hasComplication
{
  return 0;
}

- (BOOL)hasGlance
{
  return 0;
}

- (BOOL)shouldSkipWatchAppInstall
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 48) & 1;
}

- (BOOL)isWatchOnly
{
  return 0;
}

- (BOOL)runsIndependentlyOfCompanionApp
{
  return 0;
}

- (NSString)watchKitApplicationTintColorName
{
  return 0;
}

- (id)initForInstallMachineryWithBundleIdentifier:(id)a3 error:(id *)a4
{
  return -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:](self, "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:", 0, a3, 1, 0, 0, 0, 0, a4);
}

- (unint64_t)sequenceNumber
{
  void *v2;
  unint64_t SequenceNumberInternal;

  -[LSRecord persistentIdentifier](self, "persistentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SequenceNumberInternal = _LSApplicationRecordPersistentIdentifierGetSequenceNumberInternal(v2);

  return SequenceNumberInternal;
}

+ (id)personalPersonaAttributes
{
  if (+[LSApplicationRecord(Identities) personalPersonaAttributes]::once != -1)
    dispatch_once(&+[LSApplicationRecord(Identities) personalPersonaAttributes]::once, &__block_literal_global_851);
  return (id)+[LSApplicationRecord(Identities) personalPersonaAttributes]::result;
}

void __60__LSApplicationRecord_Identities__personalPersonaAttributes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((id)getUMUserPersonaAttributesClass(), "personaAttributesForPersonaType:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[LSApplicationRecord(Identities) personalPersonaAttributes]::result;
  +[LSApplicationRecord(Identities) personalPersonaAttributes]::result = v0;

}

- (BOOL)mayBeBUIVisible
{
  void *v2;
  char v3;

  -[LSApplicationRecord typeForInstallMachinery](self, "typeForInstallMachinery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("System")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("User"));

  return v3;
}

- (unint64_t)bundleInode
{
  -[LSApplicationRecord doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)executableInode
{
  -[LSApplicationRecord doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)redactedProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__LSApplicationRecord_Redaction__redactedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[LSApplicationRecord(Redaction) redactedProperties]::once != -1)
    dispatch_once(&+[LSApplicationRecord(Redaction) redactedProperties]::once, block);
  return (id)+[LSApplicationRecord(Redaction) redactedProperties]::properties;
}

void __52__LSApplicationRecord_Redaction__redactedProperties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___LSApplicationRecord;
  objc_msgSendSuper2(&v4, sel_redactedProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObject:", CFSTR("_rawEnvironmentVariables"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[LSApplicationRecord(Redaction) redactedProperties]::properties;
  +[LSApplicationRecord(Redaction) redactedProperties]::properties = v2;

}

- (BOOL)eligibleForRedaction
{
  FSNode *v3;
  void *v4;
  FSNode *v5;
  BOOL v6;

  v3 = [FSNode alloc];
  -[LSBundleRecord URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FSNode initWithURL:flags:error:](v3, "initWithURL:flags:error:", v4, 0, 0);
  v6 = -[FSNode isSecuredSystemContent](v5, "isSecuredSystemContent");

  return v6;
}

- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4
{
  LSApplicationRecord *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  _BOOL8 v11;
  uint64_t v12;
  id v13;

  v7 = [LSApplicationRecord alloc];
  -[LSBundleRecord _node](self, "_node");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LSApplicationRecord isPlaceholder](self, "isPlaceholder");
  v11 = -[LSApplicationRecord isSystemPlaceholder](self, "isSystemPlaceholder");
  if (v10)
    v12 = 3;
  else
    v12 = 0;
  v13 = -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:](v7, "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:", v8, v9, v12, v11, 0, 0, a3, a4);

  return v13;
}

- (id)getApplicationExtensionDiagnosticDescriptionWithError:(id *)a3
{
  id v4;
  _QWORD v6[7];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__110;
  v18 = __Block_byref_object_dispose__111;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__110;
  v12 = __Block_byref_object_dispose__111;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke;
  v7[3] = &unk_1E1040348;
  v7[4] = &v8;
  v7[5] = &v14;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke_2;
  v6[3] = &unk_1E1040370;
  v6[4] = self;
  v6[5] = &v8;
  v6[6] = &v14;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v7, v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  _LSGetApplicationExtensionDiagnosticDescriptionForBundle(a2, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke_2(uint64_t a1)
{
  _LSDServiceDomain *v2;
  void **v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _LSDServiceDomain *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void **v16;
  id v17;
  char v18;
  id v19;

  v19 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v3 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v2, 0);

  if (!v3)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v10, 0);

    if (v11)
      v12 = 0;
    else
      v12 = v19;
    goto LABEL_8;
  }
  if (!_LSBundleGet(*v3, objc_msgSend(*(id *)(a1 + 32), "unitID")))
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[LSApplicationRecord(Diagnostic) getApplicationExtensionDiagnosticDescriptionWithError:]_block_invoke_2", 3100, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
    goto LABEL_9;
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "unitID");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  _LSGetApplicationExtensionDiagnosticDescriptionForBundle((uint64_t)v3, v4);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;
LABEL_9:

  if (v16 && v18)
    _LSContextDestroy(v16);
  v14 = v17;
  v16 = 0;
  v17 = 0;

  v18 = 0;
  v15 = v19;
  v19 = 0;

}

+ (id)enumeratorOnVolumeAtURL:(id)a3 options:(unint64_t)a4
{
  void *v9;
  void *v10;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSRecord+Enumeration.mm"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("volumeURL != nil"));

  }
  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSRecord+Enumeration.mm"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("volumeURL.fileURL"));

  }
  return -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]([_LSApplicationRecordEnumerator alloc], "initWithContext:volumeURL:options:", 0, a3, a4);
}

+ (id)systemPlaceholderEnumerator
{
  _LSApplicationRecordEnumerator *v2;

  v2 = -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]([_LSApplicationRecordEnumerator alloc], "initWithContext:volumeURL:options:", 0, 0, 0);
  -[_LSApplicationRecordEnumerator setBundleClass:](v2, "setBundleClass:", 14);
  return v2;
}

+ (id)remotePlaceholderEnumerator
{
  _LSRemotePlaceholderEnumerator *v2;

  v2 = -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]([_LSRemotePlaceholderEnumerator alloc], "initWithContext:volumeURL:options:", 0, 0, 64);
  -[_LSApplicationRecordEnumerator setBundleClass:](v2, "setBundleClass:", 16);
  return v2;
}

- (id)linkedChildApplicationRecordEnumeratorWithOptions:(unint64_t)a3
{
  _LSLinkedChildApplicationRecordEnumerator *v5;
  void *v6;
  _LSLinkedChildApplicationRecordEnumerator *v7;

  v5 = [_LSLinkedChildApplicationRecordEnumerator alloc];
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_LSLinkedChildApplicationRecordEnumerator initWithContext:parentBundleID:options:](v5, "initWithContext:parentBundleID:options:", 0, v6, a3);

  return v7;
}

void __87__LSApplicationRecord_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes___block_invoke_cold_1(unsigned int a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134349314;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_182882000, a2, a3, "Could not create appex record for plugin unit %{public}llx! Error: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)linkedParentApplication
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)a2 + 40);
  OUTLINED_FUNCTION_2_0(&dword_182882000, a2, a3, "could not find parent application with bundle identifier %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)additionalEnvironmentVariables
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_182882000, v1, OS_LOG_TYPE_FAULT, "could not unredact record %@: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Failed to set preferredIconName to %@ for %@ error: %@", (uint8_t *)&v5, 0x20u);
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v1, v2, "Couldn't fetch alternate icon name for %@, error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_587_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v1, v2, "Failed to retrieve alternate icon name for bundleID %@ with error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end
