@implementation CMSensorRecorderInternal

- (CMSensorRecorderInternal)init
{
  id v2;
  CLConnectionClient *v3;
  void *__p[2];
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMSensorRecorderInternal;
  v2 = -[CMSensorRecorderInternal init](&v7, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 1) = dispatch_queue_create("com.apple.CoreMotion.CMSensorRecorderInternal", 0);
    v3 = (CLConnectionClient *)operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 1));
    *((_QWORD *)v2 + 2) = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      v3 = (CLConnectionClient *)*((_QWORD *)v2 + 2);
    }
    CLConnectionClient::start(v3);
    dispatch_sync(*((dispatch_queue_t *)v2 + 1), &unk_1E2953088);
  }
  return (CMSensorRecorderInternal *)v2;
}

- (void)teardown
{
  NSObject *fInternalQueue;
  _QWORD block[5];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F38EBD8;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (void)dealloc
{
  objc_super v3;

  self->fInternalQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMSensorRecorderInternal;
  -[CMSensorRecorderInternal dealloc](&v3, sel_dealloc);
}

- (id)newMetaByID:(unint64_t)a3 forType:(int)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__newMetaUsingMessage_withIdentifier_forType_, "kCLConnectionMessageSensorRecorderGetMetaByID", a3, *(_QWORD *)&a4);
}

- (id)newMetaSinceID:(unint64_t)a3 forType:(int)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__newMetaUsingMessage_withIdentifier_forType_, "kCLConnectionMessageSensorRecorderGetMetaSinceID", a3, *(_QWORD *)&a4);
}

- (id)_newMetaUsingMessage:(const char *)a3 withIdentifier:(unint64_t)a4 forType:(int)a5
{
  uint64_t v5;
  CLSensorRecorderSensorMetaRequestById *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  const std::string *v20;
  objc_class *v21;
  id v22;
  NSObject *v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  char *v29;
  CLConnectionMessage *v30;
  std::__shared_weak_count *v31;
  void *__p[2];
  char v33;
  uint64_t v34;

  v5 = *(_QWORD *)&a5;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(CLSensorRecorderSensorMetaRequestById);
  objc_msgSend_setIdentifier_(v8, v9, a4, v10, v11);
  objc_msgSend_setDataType_(v8, v12, v5, v13, v14);
  v15 = (std::__shared_weak_count *)operator new(0x70uLL);
  v15->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  v15->__shared_weak_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, (char *)a3);
  MEMORY[0x19400103C](&v15[1], __p, v8);
  if (v33 < 0)
    operator delete(__p[0]);
  do
    v17 = __ldxr(p_shared_owners);
  while (__stxr(v17 + 1, p_shared_owners));
  CLConnectionClient::sendMessageSync();
  if (v15)
  {
    v18 = (unint64_t *)&v15->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  if (!v30
    || (v20 = (const std::string *)CLConnectionMessage::name(v30),
        !std::string::compare(v20, "kCLConnectionMessageError")))
  {
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v23 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_FAULT, "Error occurred while trying to retrieve accelerometer record!", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v29 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSensorRecorderInternal _newMetaUsingMessage:withIdentifier:forType:]", "CoreLocation: %s\n", v29);
      if (v29 != (char *)__p)
        free(v29);
    }
    v22 = 0;
  }
  else
  {
    v21 = (objc_class *)objc_opt_class();
    v22 = (id)CLConnectionMessage::getObjectOfClass(v30, v21);
  }
  if (v31)
  {
    v24 = (unint64_t *)&v31->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)())v31->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  if (v15)
  {
    v26 = (unint64_t *)&v15->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v22;
}

- (id)newMetaFrom:(double)a3 to:(double)a4 forType:(int)a5
{
  uint64_t v5;
  CLSensorRecorderSensorMetaRequestByDateRange *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  const std::string *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSSet *v32;
  id v33;
  NSObject *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  char *v40;
  CLConnectionMessage *v41;
  std::__shared_weak_count *v42;
  std::__shared_weak_count *v43;
  void *__p[2];
  char v45;
  uint64_t v46;

  v5 = *(_QWORD *)&a5;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(CLSensorRecorderSensorMetaRequestByDateRange);
  objc_msgSend_setStartTime_(v8, v9, v10, v11, v12, a3);
  objc_msgSend_setEndTime_(v8, v13, v14, v15, v16, a4);
  objc_msgSend_setDataType_(v8, v17, v5, v18, v19);
  v20 = (std::__shared_weak_count *)operator new(0x70uLL);
  v20->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v20->__shared_owners_;
  v20->__shared_weak_owners_ = 0;
  v20->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageSensorRecorderGetMetasByDateRange");
  MEMORY[0x19400103C](&v20[1], __p, v8);
  if (v45 < 0)
    operator delete(__p[0]);
  v43 = v20;
  do
    v22 = __ldxr(p_shared_owners);
  while (__stxr(v22 + 1, p_shared_owners));
  CLConnectionClient::sendMessageSync();
  if (v20)
  {
    v23 = (unint64_t *)&v20->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  if (!v41
    || (v25 = (const std::string *)CLConnectionMessage::name(v41),
        !std::string::compare(v25, "kCLConnectionMessageError")))
  {
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v34 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_FAULT, "Error occurred while trying to retrieve accelerometer records!", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v40 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSensorRecorderInternal newMetaFrom:to:forType:]", "CoreLocation: %s\n", v40);
      if (v40 != (char *)__p)
        free(v40);
    }
    v33 = 0;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v32 = (NSSet *)objc_msgSend_setWithObjects_(v26, v29, v27, v30, v31, v28, 0);
    v33 = (id)CLConnectionMessage::getObjectOfClasses(v41, v32);
  }
  if (v42)
  {
    v35 = (unint64_t *)&v42->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)())v42->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  if (v43)
  {
    v37 = (unint64_t *)&v43->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  return v33;
}

- (BOOL)writeSensorDataToFile:(id)a3 from:(double)a4 to:(double)a5 forType:(int)a6
{
  uint64_t v6;
  CLSensorRecorderWriteSensorDataToFileForDateRange *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  const std::string *v31;
  NSObject *v32;
  BOOL v33;
  NSObject *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  char *v40;
  char *v41;
  CLConnectionMessage *v42;
  std::__shared_weak_count *v43;
  void *__p[2];
  char v45;
  uint64_t v46;

  v6 = *(_QWORD *)&a6;
  v46 = *MEMORY[0x1E0C80C00];
  v10 = objc_alloc_init(CLSensorRecorderWriteSensorDataToFileForDateRange);
  objc_msgSend_setStartTime_(v10, v11, v12, v13, v14, a4);
  objc_msgSend_setEndTime_(v10, v15, v16, v17, v18, a5);
  objc_msgSend_setDataType_(v10, v19, v6, v20, v21);
  v22 = (std::__shared_weak_count *)operator new(0x70uLL);
  v22->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v22->__shared_owners_;
  v22->__shared_weak_owners_ = 0;
  v22->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageSensorRecorderWriteSensorDataToFileByDateRange");
  MEMORY[0x19400103C](&v22[1], __p, v10);
  if (v45 < 0)
    operator delete(__p[0]);
  objc_msgSend_fileDescriptor(a3, v24, v25, v26, v27);
  CLConnectionMessage::setFileDescriptor((CLConnectionMessage *)&v22[1]);
  do
    v28 = __ldxr(p_shared_owners);
  while (__stxr(v28 + 1, p_shared_owners));
  CLConnectionClient::sendMessageSync();
  if (v22)
  {
    v29 = (unint64_t *)&v22->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  if (!v42
    || (v31 = (const std::string *)CLConnectionMessage::name(v42),
        !std::string::compare(v31, "kCLConnectionMessageError")))
  {
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v34 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_FAULT, "Error occurred while trying to write accelerometer data to file!", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v40 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSensorRecorderInternal writeSensorDataToFile:from:to:forType:]", "CoreLocation: %s\n", v40);
      if (v40 != (char *)__p)
        free(v40);
    }
    v33 = 0;
  }
  else
  {
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v32 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_DEBUG, "Successfully wrote accelerometer data to file.", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v41 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSensorRecorderInternal writeSensorDataToFile:from:to:forType:]", "CoreLocation: %s\n", v41);
      if (v41 != (char *)__p)
        free(v41);
    }
    v33 = 1;
  }
  if (v43)
  {
    v35 = (unint64_t *)&v43->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)())v43->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  if (v22)
  {
    v37 = (unint64_t *)&v22->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  return v33;
}

- (BOOL)setSensorSampleRate:(unsigned int)a3 forType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  CLSensorRecorderSensorSampleRate *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  const std::string *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  char *v27;
  char *v28;
  CLConnectionMessage *v29;
  std::__shared_weak_count *v30;
  void *__p[2];
  char v32;
  uint64_t v33;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(CLSensorRecorderSensorSampleRate);
  objc_msgSend_setRate_(v6, v7, v5, v8, v9);
  objc_msgSend_setDataType_(v6, v10, v4, v11, v12);
  v13 = (std::__shared_weak_count *)operator new(0x70uLL);
  v13->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  v13->__shared_weak_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageSensorRecorderSetSensorSampleRate");
  MEMORY[0x19400103C](&v13[1], __p, v6);
  if (v32 < 0)
    operator delete(__p[0]);
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  CLConnectionClient::sendMessageSync();
  if (v13)
  {
    v16 = (unint64_t *)&v13->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  if (!v29
    || (v18 = (const std::string *)CLConnectionMessage::name(v29),
        !std::string::compare(v18, "kCLConnectionMessageError")))
  {
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v21 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_FAULT, "Error occurred while trying to set sensor sample rate!", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v27 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSensorRecorderInternal setSensorSampleRate:forType:]", "CoreLocation: %s\n", v27);
      if (v27 != (char *)__p)
        free(v27);
    }
    v20 = 0;
  }
  else
  {
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v19 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_INFO, "Successfully set sensor sample rate.", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v28 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSensorRecorderInternal setSensorSampleRate:forType:]", "CoreLocation: %s\n", v28);
      if (v28 != (char *)__p)
        free(v28);
    }
    v20 = 1;
  }
  if (v30)
  {
    v22 = (unint64_t *)&v30->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)())v30->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if (v13)
  {
    v24 = (unint64_t *)&v13->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return v20;
}

- (id)newDataByID:(unint64_t)a3 metaID:(unint64_t)a4 forType:(int)a5
{
  uint64_t v5;
  CLSensorRecorderSensorDataRequestById *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  const std::string *v23;
  id v24;
  NSObject *v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  char *v31;
  CLConnectionMessage *v32;
  std::__shared_weak_count *v33;
  void *__p[2];
  char v35;
  uint64_t v36;

  v5 = *(_QWORD *)&a5;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(CLSensorRecorderSensorDataRequestById);
  objc_msgSend_setIdentifier_(v8, v9, a3, v10, v11);
  objc_msgSend_setMetaIdentifier_(v8, v12, a4, v13, v14);
  objc_msgSend_setDataType_(v8, v15, v5, v16, v17);
  v18 = (std::__shared_weak_count *)operator new(0x70uLL);
  v18->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v18->__shared_owners_;
  v18->__shared_weak_owners_ = 0;
  v18->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageSensorRecorderGetDataByID");
  MEMORY[0x19400103C](&v18[1], __p, v8);
  if (v35 < 0)
    operator delete(__p[0]);
  do
    v20 = __ldxr(p_shared_owners);
  while (__stxr(v20 + 1, p_shared_owners));
  CLConnectionClient::sendMessageSync();
  if (v18)
  {
    v21 = (unint64_t *)&v18->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  if (!v32
    || (v23 = (const std::string *)CLConnectionMessage::name(v32),
        !std::string::compare(v23, "kCLConnectionMessageError")))
  {
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v25 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v25, OS_LOG_TYPE_FAULT, "Error occurred while trying to retrieve accelerometer data!", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSensorRecorderInternal newDataByID:metaID:forType:]", "CoreLocation: %s\n", v31);
      if (v31 != (char *)__p)
        free(v31);
    }
    v24 = 0;
  }
  else
  {
    v24 = (id)CLConnectionMessage::getRawPayload(v32);
  }
  if (v33)
  {
    v26 = (unint64_t *)&v33->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)())v33->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  if (v18)
  {
    v28 = (unint64_t *)&v18->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  return v24;
}

@end
