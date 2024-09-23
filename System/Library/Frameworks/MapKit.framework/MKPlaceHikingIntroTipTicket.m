@implementation MKPlaceHikingIntroTipTicket

void __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_2;
    block[3] = &unk_1E20D7F70;
    v10 = &v18;
    v18 = *(id *)(a1 + 32);
    v17 = v6;
    v13 = a2;
    dispatch_async(v11, block);

    v9 = v17;
  }
  else
  {
    v19[0] = a2;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a2;
    objc_msgSend(v7, "arrayWithObjects:count:", v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_3;
    v14[3] = &unk_1E20D8000;
    v10 = &v15;
    v15 = *(id *)(a1 + 32);
    _mapItemsForGeoMapItemsWithHandler(v9, v14);
  }

}

uint64_t __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  block[2] = __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_4;
  block[3] = &unk_1E20D8028;
  v9 = *(id *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

@end
