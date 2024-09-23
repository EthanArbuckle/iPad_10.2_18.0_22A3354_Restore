@implementation CRHandleBluetoothClassicPairingCompleted

void __CRHandleBluetoothClassicPairingCompleted_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(unsigned __int8 *)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CRHandleBluetoothClassicPairingCompleted_block_invoke_2;
  v10[3] = &unk_1E5429020;
  v11 = *(id *)(a1 + 48);
  v12 = v5;
  v9 = v5;
  objc_msgSend(a2, "handleBluetoothClassicPairingCompletedForDeviceAddress:name:preApproved:reply:", v6, v7, v8, v10);

}

uint64_t __CRHandleBluetoothClassicPairingCompleted_block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __CRHandleBluetoothClassicPairingCompleted_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CarPairingLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __CRHandleBluetoothClassicPairingCompleted_block_invoke_3_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __CRHandleBluetoothClassicPairingCompleted_block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "CARBluetoothClassicDiscoverer handleBluetoothClassicPairingCompleted failed to call carkitd: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
