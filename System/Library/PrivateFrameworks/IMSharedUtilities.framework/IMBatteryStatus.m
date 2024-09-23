@implementation IMBatteryStatus

- (BOOL)isCharging
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AE8394](self, a2);
  if (qword_1ECFC6BE8 != -1)
    dispatch_once(&qword_1ECFC6BE8, &unk_1E3FB3508);
  if (qword_1ECFC6BF8 != -1)
    dispatch_once(&qword_1ECFC6BF8, &unk_1E3FB4288);
  if (qword_1ECFC6C08 != -1)
    dispatch_once(&qword_1ECFC6C08, &unk_1E3FB4528);
  if (qword_1ECFC6C18 != -1)
    dispatch_once(&qword_1ECFC6C18, &unk_1E3FB46C8);
  if (qword_1ECFC6C28 != -1)
    dispatch_once(&qword_1ECFC6C28, &unk_1E3FB4788);
  if (off_1ECFC6C10 && off_1ECFC6BE0 && off_1ECFC6BF0 && off_1ECFC6C00 && byte_1ECFC6C20 == 1)
  {
    v4 = off_1ECFC6BE0("IOPMPowerSource");
    if (v4)
    {
      v5 = off_1ECFC6BF0(dword_1EE503B2C, v4);
      if ((_DWORD)v5)
      {
        v6 = v5;
        v7 = *MEMORY[0x1E0C9AE00];
        v8 = objc_msgSend((id)off_1ECFC6C00(v5, CFSTR("IsCharging"), *MEMORY[0x1E0C9AE00], 0), "BOOLValue");
        v9 = objc_msgSend((id)off_1ECFC6C00(v6, CFSTR("ExternalConnected"), v7, 0), "BOOLValue");
        v10 = objc_msgSend((id)off_1ECFC6C00(v6, CFSTR("FullyCharged"), v7, 0), "BOOLValue");
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v12 = CFSTR("NO");
            if (v8)
              v13 = CFSTR("YES");
            else
              v13 = CFSTR("NO");
            if ((_DWORD)v9)
              v14 = CFSTR("YES");
            else
              v14 = CFSTR("NO");
            v22 = 138412802;
            v23 = v13;
            v24 = 2112;
            v25 = v14;
            if (v10)
              v12 = CFSTR("YES");
            v26 = 2112;
            v27 = v12;
            _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Battery status isChargingPerIOKit %@ isExternalConnected %@ isFullyCharged %@", (uint8_t *)&v22, 0x20u);
          }

        }
        off_1ECFC6C10(v6);
        v15 = 1;
        goto LABEL_45;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Failed to load service for _kIOMasterPortDefault", (uint8_t *)&v22, 2u);
        }
LABEL_43:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Unable to load a service for IOPMPowerSource", (uint8_t *)&v22, 2u);
      }
      goto LABEL_43;
    }
    v15 = 0;
    v9 = 0;
LABEL_45:
    v17 = 1;
    goto LABEL_46;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "One or more weak linked symbols were not loaded.", (uint8_t *)&v22, 2u);
    }

  }
  v15 = 0;
  v17 = 0;
  v9 = 0;
LABEL_46:
  objc_autoreleasePoolPop(v3);
  -[IMBatteryStatus testDelegate](self, "testDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[IMBatteryStatus testDelegate](self, "testDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "chargingCalledWithResult:isCharging:frameworksLoadedOk:", v15, v9, v17);

  }
  return v9;
}

- (IMBatteryStatusTestDelegate)testDelegate
{
  return (IMBatteryStatusTestDelegate *)objc_loadWeakRetained((id *)&self->_testDelegate);
}

- (void)setTestDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testDelegate);
}

@end
