@implementation AXXIPCSendData

void ____AXXIPCSendData_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  int v10;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ____AXXIPCSendData_block_invoke_2;
  block[3] = &unk_1E24C70E8;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = *(_DWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, block);

}

void ____AXXIPCSendData_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  mach_error_t v10;
  mach_error_t v11;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    AXLogIPC();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      ____AXXIPCSendData_block_invoke_2_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  else
  {
    *(_BYTE *)(v1 + 24) = 1;
    v10 = _AXIPCAsyncSendDataReply(*(_DWORD *)(a1 + 48), 0, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));
    if (!v10)
      return;
    v11 = v10;
    AXLogIPC();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      ____AXXIPCSendData_block_invoke_2_cold_1(v11, v2);
  }

}

void ____AXXIPCSendData_block_invoke_2_cold_1(mach_error_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  mach_error_string(a1);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_18C62B000, a2, v3, "reply to message failed: %{public}s", v4);
  OUTLINED_FUNCTION_1_2();
}

void ____AXXIPCSendData_block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18C62B000, a1, a3, "Message handled more than one, error state", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
