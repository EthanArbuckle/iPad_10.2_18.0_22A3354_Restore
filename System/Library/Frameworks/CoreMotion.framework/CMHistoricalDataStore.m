@implementation CMHistoricalDataStore

- (CMHistoricalDataStore)init
{
  CMHistoricalDataStore *v2;
  CMHistoricalDataStore *v3;
  uint64_t v4;
  NSObject *v5;
  char *v7;
  objc_super v8;
  void *__p[2];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CMHistoricalDataStore;
  v2 = -[CMHistoricalDataStore init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->fConfiguration = 0;
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.HistoricalDatastore", 0);
    v4 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v4, __p, v3->fInternalQueue);
    if (v10 < 0)
      operator delete(__p[0]);
    sub_18F331ACC((uint64_t *)&v3->fLocationdConnection, v4);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v5 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "Initializing CMHistoricalDatastore, starting client connection to daemon", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore init]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)__p)
        free(v7);
    }
    CLConnectionClient::start(v3->fLocationdConnection.__ptr_.__value_);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  objc_msgSend_resetToken(self, a2, v2, v3, v4);
  objc_msgSend_closeDBConnection(self, v6, v7, v8, v9);
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  sub_18F331ACC((uint64_t *)&self->fLocationdConnection, 0);

  v10.receiver = self;
  v10.super_class = (Class)CMHistoricalDataStore;
  -[CMHistoricalDataStore dealloc](&v10, sel_dealloc);
}

- (BOOL)queryConfigurationFromDaemon
{
  char v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  int v56;
  uint64_t v57;
  uint8_t buf[4];
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (self->fConfiguration)
    return 1;
  sub_18F337958("kCLConnectionMessageColdStorageQueryConfiguration", &v54);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v13 = objc_msgSend_setWithObjects_(v5, v9, v6, v10, v11, v7, v8, 0);
  v52 = v54;
  v53 = v55;
  if (v55)
  {
    p_shared_owners = (unint64_t *)&v55->__shared_owners_;
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
  }
  v17 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v12, (uint64_t)&v52, v13, v14);
  v21 = (void *)v17;
  v22 = v53;
  if (!v53)
    goto LABEL_11;
  v23 = (unint64_t *)&v53->__shared_owners_;
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 - 1, v23));
  if (v24)
  {
LABEL_11:
    if (v17)
      goto LABEL_12;
LABEL_22:
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v34 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_ERROR, "Failed to get reply dictionary", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      goto LABEL_36;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 == -1)
      goto LABEL_28;
    goto LABEL_46;
  }
  ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
  std::__shared_weak_count::__release_weak(v22);
  if (!v21)
    goto LABEL_22;
LABEL_12:
  if (objc_msgSend_objectForKeyedSubscript_(v21, v18, (uint64_t)CFSTR("CMErrorMessage"), v19, v20))
  {
    v28 = (void *)objc_msgSend_objectForKeyedSubscript_(v21, v25, (uint64_t)CFSTR("CMErrorMessage"), v26, v27);
    if (objc_msgSend_intValue(v28, v29, v30, v31, v32) != 111)
    {
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v40 = qword_1EE16D940;
      if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
      {
        v44 = objc_msgSend_objectForKeyedSubscript_(v21, v41, (uint64_t)CFSTR("CMErrorMessage"), v42, v43);
        *(_DWORD *)buf = 138543362;
        v59 = v44;
        _os_log_impl(&dword_18F1DC000, v40, OS_LOG_TYPE_ERROR, "Error fetching configuration: %{public}@", buf, 0xCu);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_36;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v51 = objc_msgSend_objectForKeyedSubscript_(v21, v48, (uint64_t)CFSTR("CMErrorMessage"), v49, v50);
      v56 = 138543362;
      v57 = v51;
      v35 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore queryConfigurationFromDaemon]", "CoreLocation: %s\n", v35);
      if (v35 == (char *)buf)
        goto LABEL_36;
LABEL_45:
      free(v35);
LABEL_36:
      v2 = 0;
      goto LABEL_37;
    }
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v33 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v33, OS_LOG_TYPE_FAULT, "Missing entitlement: com.apple.locationd.cold-storage", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      goto LABEL_36;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 == -1)
    {
LABEL_28:
      LOWORD(v56) = 0;
      v35 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore queryConfigurationFromDaemon]", "CoreLocation: %s\n", v35);
      if (v35 == (char *)buf)
        goto LABEL_36;
      goto LABEL_45;
    }
LABEL_46:
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    goto LABEL_28;
  }
  v36 = objc_msgSend_objectForKeyedSubscript_(v21, v25, (uint64_t)CFSTR("CMColdStorageConfiguration"), v26, v27);
  v2 = objc_msgSend__setConfiguration_(self, v37, v36, v38, v39);
LABEL_37:
  v45 = v55;
  if (v55)
  {
    v46 = (unint64_t *)&v55->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  return v2;
}

- (void)fetchCardioSamplesFrom:(double)a3 to:(double)a4 queryToken:(id)a5 withHandler:(id)a6
{
  uint64_t v6;
  NSObject *v12;
  CMHistoricalCardioSamples *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double Current;
  double v25;
  int isDbOpenAndValid;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v73;
  const char *v74;
  char *v75;
  char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  _QWORD v87[7];
  uint64_t v88;
  const __CFString *v89;
  uint64_t v90;
  const __CFString *v91;
  uint64_t v92;
  const __CFString *v93;
  int v94;
  double v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  uint64_t v100;
  const __CFString *v101;
  uint8_t buf[4];
  double v103;
  __int16 v104;
  double v105;
  __int16 v106;
  double v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  if (!a6)
  {
    v73 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a5, 0, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v73, v74, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMHistoricalDataStore.mm"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v12 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v103 = a3;
    v104 = 2048;
    v105 = a4;
    _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEFAULT, "[HistoricalFetch] Fetching cardio samples from: %f to: %f", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v94 = 134218240;
    v95 = a3;
    v96 = 2048;
    v97 = a4;
    v75 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore fetchCardioSamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v75);
    if (v75 != (char *)buf)
      free(v75);
  }
  v13 = objc_alloc_init(CMHistoricalCardioSamples);
  v14 = (void *)MEMORY[0x194001B4C]();
  if ((objc_msgSend_queryConfigurationFromDaemon(self, v15, v16, v17, v18) & 1) == 0)
  {
    v100 = *MEMORY[0x1E0CB2D50];
    v101 = CFSTR("Failed to get datastore configuration");
    v52 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)&v101, (uint64_t)&v100, 1);
    v51 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v53, 103, v52, v54);
LABEL_27:
    (*((void (**)(id, CMHistoricalCardioSamples *, _QWORD, uint64_t, uint64_t))a6 + 2))(a6, v13, 0, 1, v51);
    goto LABEL_28;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v25 = Current;
  if (a4 <= a3 || Current < a3)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v55 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v103 = a3;
      v104 = 2048;
      v105 = a4;
      v106 = 2048;
      v107 = v25;
      _os_log_impl(&dword_18F1DC000, v55, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: invalid timestamps start:%f,end:%f,now:%f", buf, 0x20u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v94 = 134218496;
      v95 = a3;
      v96 = 2048;
      v97 = a4;
      v98 = 2048;
      v99 = v25;
      v76 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore fetchCardioSamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v76);
      if (v76 != (char *)buf)
        free(v76);
    }
    v92 = *MEMORY[0x1E0CB2D50];
    v93 = CFSTR("Invalid timestamps.");
    v57 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v56, (uint64_t)&v93, (uint64_t)&v92, 1);
LABEL_26:
    v51 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v58, 107, v57, v59);
    goto LABEL_27;
  }
  isDbOpenAndValid = objc_msgSend_isDbOpenAndValid(self, v20, v21, v22, v23);
  if (!isDbOpenAndValid)
  {
    objc_msgSend_initializeWithToken_type_start_end_(self, v27, (uint64_t)a5, 0, v30, a3, a4);
    if ((objc_msgSend_tokenSanityChecks(self, v60, v61, v62, v63) & 1) != 0)
    {
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = sub_18F332978;
      v87[3] = &unk_1E2955960;
      v87[5] = self;
      v87[6] = a6;
      v87[4] = v13;
      objc_msgSend_nextHistoricalFetchWithCount_withHandler_(self, v64, 0, (uint64_t)v87, v65);
      goto LABEL_28;
    }
    v88 = *MEMORY[0x1E0CB2D50];
    v89 = CFSTR("Invalid token.");
    v57 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v64, (uint64_t)&v89, (uint64_t)&v88, 1);
    goto LABEL_26;
  }
  v31 = isDbOpenAndValid;
  v32 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v27, v28, v29, v30);
  v37 = objc_msgSend_coldDBPath(self, v33, v34, v35, v36);
  if ((objc_msgSend_fileExistsAtPath_(v32, v38, v37, v39, v40) & 1) != 0)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v41 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(double *)&v46 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v42, v43, v44, v45));
      *(_DWORD *)buf = 138478083;
      v103 = *(double *)&v46;
      v104 = 1026;
      LODWORD(v105) = v31;
      _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Unable to open file at path %{private}@; return code %{public}d",
        buf,
        0x12u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v94 = 138478083;
      v95 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v77, v78, v79, v80));
      v96 = 1026;
      LODWORD(v97) = v31;
      v81 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore fetchCardioSamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v81);
      if (v81 != (char *)buf)
        free(v81);
    }
    v90 = *MEMORY[0x1E0CB2D50];
    v91 = CFSTR("Unable to access datastore. Is the device locked?");
    v48 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v47, (uint64_t)&v91, (uint64_t)&v90, 1);
    v51 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v49, 109, v48, v50);
    goto LABEL_27;
  }
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v66 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
  {
    *(double *)&v71 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v67, v68, v69, v70));
    *(_DWORD *)buf = 138478083;
    v103 = *(double *)&v71;
    v104 = 1026;
    LODWORD(v105) = v31;
    _os_log_impl(&dword_18F1DC000, v66, OS_LOG_TYPE_ERROR, "[HistoricalFetch] No file found at path %{private}@; return code %{public}d",
      buf,
      0x12u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v94 = 138478083;
    v95 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v82, v83, v84, v85));
    v96 = 1026;
    LODWORD(v97) = v31;
    v86 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore fetchCardioSamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v86);
    if (v86 != (char *)buf)
      free(v86);
  }
  (*((void (**)(id, CMHistoricalCardioSamples *, _QWORD, uint64_t, _QWORD))a6 + 2))(a6, v13, 0, 1, 0);
LABEL_28:
  objc_autoreleasePoolPop(v14);
}

- (void)fetchMobilitySamplesFrom:(double)a3 to:(double)a4 queryToken:(id)a5 withHandler:(id)a6
{
  uint64_t v6;
  NSObject *v12;
  CMHistoricalMobilitySamples *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double Current;
  double v25;
  int isDbOpenAndValid;
  const char *v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v56;
  const char *v57;
  char *v58;
  char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  _QWORD v65[7];
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  int v72;
  double v73;
  __int16 v74;
  double v75;
  __int16 v76;
  double v77;
  uint64_t v78;
  const __CFString *v79;
  uint8_t buf[4];
  double v81;
  __int16 v82;
  double v83;
  __int16 v84;
  double v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (!a6)
  {
    v56 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a5, 0, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v56, v57, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMHistoricalDataStore.mm"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v12 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v81 = a3;
    v82 = 2048;
    v83 = a4;
    _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEFAULT, "[HistoricalFetch] Fetching mobility samples from: %f to: %f", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v72 = 134218240;
    v73 = a3;
    v74 = 2048;
    v75 = a4;
    v58 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore fetchMobilitySamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v58);
    if (v58 != (char *)buf)
      free(v58);
  }
  v13 = objc_alloc_init(CMHistoricalMobilitySamples);
  v14 = (void *)MEMORY[0x194001B4C]();
  if ((objc_msgSend_queryConfigurationFromDaemon(self, v15, v16, v17, v18) & 1) != 0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v25 = Current;
    if (a4 <= a3 || Current < a3)
    {
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v44 = qword_1EE16D940;
      if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v81 = a3;
        v82 = 2048;
        v83 = a4;
        v84 = 2048;
        v85 = v25;
        _os_log_impl(&dword_18F1DC000, v44, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: invalid timestamps start:%f,end:%f,now:%f", buf, 0x20u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D938 != -1)
          dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
        v72 = 134218496;
        v73 = a3;
        v74 = 2048;
        v75 = a4;
        v76 = 2048;
        v77 = v25;
        v59 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore fetchMobilitySamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v59);
        if (v59 != (char *)buf)
          free(v59);
      }
      v70 = *MEMORY[0x1E0CB2D50];
      v71 = CFSTR("Invalid timestamps.");
      v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v45, (uint64_t)&v71, (uint64_t)&v70, 1);
    }
    else
    {
      isDbOpenAndValid = objc_msgSend_isDbOpenAndValid(self, v20, v21, v22, v23);
      if (isDbOpenAndValid)
      {
        v29 = isDbOpenAndValid;
        if (qword_1EE16D938 != -1)
          dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
        v30 = qword_1EE16D940;
        if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
        {
          *(double *)&v35 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v31, v32, v33, v34));
          *(_DWORD *)buf = 138478083;
          v81 = *(double *)&v35;
          v82 = 1026;
          LODWORD(v83) = v29;
          _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Unable to open file at path %{private}@; return code %{public}d",
            buf,
            0x12u);
        }
        if (sub_18F1FCA08(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D938 != -1)
            dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
          v72 = 138478083;
          v73 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v60, v61, v62, v63));
          v74 = 1026;
          LODWORD(v75) = v29;
          v64 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore fetchMobilitySamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v64);
          if (v64 != (char *)buf)
            free(v64);
        }
        v68 = *MEMORY[0x1E0CB2D50];
        v69 = CFSTR("Unable to access datastore. Is the device locked?");
        v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v36, (uint64_t)&v69, (uint64_t)&v68, 1);
        v40 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v38, 109, v37, v39);
        goto LABEL_26;
      }
      objc_msgSend_initializeWithToken_type_start_end_(self, v27, (uint64_t)a5, 1, v28, a3, a4);
      if ((objc_msgSend_tokenSanityChecks(self, v49, v50, v51, v52) & 1) != 0)
      {
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = sub_18F3336A0;
        v65[3] = &unk_1E2955960;
        v65[5] = self;
        v65[6] = a6;
        v65[4] = v13;
        objc_msgSend_nextHistoricalFetchWithCount_withHandler_(self, v53, 0, (uint64_t)v65, v54);
        goto LABEL_27;
      }
      v66 = *MEMORY[0x1E0CB2D50];
      v67 = CFSTR("Invalid token.");
      v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v53, (uint64_t)&v67, (uint64_t)&v66, 1);
    }
    v40 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v47, 107, v46, v48);
  }
  else
  {
    v78 = *MEMORY[0x1E0CB2D50];
    v79 = CFSTR("Failed to get datastore configuration");
    v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)&v79, (uint64_t)&v78, 1);
    v40 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v42, 103, v41, v43);
  }
LABEL_26:
  (*((void (**)(id, CMHistoricalMobilitySamples *, _QWORD, uint64_t, uint64_t))a6 + 2))(a6, v13, 0, 1, v40);
LABEL_27:
  objc_autoreleasePoolPop(v14);
}

- (void)nextHistoricalFetchWithCount:(unint64_t)a3 withHandler:(id)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t Type;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int isDbOpenAndValid;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *Object;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t FirstRecordIdForTable;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t LastRecordIdForTable;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t PageSize;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t RecordId;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(id, id, uint64_t, uint64_t, uint64_t);
  id v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  NSObject *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  sqlite3 *fDb;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  int v145;
  int v146;
  NSObject *v147;
  const char *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  id v152;
  const char *v153;
  int v154;
  int v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  NSObject *v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  int v166;
  NSObject *v167;
  const char *v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  char *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  char *v209;
  char *v210;
  char *v211;
  char *v212;
  char *v213;
  char *v214;
  uint64_t v215;
  sqlite3_stmt *ppStmt;
  _QWORD v217[5];
  _QWORD v218[5];
  uint64_t v219;
  const __CFString *v220;
  uint64_t v221;
  const __CFString *v222;
  uint64_t v223;
  const __CFString *v224;
  int v225;
  _BYTE v226[24];
  uint64_t v227;
  const __CFString *v228;
  uint64_t v229;
  const __CFString *v230;
  uint64_t v231;
  const __CFString *v232;
  uint8_t buf[4];
  _BYTE v234[24];
  uint64_t v235;

  v235 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v7 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEBUG))
  {
    Type = objc_msgSend_fetchType(self->fToken, v8, v9, v10, v11);
    v13 = "Mobility";
    if (!Type)
      v13 = "Cardio";
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v234 = v13;
    *(_WORD *)&v234[8] = 2048;
    *(_QWORD *)&v234[10] = a3;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEBUG, "[HistoricalFetch] Next %s fetch with count: %lu", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v202 = objc_msgSend_fetchType(self->fToken, v198, v199, v200, v201);
    v203 = "Mobility";
    if (!v202)
      v203 = "Cardio";
    v225 = 136315394;
    *(_QWORD *)v226 = v203;
    *(_WORD *)&v226[8] = 2048;
    *(_QWORD *)&v226[10] = a3;
    v204 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v204);
    if (v204 != (char *)buf)
      free(v204);
  }
  isDbOpenAndValid = objc_msgSend_isDbOpenAndValid(self, v14, v15, v16, v17);
  if (isDbOpenAndValid)
  {
    v23 = isDbOpenAndValid;
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v24 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend_coldDBPath(self, v25, v26, v27, v28);
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)v234 = v29;
      *(_WORD *)&v234[8] = 1026;
      *(_DWORD *)&v234[10] = v23;
      _os_log_impl(&dword_18F1DC000, v24, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Unable to open file at path %{private}@; return code %{public}d",
        buf,
        0x12u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v225 = 138478083;
      *(_QWORD *)v226 = objc_msgSend_coldDBPath(self, v205, v206, v207, v208);
      *(_WORD *)&v226[8] = 1026;
      *(_DWORD *)&v226[10] = v23;
      v209 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v209);
      if (v209 != (char *)buf)
        free(v209);
    }
    v231 = *MEMORY[0x1E0CB2D50];
    v232 = CFSTR("Unable to access datastore. Is the device locked?");
    v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)&v232, (uint64_t)&v231, 1);
    v34 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v32, 109, v31, v33);
LABEL_32:
    v123 = v34;
    v124 = (void (*)(id, id, uint64_t, uint64_t, uint64_t))*((_QWORD *)a4 + 2);
    v125 = a4;
    v126 = 0;
LABEL_33:
    v127 = 0;
    v128 = 1;
LABEL_34:
    v124(v125, v126, v127, v128, v123);
    return;
  }
  if (!self->fToken || !self->fDb)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v118 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v118, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: invalid DB or token", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      LOWORD(v225) = 0;
      v210 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v210);
      if (v210 != (char *)buf)
        free(v210);
    }
    v229 = *MEMORY[0x1E0CB2D50];
    v230 = CFSTR("Unexpected invalidation.");
    v120 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v119, (uint64_t)&v230, (uint64_t)&v229, 1);
    v34 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v121, 107, v120, v122);
    goto LABEL_32;
  }
  v35 = (void *)objc_msgSend_tableNames(self, v19, v20, v21, v22);
  if (objc_msgSend_count(v35, v36, v37, v38, v39) <= a3)
  {
    v124 = (void (*)(id, id, uint64_t, uint64_t, uint64_t))*((_QWORD *)a4 + 2);
    v125 = a4;
    v126 = 0;
    v127 = 0;
    v128 = 1;
    goto LABEL_36;
  }
  v44 = (void *)objc_msgSend_tables(self->fToken, v40, v41, v42, v43);
  if (!objc_msgSend_count(v44, v45, v46, v47, v48))
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v129 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v129, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: No tables in token", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      LOWORD(v225) = 0;
      v211 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v211);
      if (v211 != (char *)buf)
        free(v211);
    }
    v227 = *MEMORY[0x1E0CB2D50];
    v228 = CFSTR("Empty token.");
    v131 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v130, (uint64_t)&v228, (uint64_t)&v227, 1);
    v34 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v132, 112, v131, v133);
    goto LABEL_32;
  }
  v53 = (void *)objc_msgSend_tables(self->fToken, v49, v50, v51, v52);
  Object = (void *)objc_msgSend_firstObject(v53, v54, v55, v56, v57);
  v63 = (_BYTE *)objc_msgSend_tableNameFromToken(self, v59, v60, v61, v62);
  if (*v63)
  {
    v68 = (uint64_t)v63;
    if (!objc_msgSend_cachedLastRecordId(Object, v64, v65, v66, v67)
      || !objc_msgSend_recordId(Object, v69, v70, v71, v72))
    {
      FirstRecordIdForTable = objc_msgSend_getFirstRecordIdForTable_(self, v69, v68, v71, v72);
      objc_msgSend_setRecordId_(Object, v74, FirstRecordIdForTable, v75, v76);
    }
    LastRecordIdForTable = objc_msgSend_getLastRecordIdForTable_(self, v69, v68, v71, v72);
    objc_msgSend_setCachedLastRecordId_(Object, v78, LastRecordIdForTable, v79, v80);
    v85 = objc_msgSend_recordId(Object, v81, v82, v83, v84);
    if (v85 >= objc_msgSend_cachedLastRecordId(Object, v86, v87, v88, v89))
    {
      objc_msgSend_markCursorDone(self, v90, v91, v92, v93);
      v217[0] = MEMORY[0x1E0C809B0];
      v217[1] = 3221225472;
      v217[2] = sub_18F3349C4;
      v217[3] = &unk_1E2955988;
      v217[4] = a4;
      objc_msgSend_nextHistoricalFetchWithCount_withHandler_(self, v136, a3 + 1, (uint64_t)v217, v137);
    }
    else
    {
      v215 = v68;
      ppStmt = 0;
      PageSize = objc_msgSend_getPageSize(self, v90, v91, v92, v93);
      v95 = (void *)MEMORY[0x1E0CB3940];
      v100 = objc_msgSend_recordId(Object, v96, v97, v98, v99);
      v105 = objc_msgSend_recordId(Object, v101, v102, v103, v104) + PageSize;
      if (v105 >= objc_msgSend_cachedLastRecordId(Object, v106, v107, v108, v109))
        RecordId = objc_msgSend_cachedLastRecordId(Object, v110, v111, v112, v113);
      else
        RecordId = objc_msgSend_recordId(Object, v110, v111, v112, v113) + PageSize;
      v138 = (void *)objc_msgSend_stringWithFormat_(v95, v115, (uint64_t)CFSTR("SELECT * FROM %s WHERE id > %lu AND id <= %lu ORDER BY id ASC"), v116, v117, v215, v100, RecordId);
      fDb = self->fDb;
      v144 = (const char *)objc_msgSend_UTF8String(v138, v140, v141, v142, v143);
      v145 = sqlite3_prepare_v2(fDb, v144, -1, &ppStmt, 0);
      if (v145)
      {
        v146 = v145;
        if (qword_1EE16D938 != -1)
          dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
        v147 = qword_1EE16D940;
        if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109635;
          *(_DWORD *)v234 = v146;
          *(_WORD *)&v234[4] = 2113;
          *(_QWORD *)&v234[6] = v138;
          *(_WORD *)&v234[14] = 2082;
          *(_QWORD *)&v234[16] = v215;
          _os_log_impl(&dword_18F1DC000, v147, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error %d preparing SQLite statement: %{private}@, table: %{public}s", buf, 0x1Cu);
        }
        if (sub_18F1FCA08(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D938 != -1)
            dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
          v225 = 67109635;
          *(_DWORD *)v226 = v146;
          *(_WORD *)&v226[4] = 2113;
          *(_QWORD *)&v226[6] = v138;
          *(_WORD *)&v226[14] = 2082;
          *(_QWORD *)&v226[16] = v215;
          v212 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v212);
          if (v212 != (char *)buf)
            free(v212);
        }
        v223 = *MEMORY[0x1E0CB2D50];
        v224 = CFSTR("Unknown database error.");
        v149 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v148, (uint64_t)&v224, (uint64_t)&v223, 1);
        v34 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v150, 103, v149, v151);
        goto LABEL_32;
      }
      v152 = (id)objc_opt_new();
      v154 = objc_msgSend_populateArray_fromSql_query_(self, v153, (uint64_t)v152, (uint64_t)ppStmt, (uint64_t)v138);
      if (v154 == 101)
      {
        v155 = sqlite3_finalize(ppStmt);
        if (v155)
        {
          v160 = v155;
          if (qword_1EE16D938 != -1)
            dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
          v161 = qword_1EE16D940;
          if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67240450;
            *(_DWORD *)v234 = v160;
            *(_WORD *)&v234[4] = 2082;
            *(_QWORD *)&v234[6] = v215;
            _os_log_impl(&dword_18F1DC000, v161, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error finalizing SQLite statement: %{public}d, table: %{public}s", buf, 0x12u);
          }
          if (sub_18F1FCA08(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE16D938 != -1)
              dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
            v225 = 67240450;
            *(_DWORD *)v226 = v160;
            *(_WORD *)&v226[4] = 2082;
            *(_QWORD *)&v226[6] = v215;
            v214 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v214);
            if (v214 != (char *)buf)
              free(v214);
          }
          v219 = *MEMORY[0x1E0CB2D50];
          v220 = CFSTR("Unknown database error.");
          v163 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v162, (uint64_t)&v220, (uint64_t)&v219, 1);
          v123 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v164, 103, v163, v165);
          v124 = (void (*)(id, id, uint64_t, uint64_t, uint64_t))*((_QWORD *)a4 + 2);
          v125 = a4;
          v126 = v152;
          goto LABEL_33;
        }
        v177 = (void *)objc_msgSend_tables(self->fToken, v156, v157, v158, v159);
        objc_msgSend_setObject_atIndexedSubscript_(v177, v178, (uint64_t)Object, 0, v179);
        v184 = objc_msgSend_datatype(Object, v180, v181, v182, v183);
        v189 = objc_msgSend_recordId(Object, v185, v186, v187, v188);
        if (v189 >= objc_msgSend_cachedLastRecordId(Object, v190, v191, v192, v193))
          objc_msgSend_markCursorDone(self, v194, v195, v196, v197);
        v124 = (void (*)(id, id, uint64_t, uint64_t, uint64_t))*((_QWORD *)a4 + 2);
        v125 = a4;
        v126 = v152;
        v127 = v184;
        v128 = 0;
LABEL_36:
        v123 = 0;
        goto LABEL_34;
      }
      v166 = v154;
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v167 = qword_1EE16D940;
      if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v234 = v166;
        *(_WORD *)&v234[4] = 2082;
        *(_QWORD *)&v234[6] = v215;
        _os_log_impl(&dword_18F1DC000, v167, OS_LOG_TYPE_ERROR, "[HistoricalFetch] SQLite error: %{public}d, table: %{public}s", buf, 0x12u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D938 != -1)
          dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
        v225 = 67240450;
        *(_DWORD *)v226 = v166;
        *(_WORD *)&v226[4] = 2082;
        *(_QWORD *)&v226[6] = v215;
        v213 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v213);
        if (v213 != (char *)buf)
          free(v213);
      }
      v221 = *MEMORY[0x1E0CB2D50];
      v222 = CFSTR("Unknown database error.");
      v169 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v168, (uint64_t)&v222, (uint64_t)&v221, 1);
      v172 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v170, 103, v169, v171);
      objc_msgSend_removeAllObjects(v152, v173, v174, v175, v176);
      (*((void (**)(id, id, _QWORD, uint64_t, uint64_t))a4 + 2))(a4, v152, 0, 1, v172);
    }
  }
  else
  {
    objc_msgSend_markCursorDone(self, v64, v65, v66, v67);
    v218[0] = MEMORY[0x1E0C809B0];
    v218[1] = 3221225472;
    v218[2] = sub_18F3349B8;
    v218[3] = &unk_1E2955988;
    v218[4] = a4;
    objc_msgSend_nextHistoricalFetchWithCount_withHandler_(self, v134, a3 + 1, (uint64_t)v218, v135);
  }
}

- (int)populateArray:(id)a3 fromSql:(sqlite3_stmt *)a4 query:(id)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double Current;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t Type;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  char *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  int v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint8_t buf[4];
  int v111;
  __int16 v112;
  const char *v113;
  __int16 v114;
  const char *v115;
  __int16 v116;
  double v117;
  __int16 v118;
  int v119;
  __int16 v120;
  double v121;
  __int16 v122;
  double v123;
  __int16 v124;
  int v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  uint64_t v131;
  __int16 v132;
  id v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend_tables(self->fToken, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(v9, v10, 0, v11, v12);
  v18 = objc_msgSend_recordId(v13, v14, v15, v16, v17);
  Current = CFAbsoluteTimeGetCurrent();
  v24 = (void *)objc_msgSend_tables(self->fToken, v20, v21, v22, v23);
  v28 = (void *)objc_msgSend_objectAtIndexedSubscript_(v24, v25, 0, v26, v27);
  v33 = sqlite3_step(a4);
  if (v33 != 100)
    goto LABEL_11;
  do
  {
    v34 = sqlite3_column_int(a4, 0);
    Type = objc_msgSend_fetchType(self->fToken, v35, v36, v37, v38);
    if (Type == 1)
    {
      v51 = objc_msgSend_datatype(v28, v40, v41, v42, v43);
      v47 = objc_msgSend_parseMobilityTypeFromSql_dataype_(self, v52, (uint64_t)a4, v51, v53);
      goto LABEL_6;
    }
    if (!Type)
    {
      v44 = objc_msgSend_datatype(v28, v40, v41, v42, v43);
      v47 = objc_msgSend_parseCardioTypeFromSql_datatype_(self, v45, (uint64_t)a4, v44, v46);
LABEL_6:
      objc_msgSend_addObject_(a3, v48, v47, v49, v50);
      goto LABEL_8;
    }
    objc_msgSend_addObject_(a3, v40, 0, v42, v43);
LABEL_8:
    v54 = sqlite3_step(a4);
  }
  while (v54 == 100);
  v33 = v54;
  if (v34)
  {
    objc_msgSend_setRecordId_(v28, v29, v34, v31, v32);
    goto LABEL_12;
  }
LABEL_11:
  v55 = objc_msgSend_recordId(v28, v29, v30, v31, v32);
  objc_msgSend_setRecordId_(v28, v56, v55, v57, v58);
LABEL_12:
  if (v33 == 101)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v59 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v59, OS_LOG_TYPE_INFO, "[HistoricalFetch] Constructed results.", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 2))
      goto LABEL_27;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v60 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore populateArray:fromSql:query:]", "CoreLocation: %s\n", v60);
    if (v60 == (char *)buf)
      goto LABEL_27;
LABEL_38:
    free(v60);
    goto LABEL_27;
  }
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v61 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
  {
    v66 = objc_msgSend_datatype(v28, v62, v63, v64, v65);
    *(_DWORD *)buf = 67240450;
    v111 = v33;
    v112 = 2114;
    v113 = (const char *)objc_msgSend_tableNameForCurrentType_(self, v67, v66, v68, v69);
    _os_log_impl(&dword_18F1DC000, v61, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error constructing results. SQL return code: %{public}d, table:%{public}@", buf, 0x12u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v106 = objc_msgSend_datatype(v28, v102, v103, v104, v105);
    objc_msgSend_tableNameForCurrentType_(self, v107, v106, v108, v109);
    v60 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore populateArray:fromSql:query:]", "CoreLocation: %s\n", v60);
    if (v60 != (char *)buf)
      goto LABEL_38;
  }
LABEL_27:
  v70 = CFAbsoluteTimeGetCurrent();
  v75 = (void *)objc_msgSend_tables(self->fToken, v71, v72, v73, v74);
  v79 = (void *)objc_msgSend_objectAtIndexedSubscript_(v75, v76, 0, v77, v78);
  v84 = objc_msgSend_recordId(v79, v80, v81, v82, v83);
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v85 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_fetchType(self->fToken, v86, v87, v88, v89))
      v94 = "Mobility";
    else
      v94 = "Cardio";
    v95 = objc_msgSend_count(a3, v90, v91, v92, v93);
    v100 = objc_msgSend_tableNameFromToken(self, v96, v97, v98, v99);
    *(_DWORD *)buf = 68291586;
    v111 = 0;
    v112 = 2082;
    v113 = "";
    v114 = 2082;
    v115 = v94;
    v116 = 2050;
    v117 = v70 - Current;
    v118 = 1026;
    v119 = v95;
    v120 = 2050;
    v121 = Current;
    v122 = 2050;
    v123 = v70;
    v124 = 1026;
    v125 = v33;
    v126 = 2082;
    v127 = v100;
    v128 = 2050;
    v129 = v18;
    v130 = 2050;
    v131 = v84;
    v132 = 2114;
    v133 = a5;
    _os_log_impl(&dword_18F1DC000, v85, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"[HistoricalFetch] Query complete\", \"type\":%{public, location:escape_only}s, \"duration\":\"%{public}f\", \"numSamples\":%{public}u, \"start\":\"%{public}f\", \"end\":\"%{public}f\", \"returnCode\":%{public}d, \"table\":%{public, location:escape_only}s, \"recordId (pre-query)\":%{public}lu, \"recordId (post-query)\":%{public}lu, \"query\":%{public, location:escape_only}@}", buf, 0x6Eu);
  }
  return v33;
}

- (id)parseCardioTypeFromSql:(sqlite3_stmt *)a3 datatype:(unint64_t)a4
{
  uint64_t v4;
  CMPedestrianGrade *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id result;
  CMRecoveryHeartRate *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CMWorkoutPhysicalEffort *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CMRecoverySession *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CMVO2MaxInputs *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  CMCardioFitnessResults *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  CMCardioFitnessInputsSessionMetrics *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  CMCardioFitnessSummary *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _OWORD v43[2];
  __int128 v44;
  uint64_t v45;
  _OWORD v46[11];
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  _OWORD v60[5];
  _OWORD v61[9];
  _OWORD v62[7];
  _OWORD v63[10];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  switch(a4)
  {
    case 0uLL:
      objc_msgSend_inputFromPreparedStatement_(CMPedestrianGrade, a2, (uint64_t)a3, a4, v4);
      v5 = [CMPedestrianGrade alloc];
      v44 = v48;
      v45 = v49;
      v9 = (void *)objc_msgSend_initWithSample_(v5, v6, (uint64_t)&v44, v7, v8, v39, v40, v41, v42);
      goto LABEL_11;
    case 1uLL:
      objc_msgSend_inputFromPreparedStatement_(CMRecoveryHeartRate, a2, (uint64_t)a3, a4, v4);
      v11 = [CMRecoveryHeartRate alloc];
      v43[0] = v48;
      v43[1] = v49;
      v9 = (void *)objc_msgSend_initWithSample_(v11, v12, (uint64_t)v43, v13, v14, v39, v40, v41, v42);
      goto LABEL_11;
    case 2uLL:
      objc_msgSend_inputFromPreparedStatement_(CMWorkoutPhysicalEffort, a2, (uint64_t)a3, a4, v4);
      v15 = [CMWorkoutPhysicalEffort alloc];
      v9 = (void *)objc_msgSend_initWithSample_(v15, v16, (uint64_t)&v39, v17, v18, (_QWORD)v48, *((_QWORD *)&v48 + 1), (_QWORD)v49, *((_QWORD *)&v49 + 1), (_QWORD)v50, *((_QWORD *)&v50 + 1), (_QWORD)v51);
      goto LABEL_11;
    case 3uLL:
      objc_msgSend_inputFromPreparedStatement_(CMRecoverySession, a2, (uint64_t)a3, a4, v4);
      v19 = [CMRecoverySession alloc];
      v63[6] = v54;
      v63[7] = v55;
      v63[8] = v56;
      v63[9] = v57;
      v63[2] = v50;
      v63[3] = v51;
      v63[4] = v52;
      v63[5] = v53;
      v63[0] = v48;
      v63[1] = v49;
      v9 = (void *)objc_msgSend_initWithSample_(v19, v20, (uint64_t)v63, v21, v22, v39, v40, v41, v42);
      goto LABEL_11;
    case 4uLL:
      objc_msgSend_inputFromPreparedStatement_(CMVO2MaxInputs, a2, (uint64_t)a3, a4, v4);
      v23 = [CMVO2MaxInputs alloc];
      v62[4] = v52;
      v62[5] = v53;
      v62[6] = v54;
      v62[0] = v48;
      v62[1] = v49;
      v62[2] = v50;
      v62[3] = v51;
      v9 = (void *)objc_msgSend_initWithSample_(v23, v24, (uint64_t)v62, v25, v26, v39, v40, v41, v42);
      goto LABEL_11;
    case 5uLL:
      objc_msgSend_inputFromPreparedStatement_(CMCardioFitnessResults, a2, (uint64_t)a3, a4, v4);
      v27 = [CMCardioFitnessResults alloc];
      v61[6] = v54;
      v61[7] = v55;
      v61[8] = v56;
      v61[2] = v50;
      v61[3] = v51;
      v61[4] = v52;
      v61[5] = v53;
      v61[0] = v48;
      v61[1] = v49;
      v9 = (void *)objc_msgSend_initWithSample_(v27, v28, (uint64_t)v61, v29, v30, v39, v40, v41, v42);
      goto LABEL_11;
    case 6uLL:
      objc_msgSend_inputFromPreparedStatement_(CMCardioFitnessInputsSessionMetrics, a2, (uint64_t)a3, a4, v4);
      v31 = [CMCardioFitnessInputsSessionMetrics alloc];
      v60[2] = v50;
      v60[3] = v51;
      v60[4] = v52;
      v60[0] = v48;
      v60[1] = v49;
      v9 = (void *)objc_msgSend_initWithSample_(v31, v32, (uint64_t)v60, v33, v34, v39, v40, v41, v42);
      goto LABEL_11;
    case 7uLL:
      objc_msgSend_inputFromPreparedStatement_(CMCardioFitnessSummary, a2, (uint64_t)a3, a4, v4);
      v35 = [CMCardioFitnessSummary alloc];
      v46[8] = v56;
      v46[9] = v57;
      v46[10] = v58;
      v47 = v59;
      v46[4] = v52;
      v46[5] = v53;
      v46[6] = v54;
      v46[7] = v55;
      v46[0] = v48;
      v46[1] = v49;
      v46[2] = v50;
      v46[3] = v51;
      v9 = (void *)objc_msgSend_initWithSample_(v35, v36, (uint64_t)v46, v37, v38, v39, v40, v41, v42);
LABEL_11:
      result = v9;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)parseMobilityTypeFromSql:(sqlite3_stmt *)a3 dataype:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CMWalkingBoutMobilityMetrics *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id result;
  CMPredictedDistanceBout *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CMSmoothGaitMetrics *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  CMPredictedDistanceBoutMobilityCalibration *v27;
  const char *v28;
  uint64_t v29;
  CMStrideCalibrationEntry *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD v34[7];
  uint64_t v35;
  _OWORD v36[3];
  _OWORD v37[3];
  _OWORD v38[7];
  uint64_t v39;
  _OWORD v40[14];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v55 = v5;
  v56 = v6;
  v57 = v7;
  switch(a4)
  {
    case 0uLL:
      objc_msgSend_inputFromPreparedStatement_(CMWalkingBoutMobilityMetrics, a2, (uint64_t)a3, a4, v4);
      v9 = [CMWalkingBoutMobilityMetrics alloc];
      v40[10] = v51;
      v40[11] = v52;
      v40[12] = v53;
      v40[13] = v54;
      v40[6] = v47;
      v40[7] = v48;
      v40[8] = v49;
      v40[9] = v50;
      v40[2] = v43;
      v40[3] = v44;
      v40[4] = v45;
      v40[5] = v46;
      v40[0] = v41;
      v40[1] = v42;
      v13 = (void *)objc_msgSend_initWithSample_(v9, v10, (uint64_t)v40, v11, v12);
      goto LABEL_9;
    case 1uLL:
      objc_msgSend_inputFromPreparedStatement_(CMPredictedDistanceBout, a2, (uint64_t)a3, a4, v4);
      v15 = [CMPredictedDistanceBout alloc];
      v38[4] = v45;
      v38[5] = v46;
      v38[6] = v47;
      v39 = v48;
      v38[0] = v41;
      v38[1] = v42;
      v38[2] = v43;
      v38[3] = v44;
      v13 = (void *)objc_msgSend_initWithSample_(v15, v16, (uint64_t)v38, v17, v18);
      goto LABEL_9;
    case 2uLL:
      objc_msgSend_inputFromPreparedStatement_(CMSmoothGaitMetrics, a2, (uint64_t)a3, a4, v4);
      v19 = [CMSmoothGaitMetrics alloc];
      v37[0] = v41;
      v37[1] = v42;
      v37[2] = v43;
      v13 = (void *)objc_msgSend_initWithSample_(v19, v20, (uint64_t)v37, v21, v22);
      goto LABEL_9;
    case 3uLL:
      v23 = sqlite3_column_int(a3, 0);
      objc_msgSend_inputFromPreparedStatement_(CMPredictedDistanceBoutMobilityCalibration, v24, (uint64_t)a3, v25, v26);
      v27 = [CMPredictedDistanceBoutMobilityCalibration alloc];
      v36[0] = v41;
      v36[1] = v42;
      v36[2] = v43;
      v13 = (void *)objc_msgSend_initWithSample_recordId_(v27, v28, (uint64_t)v36, v23, v29);
      goto LABEL_9;
    case 4uLL:
      *(_QWORD *)&v48 = 0;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v41 = 0u;
      objc_msgSend_inputFromPreparedStatement_(CMStrideCalibrationEntry, a2, (uint64_t)a3, a4, v4);
      v30 = [CMStrideCalibrationEntry alloc];
      v34[4] = v45;
      v34[5] = v46;
      v34[6] = v47;
      v35 = v48;
      v34[0] = v41;
      v34[1] = v42;
      v34[2] = v43;
      v34[3] = v44;
      v13 = (void *)objc_msgSend_initWithCLStrideCalEntry_(v30, v31, (uint64_t)v34, v32, v33);
LABEL_9:
      result = v13;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int)isDbOpenAndValid
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  sqlite3 **p_fDb;
  int v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_fDb = &self->fDb;
  if (self->fDb)
    return 0;
  objc_msgSend_closeDBConnection(self, a2, v2, v3, v4);
  v12 = (void *)objc_msgSend_coldDBPath(self, v8, v9, v10, v11);
  v17 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15, v16);
  v6 = sqlite3_open_v2(v17, p_fDb, 131073, 0);
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v18 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v30 = objc_msgSend_coldDBPath(self, v19, v20, v21, v22);
    v31 = 1024;
    v32 = v6;
    _os_log_impl(&dword_18F1DC000, v18, OS_LOG_TYPE_DEFAULT, "[HistoricalFetch] Opened DB at %{private}@ with rc %d", buf, 0x12u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    objc_msgSend_coldDBPath(self, v24, v25, v26, v27);
    v28 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore isDbOpenAndValid]", "CoreLocation: %s\n", v28);
    if (v28 != (char *)buf)
      free(v28);
  }
  return v6;
}

- (BOOL)tokenSanityChecks
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL result;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  NSObject *v60;
  CMHistoricalFetchToken *fToken;
  int v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_version(self->fToken, a2, v2, v3, v4) != 2)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v27 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend_version(self->fToken, v28, v29, v30, v31);
      *(_DWORD *)buf = 134217984;
      v64 = v32;
      _os_log_impl(&dword_18F1DC000, v27, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: unexpected token version %lu", buf, 0xCu);
    }
    v33 = sub_18F1FCA08(115, 0);
    result = 0;
    if (!v33)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    objc_msgSend_version(self->fToken, v34, v35, v36, v37);
LABEL_21:
    v59 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore tokenSanityChecks]", "CoreLocation: %s\n", v59);
    if (v59 == (char *)buf)
      return 0;
LABEL_22:
    free(v59);
    return 0;
  }
  objc_msgSend_startTime(self->fToken, v6, v7, v8, v9);
  v11 = v10;
  objc_msgSend_endTime(self->fToken, v12, v13, v14, v15);
  if (v11 >= v20)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v38 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_startTime(self->fToken, v39, v40, v41, v42);
      v44 = v43;
      objc_msgSend_endTime(self->fToken, v45, v46, v47, v48);
      *(_DWORD *)buf = 134349312;
      v64 = v44;
      v65 = 2050;
      v66 = v49;
      _os_log_impl(&dword_18F1DC000, v38, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: invalid token timestamps, start:%{public}f end:%{public}f", buf, 0x16u);
    }
    v50 = sub_18F1FCA08(115, 0);
    result = 0;
    if (!v50)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    objc_msgSend_startTime(self->fToken, v51, v52, v53, v54);
    objc_msgSend_endTime(self->fToken, v55, v56, v57, v58);
    goto LABEL_21;
  }
  v21 = (void *)objc_msgSend_tables(self->fToken, v16, v17, v18, v19);
  if (objc_msgSend_count(v21, v22, v23, v24, v25))
    return 1;
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v60 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
  {
    fToken = self->fToken;
    *(_DWORD *)buf = 138412290;
    v64 = (uint64_t)fToken;
    _os_log_impl(&dword_18F1DC000, v60, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: no mobility tables found in token: %@", buf, 0xCu);
  }
  v62 = sub_18F1FCA08(115, 0);
  result = 0;
  if (v62)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v59 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore tokenSanityChecks]", "CoreLocation: %s\n", v59);
    if (v59 == (char *)buf)
      return 0;
    goto LABEL_22;
  }
  return result;
}

- (void)initializeWithToken:(id)a3 type:(unint64_t)a4 start:(double)a5 end:(double)a6
{
  uint64_t v6;
  CMHistoricalFetchToken *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CMHistoricalFetchToken *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  CMHistoricalFetchToken *fToken;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint8_t buf[4];
  double v80;
  __int16 v81;
  double v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v42 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v80 = *(double *)&a4;
      _os_log_impl(&dword_18F1DC000, v42, OS_LOG_TYPE_DEFAULT, "[HistoricalFetch] Generating new token for type=%lu", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v78 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore initializeWithToken:type:start:end:]", "CoreLocation: %s\n", v78);
      if (v78 != (char *)buf)
        free(v78);
    }
    if (a4)
    {
      if (a4 != 1)
      {
        fToken = self->fToken;
        goto LABEL_31;
      }
      v47 = (void *)objc_msgSend_mobilityToken(CMMobilityToken, v43, v44, v45, v46);
    }
    else
    {
      v47 = (void *)objc_msgSend_cardioToken(CMCardioToken, v43, v44, v45, v46);
    }
    fToken = v47;
    self->fToken = fToken;
LABEL_31:
    objc_msgSend_setStartTime_(fToken, v43, v44, v45, v46, a5);
    objc_msgSend_setEndTime_(self->fToken, v70, v71, v72, v73, a6);
    objc_msgSend_cacheAllRecordIds(self, v74, v75, v76, v77);
    return;
  }
  v11 = self->fToken;
  if (v11)
  {
    objc_msgSend_startTime(v11, a2, (uint64_t)a3, a4, v6);
    objc_msgSend_setStartTime_(a3, v12, v13, v14, v15);
    objc_msgSend_endTime(self->fToken, v16, v17, v18, v19);
    objc_msgSend_setEndTime_(a3, v20, v21, v22, v23);

    self->fToken = 0;
  }
  v24 = (CMHistoricalFetchToken *)a3;
  self->fToken = v24;
  v29 = fabs(a6);
  if (fabs(a5) == INFINITY && v29 == INFINITY)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v48 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_startTime(self->fToken, v49, v50, v51, v52);
      v54 = v53;
      objc_msgSend_endTime(self->fToken, v55, v56, v57, v58);
      *(_DWORD *)buf = 134218752;
      v80 = a5;
      v81 = 2048;
      v82 = a6;
      v83 = 2048;
      v84 = v54;
      v85 = 2048;
      v86 = v59;
      _os_log_impl(&dword_18F1DC000, v48, OS_LOG_TYPE_INFO, "[HistoricalFetch] #Warning: ignoring [%f,%f], persisting previous parameters (start=%f, end=%f)", buf, 0x2Au);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      objc_msgSend_startTime(self->fToken, v60, v61, v62, v63);
      objc_msgSend_endTime(self->fToken, v64, v65, v66, v67);
      v68 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore initializeWithToken:type:start:end:]", "CoreLocation: %s\n", v68);
      if (v68 != (char *)buf)
        free(v68);
    }
  }
  else
  {
    objc_msgSend_startTime(v24, v25, v26, v27, v28, v29);
    if (v35 > a5)
    {
      objc_msgSend_startTime(self->fToken, v31, v32, v33, v34);
      a5 = v36;
    }
    objc_msgSend_setStartTime_(self->fToken, v31, v32, v33, v34, a5);
    objc_msgSend_setEndTime_(self->fToken, v37, v38, v39, v40, a6);
  }
}

- (unint64_t)getFirstRecordIdForTable:(const char *)a3
{
  return ((uint64_t (*)(CMHistoricalDataStore *, char *, const char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_getRecordIdForTable_ascending_, a3, 1);
}

- (unint64_t)getLastRecordIdForTable:(const char *)a3
{
  return ((uint64_t (*)(CMHistoricalDataStore *, char *, const char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_getRecordIdForTable_ascending_, a3, 0);
}

- (unint64_t)getRecordIdForTable:(const char *)a3 ascending:(BOOL)a4
{
  _BOOL4 v4;
  double Current;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  sqlite3 *fDb;
  const char *v32;
  int v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  int v37;
  NSObject *v38;
  unint64_t v39;
  int v41;
  NSObject *v42;
  uint8_t *v43;
  NSObject *v44;
  int v45;
  int v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  char *v51;
  char *v52;
  char *v53;
  sqlite3_stmt *ppStmt;
  int v55;
  const char *v56;
  __int16 v57;
  _BYTE v58[18];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  _BYTE v62[18];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!self->fDb)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v36 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v36, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: DB invalid", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    LOWORD(v55) = 0;
    goto LABEL_71;
  }
  v4 = a4;
  ppStmt = 0;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_startTime(self->fToken, v8, v9, v10, v11);
  v16 = Current + -63072000.0;
  if (v17 > Current + -63072000.0)
  {
    objc_msgSend_startTime(self->fToken, v12, v13, v14, v15);
    v16 = v18;
  }
  objc_msgSend_endTime(self->fToken, v12, v13, v14, v15);
  if (v23 < Current)
  {
    objc_msgSend_endTime(self->fToken, v19, v20, v21, v22);
    Current = v24;
  }
  if (v4)
    v25 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("SELECT id FROM %s WHERE startTime >= %f AND startTime <= %f ORDER BY id %s LIMIT 1"), v21, v22, a3, *(_QWORD *)&v16, *(_QWORD *)&Current, "ASC");
  else
    v25 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("SELECT id FROM %s WHERE startTime >= %f AND startTime <= %f ORDER BY id %s LIMIT 1"), v21, v22, a3, *(_QWORD *)&v16, *(_QWORD *)&Current, "DESC");
  v30 = v25;
  fDb = self->fDb;
  v32 = (const char *)objc_msgSend_UTF8String(v25, v26, v27, v28, v29);
  v33 = sqlite3_prepare_v2(fDb, v32, -1, &ppStmt, 0);
  if (v33)
  {
    v34 = v33;
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v35 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      v60 = a3;
      v61 = 1024;
      *(_DWORD *)v62 = v34;
      *(_WORD *)&v62[4] = 2112;
      *(_QWORD *)&v62[6] = v30;
      _os_log_impl(&dword_18F1DC000, v35, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error on table %{private}s prepare statement (code=%d): %@", buf, 0x1Cu);
    }
    if (!sub_18F1FCA08(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 == -1)
      goto LABEL_70;
LABEL_82:
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
LABEL_70:
    v55 = 136381187;
    v56 = a3;
    v57 = 1024;
    *(_DWORD *)v58 = v34;
    *(_WORD *)&v58[4] = 2112;
    *(_QWORD *)&v58[6] = v30;
LABEL_71:
    v52 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore getRecordIdForTable:ascending:]", "CoreLocation: %s\n", v52);
    if (v52 != (char *)buf)
      free(v52);
    return 0;
  }
  v37 = sqlite3_step(ppStmt);
  if ((v37 - 102) <= 0xFFFFFFFD)
  {
    v34 = v37;
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v38 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      v60 = a3;
      v61 = 1024;
      *(_DWORD *)v62 = v34;
      *(_WORD *)&v62[4] = 2112;
      *(_QWORD *)&v62[6] = v30;
      _os_log_impl(&dword_18F1DC000, v38, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error on table %{private}s step statement (code=%d): %@", buf, 0x1Cu);
    }
    if (!sub_18F1FCA08(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 == -1)
      goto LABEL_70;
    goto LABEL_82;
  }
  v41 = sqlite3_column_int(ppStmt, 0);
  if (v41 < 1)
  {
    if (v41)
    {
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v42 = qword_1EE16D940;
      if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v60 = a3;
        _os_log_impl(&dword_18F1DC000, v42, OS_LOG_TYPE_ERROR, "[HistoricalFetch] %s: Invalid rowId", buf, 0xCu);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_49;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v55 = 136315138;
      v56 = a3;
      v43 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore getRecordIdForTable:ascending:]", "CoreLocation: %s\n");
    }
    else
    {
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v44 = qword_1EE16D940;
      if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v60 = a3;
        _os_log_impl(&dword_18F1DC000, v44, OS_LOG_TYPE_DEBUG, "[HistoricalFetch] %s: No records found", buf, 0xCu);
      }
      if (!sub_18F1FCA08(115, 2))
        goto LABEL_49;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v55 = 136315138;
      v56 = a3;
      v43 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore getRecordIdForTable:ascending:]", "CoreLocation: %s\n");
    }
    if (v43 != buf)
      free(v43);
LABEL_49:
    v39 = 0;
    goto LABEL_50;
  }
  v39 = (v41 - v4);
LABEL_50:
  v45 = sqlite3_finalize(ppStmt);
  if (v45)
  {
    v46 = v45;
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v47 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v60 = a3;
      v61 = 1024;
      *(_DWORD *)v62 = v46;
      _os_log_impl(&dword_18F1DC000, v47, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error on table %{private}s finalize (code=%d)", buf, 0x12u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v55 = 136380931;
      v56 = a3;
      v57 = 1024;
      *(_DWORD *)v58 = v46;
      v53 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore getRecordIdForTable:ascending:]", "CoreLocation: %s\n", v53);
      if (v53 != (char *)buf)
        free(v53);
    }
  }
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v48 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEBUG))
  {
    v49 = "last";
    *(_DWORD *)buf = 136315651;
    if (v4)
      v49 = "first";
    v60 = v49;
    v61 = 2048;
    *(_QWORD *)v62 = v39;
    *(_WORD *)&v62[8] = 2081;
    *(_QWORD *)&v62[10] = a3;
    _os_log_impl(&dword_18F1DC000, v48, OS_LOG_TYPE_DEBUG, "[HistoricalFetch] Caching %s record id %lu for table %{private}s", buf, 0x20u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v50 = "last";
    v55 = 136315651;
    if (v4)
      v50 = "first";
    v56 = v50;
    v57 = 2048;
    *(_QWORD *)v58 = v39;
    *(_WORD *)&v58[8] = 2081;
    *(_QWORD *)&v58[10] = a3;
    v51 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore getRecordIdForTable:ascending:]", "CoreLocation: %s\n", v51);
    if (v51 != (char *)buf)
      free(v51);
  }
  return v39;
}

- (unint64_t)getPageSize
{
  return 50;
}

- (void)markCursorDone
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t Object;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_tables(self->fToken, a2, v2, v3, v4);
  Object = objc_msgSend_firstObject(v6, v7, v8, v9, v10);
  objc_msgSend_addObject_(v6, v12, Object, v13, v14);
  objc_msgSend_removeObjectAtIndex_(v6, v15, 0, v16, v17);
  v22 = objc_msgSend_tableNameFromToken(self, v18, v19, v20, v21);
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v23 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136380675;
    v26 = v22;
    _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_DEFAULT, "[HistoricalFetch] Bumped token, next table:%{private}s", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore markCursorDone]", "CoreLocation: %s\n", v24);
    if (v24 != (char *)buf)
      free(v24);
  }
}

- (void)cacheAllRecordIds
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t LastRecordIdForTable;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  char *v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  objc_msgSend_startTime(self->fToken, a2, v2, v3, v4);
  v7 = v6;
  objc_msgSend_endTime(self->fToken, v8, v9, v10, v11);
  v13 = v12;
  v18 = (void *)objc_msgSend_tables(self->fToken, v14, v15, v16, v17);
  if (objc_msgSend_count(v18, v19, v20, v21, v22))
  {
    v27 = 0;
    do
    {
      v28 = (void *)objc_msgSend_tables(self->fToken, v23, v24, v25, v26);
      v32 = (void *)objc_msgSend_objectAtIndexedSubscript_(v28, v29, v27, v30, v31);
      v37 = objc_msgSend_datatype(v32, v33, v34, v35, v36);
      v41 = objc_msgSend_tableNameForCurrentType_(self, v38, v37, v39, v40);
      objc_msgSend_setTableName_(v32, v42, v41, v43, v44);
      v49 = (void *)objc_msgSend_tableName(v32, v45, v46, v47, v48);
      v54 = objc_msgSend_UTF8String(v49, v50, v51, v52, v53);
      LastRecordIdForTable = objc_msgSend_getLastRecordIdForTable_(self, v55, v54, v56, v57);
      objc_msgSend_setCachedLastRecordId_(v32, v59, LastRecordIdForTable, v60, v61);
      ++v27;
      v66 = (void *)objc_msgSend_tables(self->fToken, v62, v63, v64, v65);
    }
    while (objc_msgSend_count(v66, v67, v68, v69, v70) > v27);
  }
  if (qword_1EE16D938 != -1)
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
  v71 = qword_1EE16D940;
  if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v74 = v7;
    v75 = 2048;
    v76 = v13;
    _os_log_impl(&dword_18F1DC000, v71, OS_LOG_TYPE_INFO, "[HistoricalFetch] Cached all record ids from %f to %f", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v72 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore cacheAllRecordIds]", "CoreLocation: %s\n", v72);
    if (v72 != (char *)buf)
      free(v72);
  }
}

- (const)tableNameFromToken
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Type;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  Type = objc_msgSend_fetchType(self->fToken, a2, v2, v3, v4);
  v11 = (void *)objc_msgSend_tables(self->fToken, v7, v8, v9, v10);
  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(v11, v12, 0, v13, v14);
  v21 = objc_msgSend_datatype(v15, v16, v17, v18, v19);
  if (Type)
    v24 = (void *)objc_msgSend_tableNameForMobilityType_(self, v20, v21, v22, v23);
  else
    v24 = (void *)objc_msgSend_tableNameForCardioType_(self, v20, v21, v22, v23);
  return (const char *)objc_msgSend_UTF8String(v24, v25, v26, v27, v28);
}

- (void)resetToken
{
  CMHistoricalFetchToken *fToken;

  fToken = self->fToken;
  if (fToken)

  self->fToken = 0;
}

- (void)closeDBConnection
{
  sqlite3 *fDb;
  int v4;
  int v5;
  NSObject *v6;
  char *v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  fDb = self->fDb;
  if (fDb)
  {
    v4 = sqlite3_close_v2(fDb);
    if (v4)
    {
      v5 = v4;
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v6 = qword_1EE16D940;
      if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v9 = v5;
        _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error closing DB connection, return code: %d", buf, 8u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D938 != -1)
          dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
        v7 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore closeDBConnection]", "CoreLocation: %s\n", v7);
        if (v7 != (char *)buf)
          free(v7);
      }
    }
  }
  self->fDb = 0;
}

- (id)tableNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = (id)objc_msgSend_fetchType(self->fToken, a2, v2, v3, v4);
  if (result == (id)1)
    return (id)objc_msgSend_mobilityTableNames(self, v7, v8, v9, v10);
  if (!result)
    return (id)objc_msgSend_cardioTableNames(self, v7, v8, v9, v10);
  return result;
}

- (id)cardioTableNames
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->fConfiguration, a2, (uint64_t)CFSTR("CMColdStorageCardioTableNames"), v2, v3);
}

- (id)mobilityTableNames
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->fConfiguration, a2, (uint64_t)CFSTR("CMColdStorageMobilityTableNames"), v2, v3);
}

- (id)coldDBPath
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->fConfiguration, a2, (uint64_t)CFSTR("CMColdStorageDatabasePath"), v2, v3);
}

- (id)tableNameForMobilityType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = (void *)objc_msgSend_mobilityTableNames(self, a2, a3, v3, v4);
  return (id)objc_msgSend_objectAtIndexedSubscript_(v6, v7, v5, v8, v9);
}

- (id)tableNameForCardioType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = (void *)objc_msgSend_cardioTableNames(self, a2, a3, v3, v4);
  return (id)objc_msgSend_objectAtIndexedSubscript_(v6, v7, v5, v8, v9);
}

- (id)tableNameForCurrentType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = (void *)objc_msgSend_tableNames(self, a2, a3, v3, v4);
  return (id)objc_msgSend_objectAtIndexedSubscript_(v6, v7, v5, v8, v9);
}

- (BOOL)_setConfiguration:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  BOOL result;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  int v50;
  NSObject *v51;
  int v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  NSDictionary *fConfiguration;
  char *v60;
  char *v61;
  char *v62;
  uint8_t buf[4];
  _BYTE v64[10];
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v49 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v49, OS_LOG_TYPE_ERROR, "Failed to get reply dictionary", buf, 2u);
    }
    v50 = sub_18F1FCA08(115, 0);
    result = 0;
    if (!v50)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 == -1)
    {
LABEL_45:
      v60 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalDataStore _setConfiguration:]", "CoreLocation: %s\n", v60);
      if (v60 != (char *)buf)
        free(v60);
      return 0;
    }
LABEL_56:
    dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    goto LABEL_45;
  }
  v8 = objc_msgSend_objectForKeyedSubscript_(a3, v5, (uint64_t)CFSTR("CMColdStorageDatabasePath"), v6, v7);
  v12 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v9, (uint64_t)CFSTR("CMColdStorageMobilityTableNames"), v10, v11);
  v16 = objc_msgSend_objectForKeyedSubscript_(a3, v13, (uint64_t)CFSTR("CMColdStorageCardioTableNames"), v14, v15);
  if (!v8
    || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !v12
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !v17
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v51 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v64 = a3;
      _os_log_impl(&dword_18F1DC000, v51, OS_LOG_TYPE_FAULT, "Malformed datastore configuration: %@. Ignoring and trying again.", buf, 0xCu);
    }
    v52 = sub_18F1FCA08(115, 0);
    result = 0;
    if (!v52)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D938 == -1)
      goto LABEL_45;
    goto LABEL_56;
  }
  if ((unint64_t)objc_msgSend_count(v17, v18, v19, v20, v21) >= 8
    && (unint64_t)objc_msgSend_count(v12, v22, v23, v24, v25) > 4)
  {
    if ((unint64_t)objc_msgSend_count(v17, v26, v27, v28, v29) > 8
      || (unint64_t)objc_msgSend_count(v12, v53, v54, v55, v56) >= 6)
    {
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v57 = qword_1EE16D940;
      if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v57, OS_LOG_TYPE_DEFAULT, "#Warning: More tables available in configuration than are being collected.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D938 != -1)
          dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
        v62 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore _setConfiguration:]", "CoreLocation: %s\n", v62);
        if (v62 != (char *)buf)
          free(v62);
      }
    }
    self->fConfiguration = (NSDictionary *)a3;
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v58 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_DEFAULT))
    {
      fConfiguration = self->fConfiguration;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v64 = fConfiguration;
      _os_log_impl(&dword_18F1DC000, v58, OS_LOG_TYPE_DEFAULT, "Received datastore configuration: %@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      v61 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMHistoricalDataStore _setConfiguration:]", "CoreLocation: %s\n", v61);
      if (v61 != (char *)buf)
        free(v61);
    }
    return 1;
  }
  else
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
    v30 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67240960;
      *(_DWORD *)v64 = objc_msgSend_count(v17, v31, v32, v33, v34);
      *(_WORD *)&v64[4] = 1026;
      *(_DWORD *)&v64[6] = 8;
      v65 = 1026;
      v66 = objc_msgSend_count(v12, v35, v36, v37, v38);
      v67 = 1026;
      v68 = 5;
      _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_FAULT, "Invalid datastore configuration: Less than the expected number of tables. Cardio:%{public}d/%{public}d, Mobility=%{public}d/%{public}d", buf, 0x1Au);
    }
    v39 = sub_18F1FCA08(115, 0);
    result = 0;
    if (v39)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29559A8);
      objc_msgSend_count(v17, v41, v42, v43, v44);
      objc_msgSend_count(v12, v45, v46, v47, v48);
      goto LABEL_45;
    }
  }
  return result;
}

- (void)_cacheTableNamesForToken:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t Type;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v7 = (void *)objc_msgSend_tables(a3, a2, (uint64_t)a3, v3, v4);
  if (objc_msgSend_count(v7, v8, v9, v10, v11))
  {
    v16 = 0;
    while (1)
    {
      v17 = (void *)objc_msgSend_tables(a3, v12, v13, v14, v15);
      v21 = (void *)objc_msgSend_objectAtIndexedSubscript_(v17, v18, v16, v19, v20);
      Type = objc_msgSend_fetchType(a3, v22, v23, v24, v25);
      if (Type == 1)
        break;
      if (!Type)
      {
        v31 = objc_msgSend_datatype(v21, v27, v28, v29, v30);
        v35 = objc_msgSend_tableNameForCardioType_(self, v32, v31, v33, v34);
LABEL_7:
        objc_msgSend_setTableName_(v21, v36, v35, v37, v38);
      }
      ++v16;
      v43 = (void *)objc_msgSend_tables(a3, v27, v28, v29, v30);
      if (objc_msgSend_count(v43, v44, v45, v46, v47) <= v16)
        return;
    }
    v39 = objc_msgSend_datatype(v21, v27, v28, v29, v30);
    v35 = objc_msgSend_tableNameForMobilityType_(self, v40, v39, v41, v42);
    goto LABEL_7;
  }
}

- (void).cxx_destruct
{
  sub_18F331ACC((uint64_t *)&self->fLocationdConnection, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
