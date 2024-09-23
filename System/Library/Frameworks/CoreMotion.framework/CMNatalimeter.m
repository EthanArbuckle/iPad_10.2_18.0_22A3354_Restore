@implementation CMNatalimeter

- (CMNatalimeter)init
{
  CMNatalimeter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMNatalimeter;
  v2 = -[CMNatalimeter init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMNatalimeterInternal);
  return v2;
}

- (void)dealloc
{
  NSObject *fInternalQueue;
  objc_super v4;
  _QWORD block[5];

  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3EBB2C;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)CMNatalimeter;
  -[CMNatalimeter dealloc](&v4, sel_dealloc);
}

+ (double)briskMinuteMetsThreshold
{
  return 4.40208912;
}

+ (double)activeMetsThreshold
{
  return 1.29999995;
}

+ (id)userProfile
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
  uint64_t v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  NSObject *v19;
  char *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  uint8_t buf[1640];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(a1);
  sub_18F3ED7F0("kCLConnectionMessageNatalimetryGetUserProfile", &v27);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v3, v6, v4, v7, v8, v5, 0);
  v25 = v27;
  v26 = v28;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v14 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v9, (uint64_t)&v25, v10, v11);
  v15 = (void *)v14;
  v16 = v26;
  if (!v26)
    goto LABEL_8;
  v17 = (unint64_t *)&v26->__shared_owners_;
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
    if (v15)
      goto LABEL_19;
  }
  else
  {
LABEL_8:
    if (v14)
      goto LABEL_19;
  }
  if (qword_1EE16D6A0 != -1)
    dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
  v19 = qword_1EE16D6A8;
  if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_ERROR, "UserProfile, Invalid response", buf, 2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
    v20 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "+[CMNatalimeter userProfile]", "CoreLocation: %s\n", v20);
    if (v20 != (char *)buf)
      free(v20);
  }
LABEL_19:
  v21 = v28;
  if (v28)
  {
    v22 = (unint64_t *)&v28->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  objc_sync_exit(a1);
  return v15;
}

+ (id)defaultUserProfile
{
  _QWORD v3[6];
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("CMNatalimeterSetUserHeightMeter");
  v3[1] = CFSTR("CMNatalimeterSetUserWeightKG");
  v4[0] = &unk_1E298C500;
  v4[1] = &unk_1E298C510;
  v3[2] = CFSTR("CMNatalimeterSetUserAgeYr");
  v3[3] = CFSTR("CMNatalimeterSetUserBiologicalSex");
  v4[2] = &unk_1E298C520;
  v4[3] = &unk_1E298C3F8;
  v3[4] = CFSTR("CMNatalimeterSetUserCondition");
  v3[5] = CFSTR("CMNatalimeterSetUserBetaBlockerUse");
  v4[4] = &unk_1E298C3F8;
  v4[5] = MEMORY[0x1E0C9AAA0];
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v4, (uint64_t)v3, 6);
}

+ (BOOL)setUserProfile:(id)a3 error:(id *)a4
{
  void *v6;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  BOOL v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  char *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  id v53;
  int v54;
  int v55;
  uint8_t buf[4];
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  objc_sync_enter(a1);
  sub_18F3ED90C("kCLConnectionMessageNatalimetrySetUserProfile", &v53, &v51);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v13 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v8, 0);
  v49 = v51;
  v50 = v52;
  if (v52)
  {
    p_shared_owners = (unint64_t *)&v52->__shared_owners_;
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
  }
  v20 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v12, (uint64_t)&v49, v13, v14);
  v21 = v50;
  if (v50)
  {
    v22 = (unint64_t *)&v50->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = (void *)objc_msgSend_objectForKeyedSubscript_(v20, v17, (uint64_t)CFSTR("CMErrorMessage"), v18, v19);
  if (!v24)
    goto LABEL_17;
  if (qword_1EE16D6A0 != -1)
    dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
  v25 = qword_1EE16D6A8;
  if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_ERROR))
  {
    v30 = objc_msgSend_intValue(v24, v26, v27, v28, v29);
    *(_DWORD *)buf = 67240192;
    v57 = v30;
    _os_log_impl(&dword_18F1DC000, v25, OS_LOG_TYPE_ERROR, "UserProfile, Error while setting, %{public}d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
    v47 = objc_msgSend_intValue(v24, v43, v44, v45, v46);
    v54 = 67240192;
    v55 = v47;
    v48 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "+[CMNatalimeter setUserProfile:error:]", "CoreLocation: %s\n", v48);
    if (v48 != (char *)buf)
      free(v48);
  }
  if (a4)
  {
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v36 = objc_msgSend_integerValue(v24, v31, v32, v33, v34);
    v38 = 0;
    *a4 = (id)objc_msgSend_errorWithDomain_code_userInfo_(v35, v37, (uint64_t)CFSTR("CMErrorDomain"), v36, 0);
  }
  else
  {
LABEL_17:
    v38 = 1;
  }
  v39 = v52;
  if (v52)
  {
    v40 = (unint64_t *)&v52->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  objc_sync_exit(a1);
  return v38;
}

+ (BOOL)setUserInfo:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
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
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  _QWORD v63[6];
  _QWORD v64[7];

  v64[6] = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend_gender(a3, a2, (uint64_t)a3, (uint64_t)a4, v4);
  if (v8 == 1)
    v13 = 1;
  else
    v13 = 2 * (v8 == 0);
  v63[0] = CFSTR("CMNatalimeterSetUserHeightMeter");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_height(a3, v9, v10, v11, v12);
  v64[0] = objc_msgSend_numberWithDouble_(v14, v15, v16, v17, v18);
  v63[1] = CFSTR("CMNatalimeterSetUserWeightKG");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_weight(a3, v20, v21, v22, v23);
  v64[1] = objc_msgSend_numberWithDouble_(v19, v24, v25, v26, v27);
  v63[2] = CFSTR("CMNatalimeterSetUserAgeYr");
  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_age(a3, v29, v30, v31, v32);
  v64[2] = objc_msgSend_numberWithDouble_(v28, v33, v34, v35, v36);
  v63[3] = CFSTR("CMNatalimeterSetUserBiologicalSex");
  v64[3] = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v37, v13, v38, v39);
  v63[4] = CFSTR("CMNatalimeterSetUserCondition");
  v40 = (void *)MEMORY[0x1E0CB37E8];
  v45 = objc_msgSend_condition(a3, v41, v42, v43, v44);
  v64[4] = objc_msgSend_numberWithInteger_(v40, v46, v45, v47, v48);
  v63[5] = CFSTR("CMNatalimeterSetUserBetaBlockerUse");
  v49 = (void *)MEMORY[0x1E0CB37E8];
  v54 = objc_msgSend_betaBlockerUse(a3, v50, v51, v52, v53);
  v64[5] = objc_msgSend_numberWithBool_(v49, v55, v54, v56, v57);
  v59 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v58, (uint64_t)v64, (uint64_t)v63, 6);
  return objc_msgSend_setUserProfile_error_(a1, v60, v59, (uint64_t)a4, v61);
}

+ (BOOL)resetCalibrationDataWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  char *v31;
  NSObject *v32;
  void *v33;
  BOOL v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  char *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  int v44;
  uint64_t v45;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(a1);
  sub_18F3C5D28("kCLConnectionMessageNatalimetryResetCalibration", &v42);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v12 = objc_msgSend_setWithObjects_(v5, v8, v6, v9, v10, v7, 0);
  v40 = v42;
  v41 = v43;
  if (v43)
  {
    p_shared_owners = (unint64_t *)&v43->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  v19 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v11, (uint64_t)&v40, v12, v13);
  v20 = v41;
  if (v41)
  {
    v21 = (unint64_t *)&v41->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (v19 && !objc_msgSend_objectForKeyedSubscript_(v19, v16, (uint64_t)CFSTR("CMErrorMessage"), v17, v18))
  {
    v34 = 1;
  }
  else
  {
    v23 = (void *)objc_msgSend_objectForKeyedSubscript_(v19, v16, (uint64_t)CFSTR("CMErrorMessage"), v17, v18);
    if (v23)
    {
      v28 = objc_msgSend_integerValue(v23, v24, v25, v26, v27);
      if (qword_1EE16D6A0 != -1)
        dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
      v29 = qword_1EE16D6A8;
      if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v47 = v28;
        _os_log_impl(&dword_18F1DC000, v29, OS_LOG_TYPE_ERROR, "Unable to reset calibration data. Error code %{public}ld.", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D6A0 != -1)
          dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
        v44 = 134349056;
        v45 = v28;
        v31 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "+[CMNatalimeter resetCalibrationDataWithError:]", "CoreLocation: %s\n", v31);
        if (v31 != (char *)buf)
          free(v31);
      }
    }
    else
    {
      if (qword_1EE16D6A0 != -1)
        dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
      v32 = qword_1EE16D6A8;
      if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_FAULT, "Invalid response to reset calibration.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D6A0 != -1)
          dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
        LOWORD(v44) = 0;
        v39 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "+[CMNatalimeter resetCalibrationDataWithError:]", "CoreLocation: %s\n", v39);
        if (v39 != (char *)buf)
          free(v39);
      }
      v28 = 103;
    }
    if (a3)
    {
      v33 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v30, (uint64_t)CFSTR("CMErrorDomain"), v28, 0);
      v34 = 0;
      *a3 = v33;
    }
    else
    {
      v34 = 0;
    }
  }
  v35 = v43;
  if (v43)
  {
    v36 = (unint64_t *)&v43->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  objc_sync_exit(a1);
  return v34;
}

+ (BOOL)isNatalimeterAvailable
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  sub_18F1F77DC();
  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageNatalimetryAvailable", v4, v5);
}

- (void)queryAbsoluteNatalimetryDataSinceRecord:(int64_t)a3 withHandler:(id)a4
{
  uint64_t v4;
  void *v9;
  const char *v10;
  _QWORD v11[7];

  if (!a4)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMNatalimeter.mm"), 417, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F3EC9B0;
  v11[3] = &unk_1E2957130;
  v11[5] = a4;
  v11[6] = a3;
  v11[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v11, (uint64_t)a4, v4);
}

- (void)queryAbsoluteNatalimetryDataSinceDataRecord:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  const char *v24;

  if (!a4)
  {
    v23 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMNatalimeter.mm"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  if (qword_1ECEDF900 != -1)
    dispatch_once(&qword_1ECEDF900, &unk_1E2944FC0);
  if (qword_1ECEDF8F8 == 3)
  {
    if (a3)
    {
      v8 = objc_msgSend_sourceId(a3, a2, (uint64_t)a3, (uint64_t)a4, v4);
      v13 = objc_msgSend__internal(self, v9, v10, v11, v12);
      v18 = v13;
      if (v8)
      {
        MEMORY[0x1E0DE7D20](v13, sel__queryAbsoluteNatalimetryDataSinceDataRecord_withHandler_, a3, a4, v17);
        return;
      }
      v21 = objc_msgSend_recordId(a3, v14, v15, v16, v17);
      v19 = v18;
    }
    else
    {
      v19 = objc_msgSend__internal(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
      v21 = 0;
    }
    MEMORY[0x1E0DE7D20](v19, sel__queryAbsoluteNatalimetryDataSinceRecord_withHandler_, v21, a4, v20);
  }
}

- (void)startAbsoluteNatalimetryDataUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v8;
  const char *v9;
  _QWORD v10[6];

  if (!a3)
  {
    v8 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMNatalimeter.mm"), 445, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F3ECBE0;
  v10[3] = &unk_1E2955B38;
  v10[4] = self;
  v10[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v10, v3, v4);
}

- (void)stopAbsoluteNatalimetryDataUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3ECC64;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

+ (id)maxNatalieEntries
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(CMNatalieData, sel_maxNatalieEntries);
}

+ (id)computeRestingCaloriesAtRate:(unint64_t)a3 user:(id)a4 duration:(double)a5
{
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  float v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v46;
  const char *v47;

  if (!a4)
  {
    v46 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0, v5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v46, v47, (uint64_t)a2, (uint64_t)a1, (uint64_t)CFSTR("CMNatalimeter.mm"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInfo"));
  }
  if (!objc_msgSend_gender(a4, a2, a3, (uint64_t)a4, v5) || objc_msgSend_gender(a4, v8, v9, v10, v11) == 1)
    objc_msgSend_gender(a4, v8, v9, v10, v11);
  objc_msgSend_height(a4, v8, v9, v10, v11);
  if (v16 > 0.0)
    objc_msgSend_height(a4, v12, v13, v14, v15);
  objc_msgSend_weight(a4, v12, v13, v14, v15);
  if (v21 <= 0.0)
  {
    v23 = 68.0299988;
  }
  else
  {
    objc_msgSend_weight(a4, v17, v18, v19, v20);
    *(float *)&v22 = v22;
    v23 = *(float *)&v22;
  }
  objc_msgSend_age(a4, v17, v18, v19, v20);
  if (v28 > 0.0)
    objc_msgSend_age(a4, v24, v25, v26, v27);
  if ((objc_msgSend_condition(a4, v24, v25, v26, v27) & 0x8000000000000000) == 0
    && objc_msgSend_condition(a4, v29, v30, v31, v32) <= 6)
  {
    objc_msgSend_condition(a4, v33, v34, v35, v36);
  }
  v37 = (void *)MEMORY[0x1E0CB37E8];
  sub_18F494BDC();
  return (id)objc_msgSend_numberWithDouble_(v37, v39, v40, v41, v42, v23 * v38 * a5 * 1000.0 / 3600.0);
}

+ (double)computeTimeToActiveCalories:(id)a3 user:(id)a4 workoutType:(int64_t)a5
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  float v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  float v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  float v53;
  double v54;
  double v55;
  double v56;
  float v57;
  double v58;
  float v59;
  double v60;
  double v61;
  NSObject *v62;
  NSObject *v63;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  char *v69;
  char *v70;
  uint8_t buf[4];
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  int64_t v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v65 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v65, v66, (uint64_t)a2, (uint64_t)a1, (uint64_t)CFSTR("CMNatalimeter.mm"), 490, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activeCalories"));
    if (a4)
      goto LABEL_3;
LABEL_59:
    v67 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v67, v68, (uint64_t)a2, (uint64_t)a1, (uint64_t)CFSTR("CMNatalimeter.mm"), 491, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInfo"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_59;
LABEL_3:
  if (!objc_msgSend_gender(a4, a2, (uint64_t)a3, (uint64_t)a4, a5) || objc_msgSend_gender(a4, v10, v11, v12, v13) == 1)
    objc_msgSend_gender(a4, v10, v11, v12, v13);
  objc_msgSend_height(a4, v10, v11, v12, v13);
  if (v18 <= 0.0)
  {
    v20 = 1.7;
  }
  else
  {
    objc_msgSend_height(a4, v14, v15, v16, v17);
    v20 = v19;
  }
  objc_msgSend_weight(a4, v14, v15, v16, v17);
  if (v25 <= 0.0)
  {
    v27 = 68.03;
  }
  else
  {
    objc_msgSend_weight(a4, v21, v22, v23, v24);
    v27 = v26;
  }
  objc_msgSend_age(a4, v21, v22, v23, v24);
  v32 = 30.0;
  if (v33 > 0.0)
  {
    objc_msgSend_age(a4, v28, v29, v30, v31);
    v32 = v34;
  }
  if ((objc_msgSend_condition(a4, v28, v29, v30, v31) & 0x8000000000000000) == 0
    && objc_msgSend_condition(a4, v35, v36, v37, v38) <= 6)
  {
    objc_msgSend_condition(a4, v35, v39, v37, v38);
  }
  v40 = objc_msgSend_CLMotionActivityTypeFromCMWorkoutType_(CMWorkout, v35, a5, v37, v38);
  objc_msgSend_doubleValue(a3, v41, v42, v43, v44);
  v46 = v45;
  v47 = 0.0;
  if (v40 > 17149)
  {
    if (v40 == 90603)
      goto LABEL_32;
    if (v40 != 17150)
      goto LABEL_45;
LABEL_23:
    v48 = dbl_18F507720[v32 <= 13.0];
    v49 = fmin(v20 * 0.5 + 0.225, 1.0);
    if (v48 < v49)
      v48 = v49;
    v50 = fmax(fmin(v32 * -0.01 + 1.6, 1.0), 0.7);
    v51 = fmax(fmin(v27 / (v20 * v20) * -0.0125 + 1.425, 1.0), 0.9);
    if (v50 >= v48)
      v52 = v48;
    else
      v52 = v50;
    if (v51 < v52)
      v52 = v51;
    if (v52 == 1.0)
    {
      v53 = 3.2973;
    }
    else
    {
      v55 = fmax(v50 * v48 * v51, 0.9);
      if (v55 >= v52)
        v55 = v52;
      v53 = v55 * 3.2973001;
      v56 = 0.0;
      if (v53 < 1.0)
        goto LABEL_39;
    }
    v57 = (float)((float)(v53 * -0.793) + (float)((float)(v53 * 0.3564) * v53)) + 3.142;
    if (v57 > 8.0)
      v57 = 8.0;
    v56 = v57;
LABEL_39:
    v58 = 2.19999981;
    if (v56 >= 2.19999981)
      v58 = v56;
    if (v58 > 4.40208912)
      v58 = 4.40208912;
    v54 = v58 * v27;
    goto LABEL_44;
  }
  if (v40 == 4)
    goto LABEL_23;
  if (v40 == 11805)
  {
LABEL_32:
    v54 = (float)(v27 * 2.7757);
LABEL_44:
    v47 = v54 * 1000.0;
  }
LABEL_45:
  sub_18F494BDC();
  v60 = v47 + v59 * v27 * 3600.0 * -1000.0 / 3600.0;
  if (v60 <= 0.0)
  {
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
    v62 = qword_1EE16D6A8;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218243;
      v72 = 0.0;
      v73 = 2113;
      v74 = *(double *)&a4;
      _os_log_impl(&dword_18F1DC000, v62, OS_LOG_TYPE_ERROR, "TimeToActiveCalories is negative: timeToActiveCalories, %f, %{private}@", buf, 0x16u);
    }
    v61 = 0.0;
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D6A0 != -1)
        dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
      v70 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMNatalimeter computeTimeToActiveCalories:user:workoutType:]", "CoreLocation: %s\n", v70);
      if (v70 != (char *)buf)
        free(v70);
    }
  }
  else
  {
    v61 = v46 * 3600.0 / v60;
  }
  if (qword_1EE16D6A0 != -1)
    dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
  v63 = qword_1EE16D6A8;
  if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218755;
    v72 = v61;
    v73 = 2048;
    v74 = v46;
    v75 = 2048;
    v76 = a5;
    v77 = 2113;
    v78 = a4;
    _os_log_impl(&dword_18F1DC000, v63, OS_LOG_TYPE_INFO, "TimeToActiveCalories, %f, target, %f, workoutType, %ld, %{private}@", buf, 0x2Au);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
    v69 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "+[CMNatalimeter computeTimeToActiveCalories:user:workoutType:]", "CoreLocation: %s\n", v69);
    if (v69 != (char *)buf)
      free(v69);
  }
  return v61;
}

- (CMNatalimeterInternal)_internal
{
  return self->_internal;
}

@end
