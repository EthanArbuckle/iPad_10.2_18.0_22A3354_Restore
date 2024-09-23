@implementation CMVehicleState

+ (BOOL)isAvailable
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return objc_msgSend_featureAvailability_(CMMotionUtils, v2, (uint64_t)"kCLConnectionMessageVehicleStateIsAvailable", v3, v4);
}

+ (id)mostRecentVehicleConnection
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
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
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  _QWORD *v43;
  std::__shared_weak_count *v44;
  _QWORD *v45;
  std::__shared_weak_count *v46;
  int v47;
  uint64_t v48;
  _BYTE __p[12];
  char v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = (std::__shared_weak_count *)operator new(0x70uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageVehicleStateMostRecentVehicleConnection");
  MEMORY[0x194001030](&v2[1], __p);
  if (v50 < 0)
    operator delete(*(void **)__p);
  v45 = &v2[1].__vftable;
  v46 = v2;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v13 = objc_msgSend_setWithObjects_(v4, v9, v5, v10, v11, v6, v7, v8, 0);
  v43 = &v2[1].__vftable;
  v44 = v2;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  v19 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v12, (uint64_t)&v43, v13, v14);
  v20 = v44;
  if (v44)
  {
    v21 = (unint64_t *)&v44->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (v19 && !objc_msgSend_objectForKey_(v19, v16, (uint64_t)CFSTR("CMErrorMessage"), v17, v18))
  {
    v33 = (void *)objc_msgSend_objectForKeyedSubscript_(v19, v16, (uint64_t)CFSTR("CMVehicleConnectionDataKey"), v17, v18);
  }
  else
  {
    v23 = (void *)objc_msgSend_objectForKey_(v19, v16, (uint64_t)CFSTR("CMErrorMessage"), v17, v18);
    if (objc_msgSend_intValue(v23, v24, v25, v26, v27) != 112)
    {
      if (qword_1EE16D6E0 != -1)
        dispatch_once(&qword_1EE16D6E0, &unk_1E2952E08);
      v28 = qword_1EE16D6E8;
      if (os_log_type_enabled((os_log_t)qword_1EE16D6E8, OS_LOG_TYPE_ERROR))
      {
        v32 = objc_msgSend_objectForKeyedSubscript_(v19, v29, (uint64_t)CFSTR("CMErrorMessage"), v30, v31);
        *(_DWORD *)__p = 138412290;
        *(_QWORD *)&__p[4] = v32;
        _os_log_impl(&dword_18F1DC000, v28, OS_LOG_TYPE_ERROR, "Error querying most recent vehicle connection, %@", __p, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(__p, 0x65CuLL);
        if (qword_1EE16D6E0 != -1)
          dispatch_once(&qword_1EE16D6E0, &unk_1E2952E08);
        v41 = objc_msgSend_objectForKeyedSubscript_(v19, v38, (uint64_t)CFSTR("CMErrorMessage"), v39, v40);
        v47 = 138412290;
        v48 = v41;
        v42 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "+[CMVehicleState mostRecentVehicleConnection]", "CoreLocation: %s\n", v42);
        if (v42 != __p)
          free(v42);
      }
    }
    v33 = 0;
  }
  v34 = v46;
  if (v46)
  {
    v35 = (unint64_t *)&v46->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  return v33;
}

+ (id)mostRecentInVehicle
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  BOOL v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  CMMotionTimeRange *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  id v63;
  _QWORD *v64;
  std::__shared_weak_count *v65;
  _QWORD *v66;
  std::__shared_weak_count *v67;
  int v68;
  uint64_t v69;
  _BYTE __p[12];
  char v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v2 = (std::__shared_weak_count *)operator new(0x70uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageVehicleStateMostRecentInVehicle");
  MEMORY[0x194001030](&v2[1], __p);
  if (v71 < 0)
    operator delete(*(void **)__p);
  v66 = &v2[1].__vftable;
  v67 = v2;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v11 = objc_msgSend_setWithObjects_(v4, v7, v5, v8, v9, v6, 0);
  v64 = &v2[1].__vftable;
  v65 = v2;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  v17 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v10, (uint64_t)&v64, v11, v12);
  v18 = v65;
  if (v65)
  {
    v19 = (unint64_t *)&v65->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  if (!v17 || objc_msgSend_objectForKey_(v17, v14, (uint64_t)CFSTR("CMErrorMessage"), v15, v16))
  {
    v21 = (void *)objc_msgSend_objectForKey_(v17, v14, (uint64_t)CFSTR("CMErrorMessage"), v15, v16);
    if (objc_msgSend_intValue(v21, v22, v23, v24, v25) != 112)
    {
      if (qword_1EE16D6E0 != -1)
        dispatch_once(&qword_1EE16D6E0, &unk_1E2952E08);
      v26 = qword_1EE16D6E8;
      if (os_log_type_enabled((os_log_t)qword_1EE16D6E8, OS_LOG_TYPE_ERROR))
      {
        v30 = objc_msgSend_objectForKeyedSubscript_(v17, v27, (uint64_t)CFSTR("CMErrorMessage"), v28, v29);
        *(_DWORD *)__p = 138412290;
        *(_QWORD *)&__p[4] = v30;
        _os_log_impl(&dword_18F1DC000, v26, OS_LOG_TYPE_ERROR, "Error querying most recent in vehicle data, %@", __p, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(__p, 0x65CuLL);
        if (qword_1EE16D6E0 != -1)
          dispatch_once(&qword_1EE16D6E0, &unk_1E2952E08);
        v34 = objc_msgSend_objectForKeyedSubscript_(v17, v31, (uint64_t)CFSTR("CMErrorMessage"), v32, v33);
        v68 = 138412290;
        v69 = v34;
        v35 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "+[CMVehicleState mostRecentInVehicle]", "CoreLocation: %s\n", v35);
        if (v35 != __p)
          free(v35);
      }
    }
    goto LABEL_27;
  }
  v36 = (void *)objc_msgSend_objectForKeyedSubscript_(v17, v14, (uint64_t)CFSTR("CMVehicleConnectionStartTime"), v15, v16);
  v40 = objc_msgSend_objectForKeyedSubscript_(v17, v37, (uint64_t)CFSTR("CMVehicleConnectionEndTime"), v38, v39);
  v41 = (void *)v40;
  if (v36)
    v42 = v40 == 0;
  else
    v42 = 1;
  if (v42)
  {
LABEL_27:
    v63 = 0;
    goto LABEL_28;
  }
  v47 = [CMMotionTimeRange alloc];
  objc_msgSend_doubleValue(v36, v48, v49, v50, v51);
  v53 = v52;
  objc_msgSend_doubleValue(v41, v54, v55, v56, v57);
  v63 = (id)objc_msgSend_initWithStartDate_endDate_(v47, v58, v59, v60, v61, v53, v62);
LABEL_28:
  v43 = v67;
  if (v67)
  {
    v44 = (unint64_t *)&v67->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  return v63;
}

+ (unint64_t)isVehicleBasedOnDeviceId:(id)a3 deviceType:(int)a4
{
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint8_t buf[4];
  uint64_t v55;
  _QWORD v56[2];
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  v56[0] = CFSTR("CMVehicleStateDeviceId");
  v56[1] = CFSTR("CMVehicleStateDeviceType");
  v57[0] = a3;
  v57[1] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, *(uint64_t *)&a4, *(uint64_t *)&a4, v4);
  v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v57, (uint64_t)v56, 2);
  sub_18F35C128("kCLConnectionMessageVehicleStateIsVehicle", &v51, &v49);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v13 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v8, 0);
  v47 = v49;
  v48 = v50;
  if (v50)
  {
    p_shared_owners = (unint64_t *)&v50->__shared_owners_;
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
  }
  v20 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v12, (uint64_t)&v47, v13, v14);
  v21 = v48;
  if (v48)
  {
    v22 = (unint64_t *)&v48->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  if (v20 && !objc_msgSend_objectForKey_(v20, v17, (uint64_t)CFSTR("CMErrorMessage"), v18, v19))
  {
    v33 = (void *)objc_msgSend_objectForKeyedSubscript_(v20, v24, (uint64_t)CFSTR("CMVehicleStateIsVehicle"), v25, v26);
    v32 = objc_msgSend_unsignedIntegerValue(v33, v34, v35, v36, v37);
  }
  else
  {
    if (qword_1EE16D6E0 != -1)
      dispatch_once(&qword_1EE16D6E0, &unk_1E2952E08);
    v27 = qword_1EE16D6E8;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6E8, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend_objectForKeyedSubscript_(v20, v28, (uint64_t)CFSTR("CMErrorMessage"), v29, v30);
      *(_DWORD *)buf = 138412290;
      v55 = v31;
      _os_log_impl(&dword_18F1DC000, v27, OS_LOG_TYPE_ERROR, "Error querying vehicle device status, %@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D6E0 != -1)
        dispatch_once(&qword_1EE16D6E0, &unk_1E2952E08);
      v45 = objc_msgSend_objectForKeyedSubscript_(v20, v42, (uint64_t)CFSTR("CMErrorMessage"), v43, v44);
      v52 = 138412290;
      v53 = v45;
      v46 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMVehicleState isVehicleBasedOnDeviceId:deviceType:]", "CoreLocation: %s\n", v46);
      if (v46 != (char *)buf)
        free(v46);
    }
    v32 = 0;
  }
  v38 = v50;
  if (v50)
  {
    v39 = (unint64_t *)&v50->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  return v32;
}

+ (unint64_t)vehicularState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;

  sub_18F35C258("kCLConnectionMessageVehicularState", &v36);
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v9 = objc_msgSend_setWithObjects_(v2, v5, v3, v6, v7, v4, 0);
  v34 = v36;
  v35 = v37;
  if (v37)
  {
    p_shared_owners = (unint64_t *)&v37->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  v13 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v8, (uint64_t)&v34, v9, v10);
  v17 = (void *)v13;
  v18 = v35;
  if (!v35)
    goto LABEL_8;
  v19 = (unint64_t *)&v35->__shared_owners_;
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
    if (!v17)
      goto LABEL_10;
  }
  else
  {
LABEL_8:
    if (!v13)
      goto LABEL_10;
  }
  if (!objc_msgSend_objectForKey_(v17, v14, (uint64_t)CFSTR("CMErrorMessage"), v15, v16))
  {
    v25 = (void *)objc_msgSend_objectForKeyedSubscript_(v17, v21, (uint64_t)CFSTR("CMVehicularStateKey"), v22, v23);
    v24 = objc_msgSend_unsignedIntegerValue(v25, v26, v27, v28, v29);
    goto LABEL_14;
  }
LABEL_10:
  v24 = 1;
LABEL_14:
  v30 = v37;
  if (v37)
  {
    v31 = (unint64_t *)&v37->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  return v24;
}

+ (unint64_t)vehicularHints
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v33;
  std::__shared_weak_count *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;

  sub_18F35C258("kCLConnectionMessageVehicularState", &v35);
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v9 = objc_msgSend_setWithObjects_(v2, v5, v3, v6, v7, v4, 0);
  v33 = v35;
  v34 = v36;
  if (v36)
  {
    p_shared_owners = (unint64_t *)&v36->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  v13 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v8, (uint64_t)&v33, v9, v10);
  v17 = (void *)v13;
  v18 = v34;
  if (!v34)
    goto LABEL_8;
  v19 = (unint64_t *)&v34->__shared_owners_;
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
    if (!v17)
      goto LABEL_14;
  }
  else
  {
LABEL_8:
    if (!v13)
      goto LABEL_14;
  }
  if (objc_msgSend_objectForKey_(v17, v14, (uint64_t)CFSTR("CMErrorMessage"), v15, v16))
  {
    v17 = 0;
  }
  else
  {
    v24 = (void *)objc_msgSend_objectForKeyedSubscript_(v17, v21, (uint64_t)CFSTR("CMVehicularHintsKey"), v22, v23);
    v17 = (void *)objc_msgSend_unsignedIntegerValue(v24, v25, v26, v27, v28);
  }
LABEL_14:
  v29 = v36;
  if (v36)
  {
    v30 = (unint64_t *)&v36->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  return (unint64_t)v17;
}

+ (unint64_t)vehicularOperatorState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  int v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  sub_18F35C374("kCLConnectionMessageVehicularOperatorState", &v45);
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v9 = objc_msgSend_setWithObjects_(v2, v5, v3, v6, v7, v4, 0);
  v43 = v45;
  v44 = v46;
  if (v46)
  {
    p_shared_owners = (unint64_t *)&v46->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  v16 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v8, (uint64_t)&v43, v9, v10);
  v17 = v44;
  if (v44)
  {
    v18 = (unint64_t *)&v44->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v16 && !objc_msgSend_objectForKey_(v16, v13, (uint64_t)CFSTR("CMErrorMessage"), v14, v15))
  {
    v29 = (void *)objc_msgSend_objectForKeyedSubscript_(v16, v20, (uint64_t)CFSTR("CMVehicularOperatorStateKey"), v21, v22);
    v28 = objc_msgSend_unsignedIntegerValue(v29, v30, v31, v32, v33);
  }
  else
  {
    if (qword_1EE16D6E0 != -1)
      dispatch_once(&qword_1EE16D6E0, &unk_1E2952E08);
    v23 = qword_1EE16D6E8;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6E8, OS_LOG_TYPE_FAULT))
    {
      v27 = objc_msgSend_objectForKeyedSubscript_(v16, v24, (uint64_t)CFSTR("CMErrorMessage"), v25, v26);
      *(_DWORD *)buf = 138412290;
      v50 = v27;
      _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_FAULT, "Error querying vehicular operator state, %@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D6E0 != -1)
        dispatch_once(&qword_1EE16D6E0, &unk_1E2952E08);
      v41 = objc_msgSend_objectForKeyedSubscript_(v16, v38, (uint64_t)CFSTR("CMErrorMessage"), v39, v40);
      v47 = 138412290;
      v48 = v41;
      v42 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMVehicleState vehicularOperatorState]", "CoreLocation: %s\n", v42);
      if (v42 != (char *)buf)
        free(v42);
    }
    v28 = 0;
  }
  v34 = v46;
  if (v46)
  {
    v35 = (unint64_t *)&v46->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  return v28;
}

@end
