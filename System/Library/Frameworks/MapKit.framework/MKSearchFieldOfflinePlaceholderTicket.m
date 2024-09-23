@implementation MKSearchFieldOfflinePlaceholderTicket

void __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C80D38];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke_2;
  block[3] = &unk_1E20DAB70;
  v11 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke_3(uint64_t a1, char a2)
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
    v4[2] = __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke_4;
    v4[3] = &unk_1E20DAAF8;
    v5 = v2;
    v6 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end
