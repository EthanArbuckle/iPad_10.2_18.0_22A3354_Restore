@implementation APKeychainAnalytics

+ (void)sendKeychainAnalytics:(int)a3 keyName:(id)a4 readCount:(int64_t)a5 writeCount:(int64_t)a6 bundleID:(id)a7
{
  uint64_t v10;
  void *v11;
  __CFString *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint8_t buf[4];
  int v30;
  _QWORD v31[5];
  _QWORD v32[6];

  v10 = *(_QWORD *)&a3;
  v32[5] = *MEMORY[0x1E0C80C00];
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (__CFString *)a7;
  v13 = a4;
  objc_msgSend_stringWithFormat_(v11, v14, (uint64_t)CFSTR("%d"), v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v17, (uint64_t)CFSTR("%ld"), v18, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("%ld"), v21, a6);
  v22 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v22;
  v31[0] = CFSTR("keyName");
  v31[1] = CFSTR("errorCode");
  v32[0] = v13;
  v32[1] = v16;
  v31[2] = CFSTR("bundleIdentifier");
  v31[3] = CFSTR("readCount");
  v25 = CFSTR("unknown");
  if (v12)
    v25 = v12;
  v32[2] = v25;
  v32[3] = v19;
  v31[4] = CFSTR("writeCount");
  v32[4] = v22;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v32, (uint64_t)v31, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendEvent_customPayload_(APAnalytics, v27, (uint64_t)CFSTR("keychain"), (uint64_t)v26);

  APLogForCategory(0x14uLL);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    v30 = v10;
    _os_log_impl(&dword_1CF251000, v28, OS_LOG_TYPE_INFO, "Analytics keychain event status %{public}d", buf, 8u);
  }

}

@end
