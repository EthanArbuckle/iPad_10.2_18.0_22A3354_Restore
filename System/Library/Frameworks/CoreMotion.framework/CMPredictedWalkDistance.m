@implementation CMPredictedWalkDistance

+ (BOOL)resetPredictedWalkDistanceOnDate:(id)a3 error:(id *)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  char *v43;
  NSObject *v44;
  void *v45;
  BOOL v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  char *v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint8_t buf[4];
  uint64_t v60;
  const __CFString *v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(a1);
  v61 = CFSTR("CMPredictedWalkDistanceResetDateKey");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeIntervalSinceReferenceDate(a3, v8, v9, v10, v11);
  v62[0] = objc_msgSend_numberWithDouble_(v7, v12, v13, v14, v15);
  v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v62, (uint64_t)&v61, 1);
  sub_18F3ABE2C("kCLConnectionMessagePredictedWalkDistanceReset", &v56, &v54);
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v24 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v22, v19, 0);
  v52 = v54;
  v53 = v55;
  if (v55)
  {
    p_shared_owners = (unint64_t *)&v55->__shared_owners_;
    do
      v27 = __ldxr(p_shared_owners);
    while (__stxr(v27 + 1, p_shared_owners));
  }
  v31 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v23, (uint64_t)&v52, v24, v25);
  v32 = v53;
  if (v53)
  {
    v33 = (unint64_t *)&v53->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  if (v31 && !objc_msgSend_objectForKeyedSubscript_(v31, v28, (uint64_t)CFSTR("CMErrorMessage"), v29, v30))
  {
    v46 = 1;
  }
  else
  {
    v35 = (void *)objc_msgSend_objectForKeyedSubscript_(v31, v28, (uint64_t)CFSTR("CMErrorMessage"), v29, v30);
    if (v35)
    {
      v40 = objc_msgSend_integerValue(v35, v36, v37, v38, v39);
      if (qword_1EE16D898 != -1)
        dispatch_once(&qword_1EE16D898, &unk_1E2953668);
      v41 = qword_1EE16D8A0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v60 = v40;
        _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_ERROR, "Unable to reset predicted walk distance. Error code %{public}ld.", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D898 != -1)
          dispatch_once(&qword_1EE16D898, &unk_1E2953668);
        v57 = 134349056;
        v58 = v40;
        v43 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "+[CMPredictedWalkDistance resetPredictedWalkDistanceOnDate:error:]", "CoreLocation: %s\n", v43);
        if (v43 != (char *)buf)
          free(v43);
      }
    }
    else
    {
      if (qword_1EE16D898 != -1)
        dispatch_once(&qword_1EE16D898, &unk_1E2953668);
      v44 = qword_1EE16D8A0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8A0, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v44, OS_LOG_TYPE_FAULT, "Invalid response to reset walk distance.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D898 != -1)
          dispatch_once(&qword_1EE16D898, &unk_1E2953668);
        LOWORD(v57) = 0;
        v51 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "+[CMPredictedWalkDistance resetPredictedWalkDistanceOnDate:error:]", "CoreLocation: %s\n", v51);
        if (v51 != (char *)buf)
          free(v51);
      }
      v40 = 103;
    }
    if (a4)
    {
      v45 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v42, (uint64_t)CFSTR("CMErrorDomain"), v40, 0);
      v46 = 0;
      *a4 = v45;
    }
    else
    {
      v46 = 0;
    }
  }
  v47 = v55;
  if (v55)
  {
    v48 = (unint64_t *)&v55->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  objc_sync_exit(a1);
  return v46;
}

@end
