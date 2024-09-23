@implementation MKPublisherViewTicket

void __74___MKPublisherViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id *v16;
  id v17;
  id *v18;
  id v19;
  void (**v20)(id, id, id, id, _QWORD);
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  void (**v29)(id, id, id, id, _QWORD);
  _QWORD block[4];
  id v31;
  id v32;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    v15 = *(NSObject **)(a1 + 32);
    if (v12)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74___MKPublisherViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
      block[3] = &unk_1E20D7F70;
      v16 = &v32;
      v17 = v14;
      v32 = v17;
      v18 = &v31;
      v19 = v13;
      v31 = v19;
      if (v15)
        dispatch_async(v15, block);
      else
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v17 + 2))(v17, 0, 0, 0, v19);
    }
    else
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __74___MKPublisherViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
      v25[3] = &unk_1E20DAA30;
      v20 = v14;
      v29 = v20;
      v18 = &v26;
      v21 = v9;
      v26 = v21;
      v22 = v10;
      v27 = v22;
      v23 = v11;
      v28 = v23;
      if (v15)
      {
        dispatch_async(v15, v25);
        v24 = v28;
      }
      else
      {
        v24 = v23;
        v20[2](v20, v21, v22, v23, 0);
      }

      v16 = (id *)&v29;
    }

  }
}

uint64_t __74___MKPublisherViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __74___MKPublisherViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

@end
