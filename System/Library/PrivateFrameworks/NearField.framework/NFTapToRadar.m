@implementation NFTapToRadar

- (NFTapToRadar)init
{
  NFTapToRadar *v3;
  void *v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  NFTapToRadar *v31;
  Class v32;
  NSString *pendingRequest;
  NSObject *v34;
  NSObject *v35;
  dispatch_queue_t v36;
  OS_dispatch_queue *queue;
  NSUserDefaults *userDefaults;
  const void **v40;
  uint64_t v41;
  void (*v42)(uint64_t, const char *, ...);
  objc_class *v43;
  _BOOL4 v44;
  uint64_t v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  const void **v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  _BOOL4 v54;
  uint64_t v55;
  objc_class *v56;
  int v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *Name;
  const char *v63;
  const char *v64;
  const char *v65;
  objc_super v66;
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  const char *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v66.receiver = self;
  v66.super_class = (Class)NFTapToRadar;
  v3 = -[NFTapToRadar init](&v66, sel_init);
  if (!v3)
    goto LABEL_31;
  NFProductGetName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("T"))
    && objc_msgSend(v4, "hasSuffix:", CFSTR("AP")))
  {
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v3);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v3);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i Disabled NF TTR on T HW", v11, ClassName, Name, 67);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v13 = object_getClass(v3);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(v3);
    v16 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v68 = v14;
    v69 = 2082;
    v70 = v15;
    v71 = 2082;
    v72 = v16;
    v73 = 1024;
    v74 = 67;
    v17 = "%c[%{public}s %{public}s]:%i Disabled NF TTR on T HW";
    goto LABEL_25;
  }
  if ((NFProductIsDevBoard() & 1) == 0 && (NFProductIsVM() & 1) == 0 && !NFProductIsNED())
  {
    if (dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2))
    {
      v32 = NSClassFromString(CFSTR("LSApplicationWorkspace"));
      v3->_lsApplicationWorkspace = v32;
      if (v32)
      {
        pendingRequest = v3->_pendingRequest;
        v3->_pendingRequest = 0;

        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v34 = objc_claimAutoreleasedReturnValue();
        dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_UTILITY, 0);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = dispatch_queue_create("com.apple.stockholm.TTR", v35);
        queue = v3->_queue;
        v3->_queue = (OS_dispatch_queue *)v36;

        userDefaults = v3->_userDefaults;
        v3->_userDefaults = 0;

LABEL_31:
        v31 = v3;
        goto LABEL_32;
      }
      v50 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v51 = NFLogGetLogger();
      if (v51)
      {
        v52 = (void (*)(uint64_t, const char *, ...))v51;
        v53 = object_getClass(v3);
        v54 = class_isMetaClass(v53);
        v61 = object_getClassName(v3);
        v65 = sel_getName(a2);
        v55 = 45;
        if (v54)
          v55 = 43;
        v52(3, "%c[%{public}s %{public}s]:%i Failed to get class %{public}@", v55, v61, v65, 88, CFSTR("LSApplicationWorkspace"));
      }
      dispatch_get_specific(*v50);
      NFSharedLogGetLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v56 = object_getClass(v3);
      if (class_isMetaClass(v56))
        v57 = 43;
      else
        v57 = 45;
      v58 = object_getClassName(v3);
      v59 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v68 = v57;
      v69 = 2082;
      v70 = v58;
      v71 = 2082;
      v72 = v59;
      v73 = 1024;
      v74 = 88;
      v75 = 2114;
      v76 = CFSTR("LSApplicationWorkspace");
      v17 = "%c[%{public}s %{public}s]:%i Failed to get class %{public}@";
    }
    else
    {
      v40 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v41 = NFLogGetLogger();
      if (v41)
      {
        v42 = (void (*)(uint64_t, const char *, ...))v41;
        v43 = object_getClass(v3);
        v44 = class_isMetaClass(v43);
        v60 = object_getClassName(v3);
        v64 = sel_getName(a2);
        v45 = 45;
        if (v44)
          v45 = 43;
        v42(3, "%c[%{public}s %{public}s]:%i Failed to dlopen %s", v45, v60, v64, 82, "/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices");
      }
      dispatch_get_specific(*v40);
      NFSharedLogGetLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v46 = object_getClass(v3);
      if (class_isMetaClass(v46))
        v47 = 43;
      else
        v47 = 45;
      v48 = object_getClassName(v3);
      v49 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v68 = v47;
      v69 = 2082;
      v70 = v48;
      v71 = 2082;
      v72 = v49;
      v73 = 1024;
      v74 = 82;
      v75 = 2080;
      v76 = "/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices";
      v17 = "%c[%{public}s %{public}s]:%i Failed to dlopen %s";
    }
    v29 = v12;
    v30 = 44;
    goto LABEL_26;
  }
  v18 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v19 = NFLogGetLogger();
  if (v19)
  {
    v20 = (void (*)(uint64_t, const char *, ...))v19;
    v21 = object_getClass(v3);
    v22 = class_isMetaClass(v21);
    v23 = object_getClassName(v3);
    v63 = sel_getName(a2);
    v24 = 45;
    if (v22)
      v24 = 43;
    v20(3, "%c[%{public}s %{public}s]:%i Disabled NF TTR on devboards and VMs", v24, v23, v63, 72);
  }
  dispatch_get_specific(*v18);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    goto LABEL_27;
  v25 = object_getClass(v3);
  if (class_isMetaClass(v25))
    v26 = 43;
  else
    v26 = 45;
  v27 = object_getClassName(v3);
  v28 = sel_getName(a2);
  *(_DWORD *)buf = 67109890;
  v68 = v26;
  v69 = 2082;
  v70 = v27;
  v71 = 2082;
  v72 = v28;
  v73 = 1024;
  v74 = 72;
  v17 = "%c[%{public}s %{public}s]:%i Disabled NF TTR on devboards and VMs";
LABEL_25:
  v29 = v12;
  v30 = 34;
LABEL_26:
  _os_log_impl(&dword_19B5EB000, v29, OS_LOG_TYPE_ERROR, v17, buf, v30);
LABEL_27:

  v31 = 0;
LABEL_32:

  return v31;
}

+ (id)_getInstance
{
  if (qword_1ECFF6160 != -1)
    dispatch_once(&qword_1ECFF6160, &__block_literal_global);
  return (id)_MergedGlobals_12;
}

void __28__NFTapToRadar__getInstance__block_invoke()
{
  NFTapToRadar *v0;
  void *v1;

  v0 = objc_alloc_init(NFTapToRadar);
  v1 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = (uint64_t)v0;

}

- (void)_handleCallbackSync:(unint64_t)a3
{
  void *v6;
  void *v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  NSUserDefaults *userDefaults;
  void *v19;
  const void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  NSObject *p_super;
  objc_class *v28;
  int v29;
  NSUserDefaults *v30;
  void *v31;
  const void **v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  objc_class *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const void **v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  _BOOL4 v55;
  uint64_t v56;
  NSObject *v57;
  objc_class *v58;
  int v59;
  void *v60;
  void *v61;
  __CFRunLoop *Main;
  __CFRunLoopSource *runLoopSource;
  __CFUserNotification *userNotification;
  NSString *pendingRequest;
  const char *v66;
  const char *Name;
  const char *v68;
  const char *v69;
  const char *v70;
  uint8_t buf[4];
  int v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  int v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pendingRequest)
  {
    if (a3 == 2)
    {
      v8 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v10(6, "%c[%{public}s %{public}s]:%i User canceled response", v14, ClassName, Name, 126);
      }
      dispatch_get_specific(*v8);
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        *(_DWORD *)buf = 67109890;
        v72 = v17;
        v73 = 2082;
        v74 = object_getClassName(self);
        v75 = 2082;
        v76 = sel_getName(a2);
        v77 = 1024;
        v78 = 126;
        _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i User canceled response", buf, 0x22u);
      }

      userDefaults = self->_userDefaults;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v19, CFSTR("NFTTRProhibitRequestsUntil"));

      -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
    }
    else
    {
      v30 = self->_userDefaults;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](v30, "setObject:forKey:", v31, CFSTR("NFTTRProhibitRequestsUntil"));

      -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
      if (a3 == 1)
      {
        v32 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v33 = NFLogGetLogger();
        if (v33)
        {
          v34 = (void (*)(uint64_t, const char *, ...))v33;
          v35 = object_getClass(self);
          v36 = class_isMetaClass(v35);
          v37 = object_getClassName(self);
          v69 = sel_getName(a2);
          v38 = 45;
          if (v36)
            v38 = 43;
          v34(6, "%c[%{public}s %{public}s]:%i NotNow response", v38, v37, v69, 139);
        }
        dispatch_get_specific(*v32);
        NFSharedLogGetLogger();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = object_getClass(self);
          if (class_isMetaClass(v40))
            v41 = 43;
          else
            v41 = 45;
          *(_DWORD *)buf = 67109890;
          v72 = v41;
          v73 = 2082;
          v74 = object_getClassName(self);
          v75 = 2082;
          v76 = sel_getName(a2);
          v77 = 1024;
          v78 = 139;
          _os_log_impl(&dword_19B5EB000, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NotNow response", buf, 0x22u);
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("483780"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v42);

        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Purple Stockholm"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v43);

        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("1.0"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v44);

        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Crash/Hang/Data Loss"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v45);

        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v46);

        v47 = (void *)MEMORY[0x1E0CB39D8];
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Stockholm TTR - %@"), self->_pendingRequest);
        objc_msgSend(v47, "queryItemWithName:value:", CFSTR("Title"), v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v49);

        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Description"), self->_pendingRequest);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v50);

        objc_msgSend(v7, "setScheme:", CFSTR("tap-to-radar"));
        objc_msgSend(v7, "setHost:", CFSTR("new"));
        objc_msgSend(v7, "setQueryItems:", v6);
        v51 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v52 = NFLogGetLogger();
        if (v52)
        {
          v53 = (void (*)(uint64_t, const char *, ...))v52;
          v54 = object_getClass(self);
          v55 = class_isMetaClass(v54);
          v66 = object_getClassName(self);
          v70 = sel_getName(a2);
          v56 = 45;
          if (v55)
            v56 = 43;
          v53(6, "%c[%{public}s %{public}s]:%i URL: %{public}@", v56, v66, v70, 154, v7);
        }
        dispatch_get_specific(*v51);
        NFSharedLogGetLogger();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v58 = object_getClass(self);
          if (class_isMetaClass(v58))
            v59 = 43;
          else
            v59 = 45;
          *(_DWORD *)buf = 67110146;
          v72 = v59;
          v73 = 2082;
          v74 = object_getClassName(self);
          v75 = 2082;
          v76 = sel_getName(a2);
          v77 = 1024;
          v78 = 154;
          v79 = 2114;
          v80 = v7;
          _os_log_impl(&dword_19B5EB000, v57, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i URL: %{public}@", buf, 0x2Cu);
        }

        -[objc_class defaultWorkspace](self->_lsApplicationWorkspace, "defaultWorkspace");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URL");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "openURL:configuration:completionHandler:", v61, 0, 0);

      }
    }
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    runLoopSource = self->_runLoopSource;
    if (runLoopSource)
      CFRelease(runLoopSource);
    self->_runLoopSource = 0;
    userNotification = self->_userNotification;
    if (userNotification)
      CFRelease(userNotification);
    self->_userNotification = 0;
    pendingRequest = self->_pendingRequest;
    self->_pendingRequest = 0;

    p_super = &self->_userDefaults->super;
    self->_userDefaults = 0;
  }
  else
  {
    v20 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v21 = NFLogGetLogger();
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      v68 = sel_getName(a2);
      v26 = 45;
      if (v24)
        v26 = 43;
      v22(3, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no pending request", v26, v25, v68, 121);
    }
    dispatch_get_specific(*v20);
    NFSharedLogGetLogger();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      *(_DWORD *)buf = 67109890;
      v72 = v29;
      v73 = 2082;
      v74 = object_getClassName(self);
      v75 = 2082;
      v76 = sel_getName(a2);
      v77 = 1024;
      v78 = 121;
      _os_log_impl(&dword_19B5EB000, p_super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no pending request", buf, 0x22u);
    }
  }

}

+ (void)handleCallback:(unint64_t)a3
{
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  unint64_t v9;

  +[NFTapToRadar _getInstance](NFTapToRadar, "_getInstance");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__NFTapToRadar_handleCallback___block_invoke;
    v7[3] = &unk_1E3B51460;
    v8 = v4;
    v9 = a3;
    dispatch_async(v6, v7);

  }
}

uint64_t __31__NFTapToRadar_handleCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCallbackSync:", *(_QWORD *)(a1 + 40));
}

+ (void)requestTapToRadar:(id)a3 preferences:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  _QWORD *v13;
  id v14;
  id v15;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_19B5EB000, "requestTapToRadar:preferences:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  v8 = (void *)MEMORY[0x1A1AC3F18]();
  if (os_variant_has_internal_diagnostics())
  {
    +[NFTapToRadar _getInstance](NFTapToRadar, "_getInstance");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9[1];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__NFTapToRadar_requestTapToRadar_preferences___block_invoke;
      block[3] = &unk_1E3B51D68;
      v13 = v9;
      v14 = v5;
      v15 = v6;
      dispatch_async(v11, block);

    }
  }
  objc_autoreleasePoolPop(v8);

}

uint64_t __46__NFTapToRadar_requestTapToRadar_preferences___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestTapToRadarSync:prefs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_requestTapToRadarSync:(id)a3 prefs:(id)a4
{
  id v7;
  __CFString *v8;
  const void **v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  NSUserDefaults *v23;
  NSUserDefaults *userDefaults;
  void *v25;
  uint64_t v26;
  const void **v27;
  uint64_t v28;
  void (*v29)(uint64_t, const char *, ...);
  objc_class *v30;
  _BOOL4 v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  NSUserDefaults *v36;
  const void **v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  objc_class *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const __CFDictionary *v50;
  __CFUserNotification *v51;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  const void **v54;
  uint64_t v55;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *v57;
  _BOOL4 v58;
  const __CFDictionary *v59;
  const char *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  NSString *v67;
  NSUserDefaults *pendingRequest;
  const void **v69;
  uint64_t v70;
  void (*v71)(uint64_t, const char *, ...);
  objc_class *v72;
  _BOOL4 v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  NSObject *v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  __CFUserNotification *userNotification;
  const void **v83;
  uint64_t v84;
  void (*v85)(uint64_t, const char *, ...);
  objc_class *v86;
  _BOOL4 v87;
  const __CFDictionary *v88;
  const char *v89;
  uint64_t v90;
  NSObject *v91;
  objc_class *v92;
  int v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *Name;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  const __CFDictionary *v104;
  SInt32 error;
  _QWORD v106[7];
  _QWORD v107[7];
  _BYTE buf[28];
  __int16 v109;
  int v110;
  __int16 v111;
  NSObject *v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CFString *)a4;
  error = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pendingRequest)
  {
    v9 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i Discarding TTR request, already in flight", v15, ClassName, Name, 214);
    }
    dispatch_get_specific(*v9);
    NFSharedLogGetLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v18;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = object_getClassName(self);
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = sel_getName(a2);
      v109 = 1024;
      v110 = 214;
      v19 = "%c[%{public}s %{public}s]:%i Discarding TTR request, already in flight";
LABEL_39:
      _os_log_impl(&dword_19B5EB000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0x22u);
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  if (!qword_1ECFF6168)
  {
    *(_OWORD *)buf = xmmword_1E3B51D88;
    *(_QWORD *)&buf[16] = 0;
    qword_1ECFF6168 = _sl_dlopen();
  }
  if (qword_1ECFF6168)
  {
    getSBUserNotificationDismissOnLock();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = objc_alloc(MEMORY[0x1E0C99EA0]);
      if (v8)
        v22 = v8;
      else
        v22 = CFSTR("com.apple.nfcd.nfttr");
      v23 = (NSUserDefaults *)objc_msgSend(v21, "initWithSuiteName:", v22);
      userDefaults = self->_userDefaults;
      self->_userDefaults = v23;

      -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("NFTTRProhibitRequestsUntil"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[NSObject compare:](v16, "compare:", v25);

        if (v26 == 1)
        {
          v27 = (const void **)MEMORY[0x1E0DE7900];
          dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
          v28 = NFLogGetLogger();
          if (v28)
          {
            v29 = (void (*)(uint64_t, const char *, ...))v28;
            v30 = object_getClass(self);
            v31 = class_isMetaClass(v30);
            v96 = object_getClassName(self);
            v100 = sel_getName(a2);
            v32 = 45;
            if (v31)
              v32 = 43;
            v29(6, "%c[%{public}s %{public}s]:%i TTR is prohibited until %{public}@", v32, v96, v100, 228, v16);
          }
          dispatch_get_specific(*v27);
          NFSharedLogGetLogger();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = object_getClass(self);
            if (class_isMetaClass(v34))
              v35 = 43;
            else
              v35 = 45;
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v35;
            *(_WORD *)&buf[8] = 2082;
            *(_QWORD *)&buf[10] = object_getClassName(self);
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = sel_getName(a2);
            v109 = 1024;
            v110 = 228;
            v111 = 2114;
            v112 = v16;
            _os_log_impl(&dword_19B5EB000, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TTR is prohibited until %{public}@", buf, 0x2Cu);
          }

          v36 = self->_userDefaults;
          self->_userDefaults = 0;

          goto LABEL_40;
        }
      }
      v46 = *MEMORY[0x1E0C9B810];
      v106[0] = *MEMORY[0x1E0C9B800];
      v106[1] = v46;
      v107[0] = CFSTR("Stockholm Error Detected!");
      v107[1] = CFSTR("Please file a Radar");
      v47 = *MEMORY[0x1E0C9B830];
      v106[2] = *MEMORY[0x1E0C9B838];
      v106[3] = v47;
      v107[2] = CFSTR("File Radar");
      v107[3] = CFSTR("Not Now");
      v48 = *MEMORY[0x1E0C9B820];
      v106[4] = *MEMORY[0x1E0C9B868];
      v106[5] = v48;
      v107[4] = CFSTR("Never bother me again");
      v107[5] = MEMORY[0x1E0C9AAB0];
      getSBUserNotificationDismissOnLock();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v106[6] = v49;
      v107[6] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 7);
      v50 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      v51 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v50);
      self->_userNotification = v51;
      if (!v51 || error)
      {
        v104 = v50;
        v69 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v70 = NFLogGetLogger();
        if (v70)
        {
          v71 = (void (*)(uint64_t, const char *, ...))v70;
          v72 = object_getClass(self);
          v73 = class_isMetaClass(v72);
          v74 = object_getClassName(self);
          v75 = sel_getName(a2);
          v76 = 45;
          if (v73)
            v76 = 43;
          v71(3, "%c[%{public}s %{public}s]:%i Couldn't create notification! %d", v76, v74, v75, 245, error);
        }
        dispatch_get_specific(*v69);
        NFSharedLogGetLogger();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v78 = object_getClass(self);
          if (class_isMetaClass(v78))
            v79 = 43;
          else
            v79 = 45;
          v80 = object_getClassName(self);
          v81 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v79;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = v80;
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = v81;
          v109 = 1024;
          v110 = 245;
          v111 = 1024;
          LODWORD(v112) = error;
          _os_log_impl(&dword_19B5EB000, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Couldn't create notification! %d", buf, 0x28u);
        }

        userNotification = self->_userNotification;
        v50 = v104;
        if (!userNotification)
          goto LABEL_76;
      }
      else
      {
        RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v51, (CFUserNotificationCallBack)NFTTRUserNotificationCallback, 0);
        self->_runLoopSource = RunLoopSource;
        if (RunLoopSource)
        {
          Main = CFRunLoopGetMain();
          CFRunLoopAddSource(Main, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
          v54 = (const void **)MEMORY[0x1E0DE7900];
          dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
          v55 = NFLogGetLogger();
          if (v55)
          {
            v56 = (void (*)(uint64_t, const char *, ...))v55;
            v57 = object_getClass(self);
            v58 = class_isMetaClass(v57);
            v59 = v50;
            v60 = object_getClassName(self);
            v102 = sel_getName(a2);
            v61 = 45;
            if (v58)
              v61 = 43;
            v97 = v60;
            v50 = v59;
            v54 = (const void **)MEMORY[0x1E0DE7900];
            v56(6, "%c[%{public}s %{public}s]:%i TTR prompt created", v61, v97, v102, 263);
          }
          dispatch_get_specific(*v54);
          NFSharedLogGetLogger();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v63 = object_getClass(self);
            if (class_isMetaClass(v63))
              v64 = 43;
            else
              v64 = 45;
            v65 = object_getClassName(self);
            v66 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)&buf[4] = v64;
            *(_WORD *)&buf[8] = 2082;
            *(_QWORD *)&buf[10] = v65;
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = v66;
            v109 = 1024;
            v110 = 263;
            _os_log_impl(&dword_19B5EB000, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TTR prompt created", buf, 0x22u);
          }

          v67 = (NSString *)v7;
          pendingRequest = (NSUserDefaults *)self->_pendingRequest;
          self->_pendingRequest = v67;
          goto LABEL_77;
        }
        v83 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v84 = NFLogGetLogger();
        if (v84)
        {
          v85 = (void (*)(uint64_t, const char *, ...))v84;
          v86 = object_getClass(self);
          v87 = class_isMetaClass(v86);
          v88 = v50;
          v89 = object_getClassName(self);
          v103 = sel_getName(a2);
          v90 = 45;
          if (v87)
            v90 = 43;
          v98 = v89;
          v50 = v88;
          v83 = (const void **)MEMORY[0x1E0DE7900];
          v85(3, "%c[%{public}s %{public}s]:%i Couldn't create runloop source", v90, v98, v103, 255);
        }
        dispatch_get_specific(*v83);
        NFSharedLogGetLogger();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          v92 = object_getClass(self);
          if (class_isMetaClass(v92))
            v93 = 43;
          else
            v93 = 45;
          v94 = object_getClassName(self);
          v95 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v93;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = v94;
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = v95;
          v109 = 1024;
          v110 = 255;
          _os_log_impl(&dword_19B5EB000, v91, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Couldn't create runloop source", buf, 0x22u);
        }

        userNotification = self->_userNotification;
      }
      CFRelease(userNotification);
LABEL_76:
      self->_userNotification = 0;
      pendingRequest = self->_userDefaults;
      self->_userDefaults = 0;
LABEL_77:

      goto LABEL_40;
    }
  }
  v37 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v38 = NFLogGetLogger();
  if (v38)
  {
    v39 = (void (*)(uint64_t, const char *, ...))v38;
    v40 = object_getClass(self);
    v41 = class_isMetaClass(v40);
    v42 = object_getClassName(self);
    v101 = sel_getName(a2);
    v43 = 45;
    if (v41)
      v43 = 43;
    v39(3, "%c[%{public}s %{public}s]:%i Missing SB notif key SBUserNotificationDismissOnLock", v43, v42, v101, 219);
  }
  dispatch_get_specific(*v37);
  NFSharedLogGetLogger();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v44 = object_getClass(self);
    if (class_isMetaClass(v44))
      v45 = 43;
    else
      v45 = 45;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v45;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = object_getClassName(self);
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = sel_getName(a2);
    v109 = 1024;
    v110 = 219;
    v19 = "%c[%{public}s %{public}s]:%i Missing SB notif key SBUserNotificationDismissOnLock";
    goto LABEL_39;
  }
LABEL_40:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
