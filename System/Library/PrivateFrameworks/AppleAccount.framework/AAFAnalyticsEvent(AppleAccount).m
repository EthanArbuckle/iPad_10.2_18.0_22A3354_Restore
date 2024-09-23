@implementation AAFAnalyticsEvent(AppleAccount)

+ (id)analyticsEventWithName:()AppleAccount altDSID:flowID:
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc(MEMORY[0x1E0CF0E68]);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v11 = (_QWORD *)getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_ptr;
  v22 = getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_ptr;
  if (!getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_ptr)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_block_invoke;
    v18[3] = &unk_1E416F0A0;
    v18[4] = &v19;
    __getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_block_invoke((uint64_t)v18);
    v11 = (_QWORD *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v11)
    +[AAFAnalyticsEvent(AppleAccount) analyticsEventWithName:altDSID:flowID:].cold.1();
  v12 = (void *)objc_msgSend(v10, "initWithEventName:eventCategory:initData:", v7, *v11, 0);
  v13 = v12;
  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CF0EF0]);
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "authKitAccountWithAltDSID:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "accountAccessTelemetryOptInForAccount:", v15))
  {
    objc_msgSend(v14, "telemetryDeviceSessionIDForAccount:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CF0ED8]);

  }
  return v13;
}

+ (void)analyticsEventWithName:()AppleAccount altDSID:flowID:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSNumber *const getkCDPRTCEventCategoryAccountDataAccessRecovery(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AAFAnalyticsEvent+AppleAccount.m"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
