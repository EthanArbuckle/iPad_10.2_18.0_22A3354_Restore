@implementation CMActivityAlarmProxy

- (CMActivityAlarmProxy)init
{
  CMActivityAlarmProxy *v2;
  CMActivityAlarmProxy *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *__p;
  char v14;
  void *v15[2];
  char v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CMActivityAlarmProxy;
  v2 = -[CMActivityAlarmProxy init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->fAlarmCounter = 0;
    v2->fAlarmAvailable = 0;
    v2->fReplyQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMActivityAlarmProxyPrivateQueue", 0);
    v4 = operator new();
    sub_18F270374(v15, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v4, v15, v3->fReplyQueue);
    v3->fLocationdConnection = (void *)v4;
    if (v16 < 0)
      operator delete(v15[0]);
    v5 = objc_alloc(MEMORY[0x1E0C99E08]);
    v3->fAlarms = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v5, v6, 5, v7, v8);
    sub_18F270374(&__p, "kCLConnectionMessageActivityAlarmStart");
    CLConnectionClient::setHandlerForMessage();
    if (v14 < 0)
      operator delete(__p);
    v3->fAlarmAvailable = objc_msgSend_featureAvailability_(CMMotionUtils, v9, (uint64_t)"kCLConnectionMessageActivityAlarmAvailable", v10, v11);
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::start((CLConnectionClient *)v3->fLocationdConnection);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  objc_sync_enter(self);
  dispatch_release((dispatch_object_t)self->fReplyQueue);
  self->fReplyQueue = 0;

  self->fAlarms = 0;
  if (self->fLocationdConnection)
  {
    v3 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
  v4.receiver = self;
  v4.super_class = (Class)CMActivityAlarmProxy;
  -[CMActivityAlarmProxy dealloc](&v4, sel_dealloc);
  objc_sync_exit(self);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4AE1C4;
  block[3] = &unk_1E2955938;
  block[4] = a1;
  if (qword_1ECEDFD20 != -1)
    dispatch_once(&qword_1ECEDFD20, block);
  return (id)qword_1ECEDFD28;
}

- (BOOL)activityAlarmAvailable
{
  return (sub_18F1F7758() & 1) == 0 && self->fAlarmAvailable;
}

- (void)listenForActivityAlarm:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *fAlarms;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  NSObject *v32;
  char *v33;
  std::__shared_weak_count *v34;
  uint64_t v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  _QWORD buf[206];

  buf[205] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (objc_msgSend_activityAlarmAvailable(self, v5, v6, v7, v8))
  {
    fAlarms = self->fAlarms;
    v13 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v9, self->fAlarmCounter, v10, v11);
    objc_msgSend_setObject_forKey_(fAlarms, v14, (uint64_t)a3, v13, v15);
    sub_18F1ECEA0(buf);
    LODWORD(v35) = objc_msgSend_trigger(a3, v16, v17, v18, v19);
    objc_msgSend_duration(a3, v20, v21, v22, v23);
    v36 = v24;
    sub_18F440DC4(&self->fAlarmCounter, &v35, &v36, (uint64_t)buf);
    LOBYTE(v36) = 1;
    sub_18F36BB20((uint64_t)buf, "kCLConnectionMessageSubscribeKey", &v36);
    v35 = buf[1];
    sub_18F44DCB8("kCLConnectionMessageActivityAlarmStart", &v35, &v36);
    v34 = v37;
    if (v37)
    {
      p_shared_owners = (unint64_t *)&v37->__shared_owners_;
      do
        v26 = __ldxr(p_shared_owners);
      while (__stxr(v26 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v34)
    {
      v27 = (unint64_t *)&v34->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
    ++self->fAlarmCounter;
    v29 = v37;
    if (v37)
    {
      v30 = (unint64_t *)&v37->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    sub_18F1EDCB4(buf);
  }
  else
  {
    if (qword_1EE16D468 != -1)
      dispatch_once(&qword_1EE16D468, &unk_1E2954FC8);
    v32 = qword_1EE16D460;
    if (os_log_type_enabled((os_log_t)qword_1EE16D460, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_DEFAULT, "#Warning Was not able to listen for alarm.  Activity alarms are not available for this system.", (uint8_t *)buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D468 != -1)
        dispatch_once(&qword_1EE16D468, &unk_1E2954FC8);
      LOWORD(v36) = 0;
      v33 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMActivityAlarmProxy listenForActivityAlarm:]", "CoreLocation: %s\n", v33);
      if (v33 != (char *)buf)
        free(v33);
    }
  }
  objc_sync_exit(self);
}

- (void)stopListeningForActivityAlarm:(id)a3
{
  NSMutableDictionary *fAlarms;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
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
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  std::__shared_weak_count *v60;
  uint64_t v61;
  int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  _QWORD v68[3];
  uint64_t buf;
  _QWORD v70[204];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  fAlarms = self->fAlarms;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(fAlarms, v6, (uint64_t)&v63, (uint64_t)v71, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v64;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v64 != v11)
        objc_enumerationMutation(fAlarms);
      v13 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v12);
      if ((id)objc_msgSend_objectForKeyedSubscript_(self->fAlarms, v7, (uint64_t)v13, v8, v9) == a3)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(fAlarms, v7, (uint64_t)&v63, (uint64_t)v71, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_25;
      }
    }
    v17 = v13;
    if (!v17)
      goto LABEL_25;
    objc_msgSend_removeObjectForKey_(self->fAlarms, v14, (uint64_t)v17, v15, v16);
    sub_18F1ECEA0(&buf);
    LODWORD(v61) = objc_msgSend_intValue(v17, v18, v19, v20, v21);
    v62 = objc_msgSend_trigger(a3, v22, v23, v24, v25);
    objc_msgSend_duration(a3, v26, v27, v28, v29);
    v67 = v30;
    sub_18F440DC4(&v61, &v62, &v67, (uint64_t)&buf);
    LOBYTE(v67) = 0;
    sub_18F36BB20((uint64_t)&buf, "kCLConnectionMessageSubscribeKey", &v67);
    v61 = v70[0];
    sub_18F44DCB8("kCLConnectionMessageActivityAlarmStart", &v61, &v67);
    v60 = (std::__shared_weak_count *)v68[0];
    if (v68[0])
    {
      v31 = (unint64_t *)(v68[0] + 8);
      do
        v32 = __ldxr(v31);
      while (__stxr(v32 + 1, v31));
    }
    CLConnectionClient::sendMessage();
    if (v60)
    {
      p_shared_owners = (unint64_t *)&v60->__shared_owners_;
      do
        v34 = __ldaxr(p_shared_owners);
      while (__stlxr(v34 - 1, p_shared_owners));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
        std::__shared_weak_count::__release_weak(v60);
      }
    }

    v35 = (std::__shared_weak_count *)v68[0];
    if (v68[0])
    {
      v36 = (unint64_t *)(v68[0] + 8);
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    sub_18F1EDCB4(&buf);
  }
  else
  {
LABEL_25:
    if (qword_1EE16D468 != -1)
      dispatch_once(&qword_1EE16D468, &unk_1E2954FC8);
    v38 = qword_1EE16D460;
    if (os_log_type_enabled((os_log_t)qword_1EE16D460, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_msgSend_trigger(a3, v39, v40, v41, v42);
      objc_msgSend_duration(a3, v44, v45, v46, v47);
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v43;
      LOWORD(v70[0]) = 2048;
      *(_QWORD *)((char *)v70 + 2) = v48;
      _os_log_impl(&dword_18F1DC000, v38, OS_LOG_TYPE_DEFAULT, "#Warning Cannot unsubscribe from activity alarm (Trigger:%d, Duration:%f).  This alarm is not being listened for.", (uint8_t *)&buf, 0x12u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D468 != -1)
        dispatch_once(&qword_1EE16D468, &unk_1E2954FC8);
      v53 = objc_msgSend_trigger(a3, v49, v50, v51, v52);
      objc_msgSend_duration(a3, v54, v55, v56, v57);
      LODWORD(v67) = 67109376;
      HIDWORD(v67) = v53;
      LOWORD(v68[0]) = 2048;
      *(_QWORD *)((char *)v68 + 2) = v58;
      v59 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMActivityAlarmProxy stopListeningForActivityAlarm:]", "CoreLocation: %s\n", v59);
      if (v59 != (char *)&buf)
        free(v59);
    }
  }
  objc_sync_exit(self);
}

@end
