@implementation CMSafetyAnomaly

+ (BOOL)areStatsAvailable
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return objc_msgSend_featureAvailability_(CMMotionUtils, v2, (uint64_t)"kCLConnectionMessageKappaStatsAvailable", v3, v4);
}

- (void)sendAPCmd:(int)a3 arg:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  __int16 v37;
  int v38;
  uint8_t buf[8];
  std::__shared_weak_count *v40;
  uint64_t v41;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v41 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D838 != -1)
    dispatch_once(&qword_1EE16D838, &unk_1E2954448);
  v6 = qword_1EE16D840;
  if (os_log_type_enabled((os_log_t)qword_1EE16D840, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v5;
    LOWORD(v40) = 1024;
    *(_DWORD *)((char *)&v40 + 2) = v4;
    _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_INFO, "kappa ap command=%d arg=%d", buf, 0xEu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D838 != -1)
      dispatch_once(&qword_1EE16D838, &unk_1E2954448);
    LODWORD(v36) = 67109376;
    HIDWORD(v36) = v5;
    v37 = 1024;
    v38 = v4;
    v31 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSafetyAnomaly sendAPCmd:arg:]", "CoreLocation: %s\n", v31);
    if (v31 != (char *)buf)
      free(v31);
  }
  v34[0] = CFSTR("CMKappaCmdKey");
  v35[0] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v7, v5, v8, v9);
  v34[1] = CFSTR("CMKappaArgKey");
  v35[1] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v10, v4, v11, v12);
  v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v35, (uint64_t)v34, 2);
  sub_18F3667C8("kCLConnectionMessageKappaSendAPCommand", &v36, buf);
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v21 = objc_msgSend_setWithObjects_(v14, v17, v15, v18, v19, v16, 0);
  v32 = *(_QWORD *)buf;
  v33 = v40;
  if (v40)
  {
    p_shared_owners = (unint64_t *)&v40->__shared_owners_;
    do
      v24 = __ldxr(p_shared_owners);
    while (__stxr(v24 + 1, p_shared_owners));
  }
  objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v20, (uint64_t)&v32, v21, v22);
  v25 = v33;
  if (v33)
  {
    v26 = (unint64_t *)&v33->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v28 = v40;
  if (v40)
  {
    v29 = (unint64_t *)&v40->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
}

- (int)getState
{
  NSObject *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
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
  int v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  char *v42;
  char *v43;
  _QWORD *v44;
  std::__shared_weak_count *v45;
  _QWORD *v46;
  std::__shared_weak_count *v47;
  uint8_t buf[8];
  char v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D838 != -1)
    dispatch_once(&qword_1EE16D838, &unk_1E2954448);
  v2 = qword_1EE16D840;
  if (os_log_type_enabled((os_log_t)qword_1EE16D840, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v2, OS_LOG_TYPE_DEBUG, "get state updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D838 != -1)
      dispatch_once(&qword_1EE16D838, &unk_1E2954448);
    LOWORD(v46) = 0;
    v42 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSafetyAnomaly getState]", "CoreLocation: %s\n", v42);
    if (v42 != (char *)buf)
      free(v42);
  }
  v3 = (std::__shared_weak_count *)operator new(0x70uLL);
  v3->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  v3->__shared_weak_owners_ = 0;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(buf, "kCLConnectionMessageKappaGetState");
  MEMORY[0x194001030](&v3[1], buf);
  if (v49 < 0)
    operator delete(*(void **)buf);
  v46 = &v3[1].__vftable;
  v47 = v3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v12 = objc_msgSend_setWithObjects_(v5, v8, v6, v9, v10, v7, 0);
  v44 = &v3[1].__vftable;
  v45 = v3;
  do
    v14 = __ldxr(p_shared_owners);
  while (__stxr(v14 + 1, p_shared_owners));
  v18 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v11, (uint64_t)&v44, v12, v13);
  v19 = v45;
  if (v45)
  {
    v20 = (unint64_t *)&v45->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = objc_msgSend_objectForKeyedSubscript_(v18, v15, (uint64_t)CFSTR("CMErrorMessage"), v16, v17);
  v26 = objc_msgSend_objectForKeyedSubscript_(v18, v23, (uint64_t)CFSTR("CMReturnCode"), v24, v25);
  v30 = (void *)objc_msgSend_objectForKeyedSubscript_(v18, v27, (uint64_t)CFSTR("CMKappaStateKey"), v28, v29);
  if (v22)
    v35 = 1;
  else
    v35 = v26 == 0;
  if (v35)
  {
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2954D28);
    v36 = qword_1EE16D830;
    if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v36, OS_LOG_TYPE_ERROR, "#Notice Response invalid.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D828 != -1)
        dispatch_once(&qword_1EE16D828, &unk_1E2954D28);
      v43 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSafetyAnomaly getState]", "CoreLocation: %s\n", v43);
      if (v43 != (char *)buf)
        free(v43);
    }
    v37 = -1;
  }
  else
  {
    v37 = objc_msgSend_intValue(v30, v31, v32, v33, v34);
  }
  v38 = v47;
  if (v47)
  {
    v39 = (unint64_t *)&v47->__shared_owners_;
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

- (void)notifyEvent:(id)a3
{
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint8_t buf[4];
  uint64_t v45;
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v46 = CFSTR("CMSafetyAnomalyPropertiesKey");
  v47[0] = a3;
  v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v47, (uint64_t)&v46, 1);
  sub_18F3515BC("kCLConnectionMessageSafetyAnomalyNotify", &v41, &v39);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v3, v6, v4, v7, v8, v5, 0);
  v37 = v39;
  v38 = v40;
  if (v40)
  {
    p_shared_owners = (unint64_t *)&v40->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v17 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v9, (uint64_t)&v37, v10, v11);
  v18 = v38;
  if (v38)
  {
    v19 = (unint64_t *)&v38->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = (void *)objc_msgSend_objectForKeyedSubscript_(v17, v14, (uint64_t)CFSTR("CMErrorMessage"), v15, v16);
  if (v21)
  {
    if (qword_1EE16D958 != -1)
      dispatch_once(&qword_1EE16D958, &unk_1E2954DC8);
    v22 = qword_1EE16D960;
    if (os_log_type_enabled((os_log_t)qword_1EE16D960, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend_unsignedLongValue(v21, v23, v24, v25, v26);
      *(_DWORD *)buf = 134217984;
      v45 = v27;
      _os_log_impl(&dword_18F1DC000, v22, OS_LOG_TYPE_ERROR, "igneous event error: %lu", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D958 != -1)
        dispatch_once(&qword_1EE16D958, &unk_1E2954DC8);
      v35 = objc_msgSend_unsignedLongValue(v21, v31, v32, v33, v34);
      v42 = 134217984;
      v43 = v35;
      v36 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSafetyAnomaly notifyEvent:]", "CoreLocation: %s\n", v36);
      if (v36 != (char *)buf)
        free(v36);
    }
  }
  v28 = v40;
  if (v40)
  {
    v29 = (unint64_t *)&v40->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
}

@end
