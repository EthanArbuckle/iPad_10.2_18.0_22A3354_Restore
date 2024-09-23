@implementation AXXIPCSimpleSendDataWithFencePort

void ____AXXIPCSimpleSendDataWithFencePort_block_invoke(uint64_t a1)
{
  _QWORD v1[5];
  int v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = ____AXXIPCSimpleSendDataWithFencePort_block_invoke_2;
  v1[3] = &unk_1E24C7138;
  v1[4] = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v1);
}

void ____AXXIPCSimpleSendDataWithFencePort_block_invoke_2(uint64_t a1)
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
  void *v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
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
    if ((*(_DWORD *)(a1 + 40) + 1) >= 2)
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x2050000000;
      v11 = (void *)getUIWindowClass_softClass;
      v17 = getUIWindowClass_softClass;
      if (!getUIWindowClass_softClass)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __getUIWindowClass_block_invoke;
        v13[3] = &unk_1E24C4AE0;
        v13[4] = &v14;
        __getUIWindowClass_block_invoke((uint64_t)v13);
        v11 = (void *)v15[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v14, 8);
      objc_msgSend(v12, "_synchronizeDrawingAcrossProcessesOverPort:", *(unsigned int *)(a1 + 40));
    }
  }
}

@end
