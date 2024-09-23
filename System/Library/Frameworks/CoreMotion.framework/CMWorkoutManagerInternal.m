@implementation CMWorkoutManagerInternal

- (CMWorkoutManagerInternal)init
{
  char *v2;
  NSObject *v3;
  uint64_t v4;
  void *v6[2];
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMWorkoutManagerInternal;
  v2 = -[CMWorkoutManagerInternal init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMWorkoutManager", v3);
    v4 = operator new();
    sub_18F270374(v6, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v4, v6, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v4;
    if (v7 < 0)
      operator delete(v6[0]);
    *((_QWORD *)v2 + 9) = 0;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 49) = 0u;
    *((_QWORD *)v2 + 10) = objc_opt_new();
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
  }
  return (CMWorkoutManagerInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMWorkoutManagerInternal;
  -[CMWorkoutManagerInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *__p;
  char v11;

  objc_msgSend__unregisterForWorkoutEvents(self, a2, v2, v3, v4);
  sub_18F270374(&__p, "kCLConnectionMessageWorkoutEvent");
  CLConnectionClient::setHandlerForMessage();
  if (v11 < 0)
    operator delete(__p);
  self->fSessionState = 0;
  objc_msgSend__setWorkout_(self, v6, 0, v7, v8);

  self->fWorkoutOverview = 0;
  self->fEnableWorkoutChangeDetection = 0;
  if (self->fLocationdConnection)
  {
    v9 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v9, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;

  self->fMuteSettings = 0;
}

- (void)_startWorkout:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ExecutablePathFromPid;
  uint64_t v10;
  NSObject *v11;
  CMWorkoutOverview *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  char *v25;
  id v26;
  int v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  pid_t v32;
  __int16 v33;
  CMWorkoutManagerInternal *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  pid_t v40;
  __int16 v41;
  CMWorkoutManagerInternal *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5, v7, v8);
  if (ExecutablePathFromPid)
  {
    v10 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v11 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v36 = a3;
      v37 = 2112;
      v38 = v10;
      v39 = 1024;
      v40 = getpid();
      v41 = 2048;
      v42 = self;
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_DEFAULT, "Workout, START, %@, %@, %d, %p", buf, 0x26u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      v27 = 138413058;
      v28 = a3;
      v29 = 2112;
      v30 = v10;
      v31 = 1024;
      v32 = getpid();
      v33 = 2048;
      v34 = self;
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _startWorkout:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf)
        free(v25);
    }
  }
  v12 = [CMWorkoutOverview alloc];
  v17 = objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v13, v14, v15, v16);
  v26 = a3;
  v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)&v26, 1, v19);
  v23 = (id)objc_msgSend_initWithOverviewId_workouts_(v12, v21, v17, v20, v22);
  objc_msgSend__beginWorkoutSession_withWorkout_enableWorkoutChangeDetection_(self, v24, (uint64_t)v23, (uint64_t)a3, 0);
}

- (void)_stopWorkout:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ExecutablePathFromPid;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  pid_t v21;
  __int16 v22;
  CMWorkoutManagerInternal *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5, v7, v8);
  if (ExecutablePathFromPid)
  {
    v13 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v14 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v17 = a3;
      v18 = 2112;
      v19 = v13;
      v20 = 1024;
      v21 = getpid();
      v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_DEFAULT, "Workout, STOP, %@, %@, %d, %p", buf, 0x26u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      getpid();
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _stopWorkout:]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf)
        free(v15);
    }
  }
  objc_msgSend__endWorkoutSession_(self, v10, (uint64_t)a3, v11, v12);
}

- (void)_setSuggestedStopTimeout:(double)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ExecutablePathFromPid;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  char *v24;
  std::__shared_weak_count *v25;
  const __CFString *v26;
  uint64_t v27;
  _BYTE v28[12];
  __int16 v29;
  pid_t v30;
  __int16 v31;
  CMWorkoutManagerInternal *v32;
  int buf;
  _BYTE buf_4[14];
  __int16 v35;
  CMWorkoutManagerInternal *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5, v7, v8);
  if (ExecutablePathFromPid)
  {
    v14 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v15 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138412802;
      *(_QWORD *)buf_4 = v14;
      *(_WORD *)&buf_4[8] = 1024;
      *(_DWORD *)&buf_4[10] = getpid();
      v35 = 2048;
      v36 = self;
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_DEFAULT, "Workout, Registering suggested stop timeout, %@, %d, %p", (uint8_t *)&buf, 0x1Cu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      *(_DWORD *)v28 = 138412802;
      *(_QWORD *)&v28[4] = v14;
      v29 = 1024;
      v30 = getpid();
      v31 = 2048;
      v32 = self;
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _setSuggestedStopTimeout:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)&buf)
        free(v24);
    }
  }
  if (self->fLocationdConnection)
  {
    v26 = CFSTR("CMWorkoutTimeout");
    v27 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v10, v11, v12, v13, a3);
    *(_QWORD *)v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)&v27, (uint64_t)&v26, 1);
    sub_18F3ED6C0("kCLConnectionMessageSetWorkoutTimeout", v28, &buf);
    v25 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v17 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    CLConnectionClient::sendMessage();
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    v21 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v22 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }
}

- (void)_userDismissedWorkoutAlert
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ExecutablePathFromPid;
  uint64_t v8;
  NSObject *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char *v17;
  std::__shared_weak_count *v18;
  int buf;
  _BYTE buf_4[14];
  __int16 v21;
  CMWorkoutManagerInternal *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v4, v3, v5, v6);
  if (ExecutablePathFromPid)
  {
    v8 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v9 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138412802;
      *(_QWORD *)buf_4 = v8;
      *(_WORD *)&buf_4[8] = 1024;
      *(_DWORD *)&buf_4[10] = getpid();
      v21 = 2048;
      v22 = self;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_DEFAULT, "Workout, User dismissed workout alert, %@, %d, %p", (uint8_t *)&buf, 0x1Cu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      getpid();
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _userDismissedWorkoutAlert]", "CoreLocation: %s\n", v17);
      if (v17 != (char *)&buf)
        free(v17);
    }
  }
  if (self->fLocationdConnection)
  {
    sub_18F3ED7F0("kCLConnectionMessageUserDismissedWorkoutAlert", &buf);
    v18 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v10 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    CLConnectionClient::sendMessage();
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v14 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v15 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
}

- (void)_triggerWorkoutLocationUpdateForTesting:(int64_t)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ExecutablePathFromPid;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  char *v25;
  const __CFString *v26;
  uint64_t v27;
  _BYTE v28[22];
  __int16 v29;
  pid_t v30;
  __int16 v31;
  CMWorkoutManagerInternal *v32;
  _BYTE buf[12];
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  pid_t v37;
  __int16 v38;
  CMWorkoutManagerInternal *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5, v7, v8);
  if (ExecutablePathFromPid)
  {
    v13 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v14 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = a3;
      v34 = 2112;
      v35 = v13;
      v36 = 1024;
      v37 = getpid();
      v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_DEFAULT, "Workout, SET LOCATION FOR TESTING, %zd, %@, %d, %p", buf, 0x26u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      *(_DWORD *)v28 = 134218754;
      *(_QWORD *)&v28[4] = a3;
      *(_WORD *)&v28[12] = 2112;
      *(_QWORD *)&v28[14] = v13;
      v29 = 1024;
      v30 = getpid();
      v31 = 2048;
      v32 = self;
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _triggerWorkoutLocationUpdateForTesting:]", "CoreLocation: %s\n", v25);
      if (v25 != buf)
        free(v25);
    }
  }
  if (self->fLocationdConnection)
  {
    v26 = CFSTR("CMWorkoutTriggerWorkoutLocationEventForTesting");
    v27 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v10, a3, v11, v12);
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)&v27, (uint64_t)&v26, 1);
    v17 = (std::__shared_weak_count *)operator new(0x70uLL);
    v17->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    v17->__shared_weak_owners_ = 0;
    v17->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
    sub_18F270374(buf, "kCLConnectionMessageTriggerWorkoutLocationEventForTesting");
    MEMORY[0x19400103C](&v17[1], buf, v16);
    if (SHIBYTE(v36) < 0)
      operator delete(*(void **)buf);
    *(_QWORD *)v28 = v17 + 1;
    *(_QWORD *)&v28[8] = v17;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
    CLConnectionClient::sendMessage();
    if (v17)
    {
      v20 = (unint64_t *)&v17->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v22 = *(std::__shared_weak_count **)&v28[8];
    if (*(_QWORD *)&v28[8])
    {
      v23 = (unint64_t *)(*(_QWORD *)&v28[8] + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
}

- (void)_handleDaemonResponse:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  CMWorkout *fWorkout;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  CMWorkout *v39;
  const char *v40;
  const char *v41;
  char *v42;
  uint8_t buf[4];
  _DWORD v44[411];

  *(_QWORD *)&v44[409] = *MEMORY[0x1E0C80C00];
  if (self->fDelegate)
  {
    if (a3)
    {
      if (!objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)CFSTR("CMErrorMessage"), v3, v4))
        return;
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v7, (uint64_t)CFSTR("CMErrorMessage"), v8, v9);
      v16 = objc_msgSend_integerValue(v11, v12, v13, v14, v15);
      v18 = objc_msgSend_errorWithDomain_code_userInfo_(v10, v17, (uint64_t)CFSTR("CMErrorDomain"), v16, 0);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      v19 = qword_1EE16D880;
      if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v20, (uint64_t)CFSTR("CMErrorMessage"), v21, v22);
        v28 = objc_msgSend_intValue(v23, v24, v25, v26, v27);
        fWorkout = self->fWorkout;
        *(_DWORD *)buf = 67109378;
        v44[0] = v28;
        LOWORD(v44[1]) = 2112;
        *(_QWORD *)((char *)&v44[1] + 2) = fWorkout;
        _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_ERROR, "Workout, Error, %d, %@", buf, 0x12u);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_17;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      v33 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v30, (uint64_t)CFSTR("CMErrorMessage"), v31, v32);
      objc_msgSend_intValue(v33, v34, v35, v36, v37);
    }
    else
    {
      v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("CMErrorDomain"), 103, 0);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      v38 = qword_1EE16D880;
      if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_FAULT))
      {
        v39 = self->fWorkout;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v44 = v39;
        _os_log_impl(&dword_18F1DC000, v38, OS_LOG_TYPE_FAULT, "Workout, nil event dictionary, %@", buf, 0xCu);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_17;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    }
    v42 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _handleDaemonResponse:]", "CoreLocation: %s\n", v42);
    if (v42 != (char *)buf)
      free(v42);
LABEL_17:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_workoutManager_didFailWorkout_withError_(self->fDelegate, v40, (uint64_t)self->fSender, (uint64_t)self->fWorkout, v18);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_workoutManagerDidFail_workout_error_(self->fDelegate, v41, (uint64_t)self->fSender, (uint64_t)self->fWorkout, v18);
    }
  }
}

- (void)_handleDaemonEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  char v33;
  CMWorkoutManagerDelegate *fDelegate;
  CMWorkoutManager *fSender;
  CMWorkout *v36;
  NSObject *v37;
  CMWorkout *fWorkout;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  NSObject *v63;
  const char *v64;
  NSObject *v65;
  CMWorkout *v66;
  char v67;
  const char *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  CMWorkoutManagerDelegate *v83;
  CMWorkoutManager *v84;
  uint64_t v85;
  const char *v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  CMWorkoutManagerDelegate *v101;
  CMWorkoutManager *v102;
  uint64_t v103;
  const char *v104;
  int isReminderAllowedForType;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  CMWorkoutManagerDelegate *v122;
  CMWorkoutManager *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  NSObject *v127;
  const char *v128;
  NSObject *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  NSObject *v162;
  char *v163;
  NSObject *v164;
  const char *v165;
  uint64_t v166;
  NSObject *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  NSObject *v172;
  const char *v173;
  NSObject *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  NSObject *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  NSObject *v184;
  const char *v185;
  NSObject *v186;
  const char *v187;
  int v188;
  NSObject *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  CMWorkoutManager *v203;
  CMWorkoutManagerDelegate *v204;
  uint64_t v205;
  const char *v206;
  NSObject *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  CMWorkoutManager *v222;
  CMWorkoutManagerDelegate *v223;
  uint64_t v224;
  const char *v225;
  NSObject *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *started;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  CMWorkoutManager *v241;
  CMWorkoutManagerDelegate *v242;
  uint64_t v243;
  const char *v244;
  const char *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  CMWorkoutManager *v249;
  CMWorkoutManagerDelegate *v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  CMWorkoutManager *v255;
  CMWorkoutManagerDelegate *v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  CMWorkoutManager *v261;
  CMWorkoutManagerDelegate *v262;
  uint64_t v263;
  const char *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  CMWorkoutManager *v268;
  CMWorkoutManagerDelegate *v269;
  uint64_t v270;
  const char *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  CMWorkoutManager *v276;
  CMWorkoutManagerDelegate *v277;
  uint64_t v278;
  const char *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  char *v288;
  char *v289;
  char *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  char *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  char *v309;
  char *v310;
  char *v311;
  char *v312;
  char *v313;
  char *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  char *v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  char *v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  char *v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  char *v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  char *v361;
  char *v362;
  char *v363;
  uint8_t buf[4];
  _BYTE v365[18];
  __int16 v366;
  int v367;
  uint64_t v368;

  v368 = *MEMORY[0x1E0C80C00];
  if (!self->fDelegate)
    return;
  if (!a3)
  {
    v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("CMErrorDomain"), 103, 0);
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v37 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_FAULT))
    {
      fWorkout = self->fWorkout;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v365 = fWorkout;
      _os_log_impl(&dword_18F1DC000, v37, OS_LOG_TYPE_FAULT, "Workout, nil event dictionary, %@", buf, 0xCu);
    }
    if (!sub_18F1FCA08(115, 0))
      goto LABEL_35;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D878 == -1)
      goto LABEL_192;
LABEL_253:
    dispatch_once(&qword_1EE16D878, &unk_1E2954608);
LABEL_192:
    v289 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v289);
    if (v289 != (char *)buf)
      free(v289);
    goto LABEL_35;
  }
  if (objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)CFSTR("CMErrorMessage"), v3, v4))
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v7, (uint64_t)CFSTR("CMErrorMessage"), v8, v9);
    v16 = objc_msgSend_integerValue(v11, v12, v13, v14, v15);
    v18 = objc_msgSend_errorWithDomain_code_userInfo_(v10, v17, (uint64_t)CFSTR("CMErrorDomain"), v16, 0);
    v22 = objc_msgSend_objectForKeyedSubscript_(a3, v19, (uint64_t)CFSTR("CMWorkoutAttributes"), v20, v21);
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v23 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v24, (uint64_t)CFSTR("CMErrorMessage"), v25, v26);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v365 = objc_msgSend_intValue(v27, v28, v29, v30, v31);
      *(_WORD *)&v365[4] = 2112;
      *(_QWORD *)&v365[6] = v22;
      _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_ERROR, "Workout, ERROR, %d, %@", buf, 0x12u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      v283 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v280, (uint64_t)CFSTR("CMErrorMessage"), v281, v282);
      objc_msgSend_intValue(v283, v284, v285, v286, v287);
      v288 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v288);
      if (v288 != (char *)buf)
        free(v288);
    }
    v33 = objc_opt_respondsToSelector();
    fDelegate = self->fDelegate;
    if ((v33 & 1) != 0)
    {
      fSender = self->fSender;
      v36 = (CMWorkout *)v22;
LABEL_37:
      objc_msgSend_workoutManager_didFailWorkout_withError_(fDelegate, v32, (uint64_t)fSender, (uint64_t)v36, v18);
      return;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend_workoutManagerDidFail_workout_error_(self->fDelegate, v64, (uint64_t)self->fSender, v22, v18);
    return;
  }
  if (objc_msgSend_objectForKeyedSubscript_(a3, v7, (uint64_t)CFSTR("CMReturnCode"), v8, v9)
    && objc_msgSend_objectForKeyedSubscript_(a3, v39, (uint64_t)CFSTR("CMWorkoutAttributes"), v40, v41))
  {
    v44 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v39, (uint64_t)CFSTR("CMReturnCode"), v42, v43);
    v49 = objc_msgSend_integerValue(v44, v45, v46, v47, v48);
    v53 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v50, (uint64_t)CFSTR("CMWorkoutAttributes"), v51, v52);
    v57 = objc_msgSend_objectForKeyedSubscript_(a3, v54, (uint64_t)CFSTR("CMWorkoutOverviewData"), v55, v56);
    v61 = v57;
    switch(v49)
    {
      case 2uLL:
        if (!objc_msgSend_objectForKeyedSubscript_(a3, v58, (uint64_t)CFSTR("CMWorkoutEventDate"), v59, v60))
          goto LABEL_66;
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v69 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          v73 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v70, (uint64_t)CFSTR("CMWorkoutEventDate"), v71, v72);
          objc_msgSend_timeIntervalSinceReferenceDate(v73, v74, v75, v76, v77);
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v365 = v78;
          *(_WORD *)&v365[8] = 2112;
          *(_QWORD *)&v365[10] = v53;
          _os_log_impl(&dword_18F1DC000, v69, OS_LOG_TYPE_DEFAULT, "Workout, WILL PAUSE at %f, %@", buf, 0x16u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v327 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v324, (uint64_t)CFSTR("CMWorkoutEventDate"), v325, v326);
          objc_msgSend_timeIntervalSinceReferenceDate(v327, v328, v329, v330, v331);
          v332 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v332);
          if (v332 != (char *)buf)
            free(v332);
        }
        v79 = objc_opt_respondsToSelector();
        v83 = self->fDelegate;
        if ((v79 & 1) != 0)
        {
          v84 = self->fSender;
          v85 = objc_msgSend_objectForKeyedSubscript_(a3, v80, (uint64_t)CFSTR("CMWorkoutEventDate"), v81, v82);
          objc_msgSend_workoutManager_willPauseWorkout_atDate_(v83, v86, (uint64_t)v84, (uint64_t)v53, v85);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v262 = self->fDelegate;
          v261 = self->fSender;
          v263 = objc_msgSend_objectForKeyedSubscript_(a3, v258, (uint64_t)CFSTR("CMWorkoutEventDate"), v259, v260);
          objc_msgSend_workoutManagerWillPauseWorkout_workout_pauseDate_(v262, v264, (uint64_t)v261, (uint64_t)v53, v263);
        }
        break;
      case 3uLL:
        if (!objc_msgSend_objectForKeyedSubscript_(a3, v58, (uint64_t)CFSTR("CMWorkoutEventDate"), v59, v60))
          goto LABEL_66;
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v87 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          v91 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v88, (uint64_t)CFSTR("CMWorkoutEventDate"), v89, v90);
          objc_msgSend_timeIntervalSinceReferenceDate(v91, v92, v93, v94, v95);
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v365 = v96;
          *(_WORD *)&v365[8] = 2112;
          *(_QWORD *)&v365[10] = v53;
          _os_log_impl(&dword_18F1DC000, v87, OS_LOG_TYPE_DEFAULT, "Workout, WILL RESUME at %f, %@", buf, 0x16u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v336 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v333, (uint64_t)CFSTR("CMWorkoutEventDate"), v334, v335);
          objc_msgSend_timeIntervalSinceReferenceDate(v336, v337, v338, v339, v340);
          v341 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v341);
          if (v341 != (char *)buf)
            free(v341);
        }
        v97 = objc_opt_respondsToSelector();
        v101 = self->fDelegate;
        if ((v97 & 1) != 0)
        {
          v102 = self->fSender;
          v103 = objc_msgSend_objectForKeyedSubscript_(a3, v98, (uint64_t)CFSTR("CMWorkoutEventDate"), v99, v100);
          objc_msgSend_workoutManager_willResumeWorkout_atDate_(v101, v104, (uint64_t)v102, (uint64_t)v53, v103);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v269 = self->fDelegate;
          v268 = self->fSender;
          v270 = objc_msgSend_objectForKeyedSubscript_(a3, v265, (uint64_t)CFSTR("CMWorkoutEventDate"), v266, v267);
          objc_msgSend_workoutManagerWillResumeWorkout_workout_resumeDate_(v269, v271, (uint64_t)v268, (uint64_t)v53, v270);
        }
        break;
      case 4uLL:
        isReminderAllowedForType = objc_msgSend__isReminderAllowedForType_(self, v58, 2, v59, v60);
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v106 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          v111 = (void *)objc_msgSend_endDate(v53, v107, v108, v109, v110);
          objc_msgSend_timeIntervalSinceReferenceDate(v111, v112, v113, v114, v115);
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)v365 = v116;
          *(_WORD *)&v365[8] = 2112;
          *(_QWORD *)&v365[10] = v53;
          v366 = 1024;
          v367 = isReminderAllowedForType;
          _os_log_impl(&dword_18F1DC000, v106, OS_LOG_TYPE_DEFAULT, "Workout, SUGGESTED STOP at %f, %@, allowed %d", buf, 0x1Cu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v295 = (void *)objc_msgSend_endDate(v53, v291, v292, v293, v294);
          objc_msgSend_timeIntervalSinceReferenceDate(v295, v296, v297, v298, v299);
          v300 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v300);
          if (v300 != (char *)buf)
            free(v300);
        }
        if (isReminderAllowedForType)
        {
          v117 = objc_opt_respondsToSelector();
          v122 = self->fDelegate;
          if ((v117 & 1) != 0)
          {
            v123 = self->fSender;
            v124 = objc_msgSend_endDate(v53, v118, v119, v120, v121);
            objc_msgSend_workoutManager_suggestedStopWorkout_atDate_(v122, v125, (uint64_t)v123, (uint64_t)v53, v124);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v277 = self->fDelegate;
            v276 = self->fSender;
            v278 = objc_msgSend_endDate(v53, v272, v273, v274, v275);
            objc_msgSend_workoutManagerSuggestedStop_workout_stopDate_(v277, v279, (uint64_t)v276, (uint64_t)v53, v278);
          }
        }
        break;
      case 6uLL:
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v129 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          v133 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v130, (uint64_t)CFSTR("CMWorkoutEventDate"), v131, v132);
          objc_msgSend_timeIntervalSinceReferenceDate(v133, v134, v135, v136, v137);
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v365 = v138;
          *(_WORD *)&v365[8] = 2112;
          *(_QWORD *)&v365[10] = v53;
          _os_log_impl(&dword_18F1DC000, v129, OS_LOG_TYPE_DEFAULT, "Workout, PREDICTION START DID MUTE at %f, %@", buf, 0x16u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v142 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v139, (uint64_t)CFSTR("CMWorkoutEventDate"), v140, v141);
          objc_msgSend_timeIntervalSinceReferenceDate(v142, v143, v144, v145, v146);
          goto LABEL_95;
        }
        break;
      case 7uLL:
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v147 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          v151 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v148, (uint64_t)CFSTR("CMWorkoutEventDate"), v149, v150);
          objc_msgSend_timeIntervalSinceReferenceDate(v151, v152, v153, v154, v155);
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v365 = v156;
          *(_WORD *)&v365[8] = 2112;
          *(_QWORD *)&v365[10] = v53;
          _os_log_impl(&dword_18F1DC000, v147, OS_LOG_TYPE_DEFAULT, "Workout, LOCATION DID UPDATE at %f, %@", buf, 0x16u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v304 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v301, (uint64_t)CFSTR("CMWorkoutEventDate"), v302, v303);
          objc_msgSend_timeIntervalSinceReferenceDate(v304, v305, v306, v307, v308);
          v309 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v309);
          if (v309 != (char *)buf)
            free(v309);
        }
        objc_msgSend__setWorkout_(self, v157, (uint64_t)v53, v158, v159);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend_workoutManager_workoutLocationEventUpdate_(self->fDelegate, v160, (uint64_t)self->fSender, (uint64_t)v53, v161);
        break;
      case 8uLL:
      case 0xAuLL:
      case 0xBuLL:
        v62 = objc_msgSend__isReminderAllowedForType_(self, v58, 0, v59, v60);
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v63 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)v365 = v49;
          *(_WORD *)&v365[8] = 2112;
          *(_QWORD *)&v365[10] = v53;
          v366 = 1024;
          v367 = v62;
          _os_log_impl(&dword_18F1DC000, v63, OS_LOG_TYPE_DEFAULT, "Workout, PREDICTION, event %lu, %@, allowed %d", buf, 0x1Cu);
        }
        if (!sub_18F1FCA08(115, 2))
          goto LABEL_102;
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D878 != -1)
          goto LABEL_255;
        goto LABEL_207;
      case 9uLL:
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v162 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v365 = v53;
          _os_log_impl(&dword_18F1DC000, v162, OS_LOG_TYPE_DEFAULT, "Workout, (internal only) PREDICTION UPDATE, %@", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
LABEL_95:
          v163 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v163);
          if (v163 != (char *)buf)
            free(v163);
        }
        break;
      case 0xCuLL:
        v62 = objc_msgSend__isReminderAllowedForType_(self, v58, 2, v59, v60);
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v164 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)v365 = 12;
          *(_WORD *)&v365[8] = 2112;
          *(_QWORD *)&v365[10] = v53;
          v366 = 1024;
          v367 = v62;
          _os_log_impl(&dword_18F1DC000, v164, OS_LOG_TYPE_DEFAULT, "Workout, STOP RETRACTION, event %lu, %@, allowed %d", buf, 0x1Cu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
LABEL_255:
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
LABEL_207:
          v310 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v310);
          if (v310 != (char *)buf)
            free(v310);
        }
LABEL_102:
        if (v62 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend_workoutManager_issuedPrediction_(self->fDelegate, v165, (uint64_t)self->fSender, (uint64_t)v53, v166);
        break;
      case 0xDuLL:
        if (v57 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v186 = qword_1EE16D880;
          if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v365 = v53;
            _os_log_impl(&dword_18F1DC000, v186, OS_LOG_TYPE_DEFAULT, "Workout, SESSION DID BEGIN, %@", buf, 0xCu);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE16D878 != -1)
              dispatch_once(&qword_1EE16D878, &unk_1E2954608);
            v363 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v363);
            if (v363 != (char *)buf)
              free(v363);
          }
          objc_msgSend_workoutManager_didBeginWorkoutSessionWithWorkout_withOverview_(self->fDelegate, v187, (uint64_t)self->fSender, (uint64_t)v53, v61);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v226 = qword_1EE16D880;
          if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
          {
            started = (void *)objc_msgSend_startDate(v53, v227, v228, v229, v230);
            objc_msgSend_timeIntervalSinceReferenceDate(started, v232, v233, v234, v235);
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)v365 = v236;
            *(_WORD *)&v365[8] = 2112;
            *(_QWORD *)&v365[10] = v53;
            _os_log_impl(&dword_18F1DC000, v226, OS_LOG_TYPE_DEFAULT, "Workout, DID START at %f, %@", buf, 0x16u);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE16D878 != -1)
              dispatch_once(&qword_1EE16D878, &unk_1E2954608);
            v356 = (void *)objc_msgSend_startDate(v53, v352, v353, v354, v355);
            objc_msgSend_timeIntervalSinceReferenceDate(v356, v357, v358, v359, v360);
            v361 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v361);
            if (v361 != (char *)buf)
              free(v361);
          }
          v242 = self->fDelegate;
          v241 = self->fSender;
          v243 = objc_msgSend_startDate(v53, v237, v238, v239, v240);
          objc_msgSend_workoutManager_didStartWorkout_atDate_(v242, v244, (uint64_t)v241, (uint64_t)v53, v243);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v256 = self->fDelegate;
          v255 = self->fSender;
          v257 = objc_msgSend_objectForKeyedSubscript_(a3, v252, (uint64_t)CFSTR("CMWorkoutEventDate"), v253, v254);
          MEMORY[0x1E0DE7D20](v256, sel_workoutManagerDidStartWorkout_workout_startDate_, v255, v53, v257);
        }
        break;
      case 0xEuLL:
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v167 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v365 = v53;
          _os_log_impl(&dword_18F1DC000, v167, OS_LOG_TYPE_DEFAULT, "Workout, SET CURRENT TYPE, %@", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v311 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v311);
          if (v311 != (char *)buf)
            free(v311);
        }
        if (v61)
        {
          objc_msgSend__setWorkout_(self, v168, (uint64_t)v53, v169, v170);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend_workoutManager_didSetCurrentWorkoutType_withOverview_(self->fDelegate, v171, (uint64_t)self->fSender, (uint64_t)v53, v61);
        }
        break;
      case 0xFuLL:
        if (v57 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v172 = qword_1EE16D880;
          if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v365 = v53;
            _os_log_impl(&dword_18F1DC000, v172, OS_LOG_TYPE_DEFAULT, "Workout, SESSION DID END, %@", buf, 0xCu);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE16D878 != -1)
              dispatch_once(&qword_1EE16D878, &unk_1E2954608);
            v362 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v362);
            if (v362 != (char *)buf)
              free(v362);
          }
          objc_msgSend_workoutManager_didEndWorkoutSessionWithWorkout_withOverview_(self->fDelegate, v173, (uint64_t)self->fSender, (uint64_t)v53, v61);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v207 = qword_1EE16D880;
          if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
          {
            v212 = (void *)objc_msgSend_endDate(v53, v208, v209, v210, v211);
            objc_msgSend_timeIntervalSinceReferenceDate(v212, v213, v214, v215, v216);
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)v365 = v217;
            *(_WORD *)&v365[8] = 2112;
            *(_QWORD *)&v365[10] = v53;
            _os_log_impl(&dword_18F1DC000, v207, OS_LOG_TYPE_DEFAULT, "Workout, DID STOP at %f, %@", buf, 0x16u);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE16D878 != -1)
              dispatch_once(&qword_1EE16D878, &unk_1E2954608);
            v346 = (void *)objc_msgSend_endDate(v53, v342, v343, v344, v345);
            objc_msgSend_timeIntervalSinceReferenceDate(v346, v347, v348, v349, v350);
            v351 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v351);
            if (v351 != (char *)buf)
              free(v351);
          }
          v223 = self->fDelegate;
          v222 = self->fSender;
          v224 = objc_msgSend_endDate(v53, v218, v219, v220, v221);
          objc_msgSend_workoutManager_didStopWorkout_atDate_(v223, v225, (uint64_t)v222, (uint64_t)v53, v224);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v250 = self->fDelegate;
          v249 = self->fSender;
          v251 = objc_msgSend_objectForKeyedSubscript_(a3, v246, (uint64_t)CFSTR("CMWorkoutEventDate"), v247, v248);
          MEMORY[0x1E0DE7D20](v250, sel_workoutManagerDidStopWorkout_workout_stopDate_, v249, v53, v251);
        }
        break;
      case 0x10uLL:
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v174 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v365 = v53;
          _os_log_impl(&dword_18F1DC000, v174, OS_LOG_TYPE_DEFAULT, "Workout, PAUSED, %@", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v312 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v312);
          if (v312 != (char *)buf)
            free(v312);
        }
        if (v61)
        {
          objc_msgSend__setWorkout_(self, v175, (uint64_t)v53, v176, v177);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend_workoutManager_didPauseWorkout_withOverview_(self->fDelegate, v178, (uint64_t)self->fSender, (uint64_t)v53, v61);
        }
        break;
      case 0x11uLL:
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v179 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v365 = v53;
          _os_log_impl(&dword_18F1DC000, v179, OS_LOG_TYPE_DEFAULT, "Workout, RESUMED, %@", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v313 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v313);
          if (v313 != (char *)buf)
            free(v313);
        }
        if (v61)
        {
          objc_msgSend__setWorkout_(self, v180, (uint64_t)v53, v181, v182);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend_workoutManager_didResumeWorkout_withOverview_(self->fDelegate, v183, (uint64_t)self->fSender, (uint64_t)v53, v61);
        }
        break;
      case 0x12uLL:
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v184 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v365 = v53;
          _os_log_impl(&dword_18F1DC000, v184, OS_LOG_TYPE_DEFAULT, "Workout, DETECTED CHANGE, %@", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v314 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v314);
          if (v314 != (char *)buf)
            free(v314);
        }
        if (v61 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend_workoutManager_detectedChangeInWorkoutType_withOverview_(self->fDelegate, v185, (uint64_t)self->fSender, (uint64_t)v53, v61);
        break;
      case 0x16uLL:
        v188 = objc_msgSend__isReminderAllowedForType_(self, v58, 1, v59, v60);
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954608);
        v189 = qword_1EE16D880;
        if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
        {
          v193 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v190, (uint64_t)CFSTR("CMWorkoutEventDate"), v191, v192);
          objc_msgSend_timeIntervalSinceReferenceDate(v193, v194, v195, v196, v197);
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)v365 = v198;
          *(_WORD *)&v365[8] = 2112;
          *(_QWORD *)&v365[10] = v53;
          v366 = 1024;
          v367 = v188;
          _os_log_impl(&dword_18F1DC000, v189, OS_LOG_TYPE_DEFAULT, "Workout, RESUME SUGGESTION at %f, %@, allowed %d", buf, 0x1Cu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v318 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v315, (uint64_t)CFSTR("CMWorkoutEventDate"), v316, v317);
          objc_msgSend_timeIntervalSinceReferenceDate(v318, v319, v320, v321, v322);
          v323 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v323);
          if (v323 != (char *)buf)
            free(v323);
        }
        if (v188 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v204 = self->fDelegate;
          v203 = self->fSender;
          v205 = objc_msgSend_startDate(v53, v199, v200, v201, v202);
          objc_msgSend_workoutManager_suggestedResumeWorkout_atDate_(v204, v206, (uint64_t)v203, (uint64_t)v53, v205);
        }
        break;
      default:
        if (v49 >= 2)
        {
LABEL_66:
          v126 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v58, (uint64_t)CFSTR("CMErrorDomain"), 103, 0);
          if (qword_1EE16D878 != -1)
            dispatch_once(&qword_1EE16D878, &unk_1E2954608);
          v127 = qword_1EE16D880;
          if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v365 = v53;
            *(_WORD *)&v365[8] = 2048;
            *(_QWORD *)&v365[10] = v49;
            _os_log_impl(&dword_18F1DC000, v127, OS_LOG_TYPE_FAULT, "Workout, Unrecognized event, %@, %ld", buf, 0x16u);
          }
          if (sub_18F1FCA08(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE16D878 != -1)
              dispatch_once(&qword_1EE16D878, &unk_1E2954608);
            v290 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v290);
            if (v290 != (char *)buf)
              free(v290);
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend_workoutManager_didFailWorkout_withError_(self->fDelegate, v128, (uint64_t)self->fSender, (uint64_t)v53, v126);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend_workoutManagerDidFail_workout_error_(self->fDelegate, v245, (uint64_t)self->fSender, (uint64_t)v53, v126);
          }
        }
        break;
    }
    return;
  }
  v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v39, (uint64_t)CFSTR("CMErrorDomain"), 103, 0);
  if (qword_1EE16D878 != -1)
    dispatch_once(&qword_1EE16D878, &unk_1E2954608);
  v65 = qword_1EE16D880;
  if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_FAULT))
  {
    v66 = self->fWorkout;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v365 = v66;
    _os_log_impl(&dword_18F1DC000, v65, OS_LOG_TYPE_FAULT, "Workout, Unrecognizable event dictionary, %@", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D878 == -1)
      goto LABEL_192;
    goto LABEL_253;
  }
LABEL_35:
  v67 = objc_opt_respondsToSelector();
  fDelegate = self->fDelegate;
  if ((v67 & 1) != 0)
  {
    fSender = self->fSender;
    v36 = self->fWorkout;
    goto LABEL_37;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_workoutManagerDidFail_workout_error_(self->fDelegate, v68, (uint64_t)self->fSender, (uint64_t)self->fWorkout, v18);
}

- (void)_registerForWorkoutEvents
{
  const char *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  _QWORD v12[6];
  void *__p;
  std::__shared_weak_count *v14;
  char v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (self->fLocationdConnection)
  {
    sub_18F270374(&__p, "kCLConnectionMessageWorkoutEvent");
    v12[1] = MEMORY[0x1E0C809B0];
    v12[2] = 3221225472;
    v12[3] = sub_18F4EC4C0;
    v12[4] = &unk_1E2955DD8;
    v12[5] = self;
    CLConnectionClient::setHandlerForMessage();
    if (v15 < 0)
      operator delete(__p);
    v16 = CFSTR("kCLConnectionMessageSubscribeKey");
    v17[0] = MEMORY[0x1E0C9AAB0];
    v12[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v3, (uint64_t)v17, (uint64_t)&v16, 1);
    sub_18F4040E8("kCLConnectionMessageWorkoutEvent", v12, &__p);
    v11 = v14;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v11)
    {
      v6 = (unint64_t *)&v11->__shared_owners_;
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v8 = v14;
    if (v14)
    {
      v9 = (unint64_t *)&v14->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

- (void)_unregisterForWorkoutEvents
{
  const char *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  _QWORD v12[6];
  void *__p;
  std::__shared_weak_count *v14;
  char v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (self->fLocationdConnection)
  {
    sub_18F270374(&__p, "kCLConnectionMessageWorkoutEvent");
    v12[1] = MEMORY[0x1E0C809B0];
    v12[2] = 3221225472;
    v12[3] = sub_18F4EC76C;
    v12[4] = &unk_1E2955DD8;
    v12[5] = self;
    CLConnectionClient::setHandlerForMessage();
    if (v15 < 0)
      operator delete(__p);
    v16 = CFSTR("kCLConnectionMessageSubscribeKey");
    v17[0] = MEMORY[0x1E0C9AAA0];
    v12[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v3, (uint64_t)v17, (uint64_t)&v16, 1);
    sub_18F4040E8("kCLConnectionMessageWorkoutEvent", v12, &__p);
    v11 = v14;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v11)
    {
      v6 = (unint64_t *)&v11->__shared_owners_;
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v8 = v14;
    if (v14)
    {
      v9 = (unint64_t *)&v14->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

- (BOOL)_shouldAllowMotionCalibrationPromptsForWorkoutType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x32) & (0x27EF809BA801EuLL >> a3);
}

- (void)_getPromptsNeededForWorkoutType:(int64_t)a3 handler:(id)a4
{
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  if ((objc_msgSend__shouldAllowMotionCalibrationPromptsForWorkoutType_(self, a2, a3, (uint64_t)a4, v4) & 1) != 0)
  {
    sub_18F35C258("kCLConnectionMessageWorkoutPrompts", &v14);
    v13 = v15;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v13)
    {
      v8 = (unint64_t *)&v13->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v10 = v15;
    if (v15)
    {
      v11 = (unint64_t *)&v15->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  }
}

- (void)_beginWorkoutSession:(id)a3 withWorkout:(id)a4 enableWorkoutChangeDetection:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ExecutablePathFromPid;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  unint64_t *v32;
  unint64_t v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  id v39;
  char *v40;
  std::__shared_weak_count *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[3];
  _QWORD v47[3];
  _BYTE v48[128];
  _BYTE v49[12];
  __int16 v50;
  id v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  pid_t v57;
  __int16 v58;
  CMWorkoutManagerInternal *v59;
  int buf;
  _BYTE buf_4[18];
  __int16 v62;
  _BOOL4 v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  pid_t v67;
  __int16 v68;
  CMWorkoutManagerInternal *v69;
  uint64_t v70;

  v5 = a5;
  v70 = *MEMORY[0x1E0C80C00];
  v9 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v10, v9, v11, v12);
  if (ExecutablePathFromPid)
  {
    v18 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v19 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138413570;
      *(_QWORD *)buf_4 = a3;
      *(_WORD *)&buf_4[8] = 2112;
      *(_QWORD *)&buf_4[10] = a4;
      v62 = 1024;
      v63 = v5;
      v64 = 2112;
      v65 = v18;
      v66 = 1024;
      v67 = getpid();
      v68 = 2048;
      v69 = self;
      _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_DEFAULT, "WorkoutSession, begin session, %@, %@, %d, %@, %d, %p", (uint8_t *)&buf, 0x36u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      *(_DWORD *)v49 = 138413570;
      *(_QWORD *)&v49[4] = a3;
      v50 = 2112;
      v51 = a4;
      v52 = 1024;
      v53 = v5;
      v54 = 2112;
      v55 = v18;
      v56 = 1024;
      v57 = getpid();
      v58 = 2048;
      v59 = self;
      v40 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _beginWorkoutSession:withWorkout:enableWorkoutChangeDetection:]", "CoreLocation: %s\n", v40);
      if (v40 != (char *)&buf)
        free(v40);
    }
  }
  if (self->fLocationdConnection)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v20 = (void *)objc_msgSend_workouts(a3, v14, v15, v16, v17);
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v42, (uint64_t)v48, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v43 != v26)
            objc_enumerationMutation(v20);
          objc_msgSend__checkWorkout_(self, v22, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i), v23, v24);
        }
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v42, (uint64_t)v48, 16);
      }
      while (v25);
    }
    objc_msgSend__checkWorkout_(self, v22, (uint64_t)a4, v23, v24);
    v46[0] = CFSTR("CMWorkoutAttributes");
    v46[1] = CFSTR("CMWorkoutOverviewData");
    v47[0] = a4;
    v47[1] = a3;
    v46[2] = CFSTR("CMWorkoutEnableWorkoutChangeDetection");
    v47[2] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v28, v5, v29, v30);
    *(_QWORD *)v49 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)v47, (uint64_t)v46, 3);
    sub_18F3515BC("kCLConnectionMessageBeginWorkoutSession", v49, &buf);
    v41 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v32 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v33 = __ldxr(v32);
      while (__stxr(v33 + 1, v32));
    }
    CLConnectionClient::sendMessage();
    if (v41)
    {
      p_shared_owners = (unint64_t *)&v41->__shared_owners_;
      do
        v35 = __ldaxr(p_shared_owners);
      while (__stlxr(v35 - 1, p_shared_owners));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
    }
    v36 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v37 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
  }
  objc_msgSend__setWorkout_(self, v14, (uint64_t)a4, v16, v17);
  v39 = a3;

  self->fWorkoutOverview = (CMWorkoutOverview *)a3;
  self->fSessionState = 1;
  self->fEnableWorkoutChangeDetection = v5;
}

- (void)_setCurrentWorkoutType:(id)a3 isManualTransition:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ExecutablePathFromPid;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  char *v25;
  std::__shared_weak_count *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[12];
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  pid_t v35;
  __int16 v36;
  CMWorkoutManagerInternal *v37;
  int buf;
  _BYTE buf_4[14];
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  pid_t v43;
  __int16 v44;
  CMWorkoutManagerInternal *v45;
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v7 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v8, v7, v9, v10);
  if (ExecutablePathFromPid)
  {
    v15 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v16 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138413314;
      *(_QWORD *)buf_4 = a3;
      *(_WORD *)&buf_4[8] = 1024;
      *(_DWORD *)&buf_4[10] = v4;
      v40 = 2112;
      v41 = v15;
      v42 = 1024;
      v43 = getpid();
      v44 = 2048;
      v45 = self;
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_DEFAULT, "WorkoutSession, set current type, %@, %d, %@, %d, %p", (uint8_t *)&buf, 0x2Cu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      *(_DWORD *)v29 = 138413314;
      *(_QWORD *)&v29[4] = a3;
      v30 = 1024;
      v31 = v4;
      v32 = 2112;
      v33 = v15;
      v34 = 1024;
      v35 = getpid();
      v36 = 2048;
      v37 = self;
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _setCurrentWorkoutType:isManualTransition:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)&buf)
        free(v25);
    }
  }
  if (self->fLocationdConnection)
  {
    v27[0] = CFSTR("CMWorkoutAttributes");
    v27[1] = CFSTR("CMWorkoutIsManualTransition");
    v28[0] = a3;
    v28[1] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v12, v4, v13, v14);
    *(_QWORD *)v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v28, (uint64_t)v27, 2);
    sub_18F35C128("kCLConnectionMessageSetCurrentWorkoutType", v29, &buf);
    v26 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v18 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    CLConnectionClient::sendMessage();
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    v22 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v23 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  objc_msgSend__setWorkout_(self, v12, (uint64_t)a3, v13, v14);
  self->fSessionState = 1;
}

- (void)_setWorkout:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v7;
  id v8;

  if (!a3 || objc_msgSend_type(a3, a2, (uint64_t)a3, v3, v4) != 33)
  {
    v7 = a3;

    self->fLastNonTransitionWorkout = (CMWorkout *)a3;
  }
  v8 = a3;

  self->fWorkout = (CMWorkout *)a3;
}

- (void)_endWorkoutSession:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ExecutablePathFromPid;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  char *v22;
  std::__shared_weak_count *v23;
  const __CFString *v24;
  id v25;
  _BYTE v26[12];
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  pid_t v30;
  __int16 v31;
  CMWorkoutManagerInternal *v32;
  int buf;
  _BYTE buf_4[18];
  __int16 v35;
  pid_t v36;
  __int16 v37;
  CMWorkoutManagerInternal *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5, v7, v8);
  if (ExecutablePathFromPid)
  {
    v13 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v14 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138413058;
      *(_QWORD *)buf_4 = a3;
      *(_WORD *)&buf_4[8] = 2112;
      *(_QWORD *)&buf_4[10] = v13;
      v35 = 1024;
      v36 = getpid();
      v37 = 2048;
      v38 = self;
      _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_DEFAULT, "WorkoutSession, end session, %@, %@, %d, %p", (uint8_t *)&buf, 0x26u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      *(_DWORD *)v26 = 138413058;
      *(_QWORD *)&v26[4] = a3;
      v27 = 2112;
      v28 = v13;
      v29 = 1024;
      v30 = getpid();
      v31 = 2048;
      v32 = self;
      v22 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _endWorkoutSession:]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)&buf)
        free(v22);
    }
  }
  if (self->fLocationdConnection)
  {
    v24 = CFSTR("CMWorkoutAttributes");
    v25 = a3;
    *(_QWORD *)v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)&v25, (uint64_t)&v24, 1);
    sub_18F3ED6C0("kCLConnectionMessageEndWorkoutSession", v26, &buf);
    v23 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v15 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    CLConnectionClient::sendMessage();
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    v19 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v20 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }
  objc_msgSend__setWorkout_(self, v10, 0, v11, v12);

  self->fWorkoutOverview = 0;
  self->fSessionState = 0;
  self->fEnableWorkoutChangeDetection = 0;
}

- (void)_pauseWorkout:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ExecutablePathFromPid;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  char *v20;
  std::__shared_weak_count *v21;
  const __CFString *v22;
  id v23;
  _BYTE v24[12];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  pid_t v28;
  __int16 v29;
  CMWorkoutManagerInternal *v30;
  int buf;
  _BYTE buf_4[18];
  __int16 v33;
  pid_t v34;
  __int16 v35;
  CMWorkoutManagerInternal *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5, v7, v8);
  if (ExecutablePathFromPid)
  {
    v11 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v12 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138413058;
      *(_QWORD *)buf_4 = a3;
      *(_WORD *)&buf_4[8] = 2112;
      *(_QWORD *)&buf_4[10] = v11;
      v33 = 1024;
      v34 = getpid();
      v35 = 2048;
      v36 = self;
      _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEFAULT, "WorkoutSession, manually pause, %@, %@, %d, %p", (uint8_t *)&buf, 0x26u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      *(_DWORD *)v24 = 138413058;
      *(_QWORD *)&v24[4] = a3;
      v25 = 2112;
      v26 = v11;
      v27 = 1024;
      v28 = getpid();
      v29 = 2048;
      v30 = self;
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _pauseWorkout:]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)&buf)
        free(v20);
    }
  }
  if (self->fLocationdConnection)
  {
    v22 = CFSTR("CMWorkoutAttributes");
    v23 = a3;
    *(_QWORD *)v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)&v23, (uint64_t)&v22, 1);
    sub_18F4040E8("kCLConnectionMessagePauseWorkout", v24, &buf);
    v21 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v13 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    CLConnectionClient::sendMessage();
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    v17 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v18 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  self->fSessionState = 2;
}

- (void)_resumeWorkout:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ExecutablePathFromPid;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  char *v20;
  std::__shared_weak_count *v21;
  const __CFString *v22;
  id v23;
  _BYTE v24[12];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  pid_t v28;
  __int16 v29;
  CMWorkoutManagerInternal *v30;
  int buf;
  _BYTE buf_4[18];
  __int16 v33;
  pid_t v34;
  __int16 v35;
  CMWorkoutManagerInternal *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5, v7, v8);
  if (ExecutablePathFromPid)
  {
    v11 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v12 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138413058;
      *(_QWORD *)buf_4 = a3;
      *(_WORD *)&buf_4[8] = 2112;
      *(_QWORD *)&buf_4[10] = v11;
      v33 = 1024;
      v34 = getpid();
      v35 = 2048;
      v36 = self;
      _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEFAULT, "WorkoutSession, manually resume, %@, %@, %d, %p", (uint8_t *)&buf, 0x26u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      *(_DWORD *)v24 = 138413058;
      *(_QWORD *)&v24[4] = a3;
      v25 = 2112;
      v26 = v11;
      v27 = 1024;
      v28 = getpid();
      v29 = 2048;
      v30 = self;
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _resumeWorkout:]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)&buf)
        free(v20);
    }
  }
  if (self->fLocationdConnection)
  {
    v22 = CFSTR("CMWorkoutAttributes");
    v23 = a3;
    *(_QWORD *)v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)&v23, (uint64_t)&v22, 1);
    sub_18F489C98("kCLConnectionMessageResumeWorkout", v24, &buf);
    v21 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v13 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    CLConnectionClient::sendMessage();
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    v17 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v18 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  self->fSessionState = 1;
}

- (void)_snapshotWithCompletion:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ExecutablePathFromPid;
  uint64_t v10;
  NSObject *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  _BYTE buf[12];
  __int16 v25;
  pid_t v26;
  __int16 v27;
  CMWorkoutManagerInternal *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5, v7, v8);
  if (ExecutablePathFromPid)
  {
    v10 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v11 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v10;
      v25 = 1024;
      v26 = getpid();
      v27 = 2048;
      v28 = self;
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_INFO, "[snapshot] getting state for %@, %d, %p", buf, 0x1Cu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      getpid();
      v22 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _snapshotWithCompletion:]", "CoreLocation: %s\n", v22);
      if (v22 != buf)
        free(v22);
    }
  }
  if (self->fLocationdConnection)
  {
    v12 = (std::__shared_weak_count *)operator new(0x70uLL);
    v12->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    v12->__shared_weak_owners_ = 0;
    v12->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
    sub_18F270374(buf, "kCLConnectionMessageWorkoutSnapshot");
    MEMORY[0x194001030](&v12[1], buf);
    if (SBYTE3(v28) < 0)
      operator delete(*(void **)buf);
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    CLConnectionClient::sendMessage();
    if (v12)
    {
      v15 = (unint64_t *)&v12->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    if (v12)
    {
      v17 = (unint64_t *)&v12->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  else
  {
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v19 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_ERROR, "[snapshot] error, no connection to locationd", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _snapshotWithCompletion:]", "CoreLocation: %s\n", v23);
      if (v23 != buf)
        free(v23);
    }
    v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v20, (uint64_t)CFSTR("CMErrorDomain"), 103, 0);
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v21);
  }
}

- (void)_muteReminderType:(int64_t)a3 mute:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ExecutablePathFromPid;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  NSObject *v30;
  char *v31;
  char *v32;
  std::__shared_weak_count *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  pid_t v42;
  __int16 v43;
  CMWorkoutManagerInternal *v44;
  uint8_t buf[8];
  _BYTE v46[10];
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  pid_t v50;
  __int16 v51;
  CMWorkoutManagerInternal *v52;
  uint64_t v53;

  v4 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v7 = getpid();
  ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v8, v7, v9, v10);
  if (ExecutablePathFromPid)
  {
    v14 = ExecutablePathFromPid;
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v15 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v4;
      *(_WORD *)v46 = 2048;
      *(_QWORD *)&v46[2] = a3;
      v47 = 2112;
      v48 = v14;
      v49 = 1024;
      v50 = getpid();
      v51 = 2048;
      v52 = self;
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_DEFAULT, "Workout, reminder mute settings, setting mute behavior to %d for reminder type %ld for client %@, %d, %p", buf, 0x2Cu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      LODWORD(v36) = 67110146;
      HIDWORD(v36) = v4;
      v37 = 2048;
      v38 = a3;
      v39 = 2112;
      v40 = v14;
      v41 = 1024;
      v42 = getpid();
      v43 = 2048;
      v44 = self;
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _muteReminderType:mute:]", "CoreLocation: %s\n", v31);
      if (v31 != (char *)buf)
        free(v31);
    }
  }
  objc_msgSend__setReminderMuteSettingsForType_mute_(self, v12, a3, v4, v13);
  if (self->fLocationdConnection)
  {
    v34[0] = CFSTR("CMWorkoutReminderSettingType");
    v35[0] = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v16, a3, v17, v18);
    v34[1] = CFSTR("CMWorkoutReminderMuteValue");
    v35[1] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v19, v4, v20, v21);
    v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v35, (uint64_t)v34, 2);
    sub_18F44F8D8("kCLConnectionMessageUpdateWorkoutReminderMuteSetting", &v36, buf);
    v33 = *(std::__shared_weak_count **)v46;
    if (*(_QWORD *)v46)
    {
      v23 = (unint64_t *)(*(_QWORD *)v46 + 8);
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }
    CLConnectionClient::sendMessage();
    if (v33)
    {
      p_shared_owners = (unint64_t *)&v33->__shared_owners_;
      do
        v26 = __ldaxr(p_shared_owners);
      while (__stlxr(v26 - 1, p_shared_owners));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    v27 = *(std::__shared_weak_count **)v46;
    if (*(_QWORD *)v46)
    {
      v28 = (unint64_t *)(*(_QWORD *)v46 + 8);
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
  }
  else
  {
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v30 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_ERROR, "Workout, reminder mute settings, no connection to locationd to send mute behavior", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      LOWORD(v36) = 0;
      v32 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _muteReminderType:mute:]", "CoreLocation: %s\n", v32);
      if (v32 != (char *)buf)
        free(v32);
    }
  }
}

- (void)_checkWorkout:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  uint8_t buf[1640];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_type(a3, a2, (uint64_t)a3, v3, v4) == 19)
  {
    if (!objc_msgSend_swimWorkoutInstance_(CMSwimWorkout, v6, (uint64_t)a3, v8, v9))
    {
      if (qword_1EE16D7F8 != -1)
        dispatch_once(&qword_1EE16D7F8, &unk_1E2959628);
      v10 = qword_1EE16D800;
      if (os_log_type_enabled((os_log_t)qword_1EE16D800, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_FAULT, "Trying to start a swim session without using a CMSwimWorkout!  Treating this swim as an open water swim.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D7F8 != -1)
          dispatch_once(&qword_1EE16D7F8, &unk_1E2959628);
LABEL_20:
        v15 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _checkWorkout:]", "CoreLocation: %s\n", v15);
        if (v15 != (char *)buf)
          free(v15);
      }
    }
  }
  else if (objc_msgSend_type(a3, v6, v7, v8, v9) == 14
         && !objc_msgSend_genericWorkoutInstance_(CMGenericWorkout, v11, (uint64_t)a3, v12, v13))
  {
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    v14 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_ERROR, "Trying to start a generic workout without using CMGenericWorkout!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954608);
      goto LABEL_20;
    }
  }
}

- (void)_setReminderMuteSettingsForType:(int64_t)a3 mute:(BOOL)a4
{
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v8;
  NSMutableDictionary *fMuteSettings;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint8_t buf[4];
  int64_t v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  int isReminderAllowedForType;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v5 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a4, a4, v4);
  fMuteSettings = self->fMuteSettings;
  v13 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v10, a3, v11, v12);
  objc_msgSend_setObject_forKeyedSubscript_(fMuteSettings, v14, v8, v13, v15);
  if (qword_1EE16D878 != -1)
    dispatch_once(&qword_1EE16D878, &unk_1E2954608);
  v16 = qword_1EE16D880;
  if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    v37 = a3;
    v38 = 1024;
    v39 = v5;
    v40 = 1024;
    isReminderAllowedForType = objc_msgSend__isReminderAllowedForType_(self, v17, 0, v18, v19);
    v42 = 1024;
    v43 = objc_msgSend__isReminderAllowedForType_(self, v20, 1, v21, v22);
    v44 = 1024;
    v45 = objc_msgSend__isReminderAllowedForType_(self, v23, 2, v24, v25);
    _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_DEFAULT, "Workout, reminder mute settings, setting type %ld to %d, current snapshot, start = %d, resume = %d, end = %d", buf, 0x24u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954608);
    objc_msgSend__isReminderAllowedForType_(self, v26, 0, v27, v28);
    objc_msgSend__isReminderAllowedForType_(self, v29, 1, v30, v31);
    objc_msgSend__isReminderAllowedForType_(self, v32, 2, v33, v34);
    v35 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _setReminderMuteSettingsForType:mute:]", "CoreLocation: %s\n", v35);
    if (v35 != (char *)buf)
      free(v35);
  }
}

- (BOOL)_isReminderAllowedForType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSMutableDictionary *fMuteSettings;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  fMuteSettings = self->fMuteSettings;
  v8 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  if (!objc_msgSend_objectForKey_(fMuteSettings, v9, v8, v10, v11))
    return 1;
  v15 = self->fMuteSettings;
  v16 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v12, a3, v13, v14);
  v20 = (void *)objc_msgSend_objectForKey_(v15, v17, v16, v18, v19);
  return objc_msgSend_BOOLValue(v20, v21, v22, v23, v24) ^ 1;
}

@end
