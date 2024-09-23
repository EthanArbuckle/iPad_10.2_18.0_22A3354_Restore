@implementation MPStoreSocialTransientState

void __44___MPStoreSocialTransientState__endIfNeeded__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  v2 = MEMORY[0x19403A810](*(_QWORD *)(a1[4] + 64));
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = a1[4];
  if (*(_QWORD *)(v5 + 40))
    v6 = 0;
  else
    v6 = *(_QWORD *)(v5 + 48) == 0;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;
}

uint64_t __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  char v19;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 64));
    v8 = MEMORY[0x1E0C809B0];
    v9 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_3;
    block[3] = &unk_1E31625F0;
    v25 = a2;
    v10 = v7;
    v21 = v10;
    v22 = WeakRetained;
    v11 = *(_QWORD *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 32);
    v24 = v11;
    dispatch_barrier_async(v9, block);
    v12 = *(void **)(a1 + 40);
    if (v12)
    {
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_5;
      v15[3] = &unk_1E3162618;
      v13 = v12;
      v19 = a2;
      v14 = *(_QWORD *)(a1 + 72);
      v17 = v13;
      v18 = v14;
      v16 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    }
  }

}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_6(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  _QWORD *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_7;
    v9 = &unk_1E31635F8;
    v10 = v3;
    v11 = WeakRetained;
    dispatch_barrier_async(v5, &v6);
    objc_msgSend(WeakRetained, "_endIfNeeded", v6, v7, v8, v9);

  }
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_10;
  block[3] = &unk_1E3163508;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_10(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_MPStoreSocialTransientStateDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_7(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (*(void **)(v2 + 48) == v1)
    {
      *(_QWORD *)(v2 + 48) = 0;

    }
  }
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD block[5];

  if (!*(_BYTE *)(a1 + 64))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v4 + 48) == v3)
        *(_QWORD *)(v4 + 16) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
  }
  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_4;
  block[3] = &unk_1E3163508;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
    v3 = *(_QWORD *)(a1 + 48);
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 32));
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_MPStoreSocialTransientStateDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __57___MPStoreSocialTransientState_followPendingRequestState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  char v19;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 64));
    v8 = MEMORY[0x1E0C809B0];
    v9 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_3;
    block[3] = &unk_1E31625F0;
    v25 = a2;
    v10 = v7;
    v21 = v10;
    v22 = WeakRetained;
    v11 = *(_QWORD *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 32);
    v24 = v11;
    dispatch_barrier_async(v9, block);
    v12 = *(void **)(a1 + 40);
    if (v12)
    {
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_5;
      v15[3] = &unk_1E3162618;
      v13 = v12;
      v19 = a2;
      v14 = *(_QWORD *)(a1 + 72);
      v17 = v13;
      v18 = v14;
      v16 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    }
  }

}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_6(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  _QWORD *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_7;
    v9 = &unk_1E31635F8;
    v10 = v3;
    v11 = WeakRetained;
    dispatch_barrier_async(v5, &v6);
    objc_msgSend(WeakRetained, "_endIfNeeded", v6, v7, v8, v9);

  }
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(a1 + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_10;
  block[3] = &unk_1E3163508;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_10(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_MPStoreSocialTransientStateDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_7(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (*(void **)(v2 + 40) == v1)
    {
      *(_QWORD *)(v2 + 40) = 0;

    }
  }
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD block[5];

  if (!*(_BYTE *)(a1 + 64))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v4 + 40) == v3)
        *(_QWORD *)(v4 + 8) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
  }
  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_4;
  block[3] = &unk_1E3163508;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
    v3 = *(_QWORD *)(a1 + 48);
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 32));
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_MPStoreSocialTransientStateDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __43___MPStoreSocialTransientState_followState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

@end
