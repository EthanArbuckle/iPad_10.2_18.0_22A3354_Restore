@implementation NFConnectionHandoverReceiver

+ (id)receiverWithDelegate:(id)a3
{
  NSObject *v4;
  id v5;
  dispatch_queue_t v6;
  NFConnectionHandoverReceiver *v7;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = a3;
  v6 = dispatch_queue_create("NFConnectionHandoverReceiverCallback", v4);

  v7 = -[NFConnectionHandoverReceiver initWithDelegate:callbackQueue:]([NFConnectionHandoverReceiver alloc], "initWithDelegate:callbackQueue:", v5, v6);
  return v7;
}

+ (id)receiverWithDelegate:(id)a3 callbackQueue:(id)a4
{
  id v5;
  id v6;
  NFConnectionHandoverReceiver *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NFConnectionHandoverReceiver initWithDelegate:callbackQueue:]([NFConnectionHandoverReceiver alloc], "initWithDelegate:callbackQueue:", v6, v5);

  return v7;
}

- (NFConnectionHandoverReceiver)initWithDelegate:(id)a3
{
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  NFConnectionHandoverReceiver *v8;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a3;
  v7 = dispatch_queue_create("NFConnectionHandoverReceiverCallback", v5);

  v8 = -[NFConnectionHandoverReceiver initWithDelegate:callbackQueue:](self, "initWithDelegate:callbackQueue:", v6, v7);
  return v8;
}

- (NFConnectionHandoverReceiver)initWithDelegate:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  NFConnectionHandoverReceiver *v11;
  NFConnectionHandoverReceiver *v12;

  v6 = a3;
  v7 = a4;
  +[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBackgroundTagReadingAvailable");

  if (v9)
    v10 = 1;
  else
    v10 = 2;
  v11 = (NFConnectionHandoverReceiver *)-[NFConnectionHandoverController initWithType:initiator:callbackQueue:]((id *)&self->super.super.isa, (void *)v10, 0, v7);

  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v6);
    v12 = v11;
  }

  return v11;
}

- (BOOL)roleBroadcastInBackground
{
  void *v2;
  char v3;

  +[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBackgroundTagReadingAvailable");

  return v3;
}

- (void)forceResumeWithCompletionHandler:(id)a3
{
  id v4;
  NFHCESession *hceSession;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    hceSession = self->_hceSession;
  else
    hceSession = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__NFConnectionHandoverReceiver_forceResumeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3B52360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFHCESession resumeSessionFromWaitingOnFieldWithCompletion:](hceSession, "resumeSessionFromWaitingOnFieldWithCompletion:", v7);

}

void __65__NFConnectionHandoverReceiver_forceResumeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(NSObject **)(v4 + 32);
  else
    v5 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__NFConnectionHandoverReceiver_forceResumeWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E3B522C0;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __65__NFConnectionHandoverReceiver_forceResumeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)startWithAutoResumeOnFieldDisable
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__NFConnectionHandoverReceiver_startWithAutoResumeOnFieldDisable__block_invoke;
  v2[3] = &unk_1E3B51A60;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

uint64_t __65__NFConnectionHandoverReceiver_startWithAutoResumeOnFieldDisable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startWithAutoResume:customBroadcastData:", 0, 0);
}

- (void)startAutoResumeOnFieldDisableWithCustomBroadcastData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__NFConnectionHandoverReceiver_startAutoResumeOnFieldDisableWithCustomBroadcastData___block_invoke;
  v6[3] = &unk_1E3B51E70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v6);

}

uint64_t __85__NFConnectionHandoverReceiver_startAutoResumeOnFieldDisableWithCustomBroadcastData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startWithAutoResume:customBroadcastData:", 0, *(_QWORD *)(a1 + 40));
}

- (void)start
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__NFConnectionHandoverReceiver_start__block_invoke;
  v2[3] = &unk_1E3B51A60;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

uint64_t __37__NFConnectionHandoverReceiver_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startWithAutoResume:customBroadcastData:", 1, 0);
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
  v6[2] = __61__NFConnectionHandoverReceiver_startWithCustomBroadcastData___block_invoke;
  v6[3] = &unk_1E3B51E70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v6);

}

uint64_t __61__NFConnectionHandoverReceiver_startWithCustomBroadcastData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startWithAutoResume:customBroadcastData:", 1, *(_QWORD *)(a1 + 40));
}

- (void)_startWithAutoResume:(BOOL)a3 customBroadcastData:(id)a4
{
  _BOOL4 v4;
  id v7;
  int64_t state;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  const void **v33;
  uint64_t v34;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *v36;
  _BOOL4 v37;
  const char *v38;
  const char *v39;
  const void **v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  const void **v45;
  int v46;
  const char *v47;
  const char *v48;
  void *v49;
  const void **v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  _BOOL4 v54;
  const char *v55;
  uint64_t v56;
  NSObject *v57;
  objc_class *v58;
  int v59;
  id v60;
  objc_class *v61;
  _BOOL4 v62;
  uint64_t v63;
  objc_class *v64;
  int v65;
  uint64_t v66;
  void (*v67)(uint64_t, const char *, ...);
  objc_class *v68;
  _BOOL4 v69;
  const char *v70;
  uint64_t v71;
  objc_class *v72;
  int v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NFHCESession *hceSession;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  const char *v106;
  const char *Name;
  const char *v108;
  const char *v109;
  const char *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  _QWORD v116[6];
  _QWORD v117[4];
  _QWORD v118[4];
  _QWORD v119[4];
  _QWORD v120[4];
  uint64_t v121;
  _QWORD v122[8];
  _QWORD v123[8];
  uint8_t buf[8];
  __int16 v125;
  const char *v126;
  __int16 v127;
  const char *v128;
  __int16 v129;
  int v130;
  __int16 v131;
  _BOOL4 v132;
  __int16 v133;
  void *v134;
  _QWORD v135[5];
  _QWORD v136[5];
  _QWORD v137[5];
  _QWORD v138[5];
  _QWORD v139[5];
  _QWORD v140[8];

  v4 = a3;
  v140[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v7, "length") == 6)
        goto LABEL_4;
      v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v16 = objc_claimAutoreleasedReturnValue();
      v137[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid Parameter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v138[0] = v21;
      v138[1] = &unk_1E3B68E08;
      v137[1] = CFSTR("Line");
      v137[2] = CFSTR("Method");
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v138[2] = v22;
      v137[3] = *MEMORY[0x1E0CB2938];
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1228);
      v138[3] = v23;
      v137[4] = *MEMORY[0x1E0CB2D68];
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid data length"));
      v138[4] = v24;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = v138;
      v27 = v137;
    }
    else
    {
      v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v16 = objc_claimAutoreleasedReturnValue();
      v139[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid Parameter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v140[0] = v21;
      v140[1] = &unk_1E3B68DF0;
      v139[1] = CFSTR("Line");
      v139[2] = CFSTR("Method");
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v140[2] = v22;
      v139[3] = *MEMORY[0x1E0CB2938];
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1225);
      v140[3] = v23;
      v139[4] = *MEMORY[0x1E0CB2D68];
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid data type"));
      v140[4] = v24;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = v140;
      v27 = v139;
    }
    objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v20;
    v30 = v16;
    v31 = 10;
LABEL_20:
    v32 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, v31, v28);
    -[NFConnectionHandoverReceiver _triggerSessionInvalidatedCB:]((uint64_t)self, v32);

LABEL_21:
    goto LABEL_22;
  }
LABEL_4:
  if (!self)
    goto LABEL_23;
  state = self->super._state;
  if (state == 3)
  {
    NFSharedLogGetLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19B5EB000, v16, OS_LOG_TYPE_FAULT, "Dropping start request due to invalidation is in progress", buf, 2u);
    }
    goto LABEL_21;
  }
  if (state != 2)
  {
    if (state == 1)
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
        v11(6, "%c[%{public}s %{public}s]:%i Start is in progress", v15, ClassName, Name, 1234);
      }
      dispatch_get_specific(*v9);
      NFSharedLogGetLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v18;
      v125 = 2082;
      v126 = object_getClassName(self);
      v127 = 2082;
      v128 = sel_getName(a2);
      v129 = 1024;
      v130 = 1234;
      v19 = "%c[%{public}s %{public}s]:%i Start is in progress";
      goto LABEL_66;
    }
LABEL_23:
    v33 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v34 = NFLogGetLogger();
    v35 = (void (*)(uint64_t, const char *, ...))v34;
    if (v7)
    {
      if (v34)
      {
        v36 = object_getClass(self);
        v37 = class_isMetaClass(v36);
        v38 = object_getClassName(self);
        v39 = sel_getName(a2);
        objc_msgSend(v7, "debugDescription");
        v40 = v33;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 45;
        if (v37)
          v42 = 43;
        v35(6, "%c[%{public}s %{public}s]:%i autoResume=%{public}d, customBroadcast=%{public}@", v42, v38, v39, 1252, v4, v41);

        v33 = v40;
      }
      dispatch_get_specific(*v33);
      NFSharedLogGetLogger();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = object_getClass(self);
        v45 = v33;
        if (class_isMetaClass(v44))
          v46 = 43;
        else
          v46 = 45;
        v47 = object_getClassName(self);
        v48 = sel_getName(a2);
        objc_msgSend(v7, "debugDescription");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v46;
        v33 = v45;
        v125 = 2082;
        v126 = v47;
        v127 = 2082;
        v128 = v48;
        v129 = 1024;
        v130 = 1252;
        v131 = 1026;
        v132 = v4;
        v133 = 2114;
        v134 = v49;
        _os_log_impl(&dword_19B5EB000, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i autoResume=%{public}d, customBroadcast=%{public}@", buf, 0x32u);

      }
    }
    else
    {
      if (v34)
      {
        v61 = object_getClass(self);
        v62 = class_isMetaClass(v61);
        v106 = object_getClassName(self);
        v109 = sel_getName(a2);
        v63 = 45;
        if (v62)
          v63 = 43;
        v35(6, "%c[%{public}s %{public}s]:%i autoResume=%{public}d", v63, v106, v109, 1254, v4);
      }
      dispatch_get_specific(*v33);
      NFSharedLogGetLogger();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v64 = object_getClass(self);
        if (class_isMetaClass(v64))
          v65 = 43;
        else
          v65 = 45;
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v65;
        v125 = 2082;
        v126 = object_getClassName(self);
        v127 = 2082;
        v128 = sel_getName(a2);
        v129 = 1024;
        v130 = 1254;
        v131 = 1026;
        v132 = v4;
        _os_log_impl(&dword_19B5EB000, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i autoResume=%{public}d", buf, 0x28u);
      }
    }

    if (self)
    {
      if (self->_hceSession)
      {
        dispatch_get_specific(*v33);
        v66 = NFLogGetLogger();
        if (v66)
        {
          v67 = (void (*)(uint64_t, const char *, ...))v66;
          v68 = object_getClass(self);
          v69 = class_isMetaClass(v68);
          v70 = object_getClassName(self);
          v110 = sel_getName(a2);
          v71 = 45;
          if (v69)
            v71 = 43;
          v67(6, "%c[%{public}s %{public}s]:%i Already started in receiver mode", v71, v70, v110, 1258);
        }
        dispatch_get_specific(*v33);
        NFSharedLogGetLogger();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        v72 = object_getClass(self);
        if (class_isMetaClass(v72))
          v73 = 43;
        else
          v73 = 45;
        v74 = object_getClassName(self);
        v75 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v73;
        v125 = 2082;
        v126 = v74;
        v127 = 2082;
        v128 = v75;
        v129 = 1024;
        v130 = 1258;
        v19 = "%c[%{public}s %{public}s]:%i Already started in receiver mode";
LABEL_66:
        _os_log_impl(&dword_19B5EB000, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x22u);
        goto LABEL_21;
      }
      self->_hceAppSelected = 0;
    }
    _GenerateInitiatorECPFrame(0);
    v16 = objc_claimAutoreleasedReturnValue();
    _GeneratePreferredReceiverECPFrame(0);
    v76 = objc_claimAutoreleasedReturnValue();
    _GenerateAutoNegotiationECPFrame(0);
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_opt_new();
    objc_msgSend(v78, "addObject:", v16);
    if (self && self->super._type == 2)
    {
      objc_msgSend(v78, "addObject:", v76);
      objc_msgSend(v78, "addObject:", v77);
    }
    v115 = (void *)v76;
    v79 = objc_alloc(MEMORY[0x1E0C99E08]);
    v122[0] = CFSTR("StartOnECP");
    v122[1] = CFSTR("EmulationOnSessionStart");
    v113 = v78;
    v123[0] = v78;
    v123[1] = &unk_1E3B68E38;
    v122[2] = CFSTR("ReadOnReaderConnected");
    v122[3] = CFSTR("SuspendOnDisconnect");
    v123[2] = &unk_1E3B68E38;
    v123[3] = &unk_1E3B68E38;
    v122[4] = CFSTR("BackgroundTagReadingECP");
    v122[5] = CFSTR("ListenOnAllField");
    v123[4] = &unk_1E3B68E38;
    v123[5] = &unk_1E3B68E38;
    v123[6] = &unk_1E3B68E38;
    v122[6] = CFSTR("FDRestartOnMatchingECPTermInfo");
    v122[7] = CFSTR("disableAutostartOnField");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v4);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v123[7] = v80;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, v122, 8);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = (void *)objc_msgSend(v79, "initWithDictionary:", v81);

    if (self && self->super._type == 2)
    {
      _GeneratePreferredReceiverECPFrame(v7);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setObject:forKey:", v83, CFSTR("ECPBroadcast"));

      v121 = v77;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setObject:forKey:", v84, CFSTR("ECPBroadcastFieldMatch"));
    }
    else
    {
      if (!v7)
        goto LABEL_77;
      _GenerateAutoNegotiationECPFrame(v7);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setObject:forKeyedSubscript:", v84, CFSTR("bkgTagReadECPOverride"));
    }

LABEL_77:
    v114 = (void *)v77;
    +[NFHardwareManager sharedHardwareManagerWithNoUI](NFHardwareManager, "sharedHardwareManagerWithNoUI");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    if (objc_msgSend(v85, "getHwSupport") - 4 > 0xFFFFFFFD)
    {
      objc_msgSend(v85, "getRadioEnabledState:", buf);
      v93 = objc_claimAutoreleasedReturnValue();
      if (v93)
      {
        v94 = (void *)v93;
      }
      else
      {
        if (*(_QWORD *)buf == 1)
        {
          if (self)
            self->super._state = 1;
          v116[0] = MEMORY[0x1E0C809B0];
          v116[1] = 3221225472;
          v116[2] = __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke;
          v116[3] = &unk_1E3B52388;
          v116[4] = self;
          v116[5] = a2;
          objc_msgSend(v85, "startHCESessionWithConfiguration:completion:", v82, v116);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          -[NFConnectionHandoverReceiver setHceSession:]((uint64_t)self, v95);

          v97 = v114;
          v96 = v115;
          v98 = v113;
          if (self)
            hceSession = self->_hceSession;
          else
            hceSession = 0;
          -[NFHCESession setDelegate:](hceSession, "setDelegate:", self);
          goto LABEL_90;
        }
        v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v117[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NFC radio disabled");
        v112 = v82;
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v118[0] = v102;
        v118[1] = &unk_1E3B68E68;
        v117[1] = CFSTR("Line");
        v117[2] = CFSTR("Method");
        v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
        v118[2] = v103;
        v117[3] = *MEMORY[0x1E0CB2938];
        v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1315);
        v118[3] = v104;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 4);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = (void *)objc_msgSend(v100, "initWithDomain:code:userInfo:", v101, 50, v105);

        v82 = v112;
      }
      -[NFConnectionHandoverReceiver _triggerSessionInvalidatedCB:]((uint64_t)self, v94);

    }
    else
    {
      v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v111 = v82;
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v119[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "No NFC on device");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v120[0] = v88;
      v120[1] = &unk_1E3B68E50;
      v119[1] = CFSTR("Line");
      v119[2] = CFSTR("Method");
      v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v120[2] = v89;
      v119[3] = *MEMORY[0x1E0CB2938];
      v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1305);
      v120[3] = v90;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 4);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = (void *)objc_msgSend(v86, "initWithDomain:code:userInfo:", v87, 57, v91);

      v82 = v111;
      -[NFConnectionHandoverReceiver _triggerSessionInvalidatedCB:]((uint64_t)self, v92);

    }
    v97 = v114;
    v96 = v115;
    v98 = v113;
LABEL_90:

    goto LABEL_21;
  }
  v50 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v51 = NFLogGetLogger();
  if (v51)
  {
    v52 = (void (*)(uint64_t, const char *, ...))v51;
    v53 = object_getClass(self);
    v54 = class_isMetaClass(v53);
    v55 = object_getClassName(self);
    v108 = sel_getName(a2);
    v56 = 45;
    if (v54)
      v56 = 43;
    v52(6, "%c[%{public}s %{public}s]:%i Previously started", v56, v55, v108, 1239);
  }
  dispatch_get_specific(*v50);
  NFSharedLogGetLogger();
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v58 = object_getClass(self);
    if (class_isMetaClass(v58))
      v59 = 43;
    else
      v59 = 45;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v59;
    v125 = 2082;
    v126 = object_getClassName(self);
    v127 = 2082;
    v128 = sel_getName(a2);
    v129 = 1024;
    v130 = 1239;
    _os_log_impl(&dword_19B5EB000, v57, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Previously started", buf, 0x22u);
  }

  if (v7)
  {
    v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v16 = objc_claimAutoreleasedReturnValue();
    v135[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v136[0] = v21;
    v136[1] = &unk_1E3B68E20;
    v135[1] = CFSTR("Line");
    v135[2] = CFSTR("Method");
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v136[2] = v22;
    v135[3] = *MEMORY[0x1E0CB2938];
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1241);
    v136[3] = v23;
    v135[4] = *MEMORY[0x1E0CB2D68];
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Can't update broadcast data unless session is stopped"));
    v136[4] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v60;
    v30 = v16;
    v31 = 12;
    goto LABEL_20;
  }
LABEL_22:

}

- (void)_triggerSessionInvalidatedCB:(uint64_t)a1
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
    block[2] = __61__NFConnectionHandoverReceiver__triggerSessionInvalidatedCB___block_invoke;
    block[3] = &unk_1E3B51A10;
    block[4] = a1;
    v7 = v3;
    v8 = sel__triggerSessionInvalidatedCB_;
    dispatch_async(v5, block);

  }
}

void __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  os_unfair_lock_s *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  _QWORD block[5];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = *(os_unfair_lock_s **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke_2;
    v12[3] = &unk_1E3B51A10;
    v12[4] = v7;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 40);
    v13 = v8;
    v14 = v9;
    -[NFConnectionHandoverController executeWithLock:](v7, v12);

  }
  else
  {
    objc_msgSend(a2, "setSessionTimeLimit:", 0.0);
    v10 = *(_QWORD *)(a1 + 32);
    if (v10 && *(_QWORD *)(v10 + 24) != 2)
    {
      *(_QWORD *)(v10 + 24) = 2;
      v11 = *(NSObject **)(v10 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__NFConnectionHandoverReceiver__triggerSessionStartedCB__block_invoke;
      block[3] = &unk_1E3B51A60;
      block[4] = v10;
      dispatch_async(v11, block);
    }
  }

}

void __73__NFConnectionHandoverReceiver__startWithAutoResume_customBroadcastData___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 40), "code");
  v15[0] = *MEMORY[0x1E0CB2D50];
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(*(id *)(a1 + 40), "code") > 70)
    v7 = 71;
  else
    v7 = objc_msgSend(*(id *)(a1 + 40), "code");
  objc_msgSend(v6, "stringWithUTF8String:", NFResultCodeString_0[v7]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB3388];
  v10 = *(_QWORD *)(a1 + 40);
  v16[0] = v8;
  v16[1] = v10;
  v15[1] = v9;
  v15[2] = CFSTR("Line");
  v16[2] = &unk_1E3B68E80;
  v15[3] = CFSTR("Method");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v16[3] = v11;
  v15[4] = *MEMORY[0x1E0CB2938];
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 1326);
  v16[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, v5, v13);
  objc_msgSend(v2, "_stopWithError:", v14);

}

- (void)setHceSession:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)stop
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__NFConnectionHandoverReceiver_stop__block_invoke;
  v2[3] = &unk_1E3B51A60;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

uint64_t __36__NFConnectionHandoverReceiver_stop__block_invoke(uint64_t a1)
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
  NFHCESession *hceSession;
  const void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  int64_t v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  int64_t v40;
  NSObject *v41;
  uint32_t v42;
  const void **v43;
  uint64_t Logger;
  void (*v45)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *Name;
  _QWORD v56[5];
  id v57;
  uint8_t buf[4];
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self)
    goto LABEL_24;
  state = self->super._state;
  if ((unint64_t)(state - 1) >= 2)
  {
    if (state == 4)
    {
      v43 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v45 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v49 = 45;
        if (isMetaClass)
          v49 = 43;
        v45(6, "%c[%{public}s %{public}s]:%i Session previously invalidated", v49, ClassName, Name, 1354);
      }
      dispatch_get_specific(*v43);
      NFSharedLogGetLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      v50 = object_getClass(self);
      if (class_isMetaClass(v50))
        v51 = 43;
      else
        v51 = 45;
      *(_DWORD *)buf = 67109890;
      v59 = v51;
      v60 = 2082;
      v61 = object_getClassName(self);
      v62 = 2082;
      v63 = sel_getName(a2);
      v64 = 1024;
      v65 = 1354;
      v17 = "%c[%{public}s %{public}s]:%i Session previously invalidated";
LABEL_47:
      v41 = v14;
      v42 = 34;
LABEL_48:
      _os_log_impl(&dword_19B5EB000, v41, OS_LOG_TYPE_DEFAULT, v17, buf, v42);
LABEL_49:

      goto LABEL_50;
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
        v53 = sel_getName(a2);
        v13 = 45;
        if (v11)
          v13 = 43;
        v9(6, "%c[%{public}s %{public}s]:%i Stop in progress", v13, v12, v53, 1350);
      }
      dispatch_get_specific(*v7);
      NFSharedLogGetLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      v59 = v16;
      v60 = 2082;
      v61 = object_getClassName(self);
      v62 = 2082;
      v63 = sel_getName(a2);
      v64 = 1024;
      v65 = 1350;
      v17 = "%c[%{public}s %{public}s]:%i Stop in progress";
      goto LABEL_47;
    }
LABEL_24:
    v28 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v29 = NFLogGetLogger();
    if (v29)
    {
      v30 = (void (*)(uint64_t, const char *, ...))v29;
      v31 = object_getClass(self);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(self);
      v34 = sel_getName(a2);
      if (self)
        v35 = self->super._state;
      else
        v35 = 0;
      v30(6, "%c[%{public}s %{public}s]:%i Session not started, state=%ld", v32, v33, v34, 1359, v35);
    }
    dispatch_get_specific(*v28);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    v36 = object_getClass(self);
    if (class_isMetaClass(v36))
      v37 = 43;
    else
      v37 = 45;
    v38 = object_getClassName(self);
    v39 = sel_getName(a2);
    if (self)
      v40 = self->super._state;
    else
      v40 = 0;
    *(_DWORD *)buf = 67110146;
    v59 = v37;
    v60 = 2082;
    v61 = v38;
    v62 = 2082;
    v63 = v39;
    v64 = 1024;
    v65 = 1359;
    v66 = 2048;
    v67 = v40;
    v17 = "%c[%{public}s %{public}s]:%i Session not started, state=%ld";
    v41 = v14;
    v42 = 44;
    goto LABEL_48;
  }
  v18 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v19 = NFLogGetLogger();
  if (v19)
  {
    v20 = (void (*)(uint64_t, const char *, ...))v19;
    v21 = object_getClass(self);
    v22 = class_isMetaClass(v21);
    v52 = object_getClassName(self);
    v54 = sel_getName(a2);
    v23 = 45;
    if (v22)
      v23 = 43;
    v20(6, "%c[%{public}s %{public}s]:%i error=%{public}@", v23, v52, v54, 1363, v5);
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
    v59 = v26;
    v60 = 2082;
    v61 = object_getClassName(self);
    v62 = 2082;
    v63 = sel_getName(a2);
    v64 = 1024;
    v65 = 1363;
    v66 = 2114;
    v67 = (int64_t)v5;
    _os_log_impl(&dword_19B5EB000, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
  }

  self->super._state = 3;
  hceSession = self->_hceSession;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __47__NFConnectionHandoverReceiver__stopWithError___block_invoke;
  v56[3] = &unk_1E3B51E70;
  v56[4] = self;
  v57 = v5;
  -[NFSession endSessionWithCompletion:](hceSession, "endSessionWithCompletion:", v56);
  objc_storeStrong((id *)&self->_hceSession, 0);
  self->_hceAppSelected = 0;
  self->_didConnect = 0;
  -[NFTimer stopTimer](self->_emuAssertTimer, "stopTimer");
  objc_storeStrong((id *)&self->_emuAssertTimer, 0);

LABEL_50:
}

void __47__NFConnectionHandoverReceiver__stopWithError___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  os_unfair_lock_s *v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__NFConnectionHandoverReceiver__stopWithError___block_invoke_2;
  v2[3] = &unk_1E3B51E70;
  v1 = *(void **)(a1 + 40);
  v3 = *(os_unfair_lock_s **)(a1 + 32);
  v4 = v1;
  -[NFConnectionHandoverController executeWithLock:](v3, v2);

}

void __47__NFConnectionHandoverReceiver__stopWithError___block_invoke_2(uint64_t a1)
{
  -[NFConnectionHandoverReceiver _triggerSessionInvalidatedCB:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)setEmuAssertTimer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (BOOL)sendHandoverSelect:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v7 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__NFConnectionHandoverReceiver_sendHandoverSelect_error___block_invoke;
  v12[3] = &unk_1E3B523B0;
  v13 = v7;
  v14 = a2;
  v12[4] = self;
  v8 = v7;
  -[NFConnectionHandoverController executeWithLockAndReturn:]((os_unfair_lock_s *)self, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v10 == 0;
}

id __57__NFConnectionHandoverReceiver_sendHandoverSelect_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void **v3;
  uint64_t v4;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *v6;
  _BOOL4 v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
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
  const void **v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _QWORD *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  const char *v59;
  const char *Name;
  _QWORD v61[4];
  _QWORD v62[4];
  _QWORD v63[4];
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[4];
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  uint64_t v76;
  _QWORD v77[4];
  _QWORD v78[5];

  v78[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || !*(_BYTE *)(v2 + 40))
  {
    v23 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v25 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v29 = 45;
      if (isMetaClass)
        v29 = 43;
      v25(3, "%c[%{public}s %{public}s]:%i App not selected", v29, ClassName, Name, 1383);
    }
    dispatch_get_specific(*v23);
    NFSharedLogGetLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(*(id *)(a1 + 32));
      v34 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v68 = v32;
      v69 = 2082;
      v70 = v33;
      v71 = 2082;
      v72 = v34;
      v73 = 1024;
      v74 = 1383;
      _os_log_impl(&dword_19B5EB000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i App not selected", buf, 0x22u);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v17;
    v78[1] = &unk_1E3B68E98;
    v77[1] = CFSTR("Line");
    v77[2] = CFSTR("Method");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
    v78[2] = v18;
    v77[3] = *MEMORY[0x1E0CB2938];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 1384);
    v78[3] = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v78;
    v22 = v77;
    goto LABEL_40;
  }
  if (*(_QWORD *)(v2 + 24) != 2)
  {
    v35 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v36 = NFLogGetLogger();
    if (v36)
    {
      v37 = (void (*)(uint64_t, const char *, ...))v36;
      v38 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v38))
        v39 = 43;
      else
        v39 = 45;
      v40 = object_getClassName(*(id *)(a1 + 32));
      v41 = sel_getName(*(SEL *)(a1 + 48));
      v42 = *(_QWORD *)(a1 + 32);
      if (v42)
        v42 = *(_QWORD *)(v42 + 24);
      v37(3, "%c[%{public}s %{public}s]:%i Invalid state: %ld", v39, v40, v41, 1386, v42);
    }
    dispatch_get_specific(*v35);
    NFSharedLogGetLogger();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v44))
        v45 = 43;
      else
        v45 = 45;
      v46 = object_getClassName(*(id *)(a1 + 32));
      v47 = sel_getName(*(SEL *)(a1 + 48));
      v48 = *(_QWORD *)(a1 + 32);
      if (v48)
        v48 = *(_QWORD *)(v48 + 24);
      *(_DWORD *)buf = 67110146;
      v68 = v45;
      v69 = 2082;
      v70 = v46;
      v71 = 2082;
      v72 = v47;
      v73 = 1024;
      v74 = 1386;
      v75 = 2048;
      v76 = v48;
      _os_log_impl(&dword_19B5EB000, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid state: %ld", buf, 0x2Cu);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v17;
    v66[1] = &unk_1E3B68EB0;
    v65[1] = CFSTR("Line");
    v65[2] = CFSTR("Method");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
    v66[2] = v18;
    v65[3] = *MEMORY[0x1E0CB2938];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 1387);
    v66[3] = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v66;
    v22 = v65;
    goto LABEL_40;
  }
  if (*(_QWORD *)(v2 + 64))
  {
    v3 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v4 = NFLogGetLogger();
    if (v4)
    {
      v5 = (void (*)(uint64_t, const char *, ...))v4;
      v6 = object_getClass(*(id *)(a1 + 32));
      v7 = class_isMetaClass(v6);
      v8 = object_getClassName(*(id *)(a1 + 32));
      v59 = sel_getName(*(SEL *)(a1 + 48));
      v9 = 45;
      if (v7)
        v9 = 43;
      v5(3, "%c[%{public}s %{public}s]:%i Previous delay send in progress", v9, v8, v59, 1389);
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
      v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v68 = v12;
      v69 = 2082;
      v70 = v13;
      v71 = 2082;
      v72 = v14;
      v73 = 1024;
      v74 = 1389;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Previous delay send in progress", buf, 0x22u);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v17;
    v64[1] = &unk_1E3B68EC8;
    v63[1] = CFSTR("Line");
    v63[2] = CFSTR("Method");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
    v64[2] = v18;
    v63[3] = *MEMORY[0x1E0CB2938];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 1390);
    v64[3] = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v64;
    v22 = v63;
LABEL_40:
    objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 12, v49);

    goto LABEL_41;
  }
  objc_msgSend(*(id *)(a1 + 40), "encode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = *(_QWORD **)(a1 + 32);
  if (v16)
  {
    if (v52)
      v52 = (_QWORD *)v52[7];
    objc_msgSend(v52, "sendAPDU:startReadOnCompletion:", v16, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v52, "_sendFailureAPDU");
    v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid Parameter");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v55;
    v62[1] = &unk_1E3B68EE0;
    v61[1] = CFSTR("Line");
    v61[2] = CFSTR("Method");
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
    v62[2] = v56;
    v61[3] = *MEMORY[0x1E0CB2938];
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 1397);
    v62[3] = v57;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 4);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 10, v58);

    v16 = 0;
  }
LABEL_41:

  return v50;
}

- (void)_emuAssertTimerExpired
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
  uint64_t v14;
  NSObject *callbackQueue;
  NSObject *v16;
  uint64_t v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  _BOOL4 v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  const char *Name;
  const char *v29;
  _QWORD v30[5];
  _QWORD block[6];
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t v39[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  uint8_t buf[8];
  _BYTE v48[32];
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
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
    v6(6, "%c[%{public}s %{public}s]:%i Assertion expired", v10, ClassName, Name, 1409);
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
    *(_DWORD *)&buf[4] = v13;
    *(_WORD *)v48 = 2082;
    *(_QWORD *)&v48[2] = object_getClassName(self);
    *(_WORD *)&v48[10] = 2082;
    *(_QWORD *)&v48[12] = sel_getName(a2);
    *(_WORD *)&v48[20] = 1024;
    *(_DWORD *)&v48[22] = 1409;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Assertion expired", buf, 0x22u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)v48 = buf;
  *(_QWORD *)&v48[8] = 0x3032000000;
  *(_QWORD *)&v48[16] = __Block_byref_object_copy__5;
  *(_QWORD *)&v48[24] = __Block_byref_object_dispose__5;
  v49 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__359;
  v37 = __Block_byref_object_dispose__360;
  v38 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke;
  v32[3] = &unk_1E3B524C8;
  v32[4] = self;
  v32[5] = buf;
  v32[6] = &v33;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v32);
  if (self)
    callbackQueue = self->super._callbackQueue;
  else
    callbackQueue = 0;
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke_2;
  block[3] = &unk_1E3B523D8;
  block[4] = buf;
  block[5] = a2;
  dispatch_async(callbackQueue, block);
  v16 = v34[5];
  if (v16)
  {
    v30[0] = v14;
    v30[1] = 3221225472;
    v30[2] = __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke_363;
    v30[3] = &unk_1E3B51A60;
    v30[4] = self;
    dispatch_async(v16, v30);
  }
  else
  {
    dispatch_get_specific(*v4);
    v17 = NFLogGetLogger();
    if (v17)
    {
      v18 = (void (*)(uint64_t, const char *, ...))v17;
      v19 = object_getClass(self);
      v20 = class_isMetaClass(v19);
      v21 = object_getClassName(self);
      v29 = sel_getName(a2);
      v22 = 45;
      if (v20)
        v22 = 43;
      v18(5, "%c[%{public}s %{public}s]:%i Dropping disconnect callback", v22, v21, v29, 1428);
    }
    dispatch_get_specific(*v4);
    NFSharedLogGetLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(self);
      v27 = sel_getName(a2);
      *(_DWORD *)v39 = 67109890;
      v40 = v25;
      v41 = 2082;
      v42 = v26;
      v43 = 2082;
      v44 = v27;
      v45 = 1024;
      v46 = 1428;
      _os_log_impl(&dword_19B5EB000, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Dropping disconnect callback", v39, 0x22u);
    }

  }
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(buf, 8);
}

void __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;

  -[NFConnectionHandoverReceiver setPendingCHSelect:](a1[4], 0);
  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 80);
  else
    v3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v3);
  v5 = (void *)a1[4];
  if (v5)
  {
    objc_setProperty_nonatomic_copy(v5, v4, 0, 80);
    v6 = (_QWORD *)a1[4];
    if (v6)
      v6 = (_QWORD *)v6[7];
  }
  else
  {
    v6 = 0;
  }
  v10 = v6;
  objc_msgSend(v10, "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)setPendingCHSelect:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

void __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
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
  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Timeout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = &unk_1E3B68EF8;
    v10[1] = CFSTR("Line");
    v10[2] = CFSTR("Method");
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
    v11[2] = v6;
    v10[3] = *MEMORY[0x1E0CB2938];
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 1423);
    v11[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, 5, v8);
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v9);

  }
}

void __54__NFConnectionHandoverReceiver__emuAssertTimerExpired__block_invoke_363(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    -[NFConnectionHandoverReceiver _processDisconnectWithPossibleDiscoveryRestart:](v1, 0);
}

- (void)sendHandoverSelect:(id)a3 delay:(double)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  NFHCESession *hceSession;
  NFHCESession *v18;
  void *v19;
  const void **v20;
  uint64_t Logger;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  NFHCESession *v32;
  NFHCESession *v33;
  void *v34;
  void *v35;
  NFHCESession *v36;
  NFHCESession *v37;
  void *v38;
  const char *Name;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  double v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  SEL v56;
  _QWORD block[4];
  id v58;
  id v59;
  _QWORD v60[7];
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke;
  v60[3] = &unk_1E3B52428;
  v60[4] = self;
  v60[5] = a2;
  *(double *)&v60[6] = a4;
  -[NFConnectionHandoverController executeWithLockAndReturn:]((os_unfair_lock_s *)self, v60);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NFConnectionHandoverReceiver _sendFailureAPDU](self, "_sendFailureAPDU");
    if (self)
      self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_2;
    block[3] = &unk_1E3B522C0;
    v58 = v13;
    v59 = v10;
    v14 = v13;
    dispatch_async(&self->super.super, block);

    v15 = v59;
  }
  else if (a4 == 0.0)
  {
    objc_msgSend(v9, "encode");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v14 = (id)v16;
      if (self)
        hceSession = self->_hceSession;
      else
        hceSession = 0;
      v18 = hceSession;
      -[NFHCESession sendAPDU:startReadOnCompletion:](v18, "sendAPDU:startReadOnCompletion:", v14, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (self)
        self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
      v51[0] = v11;
      v51[1] = 3221225472;
      v51[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_369;
      v51[3] = &unk_1E3B522C0;
      v52 = v19;
      v53 = v10;
      v15 = v19;
      dispatch_async(&self->super.super, v51);

    }
    else
    {
      -[NFConnectionHandoverReceiver _sendFailureAPDU](self, "_sendFailureAPDU");
      if (self)
        self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
      v54[0] = v11;
      v54[1] = 3221225472;
      v54[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_3;
      v54[3] = &unk_1E3B52248;
      v55 = v10;
      v56 = a2;
      dispatch_async(&self->super.super, v54);
      v14 = 0;
      v15 = v55;
    }
  }
  else
  {
    v20 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v22 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v26 = 45;
      if (isMetaClass)
        v26 = 43;
      v22(6, "%c[%{public}s %{public}s]:%i delay=%{public}fs, adjustedDelay=%{public}fs", v26, ClassName, Name, 1495, *(_QWORD *)&a4, a4 + 0.3);
    }
    dispatch_get_specific(*v20);
    NFSharedLogGetLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67110402;
      v62 = v29;
      v63 = 2082;
      v64 = v30;
      v65 = 2082;
      v66 = v31;
      v67 = 1024;
      v68 = 1495;
      v69 = 2050;
      v70 = a4;
      v71 = 2050;
      v72 = a4 + 0.3;
      _os_log_impl(&dword_19B5EB000, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i delay=%{public}fs, adjustedDelay=%{public}fs", buf, 0x36u);
    }

    if (self)
      v32 = self->_hceSession;
    else
      v32 = 0;
    v33 = v32;
    -[NFHCESession requestEmulationAssertion:](v33, "requestEmulationAssertion:", a4 + 0.3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[NFConnectionHandoverReceiver _sendFailureAPDU](self, "_sendFailureAPDU");
      if (self)
        self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
      v48[0] = v11;
      v48[1] = 3221225472;
      v48[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_371;
      v48[3] = &unk_1E3B522C0;
      v50 = v10;
      v14 = v34;
      v49 = v14;
      dispatch_async(&self->super.super, v48);

      v15 = v50;
    }
    else
    {
      +[NFConnectionHandoverSelect selectWithRetry:](NFConnectionHandoverSelect, "selectWithRetry:", a4);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "encode");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        v36 = self->_hceSession;
      else
        v36 = 0;
      v37 = v36;
      -[NFHCESession sendAPDU:startReadOnCompletion:](v37, "sendAPDU:startReadOnCompletion:", v35, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (self)
          self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
        v45[0] = v11;
        v45[1] = 3221225472;
        v45[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_2_372;
        v45[3] = &unk_1E3B522C0;
        v47 = v10;
        v46 = v14;
        dispatch_async(&self->super.super, v45);

        v38 = v47;
      }
      else
      {
        v40[0] = v11;
        v40[1] = 3221225472;
        v40[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_3_373;
        v40[3] = &unk_1E3B52450;
        v40[4] = self;
        v41 = v9;
        v42 = v15;
        v43 = v10;
        v44 = a4 + 0.3;
        -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v40);

        v38 = v41;
      }

    }
  }

}

id __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void **v3;
  uint64_t v4;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *v6;
  _BOOL4 v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
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
  const void **v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v52;
  void *v53;
  const char *v54;
  const char *Name;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  _QWORD v59[4];
  _QWORD v60[4];
  _QWORD v61[4];
  id buf;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  uint64_t v70;
  _QWORD v71[4];
  _QWORD v72[5];

  v72[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || !*(_BYTE *)(v2 + 40))
  {
    v23 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v25 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      v29 = 45;
      if (isMetaClass)
        v29 = 43;
      v25(3, "%c[%{public}s %{public}s]:%i App not selected", v29, ClassName, Name, 1444);
    }
    dispatch_get_specific(*v23);
    NFSharedLogGetLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(*(id *)(a1 + 32));
      v34 = sel_getName(*(SEL *)(a1 + 40));
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v32;
      v63 = 2082;
      v64 = v33;
      v65 = 2082;
      v66 = v34;
      v67 = 1024;
      v68 = 1444;
      _os_log_impl(&dword_19B5EB000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i App not selected", (uint8_t *)&buf, 0x22u);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v17;
    v72[1] = &unk_1E3B68F10;
    v71[1] = CFSTR("Line");
    v71[2] = CFSTR("Method");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
    v72[2] = v18;
    v71[3] = *MEMORY[0x1E0CB2938];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 1445);
    v72[3] = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v72;
    v22 = v71;
    goto LABEL_40;
  }
  if (*(_QWORD *)(v2 + 24) != 2)
  {
    v35 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v36 = NFLogGetLogger();
    if (v36)
    {
      v37 = (void (*)(uint64_t, const char *, ...))v36;
      v38 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v38))
        v39 = 43;
      else
        v39 = 45;
      v40 = object_getClassName(*(id *)(a1 + 32));
      v41 = sel_getName(*(SEL *)(a1 + 40));
      v42 = *(_QWORD *)(a1 + 32);
      if (v42)
        v42 = *(_QWORD *)(v42 + 24);
      v37(3, "%c[%{public}s %{public}s]:%i Invalid state: %ld", v39, v40, v41, 1447, v42);
    }
    dispatch_get_specific(*v35);
    NFSharedLogGetLogger();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v44))
        v45 = 43;
      else
        v45 = 45;
      v46 = object_getClassName(*(id *)(a1 + 32));
      v47 = sel_getName(*(SEL *)(a1 + 40));
      v48 = *(_QWORD *)(a1 + 32);
      if (v48)
        v48 = *(_QWORD *)(v48 + 24);
      LODWORD(buf) = 67110146;
      HIDWORD(buf) = v45;
      v63 = 2082;
      v64 = v46;
      v65 = 2082;
      v66 = v47;
      v67 = 1024;
      v68 = 1447;
      v69 = 2048;
      v70 = v48;
      _os_log_impl(&dword_19B5EB000, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid state: %ld", (uint8_t *)&buf, 0x2Cu);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v17;
    v61[1] = &unk_1E3B68F28;
    v60[1] = CFSTR("Line");
    v60[2] = CFSTR("Method");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
    v61[2] = v18;
    v60[3] = *MEMORY[0x1E0CB2938];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 1448);
    v61[3] = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v61;
    v22 = v60;
    goto LABEL_40;
  }
  if (*(_QWORD *)(v2 + 64))
  {
    v3 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v4 = NFLogGetLogger();
    if (v4)
    {
      v5 = (void (*)(uint64_t, const char *, ...))v4;
      v6 = object_getClass(*(id *)(a1 + 32));
      v7 = class_isMetaClass(v6);
      v8 = object_getClassName(*(id *)(a1 + 32));
      v54 = sel_getName(*(SEL *)(a1 + 40));
      v9 = 45;
      if (v7)
        v9 = 43;
      v5(3, "%c[%{public}s %{public}s]:%i Previous delay send in progress", v9, v8, v54, 1450);
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
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v12;
      v63 = 2082;
      v64 = v13;
      v65 = 2082;
      v66 = v14;
      v67 = 1024;
      v68 = 1450;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Previous delay send in progress", (uint8_t *)&buf, 0x22u);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v17;
    v59[1] = &unk_1E3B68F40;
    v58[1] = CFSTR("Line");
    v58[2] = CFSTR("Method");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
    v59[2] = v18;
    v58[3] = *MEMORY[0x1E0CB2938];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 1451);
    v59[3] = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v59;
    v22 = v58;
LABEL_40:
    objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 12, v49);

LABEL_41:
    return v50;
  }
  if (*(double *)(a1 + 48) > 0.0 && !*(_QWORD *)(v2 + 72))
  {
    dispatch_get_global_queue(25, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&buf, (id)v2);
    v52 = objc_alloc(MEMORY[0x1E0DE78F8]);
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_367;
    v56[3] = &unk_1E3B52400;
    objc_copyWeak(&v57, &buf);
    v53 = (void *)objc_msgSend(v52, "initWithCallback:queue:", v56, v16);
    -[NFConnectionHandoverReceiver setEmuAssertTimer:](*(_QWORD *)(a1 + 32), v53);

    objc_destroyWeak(&v57);
    objc_destroyWeak(&buf);
    v50 = 0;
    goto LABEL_41;
  }
  return 0;
}

void __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_367(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_emuAssertTimerExpired");

}

uint64_t __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_3(uint64_t a1)
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid Parameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E3B68F58;
  v10[1] = CFSTR("Line");
  v10[2] = CFSTR("Method");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x1E0CB2938];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 1481);
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, 10, v8);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);

}

uint64_t __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_369(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_371(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_2_372(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__NFConnectionHandoverReceiver_sendHandoverSelect_delay_completionHandler___block_invoke_3_373(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  -[NFConnectionHandoverReceiver setPendingCHSelect:](*(_QWORD *)(a1 + 32), v2);

  objc_msgSend(*(id *)(a1 + 48), "retryRandom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 64);
  else
    v5 = 0;
  objc_msgSend(v5, "setRetryRandom:", v3);

  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_setProperty_nonatomic_copy(v7, v6, *(id *)(a1 + 56), 80);
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v7 = *(void **)(v8 + 72);
    else
      v7 = 0;
  }
  return objc_msgSend(v7, "startTimer:", *(double *)(a1 + 64));
}

- (void)_sendFailureAPDU
{
  NFHCESession *hceSession;
  id v4;
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "appendBytes:length:", &SW_STATUS_FAILURE, 2);
  if (self)
    hceSession = self->_hceSession;
  else
    hceSession = 0;
  v4 = -[NFHCESession sendAPDU:startReadOnCompletion:](hceSession, "sendAPDU:startReadOnCompletion:", v5, 1);

}

void __56__NFConnectionHandoverReceiver__triggerSessionStartedCB__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controllerDidStart:", *(_QWORD *)(a1 + 32));

  }
}

void __61__NFConnectionHandoverReceiver__triggerSessionInvalidatedCB___block_invoke(uint64_t a1)
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
      v19[1] = &unk_1E3B68F70;
      v18[1] = CFSTR("Line");
      v18[2] = CFSTR("Method");
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
      v19[2] = v11;
      v18[3] = *MEMORY[0x1E0CB2938];
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 1564);
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

- (BOOL)_processSelectCommand:(id)a3 response:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  unint64_t v15;
  id v16;
  int v17;
  _BOOL8 v18;
  const void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 isMetaClass;
  const char *v24;
  const char *v25;
  NFConnectionHandoverReceiver *v26;
  id v27;
  id v28;
  const char *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  BOOL v39;
  const void **v40;
  uint64_t Logger;
  void (*v42)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v44;
  const char *ClassName;
  const char *Name;
  uint64_t version;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  _DWORD v70[7];

  *(_QWORD *)&v70[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &CH_APP_NAME, 12);
  objc_msgSend(v7, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "length") <= 0xB)
  {

  }
  else
  {
    objc_msgSend(v7, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subdataWithRange:", 0, 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToData:", v9);

    if ((v13 & 1) != 0)
    {
      objc_msgSend(v7, "payload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v15 < 0xE)
      {
        v18 = 0;
      }
      else
      {
        objc_msgSend(v7, "payload");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v17 = *(unsigned __int8 *)(objc_msgSend(v16, "bytes") + 13);

        v18 = v17 != 0;
      }
      v40 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v42 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        if (class_isMetaClass(Class))
          v44 = 43;
        else
          v44 = 45;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        if (self)
          version = self->super._version;
        else
          version = 0;
        v42(6, "%c[%{public}s %{public}s]:%i Recv SELECT. CurrentVer=%{public}d, remoteVer=%{public}d", v44, ClassName, Name, 1604, version, v18);
      }
      dispatch_get_specific(*v40);
      NFSharedLogGetLogger();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = object_getClass(self);
        if (class_isMetaClass(v49))
          v50 = 43;
        else
          v50 = 45;
        v51 = object_getClassName(self);
        v52 = sel_getName(a2);
        if (self)
          v53 = self->super._version;
        else
          v53 = 0;
        *(_DWORD *)buf = 67110402;
        v62 = v50;
        v63 = 2082;
        v64 = v51;
        v65 = 2082;
        v66 = v52;
        v67 = 1024;
        v68 = 1604;
        v69 = 1026;
        v70[0] = v53;
        LOWORD(v70[1]) = 1026;
        *(_DWORD *)((char *)&v70[1] + 2) = v18;
        _os_log_impl(&dword_19B5EB000, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Recv SELECT. CurrentVer=%{public}d, remoteVer=%{public}d", buf, 0x2Eu);
      }

      if (self)
        v54 = self->super._version;
      else
        v54 = 0;
      objc_msgSend(MEMORY[0x1E0DE78E8], "TLVWithTag:unsignedChar:", 206, v54);
      v33 = objc_claimAutoreleasedReturnValue();
      v55 = (void *)MEMORY[0x1E0DE78E8];
      v60 = v33;
      v39 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "TLVWithTag:children:", 165, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v57, "asData");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendData:", v58);

      objc_msgSend(v8, "appendBytes:length:", &SW_STATUS_SUCCESS, 2);
      goto LABEL_34;
    }
  }
  objc_msgSend(v8, "appendBytes:length:", &SW_STATUS_FAILURE, 2);
  v19 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v20 = NFLogGetLogger();
  if (v20)
  {
    v21 = (void (*)(uint64_t, const char *, ...))v20;
    v22 = object_getClass(self);
    isMetaClass = class_isMetaClass(v22);
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    objc_msgSend(v7, "payload");
    v26 = self;
    v27 = v7;
    v28 = v8;
    v29 = a2;
    v30 = v9;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 45;
    if (isMetaClass)
      v32 = 43;
    v21(4, "%c[%{public}s %{public}s]:%i Recv unsupported SELECT : %@", v32, v24, v25, 1583, v31);

    v9 = v30;
    a2 = v29;
    v8 = v28;
    v7 = v27;
    self = v26;
    v19 = (const void **)MEMORY[0x1E0DE7900];
  }
  dispatch_get_specific(*v19);
  NFSharedLogGetLogger();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v34 = object_getClass(self);
    if (class_isMetaClass(v34))
      v35 = 43;
    else
      v35 = 45;
    v36 = object_getClassName(self);
    v37 = sel_getName(a2);
    objc_msgSend(v7, "payload");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    v62 = v35;
    v63 = 2082;
    v64 = v36;
    v65 = 2082;
    v66 = v37;
    v67 = 1024;
    v68 = 1583;
    v69 = 2112;
    *(_QWORD *)v70 = v38;
    _os_log_impl(&dword_19B5EB000, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Recv unsupported SELECT : %@", buf, 0x2Cu);

  }
  v39 = 0;
LABEL_34:

  return v39;
}

- (void)_processRetryRequest:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
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
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  NFHCESession *hceSession;
  NFHCESession *v23;
  void *v24;
  void *v25;
  const void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  _BOOL4 v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  const void **v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  const char *Name;
  const char *v61;
  const char *v62;
  _QWORD block[4];
  id v64;
  id v65;
  uint64_t *v66;
  _QWORD v67[5];
  id v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _QWORD v88[4];
  _QWORD v89[4];
  uint8_t buf[4];
  int v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  int v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__359;
  v86 = __Block_byref_object_dispose__360;
  v87 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__5;
  v80 = __Block_byref_object_dispose__5;
  v81 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v75 = 0;
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __53__NFConnectionHandoverReceiver__processRetryRequest___block_invoke;
  v67[3] = &unk_1E3B52478;
  v67[4] = self;
  v7 = v5;
  v68 = v7;
  v69 = &v72;
  v70 = &v76;
  v71 = &v82;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v67);
  if (*((_BYTE *)v73 + 24))
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
      v10(4, "%c[%{public}s %{public}s]:%i Unexpected state: random mismatch, dropping request", v14, ClassName, Name, 1655);
    }
    dispatch_get_specific(*v8);
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
      *(_DWORD *)buf = 67109890;
      v91 = v17;
      v92 = 2082;
      v93 = v18;
      v94 = 2082;
      v95 = v19;
      v96 = 1024;
      v97 = 1655;
      _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state: random mismatch, dropping request", buf, 0x22u);
    }

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &SW_STATUS_FAILURE, 2);
    goto LABEL_12;
  }
  if (!v77[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFConnectionHandoverController.m"), 1658, CFSTR("Missing handler"));

  }
  v25 = (void *)v83[5];
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFConnectionHandoverController.m"), 1659, CFSTR("Missing pending select"));

    v25 = (void *)v83[5];
  }
  objc_msgSend(v25, "encode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    if (v77[5])
    {
LABEL_12:
      v21 = 0;
      goto LABEL_13;
    }
    v26 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v27 = NFLogGetLogger();
    if (v27)
    {
      v28 = (void (*)(uint64_t, const char *, ...))v27;
      v29 = object_getClass(self);
      v30 = class_isMetaClass(v29);
      v31 = object_getClassName(self);
      v61 = sel_getName(a2);
      v32 = 45;
      if (v30)
        v32 = 43;
      v28(3, "%c[%{public}s %{public}s]:%i Unexpected state: handler=nil", v32, v31, v61, 1668);
    }
    dispatch_get_specific(*v26);
    NFSharedLogGetLogger();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = object_getClass(self);
      if (class_isMetaClass(v34))
        v35 = 43;
      else
        v35 = 45;
      v36 = object_getClassName(self);
      v37 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v91 = v35;
      v92 = 2082;
      v93 = v36;
      v94 = 2082;
      v95 = v37;
      v96 = 1024;
      v97 = 1668;
      _os_log_impl(&dword_19B5EB000, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state: handler=nil", buf, 0x22u);
    }

    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &SW_STATUS_FAILURE, 2);
    v21 = 0;
    v20 = (void *)v38;
  }
  else
  {
    v39 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v40 = NFLogGetLogger();
    if (v40)
    {
      v41 = (void (*)(uint64_t, const char *, ...))v40;
      v42 = object_getClass(self);
      v43 = class_isMetaClass(v42);
      v44 = object_getClassName(self);
      v62 = sel_getName(a2);
      v45 = 45;
      if (v43)
        v45 = 43;
      v41(3, "%c[%{public}s %{public}s]:%i Unexpected state: apdu empty", v45, v44, v62, 1664);
    }
    dispatch_get_specific(*v39);
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
      *(_DWORD *)buf = 67109890;
      v91 = v48;
      v92 = 2082;
      v93 = v49;
      v94 = 2082;
      v95 = v50;
      v96 = 1024;
      v97 = 1664;
      _os_log_impl(&dword_19B5EB000, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state: apdu empty", buf, 0x22u);
    }

    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &SW_STATUS_FAILURE, 2);
    v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v54;
    v89[1] = &unk_1E3B68F88;
    v88[1] = CFSTR("Line");
    v88[2] = CFSTR("Method");
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v89[2] = v55;
    v88[3] = *MEMORY[0x1E0CB2938];
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1666);
    v89[3] = v56;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 4);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 12, v57);

    v20 = (void *)v51;
    v6 = MEMORY[0x1E0C809B0];
  }
LABEL_13:
  if (self)
    hceSession = self->_hceSession;
  else
    hceSession = 0;
  v23 = hceSession;
  -[NFHCESession sendAPDU:startReadOnCompletion:](v23, "sendAPDU:startReadOnCompletion:", v20, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77[5] && !*((_BYTE *)v73 + 24))
  {
    if (self)
      self = (NFConnectionHandoverReceiver *)self->super._callbackQueue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __53__NFConnectionHandoverReceiver__processRetryRequest___block_invoke_389;
    block[3] = &unk_1E3B524A0;
    v64 = v24;
    v66 = &v76;
    v65 = v21;
    dispatch_async(&self->super.super, block);

  }
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
}

void __53__NFConnectionHandoverReceiver__processRetryRequest___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[8];
  v3 = v2;
  objc_msgSend(v3, "retryRandom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedShortValue");
  objc_msgSend(*(id *)(a1 + 40), "retryRandom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v6, "unsignedShortValue");
  if (v5 == (_DWORD)v3)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(void **)(v7 + 80);
    else
      v8 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v8);
    v10 = *(void **)(a1 + 32);
    if (v10 && (objc_setProperty_nonatomic_copy(v10, v9, 0, 80), (v11 = *(_QWORD *)(a1 + 32)) != 0))
      v12 = *(void **)(v11 + 64);
    else
      v12 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v12);
    -[NFConnectionHandoverReceiver setPendingCHSelect:](*(_QWORD *)(a1 + 32), 0);
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      v14 = *(void **)(v13 + 72);
    else
      v14 = 0;
    objc_msgSend(v14, "stopTimer");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

uint64_t __53__NFConnectionHandoverReceiver__processRetryRequest___block_invoke_389(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v2)
    v2 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
}

- (void)_processConnect
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__NFConnectionHandoverReceiver__processConnect__block_invoke;
  v2[3] = &unk_1E3B51A60;
  v2[4] = self;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v2);
}

void __47__NFConnectionHandoverReceiver__processConnect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (*(_BYTE *)(v2 + 40) = 1, (v2 = *(_QWORD *)(a1 + 32)) == 0))
  {
    v3 = 0;
LABEL_5:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__NFConnectionHandoverReceiver__processConnect__block_invoke_2;
    block[3] = &unk_1E3B51A60;
    block[4] = v2;
    dispatch_async(v3, block);
    v2 = *(_QWORD *)(a1 + 32);
    if (!v2)
      return;
    goto LABEL_6;
  }
  if (!*(_BYTE *)(v2 + 41))
  {
    v3 = *(NSObject **)(v2 + 32);
    goto LABEL_5;
  }
LABEL_6:
  *(_BYTE *)(v2 + 41) = 1;
}

void __47__NFConnectionHandoverReceiver__processConnect__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didConnectedToInitiator:", *(_QWORD *)(a1 + 32));

}

- (void)_processDisconnectWithPossibleDiscoveryRestart:(uint64_t)a1
{
  uint64_t v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  int v18;
  int v19;
  NSObject *v20;
  _QWORD block[5];
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v4 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __79__NFConnectionHandoverReceiver__processDisconnectWithPossibleDiscoveryRestart___block_invoke;
    v22[3] = &unk_1E3B524C8;
    v22[4] = a1;
    v22[5] = &v27;
    v22[6] = &v23;
    -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)a1, v22);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass((id)a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName((id)a1);
      Name = sel_getName(sel__processDisconnectWithPossibleDiscoveryRestart_);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v7(6, "%c[%{public}s %{public}s]:%i pending select=%d, didConnect=%d", v12, ClassName, Name, 1719, *((unsigned __int8 *)v28 + 24), *((unsigned __int8 *)v24 + 24));
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = object_getClass((id)a1);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      v16 = object_getClassName((id)a1);
      v17 = sel_getName(sel__processDisconnectWithPossibleDiscoveryRestart_);
      v18 = *((unsigned __int8 *)v28 + 24);
      v19 = *((unsigned __int8 *)v24 + 24);
      *(_DWORD *)buf = 67110402;
      v32 = v15;
      v33 = 2082;
      v34 = v16;
      v35 = 2082;
      v36 = v17;
      v37 = 1024;
      v38 = 1719;
      v39 = 1024;
      v40 = v18;
      v41 = 1024;
      v42 = v19;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i pending select=%d, didConnect=%d", buf, 0x2Eu);
    }

    if (*((_BYTE *)v28 + 24) || !*((_BYTE *)v24 + 24))
    {
      if (a2)
        objc_msgSend(*(id *)(a1 + 56), "restartDiscovery");
    }
    else
    {
      v20 = *(NSObject **)(a1 + 32);
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __79__NFConnectionHandoverReceiver__processDisconnectWithPossibleDiscoveryRestart___block_invoke_393;
      block[3] = &unk_1E3B51A60;
      block[4] = a1;
      dispatch_async(v20, block);
    }
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
}

_QWORD *__79__NFConnectionHandoverReceiver__processDisconnectWithPossibleDiscoveryRestart___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result[4];
  if (v1)
    v1 = *(_QWORD *)(v1 + 64);
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = v1 != 0;
  v2 = result[4];
  if (v2)
    LOBYTE(v2) = *(_BYTE *)(v2 + 41) != 0;
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = v2;
  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v3 = result[4];
    if (v3)
      *(_BYTE *)(v3 + 41) = 0;
  }
  return result;
}

void __79__NFConnectionHandoverReceiver__processDisconnectWithPossibleDiscoveryRestart___block_invoke_393(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDisconnectedFromInitiator:", *(_QWORD *)(a1 + 32));

}

- (void)hceSessionDidEndUnexpectedly:(id)a3
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
    v7(6, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", v11, ClassName, Name, 1736);
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
    v24 = 1736;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session terminated unexpectedly", buf, 0x22u);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__NFConnectionHandoverReceiver_hceSessionDidEndUnexpectedly___block_invoke;
  v16[3] = &unk_1E3B51460;
  v16[4] = self;
  v16[5] = a2;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v16);
}

void __61__NFConnectionHandoverReceiver_hceSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Session terminated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_1E3B68FA0;
  v12[1] = CFSTR("Line");
  v12[2] = CFSTR("Method");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v13[2] = v8;
  v12[3] = *MEMORY[0x1E0CB2938];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 1739);
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 44, v10);
  -[NFConnectionHandoverReceiver _triggerSessionInvalidatedCB:](v4, v11);

}

- (void)hceSessionDidConnect:(id)a3
{
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  int v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__NFConnectionHandoverReceiver_hceSessionDidConnect___block_invoke;
  v19[3] = &unk_1E3B524F0;
  v19[4] = self;
  v19[5] = &v20;
  -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v19);
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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i Reader connected; pending select=%d",
      v12,
      ClassName,
      Name,
      1750,
      *((unsigned __int8 *)v21 + 24));
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    v16 = object_getClassName(self);
    v17 = sel_getName(a2);
    v18 = *((unsigned __int8 *)v21 + 24);
    *(_DWORD *)buf = 67110146;
    v25 = v15;
    v26 = 2082;
    v27 = v16;
    v28 = 2082;
    v29 = v17;
    v30 = 1024;
    v31 = 1750;
    v32 = 1024;
    v33 = v18;
    _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reader connected; pending select=%d",
      buf,
      0x28u);
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __53__NFConnectionHandoverReceiver_hceSessionDidConnect___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    v1 = *(_QWORD *)(v1 + 64);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v1 != 0;
  return result;
}

- (void)hceSessionDidDisconnect:(id)a3
{
  -[NFConnectionHandoverReceiver _processDisconnectWithPossibleDiscoveryRestart:]((uint64_t)self, 1);
}

- (void)hceSession:(id)a3 didReceiveAPDU:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  const void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  _BOOL4 v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const void **v37;
  uint64_t v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  void *v49;
  NSObject *callbackQueue;
  const void **v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  _BOOL4 v55;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  objc_class *v59;
  int v60;
  const char *v61;
  const char *v62;
  const void **v63;
  uint64_t Logger;
  void (*v65)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  NSObject *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *Name;
  _QWORD block[5];
  NSObject *v81;
  _QWORD v82[6];
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  uint8_t buf[4];
  _BYTE v88[14];
  __int16 v89;
  const char *v90;
  __int16 v91;
  int v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  NFSharedSignpostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B5EB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", (const char *)&unk_19B692E4A, buf, 2u);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DE78B8]), "initWithData:", v8);
  if (v10)
  {
    if (objc_msgSend(v10, "isSelectCommand"))
    {
      v11 = (void *)objc_opt_new();
      v12 = -[NFConnectionHandoverReceiver _processSelectCommand:response:](self, "_processSelectCommand:response:", v10, v11);
      v13 = (id)objc_msgSend(v7, "sendAPDU:startReadOnCompletion:", v11, 1);
      NFSharedSignpostLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        v15 = "N";
        if (v12)
          v15 = "Y";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v88 = v15;
        _os_signpost_emit_with_name_impl(&dword_19B5EB000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", "SELECTED=%s", buf, 0xCu);
      }

      if (v12)
      {
        -[NFConnectionHandoverReceiver _processConnect](self, "_processConnect");
      }
      else if (self)
      {
        -[NFConnectionHandoverReceiver _processDisconnectWithPossibleDiscoveryRestart:]((uint64_t)self, 0);
      }

      goto LABEL_50;
    }
    v83 = 0;
    v84 = &v83;
    v85 = 0x2020000000;
    v86 = 0;
    v17 = MEMORY[0x1E0C809B0];
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __58__NFConnectionHandoverReceiver_hceSession_didReceiveAPDU___block_invoke;
    v82[3] = &unk_1E3B524F0;
    v82[4] = self;
    v82[5] = &v83;
    -[NFConnectionHandoverController executeWithLock:]((os_unfair_lock_s *)self, v82);
    if (*((_BYTE *)v84 + 24))
    {
      if (objc_msgSend(v10, "instruction") == 202
        && objc_msgSend(v10, "p1") == 1
        && (objc_msgSend(v10, "p2") == 3 || objc_msgSend(v10, "p2") == 4))
      {
        v18 = objc_msgSend(v10, "p2");
        objc_msgSend(v10, "payload");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18 != 4)
        {
          objc_msgSend(v19, "decodeCHRequest");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            if (self)
              callbackQueue = self->super._callbackQueue;
            else
              callbackQueue = 0;
            block[0] = v17;
            block[1] = 3221225472;
            block[2] = __58__NFConnectionHandoverReceiver_hceSession_didReceiveAPDU___block_invoke_402;
            block[3] = &unk_1E3B51E70;
            block[4] = self;
            v21 = v49;
            v81 = v21;
            dispatch_async(callbackQueue, block);

          }
          else
          {
            v63 = (const void **)MEMORY[0x1E0DE7900];
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            Logger = NFLogGetLogger();
            if (Logger)
            {
              v65 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v69 = 45;
              if (isMetaClass)
                v69 = 43;
              v65(4, "%c[%{public}s %{public}s]:%i Invalid request received!", v69, ClassName, Name, 1838);
            }
            dispatch_get_specific(*v63);
            NFSharedLogGetLogger();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              v71 = object_getClass(self);
              if (class_isMetaClass(v71))
                v72 = 43;
              else
                v72 = 45;
              v73 = object_getClassName(self);
              v74 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v88 = v72;
              *(_WORD *)&v88[4] = 2082;
              *(_QWORD *)&v88[6] = v73;
              v89 = 2082;
              v90 = v74;
              v91 = 1024;
              v92 = 1838;
              _os_log_impl(&dword_19B5EB000, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid request received!", buf, 0x22u);
            }

            -[NFConnectionHandoverReceiver _sendFailureAPDU](self, "_sendFailureAPDU");
            NFSharedSignpostLog();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v75))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_19B5EB000, v75, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", "RequestDecodeFailure", buf, 2u);
            }

            v21 = 0;
          }
          goto LABEL_49;
        }
        objc_msgSend(v19, "decodeCHRequestRetry");
        v21 = objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[NFConnectionHandoverReceiver _processRetryRequest:](self, "_processRetryRequest:", v21);
          NFSharedSignpostLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v22))
          {
LABEL_67:

            goto LABEL_49;
          }
          *(_WORD *)buf = 0;
          v23 = "RequestRetryReceived";
        }
        else
        {
          -[NFConnectionHandoverReceiver _sendFailureAPDU](self, "_sendFailureAPDU");
          v51 = (const void **)MEMORY[0x1E0DE7900];
          dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
          v52 = NFLogGetLogger();
          if (v52)
          {
            v53 = (void (*)(uint64_t, const char *, ...))v52;
            v54 = object_getClass(self);
            v55 = class_isMetaClass(v54);
            v56 = object_getClassName(self);
            v78 = sel_getName(a2);
            v57 = 45;
            if (v55)
              v57 = 43;
            v53(4, "%c[%{public}s %{public}s]:%i Invalid retry request", v57, v56, v78, 1823);
          }
          dispatch_get_specific(*v51);
          NFSharedLogGetLogger();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            v59 = object_getClass(self);
            if (class_isMetaClass(v59))
              v60 = 43;
            else
              v60 = 45;
            v61 = object_getClassName(self);
            v62 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v88 = v60;
            *(_WORD *)&v88[4] = 2082;
            *(_QWORD *)&v88[6] = v61;
            v89 = 2082;
            v90 = v62;
            v91 = 1024;
            v92 = 1823;
            _os_log_impl(&dword_19B5EB000, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid retry request", buf, 0x22u);
          }

          NFSharedSignpostLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v22))
            goto LABEL_67;
          *(_WORD *)buf = 0;
          v23 = "RequestDecodeFailure";
        }
        _os_signpost_emit_with_name_impl(&dword_19B5EB000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", v23, buf, 2u);
        goto LABEL_67;
      }
      -[NFConnectionHandoverReceiver _sendFailureAPDU](self, "_sendFailureAPDU");
      v24 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v25 = NFLogGetLogger();
      if (v25)
      {
        v26 = (void (*)(uint64_t, const char *, ...))v25;
        v27 = object_getClass(self);
        v28 = class_isMetaClass(v27);
        v29 = object_getClassName(self);
        v76 = sel_getName(a2);
        v30 = 45;
        if (v28)
          v30 = 43;
        v26(4, "%c[%{public}s %{public}s]:%i Unsupported command received.", v30, v29, v76, 1813);
      }
      dispatch_get_specific(*v24);
      NFSharedLogGetLogger();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = object_getClass(self);
        if (class_isMetaClass(v32))
          v33 = 43;
        else
          v33 = 45;
        v34 = object_getClassName(self);
        v35 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v88 = v33;
        *(_WORD *)&v88[4] = 2082;
        *(_QWORD *)&v88[6] = v34;
        v89 = 2082;
        v90 = v35;
        v91 = 1024;
        v92 = 1813;
        _os_log_impl(&dword_19B5EB000, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unsupported command received.", buf, 0x22u);
      }

      NFSharedSignpostLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v21))
        goto LABEL_49;
      *(_WORD *)buf = 0;
      v36 = "UnsupportedCommand";
    }
    else
    {
      -[NFConnectionHandoverReceiver _sendFailureAPDU](self, "_sendFailureAPDU");
      v37 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v38 = NFLogGetLogger();
      if (v38)
      {
        v39 = (void (*)(uint64_t, const char *, ...))v38;
        v40 = object_getClass(self);
        v41 = class_isMetaClass(v40);
        v42 = object_getClassName(self);
        v77 = sel_getName(a2);
        v43 = 45;
        if (v41)
          v43 = 43;
        v39(4, "%c[%{public}s %{public}s]:%i Not in selected state", v43, v42, v77, 1799);
      }
      dispatch_get_specific(*v37);
      NFSharedLogGetLogger();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = object_getClass(self);
        if (class_isMetaClass(v45))
          v46 = 43;
        else
          v46 = 45;
        v47 = object_getClassName(self);
        v48 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v88 = v46;
        *(_WORD *)&v88[4] = 2082;
        *(_QWORD *)&v88[6] = v47;
        v89 = 2082;
        v90 = v48;
        v91 = 1024;
        v92 = 1799;
        _os_log_impl(&dword_19B5EB000, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not in selected state", buf, 0x22u);
      }

      NFSharedSignpostLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v21))
        goto LABEL_49;
      *(_WORD *)buf = 0;
      v36 = "AppNotSelected";
    }
    _os_signpost_emit_with_name_impl(&dword_19B5EB000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", v36, buf, 2u);
LABEL_49:

    _Block_object_dispose(&v83, 8);
    goto LABEL_50;
  }
  -[NFConnectionHandoverReceiver _sendFailureAPDU](self, "_sendFailureAPDU");
  NFSharedSignpostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B5EB000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", "APDUDecodeFailure", buf, 2u);
  }

LABEL_50:
}

uint64_t __58__NFConnectionHandoverReceiver_hceSession_didReceiveAPDU___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    LOBYTE(v1) = *(_BYTE *)(v1 + 40) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v1;
  return result;
}

void __58__NFConnectionHandoverReceiver_hceSession_didReceiveAPDU___block_invoke_402(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:didReceiveRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  NFSharedSignpostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B5EB000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NFConnectionHandoverReceiver_APDU", "RequestReceived", v4, 2u);
  }

}

- (void)hceSession:(id)a3 didReceiveField:(id)a4
{
  NSObject *v6;
  const void **v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  _BOOL4 v30;
  uint64_t v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  NSObject *callbackQueue;
  const char *ClassName;
  const char *v38;
  const char *v39;
  const char *Name;
  const char *v41;
  const char *v42;
  _QWORD block[5];
  NSObject *v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  NSObject *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 1853, v6);
  }
  dispatch_get_specific(*v7);
  NFSharedLogGetLogger();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67110146;
    v46 = v15;
    v47 = 2082;
    v48 = object_getClassName(self);
    v49 = 2082;
    v50 = sel_getName(a2);
    v51 = 1024;
    v52 = 1853;
    v53 = 2114;
    v54 = v6;
    _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if (-[NSObject notificationType](v6, "notificationType") == 3)
  {
    v16 = v6;
    if (-[NSObject terminalType](v16, "terminalType") == 5
      && !-[NSObject terminalSubType](v16, "terminalSubType"))
    {
      if (self)
        callbackQueue = self->super._callbackQueue;
      else
        callbackQueue = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__NFConnectionHandoverReceiver_hceSession_didReceiveField___block_invoke;
      block[3] = &unk_1E3B51E70;
      block[4] = self;
      v16 = v16;
      v44 = v16;
      dispatch_async(callbackQueue, block);

    }
    else
    {
      dispatch_get_specific(*v7);
      v17 = NFLogGetLogger();
      if (v17)
      {
        v18 = (void (*)(uint64_t, const char *, ...))v17;
        v19 = object_getClass(self);
        v20 = class_isMetaClass(v19);
        v38 = object_getClassName(self);
        v41 = sel_getName(a2);
        v21 = 45;
        if (v20)
          v21 = 43;
        v18(6, "%c[%{public}s %{public}s]:%i Ignore unrelated field: %@", v21, v38, v41, 1862, v16);
      }
      dispatch_get_specific(*v7);
      NFSharedLogGetLogger();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = object_getClass(self);
        if (class_isMetaClass(v23))
          v24 = 43;
        else
          v24 = 45;
        v25 = object_getClassName(self);
        v26 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v46 = v24;
        v47 = 2082;
        v48 = v25;
        v49 = 2082;
        v50 = v26;
        v51 = 1024;
        v52 = 1862;
        v53 = 2112;
        v54 = v16;
        _os_log_impl(&dword_19B5EB000, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignore unrelated field: %@", buf, 0x2Cu);
      }

    }
  }
  else
  {
    dispatch_get_specific(*v7);
    v27 = NFLogGetLogger();
    if (v27)
    {
      v28 = (void (*)(uint64_t, const char *, ...))v27;
      v29 = object_getClass(self);
      v30 = class_isMetaClass(v29);
      v39 = object_getClassName(self);
      v42 = sel_getName(a2);
      v31 = 45;
      if (v30)
        v31 = 43;
      v28(6, "%c[%{public}s %{public}s]:%i Ignore unrelated field: %@", v31, v39, v42, 1855, v6);
    }
    dispatch_get_specific(*v7);
    NFSharedLogGetLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v32 = object_getClass(self);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      v34 = object_getClassName(self);
      v35 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v46 = v33;
      v47 = 2082;
      v48 = v34;
      v49 = 2082;
      v50 = v35;
      v51 = 1024;
      v52 = 1855;
      v53 = 2112;
      v54 = v6;
      _os_log_impl(&dword_19B5EB000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignore unrelated field: %@", buf, 0x2Cu);
    }
  }

}

void __59__NFConnectionHandoverReceiver_hceSession_didReceiveField___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:didReceiveField:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)hceSession:(id)a3 triggeredByField:(id)a4 started:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  const void **v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *callbackQueue;
  const char *ClassName;
  const char *Name;
  _QWORD block[5];
  id v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
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
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i started=%d", v14, ClassName, Name, 1873, v5);
  }
  dispatch_get_specific(*v9);
  NFSharedLogGetLogger();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67110146;
    v27 = v17;
    v28 = 2082;
    v29 = object_getClassName(self);
    v30 = 2082;
    v31 = sel_getName(a2);
    v32 = 1024;
    v33 = 1873;
    v34 = 1024;
    v35 = v5;
    _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i started=%d", buf, 0x28u);
  }

  if (!v5)
  {
    -[NFConnectionHandoverReceiver delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {

    }
    else
    {
      -[NFConnectionHandoverReceiver delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) == 0)
        goto LABEL_17;
    }
    if (self)
      callbackQueue = self->super._callbackQueue;
    else
      callbackQueue = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__NFConnectionHandoverReceiver_hceSession_triggeredByField_started___block_invoke;
    block[3] = &unk_1E3B51E70;
    block[4] = self;
    v25 = v8;
    dispatch_async(callbackQueue, block);

  }
LABEL_17:

}

void __68__NFConnectionHandoverReceiver_hceSession_triggeredByField_started___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controllerDidDetectPotentialInitiator:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "controllerDidDetectPotentialInitiator:field:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)handleSessionResumed
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
  char v15;
  NSObject *callbackQueue;
  const char *Name;
  _QWORD block[5];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 1897);
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
    v20 = v13;
    v21 = 2082;
    v22 = object_getClassName(self);
    v23 = 2082;
    v24 = sel_getName(a2);
    v25 = 1024;
    v26 = 1897;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  -[NFConnectionHandoverReceiver delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    if (self)
      callbackQueue = self->super._callbackQueue;
    else
      callbackQueue = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__NFConnectionHandoverReceiver_handleSessionResumed__block_invoke;
    block[3] = &unk_1E3B51A60;
    block[4] = self;
    dispatch_async(callbackQueue, block);
  }
}

void __52__NFConnectionHandoverReceiver_handleSessionResumed__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerDidDetectPotentialInitiator:", *(_QWORD *)(a1 + 32));

}

- (NFConnectionHandoverReceiverDelegate)delegate
{
  return (NFConnectionHandoverReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delaySendSelectCompletion, 0);
  objc_storeStrong((id *)&self->_emuAssertTimer, 0);
  objc_storeStrong((id *)&self->_pendingCHSelect, 0);
  objc_storeStrong((id *)&self->_hceSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
