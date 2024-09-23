@implementation LSPlugInKitProxy

- (NSString)teamID
{
  void *v2;
  void *v3;

  -[LSPlugInKitProxy containingBundle](self, "containingBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "teamID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (LSBundleProxy)containingBundle
{
  return self->_containingBundle;
}

+ (id)pluginKitProxyForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__35;
  v27 = __Block_byref_object_dispose__35;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  +[LSPlugInQuery pluginQueryWithIdentifier:](LSPlugInQuery, "pluginQueryWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __48__LSPlugInKitProxy_pluginKitProxyForIdentifier___block_invoke;
  v22[3] = &unk_1E103FC78;
  v22[4] = &v23;
  objc_msgSend(v5, "enumerateResolvedResultsOfQuery:withBlock:", v4, v22);

  v6 = objc_msgSend((id)v24[5], "count");
  v7 = (void *)v24[5];
  if (v6 == 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v8 = 0;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (id)v24[5];
    v8 = 0;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
LABEL_6:
      v12 = 0;
      v13 = v8;
      while (1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v8 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v12);

        objc_msgSend(v8, "pluginIdentifier", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "originalIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if ((v16 & 1) == 0)
          break;
        ++v12;
        v13 = v8;
        if (v10 == v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
          if (v10)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      objc_msgSend((id)v24[5], "objectAtIndexedSubscript:", 0);
      v9 = v8;
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  _Block_object_dispose(&v23, 8);

  return v8;
}

- (id)_initWithPlugin:(unsigned int)a3 andContext:(LSContext *)a4 applicationExtensionRecord:(id)a5 resolveAndDetach:(BOOL)a6
{
  uint64_t v7;
  int *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _LSPlugInPropertyList *v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  LaunchServices::DatabaseContext *v32;
  void *v33;
  id v34;
  uint64_t v36;
  void *v37;
  int v38;
  __int16 v39;
  int v40;
  _BOOL4 v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id obj;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t, int, _BYTE *);
  void *v56;
  id v57;
  uint64_t *v58;
  LSContext *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _QWORD v66[4];
  uint8_t buf[40];
  uint64_t v68;

  v41 = a6;
  v7 = *(_QWORD *)&a3;
  v68 = *MEMORY[0x1E0C80C00];
  v46 = a5;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__35;
  v64 = __Block_byref_object_dispose__35;
  v65 = 0;
  v8 = (int *)_LSGetPlugin((uint64_t)a4->db, v7);
  v9 = (uint64_t)v8;
  if (!v8)
    goto LABEL_33;
  if (*v8)
  {
    v10 = _LSAliasCopyResolvedNode(a4->db, *v8, 0, 0, 0);
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "URL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_33:
    v51 = 0;
    goto LABEL_34;
  }
  v51 = 0;
LABEL_6:
  v12 = (void *)_CSStringCopyCFString();
  if (!v12)
  {
LABEL_34:

    v24 = 0;
    obj = 0;
    v48 = 0;
    v44 = 0;
    v45 = 0;
    v43 = 0;
    v49 = 0;
    v50 = 0;
    v16 = 0;
    v15 = 0;
    v23 = 0;
    v20 = 0;
    v12 = 0;
    goto LABEL_32;
  }
  v39 = *(_WORD *)_LSContainerGet();
  v40 = *(_DWORD *)(v9 + 168);
  if ((v40 & 4) != 0)
  {
    obj = (id)_CSStringCopyCFString();
    v45 = (id)_CSStringCopyCFString();
  }
  else
  {
    obj = (id)_CSStringCopyCFString();
    v45 = obj;
  }
  v44 = (id)_CSStringCopyCFString();
  v43 = (id)_CSStringCopyCFString();
  v38 = *(_DWORD *)(v9 + 20);
  v13 = *(_OWORD *)(v9 + 44);
  *(_OWORD *)buf = *(_OWORD *)(v9 + 28);
  *(_OWORD *)&buf[16] = v13;
  _LSVersionNumberGetStringRepresentation(buf);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)_CSStringCopyCFString();
  if (*(_DWORD *)(v9 + 96) && (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) == 0)
  {
    v14 = _LSAliasCopyResolvedNode(a4->db, *(_DWORD *)(v9 + 96), 0, 0, 0);
    objc_msgSend(v14, "URL");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(int)_LSBundleDataGetRegTime(v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)(v9 + 92))
  {
    v53 = MEMORY[0x1E0C809B0];
    v54 = 3221225472;
    v55 = __91__LSPlugInKitProxy__initWithPlugin_andContext_applicationExtensionRecord_resolveAndDetach___block_invoke;
    v56 = &unk_1E1044950;
    v58 = &v60;
    v59 = a4;
    v57 = v12;
    _CSArrayEnumerateAllValues();

  }
  +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a4, *(unsigned int *)(v9 + 140));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a4, *(unsigned int *)(v9 + 136));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a4, _LSPluginGetSDKDictionaryDataUnit(a4->db, v7, v9));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    _LSDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[_LSLazyPropertyList propertyList](0);
      v36 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = obj;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v51;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v36;
      v37 = (void *)v36;
      _os_log_error_impl(&dword_182882000, v19, OS_LOG_TYPE_ERROR, "Invalid overlay plist for extension %@ (%@): %@", buf, 0x20u);

    }
  }
  v20 = -[_LSPlugInPropertyList initWithInfoPlist:SDKPlist:]([_LSPlugInPropertyList alloc], "initWithInfoPlist:SDKPlist:", v17, v18);

  v21 = *(_OWORD *)(v9 + 76);
  *(_OWORD *)buf = *(_OWORD *)(v9 + 60);
  *(_OWORD *)&buf[16] = v21;
  memset(v66, 0, sizeof(v66));
  if (_LSVersionNumberCompare(buf, v66))
  {
    v22 = *(_OWORD *)(v9 + 76);
    *(_OWORD *)buf = *(_OWORD *)(v9 + 60);
    *(_OWORD *)&buf[16] = v22;
    _LSVersionNumberGetStringRepresentation(buf);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  v52.receiver = self;
  v52.super_class = (Class)LSPlugInKitProxy;
  v24 = -[LSBundleProxy _initWithBundleUnit:context:bundleType:bundleID:localizedName:bundleContainerURL:dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:](&v52, sel__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version_, 0, a4, 6, v12, 0, 0, v48, v51, 0, 0, v49);
  if (v24)
  {
    if (v46)
      v25 = v46;
    else
      v25 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]([LSApplicationExtensionRecord alloc], "_initWithContext:pluginID:pluginData:error:", a4, v7, v9, 0);
    v26 = (void *)*((_QWORD *)v24 + 20);
    *((_QWORD *)v24 + 20) = v25;

    objc_msgSend(*((id *)v24 + 20), "containingBundleRecord");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "compatibilityObject");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)*((_QWORD *)v24 + 28);
    *((_QWORD *)v24 + 28) = v28;

    *((_DWORD *)v24 + 39) = v40;
    objc_storeStrong((id *)v24 + 23, obj);
    objc_storeStrong((id *)v24 + 24, v45);
    objc_storeStrong((id *)v24 + 25, v44);
    objc_storeStrong((id *)v24 + 21, v43);
    *((_DWORD *)v24 + 38) = v38;
    objc_storeStrong((id *)v24 + 27, v15);
    if (v50)
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v50);
      v31 = (void *)*((_QWORD *)v24 + 26);
      *((_QWORD *)v24 + 26) = v30;

    }
    *((_BYTE *)v24 + 176) = (v39 & 0x10) != 0;
    objc_msgSend(v24, "_setInfoDictionary:", v20);
    objc_msgSend(v24, "setMachOUUIDs:", v61[5]);
    objc_msgSend(v24, "setSDKVersion:", v23);
    v32 = (LaunchServices::DatabaseContext *)objc_msgSend(v24, "_setEntitlements:", v16);
    if (v41 && _LSDatabaseContextGetDetachProxyObjects(v32))
    {
      objc_msgSend(*((id *)v24 + 20), "_resolveAllProperties");
      objc_msgSend(*((id *)v24 + 20), "containingBundleRecord");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_resolveAllProperties");

      objc_msgSend(*((id *)v24 + 20), "detach");
    }
  }
LABEL_32:
  v34 = v24;

  _Block_object_dispose(&v60, 8);
  return v34;
}

+ (id)pluginKitProxyForUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__35;
  v15 = __Block_byref_object_dispose__35;
  v16 = 0;
  +[LSPlugInQuery pluginQueryWithUUID:](LSPlugInQuery, "pluginQueryWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__LSPlugInKitProxy_pluginKitProxyForUUID___block_invoke;
  v10[3] = &unk_1E103FC78;
  v10[4] = &v11;
  objc_msgSend(v5, "enumerateResolvedResultsOfQuery:withBlock:", v4, v10);

  v6 = (void *)v12[5];
  if (!v6)
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "Failed to find plugin with UUID %@", buf, 0xCu);
    }

    v6 = (void *)v12[5];
  }
  v8 = v6;

  _Block_object_dispose(&v11, 8);
  return v8;
}

+ (id)plugInKitProxyForPlugin:(unsigned int)a3 withContext:(LSContext *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithPlugin:andContext:applicationExtensionRecord:resolveAndDetach:", *(_QWORD *)&a3, a4, 0, 1);
}

void __42__LSPlugInKitProxy_pluginKitProxyForUUID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x186DAE7A0]();
  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
  objc_autoreleasePoolPop(v9);

}

void __48__LSPlugInKitProxy_pluginKitProxyForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v6 = a2;
  if (v6)
  {
    v10 = v6;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
    objc_msgSend(v10, "pluginIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "originalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    v6 = v10;
    if ((v9 & 1) == 0)
      *a4 = 1;
  }

}

- (NSString)pluginIdentifier
{
  return self->_pluginIdentifier;
}

- (NSString)originalIdentifier
{
  return self->_originalIdentifier;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingBundle, 0);
  objc_storeStrong((id *)&self->_registrationDate, 0);
  objc_storeStrong((id *)&self->_pluginUUID, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_originalIdentifier, 0);
  objc_storeStrong((id *)&self->_pluginIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionPointID, 0);
  objc_storeStrong((id *)&self->_appexRecord, 0);
}

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 inScope:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = (void *)MEMORY[0x186DAE7A0]();
  -[LSBundleProxy _infoDictionary](self, "_infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (a5 == 2)
  {
    v12 = 0;
    goto LABEL_8;
  }
  if (a5 == 1)
  {
    objc_msgSend(v10, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_10;
  }
  v12 = 0;
  v13 = 0;
  if (a5)
    goto LABEL_13;
  objc_msgSend(v10, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_8:
    objc_msgSend(v10, "objectForKey:ofClass:", v8, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!a4)
    goto LABEL_13;
LABEL_10:
  if (v13 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v13 = 0;
  }
LABEL_13:

  objc_autoreleasePoolPop(v9);
  return v13;
}

void __91__LSPlugInKitProxy__initWithPlugin_andContext_applicationExtensionRecord_resolveAndDetach___block_invoke(uint64_t a1, uint64_t a2, int a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)_CSStringCopyCFString();
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
      if (v6)
      {
        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        if (!v7)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = v8;

          v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        }
        objc_msgSend(v7, "addObject:", v6);
      }
      else
      {
        _LSDefaultLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(a1 + 32);
          v13 = 138412546;
          v14 = v12;
          v15 = 2112;
          v16 = v5;
          _os_log_impl(&dword_182882000, v11, OS_LOG_TYPE_DEFAULT, "Launch Services: Failed to create a UUID for %@ from invalid string %@", (uint8_t *)&v13, 0x16u);
        }

      }
    }

  }
  else
  {
    *a4 = 1;
  }
}

- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  LSApplicationExtensionRecord *appexRecord;
  uint64_t v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  appexRecord = self->_appexRecord;
  if (v4)
  {
    if (v6)
      -[LSBundleRecord localizedShortNameWithPreferredLocalizations:](appexRecord, "localizedShortNameWithPreferredLocalizations:", v6);
    else
      -[LSBundleRecord localizedShortName](appexRecord, "localizedShortName");
  }
  else if (v6)
  {
    -[LSBundleRecord localizedNameWithPreferredLocalizations:](appexRecord, "localizedNameWithPreferredLocalizations:", v6);
  }
  else
  {
    -[LSBundleRecord localizedName](appexRecord, "localizedName");
  }
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;

  return v9;
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (IconServicesLibrary_frameworkLibrary_2
    || (v7 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary_2 = (uint64_t)v7) != 0))
  {
    ((void (*)(void *, uint64_t, uint64_t))softLink_ISIconDataForResourceProxy_0[0])(self, v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

+ (id)plugInKitProxyForPlugin:(unsigned int)a3 withContext:(LSContext *)a4 applicationExtensionRecord:(id)a5 resolveAndDetach:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v10;
  void *v11;

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPlugin:andContext:applicationExtensionRecord:resolveAndDetach:", v8, a4, v10, v6);

  return v11;
}

+ (id)pluginKitProxyForURL:(id)a3
{
  id v3;
  CFErrorRef v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__35;
  v14 = __Block_byref_object_dispose__35;
  v15 = 0;
  v4 = _LSCreateResolvedURL(v3);
  +[LSPlugInQuery pluginQueryWithURL:](LSPlugInQuery, "pluginQueryWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__LSPlugInKitProxy_pluginKitProxyForURL___block_invoke;
  v9[3] = &unk_1E103FC78;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateResolvedResultsOfQuery:withBlock:", v5, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __41__LSPlugInKitProxy_pluginKitProxyForURL___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x186DAE7A0]();
  if (v14)
  {
    v10 = v14;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(_QWORD *)(v11 + 40);
    v12 = (id *)(v11 + 40);
    if (!v13)
    {
      objc_storeStrong(v12, a2);
      *a4 = 1;
    }

  }
  objc_autoreleasePoolPop(v9);

}

+ (id)plugInKitProxyForUUID:(id)a3 bundleIdentifier:(id)a4 pluginIdentifier:(id)a5 effectiveIdentifier:(id)a6 version:(id)a7 bundleURL:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithUUID:bundleIdentifier:pluginIdentifier:effectiveIdentifier:version:bundleURL:", v19, v18, v17, v16, v15, v14);

  return v20;
}

- (id)_initWithUUID:(id)a3 bundleIdentifier:(id)a4 pluginIdentifier:(id)a5 effectiveIdentifier:(id)a6 version:(id)a7 bundleURL:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  FSNode *v26;
  FSNode *v27;
  void *v28;
  void *v29;
  int v30;
  objc_super v32;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)LSPlugInKitProxy;
  v18 = -[LSBundleProxy _initWithBundleUnit:context:bundleType:bundleID:localizedName:bundleContainerURL:dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:](&v32, sel__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version_, 0, 0, 6, a4, 0, 0, 0, v17, 0, 0, a7);
  if (v18)
  {
    v19 = v16 ? v16 : v15;
    v20 = objc_msgSend(v19, "copy");
    v21 = (void *)v18[23];
    v18[23] = v20;

    v22 = objc_msgSend(v15, "copy");
    v23 = (void *)v18[24];
    v18[24] = v22;

    v24 = objc_msgSend(v14, "copy");
    v25 = (void *)v18[26];
    v18[26] = v24;

    *((_BYTE *)v18 + 176) = 1;
    if (v17)
    {
      v26 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v17, 0, 0);
      v27 = v26;
      if (v26)
      {
        -[FSNode volumeNodeWithFlags:error:](v26, "volumeNodeWithFlags:error:", 0, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          +[FSNode rootVolumeNode](FSNode, "rootVolumeNode");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "isEqual:", v29);

          if (v30)
            *((_BYTE *)v18 + 176) = 1;
        }

      }
    }
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSPlugInKitProxy)initWithCoder:(id)a3
{
  id v4;
  LSPlugInKitProxy *v5;
  uint64_t v6;
  NSString *pluginIdentifier;
  uint64_t v8;
  NSString *originalIdentifier;
  uint64_t v10;
  NSString *protocol;
  uint64_t v12;
  NSString *extensionPointID;
  uint64_t v14;
  NSUUID *pluginUUID;
  uint64_t v16;
  NSDate *registrationDate;
  uint64_t v18;
  LSBundleProxy *containingBundle;
  uint64_t v20;
  LSApplicationExtensionRecord *appexRecord;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)LSPlugInKitProxy;
  v5 = -[LSBundleProxy initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pluginIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    pluginIdentifier = v5->_pluginIdentifier;
    v5->_pluginIdentifier = (NSString *)v6;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    originalIdentifier = v5->_originalIdentifier;
    v5->_originalIdentifier = (NSString *)v8;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protocol"));
    v10 = objc_claimAutoreleasedReturnValue();
    protocol = v5->_protocol;
    v5->_protocol = (NSString *)v10;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionPointID"));
    v12 = objc_claimAutoreleasedReturnValue();
    extensionPointID = v5->_extensionPointID;
    v5->_extensionPointID = (NSString *)v12;

    v5->_platform = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("platform"));
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pluginUUID"));
    v14 = objc_claimAutoreleasedReturnValue();
    pluginUUID = v5->_pluginUUID;
    v5->_pluginUUID = (NSUUID *)v14;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registrationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    registrationDate = v5->_registrationDate;
    v5->_registrationDate = (NSDate *)v16;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containingBundle"));
    v18 = objc_claimAutoreleasedReturnValue();
    containingBundle = v5->_containingBundle;
    v5->_containingBundle = (LSBundleProxy *)v18;

    v5->_onSystemPartition = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOnSystemPartition"));
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appexRecord"));
    v20 = objc_claimAutoreleasedReturnValue();
    appexRecord = v5->_appexRecord;
    v5->_appexRecord = (LSApplicationExtensionRecord *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LSPlugInKitProxy;
  v4 = a3;
  -[LSBundleProxy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pluginIdentifier, CFSTR("pluginIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalIdentifier, CFSTR("originalIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_protocol, CFSTR("protocol"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionPointID, CFSTR("extensionPointID"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_platform, CFSTR("platform"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pluginUUID, CFSTR("pluginUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_registrationDate, CFSTR("registrationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_containingBundle, CFSTR("containingBundle"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_onSystemPartition, CFSTR("isOnSystemPartition"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appexRecord, CFSTR("appexRecord"));

}

- (NSNumber)platform
{
  void *v2;

  if (self->_platform)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSNumber *)v2;
}

- (unint64_t)compatibilityState
{
  return -[LSBundleProxy compatibilityState](self->_containingBundle, "compatibilityState");
}

- (NSDictionary)pluginKitDictionary
{
  void *v2;
  void *v3;

  -[LSBundleProxy _infoDictionary](self, "_infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)infoPlist
{
  void *v2;
  void *v3;

  -[LSBundleProxy _infoDictionary](self, "_infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSLazyPropertyList propertyList](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)pluginCanProvideIcon
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;

  -[LSPlugInKitProxy protocol](self, "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", getIMMessagePayloadProviderExtensionPointName[0]());

  if ((v4 & 1) != 0)
    return 1;
  -[LSPlugInKitProxy containingBundle](self, "containingBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.share"));

  if ((v7 & 1) != 0)
    return 1;
  -[LSPlugInKitProxy containingBundle](self, "containingBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9 == 0;

  return v8;
}

- (LSExtensionPoint)extensionPoint
{
  NSString *extensionPointID;
  NSString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v10;

  extensionPointID = self->_extensionPointID;
  if (extensionPointID)
  {
    v4 = extensionPointID;
LABEL_4:
    -[LSPlugInKitProxy platform](self, "platform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[LSExtensionPoint extensionPointForIdentifier:platform:](LSExtensionPoint, "extensionPointForIdentifier:platform:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  -[LSPlugInKitProxy protocol](self, "protocol");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  _LSDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[LSPlugInKitProxy extensionPoint].cold.1((uint64_t)self, v10);

  v4 = 0;
  v8 = 0;
LABEL_5:

  return (LSExtensionPoint *)v8;
}

- (id)boundIconsDictionary
{
  void *v2;
  void *v3;

  -[LSBundleProxy _infoDictionary](self, "_infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:ofClass:", CFSTR("CFBundleIcons"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bundleType
{
  return CFSTR("PluginKitPlugin");
}

- (BOOL)profileValidated
{
  return -[LSBundleRecord isProfileValidated](self->_appexRecord, "isProfileValidated");
}

- (BOOL)UPPValidated
{
  return -[LSBundleRecord isUPPValidated](self->_appexRecord, "isUPPValidated");
}

- (BOOL)freeProfileValidated
{
  return -[LSBundleRecord isFreeProfileValidated](self->_appexRecord, "isFreeProfileValidated");
}

- (id)signerOrganization
{
  return -[LSBundleRecord signerOrganization](self->_appexRecord, "signerOrganization");
}

- (id)signerIdentity
{
  return -[LSBundleRecord signerIdentity](self->_appexRecord, "signerIdentity");
}

- (id)_stringLocalizerForTable:(id)a3
{
  LSApplicationExtensionRecord *appexRecord;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  _LSStringLocalizer *v10;
  void *v11;
  _LSStringLocalizer *v12;
  uint64x2_t v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  appexRecord = self->_appexRecord;
  v5 = a3;
  v6 = -[LSBundleRecord platform](appexRecord, "platform");
  -[LSBundleRecord SDKVersion](self->_appexRecord, "SDKVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LSVersionNumberMakeWithString(v14, v7);
  v8 = _LSMakeDYLDVersionFromVersionNumber(v14);

  v9 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:sdkVersion:](_LSStringLocalizer, "useLegacyLocalizationListForPlatform:sdkVersion:", v6, v8);
  v10 = [_LSStringLocalizer alloc];
  -[LSBundleProxy bundleURL](self, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_LSStringLocalizer initWithBundleURL:stringsFile:legacyLocalizationList:](v10, "initWithBundleURL:stringsFile:legacyLocalizationList:", v11, v5, v9);

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)LSPlugInKitProxy;
  -[LSPlugInKitProxy description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSPlugInKitProxy pluginIdentifier](self, "pluginIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSPlugInKitProxy pluginUUID](self, "pluginUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleProxy bundleVersion](self, "bundleVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ pluginID=%@ UUID=%@ version=%@"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_managedPersonas
{
  void *v2;
  void *v3;

  -[LSPlugInKitProxy containingBundle](self, "containingBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_managedPersonas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_usesSystemPersona
{
  void *v2;
  char v3;

  -[LSPlugInKitProxy containingBundle](self, "containingBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_usesSystemPersona");

  return v3;
}

- (id)dataContainerURL
{
  return -[LSBundleRecord dataContainerURL](self->_appexRecord, "dataContainerURL");
}

- (id)groupContainerURLs
{
  return -[LSBundleRecord groupContainerURLs](self->_appexRecord, "groupContainerURLs");
}

- (void)detach
{
  -[LSRecord _resolveAllProperties](self->_appexRecord, "_resolveAllProperties");
  -[LSRecord detach](self->_appexRecord, "detach");
}

- (NSUUID)pluginUUID
{
  return self->_pluginUUID;
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (BOOL)isOnSystemPartition
{
  return self->_onSystemPartition;
}

+ (id)containingBundleIdentifiersForPlugInBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  void (*v12[5])(_QWORD, _QWORD);
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__35;
  v23 = __Block_byref_object_dispose__35;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__35;
  v17 = __Block_byref_object_dispose__35;
  v18 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v12[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v12[2] = (void (*)(_QWORD, _QWORD))__108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke;
  v12[3] = (void (*)(_QWORD, _QWORD))&unk_1E10407A0;
  v12[4] = (void (*)(_QWORD, _QWORD))&v13;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke_2;
  v11[3] = &unk_1E1040B08;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v7, "mapPlugInBundleIdentifiersToContainingBundleIdentifiers:completionHandler:", v5, v11);
  v8 = (void *)v20[5];
  if (a4 && !v8)
  {
    *a4 = objc_retainAutorelease((id)v14[5]);
    v8 = (void *)v20[5];
  }
  v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)correspondingApplicationExtensionRecord
{
  return self->_appexRecord;
}

- (void)extensionPoint
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Failed to get the extension point ID of plugin %@", (uint8_t *)&v2, 0xCu);
}

@end
