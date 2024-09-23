@implementation MFAADeviceIdentityCopyCertificate

void __MFAADeviceIdentityCopyCertificate_block_invoke(uint64_t a1)
{
  const __CFNumber *Value;
  CFTypeID TypeID;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  CFTypeID v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  int ValidIndex;
  CFTypeRef v19;
  double v20;
  uint64_t valuePtr;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  _BYTE v25[10];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (gCertificateRefreshPolicy)
    CFRelease((CFTypeRef)gCertificateRefreshPolicy);
  gCertificateRefreshPolicy = (uint64_t)CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, *(CFDictionaryRef *)(a1 + 48));
  valuePtr = 4;
  Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), CFSTR("Count"));
  TypeID = CFNumberGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID)
    {
      CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
      v4 = valuePtr;
      if (valuePtr != 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __MFAADeviceIdentityCopyCertificate_block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "MFAADeviceIdentityCopyCertificate_block_invoke";
    v24 = 2048;
    *(_QWORD *)v25 = valuePtr;
    *(_WORD *)&v25[8] = 2112;
    v26 = gCertificateRefreshPolicy;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: count %lld, gCertificateRefreshPolicy %@\n", buf, 0x20u);
  }
  v12 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)gCertificateRefreshPolicy, CFSTR("RefreshInterval"));
  if (v12)
  {
    v13 = v12;
    v14 = CFGetTypeID(v12);
    if (v14 == CFNumberGetTypeID())
    {
      v20 = 0.0;
      CFNumberGetValue(v13, kCFNumberDoubleType, &v20);
      v15 = v20;
      if (v20 != 0.0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "MFAADeviceIdentityCopyCertificate_block_invoke";
        v24 = 2048;
        *(double *)v25 = v15;
        _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: interval:%f\n", buf, 0x16u);
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 136315394;
    v23 = "MFAADeviceIdentityCopyCertificate_block_invoke";
    v24 = 2112;
    *(_QWORD *)v25 = v16;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: call _storeRefreshStateToDisk label %@", buf, 0x16u);
  }
  _storeRefreshStateToDisk();
  v17 = 0;
  while (!*((_BYTE *)&gCertificateRefreshState + v17))
  {
    if (++v17 == 4)
      goto LABEL_22;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
LABEL_22:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    _fetchAllCertificates(*(const __CFString **)(a1 + 56));
  ValidIndex = _findValidIndex();
  gCertificateIndex = ValidIndex;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "MFAADeviceIdentityCopyCertificate_block_invoke";
    v24 = 1024;
    *(_DWORD *)v25 = ValidIndex;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: request cert: %d\n", buf, 0x12u);
    ValidIndex = gCertificateIndex;
  }
  v19 = 0;
  v20 = 0.0;
  if (_copyCertificateForIndex(*(const __CFString **)(a1 + 56), ValidIndex, 0, 0, (CFTypeRef *)&v20, &v19))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __MFAADeviceIdentityCopyCertificate_block_invoke_cold_1();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "MFAADeviceIdentityCopyCertificate_block_invoke";
      v24 = 1024;
      *(_DWORD *)v25 = *(_QWORD *)&v20 != 0;
      *(_WORD *)&v25[4] = 1024;
      *(_DWORD *)&v25[6] = v19 != 0;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: cert:%d, key:%d", buf, 0x18u);
    }
    **(double **)(a1 + 64) = v20;
    **(_QWORD **)(a1 + 72) = v19;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __MFAADeviceIdentityCopyCertificate_block_invoke_cold_1()
{
  _DWORD v0[2];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 67109120;
  v0[1] = 368;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "MFAADeviceIdentityCopyCertificate:%d: _copyCertificateForIndex: error\n", (uint8_t *)v0, 8u);
  OUTLINED_FUNCTION_2_0();
}

void __MFAADeviceIdentityCopyCertificate_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_212836000, MEMORY[0x24BDACB70], a3, "%s: unexpected count %lld\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
