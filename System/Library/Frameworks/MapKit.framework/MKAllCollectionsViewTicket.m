@implementation MKAllCollectionsViewTicket

void __79___MKAllCollectionsViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id *v13;
  id v14;
  id *v15;
  id v16;
  void (**v17)(id, id, id, _QWORD);
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  void (**v24)(id, id, id, _QWORD);
  _QWORD block[4];
  id v26;
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(a1 + 32);
    if (v9)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79___MKAllCollectionsViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
      block[3] = &unk_1E20D7F70;
      v13 = &v27;
      v14 = v11;
      v27 = v14;
      v15 = &v26;
      v16 = v10;
      v26 = v16;
      if (v12)
        dispatch_async(v12, block);
      else
        (*((void (**)(id, _QWORD, _QWORD, id))v14 + 2))(v14, 0, 0, v16);
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __79___MKAllCollectionsViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
      v21[3] = &unk_1E20D8028;
      v13 = (id *)&v24;
      v17 = v11;
      v24 = v17;
      v15 = &v22;
      v18 = v7;
      v22 = v18;
      v19 = v8;
      v23 = v19;
      if (v12)
      {
        dispatch_async(v12, v21);
        v20 = v23;
      }
      else
      {
        v20 = v19;
        v17[2](v17, v18, v19, 0);
      }

    }
  }

}

uint64_t __79___MKAllCollectionsViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __79___MKAllCollectionsViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

@end
