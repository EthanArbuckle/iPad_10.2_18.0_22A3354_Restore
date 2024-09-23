@implementation LSBundleProxy

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4
{
  return -[LSBundleProxy objectForInfoDictionaryKey:ofClass:valuesOfClass:](self, "objectForInfoDictionaryKey:ofClass:valuesOfClass:", a3, a4, 0);
}

- (id)entitlementValueForKey:(id)a3 ofClass:(Class)a4
{
  return -[LSBundleProxy entitlementValueForKey:ofClass:valuesOfClass:](self, "entitlementValueForKey:ofClass:valuesOfClass:", a3, a4, 0);
}

- (id)_initWithBundleUnit:(unsigned int)a3 context:(LSContext *)a4 bundleType:(unint64_t)a5 bundleID:(id)a6 localizedName:(id)a7 bundleContainerURL:(id)a8 dataContainerURL:(id)a9 resourcesDirectoryURL:(id)a10 iconsDictionary:(id)a11 iconFileNames:(id)a12 version:(id)a13
{
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  char *v20;
  LSContext *v21;
  uint64_t SequenceNumber;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unsigned int v28;
  id v29;
  unsigned int v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  _LSDatabase *db;
  int v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  int v54;
  void *v55;
  __int128 v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  id *v65;
  id *v66;
  id v67;
  void *v68;
  void *v69;
  id *v70;
  uint64_t v72;
  id v73;
  void *v74;
  LSContext *v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  void *v80;
  uint64_t v82;
  id v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  char *newValue;
  objc_super v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t);
  void *v103;
  id v104;
  id v105;
  LSContext *v106;
  id v107;
  id v108;
  id v109;
  _BYTE v110[128];
  _OWORD v111[2];
  _BYTE buf[12];
  __int16 v113;
  unint64_t v114;
  __int16 v115;
  uint64_t v116;
  uint64_t v117;

  v16 = *(_QWORD *)&a3;
  v117 = *MEMORY[0x1E0C80C00];
  v86 = a6;
  v85 = a7;
  v17 = a8;
  v92 = a9;
  v18 = v16;
  v19 = a10;
  v20 = (char *)a11;
  newValue = (char *)a12;
  v84 = a13;
  if ((_DWORD)v16)
  {
    if (a4)
    {
      v21 = a4;
      _LSDatabaseGetCacheGUID();
      v91 = (id)objc_claimAutoreleasedReturnValue();
      SequenceNumber = _LSDatabaseGetSequenceNumber();
      v23 = _LSBundleGet(a4->db, v18);
      v24 = v17;
      v25 = v86;
      if (v23)
      {
        v26 = v23;
        v77 = (uint64_t)v20;
        v80 = *(void **)(v23 + 280);
        v27 = *(_QWORD *)(v23 + 172);
        if (*(_DWORD *)v23)
        {
          *(_QWORD *)buf = 0;
          v28 = v18;
          v29 = 0;
          if (!_LSBundleCopyNode(v21->db, v18, 0, 0, buf))
          {
            objc_msgSend(*(id *)buf, "URL");
            v29 = (id)objc_claimAutoreleasedReturnValue();
          }

          v30 = *(unsigned __int8 *)(v26 + 188);
          if (!v19 && v29)
          {
            v29 = v29;
            v19 = v29;
          }
        }
        else
        {
          v28 = v18;
          v29 = 0;
          v30 = *(unsigned __int8 *)(v23 + 188);
        }
        v73 = v29;
        v75 = v21;
        if (!v92)
        {
          if (*(_DWORD *)(v26 + 96)
            && (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) == 0)
          {
            db = v21->db;
            v48 = *(_DWORD *)(v26 + 96);
            v107 = 0;
            v49 = _LSAliasCopyResolvedNode(db, v48, 0, 0, &v107);
            v50 = v107;
            if (!v49)
            {
              _LSDefaultLog();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                v72 = *(unsigned int *)(v26 + 96);
                *(_DWORD *)buf = 134218498;
                *(_QWORD *)&buf[4] = v72;
                v113 = 2048;
                v114 = v28;
                v115 = 2112;
                v116 = (uint64_t)v50;
                _os_log_error_impl(&dword_182882000, v51, OS_LOG_TYPE_ERROR, "Couldn't copy data container alias %lu for bundle %lu: %@", buf, 0x20u);
              }

            }
            objc_msgSend(v49, "URL", v73);
            v92 = (id)objc_claimAutoreleasedReturnValue();

            v21 = v75;
          }
          else
          {
            v92 = 0;
          }
        }
        v87 = v19;
        if (!v77)
        {
          +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", v21, *(unsigned int *)(v26 + 452));
          v77 = objc_claimAutoreleasedReturnValue();
        }
        v76 = v26;
        if (!newValue)
        {
          if (*(_DWORD *)(v26 + 456))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = MEMORY[0x1E0C809B0];
            v101 = 3221225472;
            v102 = __175__LSBundleProxy__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version___block_invoke;
            v103 = &unk_1E1041E08;
            v106 = v21;
            v53 = v52;
            v104 = v53;
            v105 = v86;
            _CSArrayEnumerateAllValues();
            if (objc_msgSend(v53, "count"))
              newValue = (char *)v53;
            else
              newValue = 0;

            v21 = v75;
            v26 = v76;
          }
          else
          {
            newValue = 0;
          }
        }
        if (!v24)
        {
          v54 = *(_DWORD *)(v26 + 504);
          if (v54)
          {
            v55 = _LSAliasCopyResolvedNode(v21->db, v54, 0, 0, 0);
            objc_msgSend(v55, "URL");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = v76;
          }
          else
          {
            v24 = 0;
          }
        }
        v74 = v24;
        v78 = (v30 >> 1) & 1;
        v82 = *(_QWORD *)(v26 + 272);
        v90 = (id)_CSStringCopyCFString();
        v56 = *(_OWORD *)(v26 + 76);
        v111[0] = *(_OWORD *)(v26 + 60);
        v111[1] = v56;
        _LSVersionNumberGetStringRepresentation(v111);
        v89 = (id)objc_claimAutoreleasedReturnValue();
        v79 = (v27 >> 38) & 1;
        +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", v21, *(unsigned int *)(v26 + 136));
        v88 = (id)objc_claimAutoreleasedReturnValue();
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        _LSDatabaseGetStringArray(v21->db);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
        if (v58)
        {
          v59 = v58;
          v34 = 0;
          v60 = *(_QWORD *)v97;
          do
          {
            for (i = 0; i != v59; ++i)
            {
              if (*(_QWORD *)v97 != v60)
                objc_enumerationMutation(v57);
              v62 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i);
              v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v62);
              if (v63)
              {
                if (!v34)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v34, "addObject:", v63, v73);
              }
              else
              {
                _LSDefaultLog();
                v64 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v62;
                  _os_log_impl(&dword_182882000, v64, OS_LOG_TYPE_DEFAULT, "Launch Services: Failed to create a UUID from invalid string %@", buf, 0xCu);
                }

              }
            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
          }
          while (v59);
        }
        else
        {
          v34 = 0;
        }

        +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", v75, *(unsigned int *)(v76 + 140));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 1;
        v37 = v85;
        v25 = v86;
        v33 = v73;
        v24 = v74;
        v20 = (char *)v77;
      }
      else
      {
        v87 = v19;
        _LSDefaultLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v86;
          v113 = 2112;
          v114 = (unint64_t)v91;
          v115 = 2048;
          v116 = SequenceNumber;
          _os_log_error_impl(&dword_182882000, v46, OS_LOG_TYPE_ERROR, "LaunchServices: _LSBundleGet() failed, can't create LSBundleProxy for %@ {%@ %llu}", buf, 0x20u);
        }
        v82 = SequenceNumber;

        LOBYTE(v79) = 0;
        v80 = 0;
        v89 = 0;
        v90 = 0;
        v88 = 0;
        v34 = 0;
        v35 = 0;
        LOBYTE(v78) = 0;
        v33 = 0;
        v36 = 1;
        v37 = v85;
      }
    }
    else
    {
      v87 = v19;
      _LSDefaultLog();
      v38 = objc_claimAutoreleasedReturnValue();
      v37 = v85;
      v25 = v86;
      v24 = v17;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[LSBundleProxy _initWithBundleUnit:context:bundleType:bundleID:localizedName:bundleContainerURL:dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:].cold.1(v18, v38, v39, v40, v41, v42, v43, v44);

      v90 = 0;
      v91 = 0;
      v82 = 0;
      LOBYTE(v79) = 0;
      v80 = 0;
      v88 = 0;
      v89 = 0;
      v34 = 0;
      v35 = 0;
      LOBYTE(v78) = 0;
      v33 = 0;
      v36 = 1;
    }
  }
  else
  {
    +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0;
    v109 = 0;
    objc_msgSend(v31, "getKnowledgeUUID:andSequenceNumber:", &v109, &v108);
    v91 = v109;
    v32 = v108;

    v82 = objc_msgSend(v32, "unsignedLongLongValue");
    if (a5 == 6)
    {
      v33 = v19;
      v89 = 0;
      v90 = 0;
      v87 = v33;
      v88 = 0;
      v34 = 0;
      v35 = 0;
      LOBYTE(v78) = 0;
      LOBYTE(v79) = 1;
      v80 = 0;
      v36 = 1;
      v37 = v85;
      v25 = v86;
      v24 = v17;
    }
    else
    {
      v87 = v19;
      _LSDefaultLog();
      v45 = objc_claimAutoreleasedReturnValue();
      v37 = v85;
      v25 = v86;
      v24 = v17;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v86;
        v113 = 2112;
        v114 = (unint64_t)v91;
        v115 = 2048;
        v116 = v82;
        _os_log_debug_impl(&dword_182882000, v45, OS_LOG_TYPE_DEBUG, "LaunchServices: failed to find bundle record for %@ {%@ %llu}", buf, 0x20u);
      }

      LOBYTE(v79) = 0;
      v80 = 0;
      v89 = 0;
      v90 = 0;
      v88 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      LOBYTE(v78) = 0;
      v33 = 0;
    }
  }
  v95.receiver = self;
  v95.super_class = (Class)LSBundleProxy;
  v65 = -[LSResourceProxy _initWithLocalizedName:](&v95, sel__initWithLocalizedName_, v37, v73);
  v66 = v65;
  if (v65)
  {
    objc_storeStrong(v65 + 6, a6);
    objc_storeStrong(v66 + 7, v33);
    objc_storeStrong(v66 + 8, v90);
    objc_storeStrong(v66 + 9, v24);
    *((_BYTE *)v66 + 40) = v36;
    objc_storeStrong(v66 + 10, a13);
    objc_storeStrong(v66 + 12, v91);
    v66[13] = (id)v82;
    *((_BYTE *)v66 + 41) = v79;
    v67 = v66[4];
    v66[4] = 0;

    objc_storeStrong(v66 + 16, v88);
    objc_storeStrong(v66 + 14, v34);
    objc_storeStrong(v66 + 11, v89);
    objc_storeStrong(v66 + 17, v35);
    v66[15] = v80;
    if (IconServicesLibrary_frameworkLibrary_1
      || (IconServicesLibrary_frameworkLibrary_1 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
    {
      objc_msgSend(v66, "_boundIconInfo");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setApplicationIdentifier:", v25);
      -[_LSBoundIconInfo setContainerURL:]((uint64_t)v68, v24);
      -[_LSBoundIconInfo setDataContainerURL:]((uint64_t)v68, v92);
      objc_msgSend(v68, "setResourcesDirectoryURL:", v87);
      -[_LSBoundIconInfo setIconsDictionary:](v68, v20);
      -[_LSBoundIconInfo setCacheKey:](v68, CFSTR("CFBundlePrimaryIcon"));
      -[_LSBoundIconInfo setFileNames:](v68, newValue);
      -[_LSBoundIconInfo setPrerendered:]((uint64_t)v68, v78);

    }
  }
  v69 = v33;
  v70 = v66;

  return v70;
}

+ (id)bundleProxyForIdentifier:(id)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  void *v10;

  v4 = (__CFString *)a3;
  if (objc_msgSend(a1, "canInstantiateFromDatabase"))
  {
    v10 = 0;
    if (_LSContextInit(&v10))
    {
      v5 = 0;
LABEL_10:

      goto LABEL_11;
    }
    v6 = _LSFindBundleWithInfo_NoIOFiltered(&v10, 1uLL, v4, 0, 0, 0, 0, 0, 0);
    v9 = v6;
    if ((_DWORD)v6
      || (v6 = _LSFindBundleWithInfo_NoIOFiltered(&v10, 3uLL, v4, 0, 0, 0, 0, 0, 0), (v9 = v6) != 0))
    {
      +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:](LSApplicationProxy, "applicationProxyWithBundleUnitID:withContext:", v6, &v10);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = _LSFindBundleWithInfo_NoIOFiltered(&v10, 5uLL, v4, 0, 0, 0, 0, 0, 0);
      if (v9)
      {
        +[LSVPNPluginProxy VPNPluginProxyForIdentifier:withContext:](LSVPNPluginProxy, "VPNPluginProxyForIdentifier:withContext:", v4, &v10);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!_LSPluginFindWithInfo(v10, 0, v4, 3, 0, &v9, 0))
        {
          v5 = 0;
          goto LABEL_9;
        }
        +[LSPlugInKitProxy plugInKitProxyForPlugin:withContext:](LSPlugInKitProxy, "plugInKitProxyForPlugin:withContext:", v9, &v10);
        v7 = objc_claimAutoreleasedReturnValue();
      }
    }
    v5 = (void *)v7;
LABEL_9:
    _LSContextDestroy(&v10);
    goto LABEL_10;
  }
  +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v5;
}

+ (BOOL)canInstantiateFromDatabase
{
  int MayMapDatabase;

  MayMapDatabase = _LSCurrentProcessMayMapDatabase();
  if (MayMapDatabase)
    LOBYTE(MayMapDatabase) = !+[_LSQueryContext simulateLimitedMappingForXCTests](_LSQueryContext, "simulateLimitedMappingForXCTests");
  return MayMapDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__environmentVariables, 0);
  objc_storeStrong((id *)&self->__entitlements, 0);
  objc_storeStrong((id *)&self->__infoDictionary, 0);
  objc_storeStrong((id *)&self->_machOUUIDs, 0);
  objc_storeStrong((id *)&self->_cacheGUID, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleContainerURL, 0);
  objc_storeStrong((id *)&self->_bundleExecutable, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedShortName, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LSBundleProxy;
  v4 = a3;
  -[LSResourceProxy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleURL, CFSTR("bundleURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleVersion, CFSTR("bundleVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleExecutable, CFSTR("bundleExecutable"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleContainerURL, CFSTR("bundleContainerURL"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_sequenceNumber, CFSTR("sequenceNumber"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_compatibilityState, CFSTR("compatibilityState"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_foundBackingBundle, CFSTR("foundBundle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cacheGUID, CFSTR("cacheGUID"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_containerized, CFSTR("isContainerized"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedShortName, CFSTR("localizedShortName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->__infoDictionary, CFSTR("infoDictionary"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_machOUUIDs, CFSTR("machOUUIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sdkVersion, CFSTR("sdkVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->__entitlements, CFSTR("entitlements"));

}

- (LSBundleProxy)initWithCoder:(id)a3
{
  id v4;
  LSBundleProxy *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSURL *bundleURL;
  uint64_t v10;
  NSString *bundleVersion;
  uint64_t v12;
  NSString *bundleExecutable;
  uint64_t v14;
  NSURL *bundleContainerURL;
  uint64_t v16;
  NSUUID *cacheGUID;
  uint64_t v18;
  NSString *localizedShortName;
  uint64_t v20;
  _LSLazyPropertyList *infoDictionary;
  uint64_t v22;
  NSArray *machOUUIDs;
  uint64_t v24;
  NSString *sdkVersion;
  uint64_t v26;
  _LSLazyPropertyList *entitlements;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)LSBundleProxy;
  v5 = -[LSResourceProxy initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v8;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v10;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleExecutable"));
    v12 = objc_claimAutoreleasedReturnValue();
    bundleExecutable = v5->_bundleExecutable;
    v5->_bundleExecutable = (NSString *)v12;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleContainerURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    bundleContainerURL = v5->_bundleContainerURL;
    v5->_bundleContainerURL = (NSURL *)v14;

    v5->_sequenceNumber = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sequenceNumber"));
    v5->_compatibilityState = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("compatibilityState"));
    v5->_foundBackingBundle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("foundBundle"));
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheGUID"));
    v16 = objc_claimAutoreleasedReturnValue();
    cacheGUID = v5->_cacheGUID;
    v5->_cacheGUID = (NSUUID *)v16;

    v5->_containerized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContainerized"));
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedShortName"));
    v18 = objc_claimAutoreleasedReturnValue();
    localizedShortName = v5->_localizedShortName;
    v5->_localizedShortName = (NSString *)v18;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("infoDictionary"));
    v20 = objc_claimAutoreleasedReturnValue();
    infoDictionary = v5->__infoDictionary;
    v5->__infoDictionary = (_LSLazyPropertyList *)v20;

    objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), CFSTR("machOUUIDs"));
    v22 = objc_claimAutoreleasedReturnValue();
    machOUUIDs = v5->_machOUUIDs;
    v5->_machOUUIDs = (NSArray *)v22;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sdkVersion"));
    v24 = objc_claimAutoreleasedReturnValue();
    sdkVersion = v5->_sdkVersion;
    v5->_sdkVersion = (NSString *)v24;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entitlements"));
    v26 = objc_claimAutoreleasedReturnValue();
    entitlements = v5->__entitlements;
    v5->__entitlements = (_LSLazyPropertyList *)v26;

  }
  return v5;
}

- (void)setSDKVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setMachOUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)_setInfoDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)_setEntitlements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)entitlementValueForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v13;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleProxy.m"), 752, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  -[LSBundleProxy _entitlements](self, "_entitlements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:checkingKeyClass:checkingValueClass:", v9, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (_LSLazyPropertyList)_entitlements
{
  return self->__entitlements;
}

+ (LSBundleProxy)bundleProxyWithAuditToken:(id *)a3 error:(id *)a4
{
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v8[2];

  v4 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v4;
  +[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", v8, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compatibilityObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (LSBundleProxy *)v6;
}

+ (id)bundleProxyForCurrentProcess
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
  objc_msgSend((id)current, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!current)
    goto LABEL_15;
  if ((objc_msgSend(v3, "isEqual:", v5) & 1) == 0)
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Current bundle's identifier changed from %@ to %@", buf, 0x16u);
    }

    v7 = (void *)current;
    current = 0;

  }
  v8 = (void *)current;
  if (!current)
  {
LABEL_15:
    if (_LSCurrentProcessMayMapDatabase())
    {
      +[LSBundleRecord bundleRecordForCurrentProcess](LSBundleRecord, "bundleRecordForCurrentProcess");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "compatibilityObject");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)current;
      current = v10;

    }
    else
    {
      +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getBundleProxyForCurrentProcessWithCompletionHandler:", &__block_literal_global_17);
    }

    v8 = (void *)current;
    if (current)
    {
      v12 = dispatch_time(0, 5000000000);
      dispatch_get_global_queue(0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_18;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_after(v12, v13, block);

      v8 = (void *)current;
    }
  }
  v14 = v8;

  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
  return v14;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)appStoreReceiptURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[LSBundleProxy dataContainerURL](self, "dataContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("StoreKit"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LSBundleProxy appStoreReceiptName](self, "appStoreReceiptName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSURL *)v6;
}

- (id)appStoreReceiptName
{
  if (-[LSBundleProxy profileValidated](self, "profileValidated"))
    return CFSTR("sandboxReceipt");
  else
    return CFSTR("receipt");
}

- (id)objectsForInfoDictionaryKeys:(id)a3
{
  id v5;
  LSBundleInfoCachedValues *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleProxy.m"), 767, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keys != nil"));

  }
  v6 = [LSBundleInfoCachedValues alloc];
  -[LSBundleProxy _infoDictionary](self, "_infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uncheckedObjectsForKeys:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:](v6, "_initWithKeys:forDictionary:", v5, v8);

  return v9;
}

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v13;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleProxy.m"), 778, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  -[LSBundleProxy _infoDictionary](self, "_infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:checkingKeyClass:checkingValueClass:", v9, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (_LSLazyPropertyList)_infoDictionary
{
  return self->__infoDictionary;
}

- (NSString)canonicalExecutablePath
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  -[LSBundleProxy bundleExecutable](self, "bundleExecutable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[LSBundleProxy canonicalExecutablePath].cold.1();
    goto LABEL_8;
  }
  -[LSBundleProxy bundleURL](self, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[LSBundleProxy canonicalExecutablePath].cold.2();
LABEL_8:

    v10 = 0;
    return (NSString *)v10;
  }
  v5 = objc_alloc(MEMORY[0x1E0C99E98]);
  -[LSBundleProxy bundleExecutable](self, "bundleExecutable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleProxy bundleURL](self, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByResolvingSymlinksInPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initFileURLWithPath:isDirectory:relativeToURL:", v6, 0, v8);
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)bundleExecutable
{
  return self->_bundleExecutable;
}

- (id)localizedName
{
  void *v3;
  void *v4;
  objc_super v6;

  os_unfair_lock_lock(&localizedNameLock);
  v6.receiver = self;
  v6.super_class = (Class)LSBundleProxy;
  -[LSResourceProxy localizedName](&v6, sel_localizedName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&localizedNameLock);
  if (!v3)
  {
    -[LSBundleProxy _localizedNameWithPreferredLocalizations:useShortNameOnly:](self, "_localizedNameWithPreferredLocalizations:useShortNameOnly:", 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      os_unfair_lock_lock(&localizedNameLock);
      v4 = (void *)objc_msgSend(v3, "copy");
      -[LSResourceProxy _setLocalizedName:](self, "_setLocalizedName:", v4);

      os_unfair_lock_unlock(&localizedNameLock);
    }
  }
  return v3;
}

- (BOOL)foundBackingBundle
{
  return self->_foundBackingBundle;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (BOOL)isContainerized
{
  return self->_containerized;
}

+ (id)bundleProxyForURL:(id)a3
{
  return (id)objc_msgSend(a1, "bundleProxyForURL:error:", a3, 0);
}

+ (id)bundleProxyForURL:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  FSNode *v9;
  NSObject *v10;
  unsigned int v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a1, "canInstantiateFromDatabase"))
  {
    v13 = 0;
    if (!_LSContextInitReturningError(&v13, a4))
    {
      v8 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v7 = _LSFindBundleWithInfo_NoIOFiltered(&v13, 0, 0, 0, v6, 0, 0, 0, a4);
    if ((_DWORD)v7)
    {
      +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:](LSApplicationProxy, "applicationProxyWithBundleUnitID:withContext:", v7, &v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      _LSContextDestroy(&v13);
      goto LABEL_18;
    }
    v9 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v6, 0, a4);
    if (v9)
    {
      v12 = 0;
      if (_LSPluginFindWithInfo(v13, 0, 0, 0, v9, &v12, a4))
      {
        +[LSPlugInKitProxy plugInKitProxyForPlugin:withContext:](LSPlugInKitProxy, "plugInKitProxyForPlugin:withContext:", v12, &v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

        goto LABEL_17;
      }
      _LSDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, "no registered bundle with URL %@", buf, 0xCu);
      }

    }
    v8 = 0;
    goto LABEL_16;
  }
  __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
  __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"+[LSBundleProxy bundleProxyForURL:error:]", 291, 0);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_19:

  return v8;
}

+ (void)clearBundleProxyForCurrentProcess
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
  v2 = (void *)current;
  current = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_cold_1();

}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&current, a2);
  }
  else
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_cold_1();

  }
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_18(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(*(id *)(a1 + 32), "clearBundleProxyForCurrentProcess");
  objc_autoreleasePoolPop(v2);
}

void __175__LSBundleProxy__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)_CSStringCopyCFString();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
  }
  else
  {
    _LSDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "Invaid icon file name saved for app %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleType
{
  return 0;
}

- (NSURL)containerURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[LSBundleProxy dataContainerURL](self, "dataContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LSBundleProxy dataContainerURL](self, "dataContainerURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LSBundleProxy bundleURL](self, "bundleURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("/var/mobile/Applications/")) & 1) != 0
      || objc_msgSend(v7, "hasPrefix:", CFSTR("/private/var/mobile/Applications/")))
    {
      v8 = objc_alloc(MEMORY[0x1E0C99E98]);
      objc_msgSend(v7, "stringByDeletingLastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v8, "initFileURLWithPath:isDirectory:", v9, 1);

    }
    else
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/var/mobile/"), 1);
    }

  }
  return (NSURL *)v4;
}

- (id)_managedPersonas
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)_usesSystemPersona
{
  return 0;
}

- (BOOL)_hasAssociatedPersonas
{
  void *v2;
  BOOL v3;

  -[LSBundleProxy _managedPersonas](self, "_managedPersonas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSURL)dataContainerURL
{
  return 0;
}

- (NSDictionary)environmentVariables
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (NSString)signerIdentity
{
  return 0;
}

- (NSString)signerOrganization
{
  return 0;
}

- (NSDictionary)entitlements
{
  void *v2;
  void *v3;

  -[LSBundleProxy _entitlements](self, "_entitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSLazyPropertyList propertyList](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)entitlementValuesForKeys:(id)a3
{
  id v5;
  LSBundleInfoCachedValues *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleProxy.m"), 740, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keys != nil"));

  }
  v6 = [LSBundleInfoCachedValues alloc];
  -[LSBundleProxy _entitlements](self, "_entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uncheckedObjectsForKeys:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:](v6, "_initWithKeys:forDictionary:", v5, v8);

  return v9;
}

- (NSDictionary)groupContainerURLs
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (id)_stringLocalizerForTable:(id)a3
{
  id v4;
  _LSStringLocalizer *v5;
  void *v6;
  _LSStringLocalizer *v7;

  v4 = a3;
  v5 = [_LSStringLocalizer alloc];
  -[LSBundleProxy bundleURL](self, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_LSStringLocalizer initWithBundleURL:stringsFile:](v5, "initWithBundleURL:stringsFile:", v6, v4);

  return v7;
}

- (id)localizedValuesForKeys:(id)a3 fromTable:(id)a4
{
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v17;

  v7 = a3;
  v8 = (__CFString *)a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleProxy.m"), 793, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keys != nil"));

  }
  v9 = (void *)MEMORY[0x186DAE7A0]();
  -[LSBundleProxy bundleURL](self, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[FSNode canReadURL:fromSandboxWithAuditToken:](FSNode, "canReadURL:fromSandboxWithAuditToken:", v10, 0);

  v12 = 0;
  if (v11)
  {
    if (v8)
      v13 = v8;
    else
      v13 = CFSTR("InfoPlist");
    -[LSBundleProxy _stringLocalizerForTable:](self, "_stringLocalizerForTable:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringsWithStrings:preferredLocalizations:", v7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v12 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:]([LSBundleInfoCachedValues alloc], "_initWithKeys:forDictionary:", v7, v15);
    else
      v12 = 0;

  }
  objc_autoreleasePoolPop(v9);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  LSBundleProxy *v4;
  LSBundleProxy *v5;
  LSBundleProxy *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (LSBundleProxy *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[LSBundleProxy bundleType](v6, "bundleType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSBundleProxy bundleType](self, "bundleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      -[LSBundleProxy _valueForEqualityTesting](self, "_valueForEqualityTesting");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[LSBundleProxy _valueForEqualityTesting](v6, "_valueForEqualityTesting");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LSBundleProxy _valueForEqualityTesting](self, "_valueForEqualityTesting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSURL)bundleContainerURL
{
  return self->_bundleContainerURL;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (NSUUID)cacheGUID
{
  return self->_cacheGUID;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSArray)machOUUIDs
{
  return self->_machOUUIDs;
}

- (unint64_t)compatibilityState
{
  return self->_compatibilityState;
}

- (void)_setCompatibilityState:(unint64_t)a3
{
  self->_compatibilityState = a3;
}

- (_LSLazyPropertyList)_environmentVariables
{
  return self->__environmentVariables;
}

- (void)_setEnvironmentVariables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)localizedShortName
{
  NSString *v3;
  NSString *v4;
  NSString *localizedShortName;

  os_unfair_lock_lock(&localizedNameLock);
  v3 = self->_localizedShortName;
  os_unfair_lock_unlock(&localizedNameLock);
  if (!v3)
  {
    -[LSBundleProxy _localizedNameWithPreferredLocalizations:useShortNameOnly:](self, "_localizedNameWithPreferredLocalizations:useShortNameOnly:", 0, 1);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      os_unfair_lock_lock(&localizedNameLock);
      v4 = (NSString *)-[NSString copy](v3, "copy");
      localizedShortName = self->_localizedShortName;
      self->_localizedShortName = v4;

      os_unfair_lock_unlock(&localizedNameLock);
    }
  }
  return v3;
}

- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4
{
  return 0;
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Failed to get bundle proxy for current process: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithBundleUnit:(uint64_t)a3 context:(uint64_t)a4 bundleType:(uint64_t)a5 bundleID:(uint64_t)a6 localizedName:(uint64_t)a7 bundleContainerURL:(uint64_t)a8 dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "LaunchServices: requested bundle proxy with unit ID %llx but no context", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)canonicalExecutablePath
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Cannot generate canonicalExecutablePath for app %@ with no bundleURL set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
