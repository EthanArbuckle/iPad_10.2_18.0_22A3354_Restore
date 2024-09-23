@implementation CMSpringTrackerInternal

- (CMSpringTrackerInternal)init
{
  id v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMSpringTrackerInternal;
  v2 = -[CMSpringTrackerInternal init](&v7, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMSpringTracker", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v3;
    if (v6 < 0)
      operator delete(__p[0]);
    *((_BYTE *)v2 + 24) = 0;
    *((_QWORD *)v2 + 4) = 0;
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
  }
  return (CMSpringTrackerInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMSpringTrackerInternal;
  -[CMSpringTrackerInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  uint64_t v3;

  self->fHandler = 0;
  if (self->fLocationdConnection)
  {
    v3 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (BOOL)_isTracking
{
  NSObject *fInternalQueue;
  char v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3C1CCC;
  block[3] = &unk_1E2956858;
  block[4] = &v6;
  dispatch_sync(fInternalQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_startWithHandler:(id)a3
{
  NSObject *fInternalQueue;
  _QWORD v4[6];

  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3C1F24;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_stopWithHandler:(id)a3
{
  NSObject *fInternalQueue;
  _QWORD v4[6];

  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3C21E4;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_handleStartStopResponse:(shared_ptr<CLConnectionMessage>)a3 handler:(id)a4
{
  CLConnectionMessage **var0;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *DictionaryOfClasses;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD *v19;
  NSObject *v20;
  NSObject *v21;
  char *v22;
  char *v23;
  _QWORD v24[5];
  _QWORD v25[6];
  _QWORD block[5];
  __int16 v27;
  uint8_t buf[1640];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3.var1)
  {
    var0 = (CLConnectionMessage **)a3.var0;
    v5 = (id)objc_msgSend_copy(a3.var1, a2, (uint64_t)a3.var0, (uint64_t)a3.var1, (uint64_t)a4);
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v12 = (NSSet *)objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v8, 0);
    if (*var0 && (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v12)) != 0)
    {
      v17 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v14, (uint64_t)CFSTR("CMErrorMessage"), v15, v16);
      if (v17)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = sub_18F3C2860;
        v25[3] = &unk_1E2955B38;
        v25[4] = v17;
        v25[5] = v5;
        v18 = MEMORY[0x1E0C80D38];
        v19 = v25;
      }
      else
      {
        if (qword_1EE16D978 != -1)
          dispatch_once(&qword_1EE16D978, &unk_1E29451E8);
        v21 = qword_1EE16D980;
        if (os_log_type_enabled((os_log_t)qword_1EE16D980, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_FAULT, "Error parsing start / stop response.", buf, 2u);
        }
        if (sub_18F1FCA08(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D978 != -1)
            dispatch_once(&qword_1EE16D978, &unk_1E29451E8);
          v27 = 0;
          v23 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 0, "-[CMSpringTrackerInternal _handleStartStopResponse:handler:]", "CoreLocation: %s\n", v23);
          if (v23 != (char *)buf)
            free(v23);
        }
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = sub_18F3C28DC;
        v24[3] = &unk_1E2955B10;
        v24[4] = v5;
        v18 = MEMORY[0x1E0C80D38];
        v19 = v24;
      }
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_18F3C2818;
      block[3] = &unk_1E2955B10;
      block[4] = v5;
      v18 = MEMORY[0x1E0C80D38];
      v19 = block;
    }
    dispatch_async(v18, v19);
  }
  else
  {
    if (qword_1EE16D978 != -1)
      dispatch_once(&qword_1EE16D978, &unk_1E29451E8);
    v20 = qword_1EE16D980;
    if (os_log_type_enabled((os_log_t)qword_1EE16D980, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v20, OS_LOG_TYPE_FAULT, "Error responding to start / stop tracking request, handler unavailable.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D978 != -1)
        dispatch_once(&qword_1EE16D978, &unk_1E29451E8);
      v27 = 0;
      v22 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSpringTrackerInternal _handleStartStopResponse:handler:]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)buf)
        free(v22);
    }
  }
}

- (void)_querySpringDataFromRecord:(id)a3 handler:(id)a4
{
  NSObject *fInternalQueue;
  _QWORD block[7];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3C2980;
  block[3] = &unk_1E2955BD8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(fInternalQueue, block);
}

@end
