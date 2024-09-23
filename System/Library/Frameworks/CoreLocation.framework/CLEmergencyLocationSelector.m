@implementation CLEmergencyLocationSelector

- (CLEmergencyLocationSelector)initWithConfig:(id)a3 bundle:(id)a4 delegate:(id)a5 queue:(id)a6
{
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CLEmergencyLocationSelector *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  CLLocationManager *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const std::string::value_type *v45;
  std::string *v46;
  __int128 v47;
  std::string *v48;
  std::__shared_weak_count *v49;
  unint64_t *p_shared_owners;
  unint64_t v51;
  void **v52;
  int v53;
  std::string::size_type size;
  _BYTE *v55;
  std::string *v56;
  unint64_t v57;
  __int128 v58;
  NSObject *v59;
  NSObject *v60;
  void *fInstance;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  CLEmergencyLocationSelector *result;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  char *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  char *v82;
  std::string::size_type v83;
  char *v84;
  char *v85;
  const char *v86;
  id v87;
  _QWORD v88[5];
  objc_super v89;
  uint64_t v90;
  std::__shared_weak_count *v91;
  std::string v92;
  std::string v93;
  _BYTE buf[28];
  __int16 v95;
  const char *v96;
  std::string v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v70 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v70, v71, (uint64_t)a2, (uint64_t)self, CFSTR("CLEmergencyLocationSelector.mm"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("config"));
    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
LABEL_52:
      v74 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v74, v75, (uint64_t)a2, (uint64_t)self, CFSTR("CLEmergencyLocationSelector.mm"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));
      if (a6)
        goto LABEL_5;
      goto LABEL_53;
    }
  }
  v72 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v72, v73, (uint64_t)a2, (uint64_t)self, CFSTR("CLEmergencyLocationSelector.mm"), 289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle"));
  if (!a5)
    goto LABEL_52;
LABEL_4:
  if (a6)
    goto LABEL_5;
LABEL_53:
  v76 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v76, v77, (uint64_t)a2, (uint64_t)self, CFSTR("CLEmergencyLocationSelector.mm"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
LABEL_5:
  dispatch_assert_queue_V2((dispatch_queue_t)a6);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v87 = a6;
  v12 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,initWithConfig:bundle:delegate:queue:,initiated", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    LOWORD(v97.__r_.__value_.__l.__data_) = 0;
    v78 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector initWithConfig:bundle:delegate:queue:]", "CoreLocation: %s\n", v78);
    if (v78 != buf)
      free(v78);
  }
  v89.receiver = self;
  v89.super_class = (Class)CLEmergencyLocationSelector;
  v16 = -[CLEmergencyLocationSelector init](&v89, sel_init);
  if (!v16)
    return v16;
  objc_msgSend_printConfiguration(a3, v13, v14, v15);
  v17 = (void *)MEMORY[0x1E0CB3940];
  v21 = objc_msgSend_feature(a3, v18, v19, v20);
  v24 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v22, v21, v23);
  v27 = objc_msgSend_stringWithFormat_(v17, v25, (uint64_t)CFSTR("Emergency Location Session for %@"), v26, v24);
  v16->_fCleeaAssertion = (CLAssertion *)objc_msgSend_newAssertionForBundle_withReason_(CLEmergencyEnablementAssertion, v28, (uint64_t)a4, v27);
  v29 = [CLLocationManager alloc];
  v16->_fLocManager = (CLLocationManager *)objc_msgSend_initWithEffectiveBundle_delegate_onQueue_(v29, v30, (uint64_t)a4, (uint64_t)v16, a6);
  objc_storeWeak((id *)&v16->_fDelegate, a5);
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = sub_18F74D4A8;
  v88[3] = &unk_1E2992FD0;
  v88[4] = v16;
  v31 = operator new();
  *(_QWORD *)v31 = a3;
  *(_QWORD *)(v31 + 8) = a6;
  *(_QWORD *)(v31 + 16) = objc_msgSend_copy(v88, v32, v33, v34);
  sub_18F5D5990(&v92, "#CLELS,");
  v38 = objc_msgSend_feature(a3, v35, v36, v37);
  v41 = (void *)objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v39, v38, v40);
  v45 = (const std::string::value_type *)objc_msgSend_UTF8String(v41, v42, v43, v44);
  v46 = std::string::append(&v92, v45);
  v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
  v93.__r_.__value_.__r.__words[2] = v46->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v93.__r_.__value_.__l.__data_ = v47;
  v46->__r_.__value_.__l.__size_ = 0;
  v46->__r_.__value_.__r.__words[2] = 0;
  v46->__r_.__value_.__r.__words[0] = 0;
  v48 = std::string::append(&v93, ",state machine");
  v97 = *v48;
  v48->__r_.__value_.__l.__size_ = 0;
  v48->__r_.__value_.__r.__words[2] = 0;
  v48->__r_.__value_.__r.__words[0] = 0;
  v90 = v31;
  v49 = (std::__shared_weak_count *)operator new();
  v49->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v49->__shared_owners_;
  v49->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2990008;
  v49->__shared_weak_owners_ = 0;
  v49[1].__vftable = (std::__shared_weak_count_vtbl *)v31;
  *(_QWORD *)(v31 + 40) = 0;
  v91 = v49;
  *(_QWORD *)(v31 + 32) = v31 + 40;
  *(_QWORD *)(v31 + 48) = 0;
  *(_QWORD *)(v31 + 56) = v31;
  *(_QWORD *)(v31 + 64) = v49;
  do
    v51 = __ldxr(p_shared_owners);
  while (__stxr(v51 + 1, p_shared_owners));
  *(_QWORD *)(v31 + 120) = 0;
  v52 = (void **)(v31 + 120);
  *(_BYTE *)(v31 + 72) = 0;
  *(_QWORD *)(v31 + 88) = 0;
  *(_QWORD *)(v31 + 96) = 0;
  *(_QWORD *)(v31 + 104) = 0;
  *(_QWORD *)(v31 + 80) = v31 + 88;
  *(_DWORD *)(v31 + 112) = 0;
  *(_QWORD *)(v31 + 128) = 0;
  *(_QWORD *)(v31 + 136) = 0;
  *(_BYTE *)(v31 + 144) = 2;
  v53 = SHIBYTE(v97.__r_.__value_.__r.__words[2]);
  if ((v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v97.__r_.__value_.__r.__words[2]);
  else
    size = v97.__r_.__value_.__l.__size_;
  if (size)
  {
    v86 = (const char *)(v31 + 24);
    v55 = buf;
    sub_18F673A90((uint64_t)buf, size + 1);
    if (buf[23] < 0)
      v55 = *(_BYTE **)buf;
    if (v53 >= 0)
      v56 = &v97;
    else
      v56 = (std::string *)v97.__r_.__value_.__r.__words[0];
    memmove(v55, v56, size);
    *(_WORD *)&v55[size] = 44;
    if (*(char *)(v31 + 143) < 0)
      operator delete(*v52);
    *(_OWORD *)v52 = *(_OWORD *)buf;
    *(_QWORD *)(v31 + 136) = *(_QWORD *)&buf[16];
    do
      v57 = __ldaxr(p_shared_owners);
    while (__stlxr(v57 - 1, p_shared_owners));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
    if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v97.__r_.__value_.__l.__data_);
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v93.__r_.__value_.__l.__data_);
    if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v92.__r_.__value_.__l.__data_);
    *(_OWORD *)(v31 + 194) = 0u;
    *(_OWORD *)(v31 + 184) = 0u;
    *(_OWORD *)(v31 + 168) = 0u;
    *(_OWORD *)(v31 + 152) = 0u;
    *(_OWORD *)(v31 + 212) = xmmword_18F776380;
    *(_DWORD *)(v31 + 228) = -1;
    *(_BYTE *)(v31 + 232) = 0;
    *(_OWORD *)(v31 + 236) = xmmword_18F776380;
    *(_OWORD *)(v31 + 252) = xmmword_18F776390;
    *(_QWORD *)&v58 = 0xFFFFFFFFLL;
    *((_QWORD *)&v58 + 1) = 0xFFFFFFFFLL;
    *(_OWORD *)(v31 + 268) = v58;
    dispatch_retain(*(dispatch_object_t *)(v31 + 8));
    *(_BYTE *)(v31 + 144) = 0;
    sub_18F74F570(v86, 0, (const char *)sub_18F74FA10, 0);
    sub_18F74F570(v86, 1, (const char *)sub_18F750550, 0);
    sub_18F74F570(v86, 2, (const char *)sub_18F7516D4, 0);
    sub_18F74F570(v86, 3, (const char *)sub_18F752764, 0);
    *(_QWORD *)(v31 + 104) = v87;
    *(_DWORD *)(v31 + 28) = 0;
    *(_BYTE *)(v31 + 72) = 1;
    sub_18F75276C((uint64_t)v86, 0);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v59 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v59, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorInternal,constructor,completed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      LOWORD(v93.__r_.__value_.__l.__data_) = 0;
      v82 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "CLEmergencyLocationSelectorInternal::CLEmergencyLocationSelectorInternal(CLEmergencyLocationSelectorConfig *, dispatch_queue_t, SendLocationCb)", "CoreLocation: %s\n", v82);
      if (v82 != buf)
        free(v82);
    }
    v16->_fInstance = (void *)v31;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v60 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      fInstance = v16->_fInstance;
      *(_DWORD *)buf = 134283521;
      *(_QWORD *)&buf[4] = fInstance;
      _os_log_impl(&dword_18F5B3000, v60, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,initWithConfig:bundle:delegate:queue:,created fInstance:%{private}p", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v83 = (std::string::size_type)v16->_fInstance;
      LODWORD(v97.__r_.__value_.__l.__data_) = 134283521;
      *(std::string::size_type *)((char *)v97.__r_.__value_.__r.__words + 4) = v83;
      v84 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector initWithConfig:bundle:delegate:queue:]", "CoreLocation: %s\n", v84);
      if (v84 != buf)
        free(v84);
    }
    objc_msgSend_setDesiredAccuracy_(v16->_fLocManager, v62, v63, v64, -1.0);
    objc_msgSend_startUpdatingLocation(v16->_fLocManager, v65, v66, v67);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v68 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v68, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,initWithConfig:bundle:delegate:queue:,completed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      LOWORD(v97.__r_.__value_.__l.__data_) = 0;
      v85 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector initWithConfig:bundle:delegate:queue:]", "CoreLocation: %s\n", v85);
      if (v85 != buf)
        free(v85);
    }
    return v16;
  }
  if (qword_1EE172128 != -1)
    dispatch_once(&qword_1EE172128, &unk_1E2993038);
  v79 = qword_1EE172130;
  if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "assert";
    v95 = 2081;
    v96 = "!name.empty()";
    _os_log_impl(&dword_18F5B3000, v79, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
  }
  v80 = qword_1EE172130;
  if (os_signpost_enabled((os_log_t)qword_1EE172130))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "assert";
    v95 = 2081;
    v96 = "!name.empty()";
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v80, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
  }
  v81 = qword_1EE172130;
  if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "assert";
    v95 = 2081;
    v96 = "!name.empty()";
    _os_log_impl(&dword_18F5B3000, v81, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  result = (CLEmergencyLocationSelector *)abort_report_np();
  __break(1u);
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_super v8;
  int v9;
  CLEmergencyLocationSelector *v10;
  uint8_t buf[4];
  CLEmergencyLocationSelector *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v3 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v12 = self;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,dealloc,self:%{private}@,initiated", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v9 = 138477827;
    v10 = self;
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector dealloc]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
  objc_msgSend_stopSession(self, v4, v5, v6);
  v8.receiver = self;
  v8.super_class = (Class)CLEmergencyLocationSelector;
  -[CLEmergencyLocationSelector dealloc](&v8, sel_dealloc);
}

- (void)stopSession
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CLEmergencyLocationSelector *v7;
  CLLocationManager *fLocManager;
  void **fInstance;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  NSObject *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  __int128 v158;
  NSObject *v159;
  void *v160;
  NSObject *v161;
  NSObject *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  CLAssertion *fCleeaAssertion;
  NSObject *v171;
  char *v172;
  char *v173;
  char *v174;
  char *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  int v192;
  int v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  char *v212;
  char *v213;
  int v214;
  int v215;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  int v221;
  int v222;
  int v223;
  int v224;
  int v225;
  int v226;
  int UpdateEnabled;
  int v228;
  int v229;
  int v230;
  int v231;
  int v232;
  int v233;
  int v234;
  int v235;
  int v236;
  int v237;
  int v238;
  int v239;
  int v240;
  int LocationEarlyReturnEnabled;
  int v242;
  int v243;
  CLEmergencyLocationSelector *v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  const __CFString *v248;
  __int128 v249;
  __int128 v250;
  const __CFString *v251;
  __int128 v252;
  const __CFString *v253;
  __int128 v254;
  const __CFString *v255;
  __int128 v256;
  _BYTE v257[24];
  const __CFString *v258;
  const __CFString *v259;
  const __CFString *v260;
  const __CFString *v261;
  __int128 buf;
  __int128 v263;
  __int128 v264;
  uint64_t v265;
  __int128 v266;
  __int128 v267;
  uint64_t v268;
  __int128 v269;
  uint64_t v270;
  __int128 v271;
  uint64_t v272;
  __int128 v273;
  _BYTE v274[24];
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;

  v279 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v3 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,stopSession,self:%{private}@,initiated", (uint8_t *)&buf, 0xCu);
  }
  v244 = self;
  v7 = self;
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    LODWORD(v245) = 138477827;
    *(_QWORD *)((char *)&v245 + 4) = self;
    v172 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector stopSession]", "CoreLocation: %s\n", v172);
    if (v172 != (char *)&buf)
      free(v172);
    v7 = self;
  }
  fLocManager = v7->_fLocManager;
  if (fLocManager)
  {
    objc_msgSend_stopUpdatingLocation(fLocManager, v4, v5, v6);

    self->_fLocManager = 0;
    v7 = self;
  }
  fInstance = (void **)v7->_fInstance;
  if (fInstance)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v10 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134283521;
      *(_QWORD *)((char *)&buf + 4) = fInstance;
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorInternal,stopSession,this:%{private}p,initiated", (uint8_t *)&buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      LODWORD(v245) = 134283521;
      *(_QWORD *)((char *)&v245 + 4) = fInstance;
      v174 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::stopSession()", "CoreLocation: %s\n", v174);
      if (v174 != (char *)&buf)
        free(v174);
    }
    sub_18F75276C((uint64_t)(fInstance + 3), 2);
    if (*fInstance)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v11 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v243 = *((unsigned __int8 *)fInstance + 208);
        LocationEarlyReturnEnabled = objc_msgSend_firstLocationEarlyReturnEnabled(*fInstance, v12, v13, v14);
        v239 = *((unsigned __int8 *)fInstance + 209);
        objc_msgSend_firstLocationTimeout(*fInstance, v15, v16, v17);
        v19 = v18;
        v229 = *((_DWORD *)fInstance + 53);
        v231 = *((_DWORD *)fInstance + 54);
        v233 = *((_DWORD *)fInstance + 55);
        v235 = *((_DWORD *)fInstance + 56);
        v237 = *((_DWORD *)fInstance + 57);
        UpdateEnabled = objc_msgSend_firstUpdateEnabled(*fInstance, v20, v21, v22);
        v225 = *((unsigned __int8 *)fInstance + 232);
        objc_msgSend_firstUpdateTimeout(*fInstance, v23, v24, v25);
        v27 = v26;
        v29 = *((_DWORD *)fInstance + 59);
        v28 = *((_DWORD *)fInstance + 60);
        v219 = *((_DWORD *)fInstance + 61);
        v221 = *((_DWORD *)fInstance + 62);
        v223 = *((_DWORD *)fInstance + 63);
        v33 = objc_msgSend_periodicUpdatesEnabled(*fInstance, v30, v31, v32);
        v34 = *((_DWORD *)fInstance + 64);
        v35 = *((_DWORD *)fInstance + 65);
        v36 = *((_DWORD *)fInstance + 66);
        v37 = *((_DWORD *)fInstance + 67);
        v38 = *((_DWORD *)fInstance + 68);
        v215 = *((_DWORD *)fInstance + 69);
        v217 = *((_DWORD *)fInstance + 70);
        objc_msgSend_locationUpdateTimeout(*fInstance, v39, v40, v41);
        v43 = v42;
        objc_msgSend_locationUpdateMinDelay(*fInstance, v44, v45, v46);
        LODWORD(buf) = 67115776;
        DWORD1(buf) = v243;
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = LocationEarlyReturnEnabled;
        HIWORD(buf) = 1024;
        LODWORD(v263) = v239;
        WORD2(v263) = 2048;
        *(_QWORD *)((char *)&v263 + 6) = v19;
        HIWORD(v263) = 1024;
        LODWORD(v264) = v229;
        WORD2(v264) = 1024;
        *(_DWORD *)((char *)&v264 + 6) = v231;
        WORD5(v264) = 1024;
        HIDWORD(v264) = v233;
        LOWORD(v265) = 1024;
        *(_DWORD *)((char *)&v265 + 2) = v235;
        HIWORD(v265) = 1024;
        LODWORD(v266) = v237;
        WORD2(v266) = 1024;
        *(_DWORD *)((char *)&v266 + 6) = UpdateEnabled;
        WORD5(v266) = 1024;
        HIDWORD(v266) = v225;
        LOWORD(v267) = 2048;
        *(_QWORD *)((char *)&v267 + 2) = v27;
        WORD5(v267) = 1024;
        HIDWORD(v267) = v29;
        LOWORD(v268) = 1024;
        *(_DWORD *)((char *)&v268 + 2) = v28;
        HIWORD(v268) = 1024;
        LODWORD(v269) = v219;
        WORD2(v269) = 1024;
        *(_DWORD *)((char *)&v269 + 6) = v221;
        WORD5(v269) = 1024;
        HIDWORD(v269) = v223;
        LOWORD(v270) = 1024;
        *(_DWORD *)((char *)&v270 + 2) = v33;
        HIWORD(v270) = 1024;
        LODWORD(v271) = v34;
        WORD2(v271) = 1024;
        *(_DWORD *)((char *)&v271 + 6) = v35;
        WORD5(v271) = 1024;
        HIDWORD(v271) = v36;
        LOWORD(v272) = 1024;
        *(_DWORD *)((char *)&v272 + 2) = v37;
        HIWORD(v272) = 1024;
        LODWORD(v273) = v38;
        WORD2(v273) = 1024;
        *(_DWORD *)((char *)&v273 + 6) = v215;
        WORD5(v273) = 1024;
        HIDWORD(v273) = v217;
        *(_WORD *)v274 = 2048;
        *(_QWORD *)&v274[2] = v43;
        *(_WORD *)&v274[10] = 2048;
        *(_QWORD *)&v274[12] = v47;
        _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "#CLELS,#careport,firstLocationAvailable,%d,firstLocationEarlyReturnEnabled,%d,wasFirstLocationEarlyReturn,%d,firstLocationTimeout,%f,locationTypeOfFirstLocation,%d,,horizontalAccOfFirstLocation,%d,verticalAccOfFirstLocation,%d,integrityOfFirstLocation,%d,ageOfFirstLocation,%d,firstUpdateEnabled,%d,firstUpdateLocAvailable,%d,firstUpdateTimeout,%f,locationTypeInFirstUpdate,%d,horizontalAccOfLocInFirstUpdate,%d,verticalAccOfLocInFirstUpdate,%d,integrityOfLocInFirstUpdate,%d,ageOfLocInFirstUpdate,%d,periodicUpdatesEnabled,%d,periodicUpdatesCount,%d,validPeriodUpdatesCount,%d,horizontalAccOfLocInBestPeriodicUpdate,%d,verticalAccOfLocInBestPeriodicUpdate,%d,integrityOfLocInBestPeriodicUpdate,%d,ageOfLocInBestPeriodicUpdate,%d,locationTypeInBestPeriodicUpdate,%d,locationUpdateTimeout,%f,locationUpdateMinDelay,%f", (uint8_t *)&buf, 0xB4u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
        v242 = *((unsigned __int8 *)fInstance + 208);
        v240 = objc_msgSend_firstLocationEarlyReturnEnabled(*fInstance, v176, v177, v178);
        v238 = *((unsigned __int8 *)fInstance + 209);
        objc_msgSend_firstLocationTimeout(*fInstance, v179, v180, v181);
        v183 = v182;
        v228 = *((_DWORD *)fInstance + 53);
        v230 = *((_DWORD *)fInstance + 54);
        v232 = *((_DWORD *)fInstance + 55);
        v234 = *((_DWORD *)fInstance + 56);
        v236 = *((_DWORD *)fInstance + 57);
        v226 = objc_msgSend_firstUpdateEnabled(*fInstance, v184, v185, v186);
        v224 = *((unsigned __int8 *)fInstance + 232);
        objc_msgSend_firstUpdateTimeout(*fInstance, v187, v188, v189);
        v191 = v190;
        v193 = *((_DWORD *)fInstance + 59);
        v192 = *((_DWORD *)fInstance + 60);
        v216 = *((_DWORD *)fInstance + 61);
        v220 = *((_DWORD *)fInstance + 62);
        v222 = *((_DWORD *)fInstance + 63);
        v197 = objc_msgSend_periodicUpdatesEnabled(*fInstance, v194, v195, v196);
        v198 = *((_DWORD *)fInstance + 64);
        v199 = *((_DWORD *)fInstance + 65);
        v200 = *((_DWORD *)fInstance + 66);
        v201 = *((_DWORD *)fInstance + 67);
        v202 = *((_DWORD *)fInstance + 68);
        v214 = *((_DWORD *)fInstance + 69);
        v218 = *((_DWORD *)fInstance + 70);
        objc_msgSend_locationUpdateTimeout(*fInstance, v203, v204, v205);
        v207 = v206;
        objc_msgSend_locationUpdateMinDelay(*fInstance, v208, v209, v210);
        LODWORD(v245) = 67115776;
        DWORD1(v245) = v242;
        WORD4(v245) = 1024;
        *(_DWORD *)((char *)&v245 + 10) = v240;
        HIWORD(v245) = 1024;
        LODWORD(v246) = v238;
        WORD2(v246) = 2048;
        *(_QWORD *)((char *)&v246 + 6) = v183;
        HIWORD(v246) = 1024;
        LODWORD(v247) = v228;
        WORD2(v247) = 1024;
        *(_DWORD *)((char *)&v247 + 6) = v230;
        WORD5(v247) = 1024;
        HIDWORD(v247) = v232;
        LOWORD(v248) = 1024;
        *(_DWORD *)((char *)&v248 + 2) = v234;
        HIWORD(v248) = 1024;
        LODWORD(v249) = v236;
        WORD2(v249) = 1024;
        *(_DWORD *)((char *)&v249 + 6) = v226;
        WORD5(v249) = 1024;
        HIDWORD(v249) = v224;
        LOWORD(v250) = 2048;
        *(_QWORD *)((char *)&v250 + 2) = v191;
        WORD5(v250) = 1024;
        HIDWORD(v250) = v193;
        LOWORD(v251) = 1024;
        *(_DWORD *)((char *)&v251 + 2) = v192;
        HIWORD(v251) = 1024;
        LODWORD(v252) = v216;
        WORD2(v252) = 1024;
        *(_DWORD *)((char *)&v252 + 6) = v220;
        WORD5(v252) = 1024;
        HIDWORD(v252) = v222;
        LOWORD(v253) = 1024;
        *(_DWORD *)((char *)&v253 + 2) = v197;
        HIWORD(v253) = 1024;
        LODWORD(v254) = v198;
        WORD2(v254) = 1024;
        *(_DWORD *)((char *)&v254 + 6) = v199;
        WORD5(v254) = 1024;
        HIDWORD(v254) = v200;
        LOWORD(v255) = 1024;
        *(_DWORD *)((char *)&v255 + 2) = v201;
        HIWORD(v255) = 1024;
        LODWORD(v256) = v202;
        WORD2(v256) = 1024;
        *(_DWORD *)((char *)&v256 + 6) = v214;
        WORD5(v256) = 1024;
        HIDWORD(v256) = v218;
        *(_WORD *)v257 = 2048;
        *(_QWORD *)&v257[2] = v207;
        *(_WORD *)&v257[10] = 2048;
        *(_QWORD *)&v257[12] = v211;
        v212 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::submitSipSessionStatsToCA()", "CoreLocation: %s\n", v212);
        if (v212 != (char *)&buf)
          free(v212);
      }
      *(_QWORD *)&v245 = CFSTR("firstLocationAvailable");
      *(_QWORD *)&buf = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v48, *((unsigned __int8 *)fInstance + 208), v49);
      *((_QWORD *)&v245 + 1) = CFSTR("firstLocationEarlyReturnEnabled");
      v50 = (void *)MEMORY[0x1E0CB37E8];
      v54 = objc_msgSend_firstLocationEarlyReturnEnabled(*fInstance, v51, v52, v53);
      *((_QWORD *)&buf + 1) = objc_msgSend_numberWithBool_(v50, v55, v54, v56);
      *(_QWORD *)&v246 = CFSTR("wasFirstLocationEarlyReturn");
      *(_QWORD *)&v263 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v57, *((unsigned __int8 *)fInstance + 209), v58);
      *((_QWORD *)&v246 + 1) = CFSTR("firstLocationTimeout");
      v59 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_firstLocationTimeout(*fInstance, v60, v61, v62);
      *((_QWORD *)&v263 + 1) = objc_msgSend_numberWithDouble_(v59, v63, v64, v65);
      *(_QWORD *)&v247 = CFSTR("locationTypeOfFirstLocation");
      *(_QWORD *)&v264 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v66, *((unsigned int *)fInstance + 53), v67);
      *((_QWORD *)&v247 + 1) = CFSTR("horizontalAccOfFirstLocation");
      v70 = *((unsigned int *)fInstance + 54);
      if ((v70 & 0x80000000) != 0)
        v71 = objc_msgSend_null(MEMORY[0x1E0C99E38], v68, v70, v69);
      else
        v71 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v68, v70, v69);
      *((_QWORD *)&v264 + 1) = v71;
      v248 = CFSTR("verticalAccOfFirstLocation");
      v76 = *((unsigned int *)fInstance + 55);
      if ((v76 & 0x80000000) != 0)
        v77 = objc_msgSend_null(MEMORY[0x1E0C99E38], v72, v76, v73);
      else
        v77 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v72, v76, v73);
      v265 = v77;
      *(_QWORD *)&v249 = CFSTR("integrityOfFirstLocation");
      *(_QWORD *)&v266 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v78, *((unsigned int *)fInstance + 56), v79);
      *((_QWORD *)&v249 + 1) = CFSTR("ageOfFirstLocation");
      v82 = *((unsigned int *)fInstance + 57);
      if ((v82 & 0x80000000) != 0)
        v83 = objc_msgSend_null(MEMORY[0x1E0C99E38], v80, v82, v81);
      else
        v83 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v80, v82, v81);
      *((_QWORD *)&v266 + 1) = v83;
      *(_QWORD *)&v250 = CFSTR("firstUpdateEnabled");
      v87 = (void *)MEMORY[0x1E0CB37E8];
      v88 = objc_msgSend_firstUpdateEnabled(*fInstance, v84, v85, v86);
      *(_QWORD *)&v267 = objc_msgSend_numberWithBool_(v87, v89, v88, v90);
      *((_QWORD *)&v250 + 1) = CFSTR("firstUpdateLocAvailable");
      *((_QWORD *)&v267 + 1) = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v91, *((unsigned __int8 *)fInstance + 232), v92);
      v251 = CFSTR("firstUpdateLocTimeout");
      v93 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_firstUpdateTimeout(*fInstance, v94, v95, v96);
      v268 = objc_msgSend_numberWithDouble_(v93, v97, v98, v99);
      *(_QWORD *)&v252 = CFSTR("locationTypeInFirstUpdate");
      *(_QWORD *)&v269 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v100, *((unsigned int *)fInstance + 59), v101);
      *((_QWORD *)&v252 + 1) = CFSTR("horizontalAccOfLocInFirstUpdate");
      v104 = *((unsigned int *)fInstance + 60);
      if ((v104 & 0x80000000) != 0)
        v105 = objc_msgSend_null(MEMORY[0x1E0C99E38], v102, v104, v103);
      else
        v105 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v102, v104, v103);
      *((_QWORD *)&v269 + 1) = v105;
      v253 = CFSTR("verticalAccOfLocInFirstUpdate");
      v108 = *((unsigned int *)fInstance + 61);
      if ((v108 & 0x80000000) != 0)
        v109 = objc_msgSend_null(MEMORY[0x1E0C99E38], v106, v108, v107);
      else
        v109 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v106, v108, v107);
      v270 = v109;
      *(_QWORD *)&v254 = CFSTR("integrityOfLocInFirstUpdate");
      *(_QWORD *)&v271 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v110, *((unsigned int *)fInstance + 62), v111);
      *((_QWORD *)&v254 + 1) = CFSTR("ageOfLocInFirstUpdate");
      v114 = *((unsigned int *)fInstance + 63);
      if ((v114 & 0x80000000) != 0)
        v115 = objc_msgSend_null(MEMORY[0x1E0C99E38], v112, v114, v113);
      else
        v115 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v112, v114, v113);
      *((_QWORD *)&v271 + 1) = v115;
      v255 = CFSTR("periodicUpdatesEnabled");
      v119 = (void *)MEMORY[0x1E0CB37E8];
      v120 = objc_msgSend_periodicUpdatesEnabled(*fInstance, v116, v117, v118);
      v272 = objc_msgSend_numberWithBool_(v119, v121, v120, v122);
      *(_QWORD *)&v256 = CFSTR("periodicUpdatesCount");
      *(_QWORD *)&v273 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v123, *((unsigned int *)fInstance + 64), v124);
      *((_QWORD *)&v256 + 1) = CFSTR("validPeriodUpdatesCount");
      *((_QWORD *)&v273 + 1) = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v125, *((unsigned int *)fInstance + 65), v126);
      *(_QWORD *)v257 = CFSTR("horizontalAccOfLocInBestPeriodicUpdate");
      v129 = *((unsigned int *)fInstance + 66);
      if ((v129 & 0x80000000) != 0)
        v130 = objc_msgSend_null(MEMORY[0x1E0C99E38], v127, v129, v128);
      else
        v130 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v127, v129, v128);
      *(_QWORD *)v274 = v130;
      *(_QWORD *)&v257[8] = CFSTR("verticalAccOfLocInBestPeriodicUpdate");
      v133 = *((unsigned int *)fInstance + 67);
      if ((v133 & 0x80000000) != 0)
        v134 = objc_msgSend_null(MEMORY[0x1E0C99E38], v131, v133, v132);
      else
        v134 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v131, v133, v132);
      *(_QWORD *)&v274[8] = v134;
      *(_QWORD *)&v257[16] = CFSTR("integrityOfLocInBestPeriodicUpdate");
      *(_QWORD *)&v274[16] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v135, *((unsigned int *)fInstance + 68), v136);
      v258 = CFSTR("ageOfLocInBestPeriodicUpdate");
      v139 = *((unsigned int *)fInstance + 69);
      if ((v139 & 0x80000000) != 0)
        v140 = objc_msgSend_null(MEMORY[0x1E0C99E38], v137, v139, v138);
      else
        v140 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v137, v139, v138);
      v275 = v140;
      v259 = CFSTR("locationTypeInBestPeriodicUpdate");
      v276 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v141, *((unsigned int *)fInstance + 70), v142);
      v260 = CFSTR("locationUpdateTimeout");
      v143 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_locationUpdateTimeout(*fInstance, v144, v145, v146);
      v277 = objc_msgSend_numberWithDouble_(v143, v147, v148, v149);
      v261 = CFSTR("locationUpdateMinDelay");
      v150 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_locationUpdateMinDelay(*fInstance, v151, v152, v153);
      v278 = objc_msgSend_numberWithDouble_(v150, v154, v155, v156);
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v157, (uint64_t)&buf, (uint64_t)&v245, 27);
      AnalyticsSendEventLazy();
    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v74 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 134283521;
        *(_QWORD *)((char *)&buf + 4) = fInstance;
        _os_log_impl(&dword_18F5B3000, v74, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,submitSipSessionStatsToCA,this:%{private}p,nil fConfig,early return", (uint8_t *)&buf, 0xCu);
      }
      if (sub_18F5C4AE0(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
        LODWORD(v245) = 134283521;
        *(_QWORD *)((char *)&v245 + 4) = fInstance;
        v75 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 0, "void CLEmergencyLocationSelectorInternal::submitSipSessionStatsToCA()", "CoreLocation: %s\n", v75);
        if (v75 != (char *)&buf)
          free(v75);
      }
    }
    *((_WORD *)fInstance + 104) = 0;
    *(_OWORD *)((char *)fInstance + 212) = xmmword_18F776380;
    *((_DWORD *)fInstance + 57) = -1;
    *((_BYTE *)fInstance + 232) = 0;
    *(_OWORD *)((char *)fInstance + 236) = xmmword_18F776380;
    *(_OWORD *)((char *)fInstance + 252) = xmmword_18F776390;
    *(_QWORD *)&v158 = 0xFFFFFFFFLL;
    *((_QWORD *)&v158 + 1) = 0xFFFFFFFFLL;
    *(_OWORD *)((char *)fInstance + 268) = v158;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v159 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134283521;
      *(_QWORD *)((char *)&buf + 4) = fInstance;
      _os_log_impl(&dword_18F5B3000, v159, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorInternal,stopSession,this:%{private}p,completed", (uint8_t *)&buf, 0xCu);
    }
    v7 = v244;
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      LODWORD(v245) = 134283521;
      *(_QWORD *)((char *)&v245 + 4) = fInstance;
      v175 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::stopSession()", "CoreLocation: %s\n", v175);
      if (v175 != (char *)&buf)
        free(v175);
      v7 = v244;
    }
    v160 = v7->_fInstance;
    if (v160)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v161 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134283521;
        *(_QWORD *)((char *)&buf + 4) = v160;
        _os_log_impl(&dword_18F5B3000, v161, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorInternal,destructor,this:%{private}p,initiated", (uint8_t *)&buf, 0xCu);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
        LODWORD(v245) = 134283521;
        *(_QWORD *)((char *)&v245 + 4) = v160;
        v213 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "CLEmergencyLocationSelectorInternal::~CLEmergencyLocationSelectorInternal()", "CoreLocation: %s\n", v213);
        if (v213 != (char *)&buf)
          free(v213);
      }
      if (*(_QWORD *)v160)
      {

        *(_QWORD *)v160 = 0;
      }
      v162 = *((_QWORD *)v160 + 1);
      if (v162)
      {
        dispatch_release(v162);
        *((_QWORD *)v160 + 1) = 0;
      }
      v163 = (void *)*((_QWORD *)v160 + 19);
      if (v163)
      {

        *((_QWORD *)v160 + 19) = 0;
      }
      v164 = (void *)*((_QWORD *)v160 + 20);
      if (v164)
      {

        *((_QWORD *)v160 + 20) = 0;
      }
      v165 = (void *)*((_QWORD *)v160 + 22);
      if (v165)
      {

        *((_QWORD *)v160 + 22) = 0;
      }
      v166 = (void *)*((_QWORD *)v160 + 23);
      if (v166)
      {

        *((_QWORD *)v160 + 23) = 0;
      }
      v167 = (void *)*((_QWORD *)v160 + 24);
      if (v167)
      {

        *((_QWORD *)v160 + 24) = 0;
      }
      v168 = (void *)*((_QWORD *)v160 + 25);
      if (v168)
      {

        *((_QWORD *)v160 + 25) = 0;
      }
      v169 = (void *)*((_QWORD *)v160 + 2);
      if (v169)
      {

        *((_QWORD *)v160 + 2) = 0;
      }
      sub_18F758F60((uint64_t)v160 + 24);
      MEMORY[0x194002D30](v160, 0x10B2C40AA91F4E7);
    }
    v7->_fInstance = 0;
  }
  fCleeaAssertion = v7->_fCleeaAssertion;
  if (fCleeaAssertion)
  {
    objc_msgSend_invalidate(fCleeaAssertion, v4, v5, v6);

    v244->_fCleeaAssertion = 0;
    v7 = v244;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v171 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_18F5B3000, v171, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,stopSession,self:%{private}@,completed", (uint8_t *)&buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    LODWORD(v245) = 138477827;
    *(_QWORD *)((char *)&v245 + 4) = v244;
    v173 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector stopSession]", "CoreLocation: %s\n", v173);
    if (v173 != (char *)&buf)
      free(v173);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *Object;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void **v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  NSObject *v75;
  uint8_t *v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  char *v144;
  uint8_t v145[4];
  uint64_t v146;
  __int16 v147;
  uint64_t v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  uint64_t v154;
  __int16 v155;
  uint64_t v156;
  __int16 v157;
  uint64_t v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  int v162;
  __int16 v163;
  int v164;
  int v165;
  int v166;
  uint64_t v167;
  __int16 v168;
  uint64_t v169;
  __int16 v170;
  uint64_t v171;
  __int16 v172;
  uint64_t v173;
  __int16 v174;
  uint64_t v175;
  __int16 v176;
  uint64_t v177;
  __int16 v178;
  uint64_t v179;
  __int16 v180;
  uint64_t v181;
  __int16 v182;
  int v183;
  __int16 v184;
  int v185;
  uint8_t buf[4];
  CLEmergencyLocationSelector *v187;
  __int16 v188;
  uint64_t v189;
  int v190;
  uint64_t v191;

  v191 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_fInstance(self, a2, (uint64_t)a3, (uint64_t)a4))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v74 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v187 = self;
      _os_log_impl(&dword_18F5B3000, v74, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,locationManager:didUpdateLocations,self:%{private}@,nil fInstance,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    *(_DWORD *)v145 = 138477827;
    v146 = (uint64_t)self;
    v76 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector locationManager:didUpdateLocations:]", "CoreLocation: %s\n");
    goto LABEL_43;
  }
  if (!a4 || !objc_msgSend_count(a4, v6, v7, v8))
    return;
  Object = (void *)objc_msgSend_lastObject(a4, v9, v10, v11);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v13 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v187 = self;
    v188 = 2049;
    v189 = objc_msgSend_fInstance(self, v14, v15, v16);
    _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,locationManager:didUpdateLocations,self:%{private}@,fInstance:%{private}p", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    *(_DWORD *)v145 = 138478083;
    v146 = (uint64_t)self;
    v147 = 2049;
    v148 = objc_msgSend_fInstance(self, v91, v92, v93);
    v94 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector locationManager:didUpdateLocations:]", "CoreLocation: %s\n", v94);
    if (v94 != (char *)buf)
      free(v94);
  }
  v20 = (void **)objc_msgSend_fInstance(self, v17, v18, v19);
  if (!*v20)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v75 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134283521;
      v187 = (CLEmergencyLocationSelector *)v20;
      _os_log_impl(&dword_18F5B3000, v75, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,updateLocation,this:%{private}p,nil fConfig,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    *(_DWORD *)v145 = 134283521;
    v146 = (uint64_t)v20;
    v76 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "void CLEmergencyLocationSelectorInternal::updateLocation(CLLocation *)", "CoreLocation: %s\n");
LABEL_43:
    if (v76 == buf)
      return;
    goto LABEL_44;
  }
  if (Object)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v21 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend_feature(*v20, v22, v23, v24);
      v28 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v26, v25, v27);
      objc_msgSend_coordinate(Object, v29, v30, v31);
      v33 = v32;
      objc_msgSend_coordinate(Object, v34, v35, v36);
      v38 = v37;
      objc_msgSend_horizontalAccuracy(Object, v39, v40, v41);
      v43 = v42;
      objc_msgSend_altitude(Object, v44, v45, v46);
      v48 = v47;
      objc_msgSend_ellipsoidalAltitude(Object, v49, v50, v51);
      v53 = v52;
      objc_msgSend_verticalAccuracy(Object, v54, v55, v56);
      v58 = v57;
      v62 = objc_msgSend_timestamp(Object, v59, v60, v61);
      objc_msgSend_clientLocation(Object, v63, v64, v65);
      v66 = v190;
      v70 = objc_msgSend_integrity(Object, v67, v68, v69);
      *(_DWORD *)v145 = 138545667;
      v146 = v28;
      v147 = 2049;
      v148 = v33;
      v149 = 2049;
      v150 = v38;
      v151 = 2050;
      v152 = v43;
      v153 = 2049;
      v154 = v48;
      v155 = 2049;
      v156 = v53;
      v157 = 2050;
      v158 = v58;
      v159 = 2114;
      v160 = v62;
      v161 = 1026;
      v162 = v66;
      v163 = 1026;
      v164 = v70;
      _os_log_impl(&dword_18F5B3000, v21, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,updateLocation,lat,%{private}.7f,lon,%{private}.7f,hunc,%{public}f,alt,%{private}f,ellipsoidalAlt,%{private}f,vunc,%{public}f,timestamp,%{public}@,locationType,%{public}d,integrity,%{public}d", v145, 0x5Eu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v98 = objc_msgSend_feature(*v20, v95, v96, v97);
      v101 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v99, v98, v100);
      objc_msgSend_coordinate(Object, v102, v103, v104);
      v106 = v105;
      objc_msgSend_coordinate(Object, v107, v108, v109);
      v111 = v110;
      objc_msgSend_horizontalAccuracy(Object, v112, v113, v114);
      v116 = v115;
      objc_msgSend_altitude(Object, v117, v118, v119);
      v121 = v120;
      objc_msgSend_ellipsoidalAltitude(Object, v122, v123, v124);
      v126 = v125;
      objc_msgSend_verticalAccuracy(Object, v127, v128, v129);
      v131 = v130;
      v135 = objc_msgSend_timestamp(Object, v132, v133, v134);
      objc_msgSend_clientLocation(Object, v136, v137, v138);
      v139 = v165;
      v143 = objc_msgSend_integrity(Object, v140, v141, v142);
      v166 = 138545667;
      v167 = v101;
      v168 = 2049;
      v169 = v106;
      v170 = 2049;
      v171 = v111;
      v172 = 2050;
      v173 = v116;
      v174 = 2049;
      v175 = v121;
      v176 = 2049;
      v177 = v126;
      v178 = 2050;
      v179 = v131;
      v180 = 2114;
      v181 = v135;
      v182 = 1026;
      v183 = v139;
      v184 = 1026;
      v185 = v143;
      v144 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::updateLocation(CLLocation *)", "CoreLocation: %s\n", v144);
      if (v144 != (char *)buf)
        free(v144);
    }

    v20[19] = (void *)objc_msgSend_copy(Object, v71, v72, v73);
    sub_18F75276C((uint64_t)(v20 + 3), 3);
    return;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v77 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    v81 = objc_msgSend_feature(*v20, v78, v79, v80);
    v84 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v82, v81, v83);
    *(_DWORD *)buf = 138543362;
    v187 = (CLEmergencyLocationSelector *)v84;
    _os_log_impl(&dword_18F5B3000, v77, OS_LOG_TYPE_ERROR, "#CLELS,%{public}@,updateLocation,nil Location object", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v88 = objc_msgSend_feature(*v20, v85, v86, v87);
    *(_DWORD *)v145 = 138543362;
    v146 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v89, v88, v90);
    v76 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "void CLEmergencyLocationSelectorInternal::updateLocation(CLLocation *)", "CoreLocation: %s\n", (const char *)v76);
    if (v76 != buf)
LABEL_44:
      free(v76);
  }
}

- (void)fInstance
{
  return self->_fInstance;
}

- (void)setFInstance:(void *)a3
{
  self->_fInstance = a3;
}

- (CLLocationManager)fLocManager
{
  return self->_fLocManager;
}

- (void)setFLocManager:(id)a3
{
  self->_fLocManager = (CLLocationManager *)a3;
}

- (CLEmergencyLocationSelectorDelegate)fDelegate
{
  return (CLEmergencyLocationSelectorDelegate *)objc_loadWeak((id *)&self->_fDelegate);
}

- (void)setFDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_fDelegate, a3);
}

- (CLAssertion)fCleeaAssertion
{
  return self->_fCleeaAssertion;
}

- (void)setFCleeaAssertion:(id)a3
{
  self->_fCleeaAssertion = (CLAssertion *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fDelegate);
}

@end
