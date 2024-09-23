@implementation CMOdometer

- (CMOdometer)init
{
  CMOdometer *v2;
  CMOdometerProxy *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMOdometerProxy *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CMOdometer;
  v2 = -[CMOdometer init](&v13, sel_init);
  if (v2)
  {
    v3 = [CMOdometerProxy alloc];
    v7 = (CMOdometerProxy *)objc_msgSend_initWithOdometer_(v3, v4, (uint64_t)v2, v5, v6);
    v2->_odometerProxy = v7;
    objc_msgSend__startDaemonConnection(v7, v8, v9, v10, v11);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  objc_super v7;
  _QWORD block[5];

  v6 = *(NSObject **)(objc_msgSend_odometerProxy(self, a2, v2, v3, v4) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F39DD80;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(v6, block);

  v7.receiver = self;
  v7.super_class = (Class)CMOdometer;
  -[CMOdometer dealloc](&v7, sel_dealloc);
}

- (void)startOdometerUpdatesForActivity:(int64_t)a3 withHandler:(id)a4
{
  uint64_t v4;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v17;
  const char *v18;
  char *v19;
  char *v20;
  _QWORD block[6];
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  int v26;
  int64_t v27;
  uint8_t buf[4];
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMOdometer.mm"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      v12 = *(NSObject **)(objc_msgSend_odometerProxy(self, a2, a3, (uint64_t)a4, v4) + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_18F39E194;
      block[3] = &unk_1E2955B38;
      block[4] = self;
      block[5] = a4;
      dispatch_async(v12, block);
      return;
    }
    if (qword_1EE16D858 != -1)
      dispatch_once(&qword_1EE16D858, &unk_1E2944F20);
    v13 = qword_1EE16D860;
    if (os_log_type_enabled((os_log_t)qword_1EE16D860, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_ERROR, "#Warning Unsupported activity requested", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D858 != -1)
        dispatch_once(&qword_1EE16D858, &unk_1E2944F20);
      LOWORD(v26) = 0;
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMOdometer startOdometerUpdatesForActivity:withHandler:]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)buf)
        free(v20);
    }
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = CFSTR("Invalid CMOdometerActivity");
    v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)&v23, (uint64_t)&v22, 1);
  }
  else
  {
    if (qword_1EE16D858 != -1)
      dispatch_once(&qword_1EE16D858, &unk_1E2944F20);
    v8 = qword_1EE16D860;
    if (os_log_type_enabled((os_log_t)qword_1EE16D860, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = a3;
      _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_DEFAULT, "#Warning The requested activity %ld is not yet supported", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D858 != -1)
        dispatch_once(&qword_1EE16D858, &unk_1E2944F20);
      v26 = 134217984;
      v27 = a3;
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMOdometer startOdometerUpdatesForActivity:withHandler:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf)
        free(v19);
    }
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("The requested CMOdometerActivity is not yet supported");
    v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)&v25, (uint64_t)&v24, 1);
  }
  v15 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, (uint64_t)CFSTR("CMErrorDomain"), 109, v10);
  (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, v15);
}

- (void)stopOdometerUpdates
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  v6 = *(NSObject **)(objc_msgSend_odometerProxy(self, a2, v2, v3, v4) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F39E220;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(v6, block);
}

- (void)startCyclingWorkoutDistanceUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  int v13;
  NSObject *v14;
  uint64_t (*v15)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  uint64_t *p_block;
  void *v18;
  const char *v19;
  uint64_t block;
  uint64_t v21;

  if (!a3)
  {
    v18 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMOdometer.mm"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v11 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  v12 = atomic_load((unsigned __int8 *)&qword_1ECEDF0E8);
  if ((v12 & 1) == 0 && __cxa_guard_acquire(&qword_1ECEDF0E8))
  {
    byte_1ECEDF0E0 = _os_feature_enabled_impl();
    __cxa_guard_release(&qword_1ECEDF0E8);
  }
  v13 = byte_1ECEDF0E0;
  v14 = *(NSObject **)(objc_msgSend_odometerProxy(self, v7, v8, v9, v10) + 8);
  if (v13)
  {
    v21 = MEMORY[0x1E0C809B0];
    v15 = sub_18F39E380;
    p_block = &v21;
  }
  else
  {
    block = MEMORY[0x1E0C809B0];
    v15 = sub_18F39E3A8;
    p_block = &block;
  }
  p_block[1] = 3221225472;
  p_block[2] = (uint64_t)v15;
  p_block[3] = (uint64_t)&unk_1E2955B38;
  p_block[4] = (uint64_t)self;
  p_block[5] = (uint64_t)v11;
  dispatch_async(v14, p_block);

}

- (void)stopCyclingWorkoutDistanceUpdates
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v6;
  int v7;
  NSObject *v8;
  uint64_t (*v9)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = atomic_load((unsigned __int8 *)qword_1ECEDF0F0);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(qword_1ECEDF0F0))
  {
    byte_1ECEDF0E1 = _os_feature_enabled_impl();
    __cxa_guard_release(qword_1ECEDF0F0);
  }
  v7 = byte_1ECEDF0E1;
  v8 = *(NSObject **)(objc_msgSend_odometerProxy(self, a2, v2, v3, v4) + 8);
  if (v7)
  {
    v12 = MEMORY[0x1E0C809B0];
    v9 = sub_18F39E5AC;
    v10 = &v12;
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v9 = sub_18F39E5C4;
    v10 = &v11;
  }
  v10[1] = 3221225472;
  v10[2] = (uint64_t)v9;
  v10[3] = (uint64_t)&unk_1E2955938;
  v10[4] = (uint64_t)self;
  dispatch_sync(v8, v10);
}

- (CMOdometerDelegate)delegate
{
  return (CMOdometerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CMOdometerProxy)odometerProxy
{
  return self->_odometerProxy;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
