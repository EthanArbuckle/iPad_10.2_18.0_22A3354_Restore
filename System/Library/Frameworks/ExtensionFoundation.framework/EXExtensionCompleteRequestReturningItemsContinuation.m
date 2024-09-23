@implementation EXExtensionCompleteRequestReturningItemsContinuation

void __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke_2;
      v11[3] = &unk_1E2CFCC18;
      v13 = *(id *)(a1 + 48);
      v12 = *(id *)(a1 + 40);
      objc_msgSend(v4, "performExpiringActivityWithReason:usingBlock:", CFSTR("com.apple.extension-completion"), v11);

      v5 = v13;
    }
    else
    {
      dispatch_get_global_queue(21, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke_4;
      v8[3] = &unk_1E2CFC5E8;
      v10 = *(id *)(a1 + 48);
      v9 = *(id *)(a1 + 40);
      dispatch_async(v7, v8);

      v5 = v10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B70], "_sharedExtensionContextVendor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_tearDownContextWithUUID:", v6);

  }
  os_activity_scope_leave(&state);
}

void __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((a2 & 1) == 0)
  {
    _EXExtensionGetGlobalStateQueue(0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke_3;
    block[3] = &unk_1E2CFC438;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);

  }
}

void __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B70], "_sharedExtensionContextVendor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_tearDownContextWithUUID:", v2);

}

void __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _EXExtensionGetGlobalStateQueue(0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke_5;
  block[3] = &unk_1E2CFC438;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

void __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B70], "_sharedExtensionContextVendor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_tearDownContextWithUUID:", v2);

}

@end
