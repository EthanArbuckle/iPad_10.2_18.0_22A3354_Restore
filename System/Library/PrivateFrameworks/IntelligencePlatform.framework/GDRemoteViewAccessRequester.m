@implementation GDRemoteViewAccessRequester

- (id)requestAssertionForViewName:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  unint64_t v39;
  __CFString *v40;
  id v41;
  os_signpost_id_t v42;
  id *v43;
  void *v44;
  const char *v45;
  int isEqualToString;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const __CFString *v50;
  id v51;
  const char *v52;
  void *v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  __CFString *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GDSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE4F2000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "viewServing", ", buf, 2u);
  }

  v9 = mach_absolute_time();
  v55 = 0;
  objc_msgSend__requestAssertionForViewName_error_(self, v10, (uint64_t)v6, &v55);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v55;
  v13 = (void *)objc_opt_class();
  v14 = mach_absolute_time();
  v16 = objc_msgSend__machTimeToMilliseconds_(v13, v15, v14 - v9);
  v17 = (void *)objc_opt_new();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v17, v20, (uint64_t)v19, CFSTR("latencyMillis"));

  if (qword_1ED327448 != -1)
    dispatch_once(&qword_1ED327448, &unk_1E5DD9830);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v21, qword_1ED327440, CFSTR("processName"));
  objc_msgSend_setObject_forKeyedSubscript_(v17, v22, (uint64_t)v6, CFSTR("viewName"));
  if (v11)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v17, v23, MEMORY[0x1E0C9AAB0], CFSTR("success"));
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v17, v23, MEMORY[0x1E0C9AAA0], CFSTR("success"));
    if (v12)
    {
      objc_msgSend_domain(v12, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v17, v27, (uint64_t)v26, CFSTR("errorDomain"));

      v28 = (void *)MEMORY[0x1E0CB37E8];
      v31 = objc_msgSend_code(v12, v29, v30);
      objc_msgSend_numberWithInteger_(v28, v32, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v17, v34, (uint64_t)v33, CFSTR("errorCode"));

    }
  }
  AnalyticsSendEvent();
  if (objc_msgSend_isInternalDevice(GDOSVariant, v35, v36))
  {
    v54 = v11;
    if (v11)
    {
      v39 = v8 - 1;
      v40 = CFSTR("success");
      if (v12)
      {
LABEL_13:
        v41 = v6;
        v42 = v8;
        v43 = a4;
        objc_msgSend_domain(v12, v37, v38);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v44, v45, (uint64_t)CFSTR("com.apple.intelligenceplatform.IntelligencePlatformCore.ViewXPC.AccessError"));

        if (isEqualToString)
          v49 = objc_msgSend_code(v12, v47, v48);
        else
          v49 = -1;
        a4 = v43;
        v8 = v42;
        v6 = v41;
        goto LABEL_25;
      }
    }
    else
    {
      v39 = v8 - 1;
      v51 = objc_alloc(MEMORY[0x1E0CB3940]);
      v40 = (__CFString *)objc_msgSend_initWithFormat_(v51, v52, (uint64_t)CFSTR("error: %@"), v12);
      if (v12)
        goto LABEL_13;
    }
    v49 = 0;
LABEL_25:
    if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 138543874;
      v57 = v6;
      v58 = 2114;
      v59 = v40;
      v60 = 2050;
      v61 = v49;
      _os_signpost_emit_with_name_impl(&dword_1AE4F2000, v7, OS_SIGNPOST_INTERVAL_END, v8, "viewServing", "viewName=%{signpost.telemetry:string1,public}@ result=%{signpost.telemetry:string2,public}@ errorCode=%{signpost.telemetry:number1,public}ld enableTelemetry=YES ", buf, 0x20u);
    }

    v11 = v54;
    goto LABEL_29;
  }
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v50 = CFSTR("success");
    if (!v11)
      v50 = CFSTR("error");
    *(_DWORD *)buf = 138543618;
    v57 = v6;
    v58 = 2114;
    v59 = (__CFString *)v50;
    _os_signpost_emit_with_name_impl(&dword_1AE4F2000, v7, OS_SIGNPOST_INTERVAL_END, v8, "viewServing", "viewName=%{signpost.telemetry:string1,public}@ result=%{signpost.telemetry:string2,public}@ enableTelemetry=YES ", buf, 0x16u);
  }
  v40 = (__CFString *)v7;
LABEL_29:

  if (a4 && !v11)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (id)_requestAssertionForViewName:(id)a3 error:(id *)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  GDRemoteViewAccessRequester *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1AE90BED0;
  v28 = sub_1AE90BEE0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1AE90BED0;
  v22 = sub_1AE90BEE0;
  v23 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1AE5043B8;
  v13[3] = &unk_1E5DD97F0;
  v16 = &v24;
  v8 = v6;
  v14 = v8;
  v15 = self;
  v17 = &v18;
  objc_msgSend_runWithLockAcquired_(lock, v9, (uint64_t)v13);
  v10 = (void *)v25[5];
  if (a4 && !v10)
  {
    *a4 = objc_retainAutorelease((id)v19[5]);
    v10 = (void *)v25[5];
  }
  v11 = v10;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

+ (BOOL)currentProcessIsSandboxed
{
  if (qword_1ED327450 != -1)
    dispatch_once(&qword_1ED327450, &unk_1E5DD97C8);
  return dword_1ED327458 != 0;
}

- (GDRemoteViewAccessRequester)init
{
  GDRemoteViewAccessRequester *v2;
  id v3;
  GDViewRemoteAccessRequesterGuardedData *v4;
  const char *v5;
  uint64_t v6;
  _PASLock *lock;
  uint64_t v8;
  GDXPCViewService *xpcService;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GDRemoteViewAccessRequester;
  v2 = -[GDRemoteViewAccessRequester init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = objc_alloc_init(GDViewRemoteAccessRequesterGuardedData);
    v6 = objc_msgSend_initWithGuardedData_(v3, v5, (uint64_t)v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v6;

    v8 = objc_opt_new();
    xpcService = v2->_xpcService;
    v2->_xpcService = (GDXPCViewService *)v8;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcService, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

+ (unint64_t)_machTimeToMilliseconds:(unint64_t)a3
{
  if (qword_1ED327438 != -1)
    dispatch_once(&qword_1ED327438, &unk_1E5DD9810);
  return dword_1ED327430 * a3 / *(unsigned int *)algn_1ED327434 / 0xF4240;
}

@end
