@implementation MKCuratedCollectionTicket

void __78___MKCuratedCollectionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id *v10;
  void (**v11)(id, _QWORD, id);
  id *v12;
  id v13;
  _QWORD *v14;
  void (**v15)(id, id, _QWORD);
  id v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(id, id, _QWORD);
  _QWORD v20[4];
  id v21;
  void (**v22)(id, _QWORD, id);

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(a1 + 32);
    if (v6)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __78___MKCuratedCollectionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
      v20[3] = &unk_1E20D7F70;
      v10 = (id *)&v22;
      v11 = v8;
      v22 = v11;
      v12 = &v21;
      v13 = v7;
      v21 = v13;
      if (!v9)
      {
        v11[2](v11, 0, v13);
        goto LABEL_10;
      }
      v14 = v20;
    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __78___MKCuratedCollectionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
      v17[3] = &unk_1E20D7F70;
      v10 = (id *)&v19;
      v15 = v8;
      v19 = v15;
      v12 = &v18;
      v16 = v5;
      v18 = v16;
      if (!v9)
      {
        v15[2](v15, v16, 0);
        goto LABEL_10;
      }
      v14 = v17;
    }
    dispatch_async(v9, v14);
LABEL_10:

  }
}

uint64_t __78___MKCuratedCollectionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __78___MKCuratedCollectionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

@end
