@implementation APFPDIWrapper

+ (id)settings
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_settings(APSigningAuthoritySettings, a2, v2, v3);
}

+ (int)FPDISignWithContext:(void *)a3 message:(char *)a4 messageLength:(unsigned int)a5 rawSignature:(void *)a6 rawSignatureLength:(unsigned int *)a7
{
  uint64_t v9;
  double Current;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  CFAbsoluteTime v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v9 = *(_QWORD *)&a5;
  v38 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v13, v14, v15)
    && (objc_msgSend_settings(APFPDIWrapper, v16, v17, v18),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_failSigning(v19, v20, v21, v22),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend_BOOLValue(v23, v24, v25, v26),
        v23,
        v19,
        v27))
  {
    *a6 = 0;
    *a7 = 0;
    v28 = -44665;
  }
  else
  {
    sub_1CF252E24((uint64_t)a3, (uint64_t)a4, v9, (uint64_t)a6, (uint64_t)a7);
    v28 = v29;
  }
  v30 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDISign"), v31, (uint64_t)CFSTR(": %.3f"), v32, v30 - Current);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v33;
    _os_log_impl(&dword_1CF251000, v34, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v28;
}

+ (int)FPDIDestroyData:(void *)a3
{
  double Current;
  int v5;
  int v6;
  CFAbsoluteTime v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  sub_1CF26DEA0((uint64_t)a3);
  v6 = v5;
  v7 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDIDataDestroy"), v8, (uint64_t)CFSTR(": %.3f"), v9, v7 - Current);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v6;
}

+ (int)FPDIInitAttribute:(void *)a3
{
  double Current;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;
  CFAbsoluteTime v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v5, v6, v7)
    && (objc_msgSend_settings(APFPDIWrapper, v8, v9, v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_failInitAttribute(v11, v12, v13, v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend_BOOLValue(v15, v16, v17, v18),
        v15,
        v11,
        (v19 & 1) != 0))
  {
    v20 = -44751;
  }
  else
  {
    v20 = sub_1CF36F1E4((uint64_t)a3);
  }
  v21 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDIInitAttribute"), v22, (uint64_t)CFSTR(": %.3f"), v23, v21 - Current);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v24;
    _os_log_impl(&dword_1CF251000, v25, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v20;
}

+ (int)FPDISetHighPrivacyLevelForAttribute:(void *)a3
{
  double Current;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;
  CFAbsoluteTime v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v5, v6, v7)
    && (objc_msgSend_settings(APFPDIWrapper, v8, v9, v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_failSetHighPrivacyLevelForAttribute(v11, v12, v13, v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend_BOOLValue(v15, v16, v17, v18),
        v15,
        v11,
        (v19 & 1) != 0))
  {
    v20 = -44650;
  }
  else
  {
    v20 = sub_1CF36FF80((uint64_t)a3, 1011340354);
  }
  v21 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDIAttrSetPrivacyLevel"), v22, (uint64_t)CFSTR(": %.3f"), v23, v21 - Current);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v24;
    _os_log_impl(&dword_1CF251000, v25, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v20;
}

+ (int)FPDISetStashingIsEnabled:(BOOL)a3 forAttribute:(void *)a4
{
  _BOOL4 v5;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double Current;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  CFAbsoluteTime v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v5 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  if (a3)
    v6 = 1903055587;
  else
    v6 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  if (v5
    && objc_msgSend_isAppleInternalInstall(APSystemInternal, v7, v8, v9)
    && (objc_msgSend_settings(APFPDIWrapper, v11, v12, v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_failSetStashingIsEnabled(v14, v15, v16, v17),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend_BOOLValue(v18, v19, v20, v21),
        v18,
        v14,
        (v22 & 1) != 0))
  {
    v23 = -44802;
  }
  else
  {
    v23 = sub_1CF370EDC((uint64_t)a4, v6);
  }
  v24 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDIAttrSetContextStashingPolicy"), v25, (uint64_t)CFSTR(": %.3f"), v26, v24 - Current);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v27;
    _os_log_impl(&dword_1CF251000, v28, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v23;
}

+ (int)FPDICreateContext:(void *)a3 withAttribute:(void *)a4 initRequest:(void *)a5 initRequestLength:(unsigned int *)a6
{
  double Current;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  int v26;
  int v27;
  CFAbsoluteTime v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v11, v12, v13)
    && (objc_msgSend_settings(APFPDIWrapper, v14, v15, v16),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_failCreateContext(v17, v18, v19, v20),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend_BOOLValue(v21, v22, v23, v24),
        v21,
        v17,
        (v25 & 1) != 0))
  {
    v26 = -44654;
  }
  else
  {
    sub_1CF36348C((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
    v26 = v27;
  }
  v28 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDICreate"), v29, (uint64_t)CFSTR(": %.3f"), v30, v28 - Current);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v31;
    _os_log_impl(&dword_1CF251000, v32, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v26;
}

+ (int)FPDIInitContext:(void *)a3 withInitResponse:(void *)a4 initResponseLength:(unsigned int)a5 setupRequest:(void *)a6 setupRequestLength:(unsigned int *)a7
{
  uint64_t v9;
  double Current;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  int v28;
  int v29;
  CFAbsoluteTime v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v9 = *(_QWORD *)&a5;
  v38 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v13, v14, v15)
    && (objc_msgSend_settings(APFPDIWrapper, v16, v17, v18),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_failContextInit(v19, v20, v21, v22),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend_BOOLValue(v23, v24, v25, v26),
        v23,
        v19,
        (v27 & 1) != 0))
  {
    v28 = -44654;
  }
  else
  {
    sub_1CF2BC200((uint64_t)a3, (uint64_t)a4, v9, (uint64_t)a6, (uint64_t)a7);
    v28 = v29;
  }
  v30 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDIInit"), v31, (uint64_t)CFSTR(": %.3f"), v32, v30 - Current);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v33;
    _os_log_impl(&dword_1CF251000, v34, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v28;
}

+ (int)FPDISetupContext:(void *)a3 withSetupResponse:(void *)a4 setupResponseLength:(unsigned int)a5
{
  double Current;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  int v22;
  int v23;
  CFAbsoluteTime v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v7, v8, v9)
    && (objc_msgSend_settings(APFPDIWrapper, v10, v11, v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_failContextInit(v13, v14, v15, v16),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend_BOOLValue(v17, v18, v19, v20),
        v17,
        v13,
        (v21 & 1) != 0))
  {
    v22 = -44654;
  }
  else
  {
    sub_1CF35635C((uint64_t)a3);
    v22 = v23;
  }
  v24 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDISetup"), v25, (uint64_t)CFSTR(": %.3f"), v26, v24 - Current);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v27;
    _os_log_impl(&dword_1CF251000, v28, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v22;
}

+ (int)FPDIDestroyAttribute:(void *)a3
{
  double Current;
  int v5;
  CFAbsoluteTime v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v5 = sub_1CF36FEE4((uint64_t)a3);
  v6 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDIAttrDestroy"), v7, (uint64_t)CFSTR(": %.3f"), v8, v6 - Current);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1CF251000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v5;
}

+ (int)FPDIDestroyContext:(void *)a3
{
  double Current;
  int v5;
  int v6;
  CFAbsoluteTime v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  sub_1CF322FFC((uint64_t)a3);
  v6 = v5;
  v7 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDIDestroy"), v8, (uint64_t)CFSTR(": %.3f"), v9, v7 - Current);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v6;
}

+ (int)FPDIDestroyAllNonStashedContexts
{
  double Current;
  int v3;
  int v4;
  CFAbsoluteTime v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  sub_1CF2ADC68(2);
  v4 = v3;
  v5 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDIDestroyAllContexts"), v6, (uint64_t)CFSTR(": %.3f"), v7, v5 - Current);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v4;
}

+ (int)FPDIDestroyAllContext
{
  double Current;
  int v3;
  int v4;
  CFAbsoluteTime v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  sub_1CF2ADC68(0);
  v4 = v3;
  v5 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_stringByAppendingFormat_(CFSTR("FPDIDestroyAllContexts"), v6, (uint64_t)CFSTR(": %.3f"), v7, v5 - Current);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v4;
}

@end
