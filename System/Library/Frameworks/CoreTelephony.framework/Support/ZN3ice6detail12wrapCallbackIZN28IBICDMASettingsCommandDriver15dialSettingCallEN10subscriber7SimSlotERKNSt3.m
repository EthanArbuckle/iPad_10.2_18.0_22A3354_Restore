@implementation ZN3ice6detail12wrapCallbackIZN28IBICDMASettingsCommandDriver15dialSettingCallEN10subscriber7SimSlotERKNSt3

_QWORD *___ZN3ice6detail12wrapCallbackIZN28IBICDMASettingsCommandDriver15dialSettingCallEN10subscriber7SimSlotERKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENS5_8functionIFvvEEEE3__0vEEN8dispatch5blockIU13block_pointerFiPhjEEENS5_17integral_constantIiLi2EEEOT__block_invoke(_QWORD *result, const unsigned __int8 *a2)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject **v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  _OWORD v16[4];
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)result[4];
  if (v2)
  {
    v3 = *v2;
    if (!a2)
    {
      v11 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v16[0]) = 0;
        _os_log_error_impl(&dword_21DCD7000, v11, OS_LOG_TYPE_ERROR, "No data received!", (uint8_t *)v16, 2u);
      }
      goto LABEL_12;
    }
    v19 = 0;
    v17 = 0u;
    v18 = 0u;
    memset(v16, 0, sizeof(v16));
    AriSdk::ARI_IBICallCsSetupCallRspCb_SDK::ARI_IBICallCsSetupCallRspCb_SDK((AriSdk::ARI_IBICallCsSetupCallRspCb_SDK *)v16, a2);
    v4 = (NSObject **)(v3 + 40);
    if (!ice::processMessage<AriSdk::ARI_IBICallCsSetupCallRspCb_SDK,void>((AriSdk::ARI_IBICallCsSetupCallRspCb_SDK *)v16, (ice *)0x9008000, (NSObject **)(v3 + 40)))
    {
      v12 = *v4;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_WORD *)buf = 0;
      v8 = "Error in parsing response";
      goto LABEL_27;
    }
    if (*(_DWORD *)v18)
    {
      if (*((_QWORD *)&v18 + 1))
      {
        v5 = **((_DWORD **)&v18 + 1);
        v6 = *v4;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v7 = asString();
          *(_DWORD *)buf = 136315394;
          v21 = v7;
          v22 = 1024;
          v23 = v5;
          v8 = "Error in call setup response: %s (%u)";
          v9 = v6;
          v10 = 18;
LABEL_28:
          _os_log_error_impl(&dword_21DCD7000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        }
LABEL_11:
        MEMORY[0x2207A1F00](v16);
LABEL_12:
        *(_BYTE *)(v3 + 128) = 0;
        v13 = v3 + 128;
        result = *(_QWORD **)(v13 - 8);
        if (result)
          return (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t))(*result + 48))(result, v13);
        return result;
      }
      v12 = *v4;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_WORD *)buf = 0;
      v8 = "Unknown Error in response";
LABEL_27:
      v9 = v12;
      v10 = 2;
      goto LABEL_28;
    }
    if (!*((_QWORD *)&v17 + 1))
    {
      v12 = *v4;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_WORD *)buf = 0;
      v8 = "No callID";
      goto LABEL_27;
    }
    if (!(_QWORD)v17)
    {
      v12 = *v4;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_WORD *)buf = 0;
      v8 = "No simSlot";
      goto LABEL_27;
    }
    v14 = **((_BYTE **)&v17 + 1);
    *(_BYTE *)(v3 + 140) = v14;
    v15 = *(NSObject **)(v3 + 40);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v14;
      _os_log_impl(&dword_21DCD7000, v15, OS_LOG_TYPE_DEFAULT, "#I call id is : %u", buf, 8u);
    }
    return (_QWORD *)MEMORY[0x2207A1F00](v16);
  }
  return result;
}

@end
