@implementation MKFeedbackReportTicket

void __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
    v17[3] = &unk_1E20DAA30;
    v12 = v10;
    v21 = v12;
    v13 = v7;
    v18 = v13;
    v14 = v8;
    v19 = v14;
    v15 = v9;
    v20 = v15;
    if (v11)
    {
      dispatch_async(v11, v17);
      v16 = v20;
    }
    else
    {
      v16 = v15;
      (*((void (**)(id, id, id, id))v12 + 2))(v12, v13, v14, v15);
    }

  }
}

uint64_t __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_4;
    v7[3] = &unk_1E20DAAF8;
    v5 = v2;
    v8 = v5;
    v9 = a2;
    if (v4)
    {
      dispatch_async(v4, v7);
      v6 = v8;
    }
    else
    {
      v6 = v5;
      (*((void (**)(id, uint64_t))v5 + 2))(v5, a2);
    }

  }
}

uint64_t __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end
