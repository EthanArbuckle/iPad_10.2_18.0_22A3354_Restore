@implementation MKGuideHomeViewTicket

void __74___MKGuideHomeViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74___MKGuideHomeViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
    block[3] = &unk_1E20D8028;
    v9 = v7;
    v16 = v9;
    v10 = v5;
    v14 = v10;
    v11 = v6;
    v15 = v11;
    if (v8)
    {
      dispatch_async(v8, block);
      v12 = v15;
    }
    else
    {
      v12 = v11;
      (*((void (**)(id, id, id))v9 + 2))(v9, v10, v11);
    }

  }
}

uint64_t __74___MKGuideHomeViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
