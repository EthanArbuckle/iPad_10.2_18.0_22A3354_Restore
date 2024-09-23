@implementation AXXIPCSendDataWithAsyncReply

void ____AXXIPCSendDataWithAsyncReply_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  mach_error_t v16;
  mach_error_t v17;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    AXLogIPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ____AXXIPCSendData_block_invoke_2_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_7:

    goto LABEL_8;
  }
  *(_BYTE *)(v5 + 24) = 1;
  v14 = *(_DWORD *)(a1 + 40);
  v15 = objc_retainAutorelease(v3);
  v16 = _AXIPCReplyToAsyncRequest(v14, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
  if (v16)
  {
    v17 = v16;
    AXLogIPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ____AXXIPCSendDataWithAsyncReply_block_invoke_cold_1(v17, v6);
    goto LABEL_7;
  }
LABEL_8:

}

void ____AXXIPCSendDataWithAsyncReply_block_invoke_cold_1(mach_error_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  mach_error_string(a1);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_18C62B000, a2, v3, "async reply to message failed: %{public}s", v4);
  OUTLINED_FUNCTION_1_2();
}

@end
