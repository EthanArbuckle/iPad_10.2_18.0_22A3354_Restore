@implementation CMMotionUtils

+ (int64_t)isAuthorizedForEntitlement:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int v6;

  if ((objc_msgSend_hasEntitlement_(CMMotionUtils, a2, (uint64_t)a3, v3, v4) & 1) != 0)
    return 3;
  if (TCCAccessRestricted())
    return 1;
  v6 = TCCAccessPreflight();
  if (v6)
    return 2 * (v6 == 1);
  else
    return 3;
}

+ (void)tccServiceMotionAccessAllowingMac:(BOOL)a3 block:(id)a4
{
  uint64_t v4;
  unsigned __int8 v7;
  NSObject *v8;
  char *v9;
  _QWORD block[5];
  __int16 v11;
  uint8_t buf[1640];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = atomic_load((unsigned __int8 *)&qword_1ECEDFD08);
  if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_1ECEDFD08))
  {
    qword_1ECEDFD00 = (uint64_t)dispatch_queue_create("com.apple.CoreMotion.tcc", 0);
    __cxa_guard_release(&qword_1ECEDFD08);
  }
  if ((objc_msgSend_isMotionActivityEntitled(CMMotionUtils, a2, a3, (uint64_t)a4, v4) & 1) != 0)
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
  else if (!sub_18F1F7758() || a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F4A20E8;
    block[3] = &unk_1E2955B10;
    block[4] = a4;
    dispatch_async((dispatch_queue_t)qword_1ECEDFD00, block);
  }
  else
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
    v8 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_ERROR, "API not supported on current platform.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
      v11 = 0;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMMotionUtils tccServiceMotionAccessAllowingMac:block:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf)
        free(v9);
    }
  }
}

+ (BOOL)hasEntitlement:(id)a3
{
  __SecTask *v4;
  __SecTask *v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CFTypeID v8;
  BOOL v9;
  CFErrorRef error;

  v4 = SecTaskCreateFromSelf(0);
  if (!v4)
    return 0;
  v5 = v4;
  error = 0;
  v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, (CFStringRef)a3, &error);
  if (v6)
  {
    v7 = v6;
    v8 = CFGetTypeID(v6);
    v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
    CFRelease(v7);
  }
  else
  {
    v9 = 0;
  }
  CFRelease(v5);
  return v9;
}

+ (BOOL)isMotionActivityEntitled
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_hasEntitlement_(CMMotionUtils, a2, (uint64_t)CFSTR("com.apple.locationd.activity"), v2, v3);
}

+ (void)tccServiceMotionAccessWithBlock:(id)a3
{
  ((void (*)(__objc2_class *, char *, _QWORD, id))MEMORY[0x1E0DE7D20])(CMMotionUtils, sel_tccServiceMotionAccessAllowingMac_block_, 0, a3);
}

+ (int64_t)authorizationStatus
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isAuthorizedForEntitlement_(CMMotionUtils, a2, (uint64_t)CFSTR("com.apple.locationd.activity"), v2, v3);
}

+ (id)logDirectory
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
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
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;

  v5 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, v2, v3, v4);
  v8 = (void *)objc_msgSend_URLsForDirectory_inDomains_(v5, v6, 13, 1, v7);
  v12 = (void *)objc_msgSend_objectAtIndex_(v8, v9, 0, v10, v11);
  v17 = (void *)objc_msgSend_path(v12, v13, v14, v15, v16);
  v22 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v18, v19, v20, v21);
  v27 = objc_msgSend_bundleIdentifier(v22, v23, v24, v25, v26);
  v31 = (void *)objc_msgSend_stringByAppendingPathComponent_(v17, v28, v27, v29, v30);
  return (id)objc_msgSend_stringByAppendingPathComponent_(v31, v32, (uint64_t)CFSTR("CoreMotion"), v33, v34);
}

+ (void)sendMessage:(shared_ptr<CLConnectionMessage>)a3 withReplyClasses:(id)a4 callback:(id)a5
{
  CLConnectionMessage *var0;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;

  var0 = a3.var0;
  if (qword_1ECEDFCD0 != -1)
    dispatch_once(&qword_1ECEDFCD0, &unk_1E2954148);
  v6 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v11 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v11)
  {
    v9 = (unint64_t *)&v11->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

+ (id)sendMessage:(shared_ptr<CLConnectionMessage>)a3 withReplyClassesSync:(id)a4
{
  NSSet *var1;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;
  CLConnectionMessage *v21;
  std::__shared_weak_count *v22;

  var1 = (NSSet *)a3.var1;
  v5 = (std::__shared_weak_count *)*((_QWORD *)a3.var0 + 1);
  v19 = *(_QWORD *)a3.var0;
  v20 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = objc_msgSend_sendMessageSync_(CMMotionUtils, a2, (uint64_t)&v19, (uint64_t)a3.var1, (uint64_t)a4);
  v9 = v20;
  if (v20)
  {
    v10 = (unint64_t *)&v20->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (v21)
  {
    v12 = (void *)MEMORY[0x194001B4C](v8);
    v13 = (id)CLConnectionMessage::getDictionaryOfClasses(v21, var1);
    objc_autoreleasePoolPop(v12);
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  v15 = v22;
  if (v22)
  {
    v16 = (unint64_t *)&v22->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v14;
}

+ (shared_ptr<CLConnectionMessage>)sendMessageSync:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage *var0;
  double Current;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  CLConnectionMessage *v10;
  __shared_weak_count *v11;
  NSObject *v12;
  char *v13;
  std::__shared_weak_count *v14;
  uint8_t buf[1640];
  uint64_t v16;
  shared_ptr<CLConnectionMessage> result;

  var0 = a3.var0;
  v16 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDFCE0 != -1)
    dispatch_once(&qword_1ECEDFCE0, &unk_1E2958DF0);
  Current = CFAbsoluteTimeGetCurrent();
  v5 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v14 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessageSync();
  if (v14)
  {
    v8 = (unint64_t *)&v14->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (vabdd_f64(CFAbsoluteTimeGetCurrent(), Current) > 5.0)
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
    v12 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEFAULT, "Warning: sendMessageSync failed to finish after 5 seconds", buf, 2u);
    }
    v10 = (CLConnectionMessage *)sub_18F1FCA08(115, 2);
    if ((_DWORD)v10)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
      v13 = (char *)_os_log_send_and_compose_impl();
      v10 = (CLConnectionMessage *)sub_18F419700("Generic", 1, 0, 2, "+[CMMotionUtils sendMessageSync:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf)
        free(v13);
    }
  }
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

+ (void)tccServiceMotionAccessWithLabel:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  char *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (sub_18F1F7758())
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
    v8 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_ERROR, "API not supported on current platform.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMMotionUtils tccServiceMotionAccessWithLabel:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf)
        free(v9);
    }
  }
  else
  {
    if (objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v4, v5, v6, v7))
    {
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
      v10 = off_1ECEDEE90;
      if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = a3;
        _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_FAULT, "Warning - invoking %@ on main may lead to deadlock.", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE98 != -1)
          dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
        v11 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "+[CMMotionUtils tccServiceMotionAccessWithLabel:]", "CoreLocation: %s\n", v11);
        if (v11 != (char *)buf)
          free(v11);
      }
    }
    if (qword_1EE16E860 != -1)
      dispatch_once(&qword_1EE16E860, &unk_1E2954988);
  }
}

+ (void)tccServiceMotionAccessAllowingMacWithBlock:(id)a3
{
  ((void (*)(__objc2_class *, char *, uint64_t, id))MEMORY[0x1E0DE7D20])(CMMotionUtils, sel_tccServiceMotionAccessAllowingMac_block_, 1, a3);
}

+ (BOOL)featureAvailability:(const char *)a3
{
  char v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD *v33;
  std::__shared_weak_count *v34;
  _QWORD *v35;
  std::__shared_weak_count *v36;
  void *__p[2];
  char v38;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  v5 = (std::__shared_weak_count *)operator new(0x70uLL);
  v5->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, (char *)a3);
  MEMORY[0x194001030](&v5[1], __p);
  if (v38 < 0)
    operator delete(__p[0]);
  v35 = &v5[1].__vftable;
  v36 = v5;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v14 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v12, v9, 0);
  v33 = &v5[1].__vftable;
  v34 = v5;
  do
    v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  v20 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v13, (uint64_t)&v33, v14, v15);
  v21 = v34;
  if (v34)
  {
    v22 = (unint64_t *)&v34->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = (void *)objc_msgSend_objectForKeyedSubscript_(v20, v17, (uint64_t)CFSTR("CMAvailable"), v18, v19);
  v4 = objc_msgSend_BOOLValue(v24, v25, v26, v27, v28);
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
  return v4;
}

+ (id)getExecutablePathFromPid:(int)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE buffer[4096];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (proc_pidpath(a3, buffer, 0x1000u) < 1)
    return 0;
  else
    return (id)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v3, (uint64_t)buffer, v4, v5);
}

+ (id)fileHandleForWritingToURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  id result;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
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
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  NSObject *v63;
  char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  void *v86;
  int v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  uint8_t buf[4];
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isFileURL(a3, a2, (uint64_t)a3, v3, v4) & 1) == 0)
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
    v24 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v24, OS_LOG_TYPE_ERROR, "#Notice URL must specify a file.", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
    LOWORD(v87) = 0;
    goto LABEL_38;
  }
  v10 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v6, v7, v8, v9);
  v15 = objc_msgSend_path(a3, v11, v12, v13, v14);
  if (objc_msgSend_fileExistsAtPath_(v10, v16, v15, v17, v18))
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
    v23 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_ERROR, "#Notice File already exists at URL.", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
    LOWORD(v87) = 0;
LABEL_38:
    v64 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "+[CMMotionUtils fileHandleForWritingToURL:]", "CoreLocation: %s\n", v64);
    if (v64 != (char *)buf)
      free(v64);
    return 0;
  }
  v26 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v19, v20, v21, v22);
  v31 = objc_msgSend_path(a3, v27, v28, v29, v30);
  if ((objc_msgSend_createFileAtPath_contents_attributes_(v26, v32, v31, 0, 0) & 1) == 0)
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
    v63 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v63, OS_LOG_TYPE_ERROR, "#Notice URL must point to a file path which you have access to write to.", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955268);
    LOWORD(v87) = 0;
    goto LABEL_38;
  }
  v86 = 0;
  result = (id)objc_msgSend_fileHandleForWritingToURL_error_(MEMORY[0x1E0CB3608], v33, (uint64_t)a3, (uint64_t)&v86, v34);
  if (!result || v86)
  {
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2944FE0);
    v35 = qword_1EE16D830;
    if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_ERROR))
    {
      v40 = (void *)objc_msgSend_absoluteString(a3, v36, v37, v38, v39);
      v45 = objc_msgSend_UTF8String(v40, v41, v42, v43, v44);
      v50 = (void *)objc_msgSend_description(v86, v46, v47, v48, v49);
      v55 = objc_msgSend_UTF8String(v50, v51, v52, v53, v54);
      *(_DWORD *)buf = 136446466;
      v92 = v45;
      v93 = 2082;
      v94 = v55;
      _os_log_impl(&dword_18F1DC000, v35, OS_LOG_TYPE_ERROR, "#Notice Unable to get file handle for URL %{public}s: %{public}s", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D828 != -1)
        dispatch_once(&qword_1EE16D828, &unk_1E2944FE0);
      v69 = (void *)objc_msgSend_absoluteString(a3, v65, v66, v67, v68);
      v74 = objc_msgSend_UTF8String(v69, v70, v71, v72, v73);
      v79 = (void *)objc_msgSend_description(v86, v75, v76, v77, v78);
      v84 = objc_msgSend_UTF8String(v79, v80, v81, v82, v83);
      v87 = 136446466;
      v88 = v74;
      v89 = 2082;
      v90 = v84;
      v85 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMMotionUtils fileHandleForWritingToURL:]", "CoreLocation: %s\n", v85);
      if (v85 != (char *)buf)
        free(v85);
    }
    v60 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v56, v57, v58, v59);
    objc_msgSend_removeItemAtURL_error_(v60, v61, (uint64_t)a3, 0, v62);
    return 0;
  }
  return result;
}

+ (unint64_t)copyDataFrom:(id)a3 to:(id)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t DataOfLength;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  objc_msgSend_seekToFileOffset_(a3, a2, 0, (uint64_t)a4, v4);
  objc_msgSend_seekToFileOffset_(a4, v7, 0, v8, v9);
  DataOfLength = objc_msgSend_readDataOfLength_(a3, v10, 0x2000, v11, v12);
  if (!DataOfLength)
    return 0;
  v18 = (void *)DataOfLength;
  v19 = 0;
  do
  {
    if (!objc_msgSend_length(v18, v14, v15, v16, v17))
      break;
    objc_msgSend_writeData_(a4, v20, (uint64_t)v18, v21, v22);
    v19 += objc_msgSend_length(v18, v23, v24, v25, v26);
    v18 = (void *)objc_msgSend_readDataOfLength_(a3, v27, 0x2000, v28, v29);
  }
  while (v18);
  return v19;
}

@end
