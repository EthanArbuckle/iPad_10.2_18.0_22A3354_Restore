@implementation CBUtil

+ (BOOL)isAppleVID:(unsigned __int16)a3 forVIDSrc:(unsigned __int8)a4
{
  int v4;

  if (a4 == 2)
    v4 = 1452;
  else
    v4 = 76;
  return v4 == a3;
}

+ (BOOL)isWatchOS
{
  return 0;
}

+ (BOOL)isXROS
{
  return 0;
}

+ (BOOL)isDeviceSupportedOnXROS:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  char v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  int v25;
  const char *v26;
  __int16 v27;
  _BYTE v28[10];
  __int16 v29;
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v4 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 136315394;
    v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
    v27 = 2112;
    *(_QWORD *)v28 = v3;
    _os_log_impl(&dword_1A82A2000, v4, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v25, 0x16u);
  }
  objc_msgSend(v3, "valueForKey:", CFSTR("DeviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedCharValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("VendorIDSrc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedCharValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("VendorID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedShortValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("ProductID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedShortValue");

  if (v8 >= 3)
  {
    if (CBLogInitOnce == -1)
    {
      v13 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
LABEL_22:
      +[CBUtil isDeviceSupportedOnXROS:].cold.1(v8, v13);
      if (+[CBUtil isAppleVID:forVIDSrc:](CBUtil, "isAppleVID:forVIDSrc:", v10, v8))
        goto LABEL_9;
LABEL_23:
      if (v6 - 16 < 5 && ((0x1Bu >> (v6 - 16)) & 1) != 0)
        goto LABEL_29;
      if (CBLogInitOnce == -1)
      {
        v23 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
      }
      else
      {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        v23 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
      }
      v25 = 136446210;
      v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
      v20 = "%{public}s - Third party non-audio device - APPROVED";
      v21 = v23;
      v22 = 12;
      goto LABEL_28;
    }
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v13 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
  }
LABEL_8:
  if (!+[CBUtil isAppleVID:forVIDSrc:](CBUtil, "isAppleVID:forVIDSrc:", v10, v8))
    goto LABEL_23;
LABEL_9:
  if (v6 > 0x31)
    goto LABEL_18;
  if (((1 << v6) & 0x1B0000) != 0)
    goto LABEL_29;
  if (((1 << v6) & 0x2000023000000) == 0)
  {
LABEL_18:
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v19 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      goto LABEL_20;
    }
    v19 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:
      v25 = 136446466;
      v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
      v27 = 1024;
      *(_DWORD *)v28 = v6;
      v20 = "%{public}s - Apple device type=%d (not HID or audio) - APPROVED";
      v21 = v19;
      v22 = 18;
LABEL_28:
      _os_log_impl(&dword_1A82A2000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v25, v22);
    }
LABEL_29:
    v18 = 1;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(&unk_1E54240D0, "containsObject:", v14);

  if (CBLogInitOnce == -1)
  {
    v16 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      v17 = "APPROVED";
      v25 = 136447234;
      v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
      *(_DWORD *)v28 = v6;
      v27 = 1024;
      if (v15)
        v17 = "REJECTED";
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v12;
      v29 = 2112;
      v30 = &unk_1E54240D0;
      v31 = 2082;
      v32 = v17;
      _os_log_impl(&dword_1A82A2000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s - Apple device type=%d (HID) - checking PID 0x%04X against rejected list %@ ->%{public}s", (uint8_t *)&v25, 0x2Cu);
    }
  }
  else
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v16 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
  }
  v18 = v15 ^ 1;
LABEL_30:

  return v18;
}

+ (BOOL)isDeviceSupportedOnWatchOS:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  int v21;
  const char *v22;
  __int16 v23;
  _BYTE v24[14];
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v4 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
    v23 = 2112;
    *(_QWORD *)v24 = v3;
    _os_log_impl(&dword_1A82A2000, v4, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v21, 0x16u);
  }
  objc_msgSend(v3, "valueForKey:", CFSTR("DeviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedCharValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("VendorIDSrc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedCharValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("VendorID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedShortValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("ProductID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedShortValue");

  if (v6 == 24)
  {
    if (+[CBUtil isAppleVID:forVIDSrc:](CBUtil, "isAppleVID:forVIDSrc:", v10, v8))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(&unk_1E54240E8, "containsObject:", v15);

      if (CBLogInitOnce == -1)
      {
        v16 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
      }
      else
      {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        v16 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
      }
      v17 = "REJECTED";
      v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
      v23 = 1024;
      v21 = 136446978;
      *(_DWORD *)v24 = v12;
      if (v14)
        v17 = "APPROVED";
      *(_WORD *)&v24[4] = 2112;
      *(_QWORD *)&v24[6] = &unk_1E54240E8;
      v25 = 2082;
      v26 = v17;
      _os_log_impl(&dword_1A82A2000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s - Apple keyboard - checking PID 0x%04X against approved list %@ ->%{public}s", (uint8_t *)&v21, 0x26u);
      goto LABEL_24;
    }
    if (CBLogInitOnce == -1)
    {
      v18 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v18 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
    }
    v21 = 136446210;
    v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
    v19 = "%{public}s - Third party keyboard - APPROVED";
    goto LABEL_22;
  }
  if (v6 != 25)
  {
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v18 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      goto LABEL_18;
    }
    v18 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:
      v21 = 136446210;
      v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
      v19 = "%{public}s - Not a mouse or a keyboard - APPROVED";
LABEL_22:
      _os_log_impl(&dword_1A82A2000, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v21, 0xCu);
    }
LABEL_23:
    LOBYTE(v14) = 1;
    goto LABEL_24;
  }
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v13 = CBLogComponent;
    LOBYTE(v14) = 0;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    goto LABEL_9;
  }
  v13 = CBLogComponent;
  LOBYTE(v14) = 0;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
LABEL_9:
    v21 = 136446210;
    v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
    _os_log_impl(&dword_1A82A2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s - Mouse - REJECTED", (uint8_t *)&v21, 0xCu);
    LOBYTE(v14) = 0;
  }
LABEL_24:

  return v14;
}

+ (BOOL)isDeviceSupportedWithType:(unsigned __int8)a3 VIDsrc:(unsigned __int8)a4 VID:(unsigned __int16)a5 PID:(unsigned __int16)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("DeviceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v15[1] = CFSTR("VendorIDSrc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  v15[2] = CFSTR("VendorID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  v15[3] = CFSTR("ProductID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = +[CBUtil isDeviceSupported:](CBUtil, "isDeviceSupported:", v13);

  return v6;
}

+ (BOOL)isDeviceSupported:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  BOOL v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v4 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "+[CBUtil isDeviceSupported:]";
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1A82A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s - %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (+[CBUtil isWatchOS](CBUtil, "isWatchOS"))
  {
    v5 = +[CBUtil isDeviceSupportedOnWatchOS:](CBUtil, "isDeviceSupportedOnWatchOS:", v3);
  }
  else
  {
    if (!+[CBUtil isXROS](CBUtil, "isXROS"))
    {
      v6 = 1;
      goto LABEL_11;
    }
    v5 = +[CBUtil isDeviceSupportedOnXROS:](CBUtil, "isDeviceSupportedOnXROS:", v3);
  }
  v6 = v5;
LABEL_11:

  return v6;
}

+ (int64_t)preSSPStringToPairingCode:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");
  __memcpy_chk();
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v5 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "+[CBUtil preSSPStringToPairingCode:]";
    v9 = 2114;
    v10 = v3;
    v11 = 2048;
    v12 = 0;
    _os_log_impl(&dword_1A82A2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - str:%{public}@ -> pairingcode:0x%016llX", buf, 0x20u);
  }

  return 0;
}

+ (id)preSSPPairingCodeToString:(int64_t)a3
{
  void *v3;
  NSObject *v4;
  int64_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v4 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "+[CBUtil preSSPPairingCodeToString:]";
    v9 = 2048;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_1A82A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s - pairingcode:0x%016llX -> str:%{public}@", buf, 0x20u);
  }
  return v3;
}

+ (BOOL)isInternalBuild
{
  return os_variant_has_internal_diagnostics();
}

+ (void)setBluetoothDebugSetting:(__CFString *)a3 InKey:(__CFString *)a4 InValue:(void *)a5
{
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *Mutable;
  __CFString *v12;

  v8 = (const __CFDictionary *)CFPreferencesCopyAppValue(a3, CFSTR("com.apple.MobileBluetooth.debug"));
  if (v8)
  {
    v9 = v8;
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v8);
    CFRelease(v9);
    Mutable = MutableCopy;
    v12 = a4;
    if (a5)
    {
LABEL_3:
      CFDictionarySetValue(Mutable, v12, a5);
      goto LABEL_6;
    }
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    MutableCopy = Mutable;
    v12 = a4;
    if (a5)
      goto LABEL_3;
  }
  CFDictionaryRemoveValue(Mutable, v12);
  if (!CFDictionaryGetCount(MutableCopy))
  {
    CFRelease(MutableCopy);
    CFPreferencesSetAppValue(a3, 0, CFSTR("com.apple.MobileBluetooth.debug"));
    return;
  }
LABEL_6:
  CFPreferencesSetAppValue(a3, MutableCopy, CFSTR("com.apple.MobileBluetooth.debug"));
  if (MutableCopy)
    CFRelease(MutableCopy);
}

+ (id)getBluetoothDebugSettingString:(__CFString *)a3 InKey:(__CFString *)a4
{
  void *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFDictionary *MutableCopy;
  void *Value;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", ", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const __CFDictionary *)CFPreferencesCopyAppValue(a3, CFSTR("com.apple.MobileBluetooth.debug"));
  if (v7)
  {
    v8 = v7;
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v7);
    if (a4)
    {
      Value = (void *)CFDictionaryGetValue(MutableCopy, a4);
      if (Value)
      {
        v11 = Value;

        CFRelease(v11);
        v6 = v11;
      }
    }
    CFRelease(v8);
  }
  return v6;
}

+ (id)decodeApplePayloadByteStream:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t *v14;
  __int16 v16;
  uint8_t buf[2];

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");
  if ((unint64_t)objc_msgSend(v5, "length") < 3)
  {
LABEL_8:
    v12 = v4;
    goto LABEL_19;
  }
  v7 = 2;
  v8 = 2;
  while (1)
  {
    if (*(_BYTE *)(v6 + v7) != 100)
      goto LABEL_3;
    if (objc_msgSend(v5, "length") - 1 <= v7)
      break;
    v9 = v8 + v6;
    v10 = *(unsigned __int8 *)(v9 + 1);
    if (!*(_BYTE *)(v9 + 1))
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v13 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v14 = buf;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9 + 2, *(unsigned __int8 *)(v9 + 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, &unk_1E54238E0);

    v8 += v10;
LABEL_3:
    v7 = ++v8;
    if (objc_msgSend(v5, "length") <= (unint64_t)v8)
      goto LABEL_8;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v13 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 0;
    v14 = (uint8_t *)&v16;
LABEL_17:
    _os_log_impl(&dword_1A82A2000, v13, OS_LOG_TYPE_DEFAULT, "decodeApplePayloadByteStream failed to decode payload", v14, 2u);
  }
LABEL_18:
  v12 = 0;
LABEL_19:

  return v12;
}

+ (id)encodeApplePayloadByteStream:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int16 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = 76;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v20, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 == v8)
        {
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v10, "integerValue") != 100)
            continue;
        }
        else
        {
          objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v10, "integerValue") != 100)
            continue;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "length"))
        {
          v15 = 100;
          v14 = 0;
          v14 = objc_msgSend(v12, "length");
          objc_msgSend(v4, "appendBytes:length:", &v15, 1);
          objc_msgSend(v4, "appendBytes:length:", &v14, 1);
          objc_msgSend(v4, "appendData:", v12);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)isDeviceSupportedOnXROS:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A82A2000, a2, OS_LOG_TYPE_ERROR, "API MISUSE: CBUtil isDeviceSupported - invalid value provided for vendorIdSrc:%d (assuming CBVendorIDSourceBluetooth)", (uint8_t *)v2, 8u);
}

@end
