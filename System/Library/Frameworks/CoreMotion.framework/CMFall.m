@implementation CMFall

+ (BOOL)areStatsAvailable
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return objc_msgSend_featureAvailability_(CMMotionUtils, v2, (uint64_t)"kCLConnectionMessageFallStatsAvailable", v3, v4);
}

- (BOOL)setStatsEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  NSObject *v36;
  char v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  char *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  void *__p[2];
  char v48;
  const __CFString *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v49 = CFSTR("CMFallSetStatsEnabled");
  v50[0] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v50, (uint64_t)&v49, 1);
  v7 = operator new();
  sub_18F270374(__p, "kCLConnectionMessageFallStatsSetEnabled");
  MEMORY[0x19400103C](v7, __p, v6);
  sub_18F391794(&v45, v7);
  if (v48 < 0)
    operator delete(__p[0]);
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v15 = objc_msgSend_setWithObjects_(v8, v11, v9, v12, v13, v10, 0);
  v43 = v45;
  v44 = v46;
  if (v46)
  {
    p_shared_owners = (unint64_t *)&v46->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  v22 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v14, (uint64_t)&v43, v15, v16);
  v23 = v44;
  if (v44)
  {
    v24 = (unint64_t *)&v44->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = objc_msgSend_objectForKeyedSubscript_(v22, v19, (uint64_t)CFSTR("CMErrorMessage"), v20, v21);
  v30 = (void *)objc_msgSend_objectForKeyedSubscript_(v22, v27, (uint64_t)CFSTR("CMReturnCode"), v28, v29);
  if (v26)
    v35 = 1;
  else
    v35 = v30 == 0;
  if (v35)
  {
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2954E28);
    v36 = qword_1EE16D830;
    if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v36, OS_LOG_TYPE_ERROR, "#Notice Response invalid.", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D828 != -1)
        dispatch_once(&qword_1EE16D828, &unk_1E2954E28);
      v42 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMFall setStatsEnabled:]", "CoreLocation: %s\n", v42);
      if (v42 != (char *)__p)
        free(v42);
    }
    v37 = 0;
  }
  else
  {
    v37 = objc_msgSend_BOOLValue(v30, v31, v32, v33, v34);
  }
  v38 = v46;
  if (v46)
  {
    v39 = (unint64_t *)&v46->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  return v37;
}

- (unint64_t)setDataCollectionConfiguration:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  char *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  void *__p[2];
  char v46;
  const __CFString *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v47 = CFSTR("CMFallDataCollectionConfigurationKey");
  v48[0] = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v48, (uint64_t)&v47, 1);
  v7 = operator new();
  sub_18F270374(__p, "kCLConnectionMessageFallStatsSetEnabled");
  MEMORY[0x19400103C](v7, __p, v6);
  sub_18F391794(&v43, v7);
  if (v46 < 0)
    operator delete(__p[0]);
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v15 = objc_msgSend_setWithObjects_(v8, v11, v9, v12, v13, v10, 0);
  v41 = v43;
  v42 = v44;
  if (v44)
  {
    p_shared_owners = (unint64_t *)&v44->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  v22 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v14, (uint64_t)&v41, v15, v16);
  v23 = v42;
  if (v42)
  {
    v24 = (unint64_t *)&v42->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (objc_msgSend_objectForKeyedSubscript_(v22, v19, (uint64_t)CFSTR("CMErrorMessage"), v20, v21))
  {
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2954E28);
    v29 = qword_1EE16D830;
    if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v29, OS_LOG_TYPE_ERROR, "#Notice Response invalid.", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D828 != -1)
        dispatch_once(&qword_1EE16D828, &unk_1E2954E28);
      v40 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMFall setDataCollectionConfiguration:]", "CoreLocation: %s\n", v40);
      if (v40 != (char *)__p)
        free(v40);
    }
  }
  v30 = (void *)objc_msgSend_objectForKeyedSubscript_(v22, v26, (uint64_t)CFSTR("CMFallDataCollectionConfigurationKey"), v27, v28);
  v35 = objc_msgSend_unsignedIntegerValue(v30, v31, v32, v33, v34);
  v36 = v44;
  if (v44)
  {
    v37 = (unint64_t *)&v44->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  return v35;
}

- (id)fallConfig
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v22;
  std::__shared_weak_count *v23;
  void *__p[2];
  char v25;
  uint64_t v26;
  std::__shared_weak_count *v27;

  v2 = operator new();
  sub_18F270374(__p, "kCLConnectionMessageFallStatsGetConfig");
  MEMORY[0x194001030](v2, __p);
  sub_18F391794(&v26, v2);
  if (v25 < 0)
    operator delete(__p[0]);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v3, v6, v4, v7, v8, v5, 0);
  v22 = v26;
  v23 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v14 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v9, (uint64_t)&v22, v10, v11);
  v15 = v23;
  if (v23)
  {
    v16 = (unint64_t *)&v23->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = v27;
  if (v27)
  {
    v19 = (unint64_t *)&v27->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  return v14;
}

- (id)sendStatsDataToUrl:(id)a3
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLConnectionMessage *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  CLConnectionMessage *v59;
  std::__shared_weak_count *v60;
  CLConnectionMessage *v61;
  std::__shared_weak_count *v62;
  const __CFString *v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  v4 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v5, (uint64_t)v4, v6, v7);
  v11 = objc_msgSend_fileHandleForWritingToURL_(CMMotionUtils, v8, (uint64_t)a3, v9, v10);
  if (v11)
  {
    v13 = (void *)v11;
    sub_18F3516EC("kCLConnectionMessageFallStatsSendStats", &v61);
    v14 = v61;
    objc_msgSend_fileDescriptor(v13, v15, v16, v17, v18);
    CLConnectionMessage::setFileDescriptor(v14);
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v26 = objc_msgSend_setWithObjects_(v19, v22, v20, v23, v24, v21, 0);
    v59 = v61;
    v60 = v62;
    if (v62)
    {
      p_shared_owners = (unint64_t *)&v62->__shared_owners_;
      do
        v29 = __ldxr(p_shared_owners);
      while (__stxr(v29 + 1, p_shared_owners));
    }
    v33 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v25, (uint64_t)&v59, v26, v27);
    v34 = v60;
    if (v60)
    {
      v35 = (unint64_t *)&v60->__shared_owners_;
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
    v37 = objc_msgSend_objectForKeyedSubscript_(v33, v30, (uint64_t)CFSTR("CMErrorMessage"), v31, v32);
    v41 = (void *)objc_msgSend_objectForKeyedSubscript_(v33, v38, (uint64_t)CFSTR("CMReturnCode"), v39, v40);
    v46 = objc_msgSend_BOOLValue(v41, v42, v43, v44, v45);
    if (v37)
      v51 = 0;
    else
      v51 = v46;
    if ((v51 & 1) == 0)
    {
      v52 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v47, v48, v49, v50);
      objc_msgSend_removeItemAtURL_error_(v52, v53, (uint64_t)a3, 0, v54);
    }
    v55 = v62;
    if (v62)
    {
      v56 = (unint64_t *)&v62->__shared_owners_;
      do
        v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }
  }
  else
  {
    v63 = CFSTR("CMReturnCode");
    v64[0] = MEMORY[0x1E0C9AAA0];
    return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v64, (uint64_t)&v63, 1);
  }
  return v33;
}

- (void)sendStatsDataToUrl:(id)a3 onCompletion:(id)a4
{
  NSString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  CLConnectionMessage *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD v38[6];
  CLConnectionMessage *v39;
  std::__shared_weak_count *v40;
  CLConnectionMessage *v41;
  std::__shared_weak_count *v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v7, (uint64_t)v6, v8, v9);
  v13 = objc_msgSend_fileHandleForWritingToURL_(CMMotionUtils, v10, (uint64_t)a3, v11, v12);
  if (v13)
  {
    v15 = (void *)v13;
    sub_18F3516EC("kCLConnectionMessageFallStatsSendStats", &v41);
    v16 = v41;
    objc_msgSend_fileDescriptor(v15, v17, v18, v19, v20);
    CLConnectionMessage::setFileDescriptor(v16);
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v28 = objc_msgSend_setWithObjects_(v21, v24, v22, v25, v26, v23, 0);
    v39 = v41;
    v40 = v42;
    if (v42)
    {
      p_shared_owners = (unint64_t *)&v42->__shared_owners_;
      do
        v30 = __ldxr(p_shared_owners);
      while (__stxr(v30 + 1, p_shared_owners));
    }
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = sub_18F4821B0;
    v38[3] = &unk_1E29568D0;
    v38[4] = a3;
    v38[5] = a4;
    objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v27, (uint64_t)&v39, v28, (uint64_t)v38);
    v31 = v40;
    if (v40)
    {
      v32 = (unint64_t *)&v40->__shared_owners_;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    v34 = v42;
    if (v42)
    {
      v35 = (unint64_t *)&v42->__shared_owners_;
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
  }
  else
  {
    v43 = CFSTR("CMReturnCode");
    v44[0] = MEMORY[0x1E0C9AAA0];
    v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v44, (uint64_t)&v43, 1);
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v37);
  }
}

- (void)simulateEvent:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  _QWORD *v24;
  std::__shared_weak_count *v25;
  _QWORD *v26;
  std::__shared_weak_count *v27;
  void *__p[2];
  char v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v30 = CFSTR("CMAnomalyEventType");
  v31[0] = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v31, (uint64_t)&v30, 1);
  v7 = (std::__shared_weak_count *)operator new(0x70uLL);
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageAnomalyDetectionSimulateEvent");
  MEMORY[0x19400103C](&v7[1], __p, v6);
  if (v29 < 0)
    operator delete(__p[0]);
  v26 = &v7[1].__vftable;
  v27 = v7;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v16 = objc_msgSend_setWithObjects_(v9, v12, v10, v13, v14, v11, 0);
  v24 = &v7[1].__vftable;
  v25 = v7;
  do
    v17 = __ldxr(p_shared_owners);
  while (__stxr(v17 + 1, p_shared_owners));
  objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v15, (uint64_t)&v24, v16, (uint64_t)&unk_1E2953EA8);
  v18 = v25;
  if (v25)
  {
    v19 = (unint64_t *)&v25->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v27;
  if (v27)
  {
    v22 = (unint64_t *)&v27->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
}

- (void)setHgalCaptureMode:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v27 = CFSTR("CMHgalCaptureMode");
  v28[0] = objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v28, (uint64_t)&v27, 1);
  sub_18F44DCB8("kCLConnectionMessageSetHgalCaptureMode", &v24, &v25);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v13 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v8, 0);
  v22 = v25;
  v23 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v12, (uint64_t)&v22, v13, (uint64_t)&unk_1E29547E8);
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v26;
  if (v26)
  {
    v20 = (unint64_t *)&v26->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

@end
