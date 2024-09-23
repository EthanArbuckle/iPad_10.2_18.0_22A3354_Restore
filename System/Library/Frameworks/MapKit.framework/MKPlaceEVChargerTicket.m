@implementation MKPlaceEVChargerTicket

void __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_2;
    block[3] = &unk_1E20D7F70;
    v7 = &v14;
    v14 = *(id *)(a1 + 32);
    v13 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else if (objc_msgSend(v5, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_4;
    v8[3] = &unk_1E20D8000;
    v7 = &v9;
    v9 = *(id *)(a1 + 32);
    _mapItemsForGeoMapItemsWithHandler(v5, v8);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_3;
    v10[3] = &unk_1E20D7EF8;
    v7 = &v11;
    v11 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v10);
  }

}

uint64_t __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_4(uint64_t a1, void *a2, void *a3)
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
  block[2] = __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_5;
  block[3] = &unk_1E20D8028;
  v9 = *(id *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

uint64_t __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
