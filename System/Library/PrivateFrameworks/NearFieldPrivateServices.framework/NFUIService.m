@implementation NFUIService

- (BOOL)canRun
{
  return 1;
}

- (id)serviceName
{
  return CFSTR("com.apple.stockholm.services.NFUIService");
}

- (void)coreNFCUIActivateWithCompletion:(id)a3
{
  id v4;
  const __CFString *debugContext;
  void *v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11[0] = CFSTR("Action");
  v11[1] = CFSTR("UserData");
  debugContext = (const __CFString *)self->_debugContext;
  if (!debugContext)
    debugContext = &stru_25136D9F8;
  v12[0] = CFSTR("CoreNFCUI_Activate");
  v12[1] = debugContext;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = 3221225472;
  v9[2] = __47__NFUIService_coreNFCUIActivateWithCompletion___block_invoke;
  v9[3] = &unk_25136D5D0;
  v10 = v4;
  v8.receiver = self;
  v8.super_class = (Class)NFUIService;
  v9[0] = MEMORY[0x24BDAC760];
  v7 = v4;
  -[NFPrivateService runService:withCompletion:](&v8, sel_runService_withCompletion_, v6, v9);

}

void __47__NFUIService_coreNFCUIActivateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "valueForKey:", CFSTR("Error"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)coreNFCUITagScannedCount:(int64_t)a3
{
  const __CFString *debugContext;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  debugContext = (const __CFString *)self->_debugContext;
  v10[0] = CFSTR("Action");
  v10[1] = CFSTR("UserData");
  if (debugContext)
    v5 = debugContext;
  else
    v5 = &stru_25136D9F8;
  v11[0] = CFSTR("CoreNFCUI_TagCount");
  v11[1] = v5;
  v10[2] = CFSTR("Parameter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)NFUIService;
  v8 = -[NFPrivateService runService:](&v9, sel_runService_, v7);

}

- (void)coreNFCUISetMode:(int64_t)a3
{
  const __CFString *debugContext;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("Action");
  v9[1] = CFSTR("UserData");
  debugContext = (const __CFString *)self->_debugContext;
  if ((unint64_t)(a3 - 1) >= 3)
    a3 = 0;
  if (!debugContext)
    debugContext = &stru_25136D9F8;
  v10[0] = CFSTR("CoreNFCUI_Mode");
  v10[1] = debugContext;
  v9[2] = CFSTR("Parameter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)NFUIService;
  v7 = -[NFPrivateService runService:](&v8, sel_runService_, v6);

}

- (void)coreNFCUISetScanText:(id)a3
{
  id v4;
  void *v5;
  const __CFString *debugContext;
  void *v7;
  id v8;
  objc_super v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = CFSTR("Action");
    v10[1] = CFSTR("UserData");
    debugContext = (const __CFString *)self->_debugContext;
    if (!debugContext)
      debugContext = &stru_25136D9F8;
    v11[0] = CFSTR("CoreNFCUI_ScanText");
    v11[1] = debugContext;
    v10[2] = CFSTR("Parameter");
    v11[2] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9.receiver = self;
    v9.super_class = (Class)NFUIService;
    v8 = -[NFPrivateService runService:](&v9, sel_runService_, v7);

  }
}

- (void)coreNFCUIInvalidate
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  id debugContext;
  const __CFString *v18;
  void *v19;
  id v20;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Calling Invalidation for %@", v11, ClassName, Name, 91, self->_debugContext);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(self);
    v16 = sel_getName(a2);
    debugContext = self->_debugContext;
    *(_DWORD *)buf = 67110146;
    v25 = v14;
    v26 = 2082;
    v27 = v15;
    v28 = 2082;
    v29 = v16;
    v30 = 1024;
    v31 = 91;
    v32 = 2112;
    v33 = debugContext;
    _os_log_impl(&dword_242978000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Calling Invalidation for %@", buf, 0x2Cu);
  }

  v22[0] = CFSTR("Action");
  v22[1] = CFSTR("UserData");
  v18 = (const __CFString *)self->_debugContext;
  if (!v18)
    v18 = &stru_25136D9F8;
  v23[0] = CFSTR("CoreNFCUI_Invalidate");
  v23[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)NFUIService;
  v20 = -[NFPrivateService runService:](&v21, sel_runService_, v19);

}

- (void)coreNFCUISetInvalidationHandler:(id)a3
{
  id v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  id debugContext;
  const char *v21;
  void *v22;
  id uiInvalidationHandler;
  const char *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    if (v5)
      v13 = "Not NULL";
    else
      v13 = "NULL";
    v24 = v13;
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i Setting Invalidation Handler to %s for %@", v14, ClassName, Name, 99, v24, self->_debugContext);
  }
  dispatch_get_specific(*v6);
  NFSharedLogGetLogger();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    v18 = object_getClassName(self);
    v19 = sel_getName(a2);
    debugContext = self->_debugContext;
    if (v5)
      v21 = "Not NULL";
    else
      v21 = "NULL";
    *(_DWORD *)buf = 67110402;
    v26 = v17;
    v27 = 2082;
    v28 = v18;
    v29 = 2082;
    v30 = v19;
    v31 = 1024;
    v32 = 99;
    v33 = 2080;
    v34 = v21;
    v35 = 2112;
    v36 = debugContext;
    _os_log_impl(&dword_242978000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Setting Invalidation Handler to %s for %@", buf, 0x36u);
  }

  v22 = (void *)MEMORY[0x2494E9950](v5);
  uiInvalidationHandler = self->_uiInvalidationHandler;
  self->_uiInvalidationHandler = v22;

}

- (void)serviceNotificationReceived:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  id debugContext;
  id uiInvalidationHandler;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  id v37;
  const void **v38;
  uint64_t Logger;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v44;
  objc_class *v45;
  int v46;
  const void **v47;
  uint64_t v48;
  void (*v49)(uint64_t, const char *, ...);
  objc_class *v50;
  _BOOL4 v51;
  const char *v52;
  const char *v53;
  BOOL v54;
  uint64_t v55;
  objc_class *v56;
  int v57;
  const char *v58;
  const char *v59;
  id v60;
  objc_class *v61;
  _BOOL4 v62;
  const char *v63;
  uint64_t v64;
  NSObject *v65;
  objc_class *v66;
  int v67;
  const char *v68;
  const char *v69;
  id v70;
  const char *Name;
  const char *v72;
  int v73;
  const char *v74;
  int v75;
  const char *v76;
  int v77;
  uint8_t buf[4];
  int v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKey:", CFSTR("Action"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("UserData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v38 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v40 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v44 = 45;
      if (isMetaClass)
        v44 = 43;
      v40(3, "%c[%{public}s %{public}s]:%i Error : no action.", v44, ClassName, Name, 110);
    }
    dispatch_get_specific(*v38);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v45 = object_getClass(self);
      if (class_isMetaClass(v45))
        v46 = 43;
      else
        v46 = 45;
      *(_DWORD *)buf = 67109890;
      v79 = v46;
      v80 = 2082;
      v81 = object_getClassName(self);
      v82 = 2082;
      v83 = sel_getName(a2);
      v84 = 1024;
      v85 = 110;
      _os_log_impl(&dword_242978000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : no action.", buf, 0x22u);
    }
    goto LABEL_58;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("CoreNFCUI_Invalidate")))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("Parameter"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[NSObject objectForKey:](v11, "objectForKey:", CFSTR("UserCancelled"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v13 = NFLogGetLogger();
        if (v13)
        {
          v14 = (void (*)(uint64_t, const char *, ...))v13;
          v15 = object_getClass(self);
          v16 = class_isMetaClass(v15);
          v74 = object_getClassName(self);
          v17 = sel_getName(a2);
          v18 = 45;
          if (v16)
            v18 = 43;
          v14(3, "%c[%{public}s %{public}s]:%i Error : missing user cancel parameter for context pair {local %@, remote %@}", v18, v74, v17, 125, self->_debugContext, v10);
        }
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        NFSharedLogGetLogger();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = object_getClass(self);
          if (class_isMetaClass(v20))
            v21 = 43;
          else
            v21 = 45;
          v75 = v21;
          v22 = object_getClassName(self);
          v23 = sel_getName(a2);
          debugContext = self->_debugContext;
          *(_DWORD *)buf = 67110402;
          v79 = v75;
          v80 = 2082;
          v81 = v22;
          v82 = 2082;
          v83 = v23;
          v84 = 1024;
          v85 = 125;
          v86 = 2112;
          v87 = debugContext;
          v88 = 2112;
          v89 = v10;
          _os_log_impl(&dword_242978000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : missing user cancel parameter for context pair {local %@, remote %@}", buf, 0x36u);
        }

      }
      uiInvalidationHandler = self->_uiInvalidationHandler;
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v26 = NFLogGetLogger();
      v27 = (void (*)(uint64_t, const char *, ...))v26;
      if (uiInvalidationHandler)
      {
        if (v26)
        {
          v28 = object_getClass(self);
          v29 = class_isMetaClass(v28);
          v72 = object_getClassName(self);
          v30 = sel_getName(a2);
          v31 = 45;
          if (v29)
            v31 = 43;
          v27(6, "%c[%{public}s %{public}s]:%i Invoking Invalidation handler  for context pair {local %@, remote %@}", v31, v72, v30, 129, self->_debugContext, v10);
        }
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        NFSharedLogGetLogger();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = object_getClass(self);
          if (class_isMetaClass(v33))
            v34 = 43;
          else
            v34 = 45;
          v73 = v34;
          v35 = object_getClassName(self);
          v36 = sel_getName(a2);
          v37 = self->_debugContext;
          *(_DWORD *)buf = 67110402;
          v79 = v73;
          v80 = 2082;
          v81 = v35;
          v82 = 2082;
          v83 = v36;
          v84 = 1024;
          v85 = 129;
          v86 = 2112;
          v87 = v37;
          v88 = 2112;
          v89 = v10;
          _os_log_impl(&dword_242978000, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invoking Invalidation handler  for context pair {local %@, remote %@}", buf, 0x36u);
        }

        (*((void (**)(id, id, uint64_t))self->_uiInvalidationHandler + 2))(self->_uiInvalidationHandler, v8, -[NSObject BOOLValue](v12, "BOOLValue"));
      }
      else
      {
        if (v26)
        {
          v61 = object_getClass(self);
          v62 = class_isMetaClass(v61);
          v76 = object_getClassName(self);
          v63 = sel_getName(a2);
          v64 = 45;
          if (v62)
            v64 = 43;
          v27(6, "%c[%{public}s %{public}s]:%i No Invalidation handler set for context pair {local %@, remote %@}", v64, v76, v63, 132, self->_debugContext, v10);
        }
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        NFSharedLogGetLogger();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          v66 = object_getClass(self);
          if (class_isMetaClass(v66))
            v67 = 43;
          else
            v67 = 45;
          v77 = v67;
          v68 = object_getClassName(self);
          v69 = sel_getName(a2);
          v70 = self->_debugContext;
          *(_DWORD *)buf = 67110402;
          v79 = v77;
          v80 = 2082;
          v81 = v68;
          v82 = 2082;
          v83 = v69;
          v84 = 1024;
          v85 = 132;
          v86 = 2112;
          v87 = v70;
          v88 = 2112;
          v89 = v10;
          _os_log_impl(&dword_242978000, v65, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No Invalidation handler set for context pair {local %@, remote %@}", buf, 0x36u);
        }

      }
    }
    else
    {
      v47 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v48 = NFLogGetLogger();
      if (v48)
      {
        v49 = (void (*)(uint64_t, const char *, ...))v48;
        v50 = object_getClass(self);
        v51 = class_isMetaClass(v50);
        v52 = object_getClassName(self);
        v53 = sel_getName(a2);
        v54 = !v51;
        v47 = (const void **)MEMORY[0x24BEDCDB0];
        v55 = 45;
        if (!v54)
          v55 = 43;
        v49(3, "%c[%{public}s %{public}s]:%i Error : no parameter for context pair {local %@, remote %@}", v55, v52, v53, 119, self->_debugContext, v10);
      }
      dispatch_get_specific(*v47);
      NFSharedLogGetLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v56 = object_getClass(self);
        if (class_isMetaClass(v56))
          v57 = 43;
        else
          v57 = 45;
        v58 = object_getClassName(self);
        v59 = sel_getName(a2);
        v60 = self->_debugContext;
        *(_DWORD *)buf = 67110402;
        v79 = v57;
        v80 = 2082;
        v81 = v58;
        v82 = 2082;
        v83 = v59;
        v84 = 1024;
        v85 = 119;
        v86 = 2112;
        v87 = v60;
        v88 = 2112;
        v89 = v10;
        _os_log_impl(&dword_242978000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : no parameter for context pair {local %@, remote %@}", buf, 0x36u);
      }
    }

LABEL_58:
  }

}

- (void)launchBundleWithIdentifier:(id)a3 launchReason:(unint64_t)a4 launchDomain:(int64_t)a5
{
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  const void **v17;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  const char *Name;
  objc_super v32;
  _QWORD v33[7];
  _QWORD v34[4];
  _QWORD v35[4];
  uint8_t buf[4];
  _BYTE v37[24];
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  NFSharedSignpostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  NFSharedSignpostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v37 = a4;
    *(_WORD *)&v37[8] = 2048;
    *(_QWORD *)&v37[10] = a5;
    _os_signpost_emit_with_name_impl(&dword_242978000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "launchBundleWithIdentifier", "reason=%lu, domain=%lu", buf, 0x16u);
  }

  if (v9)
  {
    v34[0] = CFSTR("Action");
    v34[1] = CFSTR("launchBundleIdentifier");
    v35[0] = CFSTR("launchBundle");
    v35[1] = v9;
    v34[2] = CFSTR("launchReason");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v14;
    v34[3] = CFSTR("walletDomain");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = 3221225472;
    v33[2] = __68__NFUIService_launchBundleWithIdentifier_launchReason_launchDomain___block_invoke;
    v33[3] = &unk_25136D5F8;
    v33[4] = self;
    v33[5] = a2;
    v33[6] = v11;
    v32.receiver = self;
    v32.super_class = (Class)NFUIService;
    v33[0] = MEMORY[0x24BDAC760];
    -[NFPrivateService runService:withCompletion:](&v32, sel_runService_withCompletion_, v16, v33);

  }
  else
  {
    v17 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v23 = 45;
      if (isMetaClass)
        v23 = 43;
      v19(3, "%c[%{public}s %{public}s]:%i Invalid bundleIdentifier parameter", v23, ClassName, Name, 150);
    }
    dispatch_get_specific(*v17);
    NFSharedLogGetLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = object_getClass(self);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      v27 = object_getClassName(self);
      v28 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v37 = v26;
      *(_WORD *)&v37[4] = 2082;
      *(_QWORD *)&v37[6] = v27;
      *(_WORD *)&v37[14] = 2082;
      *(_QWORD *)&v37[16] = v28;
      v38 = 1024;
      v39 = 150;
      _os_log_impl(&dword_242978000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid bundleIdentifier parameter", buf, 0x22u);
    }

    NFSharedSignpostLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_242978000, v30, OS_SIGNPOST_INTERVAL_END, v11, "launchBundleWithIdentifier", ", buf, 2u);
    }

  }
}

void __68__NFUIService_launchBundleWithIdentifier_launchReason_launchDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  const void **v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!+[NFPrivateService isResultSuccessful:](NFPrivateService, "isResultSuccessful:", a2))
  {
    v3 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v5(3, "%c[%{public}s %{public}s]:%i Launch error", v9, ClassName, Name, 162);
    }
    dispatch_get_specific(*v3);
    NFSharedLogGetLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11))
        v12 = 43;
      else
        v12 = 45;
      v13 = object_getClassName(*(id *)(a1 + 32));
      v14 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      v20 = v12;
      v21 = 2082;
      v22 = v13;
      v23 = 2082;
      v24 = v14;
      v25 = 1024;
      v26 = 162;
      _os_log_impl(&dword_242978000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Launch error", buf, 0x22u);
    }

  }
  NFSharedSignpostLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = *(_QWORD *)(a1 + 48);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_242978000, v16, OS_SIGNPOST_INTERVAL_END, v17, "launchBundleWithIdentifier", ", buf, 2u);
  }

}

- (id)debugContext
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDebugContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_debugContext, 0);
  objc_storeStrong(&self->_uiInvalidationHandler, 0);
}

@end
