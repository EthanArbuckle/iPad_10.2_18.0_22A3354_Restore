@implementation NEConfigurationManager

- (void)loadConfigurationsWithCompletionQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_INFO, "Loading all configurations", buf, 2u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke;
  v11[3] = &unk_1E3CC3080;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, 0, v11);

}

- (void)loadConfigurationsInternal:(void *)a3 withCompletionHandler:
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke;
    v7[3] = &unk_1E3CC3080;
    v7[4] = a1;
    v8 = v5;
    v9 = v6;
    -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](a1, v7);

  }
}

- (void)getCurrentIndexWithCompletionHandler:(_BYTE *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  const char *v7;
  void *v8;
  NSObject *Property;
  NSObject *v10;
  _QWORD v11[2];
  void (*v12)(uint64_t);
  void *v13;
  _BYTE *v14;
  id v15;
  _QWORD block[5];
  id v17;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v12 = __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke;
    v13 = &unk_1E3CC46A8;
    v14 = a1;
    v15 = v3;
    v6 = v11;
    v8 = v6;
    if (a1[24])
    {
      if ((a1[25] & 1) != 0)
      {
        v12((uint64_t)v6);
      }
      else
      {
        Property = objc_getProperty(a1, v7, 40, 1);
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __39__NEConfigurationManager_executeBlock___block_invoke;
        block[3] = &unk_1E3CC46A8;
        block[4] = a1;
        v17 = v8;
        dispatch_sync(Property, block);

      }
    }
    else
    {
      v10 = objc_getProperty(a1, v7, 40, 1);
      dispatch_async(v10, v8);
    }

  }
}

- (void)setChangedQueue:(id)a3 andHandler:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 40, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NEConfigurationManager_setChangedQueue_andHandler___block_invoke;
  block[3] = &unk_1E3CC3A30;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_sync(Property, block);

}

- (char)initWithUserUUID:(char *)a1
{
  id v3;
  __SecTask *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  void *v13;
  _BYTE *v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeID TypeID;
  id v18;
  void *v19;
  void *v20;
  NEHelper *v21;
  SEL v22;
  NEHelper *v23;
  SEL v24;
  objc_super v26;

  v3 = a2;
  if (!a1)
    goto LABEL_20;
  v26.receiver = a1;
  v26.super_class = (Class)NEConfigurationManager;
  a1 = (char *)objc_msgSendSuper2(&v26, sel_init);
  if (!a1)
    goto LABEL_20;
  v4 = SecTaskCreateFromSelf(0);
  v5 = objc_msgSend(v3, "copy");
  v6 = (void *)*((_QWORD *)a1 + 17);
  *((_QWORD *)a1 + 17) = v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create("NEConfigurationManager_inner", v7);
  v9 = (void *)*((_QWORD *)a1 + 5);
  *((_QWORD *)a1 + 5) = v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("NEConfigurationManager_outer", v10);
  v12 = (void *)*((_QWORD *)a1 + 6);
  *((_QWORD *)a1 + 6) = v11;

  *((_DWORD *)a1 + 7) = -1;
  v13 = (void *)*((_QWORD *)a1 + 1);
  *((_QWORD *)a1 + 1) = &stru_1E3CC53C8;

  *(_WORD *)(a1 + 21) = 0;
  v14 = a1 + 21;
  *((_DWORD *)a1 + 4) = 0;
  if (v4)
  {
    v15 = SecTaskCopyValueForEntitlement(v4, CFSTR("com.apple.developer.networking.vpn.api"), 0);
    if (!v15)
    {
      v15 = SecTaskCopyValueForEntitlement(v4, CFSTR("com.apple.developer.networking.networkextension"), 0);
      if (!v15)
      {
        v15 = SecTaskCopyValueForEntitlement(v4, CFSTR("com.apple.private.AuthorizationServices"), 0);
        if (!v15)
        {
LABEL_9:
          v16 = SecTaskCopyValueForEntitlement(v4, CFSTR("com.apple.private.neconfiguration-write-access"), 0);
          TypeID = CFBooleanGetTypeID();
          if (v16)
          {
            if (CFGetTypeID(v16) == TypeID && CFBooleanGetValue((CFBooleanRef)v16))
              a1[23] = 1;
            CFRelease(v16);
          }
          CFRelease(v4);
          goto LABEL_15;
        }
        v14 = a1 + 22;
      }
    }
    *v14 = 1;
    CFRelease(v15);
    goto LABEL_9;
  }
LABEL_15:
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = v18;
  if (!*((_QWORD *)a1 + 17))
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("no-app-filter"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("preferred-languages"));
  v21 = [NEHelper alloc];
  v23 = -[NEHelper initWithDelegateClassID:queue:additionalProperties:](v21, "initWithDelegateClassID:queue:additionalProperties:", 6, objc_getProperty(a1, v22, 40, 1), v19);
  objc_setProperty_atomic(a1, v24, v23, 112);

LABEL_20:
  return a1;
}

- (id)initForAllUsers
{
  return -[NEConfigurationManager initWithUserUUID:]((char *)self, 0);
}

void __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke(uint64_t a1)
{
  const char *v2;
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint32_t state;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  BOOL v39;
  void *v40;
  int v41;
  const char *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  SEL v56;
  id v57;
  const char *v58;
  char *v59;
  void *v60;
  char *v61;
  uint64_t v62;
  xpc_object_t v63;
  void *v64;
  NSObject *v65;
  void *v66;
  BOOL v67;
  const char *v68;
  void *v69;
  void *v70;
  void *v71;
  SEL v72;
  SEL v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t j;
  char *v80;
  NSObject *v81;
  char *v82;
  SEL v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  BOOL v90;
  void *v91;
  BOOL v92;
  const char *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  char v99;
  void *v100;
  const char *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  id v105;
  const char *v106;
  void *v107;
  void *v108;
  void *v109;
  SEL v110;
  void *v111;
  SEL v112;
  NSObject *v113;
  SEL v114;
  void *v115;
  id v116;
  void *v117;
  NSObject *v118;
  uint64_t v119;
  char *v120;
  id newValue;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  id obj;
  id obja;
  id v128;
  id v129;
  id self;
  _QWORD v131[4];
  void *v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _OWORD v138[4];
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  id v143;
  _BYTE v144[128];
  const __CFString *v145;
  void *v146;
  uint64_t state64[16];
  _QWORD v148[2];
  _QWORD v149[2];
  uint8_t buf[4];
  const char *v151;
  __int16 v152;
  _BYTE v153[10];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  -[NEConfigurationManager registerForChangeNotifications](*(id *)(a1 + 32));
  v122 = a1;
  v3 = *(void **)(a1 + 32);
  if (!v3)
    goto LABEL_84;
  v4 = objc_getProperty(v3, v2, 56, 1);
  if (!v4)
    goto LABEL_25;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = *(_DWORD *)(v6 + 28);

    if (v7 == -1)
      goto LABEL_25;
  }
  else
  {

  }
  state64[0] = 0;
  v8 = *(_QWORD *)(v122 + 32);
  if (v8)
    v9 = *(_DWORD *)(v8 + 28);
  else
    v9 = 0;
  state = notify_get_state(v9, state64);
  v11 = state;
  if (state == 9)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(v122 + 32);
      if (v17)
        LODWORD(v17) = *(_DWORD *)(v17 + 28);
      *(_DWORD *)buf = 136315394;
      v151 = "com.apple.neconfigurationchanged";
      v152 = 1024;
      *(_DWORD *)v153 = v17;
      v16 = "Failed to get the current %s (token %u) notification state because the server is not found";
      goto LABEL_22;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (state == 1)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(v122 + 32);
      if (v15)
        LODWORD(v15) = *(_DWORD *)(v15 + 28);
      *(_DWORD *)buf = 136315394;
      v151 = "com.apple.neconfigurationchanged";
      v152 = 1024;
      *(_DWORD *)v153 = v15;
      v16 = "Failed to get the current %s (token %u) notification state because the notification does not exist";
LABEL_22:
      _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (state)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v119 = *(_QWORD *)(v122 + 32);
      if (v119)
        LODWORD(v119) = *(_DWORD *)(v119 + 28);
      *(_DWORD *)buf = 136315650;
      v151 = "com.apple.neconfigurationchanged";
      v152 = 1024;
      *(_DWORD *)v153 = v119;
      *(_WORD *)&v153[4] = 1024;
      *(_DWORD *)&v153[6] = v11;
      _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, "Failed to get the current %s (token %u) notification state: %u", buf, 0x18u);
    }
    goto LABEL_24;
  }
  v12 = state64[0] & 0x1FFFFFFFFFFFFFLL;
  v13 = *(_QWORD *)(v122 + 32);
  if (v13)
    v13 = *(_QWORD *)(v13 + 104);
  if (v13 == v12)
  {
    (*(void (**)(void))(*(_QWORD *)(v122 + 40) + 16))();
    return;
  }
  ne_log_obj();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = *(_QWORD *)(v122 + 32);
    if (v48)
      v48 = *(_QWORD *)(v48 + 104);
    *(_DWORD *)buf = 134218240;
    v151 = (const char *)v48;
    v152 = 2048;
    *(_QWORD *)v153 = v12;
    _os_log_impl(&dword_19BD16000, v47, OS_LOG_TYPE_INFO, "current generation (%lld) does not equal posted generation (%llu), fetching a new index", buf, 0x16u);
  }

  if (!v12)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v49 = *(_QWORD *)(v122 + 32);
    if (v49)
      LODWORD(v49) = *(_DWORD *)(v49 + 28);
    *(_DWORD *)buf = 134218240;
    v151 = (const char *)state64[0];
    v152 = 1024;
    *(_DWORD *)v153 = v49;
    v16 = "current generation is 0, notification state == %llu, token == %u";
    goto LABEL_22;
  }
LABEL_25:
  v18 = *(void **)(v122 + 32);
  if (!v18)
    goto LABEL_84;
  objc_setProperty_atomic(v18, v5, 0, 56);
  v19 = *(_QWORD *)(v122 + 32);
  if (!v19 || (*(_BYTE *)(v19 + 21) & 1) != 0)
    goto LABEL_84;
  self = *(id *)(v122 + 32);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isReadableFileAtPath:", CFSTR("/Library/Preferences/com.apple.networkextension.plist"));

  if (v21)
  {
    v143 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", CFSTR("/Library/Preferences/com.apple.networkextension.plist"), 0, &v143);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v128 = v143;
    *((_BYTE *)self + 20) = 1;
    if (obj)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", obj, 0);
      objc_msgSend(v22, "setClass:forClassName:", objc_opt_class(), CFSTR("NEVPNAppRule"));
      objc_msgSend(v22, "setClass:forClassName:", objc_opt_class(), CFSTR("NEVPNProtocolPlugin"));
      v123 = objc_msgSend(v22, "decodeInt64ForKey:", CFSTR("Generation"));
      v125 = objc_msgSend(v22, "decodeInt64ForKey:", CFSTR("Version"));
      v23 = (void *)MEMORY[0x1E0C99E60];
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      v26 = objc_opt_class();
      v27 = objc_opt_class();
      objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, objc_opt_class(), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "decodeObjectOfClasses:forKey:", v28, CFSTR("Index"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29 || v125)
      {
        v46 = v29;
LABEL_73:
        if (v125)
        {
          objc_msgSend(v22, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCPreferencesSignature2"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v50 = (void *)MEMORY[0x1E0C99E60];
          v51 = objc_opt_class();
          v52 = objc_opt_class();
          objc_msgSend(v50, "setWithObjects:", v51, v52, objc_opt_class(), 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "decodeObjectOfClasses:forKey:", v53, CFSTR("SCPreferencesSignature"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          memset(v138, 0, sizeof(v138));
          v55 = v54;
          if (objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", v138, state64, 16))
          {
            objc_msgSend(v55, "objectForKeyedSubscript:", **((_QWORD **)&v138[0] + 1));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v45 = 0;
          }

        }
        goto LABEL_80;
      }
      v141 = 0u;
      v142 = 0u;
      v139 = 0u;
      v140 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v139, buf, 16);
      if (v31)
      {
        v32 = 0;
        v33 = 0;
        v34 = *(_QWORD *)v140;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v140 != v34)
              objc_enumerationMutation(v30);
            v36 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * i);
            if (!v32)
            {
              objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * i));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v32, "allKeys");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v33)
              v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, v36);

          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v139, buf, 16);
        }
        while (v31);

        if (!v32 || !v33)
        {
          v38 = (uint64_t)v30;
          goto LABEL_72;
        }
        v148[0] = CFSTR("ConfigurationProperties");
        v148[1] = CFSTR("UserMap");
        v149[0] = v32;
        v149[1] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 2);
        v38 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
        v32 = 0;
        v38 = (uint64_t)v30;
      }

LABEL_72:
      v46 = (void *)v38;
      goto LABEL_73;
    }
    ne_log_obj();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v151 = (const char *)self;
      v152 = 2112;
      *(_QWORD *)v153 = CFSTR("/Library/Preferences/com.apple.networkextension.plist");
      _os_log_error_impl(&dword_19BD16000, v43, OS_LOG_TYPE_ERROR, "%@ Failed to read data from %@", buf, 0x16u);
    }

    -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 1, 0);
    v44 = objc_claimAutoreleasedReturnValue();

    v22 = 0;
    v128 = (id)v44;

LABEL_57:
    v45 = 0;
    v46 = 0;
    goto LABEL_81;
  }
  v39 = geteuid() == 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "fileExistsAtPath:", CFSTR("/Library/Preferences/com.apple.networkextension.plist"));

  if (!v39)
  {
    if ((v41 & 1) != 0)
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 10, 0);
    else
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 18, 0);
    v128 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v41)
  {
    -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 19, 0);
    v128 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:
    v22 = 0;
    goto LABEL_57;
  }
  v22 = 0;
  v123 = 0;
  v45 = 0;
  v46 = 0;
  v128 = 0;
LABEL_80:
  objc_setProperty_atomic(self, v42, v22, 96);
  *((_QWORD *)self + 13) = v123;
  objc_setProperty_atomic(self, v56, v45, 120);
LABEL_81:
  v57 = objc_retainAutorelease(v128);
  newValue = v46;

  v59 = (char *)v57;
  v60 = self;
  if ((*((_BYTE *)self + 20) & 1) != 0)
  {
    v120 = v59;
    if (v59)
    {
      ne_log_obj();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v151 = v120;
        _os_log_error_impl(&dword_19BD16000, v65, OS_LOG_TYPE_ERROR, "Failed to read the index: %@", buf, 0xCu);
      }

      v60 = self;
    }
    if (!newValue)
    {
      ne_log_obj();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v151 = (const char *)self;
        _os_log_impl(&dword_19BD16000, v113, OS_LOG_TYPE_DEFAULT, "%@ No configurations exist", buf, 0xCu);
      }

      objc_setProperty_atomic(self, v114, 0, 96);
      goto LABEL_135;
    }
    objc_setProperty_atomic(v60, v58, newValue, 56);
    objc_msgSend(self, "userUUID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v66 == 0;

    if (!v67)
    {
      v145 = CFSTR("user-uuid");
      objc_msgSend(self, "userUUID");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = v69;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEConfigurationManager filterIndexWithFilter:](self, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(self, v72, v71, 56);

    }
    -[NEConfigurationManager notifyChanges](self, v68);
    if (objc_getProperty(self, v73, 80, 1))
    {
      objc_msgSend(objc_getProperty(self, v74, 80, 1), "allKeys");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](self, v75);

    }
    if (objc_getProperty(self, v74, 56, 1))
    {
      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
      objc_msgSend(objc_getProperty(self, v76, 56, 1), "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
      obja = (id)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v134, v144, 16);
      if (v77)
      {
        v124 = 0;
        v78 = 0;
        v129 = *(id *)v135;
        while (1)
        {
          for (j = 0; j != v77; ++j)
          {
            if (*(id *)v135 != v129)
              objc_enumerationMutation(obja);
            v80 = *(char **)(*((_QWORD *)&v134 + 1) + 8 * j);
            ne_log_obj();
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v151 = v80;
              _os_log_impl(&dword_19BD16000, v81, OS_LOG_TYPE_INFO, "Decoding %@", buf, 0xCu);
            }

            v82 = v80;
            v84 = objc_getProperty(self, v83, 96, 1);
            v85 = objc_opt_class();
            objc_msgSend(v82, "UUIDString");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "decodeObjectOfClass:forKey:", v85, v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            if (v87)
            {
              objc_msgSend(v87, "VPN");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "protocol");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = objc_msgSend(v89, "type") == 3;

              if (!v90)
              {
                -[NEConfigurationManager didLoadConfiguration:](self, v87);
                objc_msgSend(v87, "applicationIdentifier");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v92 = v91 == 0;

                if (!v92)
                {
                  objc_msgSend(objc_getProperty(self, v93, 56, 1), "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "objectForKeyedSubscript:", v82);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("ApplicationID"));
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!isa_nsstring(v96))
                    goto LABEL_110;
                  objc_msgSend(v87, "applicationIdentifier");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("ApplicationID"));
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  v99 = objc_msgSend(v97, "isEqualToString:", v98);

                  if ((v99 & 1) == 0)
                  {
                    v96 = (void *)objc_msgSend(v95, "mutableCopy");
                    objc_msgSend(v87, "applicationIdentifier");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "setObject:forKeyedSubscript:", v100, CFSTR("ApplicationID"));

                    if (!v124)
                    {
                      objc_msgSend(objc_getProperty(self, v101, 56, 1), "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      v124 = (void *)objc_msgSend(v102, "mutableCopy");

                    }
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v96);
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v124, "setObject:forKeyedSubscript:", v103, v82);

LABEL_110:
                  }

                }
              }
            }
            else
            {
              ne_log_obj();
              v104 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v151 = v82;
                _os_log_fault_impl(&dword_19BD16000, v104, OS_LOG_TYPE_FAULT, "Failed to decode %@", buf, 0xCu);
              }

              v105 = v78;
              if (!v78)
                v105 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v78 = v105;
              objc_msgSend(v105, "addObject:", v82);
              v87 = 0;
            }

          }
          v77 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v134, v144, 16);
          if (!v77)
          {

            if (v124)
            {
              v107 = (void *)objc_msgSend(objc_getProperty(self, v106, 56, 1), "mutableCopy");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v124);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "setObject:forKeyedSubscript:", v108, CFSTR("ConfigurationProperties"));

              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v107);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_setProperty_atomic(self, v110, v109, 56);

            }
            v111 = self;
            if (v78)
            {
              obja = (id)objc_msgSend(self, "copyCurrentIndexWithConfigurationIDsExpunged:", v78);
              objc_setProperty_atomic(self, v112, obja, 56);
              goto LABEL_127;
            }
            goto LABEL_128;
          }
        }
      }
      v124 = 0;
      v78 = 0;
LABEL_127:

      v111 = self;
LABEL_128:
      objc_msgSend(objc_getProperty(v111, v106, 56, 1), "objectForKeyedSubscript:", CFSTR("AppGroupMap"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)self + 4);
      if (v115)
        v116 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v115);
      else
        v116 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v117 = v116;
      -[NEConfigurationManager setAppGroupMap:]((uint64_t)self, v116);

      objc_msgSend(self, "setAppGroupsChanged:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)self + 4);

    }
    objc_setProperty_atomic(self, v76, 0, 96);
    ne_log_obj();
    v118 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v118, OS_LOG_TYPE_DEFAULT, "Reload from disk complete", buf, 2u);
    }

    goto LABEL_135;
  }
  v61 = v59;

  v62 = *(_QWORD *)(v122 + 32);
  if (!v62 || (*(_BYTE *)(v62 + 23) & 1) == 0)
  {
LABEL_84:
    v63 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v63, "config-operation", 1);
    v131[0] = MEMORY[0x1E0C809B0];
    v131[1] = 3221225472;
    v131[2] = __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke_88;
    v131[3] = &unk_1E3CC08A0;
    v64 = *(void **)(v122 + 40);
    v132 = *(void **)(v122 + 32);
    v133 = v64;
    -[NEConfigurationManager sendRequest:responseHandler:](v132, v63, v131);

    return;
  }
LABEL_135:
  (*(void (**)(void))(*(_QWORD *)(v122 + 40) + 16))();
}

void __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  const char *v3;
  id v4;
  id v5;
  const char *v6;
  id v7;
  id Property;
  void *v9;
  NSObject *v10;
  id v11;
  _BYTE *v12;
  void *v13;
  void *v14;
  xpc_object_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  xpc_object_t v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4 || (v11 = a1[4]) == 0 || !objc_getProperty(v11, v3, 56, 1))
  {
    v5 = a1[4];
    if (v5 && objc_getProperty(v5, v3, 80, 1))
    {
      v7 = a1[4];
      if (v7)
        Property = objc_getProperty(a1[4], v6, 80, 1);
      else
        Property = 0;
      objc_msgSend(Property, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](v7, v9);

    }
    if (v4)
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v21 = a1[4];
        *(_DWORD *)buf = 138412546;
        v25 = v21;
        v26 = 2112;
        v27 = v4;
        _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "%@ Failed to load configurations: %@", buf, 0x16u);
      }

    }
    goto LABEL_11;
  }
  v12 = a1[4];
  if (!v12)
  {

LABEL_11:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_12;
  }
  if ((v12[20] & 1) != 0)
    goto LABEL_11;
  if ((v12[23] & 1) != 0)
    goto LABEL_11;
  v13 = -[NEConfigurationManager copyChangedConfigurationIDs:](v12, a1[5]);
  if (!v13)
    goto LABEL_11;
  v14 = v13;
  v15 = xpc_dictionary_create(0, 0, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  ne_log_obj();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_DEFAULT, "Sending load command to nehelper", buf, 2u);
  }

  objc_msgSend(v16, "encodeObject:forKey:", v14, CFSTR("config-identifiers"));
  objc_msgSend(v16, "finishEncoding");
  objc_msgSend(v16, "encodedData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = xpc_data_create((const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));
  -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](a1[4], v14);
  xpc_dictionary_set_int64(v15, "config-operation", 2);
  xpc_dictionary_set_value(v15, "config-ids-data", v19);
  v20 = a1[4];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke_148;
  v22[3] = &unk_1E3CC08A0;
  v22[4] = v20;
  v23 = a1[6];
  -[NEConfigurationManager sendRequest:responseHandler:](v20, v15, v22);

LABEL_12:
}

void __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  const char *v6;
  id Property;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (!v5 || !objc_getProperty(v5, v3, 88, 1))
    goto LABEL_7;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v6, 88, 1);
  objc_msgSend(Property, "allValues");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v8);

  }
  else
  {
LABEL_7:
    v10 = 0;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke_2;
  v16[3] = &unk_1E3CC3A30;
  v13 = *(id *)(a1 + 48);
  v18 = v4;
  v19 = v13;
  v17 = v10;
  v14 = v4;
  v15 = v10;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v11, v12, v16);

}

- (void)registerForChangeNotifications
{
  SEL v2;
  NSObject *v3;
  uint32_t v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;
  id location;
  int out_token;
  uint8_t buf[4];
  uint32_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (val && *((_DWORD *)val + 7) == -1)
  {
    out_token = -1;
    objc_initWeak(&location, val);
    v3 = objc_getProperty(val, v2, 40, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __56__NEConfigurationManager_registerForChangeNotifications__block_invoke;
    handler[3] = &unk_1E3CC3980;
    objc_copyWeak(&v7, &location);
    v4 = notify_register_dispatch("com.apple.neconfigurationchanged", &out_token, v3, handler);

    if (v4)
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v11 = v4;
        _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "notify_register_dispatch failed: %d", buf, 8u);
      }

    }
    else
    {
      *((_DWORD *)val + 7) = out_token;
    }
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)executeCallbackOnQueue:(void *)a3 callback:
{
  void (**v5)(_QWORD);
  void *v6;
  NSObject *queue;

  queue = a2;
  v5 = a3;
  v6 = v5;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24))
      v5[2](v5);
    else
      dispatch_async(queue, v5);
  }

}

- (uint64_t)configurationHasChanged:(void *)a1
{
  const char *v3;
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  _BOOL4 v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_22;
  }
  if (objc_getProperty(a1, v3, 56, 1))
  {
    objc_msgSend(objc_getProperty(a1, v5, 56, 1), "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Signature"));
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (objc_getProperty(a1, v5, 80, 1))
  {
    objc_msgSend(objc_getProperty(a1, v9, 80, 1), "objectForKeyedSubscript:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (!(v8 | v10))
    goto LABEL_11;
  if (!v8)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v4;
      v13 = "Configuration %@ was removed";
LABEL_19:
      _os_log_impl(&dword_19BD16000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v16, 0xCu);
    }
LABEL_20:

    v11 = 1;
    goto LABEL_21;
  }
  if ((objc_msgSend((id)v8, "isEqualToData:", v10) & 1) == 0)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v14)
      {
        v16 = 138412290;
        v17 = v4;
        v13 = "Configuration %@ has changed";
        goto LABEL_19;
      }
    }
    else if (v14)
    {
      v16 = 138412290;
      v17 = v4;
      v13 = "Configuration %@ has not been loaded yet";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
LABEL_11:
  v11 = 0;
LABEL_21:

LABEL_22:
  return v11;
}

- (void)didLoadConfiguration:(void *)a1
{
  id v3;
  SEL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  SEL v13;
  const char *v14;
  void *v15;
  SEL v16;
  void *v17;
  SEL v18;
  id v19;
  void *v20;
  SEL v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a2;
    objc_msgSend(objc_getProperty(a1, v4, 56, 1), "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Signature"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;
    v9 = v7;
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v12;
        _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEFAULT, "Adding %@ to the loaded configurations", buf, 0xCu);

      }
      if (!objc_getProperty(a1, v13, 80, 1))
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
        objc_setProperty_atomic(a1, v16, v15, 80);

        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
        objc_setProperty_atomic(a1, v18, v17, 88);

      }
      v19 = objc_getProperty(a1, v14, 80, 1);
      objc_msgSend(v8, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v9, v20);

      v22 = objc_getProperty(a1, v21, 88, 1);
      objc_msgSend(v8, "identifier");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, v11);
    }
    else
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        goto LABEL_10;
      objc_msgSend(v8, "identifier");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_fault_impl(&dword_19BD16000, v11, OS_LOG_TYPE_FAULT, "Missing a signature for %@", buf, 0xCu);
    }

LABEL_10:
  }
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAppGroupsChanged:(BOOL)a3
{
  self->_appGroupsChanged = a3;
}

- (void)setAppGroupMap:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 128), a2);
}

- (void)notifyChanges
{
  id v3;
  const char *v4;
  void *v5;
  id Property;
  const char *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  if (a1)
  {
    v3 = objc_getProperty(a1, a2, 64, 1);
    if (v3)
    {
      v5 = v3;
      Property = objc_getProperty(a1, v4, 72, 1);

      if (Property)
      {
        v8 = -[NEConfigurationManager copyChangedConfigurationIDs:](a1, 0);
        if (v8)
        {
          v9 = objc_getProperty(a1, v7, 40, 1);
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __39__NEConfigurationManager_notifyChanges__block_invoke;
          v10[3] = &unk_1E3CC2F98;
          v10[4] = a1;
          v11 = v8;
          dispatch_async(v9, v10);

        }
      }
    }
  }
}

- (void)copyChangedConfigurationIDs:(void *)a1
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = v4;
    if (v3)
    {
      objc_msgSend(v4, "addObjectsFromArray:", v3);
    }
    else
    {
      if (objc_getProperty(a1, v5, 56, 1))
      {
        objc_msgSend(objc_getProperty(a1, v7, 56, 1), "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v9);

      }
      if (objc_getProperty(a1, v7, 80, 1))
      {
        objc_msgSend(objc_getProperty(a1, v10, 80, 1), "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v11);

      }
    }
    if (v6)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (-[NEConfigurationManager configurationHasChanged:](a1, v18))
            {
              if (!v15)
              {
                v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
                v15 = (void *)objc_msgSend(v19, "initWithCapacity:", 0, (_QWORD)v21);
              }
              objc_msgSend(v15, "addObject:", v18, (_QWORD)v21);
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v14);

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v15);
          a1 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

          goto LABEL_26;
        }
LABEL_24:
        a1 = 0;
        goto LABEL_25;
      }

    }
    v15 = 0;
    goto LABEL_24;
  }
LABEL_26:

  return a1;
}

uint64_t __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __39__NEConfigurationManager_notifyChanges__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__NEConfigurationManager_setChangedQueue_andHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, *(id *)(a1 + 40), 64);
    v5 = *(void **)(a1 + 32);
    if (v5)
      objc_setProperty_atomic_copy(v5, v4, *(id *)(a1 + 48), 72);
  }
}

void __39__NEConfigurationManager_notifyChanges__block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  id Property;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = objc_getProperty(v3, a2, 64, 1);
    if (v4)
    {
      v15 = v4;
      v6 = *(void **)(a1 + 32);
      if (v6)
      {
        Property = objc_getProperty(v6, v5, 72, 1);

        if (Property)
        {
          v9 = *(id *)(a1 + 32);
          if (v9)
            v9 = objc_getProperty(v9, v8, 72, 1);
          v11 = v9;
          v12 = *(void **)(a1 + 32);
          if (v12)
            v13 = objc_getProperty(v12, v10, 64, 1);
          else
            v13 = 0;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __39__NEConfigurationManager_notifyChanges__block_invoke_2;
          block[3] = &unk_1E3CC46A8;
          v18 = v11;
          v17 = *(id *)(a1 + 40);
          v14 = v11;
          dispatch_async(v13, block);

        }
      }
      else
      {

      }
    }
  }
}

- (NEConfigurationManager)init
{
  uid_t v3;
  void *v4;
  NEConfigurationManager *v5;

  v3 = geteuid();
  NECopyUserUUIDSimple(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[NEConfigurationManager initWithUserUUID:]((char *)self, v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NEConfigurationManager)initWithPluginType:(id)a3
{
  id v5;
  NEConfigurationManager *v6;
  NEConfigurationManager *v7;

  v5 = a3;
  v6 = -[NEConfigurationManager init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pluginType, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)initSynchronous
{
  NEConfigurationManager *v2;
  const char *v3;
  NEConfigurationManager *v4;

  v2 = -[NEConfigurationManager init](self, "init");
  v4 = v2;
  if (v2)
  {
    v2->_isSynchronous = 1;
    objc_msgSend(objc_getProperty(v2, v3, 112, 1), "setIsSynchronous:", 1);
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)dealloc
{
  NEConfigurationManager *v2;
  objc_super v3;

  v2 = self;
  if (!self || (LODWORD(self) = self->_changedNotifyToken, (self & 0x80000000) == 0))
    notify_cancel((int)self);
  v3.receiver = v2;
  v3.super_class = (Class)NEConfigurationManager;
  -[NEConfigurationManager dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (void)setIncomingMessageHandler:(id)a3
{
  const char *v4;
  id Property;
  id v6;

  v6 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 112, 1);
  else
    Property = 0;
  objc_msgSend(Property, "setIncomingMessageHandler:", v6);

}

- (id)incomingMessageHandler
{
  if (self)
    self = (NEConfigurationManager *)objc_getProperty(self, a2, 112, 1);
  return -[NEConfigurationManager incomingMessageHandler](self, "incomingMessageHandler");
}

- (void)postGeneration
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__NEConfigurationManager_postGeneration__block_invoke;
  v2[3] = &unk_1E3CC45C8;
  v2[4] = self;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, 0, v2);
}

- (id)copyCurrentIndexWithConfigurationIDsExpunged:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  NEConfigurationManager *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
  {
    Property = objc_getProperty(self, v4, 56, 1);
    v7 = self;
  }
  else
  {
    v7 = 0;
    Property = 0;
  }
  -[NEConfigurationManager makeMutableCopyOfIndex:](v7, Property);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v47;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v12);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeObjectForKey:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserMap"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v33 = v16;
  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v43;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v33);
        v37 = v17;
        v18 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v17);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v19 = obj;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v39;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v39 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v23);
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserMap"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v18);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "removeObject:", v24);

              ++v23;
            }
            while (v21 != v23);
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          }
          while (v21);
        }

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserMap"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        if (!v29)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserMap"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "removeObjectForKey:", v18);

        }
        v17 = v37 + 1;
      }
      while (v37 + 1 != v35);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v35);
  }

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v8);
  return v31;
}

- (void)saveConfigurationToDisk:(id)a3 currentSignature:(id)a4 userUUID:(id)a5 isUpgrade:(BOOL)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *outerQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (self)
    outerQueue = self->_outerQueue;
  else
    outerQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E3CBFC68;
  block[4] = self;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v31 = a6;
  v29 = v17;
  v30 = v18;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  dispatch_async(outerQueue, block);

}

- (void)removeConfigurationFromDisk:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *outerQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
    outerQueue = self->_outerQueue;
  else
    outerQueue = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke;
  v15[3] = &unk_1E3CC3198;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(outerQueue, v15);

}

- (void)syncConfigurationsWithSC:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *outerQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && MEMORY[0x1A1ACFDA4](v8) == MEMORY[0x1E0C812C8] && xpc_array_get_count(v8))
  {
    if (self)
      outerQueue = self->_outerQueue;
    else
      outerQueue = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_2;
    v15[3] = &unk_1E3CC3198;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    v18 = v10;
    v14 = v10;
    dispatch_async(outerQueue, v15);

    v12 = v16;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E3CC4720;
    v20 = v10;
    v11 = v10;
    dispatch_async(v9, block);
    v12 = v20;
  }

}

- (void)loadIndexWithFilter:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke;
  v14[3] = &unk_1E3CBFCB8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](self, v14);

}

- (void)loadConfigurations:(id)a3 withFilter:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke;
  v18[3] = &unk_1E3CC3CE0;
  v18[4] = self;
  v19 = v11;
  v20 = v10;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, v16, v18);

}

- (void)loadConfigurationWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_INFO, "Loading configuration with identifier %@", buf, 0xCu);
    }

    v24 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke;
    v20[3] = &unk_1E3CBFCB8;
    v20[4] = self;
    v21 = v8;
    v22 = v9;
    v23 = v10;
    v13 = v10;
    -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, v12, v20);

    v14 = v21;
  }
  else
  {
    -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_2;
    v17[3] = &unk_1E3CC46A8;
    v18 = v15;
    v19 = v10;
    v16 = v10;
    v12 = v15;
    -[NEConfigurationManager executeCallbackOnQueue:callback:]((uint64_t)self, v9, v17);

    v14 = v19;
  }

}

- (void)loadConfigurationAndUserWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_INFO, "Loading configuration with identifier %@", buf, 0xCu);
    }

    v24 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke;
    v20[3] = &unk_1E3CBFCB8;
    v20[4] = self;
    v21 = v8;
    v22 = v9;
    v23 = v10;
    v13 = v10;
    -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, v12, v20);

    v14 = v21;
  }
  else
  {
    -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_2;
    v17[3] = &unk_1E3CC46A8;
    v18 = v15;
    v19 = v10;
    v16 = v10;
    v12 = v15;
    -[NEConfigurationManager executeCallbackOnQueue:callback:]((uint64_t)self, v9, v17);

    v14 = v19;
  }

}

- (void)saveConfiguration:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  id Property;
  id v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  NEConfigurationManager *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const char *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  const char *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  id v63;
  uint64_t v64;
  NEConfigurationManager *v65;
  NEConfigurationManager *v66;
  void *v67;
  void *v68;
  NEConfigurationManager *v69;
  NEConfigurationManager *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[5];
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  _QWORD v84[5];
  id v85;
  const char *v86;
  _QWORD v87[4];
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  id v96;
  uint8_t v97[128];
  uint8_t buf[4];
  NEConfigurationManager *v99;
  __int16 v100;
  id v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  if ((objc_msgSend(v9, "checkValidityAndCollectErrors:", v12) & 1) == 0)
  {
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 2, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    ne_log_obj();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "name");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v99 = self;
      v100 = 2112;
      v101 = v60;
      v102 = 2112;
      v103 = v50;
      _os_log_error_impl(&dword_19BD16000, v51, OS_LOG_TYPE_ERROR, "%@ Failed to save configuration %@ because it is invalid: %@", buf, 0x20u);

    }
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke;
    v94[3] = &unk_1E3CC46A8;
    v95 = v50;
    v96 = v11;
    v52 = v50;
    -[NEConfigurationManager executeCallbackOnQueue:callback:]((uint64_t)self, v10, v94);

    goto LABEL_52;
  }
  objc_msgSend(v9, "externalIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    objc_msgSend(v9, "contentFilter");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v58)
    {
      objc_msgSend(v9, "dnsProxy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_44;
    }
    objc_msgSend(v9, "payloadInfo");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {

      if (!v59)
        goto LABEL_44;
    }
    else
    {

      if (!v59)
        goto LABEL_44;
    }
  }
  if (self)
    Property = objc_getProperty(self, v14, 88, 1);
  else
    Property = 0;
  objc_msgSend(Property, "allKeys");
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
  if (!v76)
  {
LABEL_43:

LABEL_44:
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_165;
    v77[3] = &unk_1E3CBFCB8;
    v77[4] = self;
    v78 = v9;
    v79 = v10;
    v80 = v11;
    -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](self, v77);

    goto LABEL_52;
  }
  v71 = v12;
  v72 = v11;
  v73 = v10;
  v18 = 0;
  v75 = *(_QWORD *)v91;
  v74 = v9;
LABEL_8:
  v19 = 0;
  while (1)
  {
    v20 = v18;
    if (*(_QWORD *)v91 != v75)
      objc_enumerationMutation(v16);
    v21 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v19);
    if (self)
      v22 = objc_getProperty(self, v17, 88, 1);
    else
      v22 = 0;
    objc_msgSend(v22, "objectForKeyedSubscript:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_27;
    v23 = v16;
    v24 = self;
    objc_msgSend(v9, "contentFilter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v18, "contentFilter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    objc_msgSend(v9, "dnsProxy");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      break;
LABEL_22:
    objc_msgSend(v18, "payloadInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "isSetAside") & 1) == 0)
    {
      objc_msgSend(v18, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v31, "isEqual:", v32))
      {
        objc_msgSend(v18, "externalIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "externalIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "isEqual:", v34);

        v9 = v74;
        self = v24;
        v16 = v23;
        if (v35)
        {
          ne_log_obj();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v65 = (NEConfigurationManager *)objc_opt_class();
            v66 = v65;
            objc_msgSend(v18, "externalIdentifier");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "name");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v99 = v65;
            v100 = 2112;
            v101 = v67;
            v102 = 2112;
            v103 = v68;
            _os_log_error_impl(&dword_19BD16000, v53, OS_LOG_TYPE_ERROR, "%@ saveConfiguration: failed to save - perApp UUID %@ already assigned to another configuration - %@", buf, 0x20u);

            v9 = v74;
          }

          -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v24, 2, CFSTR("Duplicate perApp UUID"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v81[0] = MEMORY[0x1E0C809B0];
          v81[1] = 3221225472;
          v81[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_164;
          v81[3] = &unk_1E3CC46A8;
          v11 = v72;
          v82 = v54;
          v83 = v72;
          v55 = v54;
          v56 = (uint64_t)v24;
          v10 = v73;
          -[NEConfigurationManager executeCallbackOnQueue:callback:](v56, v73, v81);

          v57 = v83;
          goto LABEL_51;
        }
        goto LABEL_27;
      }

    }
    self = v24;
    v16 = v23;
LABEL_27:
    if (v76 == ++v19)
    {
      v48 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
      v76 = v48;
      if (!v48)
      {

        v11 = v72;
        v10 = v73;
        v12 = v71;
        goto LABEL_43;
      }
      goto LABEL_8;
    }
  }
  objc_msgSend(v18, "dnsProxy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v28 = v26;

  if (!v28)
    goto LABEL_22;
  objc_msgSend(v18, "externalIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 || (objc_msgSend(v9, "externalIdentifier"), (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_22;
  }
  objc_msgSend(v18, "identifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "isEqual:", v37) & 1) != 0)
  {

    goto LABEL_22;
  }
  objc_msgSend(v18, "payloadInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
    goto LABEL_22;
  objc_msgSend(v9, "contentFilter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    v40 = "Content Filter";
  else
    v40 = "DNS proxy";

  objc_msgSend(v18, "payloadInfo");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "profileIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payloadInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "profileIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v42, "isEqualToString:", v44);

  if ((v45 & 1) != 0)
  {
    if (v24)
      v47 = objc_getProperty(v24, v46, 40, 1);
    else
      v47 = 0;
    v9 = v74;
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2;
    v84[3] = &unk_1E3CBFD08;
    v84[4] = v24;
    v86 = v40;
    v85 = v18;
    -[NEConfigurationManager removeConfiguration:withCompletionQueue:handler:](v24, "removeConfiguration:withCompletionQueue:handler:", v85, v47, v84);

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("multiple system-wide %s configurations are not allowed"), v40);
  v55 = (id)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v61 = objc_claimAutoreleasedReturnValue();
  v16 = v23;
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    v69 = (NEConfigurationManager *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v99 = v69;
    v100 = 2112;
    v101 = v55;
    v70 = v69;
    _os_log_error_impl(&dword_19BD16000, v61, OS_LOG_TYPE_ERROR, "%@ saveConfiguration: %@", buf, 0x16u);

  }
  -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v24, 10, v55);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_161;
  v87[3] = &unk_1E3CC46A8;
  v11 = v72;
  v63 = v72;
  v88 = v62;
  v89 = v63;
  v57 = v62;
  v64 = (uint64_t)v24;
  v10 = v73;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v64, v73, v87);

  v9 = v74;
LABEL_51:
  v12 = v71;

LABEL_52:
}

- (void)removeConfiguration:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke;
  v14[3] = &unk_1E3CBFCB8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](self, v14);

}

- (void)handleFileRemovedWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 40, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__NEConfigurationManager_handleFileRemovedWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E3CC3A30;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_async(Property, block);

}

- (void)handleApplicationsRemoved:(id)a3 completionQueue:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *outerQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (self)
    outerQueue = self->_outerQueue;
  else
    outerQueue = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E3CC3198;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v11;
  dispatch_async(outerQueue, v16);

}

- (void)copyIdentities:(id)a3 fromDomain:(int64_t)a4 withCompletionQueue:(id)a5 handler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  xpc_object_t v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[5];
  NSObject *v20;
  id v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (a4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_2;
    block[3] = &unk_1E3CC46A8;
    v18 = v12;
    v17 = v10;
    dispatch_async(v11, block);

    v14 = v18;
  }
  else
  {
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v14, "config-operation", 5);
    if (v10)
    {
      v15 = objc_retainAutorelease(v10);
      xpc_dictionary_set_data(v14, "identity-reference", (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke;
    v19[3] = &unk_1E3CBFD58;
    v19[4] = self;
    v20 = v11;
    v21 = v13;
    -[NEConfigurationManager sendRequest:responseHandler:](self, v14, v19);

  }
}

- (void)triggerLocalAuthenticationForConfigurationWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uuid_t uu;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = xpc_dictionary_create(0, 0, 0);
  memset(uu, 0, sizeof(uu));
  xpc_dictionary_set_int64(v11, "config-operation", 7);
  uuid_clear(uu);
  objc_msgSend(v10, "getUUIDBytes:", uu);

  xpc_dictionary_set_uuid(v11, "config-identifier", uu);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__NEConfigurationManager_triggerLocalAuthenticationForConfigurationWithID_withCompletionQueue_handler___block_invoke;
  v14[3] = &unk_1E3CC08A0;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v11, v14);

}

- (void)showLocalNetworkAlertForApp:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  -[NEConfigurationManager showLocalNetworkAlertForApp:withCompletionQueue:query:hasEntitlement:handler:](self, "showLocalNetworkAlertForApp:withCompletionQueue:query:hasEntitlement:handler:", a3, a4, 0, 0, a5);
}

- (void)showLocalNetworkAlertForApp:(id)a3 withCompletionQueue:(id)a4 query:(id)a5 hasEntitlement:(BOOL)a6 handler:(id)a7
{
  -[NEConfigurationManager showLocalNetworkAlertForApp:pid:uuid:query:hasEntitlement:completionQueue:handler:](self, "showLocalNetworkAlertForApp:pid:uuid:query:hasEntitlement:completionQueue:handler:", a3, 0, 0, a5, 0, a4, a7);
}

- (void)showLocalNetworkAlertForApp:(id)a3 pid:(int)a4 uuid:(id)a5 query:(id)a6 hasEntitlement:(BOOL)a7 completionQueue:(id)a8 handler:(id)a9
{
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  xpc_object_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  _QWORD block[4];
  id v37;
  unsigned __int8 uuid[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v19 = a3;
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "config-operation", 16);
  v21 = objc_retainAutorelease(v19);
  v22 = (const char *)objc_msgSend(v21, "UTF8String");

  v23 = MEMORY[0x1E0C809B0];
  if (v22)
  {
    xpc_dictionary_set_string(v20, "bundle-id", v22);
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  ne_log_obj();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uuid = 0;
    _os_log_error_impl(&dword_19BD16000, v30, OS_LOG_TYPE_ERROR, "Failed to extract bundle ID string", uuid, 2u);
  }

  block[0] = v23;
  block[1] = 3221225472;
  block[2] = __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke;
  block[3] = &unk_1E3CC4720;
  v37 = v18;
  dispatch_async(v17, block);

  if (a4)
LABEL_3:
    xpc_dictionary_set_int64(v20, "pid", a4);
LABEL_4:
  if (v15)
  {
    *(_OWORD *)uuid = 0uLL;
    objc_msgSend(v15, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v20, "uuid", uuid);
  }
  if (!v16)
  {
    ne_log_obj();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uuid = 0;
      v27 = "No query string provided";
      v28 = v26;
      v29 = 2;
      goto LABEL_18;
    }
LABEL_15:

    goto LABEL_16;
  }
  v24 = objc_retainAutorelease(v16);
  v25 = (const char *)objc_msgSend(v24, "UTF8String");
  if (v25)
  {
    xpc_dictionary_set_string(v20, "query", v25);
    ne_log_obj();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uuid = 138412290;
      *(_QWORD *)&uuid[4] = v24;
      v27 = "Set query string: %@";
      v28 = v26;
      v29 = 12;
LABEL_18:
      _os_log_debug_impl(&dword_19BD16000, v28, OS_LOG_TYPE_DEBUG, v27, uuid, v29);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_16:
  xpc_dictionary_set_BOOL(v20, "has-entitlement", a7);
  v33[0] = v23;
  v33[1] = 3221225472;
  v33[2] = __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke_196;
  v33[3] = &unk_1E3CC08A0;
  v34 = v17;
  v35 = v18;
  v31 = v18;
  v32 = v17;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v20, v33);

}

- (void)repopulateNetworkPrivacyConfigurationResetAll:(BOOL)a3
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, "config-operation", 17);
  xpc_dictionary_set_BOOL(xdict, "reset-all", a3);
  -[NEConfigurationManager sendRequest:responseHandler:](self, xdict, 0);

}

- (void)fetchClientListenerWithBundleID:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v11, "config-operation", 8);
  v12 = objc_retainAutorelease(v10);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");

  xpc_dictionary_set_string(v11, "client-name", v13);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke;
  v16[3] = &unk_1E3CC08A0;
  v17 = v8;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v11, v16);

}

- (void)fetchUpgradeInfoForPluginType:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v11, "config-operation", 9);
  v12 = objc_retainAutorelease(v10);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");

  xpc_dictionary_set_string(v11, "config-plugin-type", v13);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke;
  v16[3] = &unk_1E3CBFD58;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v11, v16);

}

- (id)getCurrentUserUUIDForConfigurationID:(id)a3 fromIndex:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UserMap"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UserMap"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (isa_nsarray(v14) && (objc_msgSend(v14, "containsObject:", v5) & 1) != 0)
        {
          v15 = v12;

          goto LABEL_12;
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)copyAppGroupMapDidChange:(BOOL *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self || !self->_appGroupMap)
  {
    v6 = 0;
    if (!a3)
      goto LABEL_5;
    goto LABEL_4;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", self->_appGroupMap);
  if (a3)
LABEL_4:
    *a3 = -[NEConfigurationManager appGroupsChanged](self, "appGroupsChanged");
LABEL_5:
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)addGroups:(id)a3 forApp:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *appGroupMap;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (!self || !self->_appGroupMap)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NEConfigurationManager setAppGroupMap:]((uint64_t)self, v8);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
        if (self)
          appGroupMap = self->_appGroupMap;
        else
          appGroupMap = 0;
        -[NSMutableDictionary objectForKeyedSubscript:](appGroupMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13), (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v16 || (objc_msgSend(v16, "isEqualToString:", v7) & 1) == 0)
          -[NEConfigurationManager setAppGroupsChanged:](self, "setAppGroupsChanged:", 1);
        if (self)
          v18 = self->_appGroupMap;
        else
          v18 = 0;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v7, v14);

        ++v13;
      }
      while (v11 != v13);
      v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v11 = v19;
    }
    while (v19);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (id)debugDescription
{
  void *v3;
  NSMutableDictionary *appGroupMap;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  objc_msgSend(v3, "appendString:", CFSTR("{"));
  os_unfair_lock_lock(&self->_lock);
  if (self)
    appGroupMap = self->_appGroupMap;
  else
    appGroupMap = 0;
  objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", appGroupMap, CFSTR("app-group-map"), 0, 0);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v3, "appendString:", CFSTR("\n}"));
  return v3;
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)hasVPNAPIEntitlement
{
  return self->_hasVPNAPIEntitlement;
}

- (void)setHasVPNAPIEntitlement:(BOOL)a3
{
  self->_hasVPNAPIEntitlement = a3;
}

- (int64_t)configurationChangeSource
{
  return self->_configurationChangeSource;
}

- (void)setConfigurationChangeSource:(int64_t)a3
{
  self->_configurationChangeSource = a3;
}

- (BOOL)appGroupsChanged
{
  return self->_appGroupsChanged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_appGroupMap, 0);
  objc_storeStrong((id *)&self->_SCPreferencesSignature, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_loadedConfigurations, 0);
  objc_storeStrong((id *)&self->_loadedIndex, 0);
  objc_storeStrong(&self->_changedHandler, 0);
  objc_storeStrong((id *)&self->_changedQueue, 0);
  objc_storeStrong((id *)&self->_currentIndex, 0);
  objc_storeStrong((id *)&self->_outerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

void __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a4;
  v6 = v5;
  if (v5 && MEMORY[0x1A1ACFDA4](v5) == MEMORY[0x1E0C812F8])
    v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v7 = 0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke_2;
  v12[3] = &unk_1E3CC46A8;
  v10 = *(id *)(a1 + 48);
  v13 = v7;
  v14 = v10;
  v11 = v7;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v8, v9, v12);

}

- (void)sendRequest:(void *)a3 responseHandler:
{
  id v5;
  void *v6;
  const char *v7;
  id v8;
  xpc_object_t xdict;

  xdict = a2;
  if (a1)
  {
    v5 = a3;
    objc_msgSend(a1, "pluginType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1, "pluginType");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(xdict, "config-plugin-type", (const char *)objc_msgSend(v8, "UTF8String"));

    }
    objc_msgSend(objc_getProperty(a1, v7, 112, 1), "sendRequest:responseHandler:", xdict, v5);

  }
}

uint64_t __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke_2;
  v9[3] = &unk_1E3CC46A8;
  v6 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, v9);

}

uint64_t __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4[0] = 67109120;
    v4[1] = 0;
    _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "Calling handler with failure: %u", (uint8_t *)v4, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke_196(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  _BOOL4 value;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v16 = a3;
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEBUG, "Got response, result_code: %llu, response_data: %@", buf, 0x16u);
  }

  if (a3 == 36)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = "Alert was blocked, defaulting to no";
LABEL_13:
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_INFO, v10, buf, 2u);
    }
LABEL_14:
    LOBYTE(value) = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (a3 == 16)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = "App wasn't foreground, didn't show alert";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!a3 && v6 && MEMORY[0x1A1ACFDA4](v6) == MEMORY[0x1E0C812D0])
  {
    value = xpc_BOOL_get_value(v6);
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = value;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_INFO, "App got response: %u", buf, 8u);
    }
    goto LABEL_15;
  }
  LOBYTE(value) = 0;
LABEL_16:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke_197;
  v12[3] = &unk_1E3CC3B30;
  v14 = value;
  v11 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  dispatch_async(v11, v12);

}

uint64_t __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke_197(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_INFO, "Calling handler with newly allowed state: %u", (uint8_t *)v5, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __103__NEConfigurationManager_triggerLocalAuthenticationForConfigurationWithID_withCompletionQueue_handler___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

void __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v18 = v9;
    v19 = 1024;
    v20 = a2;
    v21 = 2048;
    v22 = a3;
    v23 = 2048;
    v24 = v7;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_INFO, "%@ Loaded identities from nehelper, ipc_success = %d, result_code = %lld, response_data = %p", buf, 0x26u);
  }

  if (v7 && MEMORY[0x1A1ACFDA4](v7) == MEMORY[0x1E0C812C8])
    v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v10 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_187;
  v14[3] = &unk_1E3CC46A8;
  v11 = *(NSObject **)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v15 = v10;
  v16 = v12;
  v13 = v10;
  dispatch_async(v11, v14);

}

void __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = +[NEIdentityKeychainItem copyIdentities:fromDomain:](NEIdentityKeychainItem, "copyIdentities:fromDomain:", *(_QWORD *)(a1 + 32), 1);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_187(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BYTE *v3;
  NSObject *v4;
  _QWORD v5[5];
  NSObject *v6;
  id v7;
  id v8;
  id v9;

  getWriterSemaphore();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v3 = *(_BYTE **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E3CC3CE0;
  v5[4] = v3;
  v6 = v2;
  v9 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v4 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v3, 0, v5);

}

void __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id Property;
  const __SCPreferences *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  char v19;
  NSObject *v20;
  char *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BYTE *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  char *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  int v66;
  int v67;
  const char *v68;
  int v69;
  void *v70;
  void *v71;
  uint64_t v72;
  SCPreferencesRef prefs;
  int v74;
  uint64_t v75;
  id obj;
  void *v77;
  void *v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
    goto LABEL_83;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v3, 88, 1);
  objc_msgSend(Property, "allValues");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("NEConfigurationManager remove prefs"), 0);
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  prefs = v6;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v66 = SCError();
      *(_DWORD *)buf = 136315394;
      v85 = SCErrorString(v66);
      v86 = 1024;
      LODWORD(v87) = SCError();
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "SCPreferencesCreate failed while handling application removal: %s (%d)", buf, 0x12u);
    }

    goto LABEL_81;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v85 = "-[NEConfigurationManager handleApplicationsRemoved:completionQueue:withCompletionHandler:]_block_invoke";
    v86 = 1024;
    LODWORD(v87) = 2571;
    _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
  }

  if (!SCPreferencesLock(v6, 1u))
  {
    ne_log_obj();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v67 = SCError();
      v68 = SCErrorString(v67);
      v69 = SCError();
      *(_DWORD *)buf = 136315394;
      v85 = v68;
      v86 = 1024;
      LODWORD(v87) = v69;
      _os_log_error_impl(&dword_19BD16000, v65, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed while handling application removal: %s (%d)", buf, 0x12u);
    }

    CFRelease(prefs);
LABEL_81:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_82;
  }
  v70 = 0;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v71;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
  if (!v9)
    goto LABEL_72;
  v10 = v9;
  v11 = *(_QWORD *)v81;
  v79 = a1;
  v72 = *(_QWORD *)v81;
  do
  {
    v12 = 0;
    v75 = v10;
    do
    {
      if (*(_QWORD *)v81 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v12);
      objc_msgSend(v13, "pluginType", v70);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "payloadInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_32;
      objc_msgSend(v13, "application");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v15 = (void *)v16;
        v17 = *(void **)(a1 + 48);
        objc_msgSend(v13, "application");
        v18 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "containsObject:", v18))
        {

          goto LABEL_22;
        }
        if (v14)
        {
          v19 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", v14);

          if ((v19 & 1) == 0)
            goto LABEL_33;
LABEL_22:
          ne_log_obj();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v13, "name");
            v21 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v85 = v21;
            _os_log_impl(&dword_19BD16000, v20, OS_LOG_TYPE_INFO, "Removing configuration %@ because the corresponding VPN application has been removed", buf, 0xCu);

          }
          if (v14)
            -[NEConfigurationManager removeGroupsForApp:](*(_QWORD *)(a1 + 32), v14);
          objc_msgSend(v13, "applicationIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v23 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v13, "applicationIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NEConfigurationManager removeGroupsForApp:](v23, v24);

          }
          v25 = *(_BYTE **)(a1 + 32);
          objc_msgSend(v13, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEConfigurationManager removeConfigurationFromDisk:updateSCPreferences:](v25, v26, prefs);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            ne_log_obj();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "name");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v85 = "-[NEConfigurationManager handleApplicationsRemoved:completionQueue:withCompletionHandler:]_block_invoke";
              v86 = 2112;
              v87 = v61;
              v88 = 2112;
              v89 = v15;
              _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "%s: failed to remove configuration %@: %@", buf, 0x20u);

            }
            goto LABEL_31;
          }
        }
        else
        {
LABEL_31:

        }
LABEL_32:

        goto LABEL_33;
      }
      if (v14 && objc_msgSend(*(id *)(a1 + 48), "containsObject:", v14))
        goto LABEL_22;
LABEL_33:
      objc_msgSend(v13, "appVPN");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentFilter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "perApp");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v78 = v14;
      if (v29)
      {
        objc_msgSend(v13, "contentFilter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v13, "dnsProxy");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "perApp");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v13, "dnsProxy");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v13, "relay");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "perApp");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v34)
          {
            v36 = 0;
            if (!v27)
            {
              v39 = 0;
              goto LABEL_66;
            }
            goto LABEL_40;
          }
          objc_msgSend(v13, "relay");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v35 = v30;
      objc_msgSend(v30, "perApp");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        if (!v36)
        {
          v39 = 0;
          goto LABEL_66;
        }
        v37 = 1;
        v38 = v36;
        goto LABEL_43;
      }
LABEL_40:
      v37 = 0;
      v38 = v27;
LABEL_43:
      objc_msgSend(v38, "appRules");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_msgSend(v13, "externalIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          v74 = v37;
          v77 = (void *)objc_msgSend(v39, "mutableCopy");
          v41 = objc_msgSend(v39, "count");
          if (v41 >= 1)
          {
            v42 = v41 + 1;
            while (1)
            {
              v43 = v42 - 2;
              objc_msgSend(v39, "objectAtIndexedSubscript:", v42 - 2);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = *(void **)(a1 + 48);
              objc_msgSend(v44, "matchSigningIdentifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v45) = objc_msgSend(v45, "containsObject:", v46);

              if ((_DWORD)v45)
                break;

              --v42;
              a1 = v79;
              if (v42 <= 1)
                goto LABEL_54;
            }
            ne_log_obj();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v44, "matchSigningIdentifier");
              v48 = (char *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "name");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v85 = v48;
              v86 = 2112;
              v87 = v49;
              _os_log_impl(&dword_19BD16000, v47, OS_LOG_TYPE_INFO, "Removing app rule %@ from configuration %@ because the corresponding application has been removed", buf, 0x16u);

            }
            objc_msgSend(v77, "removeObjectAtIndex:", v43);

            a1 = v79;
          }
LABEL_54:
          v50 = v77;
          v51 = objc_msgSend(v77, "count");
          v11 = v72;
          v10 = v75;
          if (v51 != objc_msgSend(v39, "count"))
          {
            v53 = v27;
            if (!v74 || (v53 = v36) != 0)
              objc_msgSend(v53, "setAppRules:", v77);
            v54 = *(_QWORD *)(a1 + 32);
            if (v54)
              v55 = objc_getProperty(*(id *)(a1 + 32), v52, 80, 1);
            else
              v55 = 0;
            v56 = v55;
            objc_msgSend(v13, "identifier");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKeyedSubscript:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            -[NEConfigurationManager saveConfigurationToDisk:updateSCPreferences:currentSignature:userUUID:notifyNow:isUpgrade:](v54, v13, prefs, v58, 0, 1, 0);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = v75;
            if (v59)
            {
              ne_log_obj();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v13, "name");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v85 = "-[NEConfigurationManager handleApplicationsRemoved:completionQueue:withCompletionHandler:]_block_invoke";
                v86 = 2112;
                v87 = v62;
                v88 = 2112;
                v89 = v59;
                _os_log_error_impl(&dword_19BD16000, v60, OS_LOG_TYPE_ERROR, "%s: failed to save %@: %@", buf, 0x20u);

              }
            }

            a1 = v79;
            v50 = v77;
          }

        }
      }
LABEL_66:

      ++v12;
    }
    while (v12 != v10);
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    v10 = v63;
  }
  while (v63);
LABEL_72:

  ne_log_obj();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v85 = "-[NEConfigurationManager handleApplicationsRemoved:completionQueue:withCompletionHandler:]_block_invoke";
    v86 = 1024;
    LODWORD(v87) = 2645;
    _os_log_debug_impl(&dword_19BD16000, v64, OS_LOG_TYPE_DEBUG, "%s:%d: Unlocking SCPreferences", buf, 0x12u);
  }

  SCPreferencesUnlock(prefs);
  CFRelease(prefs);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));
  v4 = v70;
LABEL_82:

LABEL_83:
}

uint64_t __39__NEConfigurationManager_executeBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    *(_BYTE *)(v2 + 25) = 1;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    *(_BYTE *)(v4 + 25) = 0;
  return result;
}

void __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke_88(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  void *v7;
  const void *bytes_ptr;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  xpc_object_t xdata;

  xdata = a4;
  if (xdata && MEMORY[0x1A1ACFDA4](xdata) == MEMORY[0x1E0C812E8])
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    bytes_ptr = xpc_data_get_bytes_ptr(xdata);
    objc_msgSend(v7, "dataWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(xdata), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, 0);
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v16, CFSTR("config-index"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v10, "decodeInt64ForKey:", CFSTR("config-generation"));
    if (isa_nsdictionary(v17))
    {
      v20 = *(void **)(a1 + 32);
      if (v20)
        objc_setProperty_atomic(v20, v19, v17, 56);
    }
    v21 = *(_QWORD *)(a1 + 32);
    if (v21)
      *(_QWORD *)(v21 + 104) = v18;

  }
  if (a2)
    v22 = a3;
  else
    v22 = 11;
  if (v22)
  {
    -[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)errorWithCode:(void *)a3 specifics:
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = CFSTR("configuration is corrupted");
    switch(a2)
    {
      case 1:
        break;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("configuration is invalid: %@"), v5);
        goto LABEL_14;
      case 3:
        v6 = CFSTR("configuration type is wrong");
        break;
      case 4:
        v6 = CFSTR("configuration owner application is wrong");
        break;
      case 5:
        v6 = CFSTR("configuration is stale");
        break;
      case 6:
        v6 = CFSTR("failed to write configuration to disk");
        break;
      case 7:
        v6 = CFSTR("configuration does not exist");
        break;
      case 8:
        v6 = CFSTR("invalid configuration operation request");
        break;
      case 9:
        v6 = CFSTR("configuration is unchanged");
        break;
      case 10:
        v6 = CFSTR("permission denied");
        break;
      case 11:
        v6 = CFSTR("IPC failed");
        break;
      case 12:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to make changes in SCPreferences: %@"), v5);
LABEL_14:
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 13:
        v6 = CFSTR("failed to copy keychain items");
        break;
      case 14:
        v6 = CFSTR("failed into import certificates into keychain");
        break;
      case 15:
        v6 = CFSTR("unknown certificate format");
        break;
      case 16:
        v6 = CFSTR("failed to import certificate");
        break;
      case 17:
        v6 = CFSTR("internal failure with certificate installation");
        break;
      case 18:
        v6 = CFSTR("file not found");
        break;
      case 20:
        v6 = CFSTR("total NetworkExtension configuration size limit exceeded");
        break;
      case 21:
        v6 = CFSTR("MDM required");
        break;
      default:
        v6 = CFSTR("<unknown>");
        break;
    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("NEConfigurationErrorDomain"), a2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)filterIndexWithFilter:(void *)a1
{
  const char *v3;
  id v4;
  const char *v5;
  void *v6;
  int v7;
  id v8;
  SEL v9;
  void *v10;
  void *v11;
  void *v12;
  SEL v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  SEL v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  id v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  id v43;
  void *v44;
  void *v45;
  int v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  id self;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  void *v71;
  void *v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1 || !objc_getProperty(a1, v3, 56, 1))
  {
    v51 = 0;
    goto LABEL_57;
  }
  if (!v4
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("user-uuid")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = isa_nsuuid(v6),
        v6,
        !v7))
  {
    v8 = (id)objc_msgSend(objc_getProperty(a1, v5, 56, 1), "mutableCopy");
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("AppGroupMap"));
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v8);
    goto LABEL_56;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plugin-types"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("application-id"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objc_getProperty(a1, v9, 56, 1), "objectForKeyedSubscript:", CFSTR("UserMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("user-uuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v12);

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  self = a1;
  objc_msgSend(objc_getProperty(a1, v13, 56, 1), "objectForKeyedSubscript:", CFSTR("UserMap"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NEGetNullUUID();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v68 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v21) & 1) == 0)
          objc_msgSend(v8, "addObject:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    }
    while (v18);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(objc_getProperty(self, v22, 56, 1), "objectForKeyedSubscript:", CFSTR("UserMap"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NEGetRootUUID();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v64 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
        if ((objc_msgSend(v8, "containsObject:", v30) & 1) == 0)
          objc_msgSend(v8, "addObject:", v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    }
    while (v27);
  }

  if (!v8)
  {
    v51 = 0;
    goto LABEL_55;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v31 = v8;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
  if (!v32)
  {
    v51 = 0;
LABEL_53:

    goto LABEL_55;
  }
  v34 = v32;
  v53 = v4;
  v57 = 0;
  v35 = CFSTR("ConfigurationProperties");
  v36 = *(_QWORD *)v60;
  v37 = self;
  do
  {
    v38 = 0;
    v55 = v34;
    do
    {
      if (*(_QWORD *)v60 != v36)
        objc_enumerationMutation(v31);
      v39 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v38);
      objc_msgSend(objc_getProperty(v37, v33, 56, 1), "objectForKeyedSubscript:", v35);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (isa_nsdictionary(v41))
      {
        v42 = v35;
        v43 = v31;
        if ((isa_nsarray(v58) & 1) == 0 && !isa_nsstring(v56))
          goto LABEL_41;
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("PluginType"), v53);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("ApplicationID"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (isa_nsarray(v58) && isa_nsstring(v44))
          v46 = objc_msgSend(v58, "containsObject:", v44);
        else
          v46 = 0;
        if (isa_nsstring(v56)
          && isa_nsstring(v45)
          && objc_msgSend(v56, "isEqualToString:", v45))
        {

          v37 = self;
          goto LABEL_41;
        }

        v37 = self;
        if (v46)
        {
LABEL_41:
          v47 = v57;
          if (!v57)
            v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v57 = v47;
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v41, v39, v53);
        }
        v31 = v43;
        v35 = v42;
        v34 = v55;
      }

      ++v38;
    }
    while (v34 != v38);
    v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
  }
  while (v34);

  if (v57)
  {
    v73[0] = CFSTR("UserMap");
    v4 = v53;
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("user-uuid"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v48;
    objc_msgSend(v57, "allKeys");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v35;
    v74[0] = v50;
    v74[1] = v57;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v57;
    goto LABEL_53;
  }
  v51 = 0;
  v4 = v53;
LABEL_55:

LABEL_56:
LABEL_57:

  return v51;
}

- (void)clearLoadedConfigurationsWithIDs:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  SEL v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          ne_log_obj();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v10;
            _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEFAULT, "Clearing %@ from the loaded configurations", buf, 0xCu);
          }

        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v7);
    }
    objc_msgSend(objc_getProperty(a1, v6, 88, 1), "removeObjectsForKeys:", v4);
    objc_msgSend(objc_getProperty(a1, v12, 80, 1), "removeObjectsForKeys:", v4);
  }

}

void __56__NEConfigurationManager_registerForChangeNotifications__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  id WeakRetained;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  id Property;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "com.apple.neconfigurationchanged";
    v19 = 1024;
    v20 = a2;
    _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEFAULT, "Received a %s notification with token %d", buf, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = objc_getProperty(WeakRetained, v6, 72, 1);
    if (v8)
    {
      v10 = v8;
      Property = objc_getProperty(v7, v9, 64, 1);

      if (Property)
      {
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __56__NEConfigurationManager_registerForChangeNotifications__block_invoke_99;
        v15 = &unk_1E3CC45C8;
        v16 = v7;
        -[NEConfigurationManager getCurrentIndexWithCompletionHandler:]();

      }
    }
  }

}

void __56__NEConfigurationManager_registerForChangeNotifications__block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;

  v3 = a2;
  if (!v3)
  {
    v4 = *(_BYTE **)(a1 + 32);
    if (v4)
    {
      if ((v4[20] & 1) == 0)
      {
        -[NEConfigurationManager notifyChanges](v4, 0);
        v3 = 0;
      }
    }
  }

}

void __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke_148(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  const void *bytes_ptr;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (v7 && MEMORY[0x1A1ACFDA4](v7) == MEMORY[0x1E0C812E8])
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3710]);
    v11 = (void *)MEMORY[0x1E0C99D50];
    bytes_ptr = xpc_data_get_bytes_ptr(v8);
    objc_msgSend(v11, "dataWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v8), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "initForReadingFromData:error:", v13, 0);

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject decodeObjectOfClasses:forKey:](v9, "decodeObjectOfClasses:forKey:", v16, CFSTR("config-objects"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (isa_nsarray(v17))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v26;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(v18);
            -[NEConfigurationManager didLoadConfiguration:](*(void **)(a1 + 32), *(void **)(*((_QWORD *)&v25 + 1) + 8 * v22++));
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v20);
      }

    }
  }
  else
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "No response data", buf, 2u);
    }
  }

  if ((a2 & 1) != 0)
  {
    if (!a3)
      goto LABEL_24;
  }
  else
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v23, OS_LOG_TYPE_ERROR, "IPC with nehelper failed", buf, 2u);
    }

    a3 = 11;
  }
  ne_log_obj();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v30 = a3;
    _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "load failed with error: %lld", buf, 0xCu);
  }

  -[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), a3, 0);
  a3 = objc_claimAutoreleasedReturnValue();
LABEL_24:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)removeGroupsForApp:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = *(id *)(a1 + 128);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 128), "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v3);

          if (v12)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend((id)a1, "setAppGroupsChanged:", 1);
      objc_msgSend(*(id *)(a1 + 128), "removeObjectsForKeys:", v4);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));

  }
}

- (_BYTE)removeConfigurationFromDisk:(const __SCPreferences *)a3 updateSCPreferences:
{
  const char *v5;
  id v6;
  id Property;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  SEL v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  const __CFString *v40;
  SCNetworkServiceRef v41;
  id v42;
  const __SCNetworkService *v43;
  const __SCNetworkService *v44;
  const __SCPreferences *v45;
  const char *v46;
  NSObject *v47;
  CFDataRef Signature;
  SEL v49;
  void *v50;
  char v51;
  void *v52;
  SEL v53;
  void *v54;
  void *v55;
  int v56;
  char *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  int v61;
  void *v62;
  void *v64;
  void *v65;
  int v66;
  const char *v67;
  void *v68;
  int v69;
  const char *v70;
  const char *v71;
  void *v72;
  const __SCPreferences *prefs;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  char v83;
  uint64_t v84;
  id v85;
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  const char *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (a1)
  {
    v84 = 0;
    v83 = 0;
    if ((a1[23] & 1) == 0)
    {
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)a1, 10, 0);
      a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    }
    Property = objc_getProperty(a1, v5, 56, 1);
    -[NEConfigurationManager makeMutableCopyOfIndex:](a1, Property);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = isa_nsdictionary(v10);

    if ((v11 & 1) == 0)
    {
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)a1, 7, 0);
      a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
LABEL_54:

      goto LABEL_55;
    }
    prefs = a3;
    v74 = (uint64_t)a1;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v6);

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserMap"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v80 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserMap"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "removeObject:", v6);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
      }
      while (v15);
    }

    v21 = (_QWORD *)v74;
    v22 = objc_msgSend((id)v74, "copyAppGroupMapDidChange:", &v83);
    if (v22 && v83)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("AppGroupMap"));
      os_unfair_lock_lock((os_unfair_lock_t)(v74 + 16));
      objc_msgSend((id)v74, "setAppGroupsChanged:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)(v74 + 16));
    }
    v72 = (void *)v22;
    v23 = *(_QWORD *)(v74 + 104);
    if (v23 <= 0x1FFFFFFFFFFFFELL)
      v24 = v23 + 1;
    else
      v24 = 1;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    v71 = (const char *)v24;
    objc_msgSend(v25, "encodeInt64:forKey:", v24, CFSTR("Generation"));
    objc_msgSend(v25, "encodeInt64:forKey:", 1, CFSTR("Version"));
    objc_msgSend(v25, "encodeObject:forKey:", v8, CFSTR("Index"));
    if (objc_getProperty((id)v74, v26, 56, 1))
    {
      objc_msgSend(objc_getProperty((id)v74, v27, 88, 1), "objectForKeyedSubscript:", v6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
        objc_msgSend(v28, "clearSystemKeychain");
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
      if (v31)
      {
        v33 = v31;
        v34 = *(_QWORD *)v76;
        do
        {
          v35 = 0;
          v36 = v29;
          do
          {
            if (*(_QWORD *)v76 != v34)
              objc_enumerationMutation(v30);
            objc_msgSend(objc_getProperty(v21, v32, 88, 1), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v35));
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend(v29, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "UUIDString");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "encodeObject:forKey:", v29, v38);

              v21 = (_QWORD *)v74;
              +[NEConfigurationManager updateFlags:withConfiguration:]((uint64_t)NEConfigurationManager, (unint64_t *)&v84, v29);
            }
            ++v35;
            v36 = v29;
          }
          while (v33 != v35);
          v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
        }
        while (v33);
      }

    }
    if (!prefs)
      goto LABEL_43;
    v39 = v6;
    objc_opt_self();
    v40 = (const __CFString *)objc_msgSend(v39, "UUIDString");

    v41 = SCNetworkServiceCopy(prefs, v40);
    if (!v41)
      goto LABEL_43;
    CFRelease(v41);
    v42 = v39;
    objc_opt_self();
    v43 = SCNetworkServiceCopy(prefs, (CFStringRef)objc_msgSend(v42, "UUIDString"));
    if (v43)
    {
      v44 = v43;
      if (!SCNetworkServiceRemove(v43))
      {
        ne_log_obj();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v42, "UUIDString");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = SCError();
          v67 = SCErrorString(v66);
          *(_DWORD *)buf = 138412546;
          v89 = v65;
          v90 = 2080;
          v91 = v67;
          _os_log_error_impl(&dword_19BD16000, v59, OS_LOG_TYPE_ERROR, "SCNetworkServiceRemove failed for configuration %@: %s", buf, 0x16u);

        }
        CFRelease(v44);

        v60 = (void *)MEMORY[0x1E0CB3940];
        v61 = SCError();
        objc_msgSend(v60, "stringWithCString:encoding:", SCErrorString(v61), 4);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v21, 12, v62);
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();

        goto LABEL_53;
      }
      CFRelease(v44);
    }

    v45 = prefs;
    if (SCPreferencesCommitChanges(prefs))
    {
      if (!SCPreferencesApplyChanges(prefs))
      {
        ne_log_obj();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v42, "UUIDString");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = SCError();
          v70 = SCErrorString(v69);
          *(_DWORD *)buf = 138412546;
          v89 = v68;
          v90 = 2080;
          v91 = v70;
          _os_log_error_impl(&dword_19BD16000, v47, OS_LOG_TYPE_ERROR, "SCPreferencesApplyChanges failed while removing configuration %@: %s", buf, 0x16u);

        }
        v45 = prefs;
      }
      if (objc_getProperty(v21, v46, 120, 1))
      {
        Signature = SCPreferencesGetSignature(v45);
        objc_setProperty_atomic(v21, v49, Signature, 120);
      }
LABEL_43:
      objc_msgSend(v25, "encodeObject:forKey:", objc_getProperty(v21, v27, 120, 1), CFSTR("SCPreferencesSignature2"));
      objc_msgSend(v25, "finishEncoding");
      objc_msgSend(v25, "encodedData");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "writeToFile:atomically:", CFSTR("/Library/Preferences/com.apple.networkextension.plist"), 1);

      if ((v51 & 1) != 0)
      {
        v21[13] = v71;
        v52 = (void *)objc_msgSend(v8, "copy");
        objc_setProperty_atomic(v21, v53, v52, 56);

        v85 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](v21, v54);

        -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:](v21, v71, v84, 0);
        a1 = 0;
        goto LABEL_55;
      }
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v21, 6, 0);
      a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
    v55 = (void *)MEMORY[0x1E0CB3940];
    v56 = SCError();
    objc_msgSend(v55, "stringWithCString:encoding:", SCErrorString(v56), 4);
    v57 = (char *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v42, "UUIDString");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v89 = v64;
      v90 = 2112;
      v91 = v57;
      _os_log_error_impl(&dword_19BD16000, v58, OS_LOG_TYPE_ERROR, "SCPreferencesCommitChanges failed while removing configuration %@: %@", buf, 0x16u);

    }
    -[NEConfigurationManager errorWithCode:specifics:](v74, 12, v57);
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();

LABEL_53:
    goto LABEL_54;
  }
LABEL_55:

  return a1;
}

- (id)saveConfigurationToDisk:(const __SCPreferences *)a3 updateSCPreferences:(void *)a4 currentSignature:(void *)a5 userUUID:(int)a6 notifyNow:(char)a7 isUpgrade:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  __objc2_class *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  char v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  id v72;
  void *v73;
  const char *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *Property;
  const char *v94;
  void *v95;
  id v96;
  void *v97;
  const char *v98;
  void *v99;
  id v100;
  void *v101;
  NSObject *v102;
  int v103;
  NSObject *v104;
  SEL v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  char v110;
  void *v111;
  id v112;
  void *v113;
  int v114;
  int v115;
  id v117;
  void *v118;
  void *v119;
  _UNKNOWN **v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  char v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  char v133;
  void *v134;
  unint64_t v135;
  uint64_t v136;
  SEL v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  char v145;
  const char *v146;
  void *v147;
  uint64_t v148;
  id v149;
  id v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  unint64_t v174;
  void *v175;
  NSObject *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  NSObject *v180;
  void *v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t i;
  uint64_t v196;
  void *v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  void *v215;
  uint64_t v216;
  void *v217;
  void *v218;
  void *v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  void *v223;
  void *v224;
  void *v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  void *v229;
  void *v230;
  uint64_t v231;
  void *v232;
  void *v233;
  uint64_t v234;
  void *v235;
  void *v236;
  void *v237;
  char v238;
  uint64_t v239;
  void *v240;
  void *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  int v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  void *v252;
  uint64_t v253;
  void *v254;
  void *v255;
  void *v256;
  uint64_t v257;
  void *v258;
  void *v259;
  uint64_t v260;
  void *v261;
  void *v262;
  void *v263;
  _BOOL4 v264;
  void *v265;
  NSObject *v266;
  const char *v267;
  uint64_t v268;
  void *v269;
  void *v270;
  uint64_t v271;
  void *v272;
  void *v273;
  void *v274;
  uint64_t v275;
  void *v276;
  void *v277;
  uint64_t v278;
  void *v279;
  void *v280;
  void *v281;
  uint64_t v282;
  NSObject *v283;
  void *v284;
  void *v285;
  NSObject *v286;
  uint64_t v287;
  int v288;
  uint64_t v289;
  void *v290;
  void *v291;
  char v292;
  uint64_t v293;
  void *v294;
  void *v295;
  __objc2_class *v296;
  void *v297;
  void *v298;
  _BOOL4 v299;
  const char *v300;
  const __SCPreferences *v301;
  void *v302;
  int v303;
  void *v304;
  const char *v305;
  NSObject *v306;
  CFDataRef Signature;
  SEL v308;
  NSObject *v309;
  const char *v310;
  SEL v311;
  void *v312;
  SEL v313;
  id v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t j;
  void *v319;
  int v320;
  char *v321;
  NSObject *v322;
  void *v323;
  int v324;
  void *v325;
  NSObject *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  char v334;
  void *v335;
  uint64_t v336;
  void *v337;
  void *v338;
  void *v339;
  int v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  void *v344;
  void *v345;
  void *v346;
  uint64_t v347;
  void *v348;
  void *v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  int v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  void *v357;
  const char *v358;
  void *v359;
  void *v360;
  NSObject *v361;
  NSObject *v362;
  void *v363;
  uint64_t v364;
  void *v365;
  char v366;
  char v367;
  char v368;
  char v369;
  void *v370;
  char v371;
  id v372;
  id v373;
  id v374;
  id v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  id v383;
  char v384;
  id v385;
  int v386;
  id v387;
  int v388;
  int v389;
  id v390;
  char v391;
  char v392;
  id v393;
  int v394;
  id v395;
  id v396;
  id v397;
  id v398;
  id v399;
  int v400;
  uint64_t v401;
  uint64_t v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  uint64_t v409;
  uint64_t v410;
  void *v411;
  char v413;
  char v414;
  char v415;
  void *v416;
  void *v417;
  uint64_t v418;
  uint64_t v419;
  void *v420;
  uint64_t v421;
  id v422;
  __objc2_class *obj;
  id obja;
  char v425;
  void *v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  unsigned __int8 v435;
  uint64_t v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  _BYTE v441[128];
  _BYTE v442[128];
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  uint8_t v447[4];
  const char *v448;
  __int16 v449;
  void *v450;
  __int16 v451;
  const char *v452;
  uint8_t buf[32];
  __int128 v454;
  __int128 v455;
  uint8_t v456[4];
  const char *v457;
  __int16 v458;
  void *v459;
  uint64_t v460;

  v460 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a4;
  v14 = a5;
  v405 = v12;
  v406 = v14;
  if (!a1)
  {
    v33 = v13;
    v34 = 0;
    goto LABEL_116;
  }
  v15 = v14;
  v400 = a6;
  objc_msgSend(v12, "pluginType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v436 = 0;
  v17 = NEConfigurationManager;
  v18 = v12;
  objc_opt_self();
  objc_msgSend(v18, "alwaysOnVPN");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v408 = v16;
  v409 = a1;
  v407 = v18;
  if (!v19
    || (objc_msgSend(v18, "alwaysOnVPN"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v12, "isEnabled") & 1) == 0))
  {
    objc_msgSend(v18, "VPN");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v18, "VPN");
      v17 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
      if ((-[__objc2_class isEnabled](v17, "isEnabled") & 1) != 0)
      {
        v425 = 1;
LABEL_43:

LABEL_44:
        a1 = v409;
        if (!v19)
          goto LABEL_46;
        goto LABEL_45;
      }
    }
    objc_msgSend(v18, "appVPN");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v18, "appVPN");
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v420, "isEnabled") & 1) != 0)
      {
        v425 = 1;
LABEL_41:

LABEL_42:
        v16 = v408;
        if (!v20)
          goto LABEL_44;
        goto LABEL_43;
      }
      obj = v17;
    }
    else
    {
      obj = v17;
    }
    objc_msgSend(v18, "contentFilter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v18, "contentFilter");
      v417 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v417, "isEnabled") & 1) != 0)
      {
        v425 = 1;
LABEL_39:

LABEL_40:
        v17 = obj;
        if (!v21)
          goto LABEL_42;
        goto LABEL_41;
      }
    }
    objc_msgSend(v18, "dnsProxy");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v18;
    v25 = (void *)v23;
    if (v23)
    {
      objc_msgSend(v24, "dnsProxy");
      v403 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v403, "isEnabled") & 1) != 0)
      {
        v425 = 1;
LABEL_37:

LABEL_38:
        v18 = v407;
        if (!v22)
          goto LABEL_40;
        goto LABEL_39;
      }
      v413 = a7;
    }
    else
    {
      v413 = a7;
    }
    objc_msgSend(v407, "dnsSettings");
    v410 = objc_claimAutoreleasedReturnValue();
    if (v410)
    {
      objc_msgSend(v407, "dnsSettings");
      v383 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v383, "isEnabled") & 1) != 0)
      {
        v425 = 1;
        v26 = v413;
        v27 = (void *)v410;
LABEL_35:

LABEL_36:
        a7 = v26;
        if (!v25)
          goto LABEL_38;
        goto LABEL_37;
      }
    }
    objc_msgSend(v407, "appPush");
    v401 = objc_claimAutoreleasedReturnValue();
    if (v401)
    {
      objc_msgSend(v407, "appPush");
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v378, "isEnabled") & 1) != 0)
      {
        v425 = 1;
        v26 = v413;
        v28 = (void *)v401;
        goto LABEL_33;
      }
      v372 = v13;
    }
    else
    {
      v372 = v13;
    }
    objc_msgSend(v407, "relay");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      objc_msgSend(v407, "relay");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v425 = objc_msgSend(v31, "isEnabled");

    }
    else
    {
      v425 = 0;
    }
    v13 = v372;
    v26 = v413;
    v28 = (void *)v401;
    if (!v401)
    {
LABEL_34:
      v27 = (void *)v410;
      if (!v410)
        goto LABEL_36;
      goto LABEL_35;
    }
LABEL_33:

    goto LABEL_34;
  }
  v425 = 1;
LABEL_45:

LABEL_46:
  v435 = 0;
  if ((*(_BYTE *)(a1 + 23) & 1) != 0)
  {
    v44 = objc_getProperty((id)a1, v32, 88, 1);
    objc_msgSend(v18, "identifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", v45);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    if (!v35 || v35 == v18)
      goto LABEL_103;
    v46 = v35;
    obj = (__objc2_class *)v18;
    objc_msgSend(v46, "VPN");
    v47 = objc_claimAutoreleasedReturnValue();
    if (!v47)
      goto LABEL_58;
    v48 = (void *)v47;
    -[__objc2_class VPN](obj, "VPN");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = (void *)v49;
      v373 = v13;
      v379 = v35;
      objc_msgSend(v46, "VPN");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "protocol");
      v52 = objc_claimAutoreleasedReturnValue();
      if (!v52)
      {

        v15 = v406;
        v16 = v408;
        a1 = v409;
        v13 = v373;
        goto LABEL_58;
      }
      v53 = (void *)v52;
      objc_msgSend(v46, "VPN");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "protocol");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v421 = objc_msgSend(v55, "type");
      -[__objc2_class VPN](obj, "VPN");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "protocol");
      v57 = a7;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v418 = objc_msgSend(v58, "type");

      a7 = v57;
      v18 = v407;

      v15 = v406;
      v16 = v408;
      a1 = v409;
      v35 = v379;
      v13 = v373;
      if (v421 == v418)
      {
LABEL_58:
        objc_msgSend(v46, "appVPN");
        v61 = objc_claimAutoreleasedReturnValue();
        if (!v61
          || (v62 = (void *)v61,
              -[__objc2_class appVPN](obj, "appVPN"),
              v63 = (void *)objc_claimAutoreleasedReturnValue(),
              v63,
              v62,
              v63))
        {
LABEL_76:
          objc_msgSend(v46, "alwaysOnVPN");
          v79 = objc_claimAutoreleasedReturnValue();
          if (!v79
            || (v80 = (void *)v79,
                -[__objc2_class alwaysOnVPN](obj, "alwaysOnVPN"),
                v81 = (void *)objc_claimAutoreleasedReturnValue(),
                v81,
                v80,
                v81))
          {

            goto LABEL_103;
          }
          v445 = 0u;
          v446 = 0u;
          v443 = 0u;
          v444 = 0u;
          objc_msgSend(v46, "alwaysOnVPN");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "interfaceProtocolMapping");
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v443, v447, 16);
          if (!v84)
            goto LABEL_99;
          v85 = v84;
          v415 = a7;
          v380 = v35;
          v374 = v13;
          v86 = 0;
          v87 = *(_QWORD *)v444;
          while (1)
          {
            v88 = 0;
            v89 = v86;
            do
            {
              if (*(_QWORD *)v444 != v87)
                objc_enumerationMutation(v83);
              v90 = *(_QWORD *)(*((_QWORD *)&v443 + 1) + 8 * v88);
              objc_msgSend(v46, "alwaysOnVPN");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "interfaceProtocolMapping");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "objectForKeyedSubscript:", v90);
              v86 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v86, "type") != 5)
              {
                ne_log_obj();
                v102 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                {
                  v103 = objc_msgSend(v86, "type");
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "-[NEConfigurationManager resetKeychainItemsAfterProtocolChange:newConfiguration:]";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v103;
                  _os_log_error_impl(&dword_19BD16000, v102, OS_LOG_TYPE_ERROR, "%s: unsupported protocol type %d for Always-on VPN", buf, 0x12u);
                }
                goto LABEL_95;
              }
              objc_msgSend(v86, "ppkConfiguration");
              Property = (void *)objc_claimAutoreleasedReturnValue();
              v95 = Property;
              if (Property)
                Property = objc_getProperty(Property, v94, 32, 1);
              v96 = Property;

              if (v96)
              {
                objc_msgSend(v86, "ppkConfiguration");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = v97;
                if (v97)
                  v97 = objc_getProperty(v97, v98, 32, 1);
                v100 = v97;
                objc_msgSend(v100, "setIdentifier:", 0);

              }
              objc_msgSend(v86, "sharedSecretKeychainItem");
              v101 = (void *)objc_claimAutoreleasedReturnValue();

              if (v101)
              {
                objc_msgSend(v86, "sharedSecretKeychainItem");
                v102 = objc_claimAutoreleasedReturnValue();
                -[NSObject setIdentifier:](v102, "setIdentifier:", 0);
LABEL_95:

              }
              ++v88;
              v89 = v86;
            }
            while (v85 != v88);
            v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v443, v447, 16);
            if (!v85)
            {

              v13 = v374;
              v15 = v406;
              v18 = v407;
              v16 = v408;
              v35 = v380;
              a7 = v415;
LABEL_99:

              a1 = v409;
LABEL_100:

              ne_log_obj();
              v104 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v447 = 136315138;
                v448 = "-[NEConfigurationManager saveConfigurationToDisk:updateSCPreferences:currentSignature:userUUID:no"
                       "tifyNow:isUpgrade:]";
                _os_log_debug_impl(&dword_19BD16000, v104, OS_LOG_TYPE_DEBUG, "%s clean up system keychain for reset protocol", v447, 0xCu);
              }

              -[NEConfiguration syncWithKeychainInDomain:](v46, 0);
LABEL_103:
              if (v18)
                -[NEConfiguration syncWithKeychainInDomain:](v18, 0);
              objc_msgSend(v18, "generateSignature");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v402 = objc_msgSend((id)a1, "copyAppGroupMapDidChange:", &v435);
              v106 = objc_getProperty((id)a1, v105, 56, 1);
              -[NEConfigurationManager makeMutableCopyOfIndex:]((id)a1, v106);
              v411 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v411, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "identifier");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "objectForKeyedSubscript:", v108);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
              {
                if (v13)
                {
                  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("Signature"));
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  v110 = objc_msgSend(v13, "isEqualToData:", v109);

                  if ((v110 & 1) != 0)
                  {
                    v111 = v42;
                    v381 = v35;
                    v112 = v13;
                    v370 = v111;
                    objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("Signature"));
                    v113 = (void *)objc_claimAutoreleasedReturnValue();
                    v114 = objc_msgSend(v41, "isEqualToData:", v113);
                    v115 = v435;

                    if (v114 && !v115)
                    {
                      -[NEConfigurationManager errorWithCode:specifics:](a1, 9, 0);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = 0;
                      v38 = 0;
                      v39 = 0;
                      v40 = 0;
                      v33 = v112;
                      v35 = v381;
                      goto LABEL_391;
                    }
                    v376 = v41;
                    v35 = v381;
                    if ((a7 & 1) != 0)
                    {
LABEL_118:
                      v117 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                      objc_msgSend(v117, "setObject:forKeyedSubscript:", v376, CFSTR("Signature"));
                      if (v16)
                        objc_msgSend(v117, "setObject:forKeyedSubscript:", v16, CFSTR("PluginType"));
                      v118 = v407;
                      objc_msgSend(v407, "applicationIdentifier");
                      v119 = (void *)objc_claimAutoreleasedReturnValue();

                      v120 = &off_1E3CBB000;
                      if (v119)
                      {
                        objc_msgSend(v407, "applicationIdentifier");
                        v121 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v117, "setObject:forKeyedSubscript:", v121, CFSTR("ApplicationID"));

                      }
                      v382 = v35;
                      v375 = v13;
                      objc_msgSend(v411, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
                      v122 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v407, "identifier");
                      v123 = (void *)objc_claimAutoreleasedReturnValue();
                      v404 = v117;
                      objc_msgSend(v122, "setObject:forKeyedSubscript:", v117, v123);

                      if (v435 && v402)
                      {
                        objc_msgSend(v411, "setObject:forKeyedSubscript:", v402, CFSTR("AppGroupMap"));
                        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
                        objc_msgSend((id)a1, "setAppGroupsChanged:", 0);
                        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
                      }
                      if (v15 && !-[NEConfiguration isSupportedBySC](v407)
                        || (NEGetNullUUID(),
                            v124 = objc_claimAutoreleasedReturnValue(),
                            v15,
                            (v15 = (void *)v124) != 0))
                      {
                        objc_msgSend(v411, "objectForKeyedSubscript:", CFSTR("UserMap"));
                        v125 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v125, "objectForKeyedSubscript:", v15);
                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                        v127 = isa_nsarray(v126);

                        if ((v127 & 1) == 0)
                        {
                          v128 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                          objc_msgSend(v411, "objectForKeyedSubscript:", CFSTR("UserMap"));
                          v129 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v129, "setObject:forKeyedSubscript:", v128, v15);

                        }
                        objc_msgSend(v411, "objectForKeyedSubscript:", CFSTR("UserMap"));
                        v130 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v130, "objectForKeyedSubscript:", v15);
                        v131 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v407, "identifier");
                        v132 = (void *)objc_claimAutoreleasedReturnValue();
                        v133 = objc_msgSend(v131, "containsObject:", v132);

                        if ((v133 & 1) == 0)
                        {
                          objc_msgSend(v407, "identifier");
                          v134 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v131, "addObject:", v134);

                        }
                      }
                      v135 = *(_QWORD *)(a1 + 104);
                      if (v135 <= 0x1FFFFFFFFFFFFELL)
                        v136 = v135 + 1;
                      else
                        v136 = 1;
                      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
                      v422 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      v358 = (const char *)v136;
                      objc_msgSend(v40, "encodeInt64:forKey:", v136, CFSTR("Generation"));
                      objc_msgSend(v40, "encodeInt64:forKey:", 1, CFSTR("Version"));
                      v416 = v40;
                      v406 = v15;
                      if (objc_getProperty((id)a1, v137, 56, 1))
                      {
                        objc_msgSend(objc_getProperty((id)a1, v138, 56, 1), "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
                        v431 = 0u;
                        v432 = 0u;
                        v433 = 0u;
                        v434 = 0u;
                        obja = (id)objc_claimAutoreleasedReturnValue();
                        v139 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v431, v442, 16);
                        if (!v139)
                        {
                          v371 = 0;
                          goto LABEL_338;
                        }
                        v140 = v139;
                        v343 = 0;
                        v371 = 0;
                        v141 = *(_QWORD *)v432;
                        v419 = *(_QWORD *)v432;
                        while (1)
                        {
                          v142 = 0;
                          do
                          {
                            if (*(_QWORD *)v432 != v141)
                              objc_enumerationMutation(obja);
                            v143 = *(void **)(*((_QWORD *)&v431 + 1) + 8 * v142);
                            objc_msgSend(v118, "identifier");
                            v144 = (void *)objc_claimAutoreleasedReturnValue();
                            v145 = objc_msgSend(v143, "isEqual:", v144);

                            if ((v145 & 1) == 0)
                            {
                              objc_msgSend(objc_getProperty((id)a1, v146, 88, 1), "objectForKeyedSubscript:", v143);
                              v147 = (void *)objc_claimAutoreleasedReturnValue();
                              if (!v147)
                                goto LABEL_172;
                              if ((v425 & 1) == 0)
                              {
                                v425 = 0;
                                goto LABEL_171;
                              }
                              v148 = a1;
                              v149 = v118;
                              v150 = v147;
                              objc_opt_self();
                              v426 = v150;
                              objc_msgSend(v150, "alwaysOnVPN");
                              v151 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v151)
                              {
                                objc_msgSend(v149, "contentFilter");
                                v152 = (void *)objc_claimAutoreleasedReturnValue();

                                if (v152)
                                  v153 = 0;
                                else
                                  v153 = -1;
LABEL_152:
                                a1 = v148;

                                if (v153 != -1)
                                {
                                  if (v153 == 1)
                                    goto LABEL_154;
                                  v425 = 1;
                                  v40 = v416;
                                  v141 = v419;
LABEL_171:
                                  objc_msgSend(v422, "addObject:", v147);
                                  objc_msgSend(v143, "UUIDString");
                                  v166 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v40, "encodeObject:forKey:", v147, v166);

                                  +[NEConfigurationManager updateFlags:withConfiguration:]((uint64_t)v120[224], (unint64_t *)&v436, v147);
LABEL_172:

                                  goto LABEL_173;
                                }
                                v141 = v419;
LABEL_159:
                                +[NEConfigurationManager disableConfiguration:onDemandOnly:]((uint64_t)v120[224], v149);
                                objc_msgSend(v149, "generateSignature");
                                v157 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v404, "setObject:forKeyedSubscript:", v157, CFSTR("Signature"));
                                v425 = 0;
                                v40 = v416;
LABEL_170:

                                goto LABEL_171;
                              }
                              objc_msgSend(v149, "alwaysOnVPN");
                              v154 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v154)
                              {
                                objc_msgSend(v150, "contentFilter");
                                v155 = (void *)objc_claimAutoreleasedReturnValue();
                                v153 = v155 == 0;

                                goto LABEL_152;
                              }
                              v160 = objc_msgSend(v149, "grade");
                              if (v160 == objc_msgSend(v150, "grade"))
                              {
                                a1 = v148;
                                objc_msgSend(v149, "VPN");
                                v161 = objc_claimAutoreleasedReturnValue();
                                if (v161)
                                {
                                  v162 = (void *)v161;
                                  objc_msgSend(v149, "VPN");
                                  v163 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (objc_msgSend(v163, "isEnabled")
                                    && (objc_msgSend(v426, "VPN"), (v164 = objc_claimAutoreleasedReturnValue()) != 0))
                                  {
                                    v165 = (void *)v164;
                                    objc_msgSend(v426, "VPN");
                                    v359 = (void *)objc_claimAutoreleasedReturnValue();
                                    v384 = objc_msgSend(v359, "isEnabled");

                                    v118 = v407;
                                    v120 = &off_1E3CBB000;
                                    if ((v384 & 1) != 0)
                                      goto LABEL_326;
                                  }
                                  else
                                  {

                                    v120 = &off_1E3CBB000;
                                  }
                                }
                              }
                              v167 = objc_msgSend(v149, "grade");
                              if (v167 != objc_msgSend(v426, "grade"))
                                goto LABEL_189;
                              objc_msgSend(v149, "contentFilter");
                              v168 = objc_claimAutoreleasedReturnValue();
                              if (!v168)
                                goto LABEL_189;
                              v169 = (void *)v168;
                              objc_msgSend(v149, "contentFilter");
                              v170 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v170, "isEnabled"))
                              {
                                objc_msgSend(v426, "contentFilter");
                                v171 = objc_claimAutoreleasedReturnValue();
                                if (v171)
                                {
                                  v385 = (id)v171;
                                  objc_msgSend(v426, "contentFilter");
                                  v360 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (objc_msgSend(v360, "isEnabled"))
                                  {
                                    objc_msgSend(v149, "contentFilter");
                                    v346 = (void *)objc_claimAutoreleasedReturnValue();
                                    v354 = objc_msgSend(v346, "grade");
                                    objc_msgSend(v426, "contentFilter");
                                    v172 = (void *)objc_claimAutoreleasedReturnValue();
                                    v350 = objc_msgSend(v172, "grade");

                                    if (v354 == v350)
                                    {
                                      objc_msgSend(v426, "externalIdentifier");
                                      v173 = (void *)objc_claimAutoreleasedReturnValue();

                                      v120 = &off_1E3CBB000;
                                      if (v173)
                                      {
                                        v174 = v343 + 1;
                                        objc_msgSend(v149, "externalIdentifier");
                                        v175 = (void *)objc_claimAutoreleasedReturnValue();
                                        v118 = v407;
                                        ++v343;
                                        if (v175)
                                        {
                                          a1 = v148;

                                          v141 = v419;
                                          if (v174 >= 7)
                                          {
                                            ne_log_obj();
                                            v176 = objc_claimAutoreleasedReturnValue();
                                            if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                                            {
                                              objc_msgSend(v149, "name");
                                              v177 = (void *)objc_claimAutoreleasedReturnValue();
                                              *(_DWORD *)v456 = 136315394;
                                              v457 = "+[NEConfigurationManager configuration:overlapsWithOtherConfigurati"
                                                     "on:sameTypeCount:perAppCount:]";
                                              v458 = 2112;
                                              v459 = v177;
                                              _os_log_impl(&dword_19BD16000, v176, OS_LOG_TYPE_DEFAULT, "%s: Exceeded perApp Content Filter limit, %@ superceded", v456, 0x16u);

                                              v120 = &off_1E3CBB000;
                                            }
                                            goto LABEL_221;
                                          }
LABEL_190:
                                          objc_msgSend(v149, "appVPN");
                                          v178 = objc_claimAutoreleasedReturnValue();
                                          v179 = v426;
                                          if (v178)
                                          {
                                            v180 = v178;
                                            objc_msgSend(v149, "appVPN");
                                            v181 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (!objc_msgSend(v181, "isEnabled")
                                              || (objc_msgSend(v426, "appVPN"),
                                                  (v182 = objc_claimAutoreleasedReturnValue()) == 0))
                                            {

                                              v120 = &off_1E3CBB000;
                                              goto LABEL_211;
                                            }
                                            v183 = (void *)v182;
                                            objc_msgSend(v426, "appVPN");
                                            v361 = v180;
                                            v184 = (void *)objc_claimAutoreleasedReturnValue();
                                            v386 = objc_msgSend(v184, "isEnabled");

                                            v120 = &off_1E3CBB000;
                                            if (v386)
                                            {
                                              v454 = 0u;
                                              v455 = 0u;
                                              memset(buf, 0, sizeof(buf));
                                              objc_msgSend(v149, "appVPN");
                                              v185 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v185, "appRules");
                                              v180 = objc_claimAutoreleasedReturnValue();

                                              v351 = -[NSObject countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", buf, v447, 16);
                                              if (v351)
                                              {
                                                v186 = **(_QWORD **)&buf[16];
                                                v362 = v180;
                                                v347 = **(_QWORD **)&buf[16];
                                                do
                                                {
                                                  v187 = 0;
                                                  do
                                                  {
                                                    if (**(_QWORD **)&buf[16] != v186)
                                                    {
                                                      v188 = v187;
                                                      objc_enumerationMutation(v180);
                                                      v187 = v188;
                                                    }
                                                    v355 = v187;
                                                    v189 = *(void **)(*(_QWORD *)&buf[8] + 8 * v187);
                                                    v437 = 0u;
                                                    v438 = 0u;
                                                    v439 = 0u;
                                                    v440 = 0u;
                                                    objc_msgSend(v179, "appVPN");
                                                    v190 = (void *)objc_claimAutoreleasedReturnValue();
                                                    objc_msgSend(v190, "appRules");
                                                    v191 = (void *)objc_claimAutoreleasedReturnValue();

                                                    v387 = v191;
                                                    v192 = objc_msgSend(v191, "countByEnumeratingWithState:objects:count:", &v437, &v443, 16);
                                                    if (v192)
                                                    {
                                                      v193 = v192;
                                                      v194 = *(_QWORD *)v438;
                                                      while (2)
                                                      {
                                                        for (i = 0; i != v193; ++i)
                                                        {
                                                          if (*(_QWORD *)v438 != v194)
                                                            objc_enumerationMutation(v387);
                                                          if ((objc_msgSend(v189, "overlapsWithRule:", *(_QWORD *)(*((_QWORD *)&v437 + 1) + 8 * i)) & 1) != 0)
                                                          {

                                                            a1 = v409;
                                                            v118 = v407;
                                                            v120 = &off_1E3CBB000;
                                                            goto LABEL_325;
                                                          }
                                                        }
                                                        v193 = objc_msgSend(v387, "countByEnumeratingWithState:objects:count:", &v437, &v443, 16);
                                                        if (v193)
                                                          continue;
                                                        break;
                                                      }
                                                    }

                                                    v187 = v355 + 1;
                                                    v120 = &off_1E3CBB000;
                                                    v179 = v426;
                                                    v180 = v362;
                                                    v186 = v347;
                                                  }
                                                  while (v355 + 1 != v351);
                                                  v351 = -[NSObject countByEnumeratingWithState:objects:count:](v362, "countByEnumeratingWithState:objects:count:", buf, v447, 16);
                                                }
                                                while (v351);
                                              }
LABEL_211:

                                            }
                                          }
                                          objc_msgSend(v149, "dnsProxy");
                                          v196 = objc_claimAutoreleasedReturnValue();
                                          if (!v196)
                                            goto LABEL_223;
                                          v197 = (void *)v196;
                                          objc_msgSend(v149, "dnsProxy");
                                          v198 = (void *)objc_claimAutoreleasedReturnValue();
                                          if (!objc_msgSend(v198, "isEnabled")
                                            || (objc_msgSend(v426, "dnsProxy"),
                                                (v199 = objc_claimAutoreleasedReturnValue()) == 0))
                                          {

                                            v120 = &off_1E3CBB000;
                                            goto LABEL_223;
                                          }
                                          v200 = (void *)v199;
                                          objc_msgSend(v426, "dnsProxy");
                                          v201 = (void *)objc_claimAutoreleasedReturnValue();
                                          v388 = objc_msgSend(v201, "isEnabled");

                                          a1 = v409;
                                          v120 = &off_1E3CBB000;
                                          if (!v388)
                                            goto LABEL_223;
                                          objc_msgSend(v149, "externalIdentifier");
                                          v202 = (void *)objc_claimAutoreleasedReturnValue();

                                          objc_msgSend(v426, "externalIdentifier");
                                          v203 = (void *)objc_claimAutoreleasedReturnValue();

                                          if (v202)
                                          {
                                            v120 = &off_1E3CBB000;
                                            if (!v203)
                                            {
                                              ne_log_obj();
                                              v176 = objc_claimAutoreleasedReturnValue();
                                              if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                                              {
                                                objc_msgSend(v149, "name");
                                                v204 = (void *)objc_claimAutoreleasedReturnValue();
                                                *(_DWORD *)v456 = 136315394;
                                                v457 = "+[NEConfigurationManager configuration:overlapsWithOtherConfigura"
                                                       "tion:sameTypeCount:perAppCount:]";
                                                v458 = 2112;
                                                v459 = v204;
                                                _os_log_impl(&dword_19BD16000, v176, OS_LOG_TYPE_DEFAULT, "%s: Concurrent perApp and system DNS Proxy not allowed, %@ superceded", v456, 0x16u);

                                                v120 = &off_1E3CBB000;
                                              }
                                              v118 = v407;
LABEL_221:

LABEL_314:
                                              goto LABEL_159;
                                            }
LABEL_223:
                                            objc_msgSend(v149, "dnsSettings");
                                            v205 = objc_claimAutoreleasedReturnValue();
                                            if (v205)
                                            {
                                              v206 = (void *)v205;
                                              objc_msgSend(v149, "dnsSettings");
                                              v207 = (void *)objc_claimAutoreleasedReturnValue();
                                              if (!objc_msgSend(v207, "isEnabled"))
                                                goto LABEL_239;
                                              objc_msgSend(v426, "dnsSettings");
                                              v208 = objc_claimAutoreleasedReturnValue();
                                              if (!v208)
                                                goto LABEL_238;
                                              v209 = (void *)v208;
                                              objc_msgSend(v426, "dnsSettings");
                                              v210 = (void *)objc_claimAutoreleasedReturnValue();
                                              v389 = objc_msgSend(v210, "isEnabled");

                                              a1 = v409;
                                              v120 = &off_1E3CBB000;
                                              if (v389)
                                              {
                                                objc_msgSend(v149, "dnsSettings");
                                                v206 = (void *)objc_claimAutoreleasedReturnValue();
                                                objc_msgSend(v206, "settings");
                                                v207 = (void *)objc_claimAutoreleasedReturnValue();
                                                objc_msgSend(v426, "dnsSettings");
                                                v352 = (void *)objc_claimAutoreleasedReturnValue();
                                                objc_msgSend(v352, "settings");
                                                v390 = (id)objc_claimAutoreleasedReturnValue();
                                                if (v207)
                                                {
                                                  objc_msgSend(v207, "matchDomains");
                                                  v211 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v356 = objc_msgSend(v211, "count");

                                                  objc_msgSend(v390, "matchDomains");
                                                  v363 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v212 = objc_msgSend(v363, "count");

                                                  v364 = v212;
                                                  if (!(v356 | v212))
                                                  {
LABEL_313:

                                                    v282 = objc_msgSend(v426, "grade");
                                                    v118 = v407;
                                                    v120 = &off_1E3CBB000;
                                                    if (v282 >= objc_msgSend(v149, "grade"))
                                                      goto LABEL_326;
                                                    goto LABEL_314;
                                                  }
                                                  if (v356 && v212)
                                                  {
                                                    v213 = 0;
                                                    v344 = v206;
                                                    v348 = v207;
                                                    while (2)
                                                    {
                                                      objc_msgSend(v207, "matchDomains");
                                                      v214 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v342 = v213;
                                                      objc_msgSend(v214, "objectAtIndexedSubscript:", v213);
                                                      v215 = (void *)objc_claimAutoreleasedReturnValue();

                                                      v216 = 0;
                                                      do
                                                      {
                                                        objc_msgSend(v390, "matchDomains");
                                                        v217 = (void *)objc_claimAutoreleasedReturnValue();
                                                        objc_msgSend(v217, "objectAtIndexedSubscript:", v216);
                                                        v218 = (void *)objc_claimAutoreleasedReturnValue();

                                                        if ((objc_msgSend(v215, "hasSuffix:", v218) & 1) != 0
                                                          || (objc_msgSend(v218, "hasSuffix:", v215) & 1) != 0)
                                                        {

                                                          a1 = v409;
                                                          v206 = v344;
                                                          v207 = v348;
                                                          goto LABEL_313;
                                                        }

                                                        ++v216;
                                                      }
                                                      while (v364 != v216);

                                                      v213 = v342 + 1;
                                                      v206 = v344;
                                                      v207 = v348;
                                                      if (v342 + 1 != v356)
                                                        continue;
                                                      break;
                                                    }
                                                  }
                                                }

LABEL_238:
                                                v120 = &off_1E3CBB000;
LABEL_239:

                                              }
                                            }
                                            objc_msgSend(v149, "externalIdentifier");
                                            v219 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (!v219)
                                            {
                                              objc_msgSend(v149, "dnsProxy");
                                              v220 = objc_claimAutoreleasedReturnValue();
                                              if (!v220)
                                                goto LABEL_248;
                                              v219 = (void *)v220;
                                              objc_msgSend(v149, "dnsProxy");
                                              v221 = (void *)objc_claimAutoreleasedReturnValue();
                                              if (objc_msgSend(v221, "isEnabled"))
                                              {
                                                objc_msgSend(v426, "dnsSettings");
                                                v222 = objc_claimAutoreleasedReturnValue();
                                                if (v222)
                                                {
                                                  v223 = (void *)v222;
                                                  objc_msgSend(v426, "dnsSettings");
                                                  v224 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v391 = objc_msgSend(v224, "isEnabled");

                                                  a1 = v409;
                                                  v120 = &off_1E3CBB000;
                                                  if ((v391 & 1) != 0)
                                                    goto LABEL_307;
LABEL_248:
                                                  objc_msgSend(v426, "externalIdentifier");
                                                  v225 = (void *)objc_claimAutoreleasedReturnValue();
                                                  if (!v225)
                                                  {
                                                    objc_msgSend(v426, "dnsProxy");
                                                    v226 = objc_claimAutoreleasedReturnValue();
                                                    if (!v226)
                                                      goto LABEL_256;
                                                    v225 = (void *)v226;
                                                    objc_msgSend(v426, "dnsProxy");
                                                    v227 = (void *)objc_claimAutoreleasedReturnValue();
                                                    if (objc_msgSend(v227, "isEnabled"))
                                                    {
                                                      objc_msgSend(v149, "dnsSettings");
                                                      v228 = objc_claimAutoreleasedReturnValue();
                                                      if (v228)
                                                      {
                                                        v229 = (void *)v228;
                                                        objc_msgSend(v149, "dnsSettings");
                                                        v230 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v392 = objc_msgSend(v230, "isEnabled");

                                                        a1 = v409;
                                                        v120 = &off_1E3CBB000;
                                                        if ((v392 & 1) != 0)
                                                          goto LABEL_307;
LABEL_256:
                                                        objc_msgSend(v149, "appPush");
                                                        v231 = objc_claimAutoreleasedReturnValue();
                                                        if (!v231)
                                                          goto LABEL_265;
                                                        v232 = (void *)v231;
                                                        objc_msgSend(v149, "appPush");
                                                        v233 = (void *)objc_claimAutoreleasedReturnValue();
                                                        if (objc_msgSend(v233, "isEnabled"))
                                                        {
                                                          objc_msgSend(v426, "appPush");
                                                          v234 = objc_claimAutoreleasedReturnValue();
                                                          if (v234)
                                                          {
                                                            v393 = (id)v234;
                                                            objc_msgSend(v426, "appPush");
                                                            v365 = (void *)objc_claimAutoreleasedReturnValue();
                                                            if (objc_msgSend(v365, "isEnabled"))
                                                            {
                                                              objc_msgSend(v149, "appPush");
                                                              v357 = (void *)objc_claimAutoreleasedReturnValue();
                                                              objc_msgSend(v357, "pluginType");
                                                              v345 = (void *)objc_claimAutoreleasedReturnValue();
                                                              objc_msgSend(v426, "appPush");
                                                              v349 = (void *)objc_claimAutoreleasedReturnValue();
                                                              objc_msgSend(v349, "pluginType");
                                                              v235 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v353 = objc_msgSend(v345, "isEqualToString:", v235);

                                                              v120 = &off_1E3CBB000;
                                                              if (v353)
                                                              {
                                                                objc_msgSend(v149, "appPush");
                                                                v236 = (void *)objc_claimAutoreleasedReturnValue();
                                                                objc_msgSend(v426, "appPush");
                                                                v237 = (void *)objc_claimAutoreleasedReturnValue();
                                                                v238 = objc_msgSend(v236, "overlapsWithConfiguration:", v237);

                                                                v120 = &off_1E3CBB000;
                                                                if ((v238 & 1) != 0)
                                                                {
                                                                  a1 = v409;
LABEL_307:
                                                                  v118 = v407;
                                                                  goto LABEL_326;
                                                                }
                                                              }
LABEL_265:
                                                              objc_msgSend(v149, "relay");
                                                              v239 = objc_claimAutoreleasedReturnValue();
                                                              if (v239)
                                                              {
                                                                v240 = (void *)v239;
                                                                objc_msgSend(v149, "relay");
                                                                v241 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if (objc_msgSend(v241, "isEnabled")
                                                                  && (objc_msgSend(v426, "relay"),
                                                                      (v242 = objc_claimAutoreleasedReturnValue()) != 0))
                                                                {
                                                                  v243 = (void *)v242;
                                                                  objc_msgSend(v426, "relay");
                                                                  v244 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v394 = objc_msgSend(v244, "isEnabled");

                                                                  v120 = &off_1E3CBB000;
                                                                  if (v394)
                                                                  {
                                                                    objc_msgSend(v149, "relay");
                                                                    v245 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    objc_msgSend(v426, "relay");
                                                                    v246 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v247 = objc_msgSend(v245, "overlapsWithRelayConfiguration:", v246);

                                                                    v120 = &off_1E3CBB000;
                                                                    if (v247)
                                                                    {
                                                                      v248 = objc_msgSend(v426, "grade");
                                                                      if (v248 < objc_msgSend(v149, "grade"))
                                                                      {
                                                                        a1 = v409;
                                                                        v118 = v407;
                                                                        goto LABEL_314;
                                                                      }
                                                                      objc_msgSend(v426, "payloadInfo");
                                                                      v283 = objc_claimAutoreleasedReturnValue();
                                                                      a1 = v409;
                                                                      v118 = v407;
                                                                      if (-[NSObject profileSource](v283, "profileSource") == 2)
                                                                      {
                                                                        objc_msgSend(v149, "payloadInfo");
                                                                        v284 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v399 = (id)objc_msgSend(v284, "profileSource");

                                                                        v120 = &off_1E3CBB000;
                                                                        if (v399 == (id)2)
                                                                        {
LABEL_326:
                                                                          v148 = a1;

LABEL_154:
                                                                          v40 = v416;
                                                                          +[NEConfigurationManager disableConfiguration:onDemandOnly:]((uint64_t)v120[224], v426);
                                                                          objc_msgSend(obja, "objectForKeyedSubscript:", v143);
                                                                          v156 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v157 = (void *)objc_msgSend(v156, "mutableCopy");

                                                                          objc_msgSend(v426, "generateSignature");
                                                                          v158 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          objc_msgSend(v157, "setObject:forKeyedSubscript:", v158, CFSTR("Signature"));

                                                                          objc_msgSend(v411, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
                                                                          v159 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          objc_msgSend(v159, "setObject:forKeyedSubscript:", v157, v143);

                                                                          if (a3)
                                                                          {
                                                                            v120 = &off_1E3CBB000;
                                                                            if (-[NEConfiguration isSupportedBySC](v426))
                                                                            {
                                                                              if ((-[NEConfiguration applyChangesToSCServiceInPreferences:](v426, a3) & 1) == 0)
                                                                              {
                                                                                v323 = (void *)MEMORY[0x1E0CB3940];
                                                                                v324 = SCError();
                                                                                objc_msgSend(v323, "stringWithCString:encoding:", SCErrorString(v324), 4);
                                                                                v325 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                -[NEConfigurationManager errorWithCode:specifics:](v148, 12, v325);
                                                                                v34 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                v36 = 0;
                                                                                v33 = v375;
                                                                                v41 = v376;
                                                                                v35 = v382;
                                                                                goto LABEL_371;
                                                                              }
                                                                              v371 = 1;
                                                                            }
                                                                            v425 = 1;
                                                                          }
                                                                          else
                                                                          {
                                                                            v425 = 1;
                                                                            v120 = &off_1E3CBB000;
                                                                          }
                                                                          a1 = v148;
                                                                          v141 = v419;
                                                                          goto LABEL_170;
                                                                        }
                                                                        goto LABEL_314;
                                                                      }
                                                                      v362 = v283;
LABEL_325:

                                                                      goto LABEL_326;
                                                                    }
                                                                  }
                                                                }
                                                                else
                                                                {

                                                                  v120 = &off_1E3CBB000;
                                                                }
                                                              }
                                                              v249 = objc_msgSend(v149, "grade");
                                                              a1 = v409;
                                                              if (v249 != objc_msgSend(v426, "grade"))
                                                                goto LABEL_310;
                                                              objc_msgSend(v149, "relay");
                                                              v250 = objc_claimAutoreleasedReturnValue();
                                                              if (!v250)
                                                                goto LABEL_283;
                                                              v251 = (void *)v250;
                                                              objc_msgSend(v149, "relay");
                                                              v252 = (void *)objc_claimAutoreleasedReturnValue();
                                                              if (objc_msgSend(v252, "isEnabled"))
                                                              {
                                                                objc_msgSend(v426, "VPN");
                                                                v253 = objc_claimAutoreleasedReturnValue();
                                                                if (v253)
                                                                {
                                                                  v395 = (id)v253;
                                                                  objc_msgSend(v426, "VPN");
                                                                  v254 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  if (objc_msgSend(v254, "isEnabled"))
                                                                  {
                                                                    objc_msgSend(v149, "relay");
                                                                    v255 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    objc_msgSend(v426, "VPN");
                                                                    v256 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v366 = objc_msgSend(v255, "overlapsWithVPNConfiguration:", v256);

                                                                    a1 = v409;
                                                                    v120 = &off_1E3CBB000;
                                                                    v141 = v419;
                                                                    if ((v366 & 1) != 0)
                                                                      goto LABEL_307;
LABEL_283:
                                                                    objc_msgSend(v149, "VPN");
                                                                    v257 = objc_claimAutoreleasedReturnValue();
                                                                    if (v257)
                                                                    {
                                                                      v258 = (void *)v257;
                                                                      objc_msgSend(v149, "VPN");
                                                                      v259 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      if (objc_msgSend(v259, "isEnabled"))
                                                                      {
                                                                        objc_msgSend(v426, "relay");
                                                                        v260 = objc_claimAutoreleasedReturnValue();
                                                                        if (v260)
                                                                        {
                                                                          v396 = (id)v260;
                                                                          objc_msgSend(v426, "relay");
                                                                          v261 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          if (objc_msgSend(v261, "isEnabled"))
                                                                          {
                                                                            objc_msgSend(v426, "relay");
                                                                            v262 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            objc_msgSend(v149, "VPN");
                                                                            v263 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v367 = objc_msgSend(v262, "overlapsWithVPNConfiguration:", v263);

                                                                            a1 = v409;
                                                                            v120 = &off_1E3CBB000;
                                                                            v141 = v419;
                                                                            if ((v367 & 1) != 0)
                                                                              goto LABEL_307;
                                                                            goto LABEL_294;
                                                                          }

                                                                          v120 = &off_1E3CBB000;
                                                                          v141 = v419;
                                                                        }
                                                                      }

                                                                    }
LABEL_294:
                                                                    objc_msgSend(v149, "relay");
                                                                    v268 = objc_claimAutoreleasedReturnValue();
                                                                    if (v268)
                                                                    {
                                                                      v269 = (void *)v268;
                                                                      objc_msgSend(v149, "relay");
                                                                      v270 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      if (objc_msgSend(v270, "isEnabled"))
                                                                      {
                                                                        objc_msgSend(v426, "appVPN");
                                                                        v271 = objc_claimAutoreleasedReturnValue();
                                                                        if (v271)
                                                                        {
                                                                          v397 = (id)v271;
                                                                          objc_msgSend(v426, "appVPN");
                                                                          v272 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          if (objc_msgSend(v272, "isEnabled"))
                                                                          {
                                                                            objc_msgSend(v149, "relay");
                                                                            v273 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            objc_msgSend(v426, "appVPN");
                                                                            v274 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v368 = objc_msgSend(v273, "overlapsWithAppVPNConfiguration:", v274);

                                                                            a1 = v409;
                                                                            v120 = &off_1E3CBB000;
                                                                            v141 = v419;
                                                                            if ((v368 & 1) != 0)
                                                                              goto LABEL_307;
                                                                            goto LABEL_302;
                                                                          }

                                                                          v120 = &off_1E3CBB000;
                                                                          v141 = v419;
                                                                        }
                                                                      }

                                                                    }
LABEL_302:
                                                                    objc_msgSend(v149, "appVPN");
                                                                    v275 = objc_claimAutoreleasedReturnValue();
                                                                    if (v275)
                                                                    {
                                                                      v276 = (void *)v275;
                                                                      objc_msgSend(v149, "appVPN");
                                                                      v277 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      if (objc_msgSend(v277, "isEnabled"))
                                                                      {
                                                                        objc_msgSend(v426, "relay");
                                                                        v278 = objc_claimAutoreleasedReturnValue();
                                                                        if (v278)
                                                                        {
                                                                          v398 = (id)v278;
                                                                          objc_msgSend(v426, "relay");
                                                                          v279 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          if (objc_msgSend(v279, "isEnabled"))
                                                                          {
                                                                            objc_msgSend(v426, "relay");
                                                                            v280 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            objc_msgSend(v149, "appVPN");
                                                                            v281 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v369 = objc_msgSend(v280, "overlapsWithAppVPNConfiguration:", v281);

                                                                            a1 = v409;
                                                                            v120 = &off_1E3CBB000;
                                                                            v141 = v419;
                                                                            if ((v369 & 1) != 0)
                                                                              goto LABEL_307;
                                                                            goto LABEL_310;
                                                                          }

                                                                          v120 = &off_1E3CBB000;
                                                                          v141 = v419;
                                                                        }
                                                                      }

                                                                    }
LABEL_310:

                                                                    v425 = 1;
                                                                    v118 = v407;
                                                                    v40 = v416;
                                                                    goto LABEL_171;
                                                                  }

                                                                  v120 = &off_1E3CBB000;
                                                                  a1 = v409;
                                                                  v141 = v419;
                                                                }
                                                              }

                                                              goto LABEL_283;
                                                            }

                                                          }
                                                        }

                                                        goto LABEL_265;
                                                      }
                                                    }

                                                    v120 = &off_1E3CBB000;
                                                  }

                                                  goto LABEL_256;
                                                }
                                              }

                                              v120 = &off_1E3CBB000;
                                            }

                                            goto LABEL_248;
                                          }
                                          ne_log_obj();
                                          v362 = objc_claimAutoreleasedReturnValue();
                                          v264 = os_log_type_enabled(v362, OS_LOG_TYPE_DEFAULT);
                                          v118 = v407;
                                          v120 = &off_1E3CBB000;
                                          if (v203)
                                          {
                                            if (!v264)
                                              goto LABEL_325;
                                            objc_msgSend(v149, "name");
                                            v265 = (void *)objc_claimAutoreleasedReturnValue();
                                            *(_DWORD *)v456 = 136315394;
                                            v457 = "+[NEConfigurationManager configuration:overlapsWithOtherConfiguration"
                                                   ":sameTypeCount:perAppCount:]";
                                            v458 = 2112;
                                            v459 = v265;
                                            v266 = v362;
                                            v267 = "%s: Concurrent perApp and system DNS Proxy not allowed, %@ supercedes";
                                          }
                                          else
                                          {
                                            if (!v264)
                                              goto LABEL_325;
                                            objc_msgSend(v149, "name");
                                            v265 = (void *)objc_claimAutoreleasedReturnValue();
                                            *(_DWORD *)v456 = 136315394;
                                            v457 = "+[NEConfigurationManager configuration:overlapsWithOtherConfiguration"
                                                   ":sameTypeCount:perAppCount:]";
                                            v458 = 2112;
                                            v459 = v265;
                                            v266 = v362;
                                            v267 = "%s: Only one system DNS Proxy is allowed, %@ supercedes";
                                          }
LABEL_323:
                                          _os_log_impl(&dword_19BD16000, v266, OS_LOG_TYPE_DEFAULT, v267, v456, 0x16u);

                                          goto LABEL_325;
                                        }
                                      }
                                      else
                                      {
                                        objc_msgSend(v149, "externalIdentifier");
                                        v285 = (void *)objc_claimAutoreleasedReturnValue();

                                        v118 = v407;
                                        if (!v285)
                                        {
                                          a1 = v148;
                                          ne_log_obj();
                                          v286 = objc_claimAutoreleasedReturnValue();
                                          v362 = v286;
                                          if (!os_log_type_enabled(v286, OS_LOG_TYPE_DEFAULT))
                                            goto LABEL_325;
                                          objc_msgSend(v149, "name");
                                          v265 = (void *)objc_claimAutoreleasedReturnValue();
                                          *(_DWORD *)v456 = 136315394;
                                          v457 = "+[NEConfigurationManager configuration:overlapsWithOtherConfiguration:s"
                                                 "ameTypeCount:perAppCount:]";
                                          v458 = 2112;
                                          v459 = v265;
                                          v266 = v286;
                                          v267 = "%s: Only one system Content Filter is allowed, %@ supercedes";
                                          goto LABEL_323;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      v120 = &off_1E3CBB000;
                                    }
LABEL_189:
                                    v141 = v419;
                                    goto LABEL_190;
                                  }

                                }
                              }

                              goto LABEL_189;
                            }
LABEL_173:
                            ++v142;
                          }
                          while (v142 != v140);
                          v287 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v431, v442, 16);
                          v140 = v287;
                          if (!v287)
                          {
LABEL_338:

                            v288 = v371 & 1;
                            goto LABEL_339;
                          }
                        }
                      }
                      v288 = 0;
LABEL_339:
                      objc_msgSend(v422, "addObject:", v118);
                      objc_msgSend(v118, "identifier");
                      v297 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v297, "UUIDString");
                      v298 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "encodeObject:forKey:", v118, v298);

                      +[NEConfigurationManager updateFlags:withConfiguration:]((uint64_t)v120[224], (unint64_t *)&v436, v118);
                      objc_msgSend(v40, "encodeObject:forKey:", v411, CFSTR("Index"));
                      v299 = -[NEConfiguration isSupportedBySC](v118);
                      v301 = a3;
                      if (a3 && v299)
                      {
                        v33 = v375;
                        v41 = v376;
                        v35 = v382;
                        if ((-[NEConfiguration applyChangesToSCServiceInPreferences:](v118, a3) & 1) == 0)
                        {
                          v302 = (void *)MEMORY[0x1E0CB3940];
                          v303 = SCError();
                          objc_msgSend(v302, "stringWithCString:encoding:", SCErrorString(v303), 4);
                          v304 = (void *)objc_claimAutoreleasedReturnValue();
                          -[NEConfigurationManager errorWithCode:specifics:](a1, 12, v304);
                          v34 = (void *)objc_claimAutoreleasedReturnValue();

                          v36 = 0;
LABEL_371:
                          v43 = v411;
                          v37 = (void *)v402;
                          v39 = v404;
                          v42 = v370;
                          goto LABEL_372;
                        }
LABEL_344:
                        if (SCPreferencesCommitChanges(a3))
                        {
                          if (!SCPreferencesApplyChanges(a3))
                          {
                            ne_log_obj();
                            v306 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v306, OS_LOG_TYPE_ERROR))
                            {
                              objc_msgSend(v118, "name");
                              v339 = (void *)objc_claimAutoreleasedReturnValue();
                              v340 = SCError();
                              v341 = SCErrorString(v340);
                              *(_DWORD *)v447 = 138412802;
                              v448 = (const char *)a1;
                              v449 = 2112;
                              v450 = v339;
                              v451 = 2080;
                              v452 = v341;
                              _os_log_error_impl(&dword_19BD16000, v306, OS_LOG_TYPE_ERROR, "%@: SCPreferencesApplyChanges failed with configuration %@: %s", v447, 0x20u);

                            }
                            v301 = a3;
                          }
                          if (objc_getProperty((id)a1, v305, 120, 1))
                          {
                            Signature = SCPreferencesGetSignature(v301);
                            objc_setProperty_atomic((id)a1, v308, Signature, 120);
                          }
                          goto LABEL_351;
                        }
                        v319 = (void *)MEMORY[0x1E0CB3940];
                        v320 = SCError();
                        objc_msgSend(v319, "stringWithCString:encoding:", SCErrorString(v320), 4);
                        v321 = (char *)objc_claimAutoreleasedReturnValue();
                        ne_log_obj();
                        v322 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v322, OS_LOG_TYPE_ERROR))
                        {
                          objc_msgSend(v118, "name");
                          v337 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v447 = 138412802;
                          v448 = (const char *)a1;
                          v449 = 2112;
                          v450 = v337;
                          v451 = 2112;
                          v452 = v321;
                          _os_log_error_impl(&dword_19BD16000, v322, OS_LOG_TYPE_ERROR, "%@: SCPreferencesCommitChanges failed with configuration %@: %@", v447, 0x20u);

                        }
                        -[NEConfigurationManager errorWithCode:specifics:](a1, 12, v321);
                        v34 = (void *)objc_claimAutoreleasedReturnValue();

                        v36 = 0;
                      }
                      else
                      {
                        v41 = v376;
                        if (v288)
                          goto LABEL_344;
LABEL_351:
                        objc_msgSend(v40, "encodeObject:forKey:", objc_getProperty((id)a1, v300, 120, 1), CFSTR("SCPreferencesSignature2"));
                        objc_msgSend(v40, "finishEncoding");
                        objc_msgSend(v40, "encodedData");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((unint64_t)objc_msgSend(v36, "length") <= 0x200000)
                        {
                          v377 = v41;
                          if ((objc_msgSend(v36, "writeToFile:atomically:", CFSTR("/Library/Preferences/com.apple.networkextension.plist"), 1) & 1) != 0)
                          {
                            objc_setProperty_atomic((id)a1, v310, 0, 80);
                            objc_setProperty_atomic((id)a1, v311, 0, 88);
                            *(_QWORD *)(a1 + 104) = v358;
                            v43 = v411;
                            v312 = (void *)objc_msgSend(v411, "copy");
                            objc_setProperty_atomic((id)a1, v313, v312, 56);

                            v429 = 0u;
                            v430 = 0u;
                            v427 = 0u;
                            v428 = 0u;
                            v314 = v422;
                            v315 = objc_msgSend(v314, "countByEnumeratingWithState:objects:count:", &v427, v441, 16);
                            v42 = v370;
                            if (v315)
                            {
                              v316 = v315;
                              v317 = *(_QWORD *)v428;
                              do
                              {
                                for (j = 0; j != v316; ++j)
                                {
                                  if (*(_QWORD *)v428 != v317)
                                    objc_enumerationMutation(v314);
                                  -[NEConfigurationManager didLoadConfiguration:]((void *)a1, *(void **)(*((_QWORD *)&v427 + 1) + 8 * j));
                                }
                                v316 = objc_msgSend(v314, "countByEnumeratingWithState:objects:count:", &v427, v441, 16);
                              }
                              while (v316);
                            }
                            v38 = v314;

                            if (v400)
                              -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:]((_DWORD *)a1, v358, v436, 0);
                            v34 = 0;
                            v33 = v375;
                            v35 = v382;
                            v37 = (void *)v402;
                            v39 = v404;
                            v40 = v416;
                          }
                          else
                          {
                            ne_log_obj();
                            v326 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v326, OS_LOG_TYPE_ERROR))
                            {
                              objc_msgSend(v118, "name");
                              v338 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)v447 = 138412802;
                              v448 = (const char *)a1;
                              v449 = 2112;
                              v450 = v338;
                              v451 = 2080;
                              v452 = "/Library/Preferences/com.apple.networkextension.plist";
                              _os_log_error_impl(&dword_19BD16000, v326, OS_LOG_TYPE_ERROR, "%@: Cannot save configuration %@, failed to write to %s", v447, 0x20u);

                            }
                            -[NEConfigurationManager errorWithCode:specifics:](a1, 6, 0);
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            v33 = v375;
                            v35 = v382;
                            v43 = v411;
                            v37 = (void *)v402;
                            v39 = v404;
                            v42 = v370;
                            v40 = v416;
                            v38 = v422;
                          }
                          v41 = v377;
                          goto LABEL_115;
                        }
                        ne_log_obj();
                        v309 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v309, OS_LOG_TYPE_ERROR))
                        {
                          objc_msgSend(v118, "name");
                          v335 = (void *)objc_claimAutoreleasedReturnValue();
                          v336 = objc_msgSend(v36, "length");
                          *(_DWORD *)v447 = 138412802;
                          v448 = (const char *)a1;
                          v449 = 2112;
                          v450 = v335;
                          v451 = 2048;
                          v452 = (const char *)v336;
                          _os_log_error_impl(&dword_19BD16000, v309, OS_LOG_TYPE_ERROR, "%@: Cannot save configuration %@, the total size of the NetworkExtension configuration is too large (%lu bytes)", v447, 0x20u);

                        }
                        -[NEConfigurationManager errorWithCode:specifics:](a1, 20, 0);
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      v33 = v375;
                      v35 = v382;
                      v43 = v411;
                      v37 = (void *)v402;
                      v39 = v404;
                      v42 = v370;
                      v40 = v416;
LABEL_372:
                      v38 = v422;
                      goto LABEL_115;
                    }
                    if (v16)
                    {
                      objc_msgSend(v370, "objectForKeyedSubscript:", CFSTR("PluginType"));
                      v289 = objc_claimAutoreleasedReturnValue();
                      if (!v289
                        || (v290 = (void *)v289,
                            objc_msgSend(v370, "objectForKeyedSubscript:", CFSTR("PluginType")),
                            v291 = (void *)objc_claimAutoreleasedReturnValue(),
                            v292 = objc_msgSend(v16, "isEqualToString:", v291),
                            v291,
                            v290,
                            (v292 & 1) == 0))
                      {
                        v33 = v13;
                        v327 = a1;
                        v328 = 3;
                        goto LABEL_390;
                      }
                    }
                    objc_msgSend(v407, "applicationIdentifier");
                    v293 = objc_claimAutoreleasedReturnValue();
                    if (!v293)
                      goto LABEL_118;
                    v294 = (void *)v293;
                    objc_msgSend(v370, "objectForKeyedSubscript:", CFSTR("ApplicationID"));
                    v295 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v295)
                    {
                      objc_msgSend(v407, "applicationIdentifier");
                      v296 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v370, "objectForKeyedSubscript:", CFSTR("ApplicationID"));
                      a1 = objc_claimAutoreleasedReturnValue();
                      if ((-[__objc2_class isEqualToString:](v296, "isEqualToString:", a1) & 1) != 0)
                      {

                        a1 = v409;
                        goto LABEL_118;
                      }
                      obj = v296;
                      if (!v16)
                        goto LABEL_387;
LABEL_381:
                      objc_msgSend(v370, "objectForKeyedSubscript:", CFSTR("PluginType"));
                      v329 = objc_claimAutoreleasedReturnValue();
                      if (v329)
                      {
                        v330 = (void *)v329;
                        v331 = v16;
                        objc_msgSend(v370, "objectForKeyedSubscript:", CFSTR("PluginType"));
                        v332 = (void *)objc_claimAutoreleasedReturnValue();
                        v333 = v331;
                        v334 = objc_msgSend(v331, "isEqualToString:", v332);

                        if (v295)
                        {

                        }
                        v16 = v333;
                        a1 = v409;
                        v35 = v381;
                        v13 = v112;
                        if ((v334 & 1) != 0)
                          goto LABEL_118;
LABEL_389:
                        v33 = v13;
                        v327 = a1;
                        v328 = 4;
LABEL_390:
                        -[NEConfigurationManager errorWithCode:specifics:](v327, v328, 0);
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = 0;
                        v38 = 0;
                        v39 = 0;
                        v40 = 0;
                        v41 = v376;
LABEL_391:
                        v43 = v411;
                        v37 = (void *)v402;
                        v42 = v370;
                        goto LABEL_115;
                      }
                      if (v295)
                      {
LABEL_387:

                      }
                    }
                    else if (v16)
                    {
                      goto LABEL_381;
                    }

                    a1 = v409;
                    goto LABEL_389;
                  }
                }
                v33 = v13;
                -[NEConfigurationManager errorWithCode:specifics:](a1, 5, 0);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = 0;
                v38 = 0;
                v39 = 0;
                v40 = 0;
              }
              else
              {
                v370 = 0;
                v376 = v41;
                if (!v13)
                  goto LABEL_118;
                v33 = v13;
                -[NEConfigurationManager errorWithCode:specifics:](a1, 5, 0);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = 0;
                v38 = 0;
                v39 = 0;
                v40 = 0;
                v42 = 0;
              }
              v43 = v411;
              v37 = (void *)v402;
              goto LABEL_115;
            }
          }
        }
        v59 = a7;
        objc_msgSend(v46, "appVPN");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_61:
        v64 = v60;
        objc_msgSend(v60, "protocol");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        a7 = v59;
        if (v65)
        {
          objc_msgSend(v65, "passwordKeychainItem");
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            objc_msgSend(v65, "passwordKeychainItem");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "setIdentifier:", 0);

          }
          v68 = objc_msgSend(v65, "type");
          if (v68 != 1 && v68 != 2)
          {
            if (v68 != 5)
            {
LABEL_75:

              goto LABEL_100;
            }
            v414 = a7;
            objc_msgSend(v65, "ppkConfiguration");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v69;
            if (v69)
              v69 = objc_getProperty(v69, v70, 32, 1);
            v72 = v69;

            a7 = v414;
            if (v72)
            {
              objc_msgSend(v65, "ppkConfiguration");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v73;
              if (v73)
                v73 = objc_getProperty(v73, v74, 32, 1);
              v76 = v73;
              objc_msgSend(v76, "setIdentifier:", 0);

              a7 = v414;
            }
          }
          objc_msgSend(v65, "sharedSecretKeychainItem");
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (v77)
          {
            objc_msgSend(v65, "sharedSecretKeychainItem");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setIdentifier:", 0);

          }
          goto LABEL_75;
        }
        goto LABEL_76;
      }
    }
    else
    {

      a1 = v409;
    }
    v59 = a7;
    objc_msgSend(v46, "VPN");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_61;
  }
  v33 = v13;
  -[NEConfigurationManager errorWithCode:specifics:](a1, 10, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  v43 = 0;
LABEL_115:

LABEL_116:
  return v34;
}

- (id)makeMutableCopyOfIndex:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_19;
  if ((isa_nsdictionary(v3) & 1) == 0)
  {
    a1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = 0;
    v5 = 0;
LABEL_7:
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a1 = (id)objc_msgSend(v4, "mutableCopy");
  if (!v5 || !isa_nsdictionary(v5))
    goto LABEL_7;
  v7 = (id)objc_msgSend(v5, "mutableCopy");
LABEL_8:
  v8 = v7;
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, CFSTR("ConfigurationProperties"));

  v9 = isa_nsdictionary(v6);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v9)
  {
    v20 = v6;
    v21 = v5;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v16, v20, v21, (_QWORD)v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v17, "mutableCopy");
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    objc_msgSend(a1, "setObject:forKeyedSubscript:", v10, CFSTR("UserMap"));
    v6 = v20;
    v5 = v21;
  }
  else
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v10, CFSTR("UserMap"));

  }
LABEL_19:

  return a1;
}

+ (void)disableConfiguration:(uint64_t)a1 onDemandOnly:(void *)a2
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  id v18;

  v18 = a2;
  objc_opt_self();
  objc_msgSend(v18, "VPN");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v18, "VPN");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnabled:", 0);

  }
  objc_msgSend(v18, "appVPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v18, "appVPN");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);

  }
  objc_msgSend(v18, "alwaysOnVPN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v18, "alwaysOnVPN");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 0);

  }
  objc_msgSend(v18, "contentFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v18, "contentFilter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 0);

  }
  objc_msgSend(v18, "dnsProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v18, "dnsProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 0);

  }
  objc_msgSend(v18, "dnsSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v18, "dnsSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", 0);

  }
  objc_msgSend(v18, "appPush");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v18, "appPush");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", 0);

  }
  objc_msgSend(v18, "relay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v18, "relay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnabled:", 0);

  }
}

+ (void)updateFlags:(void *)a3 withConfiguration:
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  id v60;

  v60 = a3;
  objc_opt_self();
  objc_msgSend(v60, "VPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v60;
  if (!v5)
    goto LABEL_13;
  objc_msgSend(v60, "VPN");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEnabled") & 1) == 0)
  {
LABEL_12:

    v6 = v60;
    goto LABEL_13;
  }
  objc_msgSend(v60, "VPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isOnDemandEnabled");
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v60, "VPN");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isDisconnectOnDemandEnabled"))
    {

      goto LABEL_12;
    }
  }
  objc_msgSend(v60, "VPN");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "onDemandRules");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v9 & 1) == 0)
  v6 = v60;
  if (v11)
  {
    *a2 |= 0x8000000000000000;
    objc_msgSend(v60, "VPN");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isOnDemandEnabled");

    v6 = v60;
    if (v13)
    {
      objc_msgSend(v60, "VPN");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "onDemandRules");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", &__block_literal_global_73);

      v6 = v60;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        *a2 |= 0x40000000000000uLL;
    }
  }
LABEL_13:
  objc_msgSend(v6, "VPN");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v60, "VPN");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEnabled") & 1) != 0)
    {
      objc_msgSend(v60, "VPN");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "protocol");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "includeAllNetworks");

      if (v22)
        *a2 |= 0x80000000000000uLL;
    }
    else
    {

    }
  }
  objc_msgSend(v60, "appVPN");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v60;
  if (v23)
  {
    objc_msgSend(v60, "appVPN");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isEnabled") & 1) != 0)
    {
      v26 = objc_msgSend(v60, "grade");

      v24 = v60;
      if (v26 != 3)
      {
        objc_msgSend(v60, "appVPN");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "isOnDemandEnabled"))
        {

        }
        else
        {
          objc_msgSend(v60, "appVPN");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isDisconnectOnDemandEnabled");

          if ((v29 & 1) == 0)
          {
            v30 = *a2;
            goto LABEL_27;
          }
        }
        v30 = *a2 | 0x8000000000000000;
LABEL_27:
        v24 = v60;
        *a2 = v30 | 0x4000000000000000;
      }
    }
    else
    {

      v24 = v60;
    }
  }
  objc_msgSend(v24, "alwaysOnVPN");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(v60, "alwaysOnVPN");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEnabled");

    if (v34)
      *a2 |= 0x2000000000000000uLL;
  }
  objc_msgSend(v60, "dnsProxy");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    objc_msgSend(v60, "dnsProxy");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEnabled");

    if (v38)
      *a2 |= 0x800000000000000uLL;
  }
  objc_msgSend(v60, "contentFilter");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    objc_msgSend(v60, "contentFilter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isEnabled");

    if (v42)
      *a2 |= 0x1000000000000000uLL;
  }
  objc_msgSend(v60, "dnsSettings");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    objc_msgSend(v60, "dnsSettings");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isEnabled");

    if (v46)
      *a2 |= 0x200000000000000uLL;
  }
  objc_msgSend(v60, "pathController");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    objc_msgSend(v60, "pathController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v49, "isEnabled") & 1) != 0)
    {
      objc_msgSend(v60, "pathController");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "hasNonDefaultRules");

      if (v51)
        *a2 |= 0x400000000000000uLL;
    }
    else
    {

    }
  }
  objc_msgSend(v60, "appPush");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    objc_msgSend(v60, "appPush");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "isEnabled");

    if (v55)
      *a2 |= 0x100000000000000uLL;
  }
  objc_msgSend(v60, "relay");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    objc_msgSend(v60, "relay");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "isEnabled");

    if (v59)
      *a2 |= 0x20000000000000uLL;
  }

}

- (void)postChangeNotificationWithGeneration:(uint64_t)a3 andFlags:(int)a4 onlyIfChanged:
{
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint32_t v13;
  uint32_t v14;
  uint32_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  uint64_t state64;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint32_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  -[NEConfigurationManager registerForChangeNotifications](a1);
  v8 = a1[7];
  if (v8 == -1)
    return;
  if (a4)
  {
    state64 = 0;
    if (!notify_get_state(v8, &state64) && (a3 & 0xFFE0000000000000 | (unint64_t)a2) == state64)
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        return;
      }
      *(_DWORD *)buf = 134217984;
      v30 = (const char *)state64;
      v10 = "Not posting a change notification because the current notify state is equal to the new notify state (%llx)";
      v11 = v9;
      v12 = 12;
LABEL_8:
      _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_13;
    }
    v8 = a1[7];
  }
  v13 = notify_set_state(v8, a3 & 0xFFE0000000000000 | (unint64_t)a2);
  if (v13)
  {
    v14 = v13;
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v27 = a1[7];
      *(_DWORD *)buf = 136315650;
      v30 = "com.apple.neconfigurationchanged";
      v31 = 1024;
      v32 = v27;
      v33 = 1024;
      v34 = v14;
      _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "Failed to set the %s (token %u) notification state: %u", buf, 0x18u);
    }
    goto LABEL_13;
  }
  v15 = notify_post("com.apple.neconfigurationchanged");
  ne_log_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "com.apple.neconfigurationchanged";
      _os_log_fault_impl(&dword_19BD16000, v17, OS_LOG_TYPE_FAULT, "Failed to post the %s notification", buf, 0xCu);
    }

    return;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = a2;
    _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_DEFAULT, "Successfully posted generation %lld", buf, 0xCu);
  }

  if (a3 < 0)
  {
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEFAULT, "On Demand configuration is enabled", buf, 2u);
    }

    if ((a3 & 0x80000000000000) == 0)
    {
LABEL_23:
      if ((a3 & 0x4000000000000000) == 0)
        goto LABEL_24;
      goto LABEL_38;
    }
  }
  else if ((a3 & 0x80000000000000) == 0)
  {
    goto LABEL_23;
  }
  ne_log_obj();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEFAULT, "VPN IncludeAllNetworks configuration is enabled", buf, 2u);
  }

  if ((a3 & 0x4000000000000000) == 0)
  {
LABEL_24:
    if ((a3 & 0x2000000000000000) == 0)
      goto LABEL_25;
    goto LABEL_41;
  }
LABEL_38:
  ne_log_obj();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v20, OS_LOG_TYPE_DEFAULT, "App VPN configuration is enabled", buf, 2u);
  }

  if ((a3 & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((a3 & 0x800000000000000) == 0)
      goto LABEL_26;
    goto LABEL_44;
  }
LABEL_41:
  ne_log_obj();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v21, OS_LOG_TYPE_DEFAULT, "Always On VPN is enabled", buf, 2u);
  }

  if ((a3 & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((a3 & 0x200000000000000) == 0)
      goto LABEL_27;
    goto LABEL_47;
  }
LABEL_44:
  ne_log_obj();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v22, OS_LOG_TYPE_DEFAULT, "DNS proxy is enabled", buf, 2u);
  }

  if ((a3 & 0x200000000000000) == 0)
  {
LABEL_27:
    if ((a3 & 0x1000000000000000) == 0)
      goto LABEL_28;
    goto LABEL_50;
  }
LABEL_47:
  ne_log_obj();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEFAULT, "DNS settings are enabled", buf, 2u);
  }

  if ((a3 & 0x1000000000000000) == 0)
  {
LABEL_28:
    if ((a3 & 0x400000000000000) == 0)
      goto LABEL_29;
    goto LABEL_53;
  }
LABEL_50:
  ne_log_obj();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v24, OS_LOG_TYPE_DEFAULT, "Content Filter is enabled", buf, 2u);
  }

  if ((a3 & 0x400000000000000) == 0)
  {
LABEL_29:
    if ((a3 & 0x100000000000000) == 0)
      goto LABEL_30;
    goto LABEL_56;
  }
LABEL_53:
  ne_log_obj();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v25, OS_LOG_TYPE_DEFAULT, "Path Controller is enabled", buf, 2u);
  }

  if ((a3 & 0x100000000000000) == 0)
  {
LABEL_30:
    if ((a3 & 0x20000000000000) == 0)
      return;
LABEL_59:
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v10 = "Relay configuration is enabled";
    v11 = v9;
    v12 = 2;
    goto LABEL_8;
  }
LABEL_56:
  ne_log_obj();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v26, OS_LOG_TYPE_DEFAULT, "App push is enabled", buf, 2u);
  }

  if ((a3 & 0x20000000000000) != 0)
    goto LABEL_59;
}

uint64_t __56__NEConfigurationManager_updateFlags_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __81__NEConfigurationManager_handleFileRemovedWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 104);
  else
    v3 = 0;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "handleFileRemoved\n", v6, 2u);
  }
  if (v3 <= 0x1FFFFFFFFFFFFELL)
    v5 = v3 + 1;
  else
    v5 = 1;

  -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:](*(_DWORD **)(a1 + 32), (const char *)v5, 0, 0);
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
}

void __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  xpc_object_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  void *v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  void *v32;
  unsigned __int8 uuid[8];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      v30 = 2112;
      v31 = v3;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to get the configuration index while removing configuration %@: %@", buf, 0x20u);

    }
    v5 = *(_QWORD *)(a1 + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_185;
    v18[3] = &unk_1E3CC46A8;
    v6 = *(void **)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v19 = v3;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v5, v6, v18);

  }
  else
  {
    *(_QWORD *)uuid = 0;
    v34 = 0;
    v7 = xpc_dictionary_create(0, 0, 0);
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: Removing configuration %@", buf, 0x16u);

    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](v11, v13);

    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getUUIDBytes:", uuid);

    xpc_dictionary_set_int64(v7, "config-operation", 4);
    xpc_dictionary_set_uuid(v7, "config-identifier", uuid);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_183;
    v21[3] = &unk_1E3CBFD30;
    v15 = *(void **)(a1 + 40);
    v22 = *(void **)(a1 + 32);
    v23 = v15;
    v24 = *(id *)(a1 + 48);
    v25 = *(id *)(a1 + 56);
    -[NEConfigurationManager sendRequest:responseHandler:](v22, v7, v21);

  }
}

void __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_183(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a2)
    v8 = a3;
  else
    v8 = 11;
  if (v8
    && (-[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), v8, 0),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      v29 = 2112;
      v30 = v10;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "%@: Failed to remove configuration %@: %@", buf, 0x20u);

    }
  }
  else
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEFAULT, "%@: Successfully removed configuration %@", buf, 0x16u);

    }
    v15 = *(void **)(a1 + 40);
    if (v15)
      -[NEConfiguration clearKeychainInDomain:](v15, 1);
    v10 = 0;
  }
  v16 = *(_QWORD *)(a1 + 32);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_184;
  v22[3] = &unk_1E3CC46A8;
  v17 = *(void **)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v23 = v10;
  v24 = v18;
  v19 = v10;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v16, v17, v22);

}

uint64_t __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_185(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_184(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_opt_class();
      v8 = a1 + 40;
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(v8 + 8);
      v9 = v5;
      objc_msgSend(v6, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = v5;
      v13 = 2080;
      v14 = v7;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v3;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "%@ saveConfiguration: failed to remove old %s config: %@: %@", (uint8_t *)&v11, 0x2Au);

    }
  }

}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_161(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_164(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_165(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id Property;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  xpc_object_t v69;
  void *v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  _QWORD *v77;
  int64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  id obj;
  _QWORD v87[4];
  id v88;
  id v89;
  _QWORD v90[5];
  _QWORD *v91;
  id v92;
  id v93;
  _QWORD v94[5];
  id v95;
  id v96;
  _QWORD v97[5];
  id v98;
  id v99;
  _QWORD v100[5];
  id v101;
  _QWORD v102[4];
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint8_t buf[4];
  uint64_t v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  uint64_t v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v34 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v110 = v34;
      v111 = 2112;
      v112 = v35;
      v113 = 2112;
      v114 = (uint64_t)v4;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "%@: Failed to get the configuration index while saving configuration %@: %@", buf, 0x20u);

    }
    v6 = *(_QWORD *)(a1 + 32);
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_181;
    v87[3] = &unk_1E3CC46A8;
    v7 = *(void **)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    v88 = v4;
    v89 = v8;
    v9 = v4;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v6, v7, v87);

    v10 = v89;
    goto LABEL_56;
  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = -[NEConfigurationManager configurationHasChanged:](v11, v12);

  if (!(_DWORD)v11)
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v13, 80, 1);
    v20 = *(void **)(a1 + 40);
    v21 = Property;
    objc_msgSend(v20, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v22);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v110 = v24;
      v111 = 2112;
      v112 = v25;
      v113 = 2112;
      v114 = (uint64_t)v9;
      _os_log_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEFAULT, "%@ Saving configuration %@ with existing signature %@", buf, 0x20u);

    }
    v26 = *(void **)(a1 + 40);
    if (v26)
    {
      -[NEConfiguration syncWithKeychainInDomain:](v26, 1);
      v26 = *(void **)(a1 + 40);
    }
    objc_msgSend(v26, "generateSignature");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;
    if (!v9 || !objc_msgSend(v27, "isEqualToData:", v9))
      goto LABEL_40;
    v28 = *(void **)(a1 + 40);
    if (v28)
    {
      objc_msgSend(*(id *)(a1 + 40), "VPN");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_21;
      v30 = (void *)v29;
      objc_msgSend(v28, "VPN");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "protocol");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(v28, "VPN");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_21:
        objc_msgSend(v28, "appVPN");
        v36 = objc_claimAutoreleasedReturnValue();
        if (!v36)
          goto LABEL_26;
        v37 = (void *)v36;
        objc_msgSend(v28, "appVPN");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "protocol");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
LABEL_26:
          objc_msgSend(v28, "alwaysOnVPN");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            objc_msgSend(v28, "alwaysOnVPN");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "interfaceProtocolMapping");
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            obj = v45;
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v105, buf, 16);
            if (v46)
            {
              v47 = v46;
              v48 = *(_QWORD *)v106;
              while (2)
              {
                for (i = 0; i != v47; ++i)
                {
                  if (*(_QWORD *)v106 != v48)
                    objc_enumerationMutation(obj);
                  v50 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i);
                  objc_msgSend(v28, "alwaysOnVPN");
                  v51 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v51, "interfaceProtocolMapping");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "objectForKeyedSubscript:", v50);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                  LOBYTE(v51) = objc_msgSend(v53, "needToUpdateKeychain");
                  if ((v51 & 1) != 0)
                  {

                    goto LABEL_40;
                  }
                }
                v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, buf, 16);
                if (v47)
                  continue;
                break;
              }
            }

          }
          goto LABEL_36;
        }
        objc_msgSend(v28, "appVPN");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v40 = v33;
      objc_msgSend(v33, "protocol");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "needToUpdateKeychain");

      if ((v42 & 1) != 0)
      {
LABEL_40:
        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
        objc_msgSend(v60, "encodeObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("config-object"));
        objc_msgSend(v60, "finishEncoding");
        objc_msgSend(v60, "encodedData");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v63, "length") <= 0x80000)
        {
          if ((unint64_t)objc_msgSend(v63, "length") <= 0x80000)
          {
            v69 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_int64(v69, "config-operation", 3);
            xpc_dictionary_set_data(v69, "config-data", (const void *)objc_msgSend(v63, "bytes"), objc_msgSend(v63, "length"));
            if (v9)
            {
              v76 = objc_retainAutorelease(v9);
              xpc_dictionary_set_data(v69, "config-signature", (const void *)objc_msgSend(v76, "bytes"), objc_msgSend(v76, "length"));
            }
            v77 = *(_QWORD **)(a1 + 40);
            if (v77)
            {
              v78 = v77[20];
              if (v78)
              {
                xpc_dictionary_set_int64(v69, "permission-type", v78);
                v77 = *(_QWORD **)(a1 + 40);
              }
            }
            v79 = *(void **)(a1 + 32);
            v90[0] = MEMORY[0x1E0C809B0];
            v90[1] = 3221225472;
            v90[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_177;
            v90[3] = &unk_1E3CBFD30;
            v90[4] = v79;
            v91 = v77;
            v92 = *(id *)(a1 + 48);
            v93 = *(id *)(a1 + 56);
            -[NEConfigurationManager sendRequest:responseHandler:](v79, v69, v90);

            v70 = v91;
          }
          else
          {
            ne_log_obj();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              v83 = *(_QWORD *)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 40), "identifier");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = objc_msgSend(v63, "length");
              *(_DWORD *)buf = 138412802;
              v110 = v83;
              v111 = 2112;
              v112 = v84;
              v113 = 2048;
              v114 = v85;
              _os_log_error_impl(&dword_19BD16000, v71, OS_LOG_TYPE_ERROR, "%@ Configuration %@ is too large (%lu)", buf, 0x20u);

            }
            v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The configuration is too large (%lu bytes). The maximum size is %d bytes"), objc_msgSend(v63, "length"), 0x80000);
            v73 = *(_QWORD *)(a1 + 32);
            v94[0] = MEMORY[0x1E0C809B0];
            v94[1] = 3221225472;
            v94[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_173;
            v94[3] = &unk_1E3CC3A30;
            v74 = *(void **)(a1 + 48);
            v75 = *(id *)(a1 + 56);
            v95 = v72;
            v96 = v75;
            v94[4] = *(_QWORD *)(a1 + 32);
            v69 = v72;
            -[NEConfigurationManager executeCallbackOnQueue:callback:](v73, v74, v94);

            v70 = v96;
          }
        }
        else
        {
          ne_log_obj();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            v80 = *(_QWORD *)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "identifier");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v63, "length");
            *(_DWORD *)buf = 138412802;
            v110 = v80;
            v111 = 2112;
            v112 = v81;
            v113 = 2048;
            v114 = v82;
            _os_log_error_impl(&dword_19BD16000, v64, OS_LOG_TYPE_ERROR, "%@ Configuration %@ is too large (%lu)", buf, 0x20u);

          }
          v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The configuration is too large (%lu bytes). The maximum size is %d bytes"), objc_msgSend(v63, "length"), 0x80000);
          v66 = *(_QWORD *)(a1 + 32);
          v97[0] = MEMORY[0x1E0C809B0];
          v97[1] = 3221225472;
          v97[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_172;
          v97[3] = &unk_1E3CC3A30;
          v67 = *(void **)(a1 + 48);
          v68 = *(id *)(a1 + 56);
          v98 = v65;
          v99 = v68;
          v97[4] = *(_QWORD *)(a1 + 32);
          v69 = v65;
          -[NEConfigurationManager executeCallbackOnQueue:callback:](v66, v67, v97);

          v70 = v99;
        }

LABEL_55:
        goto LABEL_56;
      }
    }
LABEL_36:
    ne_log_obj();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v110 = v55;
      v111 = 2112;
      v112 = v56;
      _os_log_impl(&dword_19BD16000, v54, OS_LOG_TYPE_DEFAULT, "%@ Configuration %@ is unchanged", buf, 0x16u);

    }
    v57 = *(_QWORD *)(a1 + 32);
    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_167;
    v100[3] = &unk_1E3CC46A8;
    v58 = *(void **)(a1 + 48);
    v59 = *(id *)(a1 + 56);
    v100[4] = *(_QWORD *)(a1 + 32);
    v101 = v59;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v57, v58, v100);
    v60 = v101;
    goto LABEL_55;
  }
  ne_log_obj();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v61 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "name");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v110 = v61;
    v111 = 2112;
    v112 = v62;
    _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "%@ Failed to save configuration %@ because the local copy is stale", buf, 0x16u);

  }
  -[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), 5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 32);
  v102[0] = MEMORY[0x1E0C809B0];
  v102[1] = 3221225472;
  v102[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_166;
  v102[3] = &unk_1E3CC46A8;
  v17 = *(void **)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v103 = v15;
  v104 = v18;
  v9 = v15;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v16, v17, v102);

  v10 = v104;
LABEL_56:

}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_166(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_167(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  -[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_172(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  -[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), 2, *(void **)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_173(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  -[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), 2, *(void **)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_177(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  _BYTE *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a2)
    v8 = a3;
  else
    v8 = 11;
  if (v8
    && (-[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), v8, 0),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v23;
      v35 = 2112;
      v36 = v24;
      v37 = 2112;
      v38 = v10;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "%@ Failed to save configuration %@: %@", buf, 0x20u);

    }
    v12 = *(_QWORD *)(a1 + 32);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_178;
    v29[3] = &unk_1E3CC46A8;
    v13 = *(void **)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    v30 = v10;
    v31 = v14;
    v15 = v10;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v12, v13, v29);

  }
  else
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v17;
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEFAULT, "%@ Successfully saved configuration %@", buf, 0x16u);

    }
    v19 = *(_BYTE **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_179;
    v25[3] = &unk_1E3CBFCB8;
    v22 = *(void **)(a1 + 40);
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = v22;
    v27 = *(id *)(a1 + 48);
    v28 = *(id *)(a1 + 56);
    -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v19, v21, v25);

  }
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_181(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_178(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_179(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "%@ Failed to load %@ (%@) after saving it: %@", buf, 0x2Au);

    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_180;
  v10[3] = &unk_1E3CC4720;
  v6 = *(void **)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v5, v6, v10);

}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_180(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id v5;
  const char *v6;
  id Property;
  void *v8;
  void *v9;
  const char *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(id *)(a1 + 32);
  if (v5)
  {
    if (objc_getProperty(v5, v3, 88, 1))
    {
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v6, 88, 1);
      objc_msgSend(Property, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v36 = a1;
        v37 = v4;
        v9 = *(void **)(a1 + 32);
        v11 = v8;
        if (v9)
        {
          objc_msgSend(objc_getProperty(v9, v10, 56, 1), "objectForKeyedSubscript:", CFSTR("UserMap"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v14 = v12;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, buf, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v44 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
                objc_msgSend(v14, "objectForKeyedSubscript:", v19, v36, v37);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v20, "containsObject:", v21);

                if (v22)
                  objc_msgSend(v13, "addObject:", v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, buf, 16);
            }
            while (v16);
          }

          if (objc_msgSend(v13, "count"))
            v23 = v13;
          else
            v23 = 0;
          v24 = v23;

        }
        else
        {
          v24 = 0;
        }
        a1 = v36;
        v4 = v37;
        goto LABEL_28;
      }
    }
    v5 = *(id *)(a1 + 32);
    if (v5)
      v5 = objc_getProperty(v5, v6, 56, 1);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Signature"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    ne_log_obj();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      v35 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v48 = v35;
      v49 = 2112;
      v50 = v4;
      _os_log_fault_impl(&dword_19BD16000, v28, OS_LOG_TYPE_FAULT, "Failed to load configuration with identifier %@: %@", buf, 0x16u);
    }

  }
  v11 = 0;
  v24 = 0;
LABEL_28:

  v29 = *(_QWORD *)(a1 + 32);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_154;
  v38[3] = &unk_1E3CC3198;
  v30 = *(void **)(a1 + 48);
  v31 = *(id *)(a1 + 56);
  v39 = v11;
  v40 = v24;
  v41 = v4;
  v42 = v31;
  v32 = v4;
  v33 = v24;
  v34 = v11;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v29, v30, v38);

}

uint64_t __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_154(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id v5;
  const char *v6;
  id Property;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(id *)(a1 + 32);
  if (!v5)
  {
LABEL_8:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Signature"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v24 = v18;
        v25 = 2112;
        v26 = v4;
        _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "Failed to load configuration with identifier %@: %@", buf, 0x16u);
      }

    }
    v8 = 0;
    goto LABEL_13;
  }
  if (!objc_getProperty(v5, v3, 88, 1))
    goto LABEL_6;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v6, 88, 1);
  objc_msgSend(Property, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_6:
    v5 = *(id *)(a1 + 32);
    if (v5)
      v5 = objc_getProperty(v5, v6, 56, 1);
    goto LABEL_8;
  }
LABEL_13:
  v13 = *(_QWORD *)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_153;
  v19[3] = &unk_1E3CC3A30;
  v14 = *(void **)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v21 = v4;
  v22 = v15;
  v20 = v8;
  v16 = v4;
  v17 = v8;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v13, v14, v19);

}

uint64_t __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_153(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  id Property;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  const char *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  _QWORD block[4];
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(_QWORD **)(a1 + 32);
  if (!v5)
  {
    v6 = 0;
LABEL_33:
    v38 = 0;
    v19 = 0;
    goto LABEL_34;
  }
  v6 = v5[13];
  if (!objc_getProperty(v5, v3, 88, 1))
    goto LABEL_33;
  -[NEConfigurationManager filterIndexWithFilter:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_33;
  v8 = (void *)v7;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("filtering-only"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = *(id *)(a1 + 48);
  v44 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v14, 88, 1);
    objc_msgSend(Property, "allKeys");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v45 = v6;
  v46 = v4;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (!v17)
  {
    v19 = 0;
    goto LABEL_31;
  }
  v18 = v17;
  v19 = 0;
  v20 = *(_QWORD *)v55;
  v47 = v13;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v55 != v20)
        objc_enumerationMutation(v16);
      v22 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
      if (objc_msgSend(v13, "containsObject:", v22))
      {
        v24 = *(id *)(a1 + 32);
        if (v24)
          v24 = objc_getProperty(v24, v23, 88, 1);
        objc_msgSend(v24, "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (!v25)
          goto LABEL_26;
        if ((_DWORD)v10)
        {
          v27 = v16;
          v28 = v19;
          v29 = a1;
          v30 = v10;
          objc_msgSend(v25, "contentFilter");
          v31 = objc_claimAutoreleasedReturnValue();
          if (!v31)
            goto LABEL_21;
          v32 = (void *)v31;
          objc_msgSend(v26, "VPN");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {

LABEL_21:
            v10 = v30;
            a1 = v29;
            v19 = v28;
            v16 = v27;
            v13 = v47;
LABEL_26:

            continue;
          }
          objc_msgSend(v26, "appVPN");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v30;
          a1 = v29;
          v19 = v28;
          v16 = v27;
          v13 = v47;
          if (v34)
            goto LABEL_26;
        }
        if (!v19)
        {
          v35 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v36 = objc_msgSend(*(id *)(a1 + 48), "count");
          v37 = v35;
          v13 = v47;
          v19 = (void *)objc_msgSend(v37, "initWithCapacity:", v36);
        }
        objc_msgSend(v19, "addObject:", v26);
        goto LABEL_26;
      }
    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  }
  while (v18);
LABEL_31:

  v6 = v45;
  v4 = v46;
  v38 = v44;
LABEL_34:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke_2;
  block[3] = &unk_1E3CBFCE0;
  v39 = *(NSObject **)(a1 + 56);
  v40 = *(id *)(a1 + 64);
  v49 = v19;
  v50 = v4;
  v52 = v40;
  v53 = v6;
  v51 = v38;
  v41 = v38;
  v42 = v4;
  v43 = v19;
  dispatch_async(v39, block);

}

uint64_t __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[8], a1[6]);
}

void __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  -[NEConfigurationManager filterIndexWithFilter:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(_QWORD *)(v3 + 104);
  else
    v4 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke_2;
  block[3] = &unk_1E3CC3B80;
  v5 = *(NSObject **)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v9 = v2;
  v10 = v6;
  v11 = v4;
  v7 = v2;
  dispatch_async(v5, block);

}

uint64_t __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

uint64_t __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  _BYTE *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;

  getWriterSemaphore();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_3;
  v5[3] = &unk_1E3CC3CE0;
  v3 = *(void **)(a1 + 40);
  v6 = *(_BYTE **)(a1 + 32);
  v7 = v3;
  v8 = v2;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v4 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v6, 0, v5);

}

void __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  NSObject *v3;
  xpc_object_t v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  id Property;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  SEL v31;
  const char *v32;
  SEL v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  id v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  xpc_object_t v58;
  int v59;
  int v60;
  const char *v61;
  SCPreferencesRef prefs;
  id v63;
  id newValue;
  id v65;
  _QWORD block[4];
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD applier[5];
  id v74;
  uint64_t *v75;
  SCPreferencesRef v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  uint8_t v81[8];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  _BYTE buf[132];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v63 = a2;
  if (v63)
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[NEConfigurationManager syncConfigurationsWithSC:completionQueue:completionHandler:]_block_invoke_3";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v63;
      _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "%s failed to load configurations: %@", buf, 0x16u);
    }
LABEL_4:

LABEL_5:
    v4 = 0;
    newValue = 0;
    v65 = 0;
    goto LABEL_6;
  }
  prefs = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("NEConfigurationManager prefs sync"), 0);
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  v3 = v8;
  if (!prefs)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v59 = SCError();
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = SCErrorString(v59);
      _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "SCPreferencesCreate failed: %s", buf, 0xCu);
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[NEConfigurationManager syncConfigurationsWithSC:completionQueue:completionHandler:]_block_invoke";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1899;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
  }

  if (!SCPreferencesLock(prefs, 1u))
  {
    ne_log_obj();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v60 = SCError();
      v61 = SCErrorString(v60);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v61;
      _os_log_error_impl(&dword_19BD16000, v27, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed: %s", buf, 0xCu);
    }

    CFRelease(prefs);
    goto LABEL_5;
  }
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v9, 120, 1);
  v65 = Property;
  SCPreferencesGetSignature(prefs);
  newValue = (id)objc_claimAutoreleasedReturnValue();
  if (v65 && (objc_msgSend(v65, "isEqualToData:", newValue) & 1) != 0)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_INFO, "SCPreferences signature matches saved signature, change origin was NetworkExtension", buf, 2u);
    }

    goto LABEL_67;
  }
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 0;
  ne_log_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = newValue;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v65;
    _os_log_impl(&dword_19BD16000, v12, OS_LOG_TYPE_INFO, "SCPreferences signature (%@) does not match saved signature (%@), checking updated configurations", buf, 0x16u);
  }

  v14 = *(void **)(a1 + 32);
  if (v14)
  {
    objc_setProperty_atomic(v14, v13, newValue, 120);
    v15 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v15 = 0;
  }
  v16 = *(void **)(a1 + 40);
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_142;
  applier[3] = &unk_1E3CBFC90;
  applier[4] = v15;
  v74 = 0;
  v75 = &v77;
  v76 = prefs;
  xpc_array_apply(v16, applier);
  v18 = v78;
  v19 = *(_QWORD *)(a1 + 32);
  if (*((_BYTE *)v78 + 24))
  {
    if (v19)
    {
      *(_QWORD *)v81 = 0;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v20 = objc_getProperty((id)v19, v17, 88, 1);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v83 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(objc_getProperty((id)v19, v21, 88, 1), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            +[NEConfigurationManager updateFlags:withConfiguration:]((uint64_t)NEConfigurationManager, (unint64_t *)v81, v25);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
        }
        while (v22);
        v26 = *(_QWORD *)v81;
      }
      else
      {
        v26 = 0;
      }

      -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:]((_DWORD *)v19, *(const char **)(v19 + 104), v26, 0);
      v18 = v78;
    }
    if (*((_BYTE *)v18 + 24))
      goto LABEL_66;
    v19 = *(_QWORD *)(a1 + 32);
  }
  if (v19)
  {
    ne_log_obj();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v28, OS_LOG_TYPE_INFO, "Updating the saved SCPreferences signature", buf, 2u);
    }

    if ((*(_BYTE *)(v19 + 23) & 1) != 0)
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
      v29 = v30;
      if (*(uint64_t *)(v19 + 104) >= 1)
        -[NSObject encodeInt64:forKey:](v30, "encodeInt64:forKey:");
      -[NSObject encodeInt64:forKey:](v29, "encodeInt64:forKey:", 1, CFSTR("Version"), prefs);
      if (objc_getProperty((id)v19, v31, 56, 1))
      {
        -[NSObject encodeObject:forKey:](v29, "encodeObject:forKey:", objc_getProperty((id)v19, v32, 56, 1), CFSTR("Index"));
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        objc_msgSend(objc_getProperty((id)v19, v33, 56, 1), "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v83;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v83 != v37)
                objc_enumerationMutation(v34);
              objc_msgSend(objc_getProperty((id)v19, v35, 88, 1), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v39;
              if (v39)
              {
                objc_msgSend(v39, "identifier");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "UUIDString");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject encodeObject:forKey:](v29, "encodeObject:forKey:", v40, v42);

              }
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
          }
          while (v36);
        }

      }
      -[NSObject encodeObject:forKey:](v29, "encodeObject:forKey:", objc_getProperty((id)v19, v32, 120, 1), CFSTR("SCPreferencesSignature2"));
      -[NSObject finishEncoding](v29, "finishEncoding");
      -[NSObject encodedData](v29, "encodedData");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "writeToFile:atomically:", CFSTR("/Library/Preferences/com.apple.networkextension.plist"), 1);

      if ((v44 & 1) == 0)
      {
        ne_log_obj();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v81 = 0;
          _os_log_error_impl(&dword_19BD16000, v45, OS_LOG_TYPE_ERROR, "Failed to write the new file while updating the SCPreferences signature", v81, 2u);
        }

      }
    }
    else
    {
      ne_log_obj();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, "Some non-nehelper process is trying to save the SCPreferences signature", buf, 2u);
      }
    }

  }
LABEL_66:

  _Block_object_dispose(&v77, 8);
LABEL_67:
  ne_log_obj();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[NEConfigurationManager syncConfigurationsWithSC:completionQueue:completionHandler:]_block_invoke";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1985;
    _os_log_debug_impl(&dword_19BD16000, v46, OS_LOG_TYPE_DEBUG, "%s:%d: Unlocking SCPreferences", buf, 0x12u);
  }

  SCPreferencesUnlock(prefs);
  CFRelease(prefs);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v48 = *(id *)(a1 + 32);
  if (v48)
    v48 = objc_getProperty(v48, v47, 88, 1);
  v49 = v48;
  v4 = 0;
  v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v70 != v52)
          objc_enumerationMutation(v49);
        v54 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * k);
        v55 = *(id *)(a1 + 32);
        if (v55)
          v55 = objc_getProperty(v55, v50, 88, 1);
        objc_msgSend(v55, "objectForKeyedSubscript:", v54, prefs);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NEConfiguration isSupportedBySC](v56))
        {
          if (!v4)
            v4 = xpc_array_create(0, 0);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v56, "identifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "getUUIDBytes:", buf);

          v58 = xpc_uuid_create(buf);
          xpc_array_append_value(v4, v58);

        }
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
    }
    while (v51);
  }

LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_144;
  block[3] = &unk_1E3CC46A8;
  v5 = *(NSObject **)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v67 = v4;
  v68 = v6;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_142(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  const uint8_t *bytes;
  void *v8;
  const __SCPreferences *v9;
  __CFString *v10;
  const __SCNetworkService *v11;
  CFTypeID TypeID;
  const char *v13;
  id Property;
  const char *v15;
  void *v16;
  id v17;
  void *v18;
  NEConfiguration *v19;
  NSObject *v20;
  __CFString *v21;
  int v22;
  id v23;
  void *v24;
  NSObject *v25;
  __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  id *v31;
  id *v32;
  NEConfiguration *v33;
  NEConfiguration *v34;
  NSObject *v35;
  __CFString *v37;
  __CFString *v38;
  int v39;
  __CFString *Name;
  __int16 v41;
  NEConfiguration *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = [v4 alloc];
  bytes = xpc_uuid_get_bytes(v5);

  v8 = (void *)objc_msgSend(v6, "initWithUUIDBytes:", bytes);
  v9 = *(const __SCPreferences **)(a1 + 56);
  objc_msgSend(v8, "UUIDString");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = SCNetworkServiceCopy(v9, v10);

  TypeID = SCNetworkServiceGetTypeID();
  if (v11 && CFGetTypeID(v11) == TypeID && _SCNetworkServiceIsVPN())
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v13, 80, 1);
    objc_msgSend(Property, "objectForKeyedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = *(id *)(a1 + 32);
      if (v17)
        v17 = objc_getProperty(v17, v15, 88, 1);
      objc_msgSend(v17, "objectForKeyedSubscript:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (NEConfiguration *)objc_msgSend(v18, "copy");

      if (!v19)
        goto LABEL_41;
      ne_log_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        -[NEConfiguration name](v19, "name");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v39 = 138412290;
        Name = v21;
        _os_log_impl(&dword_19BD16000, v20, OS_LOG_TYPE_INFO, "Updating configuration \"%@\" from the corresponding SCNetworkService", (uint8_t *)&v39, 0xCu);

      }
      v22 = -[NEConfiguration updateFromSCService:](v19, v11);
    }
    else
    {
      ne_log_obj();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v39 = 138412290;
        Name = (__CFString *)SCNetworkServiceGetName(v11);
        v29 = Name;
        _os_log_impl(&dword_19BD16000, v28, OS_LOG_TYPE_INFO, "Creating a new configuration corresponding to SCNetworkService \"%@\", (uint8_t *)&v39, 0xCu);

      }
      v19 = [NEConfiguration alloc];
      if (v19)
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", SCNetworkServiceGetServiceID(v11));
        v31 = -[NEConfiguration initWithIdentifier:]((id *)&v19->super.isa, v30);
        v32 = v31;
        if (v31 && !-[NEConfiguration updateFromSCService:](v31, v11))
          v19 = 0;
        else
          v19 = v32;

      }
      v22 = v19 != 0;
      if (!v19)
        goto LABEL_41;
    }
    if (v22)
    {
      -[NEConfigurationManager saveConfigurationToDisk:updateSCPreferences:currentSignature:userUUID:notifyNow:isUpgrade:](*(_QWORD *)(a1 + 32), v19, 0, v16, *(void **)(a1 + 40), 0, 0);
      v33 = (NEConfiguration *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        if (-[NEConfiguration code](v33, "code") != 9)
        {
          ne_log_obj();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            -[NEConfiguration name](v19, "name");
            v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v39 = 138412546;
            Name = v38;
            v41 = 2112;
            v42 = v34;
            _os_log_error_impl(&dword_19BD16000, v35, OS_LOG_TYPE_ERROR, "Failed to save configuration \"%@\": %@", (uint8_t *)&v39, 0x16u);

          }
        }
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }

    }
LABEL_41:

    goto LABEL_42;
  }
  v23 = *(id *)(a1 + 32);
  if (v23)
    v23 = objc_getProperty(v23, v13, 88, 1);
  objc_msgSend(v23, "objectForKeyedSubscript:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;
  if (v24 && -[NEConfiguration isSupportedBySC](v24))
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v16, "name");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v39 = 138412290;
      Name = v26;
      _os_log_impl(&dword_19BD16000, v25, OS_LOG_TYPE_INFO, "Configuration \"%@\" no longer has a corresponding SCNetworkService, removing it", (uint8_t *)&v39, 0xCu);

    }
    -[NEConfigurationManager removeConfigurationFromDisk:updateSCPreferences:](*(_BYTE **)(a1 + 32), v8, 0);
    v19 = (NEConfiguration *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      ne_log_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "name");
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v39 = 138412546;
        Name = v37;
        v41 = 2112;
        v42 = v19;
        _os_log_error_impl(&dword_19BD16000, v27, OS_LOG_TYPE_ERROR, "Failed to remove configuration \"%@\": %@", (uint8_t *)&v39, 0x16u);

      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    goto LABEL_41;
  }
LABEL_42:

  if (v11)
    CFRelease(v11);

  return 1;
}

uint64_t __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  _BYTE *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;

  getWriterSemaphore();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_2;
  v6[3] = &unk_1E3CC3CE0;
  v3 = *(void **)(a1 + 40);
  v7 = *(_BYTE **)(a1 + 32);
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v10 = v2;
  v11 = v4;
  v5 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v7, 0, v6);

}

void __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  SCPreferencesRef v2;
  const __SCPreferences *v3;
  NSObject *v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("NEConfigurationManager remove prefs"), 0);
  if (v2)
  {
    v3 = v2;
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[NEConfigurationManager removeConfigurationFromDisk:completionQueue:completionHandler:]_block_invoke";
      v24 = 1024;
      LODWORD(v25) = 1795;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
    }

    if (SCPreferencesLock(v3, 1u))
      goto LABEL_13;
    v5 = SCError();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s (%d)"), SCErrorString(v5), v5);
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed while removing a configuration: %@", buf, 0xCu);
    }

    -[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), 12, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }
  else
  {
    v9 = SCError();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s (%d)"), SCErrorString(v9), v9);
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "SCPreferencesCreate failed: %@", buf, 0xCu);
    }

    -[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), 12, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v8)
  {
LABEL_18:
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(const char **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      v26 = 2112;
      v27 = v8;
      _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "%@ Failed to remove configuration %@ from disk: %@", buf, 0x20u);

    }
    goto LABEL_23;
  }
  v3 = 0;
LABEL_13:
  -[NEConfigurationManager removeConfigurationFromDisk:updateSCPreferences:](*(_BYTE **)(a1 + 32), *(void **)(a1 + 40), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[NEConfigurationManager removeConfigurationFromDisk:completionQueue:completionHandler:]_block_invoke";
      v24 = 1024;
      LODWORD(v25) = 1811;
      _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%s:%d: Unlocking SCPreferences", buf, 0x12u);
    }

    SCPreferencesUnlock(v3);
    CFRelease(v3);
  }
  if (v8)
    goto LABEL_18;
  ne_log_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v15 = *(const char **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_19BD16000, v12, OS_LOG_TYPE_INFO, "%@ Successfully removed configuration %@ from disk", buf, 0x16u);

  }
  v8 = 0;
LABEL_23:

  v17 = *(NSObject **)(a1 + 48);
  if (v17)
  {
    v18 = *(void **)(a1 + 64);
    if (v18)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_138;
      block[3] = &unk_1E3CC46A8;
      v21 = v18;
      v20 = v8;
      dispatch_async(v17, block);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

uint64_t __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  _BYTE *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  char v14;

  getWriterSemaphore();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_2;
  v6[3] = &unk_1E3CBFC40;
  v3 = *(void **)(a1 + 40);
  v7 = *(_BYTE **)(a1 + 32);
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v14 = *(_BYTE *)(a1 + 80);
  v11 = *(id *)(a1 + 64);
  v4 = *(id *)(a1 + 72);
  v12 = v2;
  v13 = v4;
  v5 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v7, 0, v6);

}

void __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  SCPreferencesRef v2;
  const __SCPreferences *v3;
  NSObject *v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("NEConfigurationManager save prefs"), 0);
  if (v2)
  {
    v3 = v2;
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[NEConfigurationManager saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:complet"
            "ionHandler:]_block_invoke";
      v30 = 1024;
      LODWORD(v31) = 1626;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
    }

    if (SCPreferencesLock(v3, 1u))
      goto LABEL_13;
    v5 = SCError();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s (%d)"), SCErrorString(v5), v5);
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed while saving a configuration: %@", buf, 0xCu);
    }

    -[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), 12, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }
  else
  {
    v9 = SCError();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s (%d)"), SCErrorString(v9), v9);
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "SCPreferencesCreate failed: %@", buf, 0xCu);
    }

    -[NEConfigurationManager errorWithCode:specifics:](*(_QWORD *)(a1 + 32), 12, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v8)
    goto LABEL_18;
  v3 = 0;
LABEL_13:
  -[NEConfigurationManager saveConfigurationToDisk:updateSCPreferences:currentSignature:userUUID:notifyNow:isUpgrade:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v3, *(void **)(a1 + 48), *(void **)(a1 + 56), 1, *(_BYTE *)(a1 + 88));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[NEConfigurationManager saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:complet"
            "ionHandler:]_block_invoke";
      v30 = 1024;
      LODWORD(v31) = 1642;
      _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%s:%d: Unlocking SCPreferences", buf, 0x12u);
    }

    SCPreferencesUnlock(v3);
    CFRelease(v3);
  }
  if (!v8)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v20 = *(const char **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v20;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_INFO, "%@ Successfully saved configuration %@ to disk", buf, 0x16u);

    }
    v8 = 0;
    goto LABEL_27;
  }
LABEL_18:
  v12 = objc_msgSend(v8, "code");
  ne_log_obj();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 != 9)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v18 = *(const char **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "code");
    *(_DWORD *)buf = 138412802;
    v29 = v18;
    v30 = 2112;
    v31 = v17;
    v32 = 2048;
    v33 = v19;
    _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "%@ Failed to save configuration %@ to disk: %ld", buf, 0x20u);
    goto LABEL_21;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = *(const char **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v15;
    v30 = 2112;
    v31 = v17;
    _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_INFO, "%@ Skipped saving configuration %@ to disk, because it is unchanged", buf, 0x16u);
LABEL_21:

  }
LABEL_27:

  v23 = *(NSObject **)(a1 + 64);
  if (v23)
  {
    v24 = *(void **)(a1 + 80);
    if (v24)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_135;
      block[3] = &unk_1E3CC46A8;
      v27 = v24;
      v26 = v8;
      dispatch_async(v23, block);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));

}

uint64_t __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_135(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __40__NEConfigurationManager_postGeneration__block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  NSObject *v5;
  id Property;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE buf[12];
  __int16 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[NEConfigurationManager postGeneration]_block_invoke";
      v21 = 2112;
      v22 = v4;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "%s: failed to load the configurations: %@", buf, 0x16u);
    }

    goto LABEL_22;
  }
  *(_QWORD *)buf = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v3, 88, 1);
  v7 = Property;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = *(id *)(a1 + 32);
        if (v13)
          v13 = objc_getProperty(v13, v8, 88, 1);
        objc_msgSend(v13, "objectForKeyedSubscript:", v12, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[NEConfigurationManager updateFlags:withConfiguration:]((uint64_t)NEConfigurationManager, (unint64_t *)buf, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v9);
    v9 = *(_QWORD *)buf;

    if ((v9 & 0x3080000000000000) != 0)
      goto LABEL_20;
  }
  else
  {

  }
  NEPolicySetDropPriorityLevel(0, 1);
LABEL_20:
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:]((_DWORD *)v15, *(const char **)(v15 + 104), v9, 1);
LABEL_22:

}

+ (id)sharedManager
{
  if (sharedManager_init_manager != -1)
    dispatch_once(&sharedManager_init_manager, &__block_literal_global_1121);
  return (id)sharedManager_g_manager;
}

+ (id)sharedManagerForAllUsers
{
  if (sharedManagerForAllUsers_init_manager != -1)
    dispatch_once(&sharedManagerForAllUsers_init_manager, &__block_literal_global_21);
  return (id)sharedManagerForAllUsers_g_manager;
}

+ (id)networkPrivacyConfigurationName
{
  return CFSTR("com.apple.preferences.networkprivacy");
}

void __50__NEConfigurationManager_sharedManagerForAllUsers__block_invoke()
{
  char *v0;
  void *v1;

  v0 = -[NEConfigurationManager initWithUserUUID:]((char *)[NEConfigurationManager alloc], 0);
  v1 = (void *)sharedManagerForAllUsers_g_manager;
  sharedManagerForAllUsers_g_manager = (uint64_t)v0;

}

void __39__NEConfigurationManager_sharedManager__block_invoke()
{
  NEConfigurationManager *v0;
  void *v1;

  v0 = objc_alloc_init(NEConfigurationManager);
  v1 = (void *)sharedManager_g_manager;
  sharedManager_g_manager = (uint64_t)v0;

}

@end
