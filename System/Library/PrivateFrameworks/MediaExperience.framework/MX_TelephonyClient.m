@implementation MX_TelephonyClient

- (MX_TelephonyClient)init
{
  MX_TelephonyClient *v2;
  NSObject *v3;
  objc_class *v4;
  uint64_t v5;
  NSObject *mAccessQueue;
  _QWORD v8[5];
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v9.receiver = self;
  v9.super_class = (Class)MX_TelephonyClient;
  v2 = -[MX_TelephonyClient init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->mAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.telephonyclient", v3);
    v11 = 0;
    v12 = &v11;
    v13 = 0x3052000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v4 = (objc_class *)getCoreTelephonyClientClass_softClass;
    v16 = getCoreTelephonyClientClass_softClass;
    v5 = MEMORY[0x1E0C809B0];
    if (!getCoreTelephonyClientClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getCoreTelephonyClientClass_block_invoke;
      v10[3] = &unk_1E3099018;
      v10[4] = &v11;
      __getCoreTelephonyClientClass_block_invoke((uint64_t)v10);
      v4 = (objc_class *)v12[5];
    }
    _Block_object_dispose(&v11, 8);
    v2->mClient = (CoreTelephonyClient *)objc_msgSend([v4 alloc], "initWithQueue:", v2->mAccessQueue);
    mAccessQueue = v2->mAccessQueue;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __26__MX_TelephonyClient_init__block_invoke;
    v8[3] = &unk_1E3099900;
    v8[4] = v2;
    dispatch_async(mAccessQueue, v8);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSObject *mAccessQueue;
  objc_super v5;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  mAccessQueue = self->mAccessQueue;
  if (mAccessQueue)
    dispatch_release(mAccessQueue);

  v5.receiver = self;
  v5.super_class = (Class)MX_TelephonyClient;
  -[MX_TelephonyClient dealloc](&v5, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

- (id)copyIsoCountryCodeForMCC
{
  NSObject *mAccessQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  mAccessQueue = self->mAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__MX_TelephonyClient_copyIsoCountryCodeForMCC__block_invoke;
  v5[3] = &unk_1E309C368;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_async_and_wait(mAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)getIsInHomeCountry
{
  NSObject *mAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  mAccessQueue = self->mAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__MX_TelephonyClient_getIsInHomeCountry__block_invoke;
  v5[3] = &unk_1E309C368;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_async_and_wait(mAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)copyCountryNameFromOperatorCountryBundle
{
  NSObject *mAccessQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  mAccessQueue = self->mAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__MX_TelephonyClient_copyCountryNameFromOperatorCountryBundle__block_invoke;
  v5[3] = &unk_1E309C368;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_async_and_wait(mAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
