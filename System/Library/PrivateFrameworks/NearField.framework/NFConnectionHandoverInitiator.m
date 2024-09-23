@implementation NFConnectionHandoverInitiator

+ (id)initiatorWithDelegate:(id)a3
{
  NSObject *v4;
  id v5;
  dispatch_queue_t v6;
  NFConnectionHandoverInitiator *v7;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = a3;
  v6 = dispatch_queue_create("NFConnectionHandoverReceiverCallback", v4);

  v7 = -[NFConnectionHandoverInitiator initWithDelegate:callbackQueue:]([NFConnectionHandoverInitiator alloc], "initWithDelegate:callbackQueue:", v5, v6);
  return v7;
}

+ (id)initiatorWithDelegate:(id)a3 callbackQueue:(id)a4
{
  id v5;
  id v6;
  NFConnectionHandoverInitiator *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NFConnectionHandoverInitiator initWithDelegate:callbackQueue:]([NFConnectionHandoverInitiator alloc], "initWithDelegate:callbackQueue:", v6, v5);

  return v7;
}

- (NFConnectionHandoverInitiator)initWithDelegate:(id)a3
{
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  NFConnectionHandoverInitiator *v8;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a3;
  v7 = dispatch_queue_create("NFConnectionHandoverReceiverCallback", v5);

  v8 = -[NFConnectionHandoverInitiator initWithDelegate:callbackQueue:](self, "initWithDelegate:callbackQueue:", v6, v7);
  return v8;
}

- (NFConnectionHandoverInitiator)initWithDelegate:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  NFConnectionHandoverInitiator *v11;
  NFConnectionHandoverInitiator *v12;

  v6 = a3;
  v7 = a4;
  +[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBackgroundTagReadingAvailable");

  if (v9)
    v10 = 0;
  else
    v10 = 2;
  v11 = (NFConnectionHandoverInitiator *)-[NFConnectionHandoverController initWithType:initiator:callbackQueue:]((id *)&self->super.super.isa, (void *)v10, 1, v7);

  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v6);
    v12 = v11;
  }

  return v11;
}

- (void)start
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__NFConnectionHandoverInitiator_start__block_invoke;
  v2[3] = &unk_1E3B51A60;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

uint64_t __38__NFConnectionHandoverInitiator_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startWithCustomBroadcastData:", 0);
}

- (void)startWithCustomBroadcastData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__NFConnectionHandoverInitiator_startWithCustomBroadcastData___block_invoke;
  v6[3] = &unk_1E3B51E70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v6);

}

uint64_t __62__NFConnectionHandoverInitiator_startWithCustomBroadcastData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startWithCustomBroadcastData:", *(_QWORD *)(a1 + 40));
}

- (void)_startWithCustomBroadcastData:(id)a3
{
  id v5;
  int64_t state;
  const void **v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  const void **v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  _BOOL4 v35;
  const char *v36;
  const char *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  int v42;
  const char *v43;
  const char *v44;
  void *v45;
  const void **v46;
  uint64_t v47;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *v49;
  _BOOL4 v50;
  const char *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  id v56;
  objc_class *v57;
  _BOOL4 v58;
  const char *v59;
  uint64_t v60;
  objc_class *v61;
  int v62;
  uint64_t v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  _BOOL4 v66;
  const char *v67;
  uint64_t v68;
  objc_class *v69;
  int v70;
  const char *v71;
  const char *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  NFReaderSession *readerSession;
  const char *Name;
  const char *v94;
  const char *v95;
  const char *v96;
  _QWORD v97[6];
  const __CFString *v98;
  void *v99;
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[4];
  _QWORD v103[4];
  uint8_t buf[8];
  __int16 v105;
  const char *v106;
  __int16 v107;
  const char *v108;
  __int16 v109;
  int v110;
  __int16 v111;
  void *v112;
  _QWORD v113[5];
  _QWORD v114[5];
  _QWORD v115[5];
  _QWORD v116[5];
  _QWORD v117[5];
  _QWORD v118[8];

  v118[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v5, "length") == 6)
        goto LABEL_4;
      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v14 = objc_claimAutoreleasedReturnValue();
      v115[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid Parameter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v19;
      v116[1] = &unk_1E3B68C40;
      v115[1] = CFSTR("Line");
      v115[2] = CFSTR("Method");
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v116[2] = v20;
      v115[3] = *MEMORY[0x1E0CB2938];
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 587);
      v116[3] = v21;
      v115[4] = *MEMORY[0x1E0CB2D68];
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid data length"));
      v116[4] = v22;
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = v116;
      v25 = v115;
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v14 = objc_claimAutoreleasedReturnValue();
      v117[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid Parameter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = v19;
      v118[1] = &unk_1E3B68C28;
      v117[1] = CFSTR("Line");
      v117[2] = CFSTR("Method");
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v118[2] = v20;
      v117[3] = *MEMORY[0x1E0CB2938];
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 584);
      v118[3] = v21;
      v117[4] = *MEMORY[0x1E0CB2D68];
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid data type"));
      v118[4] = v22;
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = v118;
      v25 = v117;
    }
    objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v18;
    v28 = v14;
    v29 = 10;
LABEL_20:
    v30 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, v29, v26);
    -[NFConnectionHandoverInitiator _triggerInvalidateCB:]((uint64_t)self, v30);

LABEL_21:
LABEL_22:

    goto LABEL_23;
  }
LABEL_4:
  if (!self)
    goto LABEL_24;
  state = self->super._state;
  if (state == 3)
  {
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_FAULT, "Dropping start request due to invalidation is in progress", buf, 2u);
    }
    goto LABEL_22;
  }
  if (state != 2)
  {
    if (state == 1)
    {
      v7 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v9 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v13 = 45;
        if (isMetaClass)
          v13 = 43;
        v9(6, "%c[%{public}s %{public}s]:%i Start is in progress", v13, ClassName, Name, 593);
      }
      dispatch_get_specific(*v7);
      NFSharedLogGetLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v16;
      v105 = 2082;
      v106 = object_getClassName(self);
      v107 = 2082;
      v108 = sel_getName(a2);
      v109 = 1024;
      v110 = 593;
      v17 = "%c[%{public}s %{public}s]:%i Start is in progress";
      goto LABEL_67;
    }
LABEL_24:
    v31 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v32 = NFLogGetLogger();
    v33 = (void (*)(uint64_t, const char *, ...))v32;
    if (v5)
    {
      if (v32)
      {
        v34 = object_getClass(self);
        v35 = class_isMetaClass(v34);
        v36 = object_getClassName(self);
        v37 = sel_getName(a2);
        objc_msgSend(v5, "debugDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 45;
        if (v35)
          v39 = 43;
        v33(6, "%c[%{public}s %{public}s]:%i customBroadcast=%{public}@", v39, v36, v37, 611, v38);

      }
      dispatch_get_specific(*v31);
      NFSharedLogGetLogger();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = object_getClass(self);
        if (class_isMetaClass(v41))
          v42 = 43;
        else
          v42 = 45;
        v43 = object_getClassName(self);
        v44 = sel_getName(a2);
        objc_msgSend(v5, "debugDescription");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v42;
        v105 = 2082;
        v106 = v43;
        v107 = 2082;
        v108 = v44;
        v109 = 1024;
        v110 = 611;
        v111 = 2114;
        v112 = v45;
        _os_log_impl(&dword_19B5EB000, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i customBroadcast=%{public}@", buf, 0x2Cu);

      }
    }
    else
    {
      if (v32)
      {
        v57 = object_getClass(self);
        v58 = class_isMetaClass(v57);
        v59 = object_getClassName(self);
        v95 = sel_getName(a2);
        v60 = 45;
        if (v58)
          v60 = 43;
        v33(6, "%c[%{public}s %{public}s]:%i ", v60, v59, v95, 613);
      }
      dispatch_get_specific(*v31);
      NFSharedLogGetLogger();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v61 = object_getClass(self);
        if (class_isMetaClass(v61))
          v62 = 43;
        else
          v62 = 45;
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v62;
        v105 = 2082;
        v106 = object_getClassName(self);
        v107 = 2082;
        v108 = sel_getName(a2);
        v109 = 1024;
        v110 = 613;
        _os_log_impl(&dword_19B5EB000, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
      }
    }

    if (self && self->_readerSession)
    {
      dispatch_get_specific(*v31);
      v63 = NFLogGetLogger();
      if (v63)
      {
        v64 = (void (*)(uint64_t, const char *, ...))v63;
        v65 = object_getClass(self);
        v66 = class_isMetaClass(v65);
        v67 = object_getClassName(self);
        v96 = sel_getName(a2);
        v68 = 45;
        if (v66)
          v68 = 43;
        v64(6, "%c[%{public}s %{public}s]:%i Already started in initiator mode", v68, v67, v96, 617);
      }
      dispatch_get_specific(*v31);
      NFSharedLogGetLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      v69 = object_getClass(self);
      if (class_isMetaClass(v69))
        v70 = 43;
      else
        v70 = 45;
      v71 = object_getClassName(self);
      v72 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v70;
      v105 = 2082;
      v106 = v71;
      v107 = 2082;
      v108 = v72;
      v109 = 1024;
      v110 = 617;
      v17 = "%c[%{public}s %{public}s]:%i Already started in initiator mode";
LABEL_67:
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x22u);
      goto LABEL_22;
    }
    +[NFHardwareManager sharedHardwareManagerWithNoUI](NFHardwareManager, "sharedHardwareManagerWithNoUI");
    v14 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    if (-[NSObject getHwSupport](v14, "getHwSupport") - 4 > 0xFFFFFFFD)
    {
      -[NSObject getRadioEnabledState:](v14, "getRadioEnabledState:", buf);
      v82 = objc_claimAutoreleasedReturnValue();
      if (v82)
      {
        v19 = (void *)v82;
        goto LABEL_73;
      }
      if (*(_QWORD *)buf == 1)
      {
        v19 = (void *)objc_opt_new();
        _GenerateInitiatorECPFrame(0);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v83);

        if (self && self->super._type == 2)
        {
          _GeneratePreferredReceiverECPFrame(0);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v84);

        }
        v85 = objc_alloc(MEMORY[0x1E0C99E08]);
        v98 = CFSTR("session.suspendOnECP");
        v99 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = (void *)objc_msgSend(v85, "initWithDictionary:", v86);

        if (self && self->super._type == 2)
        {
          _GeneratePreferredReceiverECPFrame(v5);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          _GenerateInitiatorECPFrame(v5);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v90 = v88;
        -[NFConnectionHandoverInitiator setEcpFrame:]((uint64_t)self, v88);

        v97[0] = MEMORY[0x1E0C809B0];
        v97[1] = 3221225472;
        v97[2] = __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke;
        v97[3] = &unk_1E3B52220;
        v97[4] = self;
        v97[5] = a2;
        -[NSObject startReaderSessionWithAttributes:completion:](v14, "startReaderSessionWithAttributes:completion:", v87, v97);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[NFConnectionHandoverInitiator setReaderSession:]((uint64_t)self, v91);

        if (self)
        {
          -[NFReaderSession setDelegate:](self->_readerSession, "setDelegate:", self);
          readerSession = self->_readerSession;
        }
        else
        {
          objc_msgSend(0, "setDelegate:", 0);
          readerSession = 0;
        }
        -[NFSession setSessionDelegate:](readerSession, "setSessionDelegate:", self);
        -[NFConnectionHandoverInitiator setConnectedTag:]((uint64_t)self);
        if (self)
          self->super._state = 1;

        goto LABEL_21;
      }
      v89 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NFC radio disabled");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = v75;
      v101[1] = &unk_1E3B68C88;
      v100[1] = CFSTR("Line");
      v100[2] = CFSTR("Method");
      v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v101[2] = v76;
      v100[3] = *MEMORY[0x1E0CB2938];
      v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 637);
      v101[3] = v77;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 4);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v89;
      v80 = v74;
      v81 = 50;
    }
    else
    {
      v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "No NFC on device");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v103[0] = v75;
      v103[1] = &unk_1E3B68C70;
      v102[1] = CFSTR("Line");
      v102[2] = CFSTR("Method");
      v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v103[2] = v76;
      v102[3] = *MEMORY[0x1E0CB2938];
      v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 627);
      v103[3] = v77;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 4);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v73;
      v80 = v74;
      v81 = 57;
    }
    v19 = (void *)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, v81, v78);

LABEL_73:
    -[NFConnectionHandoverInitiator _triggerInvalidateCB:]((uint64_t)self, v19);
    goto LABEL_21;
  }
  v46 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v47 = NFLogGetLogger();
  if (v47)
  {
    v48 = (void (*)(uint64_t, const char *, ...))v47;
    v49 = object_getClass(self);
    v50 = class_isMetaClass(v49);
    v51 = object_getClassName(self);
    v94 = sel_getName(a2);
    v52 = 45;
    if (v50)
      v52 = 43;
    v48(6, "%c[%{public}s %{public}s]:%i Previously started", v52, v51, v94, 598);
  }
  dispatch_get_specific(*v46);
  NFSharedLogGetLogger();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v54 = object_getClass(self);
    if (class_isMetaClass(v54))
      v55 = 43;
    else
      v55 = 45;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v55;
    v105 = 2082;
    v106 = object_getClassName(self);
    v107 = 2082;
    v108 = sel_getName(a2);
    v109 = 1024;
    v110 = 598;
    _os_log_impl(&dword_19B5EB000, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Previously started", buf, 0x22u);
  }

  if (v5)
  {
    v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v14 = objc_claimAutoreleasedReturnValue();
    v113[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = v19;
    v114[1] = &unk_1E3B68C58;
    v113[1] = CFSTR("Line");
    v113[2] = CFSTR("Method");
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v114[2] = v20;
    v113[3] = *MEMORY[0x1E0CB2938];
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 600);
    v114[3] = v21;
    v113[4] = *MEMORY[0x1E0CB2D68];
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Can't update broadcast data unless session is stopped"));
    v114[4] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v56;
    v28 = v14;
    v29 = 12;
    goto LABEL_20;
  }
LABEL_23:

}

- (void)_triggerInvalidateCB:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  char *v8;

  v3 = a2;
  v4 = v3;
  if (a1 && *(_QWORD *)(a1 + 24) != 4)
  {
    *(_QWORD *)(a1 + 24) = 4;
    v5 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__NFConnectionHandoverInitiator__triggerInvalidateCB___block_invoke;
    block[3] = &unk_1E3B51A10;
    block[4] = a1;
    v7 = v3;
    v8 = sel__triggerInvalidateCB_;
    dispatch_async(v5, block);

  }
}

- (void)setEcpFrame:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

void __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  os_unfair_lock_s *v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke_2;
  v11[3] = &unk_1E3B51BA0;
  v8 = *(os_unfair_lock_s **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v8;
  v14 = v5;
  v15 = v7;
  v9 = v5;
  v10 = v6;
  -[NFConnectionHandoverController executeWithLock:](v8, v11);

}

void __63__NFConnectionHandoverInitiator__startWithCustomBroadcastData___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v22[0] = *MEMORY[0x1E0CB2D50];
    v6 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(*(id *)(a1 + 32), "code") > 70)
      v7 = 71;
    else
      v7 = objc_msgSend(*(id *)(a1 + 32), "code");
    objc_msgSend(v6, "stringWithUTF8String:", NFResultCodeString_0[v7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CB3388];
    v16 = *(_QWORD *)(a1 + 32);
    v23[0] = v9;
    v23[1] = v16;
    v22[1] = v15;
    v22[2] = CFSTR("Line");
    v23[2] = &unk_1E3B68CA0;
    v22[3] = CFSTR("Method");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v23[3] = v17;
    v22[4] = *MEMORY[0x1E0CB2938];
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 660);
    v23[4] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, v5, v19);
    objc_msgSend(v2, "_stopWithError:", v20);

  }
  else
  {
    +[NFReaderSessionPollConfig pollConfigWithTechnology:](NFReaderSessionPollConfig, "pollConfigWithTechnology:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      v11 = *(_QWORD *)(v10 + 96);
    else
      v11 = 0;
    objc_msgSend(v8, "setEcp:", v11);
    objc_msgSend(v9, "setSkipMifareClassify:", 1);
    objc_msgSend(v9, "setPollDuration:", 75);
    v12 = *(void **)(a1 + 48);
    v21 = 0;
    v13 = objc_msgSend(v12, "startPollingWithConfig:error:", v9, &v21);
    v4 = v21;
    v14 = *(_QWORD **)(a1 + 40);
    if ((v13 & 1) != 0)
    {
      if (v14)
        v14[3] = 2;
    }
    else
    {
      objc_msgSend(v14, "_stopWithError:", v4);
    }
  }

}

- (void)setReaderSession:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setConnectedTag:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), 0);
}

- (void)_tagConnectionDidExpire
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *Name;
  _QWORD v22[4];
  _QWORD v23[4];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!self->_connectedTag)
  {
    v4 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i Tag connection timer expired", v10, ClassName, Name, 693);
    }
    dispatch_get_specific(*v4);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = object_getClass(self);
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      *(_DWORD *)buf = 67109890;
      v25 = v13;
      v26 = 2082;
      v27 = object_getClassName(self);
      v28 = 2082;
      v29 = sel_getName(a2);
      v30 = 1024;
      v31 = 693;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag connection timer expired", buf, 0x22u);
    }

    -[NFReaderSession stopPollingWithError:](self->_readerSession, "stopPollingWithError:", 0);
    if (self->_delayRequestCompletion)
    {
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Tag Not Found");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v16;
      v23[1] = &unk_1E3B68CB8;
      v22[1] = CFSTR("Line");
      v22[2] = CFSTR("Method");
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v23[2] = v17;
      v22[3] = *MEMORY[0x1E0CB2938];
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 697);
      v23[3] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 28, v19);
      -[NFConnectionHandoverInitiator _triggerDelayRequestCompletionWithSelect:error:](self, "_triggerDelayRequestCompletionWithSelect:error:", 0, v20);

    }
  }
}

- (void)_delayRequestDidExpire
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  void *v14;
  NFReaderSession *readerSession;
  NFReaderSession *v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const char *Name;
  const char *v36;
  id v37;
  _QWORD v38[4];
  _QWORD v39[4];
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Retry send request", v10, ClassName, Name, 703);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = object_getClass(self);
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    *(_DWORD *)buf = 67109890;
    v41 = v13;
    v42 = 2082;
    v43 = object_getClassName(self);
    v44 = 2082;
    v45 = sel_getName(a2);
    v46 = 1024;
    v47 = 703;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Retry send request", buf, 0x22u);
  }

  if (self && self->_readerSession)
  {
    +[NFReaderSessionPollConfig pollConfigWithTechnology:](NFReaderSessionPollConfig, "pollConfigWithTechnology:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEcp:", self->_ecpFrame);
    objc_msgSend(v14, "setSkipMifareClassify:", 1);
    objc_msgSend(v14, "setPollDuration:", 75);
    readerSession = self->_readerSession;
    v37 = 0;
    v16 = readerSession;
    v17 = -[NFReaderSession startPollingWithConfig:error:](v16, "startPollingWithConfig:error:", v14, &v37);
    v18 = v37;

    if (v17)
    {
      -[NFTimer startTimer:](self->_tagConnectionTimer, "startTimer:", 1.0);
    }
    else
    {
      -[NFConnectionHandoverInitiator _triggerDelayRequestCompletionWithSelect:error:](self, "_triggerDelayRequestCompletionWithSelect:error:", 0, v18);
      -[NFConnectionHandoverInitiator _stopWithError:](self, "_stopWithError:", v18);
    }
  }
  else
  {
    dispatch_get_specific(*v4);
    v19 = NFLogGetLogger();
    if (v19)
    {
      v20 = (void (*)(uint64_t, const char *, ...))v19;
      v21 = object_getClass(self);
      v22 = class_isMetaClass(v21);
      v23 = object_getClassName(self);
      v36 = sel_getName(a2);
      v24 = 45;
      if (v22)
        v24 = 43;
      v20(3, "%c[%{public}s %{public}s]:%i Reader session terminated", v24, v23, v36, 706);
    }
    dispatch_get_specific(*v4);
    NFSharedLogGetLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = object_getClass(self);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      v28 = object_getClassName(self);
      v29 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v41 = v27;
      v42 = 2082;
      v43 = v28;
      v44 = 2082;
      v45 = v29;
      v46 = 1024;
      v47 = 706;
      _os_log_impl(&dword_19B5EB000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader session terminated", buf, 0x22u);
    }

    v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v38[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v14;
    v39[1] = &unk_1E3B68CD0;
    v38[1] = CFSTR("Line");
    v38[2] = CFSTR("Method");
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v39[2] = v31;
    v38[3] = *MEMORY[0x1E0CB2938];
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 707);
    v39[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v30, "initWithDomain:code:userInfo:", v18, 12, v33);
    -[NFConnectionHandoverInitiator _triggerDelayRequestCompletionWithSelect:error:](self, "_triggerDelayRequestCompletionWithSelect:error:", 0, v34);

  }
}

- (void)_processSelectRetry:(id)a3 originalRequest:(id)a4 responseHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  const void **v14;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *v17;
  _BOOL4 v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  void *v31;
  void *v32;
  SEL v33;
  NFReaderSession *readerSession;
  NFTag *connectedTag;
  NFTimer *delayRequestTimer;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  const char *v44;
  const char *Name;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD block[4];
  id v49;
  SEL v50;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  double v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "retryInMS");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (double)objc_msgSend(v12, "integerValue") / 1000.0;

  v14 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  v16 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v13 >= 0.0)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v27 = 45;
      if (isMetaClass)
        v27 = 43;
      v16(6, "%c[%{public}s %{public}s]:%i Received delay request=%fs", v27, ClassName, Name, 740, *(_QWORD *)&v13);
    }
    dispatch_get_specific(*v14);
    NFSharedLogGetLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      *(_DWORD *)buf = 67110146;
      v52 = v30;
      v53 = 2082;
      v54 = object_getClassName(self);
      v55 = 2082;
      v56 = sel_getName(a2);
      v57 = 1024;
      v58 = 740;
      v59 = 2048;
      v60 = v13;
      _os_log_impl(&dword_19B5EB000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Received delay request=%fs", buf, 0x2Cu);
    }

    v31 = (void *)objc_msgSend(v10, "copy");
    -[NFConnectionHandoverInitiator setDelayRequest:]((uint64_t)self, v31);

    objc_msgSend(v9, "retryRandom");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      -[NFConnectionHandoverRequest setRetryRandom:](self->_delayRequest, "setRetryRandom:", v32);

      objc_setProperty_nonatomic_copy(self, v33, v11, 72);
      readerSession = self->_readerSession;
    }
    else
    {
      objc_msgSend(0, "setRetryRandom:", v32);

      readerSession = 0;
    }
    -[NFReaderSession stopPolling](readerSession, "stopPolling");
    connectedTag = self->_connectedTag;
    self->_connectedTag = 0;

    delayRequestTimer = self->_delayRequestTimer;
    if (!delayRequestTimer)
    {
      v37 = MEMORY[0x1E0C809B0];
      if (!self->_tagConnectionTimer)
      {
        v38 = objc_alloc(MEMORY[0x1E0DE78F8]);
        v47[0] = v37;
        v47[1] = 3221225472;
        v47[2] = __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_171;
        v47[3] = &unk_1E3B51A60;
        v47[4] = self;
        dispatch_get_global_queue(25, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v38, "initWithCallback:queue:", v47, v39);
        objc_storeStrong((id *)&self->_tagConnectionTimer, v40);

      }
      v41 = objc_alloc(MEMORY[0x1E0DE78F8]);
      v46[0] = v37;
      v46[1] = 3221225472;
      v46[2] = __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_3;
      v46[3] = &unk_1E3B51A60;
      v46[4] = self;
      dispatch_get_global_queue(25, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v41, "initWithCallback:queue:", v46, v42);
      objc_storeStrong((id *)&self->_delayRequestTimer, v43);

      delayRequestTimer = self->_delayRequestTimer;
    }
    -[NFTimer startTimer:](delayRequestTimer, "startTimer:", v13);
  }
  else
  {
    if (Logger)
    {
      v17 = object_getClass(self);
      v18 = class_isMetaClass(v17);
      v19 = object_getClassName(self);
      v44 = sel_getName(a2);
      v20 = 45;
      if (v18)
        v20 = 43;
      v16(3, "%c[%{public}s %{public}s]:%i Invalid delay request=%fs", v20, v19, v44, 734, *(_QWORD *)&v13);
    }
    dispatch_get_specific(*v14);
    NFSharedLogGetLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(self);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      *(_DWORD *)buf = 67110146;
      v52 = v23;
      v53 = 2082;
      v54 = object_getClassName(self);
      v55 = 2082;
      v56 = sel_getName(a2);
      v57 = 1024;
      v58 = 734;
      v59 = 2048;
      v60 = v13;
      _os_log_impl(&dword_19B5EB000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid delay request=%fs", buf, 0x2Cu);
    }

    if (self)
      self = (NFConnectionHandoverInitiator *)self->super._callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke;
    block[3] = &unk_1E3B52248;
    v49 = v11;
    v50 = a2;
    dispatch_async(&self->super.super, block);

  }
}

void __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E3B68CE8;
  v10[1] = CFSTR("Line");
  v10[2] = CFSTR("Method");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x1E0CB2938];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 736);
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, 12, v8);
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v9);

}

- (void)setDelayRequest:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

void __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_171(uint64_t a1)
{
  os_unfair_lock_s *v1;
  _QWORD v2[5];

  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_2;
  v2[3] = &unk_1E3B51A60;
  v2[4] = v1;
  -[NFConnectionHandoverController executeWithLock:](v1, v2);
}

uint64_t __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tagConnectionDidExpire");
}

void __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_s *v1;
  _QWORD v2[5];

  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_4;
  v2[3] = &unk_1E3B51A60;
  v2[4] = v1;
  -[NFConnectionHandoverController executeWithLock:](v1, v2);
}

uint64_t __85__NFConnectionHandoverInitiator__processSelectRetry_originalRequest_responseHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_delayRequestDidExpire");
}

- (void)sendHandoverRequest:(id)a3 responseHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];
  _QWORD block[4];
  _QWORD v17[2];

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "encode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke_173;
    v13[3] = &unk_1E3B52298;
    v10 = (id *)v15;
    v15[0] = v8;
    v15[1] = a2;
    v13[4] = self;
    v14 = v7;
    v11 = v8;
    -[NFConnectionHandoverInitiator send:responseHandler:](self, "send:responseHandler:", v9, v13);

  }
  else
  {
    if (self)
      self = (NFConnectionHandoverInitiator *)self->super._callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke;
    block[3] = &unk_1E3B52248;
    v10 = (id *)v17;
    v17[0] = v8;
    v17[1] = a2;
    v12 = v8;
    dispatch_async(&self->super.super, block);
  }

}

void __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexpected Result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E3B68D00;
  v10[1] = CFSTR("Line");
  v10[2] = CFSTR("Method");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x1E0CB2938];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 773);
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, 13, v8);
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v9);

}

void __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke_173(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
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
  const char *v20;
  os_unfair_lock_s *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *Name;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  _QWORD v42[4];
  _QWORD v43[5];

  v43[4] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(a2, "decodeCHSelect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "retryInMS");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6
        && (v7 = (void *)v6,
            objc_msgSend(v5, "retryRandom"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v8,
            v7,
            v8))
      {
        v9 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        Logger = NFLogGetLogger();
        if (Logger)
        {
          v11 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 56));
          v15 = 45;
          if (isMetaClass)
            v15 = 43;
          v11(6, "%c[%{public}s %{public}s]:%i Received retry response", v15, ClassName, Name, 792);
        }
        dispatch_get_specific(*v9);
        NFSharedLogGetLogger();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v17))
            v18 = 43;
          else
            v18 = 45;
          v19 = object_getClassName(*(id *)(a1 + 32));
          v20 = sel_getName(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 67109890;
          v35 = v18;
          v36 = 2082;
          v37 = v19;
          v38 = 2082;
          v39 = v20;
          v40 = 1024;
          v41 = 792;
          _os_log_impl(&dword_19B5EB000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Received retry response", buf, 0x22u);
        }

        v21 = *(os_unfair_lock_s **)(a1 + 32);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke_176;
        v30[3] = &unk_1E3B52270;
        v30[4] = v21;
        v31 = v5;
        v32 = *(id *)(a1 + 40);
        v33 = *(id *)(a1 + 48);
        -[NFConnectionHandoverController executeWithLock:](v21, v30);

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
    }
    else
    {
      v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Decoding Error");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v24;
      v43[1] = &unk_1E3B68D18;
      v42[1] = CFSTR("Line");
      v42[2] = CFSTR("Method");
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
      v43[2] = v25;
      v42[3] = *MEMORY[0x1E0CB2938];
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 786);
      v43[3] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 23, v27);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

uint64_t __69__NFConnectionHandoverInitiator_sendHandoverRequest_responseHandler___block_invoke_176(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processSelectRetry:originalRequest:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)send:(id)a3 responseHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke;
  v11[3] = &unk_1E3B522E8;
  v13 = v8;
  v14 = a2;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  v10 = v8;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v11);

}

void __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  _QWORD block[5];
  id v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_11;
  v3 = *(id *)(v2 + 48);
  if (!v3)
  {
LABEL_7:
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v11 = *(NSObject **)(v10 + 32);
LABEL_9:
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_2;
      v18[3] = &unk_1E3B52248;
      v12 = *(id *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v19 = v12;
      v20 = v13;
      dispatch_async(v11, v18);
      v9 = v19;
      goto LABEL_10;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_9;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {

    goto LABEL_7;
  }
  v5 = *(_QWORD *)(v4 + 56);

  if (!v5)
    goto LABEL_7;
  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_179;
  block[3] = &unk_1E3B522E8;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v16 = v7;
  v14 = *(_OWORD *)(a1 + 48);
  v8 = (id)v14;
  v17 = v14;
  dispatch_async(v6, block);

  v9 = v16;
LABEL_10:

}

void __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E3B68D30;
  v10[1] = CFSTR("Line");
  v10[2] = CFSTR("Method");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x1E0CB2938];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 810);
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, 12, v8);
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v9);

}

void __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_179(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  const void **v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id *v22;
  id *v23;
  uint64_t v24;
  NSObject *v25;
  const char *ClassName;
  const char *Name;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = *(_QWORD *)(a1 + 40);
  v35 = 0;
  v4 = v2;
  objc_msgSend(v4, "transceive:error:", v3, &v35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v35;

  if (v6)
  {
    v7 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Send request error = %{public}@", v12, ClassName, Name, 819, v6);
    }
    dispatch_get_specific(*v7);
    NFSharedLogGetLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      v16 = object_getClassName(*(id *)(a1 + 32));
      v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v37 = v15;
      v38 = 2082;
      v39 = v16;
      v40 = 2082;
      v41 = v17;
      v42 = 1024;
      v43 = 819;
      v44 = 2114;
      v45 = v6;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Send request error = %{public}@", buf, 0x2Cu);
    }

    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      v19 = *(void **)(v18 + 48);
    else
      v19 = 0;
    objc_msgSend(v19, "endSession");
    v20 = *(_QWORD *)(a1 + 32);
    if (v20)
      v21 = *(NSObject **)(v20 + 32);
    else
      v21 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_181;
    block[3] = &unk_1E3B522C0;
    v22 = &v34;
    v34 = *(id *)(a1 + 48);
    v23 = &v33;
    v33 = v6;
    dispatch_async(v21, block);
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 32);
    if (v24)
      v25 = *(NSObject **)(v24 + 32);
    else
      v25 = 0;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_2_182;
    v28[3] = &unk_1E3B51B00;
    v22 = &v31;
    v31 = *(id *)(a1 + 48);
    v23 = &v29;
    v29 = v5;
    v30 = 0;
    dispatch_async(v25, v28);

  }
}

uint64_t __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_181(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __54__NFConnectionHandoverInitiator_send_responseHandler___block_invoke_2_182(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)stop
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__NFConnectionHandoverInitiator_stop__block_invoke;
  v2[3] = &unk_1E3B51A60;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

uint64_t __37__NFConnectionHandoverInitiator_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopWithError:", 0);
}

- (void)_stopWithError:(id)a3
{
  id v5;
  int64_t state;
  const void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  NFTag **p_connectedTag;
  NFTag *v28;
  NFReaderSession *readerSession;
  SEL v30;
  const void **v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  int64_t v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  int64_t v43;
  NSObject *v44;
  uint32_t v45;
  const void **v46;
  uint64_t Logger;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v52;
  objc_class *v53;
  int v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *Name;
  _QWORD v59[5];
  id v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self)
    goto LABEL_26;
  state = self->super._state;
  if ((unint64_t)(state - 1) >= 2)
  {
    if (state == 4)
    {
      v46 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v48 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v52 = 45;
        if (isMetaClass)
          v52 = 43;
        v48(6, "%c[%{public}s %{public}s]:%i Session previously invalidated", v52, ClassName, Name, 848);
      }
      dispatch_get_specific(*v46);
      NFSharedLogGetLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      v53 = object_getClass(self);
      if (class_isMetaClass(v53))
        v54 = 43;
      else
        v54 = 45;
      *(_DWORD *)buf = 67109890;
      v62 = v54;
      v63 = 2082;
      v64 = object_getClassName(self);
      v65 = 2082;
      v66 = sel_getName(a2);
      v67 = 1024;
      v68 = 848;
      v17 = "%c[%{public}s %{public}s]:%i Session previously invalidated";
LABEL_49:
      v44 = v14;
      v45 = 34;
LABEL_50:
      _os_log_impl(&dword_19B5EB000, v44, OS_LOG_TYPE_DEFAULT, v17, buf, v45);
LABEL_51:

      goto LABEL_52;
    }
    if (state == 3)
    {
      v7 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v8 = NFLogGetLogger();
      if (v8)
      {
        v9 = (void (*)(uint64_t, const char *, ...))v8;
        v10 = object_getClass(self);
        v11 = class_isMetaClass(v10);
        v12 = object_getClassName(self);
        v56 = sel_getName(a2);
        v13 = 45;
        if (v11)
          v13 = 43;
        v9(6, "%c[%{public}s %{public}s]:%i Stop in progress", v13, v12, v56, 844);
      }
      dispatch_get_specific(*v7);
      NFSharedLogGetLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      v62 = v16;
      v63 = 2082;
      v64 = object_getClassName(self);
      v65 = 2082;
      v66 = sel_getName(a2);
      v67 = 1024;
      v68 = 844;
      v17 = "%c[%{public}s %{public}s]:%i Stop in progress";
      goto LABEL_49;
    }
LABEL_26:
    v31 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v32 = NFLogGetLogger();
    if (v32)
    {
      v33 = (void (*)(uint64_t, const char *, ...))v32;
      v34 = object_getClass(self);
      if (class_isMetaClass(v34))
        v35 = 43;
      else
        v35 = 45;
      v36 = object_getClassName(self);
      v37 = sel_getName(a2);
      if (self)
        v38 = self->super._state;
      else
        v38 = 0;
      v33(6, "%c[%{public}s %{public}s]:%i Session not started, state=%ld", v35, v36, v37, 853, v38);
    }
    dispatch_get_specific(*v31);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    v39 = object_getClass(self);
    if (class_isMetaClass(v39))
      v40 = 43;
    else
      v40 = 45;
    v41 = object_getClassName(self);
    v42 = sel_getName(a2);
    if (self)
      v43 = self->super._state;
    else
      v43 = 0;
    *(_DWORD *)buf = 67110146;
    v62 = v40;
    v63 = 2082;
    v64 = v41;
    v65 = 2082;
    v66 = v42;
    v67 = 1024;
    v68 = 853;
    v69 = 2048;
    v70 = v43;
    v17 = "%c[%{public}s %{public}s]:%i Session not started, state=%ld";
    v44 = v14;
    v45 = 44;
    goto LABEL_50;
  }
  v18 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v19 = NFLogGetLogger();
  if (v19)
  {
    v20 = (void (*)(uint64_t, const char *, ...))v19;
    v21 = object_getClass(self);
    v22 = class_isMetaClass(v21);
    v55 = object_getClassName(self);
    v57 = sel_getName(a2);
    v23 = 45;
    if (v22)
      v23 = 43;
    v20(6, "%c[%{public}s %{public}s]:%i error=%{public}@", v23, v55, v57, 857, v5);
  }
  dispatch_get_specific(*v18);
  NFSharedLogGetLogger();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = object_getClass(self);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    *(_DWORD *)buf = 67110146;
    v62 = v26;
    v63 = 2082;
    v64 = object_getClassName(self);
    v65 = 2082;
    v66 = sel_getName(a2);
    v67 = 1024;
    v68 = 857;
    v69 = 2114;
    v70 = (int64_t)v5;
    _os_log_impl(&dword_19B5EB000, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
  }

  self->super._state = 3;
  p_connectedTag = &self->_connectedTag;
  if (self->_connectedTag)
  {
    -[NFReaderSession disconnectTag](self->_readerSession, "disconnectTag");
    v28 = *p_connectedTag;
    *p_connectedTag = 0;

  }
  readerSession = self->_readerSession;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __48__NFConnectionHandoverInitiator__stopWithError___block_invoke;
  v59[3] = &unk_1E3B51E70;
  v59[4] = self;
  v60 = v5;
  -[NFSession endSessionWithCompletion:](readerSession, "endSessionWithCompletion:", v59);
  objc_storeStrong((id *)&self->_readerSession, 0);
  objc_storeStrong((id *)&self->_connectedTag, 0);
  objc_storeStrong((id *)&self->_delayRequest, 0);
  objc_setProperty_nonatomic_copy(self, v30, 0, 72);
  -[NFTimer stopTimer](self->_delayRequestTimer, "stopTimer");
  -[NFTimer stopTimer](self->_tagConnectionTimer, "stopTimer");

LABEL_52:
}

void __48__NFConnectionHandoverInitiator__stopWithError___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  os_unfair_lock_s *v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__NFConnectionHandoverInitiator__stopWithError___block_invoke_2;
  v2[3] = &unk_1E3B51E70;
  v1 = *(void **)(a1 + 40);
  v3 = *(os_unfair_lock_s **)(a1 + 32);
  v4 = v1;
  -[NFConnectionHandoverController executeWithLock:](v3, v2);

}

void __48__NFConnectionHandoverInitiator__stopWithError___block_invoke_2(uint64_t a1)
{
  -[NFConnectionHandoverInitiator _triggerInvalidateCB:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __54__NFConnectionHandoverInitiator__triggerInvalidateCB___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "controller:didInvalidated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Success");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      v19[1] = &unk_1E3B68D48;
      v18[1] = CFSTR("Line");
      v18[2] = CFSTR("Method");
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
      v19[2] = v11;
      v18[3] = *MEMORY[0x1E0CB2938];
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 890);
      v19[3] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, 0, v13);
      objc_msgSend(v6, "controller:didInvalidated:", v7, v14);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "controller:didInvalidate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_triggerDelayRequestCompletionWithSelect:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id delayRequestCompletion;
  id v9;
  SEL v10;
  NSObject *callbackQueue;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (self)
  {
    delayRequestCompletion = self->_delayRequestCompletion;
    if (delayRequestCompletion)
    {
      v9 = delayRequestCompletion;
      objc_setProperty_nonatomic_copy(self, v10, 0, 72);
      objc_storeStrong((id *)&self->_delayRequest, 0);
      callbackQueue = self->super._callbackQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__NFConnectionHandoverInitiator__triggerDelayRequestCompletionWithSelect_error___block_invoke;
      block[3] = &unk_1E3B51B00;
      v16 = v9;
      v14 = v6;
      v15 = v7;
      v12 = v9;
      dispatch_async(callbackQueue, block);

    }
  }

}

uint64_t __80__NFConnectionHandoverInitiator__triggerDelayRequestCompletionWithSelect_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)handleSessionSuspended:(id)a3 token:(id)a4 reason:(int64_t)a5 field:(id)a6
{
  id v9;
  const void **v10;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *Name;
  _QWORD v21[4];
  id v22;
  NFConnectionHandoverInitiator *v23;
  SEL v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  if (a5 == 2)
  {
    v10 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v12(6, "%c[%{public}s %{public}s]:%i Suspend on remote initiator field detected", v16, ClassName, Name, 925);
    }
    dispatch_get_specific(*v10);
    NFSharedLogGetLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      *(_DWORD *)buf = 67109890;
      v26 = v19;
      v27 = 2082;
      v28 = object_getClassName(self);
      v29 = 2082;
      v30 = sel_getName(a2);
      v31 = 1024;
      v32 = 925;
      _os_log_impl(&dword_19B5EB000, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Suspend on remote initiator field detected", buf, 0x22u);
    }

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __75__NFConnectionHandoverInitiator_handleSessionSuspended_token_reason_field___block_invoke;
    v21[3] = &unk_1E3B51A10;
    v22 = v9;
    v23 = self;
    v24 = a2;
    -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v21);

  }
}

void __75__NFConnectionHandoverInitiator_handleSessionSuspended_token_reason_field___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const void **v16;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  id v28;
  void *v29;
  const char *Name;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[4];
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "chFieldType");
    v4 = 12;
    if (v3 == 4)
      v4 = 67;
    if (v3 == 5)
      v5 = 68;
    else
      v5 = v4;
    v6 = *(void **)(a1 + 40);
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", NFResultCodeString_0[v5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v9;
    v32[1] = &unk_1E3B68D78;
    v31[1] = CFSTR("Line");
    v31[2] = CFSTR("Method");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
    v32[2] = v10;
    v31[3] = *MEMORY[0x1E0CB2938];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 948);
    v32[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    v14 = v8;
    v15 = v5;
  }
  else
  {
    v16 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 40));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 40));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v22 = 45;
      if (isMetaClass)
        v22 = 43;
      v18(3, "%c[%{public}s %{public}s]:%i Missing field", v22, ClassName, Name, 928);
    }
    dispatch_get_specific(*v16);
    NFSharedLogGetLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(*(id *)(a1 + 40));
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(*(id *)(a1 + 40));
      v27 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v36 = v25;
      v37 = 2082;
      v38 = v26;
      v39 = 2082;
      v40 = v27;
      v41 = 1024;
      v42 = 928;
      _os_log_impl(&dword_19B5EB000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing field", buf, 0x22u);
    }

    v6 = *(void **)(a1 + 40);
    v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v9;
    v34[1] = &unk_1E3B68D60;
    v33[1] = CFSTR("Line");
    v33[2] = CFSTR("Method");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
    v34[2] = v10;
    v33[3] = *MEMORY[0x1E0CB2938];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 929);
    v34[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v28;
    v14 = v8;
    v15 = 12;
  }
  v29 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, v15, v12);
  objc_msgSend(v6, "_stopWithError:", v29);

}

- (BOOL)_processSelectResponse:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const void **v18;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v22;
  const char *ClassName;
  const char *Name;
  uint64_t version;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  int v31;
  NSObject *v32;
  NSObject *callbackQueue;
  BOOL v34;
  const void **v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  uint64_t v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  const void **v46;
  uint64_t v47;
  void (*v48)(uint64_t, const char *, ...);
  objc_class *v49;
  _BOOL4 v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  int v58;
  const void **v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  _BOOL4 isMetaClass;
  const char *v64;
  uint64_t v65;
  NSObject *v66;
  objc_class *v67;
  int v68;
  const char *v69;
  const char *v70;
  const char *v72;
  const char *v73;
  uint64_t v74;
  unsigned __int8 v75;
  _QWORD block[5];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[4];
  int v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  __int16 v91;
  int v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "status") == 27013)
  {
    v6 = (void *)MEMORY[0x1E0DE78E8];
    objc_msgSend(v5, "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "TLVsWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v9 = v8;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v78;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v78 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v13);
        if (objc_msgSend(v14, "tag") == 165)
          break;
        if (v11 == ++v13)
        {
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v15 = v14;

      if (!v15)
        goto LABEL_34;
      -[NSObject childWithTag:](v15, "childWithTag:", 206);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = v16;
        v75 = objc_msgSend(v16, "valueAsUnsignedShort");
        v18 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        Logger = NFLogGetLogger();
        if (Logger)
        {
          v20 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          if (class_isMetaClass(Class))
            v22 = 43;
          else
            v22 = 45;
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          if (self)
            version = self->super._version;
          else
            version = 0;
          v20(6, "%c[%{public}s %{public}s]:%i CurrentVer=%{public}d, remoteVer=%{public}d", v22, ClassName, Name, 981, version, v75);
        }
        dispatch_get_specific(*v18);
        NFSharedLogGetLogger();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = object_getClass(self);
          if (class_isMetaClass(v27))
            v28 = 43;
          else
            v28 = 45;
          v29 = object_getClassName(self);
          v30 = sel_getName(a2);
          if (self)
            v31 = self->super._version;
          else
            v31 = 0;
          *(_DWORD *)buf = 67110402;
          v82 = v28;
          v83 = 2082;
          v84 = v29;
          v85 = 2082;
          v86 = v30;
          v87 = 1024;
          v88 = 981;
          v89 = 1026;
          v90 = v31;
          v91 = 1026;
          v92 = v75;
          _os_log_impl(&dword_19B5EB000, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i CurrentVer=%{public}d, remoteVer=%{public}d", buf, 0x2Eu);
        }

        NFSharedSignpostLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B5EB000, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MISMATCH_APP_VERSION", (const char *)&unk_19B692E4A, buf, 2u);
        }

        if (self)
          callbackQueue = self->super._callbackQueue;
        else
          callbackQueue = 0;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__NFConnectionHandoverInitiator__processSelectResponse___block_invoke;
        block[3] = &unk_1E3B51A60;
        block[4] = self;
        dispatch_async(callbackQueue, block);

        goto LABEL_32;
      }
      v59 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v60 = NFLogGetLogger();
      if (v60)
      {
        v61 = (void (*)(uint64_t, const char *, ...))v60;
        v62 = object_getClass(self);
        isMetaClass = class_isMetaClass(v62);
        v64 = object_getClassName(self);
        v73 = sel_getName(a2);
        v65 = 45;
        if (isMetaClass)
          v65 = 43;
        v61(6, "%c[%{public}s %{public}s]:%i Missing FCI", v65, v64, v73, 975);
      }
      dispatch_get_specific(*v59);
      NFSharedLogGetLogger();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        v67 = object_getClass(self);
        if (class_isMetaClass(v67))
          v68 = 43;
        else
          v68 = 45;
        v69 = object_getClassName(self);
        v70 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v82 = v68;
        v83 = 2082;
        v84 = v69;
        v85 = 2082;
        v86 = v70;
        v87 = 1024;
        v88 = 975;
        _os_log_impl(&dword_19B5EB000, v66, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing FCI", buf, 0x22u);
      }

    }
    else
    {
LABEL_10:

LABEL_34:
      v35 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v36 = NFLogGetLogger();
      if (v36)
      {
        v37 = (void (*)(uint64_t, const char *, ...))v36;
        v38 = object_getClass(self);
        v39 = class_isMetaClass(v38);
        v40 = object_getClassName(self);
        v72 = sel_getName(a2);
        v41 = 45;
        if (v39)
          v41 = 43;
        v37(6, "%c[%{public}s %{public}s]:%i Missing FCI", v41, v40, v72, 969);
      }
      dispatch_get_specific(*v35);
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v42 = object_getClass(self);
        if (class_isMetaClass(v42))
          v43 = 43;
        else
          v43 = 45;
        v44 = object_getClassName(self);
        v45 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v82 = v43;
        v83 = 2082;
        v84 = v44;
        v85 = 2082;
        v86 = v45;
        v87 = 1024;
        v88 = 969;
        _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing FCI", buf, 0x22u);
      }
    }

    goto LABEL_63;
  }
LABEL_32:
  if (objc_msgSend(v5, "status") != 36864)
  {
    v46 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v47 = NFLogGetLogger();
    if (v47)
    {
      v48 = (void (*)(uint64_t, const char *, ...))v47;
      v49 = object_getClass(self);
      v50 = class_isMetaClass(v49);
      v51 = object_getClassName(self);
      v52 = sel_getName(a2);
      v74 = objc_msgSend(v5, "status");
      v53 = 45;
      if (v50)
        v53 = 43;
      v48(6, "%c[%{public}s %{public}s]:%i SELECT failed: status=0x%x", v53, v51, v52, 991, v74);
    }
    dispatch_get_specific(*v46);
    NFSharedLogGetLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v54 = object_getClass(self);
      if (class_isMetaClass(v54))
        v55 = 43;
      else
        v55 = 45;
      v56 = object_getClassName(self);
      v57 = sel_getName(a2);
      v58 = objc_msgSend(v5, "status");
      *(_DWORD *)buf = 67110146;
      v82 = v55;
      v83 = 2082;
      v84 = v56;
      v85 = 2082;
      v86 = v57;
      v87 = 1024;
      v88 = 991;
      v89 = 1024;
      v90 = v58;
      _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SELECT failed: status=0x%x", buf, 0x28u);
    }
LABEL_63:

    v34 = 0;
    goto LABEL_64;
  }
  v34 = 1;
LABEL_64:

  return v34;
}

void __56__NFConnectionHandoverInitiator__processSelectResponse___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerDidDetectUnsupportedReceiverVersion:", *(_QWORD *)(a1 + 32));

}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 version;
  void *v16;
  id v17;
  void *v18;
  const void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
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
  const char *v42;
  const char *v43;
  const void **v44;
  uint64_t Logger;
  void (*v46)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  const void **v55;
  uint64_t v56;
  void (*v57)(uint64_t, const char *, ...);
  objc_class *v58;
  _BOOL4 v59;
  const char *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  NFConnectionHandoverRequest *delayRequest;
  NFConnectionHandoverRequest *v68;
  void *v69;
  void *v70;
  NSObject *callbackQueue;
  const char *v72;
  const char *ClassName;
  const char *v74;
  const char *v75;
  const char *Name;
  const char *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD block[5];
  _QWORD v85[5];
  id v86;
  SEL v87;
  _QWORD v88[5];
  id v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  char v94;
  id v95;
  id v96;
  uint8_t buf[4];
  int v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  const char *v102;
  __int16 v103;
  int v104;
  __int16 v105;
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0;
    v10 = objc_msgSend(v7, "connectTag:error:", v9, &v96);
    v11 = v96;
    v12 = v11;
    if (!v10 || v11)
    {
      v44 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v46 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v49 = 45;
        if (isMetaClass)
          v49 = 43;
        v46(6, "%c[%{public}s %{public}s]:%i Failed to connect to tag : %@", v49, ClassName, Name, 1010, v12);
      }
      dispatch_get_specific(*v44);
      NFSharedLogGetLogger();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = object_getClass(self);
        if (class_isMetaClass(v51))
          v52 = 43;
        else
          v52 = 45;
        v53 = object_getClassName(self);
        v54 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v98 = v52;
        v99 = 2082;
        v100 = v53;
        v101 = 2082;
        v102 = v54;
        v103 = 1024;
        v104 = 1010;
        v105 = 2112;
        v106 = v12;
        _os_log_impl(&dword_19B5EB000, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to connect to tag : %@", buf, 0x2Cu);
      }

      objc_msgSend(v7, "disconnectTagWithCardRemoval:", 0);
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &CH_APP_NAME, 12);
      v14 = v13;
      if (self)
      {
        version = self->super._version;
        if (version)
        {
          buf[0] = 46;
          buf[1] = version;
          objc_msgSend(v13, "appendBytes:length:", buf, 2);
        }
      }
      objc_msgSend(MEMORY[0x1E0DE78B8], "buildAPDUHeaderWithClass:instruction:p1:p2:len:useExtendedLength:", 0, 164, 4, 0, objc_msgSend(v14, "length"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appendData:", v14);
      v17 = (id)objc_msgSend(MEMORY[0x1E0DE78B8], "appendExpectedLength:usingExtendedLength:toAPDU:", 0, 0, v16);
      v95 = 0;
      objc_msgSend(v7, "transceive:error:", v16, &v95);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v95;
      if (v12)
      {
        v80 = v14;
        v82 = v9;
        v19 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v20 = NFLogGetLogger();
        if (v20)
        {
          v21 = (void (*)(uint64_t, const char *, ...))v20;
          v22 = object_getClass(self);
          v23 = class_isMetaClass(v22);
          v72 = object_getClassName(self);
          v74 = sel_getName(a2);
          v24 = 45;
          if (v23)
            v24 = 43;
          v21(6, "%c[%{public}s %{public}s]:%i SELECT failed: %@", v24, v72, v74, 1032, v12);
        }
        dispatch_get_specific(*v19);
        NFSharedLogGetLogger();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = object_getClass(self);
          if (class_isMetaClass(v26))
            v27 = 43;
          else
            v27 = 45;
          v28 = object_getClassName(self);
          v29 = v18;
          v30 = v28;
          v31 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v98 = v27;
          v99 = 2082;
          v100 = v30;
          v18 = v29;
          v101 = 2082;
          v102 = v31;
          v103 = 1024;
          v104 = 1032;
          v105 = 2112;
          v106 = v12;
          _os_log_impl(&dword_19B5EB000, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SELECT failed: %@", buf, 0x2Cu);
        }

        objc_msgSend(v7, "disconnectTagWithCardRemoval:", 0);
        v14 = v80;
        v9 = v82;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DE78D8], "responseWithData:", v18);
        v79 = objc_claimAutoreleasedReturnValue();
        if (-[NFConnectionHandoverInitiator _processSelectResponse:](self, "_processSelectResponse:"))
        {
          v78 = v18;
          v91 = 0;
          v92 = &v91;
          v93 = 0x2020000000;
          v94 = 0;
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke;
          v88[3] = &unk_1E3B524A0;
          v88[4] = self;
          v89 = v9;
          v90 = &v91;
          -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v88);
          if (*((_BYTE *)v92 + 24))
          {
            v81 = v14;
            v83 = v9;
            v55 = (const void **)MEMORY[0x1E0DE7900];
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            v56 = NFLogGetLogger();
            if (v56)
            {
              v57 = (void (*)(uint64_t, const char *, ...))v56;
              v58 = object_getClass(self);
              v59 = class_isMetaClass(v58);
              v60 = object_getClassName(self);
              v77 = sel_getName(a2);
              v61 = 45;
              if (v59)
                v61 = 43;
              v57(6, "%c[%{public}s %{public}s]:%i Sending retry request", v61, v60, v77, 1052);
            }
            dispatch_get_specific(*v55);
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
              v98 = v64;
              v99 = 2082;
              v100 = v65;
              v101 = 2082;
              v102 = v66;
              v103 = 1024;
              v104 = 1052;
              _os_log_impl(&dword_19B5EB000, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Sending retry request", buf, 0x22u);
            }

            if (self)
              delayRequest = self->_delayRequest;
            else
              delayRequest = 0;
            v14 = v81;
            v9 = v83;
            v68 = delayRequest;
            -[NFConnectionHandoverRequest encode](v68, "encode");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v85[0] = MEMORY[0x1E0C809B0];
            v85[1] = 3221225472;
            v85[2] = __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_207;
            v85[3] = &unk_1E3B52338;
            v85[4] = self;
            v86 = v7;
            v87 = a2;
            -[NFConnectionHandoverInitiator send:responseHandler:](self, "send:responseHandler:", v69, v85);

            v18 = v78;
            v70 = (void *)v79;
          }
          else
          {
            if (self)
              callbackQueue = self->super._callbackQueue;
            else
              callbackQueue = 0;
            v70 = (void *)v79;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_209;
            block[3] = &unk_1E3B51A60;
            block[4] = self;
            dispatch_async(callbackQueue, block);
          }

          _Block_object_dispose(&v91, 8);
        }
        else
        {
          objc_msgSend(v7, "disconnectTagWithCardRemoval:", 0);
          v70 = (void *)v79;
        }

      }
    }

  }
  else
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
      v75 = sel_getName(a2);
      v38 = 45;
      if (v36)
        v38 = 43;
      v34(6, "%c[%{public}s %{public}s]:%i No tag found, restart polling", v38, v37, v75, 1001);
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
      v42 = object_getClassName(self);
      v43 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v98 = v41;
      v99 = 2082;
      v100 = v42;
      v101 = 2082;
      v102 = v43;
      v103 = 1024;
      v104 = 1001;
      _os_log_impl(&dword_19B5EB000, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No tag found, restart polling", buf, 0x22u);
    }

    objc_msgSend(v7, "disconnectTagWithCardRemoval:", 0);
  }

}

uint64_t __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v2 = *(_QWORD *)(v2 + 64);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 != 0;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 88);
  else
    v4 = 0;
  return objc_msgSend(v4, "stopTimer");
}

void __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_207(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  os_unfair_lock_s *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_2;
  v10[3] = &unk_1E3B52310;
  v7 = (void *)a1[5];
  v11 = (os_unfair_lock_s *)a1[4];
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v15 = a1[6];
  v8 = v5;
  v9 = v6;
  -[NFConnectionHandoverController executeWithLock:](v11, v10);

}

void __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  -[NFConnectionHandoverInitiator setDelayRequest:](*(_QWORD *)(a1 + 32), 0);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "disconnectTagWithCardRemoval:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_triggerDelayRequestCompletionWithSelect:error:", 0, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "decodeCHSelect");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = 0;
    }
    else
    {
      v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Decoding Error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v6;
      v11[1] = &unk_1E3B68D90;
      v10[1] = CFSTR("Line");
      v10[2] = CFSTR("Method");
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 64)));
      v11[2] = v7;
      v10[3] = *MEMORY[0x1E0CB2938];
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 64)), 1065);
      v11[3] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 23, v9);

    }
    objc_msgSend(*(id *)(a1 + 32), "_triggerDelayRequestCompletionWithSelect:error:", v2, v3);

  }
}

void __61__NFConnectionHandoverInitiator_readerSession_didDetectTags___block_invoke_209(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerDidConnectToReceiver:", *(_QWORD *)(a1 + 32));

}

- (void)readerSessionDidEndUnexpectedly:(id)a3
{
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
  const char *Name;
  _QWORD v16[6];
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", v11, ClassName, Name, 1081);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    *(_DWORD *)buf = 67109890;
    v18 = v14;
    v19 = 2082;
    v20 = object_getClassName(self);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 1081;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", buf, 0x22u);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__NFConnectionHandoverInitiator_readerSessionDidEndUnexpectedly___block_invoke;
  v16[3] = &unk_1E3B51460;
  v16[4] = self;
  v16[5] = a2;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v16);
}

void __65__NFConnectionHandoverInitiator_readerSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Session terminated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = &unk_1E3B68DA8;
  v14[1] = CFSTR("Line");
  v14[2] = CFSTR("Method");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v15[2] = v10;
  v14[3] = *MEMORY[0x1E0CB2938];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 1085);
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 44, v12);
  -[NFConnectionHandoverInitiator _triggerInvalidateCB:](v6, v13);

}

- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4
{
  id v6;
  const void **v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  id v17;
  const char *Name;
  _QWORD v19[5];
  id v20;
  SEL v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", v13, ClassName, Name, 1091);
  }
  dispatch_get_specific(*v7);
  NFSharedLogGetLogger();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67109890;
    v23 = v16;
    v24 = 2082;
    v25 = object_getClassName(self);
    v26 = 2082;
    v27 = sel_getName(a2);
    v28 = 1024;
    v29 = 1091;
    _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", buf, 0x22u);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__NFConnectionHandoverInitiator_readerSessionDidEndUnexpectedly_reason___block_invoke;
  v19[3] = &unk_1E3B51A10;
  v19[4] = self;
  v20 = v6;
  v21 = a2;
  v17 = v6;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v19);

}

void __72__NFConnectionHandoverInitiator_readerSessionDidEndUnexpectedly_reason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 40), "code");
  v19[0] = *MEMORY[0x1E0CB2D50];
  v10 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(*(id *)(a1 + 40), "code") > 70)
    v11 = 71;
  else
    v11 = objc_msgSend(*(id *)(a1 + 40), "code");
  objc_msgSend(v10, "stringWithUTF8String:", NFResultCodeString_0[v11]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB3388];
  v14 = *(_QWORD *)(a1 + 40);
  v20[0] = v12;
  v20[1] = v14;
  v19[1] = v13;
  v19[2] = CFSTR("Line");
  v20[2] = &unk_1E3B68DC0;
  v19[3] = CFSTR("Method");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v20[3] = v15;
  v19[4] = *MEMORY[0x1E0CB2938];
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 1095);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, v9, v17);
  -[NFConnectionHandoverInitiator _triggerInvalidateCB:](v6, v18);

}

- (void)readerSession:(id)a3 externalReaderFieldNotification:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__NFConnectionHandoverInitiator_readerSession_externalReaderFieldNotification___block_invoke;
  v11[3] = &unk_1E3B51BA0;
  v11[4] = self;
  v12 = v8;
  v13 = v7;
  v14 = a2;
  v9 = v7;
  v10 = v8;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v11);

}

void __79__NFConnectionHandoverInitiator_readerSession_externalReaderFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void **v3;
  uint64_t v4;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *v6;
  _BOOL4 isMetaClass;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  const void **v18;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v22;
  const char *ClassName;
  const char *Name;
  uint64_t v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  _QWORD *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  char v34;
  id v35;
  const void **v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  uint64_t v41;
  NSObject *v42;
  objc_class *v43;
  int v44;
  const char *v45;
  const char *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  id v62;
  _QWORD block[5];
  id v64;
  _QWORD v65[5];
  _QWORD v66[5];
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || *(_QWORD *)(v2 + 24) != 2)
  {
    v18 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(Class))
        v22 = 43;
      else
        v22 = 45;
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v25 = *(_QWORD *)(a1 + 32);
      if (v25)
        v25 = *(_QWORD *)(v25 + 24);
      v20(6, "%c[%{public}s %{public}s]:%i Dropping notification due to invalid state: %ld", v22, ClassName, Name, 1103, v25);
    }
    dispatch_get_specific(*v18);
    NFSharedLogGetLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v26 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(*(id *)(a1 + 32));
    v29 = sel_getName(*(SEL *)(a1 + 56));
    v30 = *(_QWORD **)(a1 + 32);
    if (v30)
      v30 = (_QWORD *)v30[3];
    *(_DWORD *)buf = 67110146;
    v68 = v27;
    v69 = 2082;
    v70 = v28;
    v71 = 2082;
    v72 = v29;
    v73 = 1024;
    v74 = 1103;
    v75 = 2048;
    v76 = v30;
    v15 = "%c[%{public}s %{public}s]:%i Dropping notification due to invalid state: %ld";
    v16 = v10;
    v17 = 44;
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "cachedBeforeRFReset"))
  {
    v3 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v4 = NFLogGetLogger();
    if (v4)
    {
      v5 = (void (*)(uint64_t, const char *, ...))v4;
      v6 = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(v6);
      v8 = object_getClassName(*(id *)(a1 + 32));
      v60 = sel_getName(*(SEL *)(a1 + 56));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v5(6, "%c[%{public}s %{public}s]:%i Ignore preexisting field", v9, v8, v60, 1108);
    }
    dispatch_get_specific(*v3);
    NFSharedLogGetLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67109890;
    v68 = v12;
    v69 = 2082;
    v70 = v13;
    v71 = 2082;
    v72 = v14;
    v73 = 1024;
    v74 = 1108;
    v15 = "%c[%{public}s %{public}s]:%i Ignore preexisting field";
    v16 = v10;
    v17 = 34;
LABEL_27:
    _os_log_impl(&dword_19B5EB000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_28:

    return;
  }
  v31 = *(_QWORD *)(a1 + 32);
  if (v31)
    v32 = *(NSObject **)(v31 + 32);
  else
    v32 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__NFConnectionHandoverInitiator_readerSession_externalReaderFieldNotification___block_invoke_215;
  block[3] = &unk_1E3B51E70;
  block[4] = v31;
  v64 = *(id *)(a1 + 40);
  dispatch_async(v32, block);
  if ((objc_msgSend(*(id *)(a1 + 40), "chFieldType") & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    v33 = *(void **)(a1 + 48);
    v62 = 0;
    v34 = objc_msgSend(v33, "restartPollingWithError:", &v62);
    v35 = v62;
    if ((v34 & 1) == 0)
    {
      v36 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v37 = NFLogGetLogger();
      if (v37)
      {
        v38 = (void (*)(uint64_t, const char *, ...))v37;
        v39 = object_getClass(*(id *)(a1 + 32));
        v40 = class_isMetaClass(v39);
        v59 = object_getClassName(*(id *)(a1 + 32));
        v61 = sel_getName(*(SEL *)(a1 + 56));
        v41 = 45;
        if (v40)
          v41 = 43;
        v38(3, "%c[%{public}s %{public}s]:%i Unexpected error=%@", v41, v59, v61, 1124, v35);
      }
      dispatch_get_specific(*v36);
      NFSharedLogGetLogger();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v43))
          v44 = 43;
        else
          v44 = 45;
        v45 = object_getClassName(*(id *)(a1 + 32));
        v46 = sel_getName(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 67110146;
        v68 = v44;
        v69 = 2082;
        v70 = v45;
        v71 = 2082;
        v72 = v46;
        v73 = 1024;
        v74 = 1124;
        v75 = 2112;
        v76 = v35;
        _os_log_impl(&dword_19B5EB000, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected error=%@", buf, 0x2Cu);
      }

      v47 = *(void **)(a1 + 32);
      v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v35, "code");
      v65[0] = *MEMORY[0x1E0CB2D50];
      v51 = (void *)MEMORY[0x1E0CB3940];
      if (objc_msgSend(v35, "code") > 70)
        v52 = 71;
      else
        v52 = objc_msgSend(v35, "code");
      objc_msgSend(v51, "stringWithUTF8String:", NFResultCodeString_0[v52]);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = *MEMORY[0x1E0CB3388];
      v66[0] = v53;
      v66[1] = v35;
      v65[1] = v54;
      v65[2] = CFSTR("Line");
      v66[2] = &unk_1E3B68DD8;
      v65[3] = CFSTR("Method");
      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
      v66[3] = v55;
      v65[4] = *MEMORY[0x1E0CB2938];
      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 1125);
      v66[4] = v56;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 5);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, v50, v57);
      objc_msgSend(v47, "_stopWithError:", v58);

    }
  }

}

void __79__NFConnectionHandoverInitiator_readerSession_externalReaderFieldNotification___block_invoke_215(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:didReceiveField:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NFConnectionHandoverInitiatorDelegate)delegate
{
  return (NFConnectionHandoverInitiatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecpFrame, 0);
  objc_storeStrong((id *)&self->_tagConnectionTimer, 0);
  objc_storeStrong((id *)&self->_delayRequestTimer, 0);
  objc_storeStrong(&self->_delayRequestCompletion, 0);
  objc_storeStrong((id *)&self->_delayRequest, 0);
  objc_storeStrong((id *)&self->_connectedTag, 0);
  objc_storeStrong((id *)&self->_readerSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
