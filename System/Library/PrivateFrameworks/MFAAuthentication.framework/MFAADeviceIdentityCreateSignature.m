@implementation MFAADeviceIdentityCreateSignature

void __MFAADeviceIdentityCreateSignature_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  CFAbsoluteTime Current;
  char v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFErrorRef error;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  CFAbsoluteTime v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentityCreateSignature: SecKeyCreateSignature\n", buf, 2u);
  }
  error = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SecKeyCreateSignature(*(SecKeyRef *)(a1 + 40), (SecKeyAlgorithm)*MEMORY[0x24BDE92D8], *(CFDataRef *)(a1 + 48), &error);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    LODWORD(v2) = gCertificateIndex;
    v3 = *((unsigned __int8 *)&gCertificateRefreshState + gCertificateIndex);
    if (v3 == 3)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v16 = gCertificateIndex;
        v17 = 2048;
        v18 = Current;
        _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _storeStateToDisk[%d]: %f\n", buf, 0x12u);
      }
      v5 = 4;
    }
    else
    {
      if (v3 != 1)
      {
LABEL_13:
        _storeStateToDisk(*(_QWORD *)(a1 + 56), v2);
        return;
      }
      Current = CFAbsoluteTimeGetCurrent();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v16 = gCertificateIndex;
        v17 = 2048;
        v18 = Current;
        _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _storeStateToDisk[%d]: %f\n", buf, 0x12u);
      }
      v5 = 2;
    }
    v2 = gCertificateIndex;
    *((_BYTE *)&gCertificateRefreshState + gCertificateIndex) = v5;
    *(CFAbsoluteTime *)&gCertificateUseTimestamp[v2] = Current;
    goto LABEL_13;
  }
  if (error)
  {
    CFRelease(error);
    error = 0;
  }
  v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v6)
    __MFAADeviceIdentityCreateSignature_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
}

void __MFAADeviceIdentityCreateSignature_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "MFAADeviceIdentity: Failed to create signature\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
