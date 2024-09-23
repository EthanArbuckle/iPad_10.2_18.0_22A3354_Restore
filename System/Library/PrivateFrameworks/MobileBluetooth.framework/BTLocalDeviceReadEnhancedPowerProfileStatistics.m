@implementation BTLocalDeviceReadEnhancedPowerProfileStatistics

void __BTLocalDeviceReadEnhancedPowerProfileStatistics_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v4;
  _OWORD *data;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  size_t length;

  v4 = a1 + 32;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  length = 0;
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", &length);
  if (length == 248)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *data;
    v8 = data[1];
    v9 = data[3];
    *(_OWORD *)(v6 + 32) = data[2];
    *(_OWORD *)(v6 + 48) = v9;
    *(_OWORD *)v6 = v7;
    *(_OWORD *)(v6 + 16) = v8;
    v10 = data[4];
    v11 = data[5];
    v12 = data[7];
    *(_OWORD *)(v6 + 96) = data[6];
    *(_OWORD *)(v6 + 112) = v12;
    *(_OWORD *)(v6 + 64) = v10;
    *(_OWORD *)(v6 + 80) = v11;
    v13 = data[8];
    v14 = data[9];
    v15 = data[11];
    *(_OWORD *)(v6 + 160) = data[10];
    *(_OWORD *)(v6 + 176) = v15;
    *(_OWORD *)(v6 + 128) = v13;
    *(_OWORD *)(v6 + 144) = v14;
    v16 = data[12];
    v17 = data[13];
    v18 = data[14];
    *(_QWORD *)(v6 + 240) = *((_QWORD *)data + 30);
    *(_OWORD *)(v6 + 208) = v17;
    *(_OWORD *)(v6 + 224) = v18;
    *(_OWORD *)(v6 + 192) = v16;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 24) = 3;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTLocalDeviceReadEnhancedPowerProfileStatistics_block_invoke_cold_1();
}

void __BTLocalDeviceReadEnhancedPowerProfileStatistics_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "kCBMsgIdLocalDeviceReadEnhancedPowerProfileStatisticsMsg reply result:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
