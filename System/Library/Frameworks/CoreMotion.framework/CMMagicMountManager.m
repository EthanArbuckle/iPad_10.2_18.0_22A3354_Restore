@implementation CMMagicMountManager

+ (BOOL)isAvailable
{
  return ((unint64_t)sub_18F1F7BFC() >> 9) & 1;
}

- (CMMagicMountManager)init
{
  uint64_t v3;
  CMMagicMountManager *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_18F206C98;
  v11 = sub_18F206BD4;
  v12 = 0;
  v3 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4ABD1C;
  v6[3] = &unk_1E2956830;
  v6[4] = self;
  v6[5] = &v7;
  sub_18F1F5E28(v3, (uint64_t)v6);
  v4 = (CMMagicMountManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)initPrivate
{
  CMMagicMountManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMMagicMountManager;
  v2 = -[CMMagicMountManager init](&v4, sel_init);
  if (v2)
    v2->_internal = (id)objc_opt_new();
  return v2;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_18F206C98;
  v6[4] = sub_18F206BD4;
  v6[5] = self;
  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F4ABE70;
  v5[3] = &unk_1E2956858;
  v5[4] = v6;
  sub_18F1F5E28(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMMagicMountManager;
  -[CMMagicMountManager dealloc](&v4, sel_dealloc);
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_stopMagicMountUpdatesPrivate(self, a2, v2, v3, v4);
  objc_msgSend_teardownPrivate(self->_internal, v6, v7, v8, v9);

}

- (void)startMagicMountUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  char *v9;
  _QWORD v10[7];
  __int16 v11;
  uint8_t buf[1640];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D808 != -1)
    dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
  v7 = qword_1EE16D810;
  if (os_log_type_enabled((os_log_t)qword_1EE16D810, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "Starting magic mount updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D808 != -1)
      dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
    v11 = 0;
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMagicMountManager startMagicMountUpdatesToQueue:withHandler:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf)
      free(v9);
  }
  v8 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F4AC08C;
  v10[3] = &unk_1E2955BD8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  sub_18F1F5E28(v8, (uint64_t)v10);
}

- (void)stopMagicMountUpdates
{
  NSObject *v3;
  uint64_t v4;
  char *v5;
  _QWORD v6[5];
  __int16 v7;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D808 != -1)
    dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
  v3 = qword_1EE16D810;
  if (os_log_type_enabled((os_log_t)qword_1EE16D810, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Stopping magic mount updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D808 != -1)
      dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
    v7 = 0;
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMagicMountManager stopMagicMountUpdates]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf)
      free(v5);
  }
  v4 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4AC268;
  v6[3] = &unk_1E2955938;
  v6[4] = self;
  sub_18F1F5E28(v4, (uint64_t)v6);
}

- (void)setMagicMountConfiguration:(int64_t)a3
{
  NSObject *v5;
  int64_t magicMountConfiguration;
  char *v7;
  uint8_t buf[4];
  int64_t v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D808 != -1)
    dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
  v5 = qword_1EE16D810;
  if (os_log_type_enabled((os_log_t)qword_1EE16D810, OS_LOG_TYPE_DEFAULT))
  {
    magicMountConfiguration = self->_magicMountConfiguration;
    *(_DWORD *)buf = 134349312;
    v9 = magicMountConfiguration;
    v10 = 2050;
    v11 = a3;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "setMagicMountConfiguration: %{public}ld -> %{public}ld", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D808 != -1)
      dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMagicMountManager setMagicMountConfiguration:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
  self->_magicMountConfiguration = a3;
}

- (void)setAPWakesAllowed:(BOOL)a3
{
  NSObject *v5;
  uint64_t v6;
  char *v7;
  _QWORD v8[5];
  BOOL v9;
  __int16 v10;
  uint8_t buf[1640];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D808 != -1)
    dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
  v5 = qword_1EE16D810;
  if (os_log_type_enabled((os_log_t)qword_1EE16D810, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "Changing the AP wakes setting for magic mount events", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D808 != -1)
      dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
    v10 = 0;
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMagicMountManager setAPWakesAllowed:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
  v6 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F4AC614;
  v8[3] = &unk_1E29568F8;
  v8[4] = self;
  v9 = a3;
  sub_18F1F5E28(v6, (uint64_t)v8);
}

- (void)sendMagicMountStateToClientPrivate
{
  id internal;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  CMMagicMountState *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char *v19;
  _QWORD v20[6];
  int v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  if (*((_QWORD *)internal + 4) && *((_QWORD *)internal + 3))
  {
    v4 = MEMORY[0x194001B4C]();
    v5 = *((double *)internal + 1);
    if (v5 == 0.0)
      __assert_rtn("-[CMMagicMountManager sendMagicMountStateToClientPrivate]", "CMMagicMountManager.mm", 252, "timestampSecs != 0.");
    v6 = (void *)v4;
    v7 = *((_QWORD *)internal + 2);
    v8 = [CMMagicMountState alloc];
    v12 = (void *)objc_msgSend_initWithMountStatus_timestamp_(v8, v9, v7, v10, v11, v5);
    if (qword_1EE16D808 != -1)
      dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
    v13 = qword_1EE16D810;
    if (os_log_type_enabled((os_log_t)qword_1EE16D810, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_DEFAULT, "Sending to client: %{public}@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D808 != -1)
        dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
      v21 = 138543362;
      v22 = v12;
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMagicMountManager sendMagicMountStateToClientPrivate]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf)
        free(v19);
    }
    v18 = *((_QWORD *)internal + 3);
    v17 = (void *)*((_QWORD *)internal + 4);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_18F4AC894;
    v20[3] = &unk_1E2955B60;
    v20[4] = v12;
    v20[5] = v18;
    objc_msgSend_addOperationWithBlock_(v17, v14, (uint64_t)v20, v15, v16);

    objc_autoreleasePoolPop(v6);
  }
}

- (void)onMagicMountData:(const MagicMountState *)a3
{
  NSObject *v5;
  int var1;
  _BOOL4 var2;
  _BOOL4 var3;
  double var0;
  const char *v10;
  NSObject *v11;
  char *v12;
  char *v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (qword_1EE16D808 != -1)
      dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
    v5 = qword_1EE16D810;
    if (os_log_type_enabled((os_log_t)qword_1EE16D810, OS_LOG_TYPE_INFO))
    {
      var1 = a3->var1;
      var2 = a3->var2;
      var3 = a3->var3;
      var0 = a3->var0;
      *(_DWORD *)buf = 67240960;
      v15 = var1;
      v16 = 1026;
      v17 = var2;
      v18 = 1026;
      v19 = var3;
      v20 = 2050;
      v21 = var0;
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_INFO, "Incoming magic mount state, mountStatus,%{public}u, isAPAwake,%{public}u, isSimulated,%{public}u, timestampSecs,%{public}f", buf, 0x1Eu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D808 != -1)
        dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMagicMountManager onMagicMountData:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
    objc_msgSend_feedMountStatus_apAwake_simulated_timestamp_(self, v10, a3->var1, a3->var2, a3->var3, a3->var0);
  }
  else
  {
    if (qword_1EE16D808 != -1)
      dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
    v11 = qword_1EE16D810;
    if (os_log_type_enabled((os_log_t)qword_1EE16D810, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_ERROR, "Invalid data parameter!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D808 != -1)
        dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMagicMountManager onMagicMountData:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf)
        free(v13);
    }
  }
}

- (CMMagicMountStateStruct)currentMagicMountState
{
  uint64_t v3;
  double v4;
  int64_t v5;
  double v6;
  int64_t v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  __n128 (*v12)(__n128 *, __n128 *);
  uint64_t (*v13)();
  void *v14;
  uint64_t v15;
  uint64_t v16;
  CMMagicMountStateStruct result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x4012000000;
  v12 = sub_18F4ACCC8;
  v13 = nullsub_177;
  v15 = 0;
  v16 = 0;
  v14 = &unk_18F58364E;
  v3 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F4ACCD8;
  v8[3] = &unk_1E2956C30;
  v8[4] = self;
  v8[5] = &v9;
  sub_18F1F5E28(v3, (uint64_t)v8);
  v4 = v10[6];
  v5 = *((_QWORD *)v10 + 7);
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.mountStatus = v7;
  result.timestamp = v6;
  return result;
}

- (void)simulateMagicMountEvent:(int64_t)a3 delay:(double)a4
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];
  char v9;

  v5 = a3;
  if (qword_1EE16E948 != -1)
    dispatch_once(&qword_1EE16E948, &unk_1E2953248);
  v6 = qword_1EE16E940 + 32;
  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F4993E8;
  v8[3] = &unk_1E2958D58;
  v8[4] = v6;
  v9 = v5;
  *(double *)&v8[5] = a4;
  sub_18F1F5E28(v7, (uint64_t)v8);
}

- (void)feedMountStatus:(int64_t)a3 apAwake:(BOOL)a4 simulated:(BOOL)a5 timestamp:(double)a6
{
  uint64_t v11;
  _QWORD v12[7];
  BOOL v13;
  BOOL v14;

  v11 = sub_18F204AE4();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F4ACE24;
  v12[3] = &unk_1E2958F18;
  v12[4] = self;
  v12[5] = a3;
  *(double *)&v12[6] = a6;
  v13 = a4;
  v14 = a5;
  sub_18F1F5E28(v11, (uint64_t)v12);
}

- (void)startMagicMountUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  _QWORD *internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  if ((sub_18F1F7BFC() & 0x200) != 0)
  {
    v12 = (id)internal[4];
    if (v12 != a3)
    {

      internal[4] = a3;
    }
    v13 = (id)internal[3];
    if (v13 != a4)
    {

      internal[3] = objc_msgSend_copy(a4, v14, v15, v16, v17);
    }
    if (!internal[5] && (sub_18F1F7BFC() & 0x200) != 0)
    {
      v18 = (_QWORD *)operator new();
      *v18 = off_1E294C238;
      *v18 = &off_1E294C5B8;
      v18[1] = 0;
      v18[2] = sub_18F4AAE3C;
      v18[3] = self;
      internal[5] = v18;
      if (qword_1EE16E948 != -1)
        dispatch_once(&qword_1EE16E948, &unk_1E2953248);
      sub_18F1F4F0C(qword_1EE16E940, 0, internal[5], -1.0);
    }
    *((_BYTE *)internal + 64) = 1;
    objc_msgSend_sendServiceRequestPrivate(internal, v8, v9, v10, v11);
    if (!*((_BYTE *)internal + 65))
      MEMORY[0x1E0DE7D20](internal, sel_sendAPWakesRequestPrivate, v19, v20, v21);
  }
}

- (void)stopMagicMountUpdatesPrivate
{
  id internal;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];
  int v13;

  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  if ((sub_18F1F7BFC() & 0x200) != 0)
  {
    if (!*((_BYTE *)internal + 65))
      objc_msgSend_setAPWakesAllowedPrivate_(self, v4, 1, v6, v7);
    if (*((_BYTE *)internal + 64))
    {
      *((_BYTE *)internal + 64) = 0;
      objc_msgSend_sendServiceRequestPrivate(internal, v4, v5, v6, v7);
    }
    if (*((_QWORD *)internal + 5))
    {
      if (qword_1EE16E948 != -1)
        dispatch_once(&qword_1EE16E948, &unk_1E2953248);
      v8 = qword_1EE16E940;
      v9 = *((_QWORD *)internal + 5);
      v10 = sub_18F204AE4();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F1F5EE0;
      v12[3] = &unk_1E2956E98;
      v13 = 0;
      v12[4] = v8;
      v12[5] = v9;
      sub_18F1F5E28(v10, (uint64_t)v12);
      v11 = *((_QWORD *)internal + 5);
      if (v11)
        (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
      *((_QWORD *)internal + 5) = 0;
    }

    *((_QWORD *)internal + 4) = 0;
    *((_QWORD *)internal + 1) = 0;
    *((_QWORD *)internal + 2) = 0;
    *((_QWORD *)internal + 3) = 0;
  }
}

- (void)setAPWakesAllowedPrivate:(BOOL)a3
{
  int v3;
  _BYTE *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  char *v10;
  uint8_t buf[1640];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  if ((sub_18F1F7BFC() & 0x200) != 0)
  {
    if (internal[64])
    {
      if (internal[65] != v3)
      {
        internal[65] = v3;
        MEMORY[0x1E0DE7D20](internal, sel_sendAPWakesRequestPrivate, v6, v7, v8);
      }
    }
    else
    {
      internal[65] = v3;
      if (qword_1EE16D808 != -1)
        dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
      v9 = qword_1EE16D810;
      if (os_log_type_enabled((os_log_t)qword_1EE16D810, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_DEBUG, "Client hasn't called startMagicMountUpdates yet, holding request until this happens", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D808 != -1)
          dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
        v10 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMagicMountManager setAPWakesAllowedPrivate:]", "CoreLocation: %s\n", v10);
        if (v10 != (char *)buf)
          free(v10);
      }
    }
  }
}

- (int64_t)magicMountConfiguration
{
  return self->_magicMountConfiguration;
}

@end
