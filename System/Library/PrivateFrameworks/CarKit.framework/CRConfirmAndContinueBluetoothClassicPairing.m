@implementation CRConfirmAndContinueBluetoothClassicPairing

void __CRConfirmAndContinueBluetoothClassicPairing_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(unsigned __int8 *)(a1 + 64);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_2;
  v11[3] = &unk_1E5429020;
  v9 = *(_QWORD *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = v5;
  v10 = v5;
  objc_msgSend(a2, "startBluetoothClassicPairingForDeviceAddress:deviceName:numericCode:showBluetoothOnlyOption:reply:", v6, v7, v9, v8, v11);

}

uint64_t __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CarPairingLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_3_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "CRConfirmAndContinueBluetoothClassicPairing failed to call carkitd: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
