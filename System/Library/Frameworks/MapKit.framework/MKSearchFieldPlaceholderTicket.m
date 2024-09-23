@implementation MKSearchFieldPlaceholderTicket

void __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C80D38];
  v8 = MEMORY[0x1E0C80D38];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_2;
  block[3] = &unk_1E20D8028;
  v9 = *(id *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

uint64_t __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_4;
    v4[3] = &unk_1E20DAAF8;
    v5 = v2;
    v6 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end
