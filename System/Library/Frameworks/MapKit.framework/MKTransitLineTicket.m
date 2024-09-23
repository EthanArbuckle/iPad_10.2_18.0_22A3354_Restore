@implementation MKTransitLineTicket

void __58___MKTransitLineTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(uint64_t);
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      v13 = MEMORY[0x1E0C809B0];
      v9 = __58___MKTransitLineTicket_submitWithHandler_networkActivity___block_invoke_2;
      v10 = &v13;
      v11 = v6;
    }
    else
    {
      v12 = MEMORY[0x1E0C809B0];
      v9 = __58___MKTransitLineTicket_submitWithHandler_networkActivity___block_invoke_3;
      v10 = &v12;
      v11 = v5;
    }
    v10[1] = 3221225472;
    v10[2] = (uint64_t)v9;
    v10[3] = (uint64_t)&unk_1E20D7F70;
    v10[5] = (uint64_t)v8;
    v10[4] = (uint64_t)v11;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __58___MKTransitLineTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __58___MKTransitLineTicket_submitWithHandler_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

@end
