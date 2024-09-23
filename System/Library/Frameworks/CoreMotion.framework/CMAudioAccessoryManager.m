@implementation CMAudioAccessoryManager

- (CMAudioAccessoryManager)init
{
  uint64_t v3;
  CMAudioAccessoryManager *v4;
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
  v10 = sub_18F206C34;
  v11 = sub_18F206B94;
  v12 = 0;
  v3 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F404588;
  v6[3] = &unk_1E2956830;
  v6[4] = self;
  v6[5] = &v7;
  sub_18F1F5E28(v3, (uint64_t)v6);
  v4 = (CMAudioAccessoryManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)initPrivate
{
  CMAudioAccessoryManager *v2;
  uint64_t v3;
  CMResampleAccessoryDeviceMotion *value;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMAudioAccessoryManager;
  v2 = -[CMAudioAccessoryManager init](&v6, sel_init);
  if (v2)
  {
    v2->_internal = objc_alloc_init(CMAudioAccessoryManagerInternal);
    v3 = operator new();
    sub_18F39FFFC(v3, 0.04);
    value = v2->_resampleAccessoryDeviceMotion.__ptr_.__value_;
    v2->_resampleAccessoryDeviceMotion.__ptr_.__value_ = (CMResampleAccessoryDeviceMotion *)v3;
    if (value)
      MEMORY[0x194001438](value, 0x1000C4021477895);
  }
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
  v6[3] = sub_18F206C34;
  v6[4] = sub_18F206B94;
  v6[5] = self;
  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F404748;
  v5[3] = &unk_1E2956858;
  v5[4] = v6;
  sub_18F1F5E28(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMAudioAccessoryManager;
  -[CMAudioAccessoryManager dealloc](&v4, sel_dealloc);
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{

}

+ (BOOL)_isAvailable
{
  return 1;
}

+ (BOOL)_selectActiveAudioRouteForAccelerometerWithBTAddress:(id)a3 modelID:(id)a4
{
  uint64_t v4;

  if (qword_1EE16E9D8 != -1)
    dispatch_once(&qword_1EE16E9D8, &unk_1E2953D28);
  return sub_18F4A2DF8(qword_1EE16E9D0, a3, a4, (uint64_t)a4, v4);
}

+ (BOOL)_selectActiveAudioRouteForGyroWithBTAddress:(id)a3 modelID:(id)a4
{
  uint64_t v4;

  if (qword_1EE16EA10 != -1)
    dispatch_once(&qword_1EE16EA10, &unk_1E29544E8);
  return sub_18F4A2DF8(qword_1EE16EA08, a3, a4, (uint64_t)a4, v4);
}

+ (BOOL)_selectActiveAudioRouteForMagnetometerWithBTAddress:(id)a3 modelID:(id)a4
{
  uint64_t v4;

  if (qword_1EE16E968 != -1)
    dispatch_once(&qword_1EE16E968, &unk_1E29532E8);
  return sub_18F4A2DF8(qword_1EE16E960, a3, a4, (uint64_t)a4, v4);
}

+ (BOOL)_selectActiveAudioRouteForDeviceMotionWithBTAddress:(id)a3 modelID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_18F4317A8();
  return sub_18F4A2DF8(v6, a3, a4, v7, v8);
}

+ (BOOL)_selectActiveAudioRouteWithBTAddress:(id)a3 modelID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_18F4317A8();
  return sub_18F4A2DF8(v6, a3, a4, v7, v8);
}

+ (BOOL)_selectActiveAudioRouteForHeartRateWithBTAddress:(id)a3 modelID:(id)a4
{
  uint64_t v4;

  if (qword_1EE16E9C0 != -1)
    dispatch_once(&qword_1EE16E9C0, &unk_1E29537C8);
  return sub_18F4A2DF8(qword_1EE16E9B8, a3, a4, (uint64_t)a4, v4);
}

+ (BOOL)_selectActiveAudioRouteForPPGWithBTAddress:(id)a3 modelID:(id)a4
{
  uint64_t v4;

  if (qword_1EE16E978 != -1)
    dispatch_once(&qword_1EE16E978, &unk_1E2953548);
  return sub_18F4A2DF8(qword_1EE16E970, a3, a4, (uint64_t)a4, v4);
}

- (void)_setAudioAccessoryAccelerometerUpdateInterval:(double)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4049E8;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (double)_audioAccessoryAccelerometerUpdateInterval
{
  return *((double *)self->_internal + 3);
}

- (BOOL)_isAudioAccessoryAccelerometerAvailable
{
  uint64_t v3;
  _QWORD v5[5];

  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F404A6C;
  v5[3] = &unk_1E2955938;
  v5[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v5);
  return *((_BYTE *)self->_internal + 472);
}

- (id)_audioAccessoryAccelerometerData
{
  id internal;
  double v3;
  int v4;
  int v5;
  int v6;
  CMAccelerometerData *v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v3 = *((double *)internal + 6);
  v4 = *((_DWORD *)internal + 14);
  v5 = *((_DWORD *)internal + 15);
  v6 = *((_DWORD *)internal + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0)
    return 0;
  v7 = [CMAccelerometerData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  return (id)objc_msgSend_initWithAcceleration_andTimestamp_(v7, v11, v12, v13, v14, v8, v9, v10, v3);
}

- (void)_startAudioAccessoryAccelerometerUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F404B74;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryAccelerometerUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F404BE4;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryAccelerometerUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.005)
    a3 = 0.005;
  internal[3] = a3;
  v4 = (char *)(internal + 3);
  if (*((_QWORD *)internal + 2))
  {
    if (qword_1EE16E9D8 != -1)
      dispatch_once(&qword_1EE16E9D8, &unk_1E2953D28);
    v5 = qword_1EE16E9D0;
    v6 = *((_QWORD *)internal + 2);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)_isAudioAccessoryAccelerometerAvailablePrivate
{
  *((_BYTE *)self->_internal + 472) = 1;
}

- (void)_startAudioAccessoryAccelerometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  id internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryAccelerometerAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4)
    && *((double *)internal + 3) > 0.0)
  {
    v9 = (id)*((_QWORD *)internal + 5);
    if (v9 != a3)
    {

      *((_QWORD *)internal + 5) = a3;
    }
    v10 = (id)*((_QWORD *)internal + 4);
    if (v10 != a4)
    {

      *((_QWORD *)internal + 4) = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (!*((_QWORD *)internal + 2))
    {
      v15 = (_QWORD *)operator new();
      *v15 = off_1E294C238;
      *v15 = &off_1E294C740;
      v15[1] = 0;
      v15[2] = sub_18F404350;
      v15[3] = self;
      *((_QWORD *)internal + 2) = v15;
      if (qword_1EE16E9D8 != -1)
        dispatch_once(&qword_1EE16E9D8, &unk_1E2953D28);
      sub_18F1F4F0C(qword_1EE16E9D0, 0, *((_QWORD *)internal + 2), *((double *)internal + 3));
    }
  }
}

- (void)_stopAudioAccessoryAccelerometerUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  int v13;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryAccelerometerAvailable(self, a2, v2, v3, v4))
  {
    if (internal[2])
    {
      if (qword_1EE16E9D8 != -1)
        dispatch_once(&qword_1EE16E9D8, &unk_1E2953D28);
      v6 = qword_1EE16E9D0;
      v7 = internal[2];
      v8 = sub_18F204AE4();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F1F5EE0;
      v12[3] = &unk_1E2956E98;
      v13 = 0;
      v12[4] = v6;
      v12[5] = v7;
      sub_18F1F5E28(v8, (uint64_t)v12);
      v9 = internal[2];
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      internal[2] = 0;
    }
    v10 = (void *)internal[5];
    if (v10)
    {

      internal[5] = 0;
    }
    v11 = (void *)internal[4];
    if (v11)
    {

      internal[4] = 0;
    }
  }
}

- (void)_setAudioAccessoryGyroUpdateInterval:(double)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F404F50;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (double)_audioAccessoryGyroUpdateInterval
{
  return *((double *)self->_internal + 12);
}

- (BOOL)_isAudioAccessoryGyroAvailable
{
  uint64_t v3;
  _QWORD v5[5];

  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F404FD4;
  v5[3] = &unk_1E2955938;
  v5[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v5);
  return *((_BYTE *)self->_internal + 473);
}

- (id)_audioAccessoryGyroData
{
  id internal;
  double v3;
  int v4;
  int v5;
  int v6;
  CMGyroData *v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v3 = *((double *)internal + 15);
  v4 = *((_DWORD *)internal + 32);
  v5 = *((_DWORD *)internal + 33);
  v6 = *((_DWORD *)internal + 34);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0)
    return 0;
  v7 = [CMGyroData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  return (id)objc_msgSend_initWithRotationRate_andTimestamp_(v7, v11, v12, v13, v14, v8, v9, v10, v3);
}

- (void)_startAudioAccessoryGyroUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F4050DC;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryGyroUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F40514C;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryGyroUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.005)
    a3 = 0.005;
  internal[12] = a3;
  v4 = (char *)(internal + 12);
  if (*((_QWORD *)internal + 11))
  {
    if (qword_1EE16EA10 != -1)
      dispatch_once(&qword_1EE16EA10, &unk_1E29544E8);
    v5 = qword_1EE16EA08;
    v6 = *((_QWORD *)internal + 11);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)_isAudioAccessoryGyroAvailablePrivate
{
  *((_BYTE *)self->_internal + 473) = 1;
}

- (void)_startAudioAccessoryGyroUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  id internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryGyroAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4)
    && *((double *)internal + 12) > 0.0)
  {
    v9 = (id)*((_QWORD *)internal + 14);
    if (v9 != a3)
    {

      *((_QWORD *)internal + 14) = a3;
    }
    v10 = (id)*((_QWORD *)internal + 13);
    if (v10 != a4)
    {

      *((_QWORD *)internal + 13) = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (!*((_QWORD *)internal + 11))
    {
      v15 = (_QWORD *)operator new();
      *v15 = off_1E294C238;
      *v15 = &off_1E294C3F8;
      v15[1] = 0;
      v15[2] = sub_18F40435C;
      v15[3] = self;
      *((_QWORD *)internal + 11) = v15;
      if (qword_1EE16EA10 != -1)
        dispatch_once(&qword_1EE16EA10, &unk_1E29544E8);
      sub_18F1F4F0C(qword_1EE16EA08, 0, *((_QWORD *)internal + 11), *((double *)internal + 12));
    }
  }
}

- (void)_stopAudioAccessoryGyroUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  int v13;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryGyroAvailable(self, a2, v2, v3, v4))
  {
    if (internal[11])
    {
      if (qword_1EE16EA10 != -1)
        dispatch_once(&qword_1EE16EA10, &unk_1E29544E8);
      v6 = qword_1EE16EA08;
      v7 = internal[11];
      v8 = sub_18F204AE4();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F1F5EE0;
      v12[3] = &unk_1E2956E98;
      v13 = 0;
      v12[4] = v6;
      v12[5] = v7;
      sub_18F1F5E28(v8, (uint64_t)v12);
      v9 = internal[11];
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      internal[11] = 0;
    }
    v10 = (void *)internal[14];
    if (v10)
    {

      internal[14] = 0;
    }
    v11 = (void *)internal[13];
    if (v11)
    {

      internal[13] = 0;
    }
  }
}

- (void)_setAudioAccessoryMagnetometerUpdateInterval:(double)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4054B8;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (double)_audioAccessoryMagnetometerUpdateInterval
{
  return *((double *)self->_internal + 21);
}

- (BOOL)_isAudioAccessoryMagnetometerAvailable
{
  uint64_t v3;
  _QWORD v5[5];

  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F40553C;
  v5[3] = &unk_1E2955938;
  v5[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v5);
  return *((_BYTE *)self->_internal + 474);
}

- (id)_audioAccessoryMagnetometerData
{
  id internal;
  double v3;
  int v4;
  int v5;
  int v6;
  CMMagnetometerData *v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v3 = *((double *)internal + 24);
  v4 = *((_DWORD *)internal + 50);
  v5 = *((_DWORD *)internal + 51);
  v6 = *((_DWORD *)internal + 52);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0)
    return 0;
  v7 = [CMMagnetometerData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  return (id)objc_msgSend_initWithMagneticField_andTimestamp_(v7, v11, v12, v13, v14, v8, v9, v10, v3);
}

- (void)_startAudioAccessoryMagnetometerUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F405644;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryMagnetometerUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4056B4;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryMagnetometerUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.005)
    a3 = 0.005;
  internal[21] = a3;
  v4 = (char *)(internal + 21);
  if (*((_QWORD *)internal + 20))
  {
    if (qword_1EE16E968 != -1)
      dispatch_once(&qword_1EE16E968, &unk_1E29532E8);
    v5 = qword_1EE16E960;
    v6 = *((_QWORD *)internal + 20);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)_isAudioAccessoryMagnetometerAvailablePrivate
{
  *((_BYTE *)self->_internal + 474) = 1;
}

- (void)_startAudioAccessoryMagnetometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  id internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryMagnetometerAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4)
    && *((double *)internal + 21) > 0.0)
  {
    v9 = (id)*((_QWORD *)internal + 23);
    if (v9 != a3)
    {

      *((_QWORD *)internal + 23) = a3;
    }
    v10 = (id)*((_QWORD *)internal + 22);
    if (v10 != a4)
    {

      *((_QWORD *)internal + 22) = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (!*((_QWORD *)internal + 20))
    {
      v15 = (_QWORD *)operator new();
      *v15 = off_1E294C238;
      *v15 = &off_1E294C6D0;
      v15[1] = 0;
      v15[2] = sub_18F404368;
      v15[3] = self;
      *((_QWORD *)internal + 20) = v15;
      if (qword_1EE16E968 != -1)
        dispatch_once(&qword_1EE16E968, &unk_1E29532E8);
      sub_18F1F4F0C(qword_1EE16E960, 0, *((_QWORD *)internal + 20), *((double *)internal + 21));
    }
  }
}

- (void)_stopAudioAccessoryMagnetometerUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  int v13;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryMagnetometerAvailable(self, a2, v2, v3, v4))
  {
    if (internal[20])
    {
      if (qword_1EE16E968 != -1)
        dispatch_once(&qword_1EE16E968, &unk_1E29532E8);
      v6 = qword_1EE16E960;
      v7 = internal[20];
      v8 = sub_18F204AE4();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F1F5EE0;
      v12[3] = &unk_1E2956E98;
      v13 = 0;
      v12[4] = v6;
      v12[5] = v7;
      sub_18F1F5E28(v8, (uint64_t)v12);
      v9 = internal[20];
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      internal[20] = 0;
    }
    v10 = (void *)internal[23];
    if (v10)
    {

      internal[23] = 0;
    }
    v11 = (void *)internal[22];
    if (v11)
    {

      internal[22] = 0;
    }
  }
}

- (BOOL)_isAudioAccessoryDeviceMotionAvailable
{
  uint64_t v3;
  _QWORD v5[5];

  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F405A18;
  v5[3] = &unk_1E2955938;
  v5[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v5);
  return *((_BYTE *)self->_internal + 475);
}

- (void)_setAudioAccessoryDeviceMotionUpdateInterval:(double)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F405A90;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (double)_audioAccessoryDeviceMotionUpdateInterval
{
  return *((double *)self->_internal + 31);
}

- (void)_startAudioAccessoryDeviceMotionUpdatesToQueue:(id)a3 lowLatencyMode:(BOOL)a4 withHandler:(id)a5
{
  uint64_t v9;
  _QWORD v10[7];
  BOOL v11;

  v9 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F405B28;
  v10[3] = &unk_1E2957228;
  v10[4] = self;
  v10[5] = a3;
  v11 = a4;
  v10[6] = a5;
  sub_18F1F6514(v9, (uint64_t)v10);
}

- (void)_stopAudioAccessoryDeviceMotionUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F405B9C;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)_startAudioAccessoryDeviceMotionStatusUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F405C18;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryDeviceMotionStatusUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F405C88;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryDeviceMotionUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.005)
    a3 = 0.005;
  internal[31] = a3;
  v4 = (char *)(internal + 31);
  if (*((_QWORD *)internal + 29))
  {
    v5 = sub_18F4317A8();
    v6 = *((_QWORD *)internal + 29);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)_isAudioAccessoryDeviceMotionAvailablePrivate
{
  *((_BYTE *)self->_internal + 475) = 1;
}

- (void)_startAudioAccessoryDeviceMotionUpdatesPrivate:(id)a3 lowLatencyMode:(BOOL)a4 withHandler:(id)a5
{
  id internal;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryDeviceMotionAvailable(self, a2, (uint64_t)a3, a4, (uint64_t)a5)
    && *((double *)internal + 31) > 0.0)
  {
    v10 = (id)*((_QWORD *)internal + 33);
    if (v10 != a3)
    {

      *((_QWORD *)internal + 33) = a3;
    }
    v11 = (id)*((_QWORD *)internal + 32);
    if (v11 != a5)
    {

      *((_QWORD *)internal + 32) = objc_msgSend_copy(a5, v12, v13, v14, v15);
    }
    if (!*((_QWORD *)internal + 30))
    {
      v16 = (_QWORD *)operator new();
      *v16 = off_1E294C238;
      *v16 = &off_1E294C698;
      v16[1] = 0;
      v16[2] = sub_18F404394;
      v16[3] = self;
      *((_QWORD *)internal + 30) = v16;
      v17 = sub_18F4317A8();
      sub_18F1F4F0C(v17, 1, *((_QWORD *)internal + 30), -1.0);
    }
    if (!*((_QWORD *)internal + 29))
    {
      *(_BYTE *)(sub_18F4317A8() + 28) = a4;
      v18 = (_QWORD *)operator new();
      *v18 = off_1E294C238;
      *v18 = &off_1E294C660;
      v18[1] = 0;
      v18[2] = sub_18F404374;
      v18[3] = self;
      *((_QWORD *)internal + 29) = v18;
      v19 = sub_18F4317A8();
      sub_18F1F4F0C(v19, 0, *((_QWORD *)internal + 29), *((double *)internal + 31));
    }
  }
}

- (void)_stopAudioAccessoryDeviceMotionUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *(*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryDeviceMotionAvailable(self, a2, v2, v3, v4))
  {
    v6 = MEMORY[0x1E0C809B0];
    if (internal[29])
    {
      v7 = sub_18F4317A8();
      v8 = internal[29];
      v9 = sub_18F204AE4();
      v17 = v6;
      v18 = 3221225472;
      v19 = sub_18F1F5EE0;
      v20 = &unk_1E2956E98;
      v23 = 0;
      v21 = v7;
      v22 = v8;
      sub_18F1F5E28(v9, (uint64_t)&v17);
      v10 = internal[29];
      if (v10)
        (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
      internal[29] = 0;
    }
    if (internal[30])
    {
      v11 = sub_18F4317A8();
      v12 = internal[30];
      v13 = sub_18F204AE4();
      v17 = v6;
      v18 = 3221225472;
      v19 = sub_18F1F5EE0;
      v20 = &unk_1E2956E98;
      v23 = 1;
      v21 = v11;
      v22 = v12;
      sub_18F1F5E28(v13, (uint64_t)&v17);
      v14 = internal[30];
      if (v14)
        (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
      internal[30] = 0;
    }
    v15 = (void *)internal[33];
    if (v15)
    {

      internal[33] = 0;
    }
    v16 = (void *)internal[32];
    if (v16)
    {

      internal[32] = 0;
    }
  }
}

- (void)_startAudioAccessoryDeviceMotionStatusUpdatesPrivate:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  uint64_t *internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _BOOL4 v21;

  internal = (uint64_t *)self->_internal;
  if (objc_msgSend__isAudioAccessoryDeviceMotionAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4))
  {
    v9 = (id)internal[38];
    if (v9 != a3)
    {

      internal[38] = (uint64_t)a3;
    }
    v10 = (id)internal[37];
    if (v10 != a4)
    {

      internal[37] = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (!internal[36])
    {
      v15 = sub_18F4317A8();
      v21 = sub_18F4A2BA0(v15);
      objc_msgSend_onAudioAccessoryDeviceMotionStatus_(self, v16, (uint64_t)&v21, v17, v18);
      v19 = (_QWORD *)operator new();
      *v19 = off_1E294C238;
      *v19 = &off_1E294C510;
      v19[1] = 0;
      v19[2] = sub_18F4043A0;
      v19[3] = self;
      internal[36] = (uint64_t)v19;
      v20 = sub_18F4317A8();
      sub_18F1F4F0C(v20, 2, internal[36], -1.0);
    }
  }
}

- (void)_stopAudioAccessoryDeviceMotionStatusUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  int v13;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryDeviceMotionAvailable(self, a2, v2, v3, v4))
  {
    if (internal[36])
    {
      v6 = sub_18F4317A8();
      v7 = internal[36];
      v8 = sub_18F204AE4();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F1F5EE0;
      v12[3] = &unk_1E2956E98;
      v13 = 2;
      v12[4] = v6;
      v12[5] = v7;
      sub_18F1F5E28(v8, (uint64_t)v12);
      v9 = internal[36];
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      internal[36] = 0;
    }
    v10 = (void *)internal[38];
    if (v10)
    {

      internal[38] = 0;
    }
    v11 = (void *)internal[37];
    if (v11)
    {

      internal[37] = 0;
    }
  }
}

- (BOOL)_isAudioAccessoryActivityAvailable
{
  uint64_t v3;
  _QWORD v5[5];

  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F40622C;
  v5[3] = &unk_1E2955938;
  v5[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v5);
  return *((_BYTE *)self->_internal + 476);
}

- (void)_setAudioAccessoryActivityUpdateInterval:(double)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4062A4;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (double)_audioAccessoryActivityUpdateInterval
{
  return *((double *)self->_internal + 31);
}

- (void)_startAudioAccessoryActivityUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F406334;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F5E28(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryActivityUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4063A4;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryActivityUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.005)
    a3 = 0.005;
  internal[40] = a3;
  if (*((_QWORD *)internal + 39))
  {
    v4 = (char *)(internal + 40);
    v5 = sub_18F4317A8();
    v6 = *((_QWORD *)internal + 39);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)_isAudioAccessoryActivityAvailablePrivate
{
  *((_BYTE *)self->_internal + 476) = 1;
}

- (void)_startAudioAccessoryActivityUpdatesPrivate:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  id internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryActivityAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4)
    && *((double *)internal + 40) > 0.0)
  {
    v9 = (id)*((_QWORD *)internal + 42);
    if (v9 != a3)
    {

      *((_QWORD *)internal + 42) = a3;
    }
    v10 = (id)*((_QWORD *)internal + 41);
    if (v10 != a4)
    {

      *((_QWORD *)internal + 41) = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (!*((_QWORD *)internal + 39))
    {
      v15 = (_QWORD *)operator new();
      *v15 = off_1E294C238;
      *v15 = &off_1E294C660;
      v15[1] = 0;
      v15[2] = sub_18F404380;
      v15[3] = self;
      v16 = *((_QWORD *)internal + 39);
      *((_QWORD *)internal + 39) = v15;
      if (v16)
        (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
      v17 = sub_18F4317A8();
      sub_18F1F4F0C(v17, 0, *((_QWORD *)internal + 39), *((double *)internal + 40));
    }
  }
}

- (void)_stopAudioAccessoryActivityUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  int v13;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryActivityAvailable(self, a2, v2, v3, v4))
  {
    if (internal[39])
    {
      v6 = sub_18F4317A8();
      v7 = internal[39];
      v8 = sub_18F204AE4();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F1F5EE0;
      v12[3] = &unk_1E2956E98;
      v13 = 0;
      v12[4] = v6;
      v12[5] = v7;
      sub_18F1F5E28(v8, (uint64_t)v12);
      v9 = internal[39];
      internal[39] = 0;
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    }
    v10 = (void *)internal[42];
    if (v10)
    {

      internal[42] = 0;
    }
    v11 = (void *)internal[41];
    if (v11)
    {

      internal[41] = 0;
    }
  }
}

- (void)_setAudioAccessoryHeartRateUpdateInterval:(double)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4066A8;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (double)_audioAccessoryHeartRateUpdateInterval
{
  return *((double *)self->_internal + 44);
}

- (BOOL)_isAudioAccessoryHeartRateAvailable
{
  uint64_t v3;
  _QWORD v5[5];

  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F40672C;
  v5[3] = &unk_1E2955938;
  v5[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v5);
  return *((_BYTE *)self->_internal + 477);
}

- (void)_startAudioAccessoryHeartRateUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F4067A8;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryHeartRateUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F406818;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryHeartRateUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.005)
    a3 = 0.005;
  internal[44] = a3;
  if (*((_QWORD *)internal + 43))
  {
    v4 = (char *)(internal + 44);
    if (qword_1EE16E9C0 != -1)
      dispatch_once(&qword_1EE16E9C0, &unk_1E29537C8);
    v5 = qword_1EE16E9B8;
    v6 = *((_QWORD *)internal + 43);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)_isAudioAccessoryHeartRateAvailablePrivate
{
  *((_BYTE *)self->_internal + 477) = 1;
}

- (void)_startAudioAccessoryHeartRateUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  id internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryHeartRateAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4)
    && *((double *)internal + 44) > 0.0)
  {
    v9 = (id)*((_QWORD *)internal + 46);
    if (v9 != a3)
    {

      *((_QWORD *)internal + 46) = a3;
    }
    v10 = (id)*((_QWORD *)internal + 45);
    if (v10 != a4)
    {

      *((_QWORD *)internal + 45) = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (!*((_QWORD *)internal + 43))
    {
      v15 = (_QWORD *)operator new();
      *v15 = off_1E294C238;
      *v15 = &off_1E2944320;
      v15[1] = 0;
      v15[2] = sub_18F4043AC;
      v15[3] = self;
      *((_QWORD *)internal + 43) = v15;
      if (qword_1EE16E9C0 != -1)
        dispatch_once(&qword_1EE16E9C0, &unk_1E29537C8);
      sub_18F1F4F0C(qword_1EE16E9B8, 0, *((_QWORD *)internal + 43), *((double *)internal + 44));
    }
  }
}

- (void)_stopAudioAccessoryHeartRateUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  int v13;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryHeartRateAvailable(self, a2, v2, v3, v4))
  {
    if (internal[43])
    {
      if (qword_1EE16E9C0 != -1)
        dispatch_once(&qword_1EE16E9C0, &unk_1E29537C8);
      v6 = qword_1EE16E9B8;
      v7 = internal[43];
      v8 = sub_18F204AE4();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F1F5EE0;
      v12[3] = &unk_1E2956E98;
      v13 = 0;
      v12[4] = v6;
      v12[5] = v7;
      sub_18F1F5E28(v8, (uint64_t)v12);
      v9 = internal[43];
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      internal[43] = 0;
    }
    v10 = (void *)internal[46];
    if (v10)
    {

      internal[46] = 0;
    }
    v11 = (void *)internal[45];
    if (v11)
    {

      internal[45] = 0;
    }
  }
}

- (BOOL)_isAudioAccessoryPPGAvailable
{
  uint64_t v3;
  _QWORD v5[5];

  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F406B7C;
  v5[3] = &unk_1E2955938;
  v5[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v5);
  return *((_BYTE *)self->_internal + 478);
}

- (void)_startAudioAccessoryPPGUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F406BF8;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryPPGUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F406C68;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)_isAudioAccessoryPPGAvailablePrivate
{
  *((_BYTE *)self->_internal + 478) = 1;
}

- (void)_startAudioAccessoryPPGUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  uint64_t *internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  internal = (uint64_t *)self->_internal;
  if (objc_msgSend__isAudioAccessoryPPGAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4))
  {
    v9 = (id)internal[53];
    if (v9 != a3)
    {

      internal[53] = (uint64_t)a3;
    }
    v10 = (id)internal[52];
    if (v10 != a4)
    {

      internal[52] = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (!internal[51])
    {
      v15 = (_QWORD *)operator new();
      *v15 = off_1E294C238;
      *v15 = &off_1E29442E8;
      v15[1] = 0;
      v15[2] = sub_18F4043B8;
      v15[3] = self;
      internal[51] = (uint64_t)v15;
      if (qword_1EE16E978 != -1)
        dispatch_once(&qword_1EE16E978, &unk_1E2953548);
      sub_18F1F4F0C(qword_1EE16E970, 0, internal[51], 1.0);
    }
  }
}

- (void)_stopAudioAccessoryPPGUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  int v13;

  internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryPPGAvailable(self, a2, v2, v3, v4))
  {
    if (internal[51])
    {
      if (qword_1EE16E978 != -1)
        dispatch_once(&qword_1EE16E978, &unk_1E2953548);
      v6 = qword_1EE16E970;
      v7 = internal[51];
      v8 = sub_18F204AE4();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F1F5EE0;
      v12[3] = &unk_1E2956E98;
      v13 = 0;
      v12[4] = v6;
      v12[5] = v7;
      sub_18F1F5E28(v8, (uint64_t)v12);
      v9 = internal[51];
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      internal[51] = 0;
    }
    v10 = (void *)internal[53];
    if (v10)
    {

      internal[53] = 0;
    }
    v11 = (void *)internal[52];
    if (v11)
    {

      internal[52] = 0;
    }
  }
}

- (void)onAudioAccessoryAccelerometer:(const Sample *)a3
{
  os_unfair_lock_s *internal;
  __int128 v5;
  __int128 v6;
  void *v7;
  CMAccelerometerData *v8;
  double v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char *v25;
  _QWORD v26[6];
  int v27;
  void *v28;
  __int16 v29;
  double v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  internal = (os_unfair_lock_s *)self->_internal;
  os_unfair_lock_lock(internal + 2);
  v5 = *(_OWORD *)&a3->timestamp;
  v6 = *(_OWORD *)&a3->acceleration.z;
  *(_QWORD *)&internal[20]._os_unfair_lock_opaque = *(_QWORD *)&a3[1].acceleration.x;
  *(_OWORD *)&internal[12]._os_unfair_lock_opaque = v5;
  *(_OWORD *)&internal[16]._os_unfair_lock_opaque = v6;
  os_unfair_lock_unlock(internal + 2);
  if (*(_QWORD *)&internal[10]._os_unfair_lock_opaque && *(_QWORD *)&internal[8]._os_unfair_lock_opaque)
  {
    v7 = (void *)MEMORY[0x194001B4C]();
    v8 = [CMAccelerometerData alloc];
    *(float *)&v9 = a3->acceleration.x;
    *(float *)&v10 = a3->acceleration.y;
    *(float *)&v11 = a3->acceleration.z;
    v16 = (void *)objc_msgSend_initWithAcceleration_andTimestamp_(v8, v12, v13, v14, v15, v9, v10, v11, a3->timestamp);
    v17 = *(_QWORD *)&internal[8]._os_unfair_lock_opaque;
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E29536A8);
    v18 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
    {
      v19 = mach_absolute_time();
      *(_DWORD *)buf = 138412546;
      v32 = v16;
      v33 = 2048;
      v34 = sub_18F1FD20C(v19);
      _os_log_impl(&dword_18F1DC000, v18, OS_LOG_TYPE_DEBUG, "Audio Accessory CMAccelerometerData: %@,now,%f", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E29536A8);
      v24 = mach_absolute_time();
      v27 = 138412546;
      v28 = v16;
      v29 = 2048;
      v30 = sub_18F1FD20C(v24);
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryManager onAudioAccessoryAccelerometer:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf)
        free(v25);
    }
    v23 = *(void **)&internal[10]._os_unfair_lock_opaque;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18F40711C;
    v26[3] = &unk_1E2955B60;
    v26[4] = v16;
    v26[5] = v17;
    objc_msgSend_addOperationWithBlock_(v23, v20, (uint64_t)v26, v21, v22);

    objc_autoreleasePoolPop(v7);
  }
}

- (void)onAudioAccessoryGyro:(const Sample *)a3
{
  char *internal;
  __int128 v5;
  __int128 v6;
  void *v7;
  CMGyroData *v8;
  double v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char *v25;
  _QWORD v26[6];
  int v27;
  void *v28;
  __int16 v29;
  double v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v5 = *(_OWORD *)&a3->timestamp;
  v6 = *(_OWORD *)&a3->acceleration.z;
  *((_QWORD *)internal + 19) = *(_QWORD *)&a3[1].acceleration.x;
  *(_OWORD *)(internal + 136) = v6;
  *(_OWORD *)(internal + 120) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((_QWORD *)internal + 14) && *((_QWORD *)internal + 13))
  {
    v7 = (void *)MEMORY[0x194001B4C]();
    v8 = [CMGyroData alloc];
    *(float *)&v9 = a3->acceleration.x;
    *(float *)&v10 = a3->acceleration.y;
    *(float *)&v11 = a3->acceleration.z;
    v16 = (void *)objc_msgSend_initWithRotationRate_andTimestamp_(v8, v12, v13, v14, v15, v9, v10, v11, a3->timestamp);
    v17 = *((_QWORD *)internal + 13);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E29536A8);
    v18 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
    {
      v19 = mach_absolute_time();
      *(_DWORD *)buf = 138412546;
      v32 = v16;
      v33 = 2048;
      v34 = sub_18F1FD20C(v19);
      _os_log_impl(&dword_18F1DC000, v18, OS_LOG_TYPE_DEBUG, "Audio Accessory CMGyroData: %@,now,%f", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E29536A8);
      v24 = mach_absolute_time();
      v27 = 138412546;
      v28 = v16;
      v29 = 2048;
      v30 = sub_18F1FD20C(v24);
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryManager onAudioAccessoryGyro:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf)
        free(v25);
    }
    v23 = (void *)*((_QWORD *)internal + 14);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18F4073BC;
    v26[3] = &unk_1E2955B60;
    v26[4] = v16;
    v26[5] = v17;
    objc_msgSend_addOperationWithBlock_(v23, v20, (uint64_t)v26, v21, v22);

    objc_autoreleasePoolPop(v7);
  }
}

- (void)onAudioAccessoryMagnetometer:(const Sample *)a3
{
  os_unfair_lock_s *internal;
  __int128 v5;
  __int128 v6;
  void *v7;
  CMMagnetometerData *v8;
  double v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char *v25;
  _QWORD v26[6];
  int v27;
  void *v28;
  __int16 v29;
  double v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  internal = (os_unfair_lock_s *)self->_internal;
  os_unfair_lock_lock(internal + 2);
  v5 = *(_OWORD *)&a3->timestamp;
  v6 = *(_OWORD *)&a3->acceleration.z;
  *(_QWORD *)&internal[56]._os_unfair_lock_opaque = *(_QWORD *)&a3[1].acceleration.x;
  *(_OWORD *)&internal[48]._os_unfair_lock_opaque = v5;
  *(_OWORD *)&internal[52]._os_unfair_lock_opaque = v6;
  os_unfair_lock_unlock(internal + 2);
  if (*(_QWORD *)&internal[46]._os_unfair_lock_opaque && *(_QWORD *)&internal[44]._os_unfair_lock_opaque)
  {
    v7 = (void *)MEMORY[0x194001B4C]();
    v8 = [CMMagnetometerData alloc];
    *(float *)&v9 = a3->acceleration.x;
    *(float *)&v10 = a3->acceleration.y;
    *(float *)&v11 = a3->acceleration.z;
    v16 = (void *)objc_msgSend_initWithMagneticField_andTimestamp_(v8, v12, v13, v14, v15, v9, v10, v11, a3->timestamp);
    v17 = *(_QWORD *)&internal[44]._os_unfair_lock_opaque;
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E29536A8);
    v18 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
    {
      v19 = mach_absolute_time();
      *(_DWORD *)buf = 138412546;
      v32 = v16;
      v33 = 2048;
      v34 = sub_18F1FD20C(v19);
      _os_log_impl(&dword_18F1DC000, v18, OS_LOG_TYPE_DEBUG, "Audio Accessory CMMagnetometerData: %@,now,%f", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E29536A8);
      v24 = mach_absolute_time();
      v27 = 138412546;
      v28 = v16;
      v29 = 2048;
      v30 = sub_18F1FD20C(v24);
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryManager onAudioAccessoryMagnetometer:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf)
        free(v25);
    }
    v23 = *(void **)&internal[46]._os_unfair_lock_opaque;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18F407658;
    v26[3] = &unk_1E2955B60;
    v26[4] = v16;
    v26[5] = v17;
    objc_msgSend_addOperationWithBlock_(v23, v20, (uint64_t)v26, v21, v22);

    objc_autoreleasePoolPop(v7);
  }
}

- (void)onAudioAccessoryDeviceMotion:(const void *)a3
{
  float *internal;
  __int128 v4;
  float32x4_t v5;
  float v7;
  int v8;
  int v9;
  int v10;
  int v11;
  float v12;
  int v13;
  int v14;
  CMResampleAccessoryDeviceMotion *value;
  CMResampleAccessoryDeviceMotion *v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  char v23;
  int v24;
  uint64_t v25;
  double v26;
  void *v27;
  CMDeviceMotion *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  double v42;
  char *v43;
  CMResampleAccessoryDeviceMotion *v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  __int16 v48;
  CMAudioAccessoryManager *v49;
  __int128 v50;
  _QWORD v51[6];
  _QWORD v52[4];
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  __int16 v57;
  char v58;
  uint64_t v59;
  char v60;
  int v61;
  float32x4_t v62;
  float v63;
  int v64;
  int v65;
  float v66;
  int v67;
  int v68;
  char v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  float32x4_t v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[22];
  __int128 v77;
  float32x4_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  int v83;
  void *v84;
  __int16 v85;
  double v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  double v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  internal = (float *)self->_internal;
  v4 = *((_OWORD *)a3 + 1);
  v74 = *(_OWORD *)a3;
  v75 = v4;
  *(_OWORD *)v76 = *((_OWORD *)a3 + 2);
  *(_QWORD *)&v76[14] = *(_QWORD *)((char *)a3 + 46);
  v79 = *(_OWORD *)((char *)a3 + 88);
  v80 = *(_OWORD *)((char *)a3 + 104);
  v81 = *(_OWORD *)((char *)a3 + 120);
  v82 = *((_QWORD *)a3 + 17);
  v77 = *(_OWORD *)((char *)a3 + 56);
  v5 = *(float32x4_t *)((char *)a3 + 72);
  v78 = v5;
  if (*((_QWORD *)internal + 33))
  {
    if (*((_QWORD *)internal + 32))
    {
      sub_18F3D3764((uint64_t)(internal + 68), (float *)&v74, &v73, v5);
      v7 = sub_18F3D39F4(internal + 68, *(float *)&v76[8], *(float *)&v76[12], *(float *)&v76[16]);
      v9 = v8;
      v11 = v10;
      v12 = sub_18F3D39F4(internal + 68, *(float *)&v75, *((float *)&v75 + 1), *((float *)&v75 + 2));
      v62 = v73;
      v63 = v7;
      v64 = v9;
      v65 = v11;
      v66 = v12;
      v67 = v13;
      v68 = v14;
      v69 = v76[21] & 1;
      v70 = v80;
      v71 = *((_QWORD *)&v77 + 1);
      v72 = 0;
      value = self->_resampleAccessoryDeviceMotion.__ptr_.__value_;
      if (value)
      {
        if (sub_18F3A0324((uint64_t)value, (uint64_t)&v62))
        {
          v16 = self->_resampleAccessoryDeviceMotion.__ptr_.__value_;
          if (*((_WORD *)v16 + 5))
          {
            v49 = self;
            v17 = 0;
            do
            {
              v18 = sub_18F407ADC((unsigned __int16 *)v16 + 4, v17);
              v19 = *(float *)(v18 + 12);
              v20 = *(float *)v18;
              v21 = *(float *)(v18 + 4);
              v22 = *(float *)(v18 + 8);
              v23 = *(_BYTE *)(v18 + 40);
              v24 = *(_DWORD *)(v18 + 44);
              v50 = *(_OWORD *)(v18 + 16);
              v25 = *(_QWORD *)(v18 + 32);
              v26 = *(double *)(sub_18F407ADC((unsigned __int16 *)v16 + 4, v17) + 48);
              v27 = (void *)MEMORY[0x194001B4C]();
              v28 = [CMDeviceMotion alloc];
              *(double *)v52 = v19;
              *(double *)&v52[1] = v20;
              *(double *)&v52[2] = v21;
              *(double *)&v52[3] = v22;
              v53 = v50;
              v54 = v25;
              v55 = 0;
              v56 = 0xFFFFFFFF00000000;
              v57 = 0;
              v58 = v23;
              v59 = 0;
              v60 = 0;
              v61 = v24;
              v32 = (void *)objc_msgSend_initWithDeviceMotion_internal_timestamp_(v28, v29, (uint64_t)v52, v30, v31, COERCE_DOUBLE(__PAIR64__(DWORD1(v50), -1.0)), v26);
              v33 = *((_QWORD *)internal + 32);
              if (qword_1ECEDEE78 != -1)
                dispatch_once(&qword_1ECEDEE78, &unk_1E29536A8);
              v34 = off_1ECEDEE70;
              if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
              {
                v35 = mach_absolute_time();
                v36 = sub_18F1FD20C(v35);
                *(_DWORD *)buf = 138543618;
                v88 = v32;
                v89 = 2050;
                v90 = v36;
                _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_DEBUG, "Audio Accessory CMDeviceMotion: %{public}@,now,%{public}f", buf, 0x16u);
              }
              if (sub_18F1FCA08(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1ECEDEE78 != -1)
                  dispatch_once(&qword_1ECEDEE78, &unk_1E29536A8);
                v41 = mach_absolute_time();
                v42 = sub_18F1FD20C(v41);
                v83 = 138543618;
                v84 = v32;
                v85 = 2050;
                v86 = v42;
                v43 = (char *)_os_log_send_and_compose_impl();
                sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryManager onAudioAccessoryDeviceMotion:]", "CoreLocation: %s\n", v43);
                if (v43 != (char *)buf)
                  free(v43);
              }
              v40 = (void *)*((_QWORD *)internal + 33);
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = sub_18F407CD4;
              v51[3] = &unk_1E2955B60;
              v51[4] = v32;
              v51[5] = v33;
              objc_msgSend_addOperationWithBlock_(v40, v37, (uint64_t)v51, v38, v39);

              objc_autoreleasePoolPop(v27);
              ++v17;
            }
            while (v17 < *((unsigned __int16 *)v16 + 5));
            v44 = v49->_resampleAccessoryDeviceMotion.__ptr_.__value_;
            v45 = *((unsigned __int16 *)v44 + 5);
            if (v45 >= 2)
            {
              v46 = *((unsigned __int16 *)v44 + 4);
              do
              {
                v47 = v46 + 1;
                if (v47 >= *((unsigned int *)v44 + 3))
                  v48 = *((_DWORD *)v44 + 3);
                else
                  v48 = 0;
                v46 = (unsigned __int16)(v47 - v48);
                --v45;
              }
              while ((unsigned __int16)v45 > 1u);
              *((_WORD *)v44 + 4) = v46;
              *((_WORD *)v44 + 5) = 1;
            }
          }
        }
      }
    }
  }
}

- (void)onAudioAccessoryDeviceMotionConfig:(const void *)a3
{
  float32x4_t v3;
  float32x4_t *internal;
  unsigned int v5;
  float32x4_t v6;

  internal = (float32x4_t *)self->_internal;
  v5 = *((_DWORD *)a3 + 18);
  v3.f32[0] = -*((float *)a3 + 17);
  *(float32x2_t *)v6.f32 = vneg_f32(*(float32x2_t *)((char *)a3 + 60));
  v6.i64[1] = __PAIR64__(v5, v3.u32[0]);
  sub_18F1FFE94(&v6, v3);
  internal[17] = v6;
}

- (void)onAudioAccessoryDeviceMotionStatus:(const int *)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  internal = self->_internal;
  v6 = (void *)internal[38];
  if (v6)
  {
    v7 = internal[37];
    if (v7)
    {
      v8 = *a3;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = sub_18F407D9C;
      v9[3] = &unk_1E2955AA8;
      v9[4] = v7;
      v9[5] = v8;
      objc_msgSend_addOperationWithBlock_(v6, a2, (uint64_t)v9, v3, v4);
    }
  }
}

- (void)onAudioAccessoryActivity:(const void *)a3
{
  _QWORD *internal;
  uint64_t v4;
  const char *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  CMMotionActivity *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  _QWORD v33[6];
  _QWORD v34[6];
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  int v50;
  uint64_t v51;
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (internal[42])
  {
    v4 = internal[41];
    if (v4)
    {
      v7 = (void *)MEMORY[0x194001B4C]();
      if (*((_BYTE *)a3 + 142))
      {
        v8 = *((unsigned __int8 *)a3 + 141);
        if (qword_1ECEDEE38 != -1)
          dispatch_once(&qword_1ECEDEE38, &unk_1E2957248);
        v9 = qword_1ECEDEE30;
        if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v53 = v8;
          _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_INFO, "[CMAudioAccessoryManager] notifying client of activity: %{public}lu", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE38 != -1)
            dispatch_once(&qword_1ECEDEE38, &unk_1E2957248);
          v50 = 134349056;
          v51 = v8;
          v32 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryManager onAudioAccessoryActivity:]", "CoreLocation: %s\n", v32);
          if (v32 != (char *)buf)
            free(v32);
        }
        v13 = objc_msgSend_motionActivityForHeadphoneActivity_(CMHeadphoneActivityUtils, v10, v8, v11, v12);
        v14 = *((_QWORD *)a3 + 8);
        v15 = [CMMotionActivity alloc];
        v35 = v13;
        v36 = 0x100000001;
        v37 = 0;
        v39 = 0;
        v38 = 0;
        v40 = 0;
        v41 = v14;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0;
        v19 = (void *)objc_msgSend_initWithMotionActivity_(v15, v16, (uint64_t)&v35, v17, v18);
        v20 = (void *)internal[42];
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = sub_18F4080DC;
        v34[3] = &unk_1E2955B60;
        v34[4] = v19;
        v34[5] = v4;
        objc_msgSend_addOperationWithBlock_(v20, v21, (uint64_t)v34, v22, v23);

      }
      else
      {
        v48 = *MEMORY[0x1E0CB2D50];
        v49 = CFSTR("Connected headphone does not support activity.");
        v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)&v49, (uint64_t)&v48, 1);
        v27 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v25, 109, v24, v26);
        v28 = (void *)internal[42];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = sub_18F4080F0;
        v33[3] = &unk_1E2955B60;
        v33[4] = v27;
        v33[5] = v4;
        objc_msgSend_addOperationWithBlock_(v28, v29, (uint64_t)v33, v30, v31);
      }
      objc_autoreleasePoolPop(v7);
    }
  }
}

- (void)onAudioAccessoryHeartRate:(const Sample *)a3
{
  char *internal;
  __int128 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];

  internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v5 = *(_OWORD *)&a3->acceleration.z;
  *(_OWORD *)(internal + 376) = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)(internal + 392) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((_QWORD *)internal + 46))
  {
    if (*((_QWORD *)internal + 45))
    {
      v6 = (void *)MEMORY[0x194001B4C]();
      v8 = *((_QWORD *)internal + 45);
      v7 = (void *)*((_QWORD *)internal + 46);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F4081B0;
      v12[3] = &unk_1E2955AA8;
      v12[4] = v8;
      v12[5] = a3;
      objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v12, v10, v11);
      objc_autoreleasePoolPop(v6);
    }
  }
}

- (void)onAudioAccessoryPPG:(const Sample *)a3
{
  os_unfair_lock_s *internal;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];

  internal = (os_unfair_lock_s *)self->_internal;
  os_unfair_lock_lock(internal + 2);
  v5 = *(_OWORD *)&a3->timestamp;
  v6 = *(_OWORD *)&a3->acceleration.z;
  *(_QWORD *)&internal[116]._os_unfair_lock_opaque = *(_QWORD *)&a3[1].acceleration.x;
  *(_OWORD *)&internal[108]._os_unfair_lock_opaque = v5;
  *(_OWORD *)&internal[112]._os_unfair_lock_opaque = v6;
  os_unfair_lock_unlock(internal + 2);
  if (*(_QWORD *)&internal[106]._os_unfair_lock_opaque)
  {
    if (*(_QWORD *)&internal[104]._os_unfair_lock_opaque)
    {
      v7 = (void *)MEMORY[0x194001B4C]();
      v9 = *(_QWORD *)&internal[104]._os_unfair_lock_opaque;
      v8 = *(void **)&internal[106]._os_unfair_lock_opaque;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = sub_18F4082BC;
      v13[3] = &unk_1E2955AA8;
      v13[4] = v9;
      v13[5] = a3;
      objc_msgSend_addOperationWithBlock_(v8, v10, (uint64_t)v13, v11, v12);
      objc_autoreleasePoolPop(v7);
    }
  }
}

- (void).cxx_destruct
{
  CMResampleAccessoryDeviceMotion *value;

  value = self->_resampleAccessoryDeviceMotion.__ptr_.__value_;
  self->_resampleAccessoryDeviceMotion.__ptr_.__value_ = 0;
  if (value)
    JUMPOUT(0x194001438);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
