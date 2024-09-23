@implementation NFStorageService

- (BOOL)canRun
{
  return 1;
}

- (id)serviceName
{
  return CFSTR("com.apple.stockholm.services.NFStorageServer");
}

- (id)fetchESEExpressEntitiesWithError:(id *)a3
{
  void *v6;
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  id v19;
  void *v20;
  const void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  const void **v42;
  uint64_t v43;
  void (*v44)(uint64_t, const char *, ...);
  objc_class *v45;
  _BOOL4 v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  const void **v60;
  uint64_t v61;
  void (*v62)(uint64_t, const char *, ...);
  objc_class *v63;
  _BOOL4 v64;
  uint64_t v65;
  NSObject *v66;
  objc_class *v67;
  int v68;
  const char *v69;
  const char *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  const void **v76;
  uint64_t v77;
  void (*v78)(uint64_t, const char *, ...);
  objc_class *v79;
  _BOOL4 v80;
  const char *v81;
  uint64_t v82;
  NSObject *v83;
  objc_class *v84;
  int v85;
  const char *v86;
  const char *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  const char *ClassName;
  const char *v94;
  const char *Name;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  objc_super v107;
  _QWORD v108[4];
  _QWORD v109[4];
  _BYTE v110[128];
  _QWORD v111[4];
  _QWORD v112[4];
  _QWORD v113[4];
  _QWORD v114[4];
  uint8_t buf[4];
  int v116;
  __int16 v117;
  const char *v118;
  __int16 v119;
  const char *v120;
  __int16 v121;
  int v122;
  __int16 v123;
  id v124;
  _QWORD v125[4];
  _QWORD v126[7];

  v126[4] = *MEMORY[0x24BDAC8D0];
  v107.receiver = self;
  v107.super_class = (Class)NFStorageService;
  -[NFPrivateService runService:](&v107, sel_runService_, &unk_25136E978);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("Error"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = NFLogGetLogger();
        if (Logger)
        {
          v10 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v13 = 45;
          if (isMetaClass)
            v13 = 43;
          v10(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v13, ClassName, Name, 53, v7);
        }
        dispatch_get_specific(*v8);
        NFSharedLogGetLogger();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = object_getClass(self);
          if (class_isMetaClass(v15))
            v16 = 43;
          else
            v16 = 45;
          v17 = object_getClassName(self);
          v18 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v116 = v16;
          v117 = 2082;
          v118 = v17;
          v119 = 2082;
          v120 = v18;
          v121 = 1024;
          v122 = 53;
          v123 = 2112;
          v124 = v7;
          _os_log_impl(&dword_242978000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
        }

        if (a3)
        {
          v7 = objc_retainAutorelease(v7);
          v19 = 0;
          v20 = 0;
          *a3 = v7;
LABEL_51:

          goto LABEL_52;
        }
      }
      else
      {
        objc_msgSend(v6, "valueForKey:", CFSTR("Reply"));
        v37 = objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v19 = (id)v37;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v105 = 0u;
            v106 = 0u;
            v103 = 0u;
            v104 = 0u;
            v19 = v19;
            v38 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v104;
              while (2)
              {
                for (i = 0; i != v39; ++i)
                {
                  if (*(_QWORD *)v104 != v40)
                    objc_enumerationMutation(v19);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v76 = (const void **)MEMORY[0x24BEDCDB0];
                    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
                    v77 = NFLogGetLogger();
                    if (v77)
                    {
                      v78 = (void (*)(uint64_t, const char *, ...))v77;
                      v79 = object_getClass(self);
                      v80 = class_isMetaClass(v79);
                      v81 = object_getClassName(self);
                      v99 = sel_getName(a2);
                      v82 = 45;
                      if (v80)
                        v82 = 43;
                      v78(3, "%c[%{public}s %{public}s]:%i Failed to check reply from service", v82, v81, v99, 73);
                    }
                    dispatch_get_specific(*v76);
                    NFSharedLogGetLogger();
                    v83 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                    {
                      v84 = object_getClass(self);
                      if (class_isMetaClass(v84))
                        v85 = 43;
                      else
                        v85 = 45;
                      v86 = object_getClassName(self);
                      v87 = sel_getName(a2);
                      *(_DWORD *)buf = 67109890;
                      v116 = v85;
                      v117 = 2082;
                      v118 = v86;
                      v119 = 2082;
                      v120 = v87;
                      v121 = 1024;
                      v122 = 73;
                      _os_log_impl(&dword_242978000, v83, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to check reply from service", buf, 0x22u);
                    }

                    if (a3)
                    {
                      v102 = objc_alloc(MEMORY[0x24BDD1540]);
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      v108[0] = *MEMORY[0x24BDD0FC8];
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      v109[0] = v89;
                      v109[1] = &unk_25136EA60;
                      v108[1] = CFSTR("Line");
                      v108[2] = CFSTR("Method");
                      v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
                      v109[2] = v90;
                      v108[3] = *MEMORY[0x24BDD0BA0];
                      v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 74);
                      v109[3] = v91;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v109, v108, 4);
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      *a3 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v88, 10, v92);

                    }
                    goto LABEL_50;
                  }
                }
                v39 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
                if (v39)
                  continue;
                break;
              }
            }

            v19 = v19;
            v20 = v19;
            goto LABEL_51;
          }
          v60 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v61 = NFLogGetLogger();
          if (v61)
          {
            v62 = (void (*)(uint64_t, const char *, ...))v61;
            v63 = object_getClass(self);
            v64 = class_isMetaClass(v63);
            v100 = object_getClassName(self);
            v98 = sel_getName(a2);
            v65 = 45;
            if (v64)
              v65 = 43;
            v62(3, "%c[%{public}s %{public}s]:%i Failed to check reply from service", v65, v100, v98, 66);
          }
          dispatch_get_specific(*v60);
          NFSharedLogGetLogger();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = object_getClass(self);
            if (class_isMetaClass(v67))
              v68 = 43;
            else
              v68 = 45;
            v69 = object_getClassName(self);
            v70 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v116 = v68;
            v117 = 2082;
            v118 = v69;
            v119 = 2082;
            v120 = v70;
            v121 = 1024;
            v122 = 66;
            _os_log_impl(&dword_242978000, v66, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to check reply from service", buf, 0x22u);
          }

          if (a3)
          {
            v101 = objc_alloc(MEMORY[0x24BDD1540]);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v111[0] = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v112[0] = v72;
            v112[1] = &unk_25136EA48;
            v111[1] = CFSTR("Line");
            v111[2] = CFSTR("Method");
            v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
            v112[2] = v73;
            v111[3] = *MEMORY[0x24BDD0BA0];
            v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 67);
            v112[3] = v74;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v112, v111, 4);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *a3 = (id)objc_msgSend(v101, "initWithDomain:code:userInfo:", v71, 10, v75);

          }
          goto LABEL_50;
        }
        v42 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v43 = NFLogGetLogger();
        if (v43)
        {
          v44 = (void (*)(uint64_t, const char *, ...))v43;
          v45 = object_getClass(self);
          v46 = class_isMetaClass(v45);
          v94 = object_getClassName(self);
          v97 = sel_getName(a2);
          v47 = 45;
          if (v46)
            v47 = 43;
          v44(3, "%c[%{public}s %{public}s]:%i Failed to get reply from service : %@", v47, v94, v97, 60, 0);
        }
        dispatch_get_specific(*v42);
        NFSharedLogGetLogger();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = object_getClass(self);
          if (class_isMetaClass(v49))
            v50 = 43;
          else
            v50 = 45;
          v51 = object_getClassName(self);
          v52 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v116 = v50;
          v117 = 2082;
          v118 = v51;
          v119 = 2082;
          v120 = v52;
          v121 = 1024;
          v122 = 60;
          v123 = 2112;
          v124 = 0;
          _os_log_impl(&dword_242978000, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get reply from service : %@", buf, 0x2Cu);
        }

        if (a3)
        {
          v53 = objc_alloc(MEMORY[0x24BDD1540]);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v113[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Missing Parameter");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v114[0] = v55;
          v114[1] = &unk_25136EA30;
          v113[1] = CFSTR("Line");
          v113[2] = CFSTR("Method");
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v114[2] = v56;
          v113[3] = *MEMORY[0x24BDD0BA0];
          v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 61);
          v114[3] = v57;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v114, v113, 4);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *a3 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 9, v58);

        }
      }
      v19 = 0;
LABEL_50:
      v20 = 0;
      goto LABEL_51;
    }
  }
  v21 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v22 = NFLogGetLogger();
  if (v22)
  {
    v23 = (void (*)(uint64_t, const char *, ...))v22;
    v24 = object_getClass(self);
    v25 = class_isMetaClass(v24);
    v26 = object_getClassName(self);
    v96 = sel_getName(a2);
    v27 = 45;
    if (v25)
      v27 = 43;
    v23(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v27, v26, v96, 46);
  }
  dispatch_get_specific(*v21);
  NFSharedLogGetLogger();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v29 = object_getClass(self);
    if (class_isMetaClass(v29))
      v30 = 43;
    else
      v30 = 45;
    v31 = object_getClassName(self);
    v32 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v116 = v30;
    v117 = 2082;
    v118 = v31;
    v119 = 2082;
    v120 = v32;
    v121 = 1024;
    v122 = 46;
    _os_log_impl(&dword_242978000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
  }

  if (a3)
  {
    v33 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v125[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v126[0] = v7;
    v126[1] = &unk_25136EA18;
    v125[1] = CFSTR("Line");
    v125[2] = CFSTR("Method");
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v126[2] = v34;
    v125[3] = *MEMORY[0x24BDD0BA0];
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 47);
    v126[3] = v35;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v126, v125, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v19, 13, v36);

    goto LABEL_50;
  }
  v20 = 0;
LABEL_52:

  return v20;
}

- (void)updateESEExpressEntitiesWithConfig:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const void **v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  const char *ClassName;
  const char *Name;
  const char *v33;
  objc_super v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  NSObject *v44;
  _QWORD v45[3];
  _QWORD v46[4];

  v46[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v45[0] = CFSTR("Operation");
  v45[1] = CFSTR("Model");
  v46[0] = CFSTR("Update");
  v46[1] = CFSTR("Express");
  v45[2] = CFSTR("Config");
  v46[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34.receiver = self;
  v34.super_class = (Class)NFStorageService;
  -[NFPrivateService runService:](&v34, sel_runService_, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("Error"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v11(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v14, ClassName, Name, 98, v8);
      }
      dispatch_get_specific(*v9);
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        v18 = object_getClassName(self);
        v19 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v36 = v17;
        v37 = 2082;
        v38 = v18;
        v39 = 2082;
        v40 = v19;
        v41 = 1024;
        v42 = 98;
        v43 = 2112;
        v44 = v8;
        _os_log_impl(&dword_242978000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
      }

    }
  }
  else
  {
    v20 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v21 = NFLogGetLogger();
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      v33 = sel_getName(a2);
      v26 = 45;
      if (v24)
        v26 = 43;
      v22(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v26, v25, v33, 92);
    }
    dispatch_get_specific(*v20);
    NFSharedLogGetLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v27 = object_getClass(self);
      if (class_isMetaClass(v27))
        v28 = 43;
      else
        v28 = 45;
      v29 = object_getClassName(self);
      v30 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v36 = v28;
      v37 = 2082;
      v38 = v29;
      v39 = 2082;
      v40 = v30;
      v41 = 1024;
      v42 = 92;
      _os_log_impl(&dword_242978000, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
    }
  }

}

- (void)deleteAllESEExpressEntities
{
  void *v4;
  NSObject *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  const void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  _BOOL4 v21;
  const char *v22;
  uint64_t v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  const char *ClassName;
  const char *Name;
  const char *v30;
  objc_super v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  NSObject *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)NFStorageService;
  -[NFPrivateService runService:](&v31, sel_runService_, &unk_25136E9A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("Error"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
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
        v11 = 45;
        if (isMetaClass)
          v11 = 43;
        v8(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v11, ClassName, Name, 118, v5);
      }
      dispatch_get_specific(*v6);
      NFSharedLogGetLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = object_getClass(self);
        if (class_isMetaClass(v13))
          v14 = 43;
        else
          v14 = 45;
        v15 = object_getClassName(self);
        v16 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v33 = v14;
        v34 = 2082;
        v35 = v15;
        v36 = 2082;
        v37 = v16;
        v38 = 1024;
        v39 = 118;
        v40 = 2112;
        v41 = v5;
        _os_log_impl(&dword_242978000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
      }

    }
  }
  else
  {
    v17 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v18 = NFLogGetLogger();
    if (v18)
    {
      v19 = (void (*)(uint64_t, const char *, ...))v18;
      v20 = object_getClass(self);
      v21 = class_isMetaClass(v20);
      v22 = object_getClassName(self);
      v30 = sel_getName(a2);
      v23 = 45;
      if (v21)
        v23 = 43;
      v19(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v23, v22, v30, 112);
    }
    dispatch_get_specific(*v17);
    NFSharedLogGetLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(self);
      v27 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v33 = v25;
      v34 = 2082;
      v35 = v26;
      v36 = 2082;
      v37 = v27;
      v38 = 1024;
      v39 = 112;
      _os_log_impl(&dword_242978000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
    }
  }

}

- (id)fetchAppletEntitiesWithError:(id *)a3
{
  void *v6;
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  id v19;
  void *v20;
  const void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  const void **v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
  const char *v43;
  BOOL v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  const void **v58;
  uint64_t v59;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *v61;
  _BOOL4 v62;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  const char *ClassName;
  const char *Name;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  id v80;
  objc_super v81;
  _QWORD v82[4];
  _QWORD v83[4];
  _QWORD v84[4];
  _QWORD v85[4];
  uint8_t buf[4];
  int v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  int v93;
  __int16 v94;
  id v95;
  _QWORD v96[4];
  _QWORD v97[7];

  v97[4] = *MEMORY[0x24BDAC8D0];
  v81.receiver = self;
  v81.super_class = (Class)NFStorageService;
  -[NFPrivateService runService:](&v81, sel_runService_, &unk_25136E9C8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("Error"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = NFLogGetLogger();
        if (Logger)
        {
          v10 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v13 = 45;
          if (isMetaClass)
            v13 = 43;
          v10(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v13, ClassName, Name, 143, v7);
        }
        dispatch_get_specific(*v8);
        NFSharedLogGetLogger();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = object_getClass(self);
          if (class_isMetaClass(v15))
            v16 = 43;
          else
            v16 = 45;
          v17 = object_getClassName(self);
          v18 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v87 = v16;
          v88 = 2082;
          v89 = v17;
          v90 = 2082;
          v91 = v18;
          v92 = 1024;
          v93 = 143;
          v94 = 2112;
          v95 = v7;
          _os_log_impl(&dword_242978000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
        }

        if (a3)
        {
          v7 = objc_retainAutorelease(v7);
          v19 = 0;
          v20 = 0;
          *a3 = v7;
LABEL_43:

          goto LABEL_44;
        }
        goto LABEL_41;
      }
      objc_msgSend(v6, "valueForKey:", CFSTR("Reply"));
      v37 = objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        v38 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v39 = NFLogGetLogger();
        if (v39)
        {
          v40 = (void (*)(uint64_t, const char *, ...))v39;
          v41 = object_getClass(self);
          v42 = class_isMetaClass(v41);
          v43 = object_getClassName(self);
          v77 = sel_getName(a2);
          v44 = !v42;
          v38 = (const void **)MEMORY[0x24BEDCDB0];
          v45 = 45;
          if (!v44)
            v45 = 43;
          v40(3, "%c[%{public}s %{public}s]:%i Failed to get reply from service : %@", v45, v43, v77, 150, 0);
        }
        dispatch_get_specific(*v38);
        NFSharedLogGetLogger();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = object_getClass(self);
          if (class_isMetaClass(v47))
            v48 = 43;
          else
            v48 = 45;
          v49 = object_getClassName(self);
          v50 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v87 = v48;
          v88 = 2082;
          v89 = v49;
          v90 = 2082;
          v91 = v50;
          v92 = 1024;
          v93 = 150;
          v94 = 2112;
          v95 = 0;
          _os_log_impl(&dword_242978000, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get reply from service : %@", buf, 0x2Cu);
        }

        if (a3)
        {
          v51 = objc_alloc(MEMORY[0x24BDD1540]);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v84[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Missing Parameter");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v85[0] = v53;
          v85[1] = &unk_25136EA90;
          v84[1] = CFSTR("Line");
          v84[2] = CFSTR("Method");
          v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
          v85[2] = v54;
          v84[3] = *MEMORY[0x24BDD0BA0];
          v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 151);
          v85[3] = v55;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 4);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *a3 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 9, v56);

        }
LABEL_41:
        v19 = 0;
        goto LABEL_42;
      }
      v19 = (id)v37;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v19;
        v20 = v19;
        goto LABEL_43;
      }
      v58 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v59 = NFLogGetLogger();
      if (v59)
      {
        v60 = (void (*)(uint64_t, const char *, ...))v59;
        v61 = object_getClass(self);
        v62 = class_isMetaClass(v61);
        v79 = object_getClassName(self);
        v78 = sel_getName(a2);
        v44 = !v62;
        v58 = (const void **)MEMORY[0x24BEDCDB0];
        v63 = 45;
        if (!v44)
          v63 = 43;
        v60(3, "%c[%{public}s %{public}s]:%i Failed to check reply from service", v63, v79, v78, 156);
      }
      dispatch_get_specific(*v58);
      NFSharedLogGetLogger();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v65 = object_getClass(self);
        if (class_isMetaClass(v65))
          v66 = 43;
        else
          v66 = 45;
        v67 = object_getClassName(self);
        v68 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v87 = v66;
        v88 = 2082;
        v89 = v67;
        v90 = 2082;
        v91 = v68;
        v92 = 1024;
        v93 = 156;
        _os_log_impl(&dword_242978000, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to check reply from service", buf, 0x22u);
      }

      if (a3)
      {
        v80 = objc_alloc(MEMORY[0x24BDD1540]);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v82[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v83[0] = v70;
        v83[1] = &unk_25136EAA8;
        v82[1] = CFSTR("Line");
        v82[2] = CFSTR("Method");
        v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v83[2] = v71;
        v82[3] = *MEMORY[0x24BDD0BA0];
        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 157);
        v83[3] = v72;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v83, v82, 4);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *a3 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v69, 10, v73);

      }
LABEL_42:
      v20 = 0;
      goto LABEL_43;
    }
  }
  v21 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v22 = NFLogGetLogger();
  if (v22)
  {
    v23 = (void (*)(uint64_t, const char *, ...))v22;
    v24 = object_getClass(self);
    v25 = class_isMetaClass(v24);
    v26 = object_getClassName(self);
    v76 = sel_getName(a2);
    v27 = 45;
    if (v25)
      v27 = 43;
    v23(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v27, v26, v76, 136);
  }
  dispatch_get_specific(*v21);
  NFSharedLogGetLogger();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v29 = object_getClass(self);
    if (class_isMetaClass(v29))
      v30 = 43;
    else
      v30 = 45;
    v31 = object_getClassName(self);
    v32 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v87 = v30;
    v88 = 2082;
    v89 = v31;
    v90 = 2082;
    v91 = v32;
    v92 = 1024;
    v93 = 136;
    _os_log_impl(&dword_242978000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
  }

  if (a3)
  {
    v33 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v96[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v97[0] = v7;
    v97[1] = &unk_25136EA78;
    v96[1] = CFSTR("Line");
    v96[2] = CFSTR("Method");
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v97[2] = v34;
    v96[3] = *MEMORY[0x24BDD0BA0];
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 137);
    v97[3] = v35;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, v96, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v19, 13, v36);

    goto LABEL_42;
  }
  v20 = 0;
LABEL_44:

  return v20;
}

- (id)updateAppletEntitiesWithConfig:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const void **v23;
  uint64_t Logger;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const char *v43;
  const char *v44;
  const char *Name;
  uint64_t v46;
  id v47;
  objc_super v48;
  _QWORD v49[5];
  _QWORD v50[5];
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  _QWORD v61[4];
  _QWORD v62[4];
  _QWORD v63[3];
  _QWORD v64[5];

  v64[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v63[0] = CFSTR("Operation");
  v63[1] = CFSTR("Model");
  v64[0] = CFSTR("Update");
  v64[1] = CFSTR("Applets");
  v63[2] = CFSTR("Config");
  v64[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48.receiver = self;
  v48.super_class = (Class)NFStorageService;
  -[NFPrivateService runService:](&v48, sel_runService_, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v23 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v25 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v29 = 45;
      if (isMetaClass)
        v29 = 43;
      v25(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v29, ClassName, Name, 174);
    }
    dispatch_get_specific(*v23);
    NFSharedLogGetLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(self);
      v34 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v52 = v32;
      v53 = 2082;
      v54 = v33;
      v55 = 2082;
      v56 = v34;
      v57 = 1024;
      v58 = 174;
      _os_log_impl(&dword_242978000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
    }

    v35 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v20;
    v62[1] = &unk_25136EAC0;
    v61[1] = CFSTR("Line");
    v61[2] = CFSTR("Method");
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v62[2] = v36;
    v61[3] = *MEMORY[0x24BDD0BA0];
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 175);
    v62[3] = v37;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v35, "initWithDomain:code:userInfo:", v8, 7, v38);
    goto LABEL_28;
  }
  objc_msgSend(v7, "valueForKey:", CFSTR("Error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v10 = NFLogGetLogger();
    if (v10)
    {
      v11 = (void (*)(uint64_t, const char *, ...))v10;
      v12 = object_getClass(self);
      v13 = class_isMetaClass(v12);
      v43 = object_getClassName(self);
      v44 = sel_getName(a2);
      v14 = 45;
      if (v13)
        v14 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v14, v43, v44, 180, v8);
    }
    dispatch_get_specific(*v9);
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v52 = v17;
      v53 = 2082;
      v54 = v18;
      v55 = 2082;
      v56 = v19;
      v57 = 1024;
      v58 = 180;
      v59 = 2112;
      v60 = v8;
      _os_log_impl(&dword_242978000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
    }

    v47 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v8, "code");
    v49[0] = *MEMORY[0x24BDD0FC8];
    v21 = (void *)MEMORY[0x24BDD17C8];
    if (objc_msgSend(v8, "code") > 70)
      v22 = 71;
    else
      v22 = objc_msgSend(v8, "code");
    objc_msgSend(v21, "stringWithUTF8String:", NFResultCodeString[v22]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *MEMORY[0x24BDD1398];
    v50[0] = v36;
    v50[1] = v8;
    v49[1] = v40;
    v49[2] = CFSTR("Line");
    v50[2] = &unk_25136EAD8;
    v49[3] = CFSTR("Method");
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v50[3] = v37;
    v49[4] = *MEMORY[0x24BDD0BA0];
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 181);
    v50[4] = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 5);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v47, "initWithDomain:code:userInfo:", v20, v46, v41);

LABEL_28:
    goto LABEL_29;
  }
  v39 = 0;
LABEL_29:

  return v39;
}

- (void)deleteAllAppletEntities
{
  void *v4;
  NSObject *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  const void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  _BOOL4 v21;
  const char *v22;
  uint64_t v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  const char *ClassName;
  const char *Name;
  const char *v30;
  objc_super v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  NSObject *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)NFStorageService;
  -[NFPrivateService runService:](&v31, sel_runService_, &unk_25136E9F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("Error"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
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
        v11 = 45;
        if (isMetaClass)
          v11 = 43;
        v8(3, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", v11, ClassName, Name, 202, v5);
      }
      dispatch_get_specific(*v6);
      NFSharedLogGetLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = object_getClass(self);
        if (class_isMetaClass(v13))
          v14 = 43;
        else
          v14 = 45;
        v15 = object_getClassName(self);
        v16 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v33 = v14;
        v34 = 2082;
        v35 = v15;
        v36 = 2082;
        v37 = v16;
        v38 = 1024;
        v39 = 202;
        v40 = 2112;
        v41 = v5;
        _os_log_impl(&dword_242978000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : %@", buf, 0x2Cu);
      }

    }
  }
  else
  {
    v17 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v18 = NFLogGetLogger();
    if (v18)
    {
      v19 = (void (*)(uint64_t, const char *, ...))v18;
      v20 = object_getClass(self);
      v21 = class_isMetaClass(v20);
      v22 = object_getClassName(self);
      v30 = sel_getName(a2);
      v23 = 45;
      if (v21)
        v23 = 43;
      v19(3, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", v23, v22, v30, 196);
    }
    dispatch_get_specific(*v17);
    NFSharedLogGetLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(self);
      v27 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v33 = v25;
      v34 = 2082;
      v35 = v26;
      v36 = 2082;
      v37 = v27;
      v38 = 1024;
      v39 = 196;
      _os_log_impl(&dword_242978000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to call into service : no result..", buf, 0x22u);
    }
  }

}

@end
