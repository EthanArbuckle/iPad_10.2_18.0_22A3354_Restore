@implementation CMSedentaryTimer_Internal

- (CMSedentaryTimer_Internal)init
{
  id v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMSedentaryTimer_Internal;
  v2 = -[CMSedentaryTimer_Internal init](&v7, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 1) = dispatch_queue_create("com.apple.CoreMotion.CMSedentaryTimer.client", 0);
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMSedentaryTimer.daemon", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 3) = v3;
    if (v6 < 0)
      operator delete(__p[0]);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 3));
  }
  return (CMSedentaryTimer_Internal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fClientQueue);
  dispatch_release((dispatch_object_t)self->fDaemonQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMSedentaryTimer_Internal;
  -[CMSedentaryTimer_Internal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  void *fLocationdConnection;

  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    MEMORY[0x194001018](fLocationdConnection, a2);
    JUMPOUT(0x194001438);
  }
}

- (BOOL)_isActive
{
  NSObject *v3;
  NSObject *fDaemonQueue;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v10;
  _QWORD block[5];
  __int16 v12;
  uint8_t buf[1640];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE98 != -1)
    dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
  v3 = off_1ECEDEE90;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _isActive.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
    v12 = 0;
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _isActive]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf)
      free(v10);
  }
  fDaemonQueue = self->fDaemonQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F34E3E8;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fDaemonQueue, block);
  return objc_msgSend_isTimerArmed(self, v5, v6, v7, v8);
}

- (void)_handleStartStopTimerResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4
{
  __shared_weak_count *var1;
  CLConnectionMessage **var0;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSSet *v13;
  void *DictionaryOfClasses;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD *v20;
  NSObject *v21;
  NSObject *fClientQueue;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD *v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  _QWORD v45[5];
  _QWORD v46[6];
  _QWORD block[5];
  __int16 v48;
  uint8_t buf[1640];
  uint64_t v50;

  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  v50 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v13 = (NSSet *)objc_msgSend_setWithObjects_(v7, v10, v8, v11, v12, v9, 0);
  if (!*var0 || (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v13)) == 0)
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
    v21 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleStartStopTimerResponse dispatching handler.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
      v48 = 0;
      v41 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleStartStopTimerResponse:withHandler:]", "CoreLocation: %s\n", v41);
      if (v41 != (char *)buf)
        free(v41);
    }
    fClientQueue = self->fClientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F34F04C;
    block[3] = &unk_1E2955B10;
    block[4] = var1;
    dispatch_async(fClientQueue, block);
    return;
  }
  v18 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v15, (uint64_t)CFSTR("CMErrorMessage"), v16, v17);
  if (v18)
  {
    v19 = self->fClientQueue;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = sub_18F34F210;
    v46[3] = &unk_1E2955B38;
    v46[4] = v18;
    v46[5] = var1;
    v20 = v46;
  }
  else
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
    v23 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_FAULT, "SedentaryAlarm,Error start / stop response.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
      v48 = 0;
      v43 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSedentaryTimer_Internal _handleStartStopTimerResponse:withHandler:]", "CoreLocation: %s\n", v43);
      if (v43 != (char *)buf)
        free(v43);
    }
    v19 = self->fClientQueue;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_18F34F41C;
    v45[3] = &unk_1E2955B10;
    v45[4] = var1;
    v20 = v45;
  }
  dispatch_async(v19, v20);
  if (objc_msgSend_intValue(v18, v24, v25, v26, v27) != 100)
    return;
  if (qword_1ECEDEE98 != -1)
    dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
  v28 = off_1ECEDEE90;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v28, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleStartStopTimerResponse CMErrorNULL.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
    v48 = 0;
    v42 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleStartStopTimerResponse:withHandler:]", "CoreLocation: %s\n", v42);
    if (v42 != (char *)buf)
      free(v42);
  }
  v29 = (_QWORD *)CLConnectionMessage::name(*var0);
  v30 = *((char *)v29 + 23);
  if (v30 < 0)
  {
    if (v29[1] != 39)
      goto LABEL_29;
    v29 = (_QWORD *)*v29;
  }
  else if (v30 != 39)
  {
LABEL_29:
    v34 = (_QWORD *)CLConnectionMessage::name(*var0);
    v35 = *((char *)v34 + 23);
    if (v35 < 0)
    {
      if (v34[1] != 38)
        return;
      v34 = (_QWORD *)*v34;
    }
    else if (v35 != 38)
    {
      return;
    }
    if (!memcmp(v34, "kCLConnectionMessageSedentaryTimerStop", 0x26uLL))
    {
      objc_msgSend_setTimerArmed_(self, v36, 0, v37, v38);
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
      v39 = off_1ECEDEE90;
      if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v39, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleStartStopTimerResponse timer is not armed.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE98 == -1)
        {
LABEL_61:
          v48 = 0;
          v44 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleStartStopTimerResponse:withHandler:]", "CoreLocation: %s\n", v44);
          if (v44 != (char *)buf)
            free(v44);
          return;
        }
LABEL_63:
        dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
        goto LABEL_61;
      }
    }
    return;
  }
  if (memcmp(v29, "kCLConnectionMessageSedentaryTimerStart", 0x27uLL))
    goto LABEL_29;
  objc_msgSend_setTimerArmed_(self, v31, 1, v32, v33);
  if (qword_1ECEDEE98 != -1)
    dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
  v40 = off_1ECEDEE90;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v40, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleStartStopTimerResponse timer is armed.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 == -1)
      goto LABEL_61;
    goto LABEL_63;
  }
}

- (void)_handleAlarmDataResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4
{
  __shared_weak_count *var1;
  CLConnectionMessage **var0;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSSet *v15;
  void *DictionaryOfClasses;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *fClientQueue;
  _QWORD *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  _QWORD v37[5];
  _QWORD v38[6];
  _QWORD v39[6];
  _QWORD block[5];
  __int16 v41;
  uint8_t buf[1640];
  uint64_t v43;

  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v15 = (NSSet *)objc_msgSend_setWithObjects_(v7, v12, v8, v13, v14, v9, v10, v11, 0);
  if (*var0 && (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v15)) != 0)
  {
    v20 = DictionaryOfClasses;
    v21 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v17, (uint64_t)CFSTR("CMErrorMessage"), v18, v19);
    v25 = objc_msgSend_objectForKeyedSubscript_(v20, v22, (uint64_t)CFSTR("CMSedentaryTimerAlarmData"), v23, v24);
    if (v21)
    {
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
      v26 = off_1ECEDEE90;
      if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v26, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleAlarmDataResponse error.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE98 != -1)
          dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
        v41 = 0;
        v34 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleAlarmDataResponse:withHandler:]", "CoreLocation: %s\n", v34);
        if (v34 != (char *)buf)
          free(v34);
      }
      fClientQueue = self->fClientQueue;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = sub_18F34FCE4;
      v39[3] = &unk_1E2955B38;
      v39[4] = v21;
      v39[5] = var1;
      v28 = v39;
    }
    else
    {
      v30 = v25;
      if (v25)
      {
        if (qword_1ECEDEE98 != -1)
          dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
        v31 = off_1ECEDEE90;
        if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v31, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleAlarmDataResponse alarmDataArray.", buf, 2u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE98 != -1)
            dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
          v41 = 0;
          v35 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleAlarmDataResponse:withHandler:]", "CoreLocation: %s\n", v35);
          if (v35 != (char *)buf)
            free(v35);
        }
        fClientQueue = self->fClientQueue;
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = sub_18F35001C;
        v38[3] = &unk_1E2955B60;
        v38[4] = v30;
        v38[5] = var1;
        v28 = v38;
      }
      else
      {
        if (qword_1ECEDEE98 != -1)
          dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
        v32 = off_1ECEDEE90;
        if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_FAULT, "SedentaryAlarm,Error parsing alarm data.", buf, 2u);
        }
        if (sub_18F1FCA08(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE98 != -1)
            dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
          v41 = 0;
          v36 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 0, "-[CMSedentaryTimer_Internal _handleAlarmDataResponse:withHandler:]", "CoreLocation: %s\n", v36);
          if (v36 != (char *)buf)
            free(v36);
        }
        fClientQueue = self->fClientQueue;
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = sub_18F3501BC;
        v37[3] = &unk_1E2955B10;
        v37[4] = var1;
        v28 = v37;
      }
    }
  }
  else
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
    v29 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v29, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleAlarmDataResponse nil response dispatching handler.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
      v41 = 0;
      v33 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleAlarmDataResponse:withHandler:]", "CoreLocation: %s\n", v33);
      if (v33 != (char *)buf)
        free(v33);
    }
    fClientQueue = self->fClientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F34FB1C;
    block[3] = &unk_1E2955B10;
    block[4] = var1;
    v28 = block;
  }
  dispatch_async(fClientQueue, v28);
}

- (void)_registerForAlarmsWithHandler:(id)a3
{
  NSObject *v3;
  char *v4;
  uint8_t buf[8];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE98 != -1)
    dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
  v3 = off_1ECEDEE90;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _registerForAlarmsWithHandler.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2955BF8);
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _registerForAlarmsWithHandler:]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf)
      free(v4);
  }
  sub_18F270374(buf, "kCLConnectionMessageSedentaryTimerAlarm");
  CLConnectionClient::setHandlerForMessage();
  if (v6 < 0)
    operator delete(*(void **)buf);
}

- (BOOL)isTimerArmed
{
  return self->_timerArmed;
}

- (void)setTimerArmed:(BOOL)a3
{
  self->_timerArmed = a3;
}

@end
