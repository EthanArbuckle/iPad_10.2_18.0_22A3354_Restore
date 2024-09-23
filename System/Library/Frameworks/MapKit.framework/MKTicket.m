@implementation MKTicket

uint64_t __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (**v8)(id, _QWORD, id);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_2;
    block[3] = &unk_1E20D7F70;
    v7 = *(NSObject **)(a1 + 40);
    v8 = (void (**)(id, _QWORD, id))*(id *)(a1 + 48);
    v23 = v8;
    v9 = v6;
    v22 = v9;
    if (v7)
    {
      dispatch_async(v7, block);
      v10 = v22;
    }
    else
    {
      v10 = v9;
      v8[2](v8, 0, v9);
    }

    v12 = v23;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "count"))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_4;
    v16[3] = &unk_1E20DAAA8;
    v11 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v11;
    v18 = *(id *)(a1 + 48);
    _mapItemsForGeoMapItemsWithHandler(v5, v16);

    v12 = v17;
LABEL_8:

    goto LABEL_9;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_3;
  v19[3] = &unk_1E20D7EF8;
  v13 = *(NSObject **)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v20 = v14;
  if (v13)
  {
    dispatch_async(v13, v19);
    v15 = v20;
  }
  else
  {
    v15 = v14;
    (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
  }

LABEL_9:
}

void __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a4);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_2;
    block[3] = &unk_1E20D7F70;
    v23 = *(id *)(a1 + 40);
    v22 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v10 = v23;
  }
  else
  {
    v11 = objc_msgSend(v7, "count");
    v12 = objc_msgSend(v8, "count");
    if (v11 | v12)
    {
      if (v11)
        v13 = v7;
      else
        v13 = v8;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_4;
      v15[3] = &unk_1E20DAA58;
      v17 = v11;
      v18 = v12;
      v14 = *(void **)(a1 + 40);
      v15[4] = *(_QWORD *)(a1 + 32);
      v16 = v14;
      _mapItemsForGeoMapItemsWithHandler(v13, v15);
      v10 = v16;
    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_3;
      v19[3] = &unk_1E20D7EF8;
      v20 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x1E0C80D38], v19);
      v10 = v20;
    }
  }

}

uint64_t __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  if (!*(_QWORD *)(a1 + 48))
  {
    if (*(_QWORD *)(a1 + 56))
    {
      v12 = v5;
      v9 = v12;
      if (v12)
      {
        v8 = 0;
        v11 = 0;
        v10 = v12;
        if (!objc_msgSend(v12, "count"))
          goto LABEL_12;
        goto LABEL_13;
      }
      v8 = 0;
LABEL_12:
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", MKErrorDomain, 4, 0);

      v8 = 0;
      v10 = 0;
      goto LABEL_13;
    }
    v8 = 0;
LABEL_10:
    v9 = 0;
    goto LABEL_12;
  }
  v7 = v5;
  v8 = v7;
  if (!v7)
    goto LABEL_10;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  if (!objc_msgSend(v7, "count"))
    goto LABEL_12;
LABEL_13:
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v8);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v10);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v11);
  v14 = MEMORY[0x1E0C80D38];
  v15 = MEMORY[0x1E0C80D38];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_5;
  v20[3] = &unk_1E20DAA30;
  v16 = *(id *)(a1 + 40);
  v21 = v8;
  v22 = v10;
  v23 = v11;
  v24 = v16;
  v17 = v11;
  v18 = v10;
  v19 = v8;
  dispatch_async(v14, v20);

}

uint64_t __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_5;
  block[3] = &unk_1E20D8028;
  v8 = *(NSObject **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v10;
  v15 = v9;
  v11 = v6;
  if (v8)
    dispatch_async(v8, block);
  else
    (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v11, *(_QWORD *)(v10 + 32));

}

uint64_t __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], *(_QWORD *)(a1[5] + 32));
}

@end
