@implementation CMNatalimeterInternal

- (CMNatalimeterInternal)init
{
  id v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMNatalimeterInternal;
  v2 = -[CMNatalimeterInternal init](&v7, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMNatalimeter", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v3;
    if (v6 < 0)
      operator delete(__p[0]);
    *((_QWORD *)v2 + 4) = 0;
    *((_BYTE *)v2 + 24) = 0;
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
  }
  return (CMNatalimeterInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMNatalimeterInternal;
  -[CMNatalimeterInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  id fHandler;
  void *fLocationdConnection;
  uint64_t v5;

  fHandler = self->fHandler;
  if (fHandler)
  {

    self->fHandler = 0;
  }
  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    v5 = MEMORY[0x194001018](fLocationdConnection, a2);
    MEMORY[0x194001438](v5, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_queryAbsoluteNatalimetryDataSinceRecord:(int64_t)a3 withHandler:(id)a4
{
  NSObject *fInternalQueue;
  _QWORD block[7];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3E9D70;
  block[3] = &unk_1E2957130;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_queryAbsoluteNatalimetryDataSinceDataRecord:(id)a3 withHandler:(id)a4
{
  NSObject *fInternalQueue;
  _QWORD block[7];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3EA014;
  block[3] = &unk_1E2955BD8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(fInternalQueue, block);
}

- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4
{
  __shared_weak_count *var1;
  CLConnectionMessage **var0;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *DictionaryOfClasses;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD v26[5];
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD block[5];

  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v14 = (NSSet *)objc_msgSend_setWithObjects_(v6, v11, v7, v12, v13, v8, v9, v10, 0);
  if (*var0 && (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v14)) != 0)
  {
    v19 = DictionaryOfClasses;
    v20 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v16, (uint64_t)CFSTR("CMErrorMessage"), v17, v18);
    v24 = objc_msgSend_objectForKeyedSubscript_(v19, v21, (uint64_t)CFSTR("CMNatalimetryNatalieDataArray"), v22, v23);
    if (v20)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = sub_18F3EA924;
      v28[3] = &unk_1E2955B60;
      v28[4] = v20;
      v28[5] = var1;
      v25 = v28;
    }
    else if (v24)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_18F3EA984;
      v27[3] = &unk_1E2955B60;
      v27[4] = v24;
      v27[5] = var1;
      v25 = v27;
    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_18F3EA998;
      v26[3] = &unk_1E2955B10;
      v26[4] = var1;
      v25 = v26;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F3EA8D8;
    block[3] = &unk_1E2955B10;
    block[4] = var1;
    v25 = block;
  }
  dispatch_async(MEMORY[0x1E0C80D38], v25);
}

- (void)_startAbsoluteNatalimetryDataUpdatesWithHandler:(id)a3
{
  NSObject *fInternalQueue;
  _QWORD v4[6];

  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3EAA3C;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_stopAbsoluteNatalimetryDataUpdates
{
  NSObject *fInternalQueue;
  _QWORD block[5];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3EB2BC;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (unint64_t)_promptsNeeded
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
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  NSObject *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  uint64_t v48;
  std::__shared_weak_count *v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  int v52;
  uint64_t v53;
  uint8_t buf[4];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  sub_18F338C98("kCLConnectionMessageNatalimetryCalibrationPromptsNeeded", &v50);
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v9 = objc_msgSend_setWithObjects_(v2, v5, v3, v6, v7, v4, 0);
  v48 = v50;
  v49 = v51;
  if (v51)
  {
    p_shared_owners = (unint64_t *)&v51->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  v13 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v8, (uint64_t)&v48, v9, v10);
  v17 = (void *)v13;
  v18 = v49;
  if (!v49)
    goto LABEL_8;
  v19 = (unint64_t *)&v49->__shared_owners_;
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
  if (v20)
  {
LABEL_8:
    if (v13)
      goto LABEL_9;
LABEL_20:
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
    v42 = qword_1EE16D6A8;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v42, OS_LOG_TYPE_ERROR, "Prompts needed response invalid.", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      goto LABEL_25;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
    LOWORD(v52) = 0;
    v41 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMNatalimeterInternal _promptsNeeded]", "CoreLocation: %s\n", v41);
    if (v41 == (char *)buf)
      goto LABEL_25;
LABEL_37:
    free(v41);
    goto LABEL_25;
  }
  ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
  std::__shared_weak_count::__release_weak(v18);
  if (!v17)
    goto LABEL_20;
LABEL_9:
  v21 = (void *)objc_msgSend_objectForKeyedSubscript_(v17, v14, (uint64_t)CFSTR("CMErrorMessage"), v15, v16);
  v25 = (void *)objc_msgSend_objectForKeyedSubscript_(v17, v22, (uint64_t)CFSTR("CMReturnCode"), v23, v24);
  if (v21)
  {
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
    v30 = qword_1EE16D6A8;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_msgSend_integerValue(v21, v31, v32, v33, v34);
      *(_DWORD *)buf = 134349056;
      v55 = v35;
      _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_ERROR, "Querying for calibration prompts encountered an error: %{public}ld.", buf, 0xCu);
    }
    if (!sub_18F1FCA08(115, 0))
      goto LABEL_25;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E2945108);
    v40 = objc_msgSend_integerValue(v21, v36, v37, v38, v39);
    v52 = 134349056;
    v53 = v40;
    v41 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMNatalimeterInternal _promptsNeeded]", "CoreLocation: %s\n", v41);
    if (v41 == (char *)buf)
      goto LABEL_25;
    goto LABEL_37;
  }
  if (v25)
  {
    v43 = objc_msgSend_unsignedIntegerValue(v25, v26, v27, v28, v29);
    goto LABEL_26;
  }
LABEL_25:
  v43 = 0;
LABEL_26:
  v44 = v51;
  if (v51)
  {
    v45 = (unint64_t *)&v51->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  return v43;
}

@end
