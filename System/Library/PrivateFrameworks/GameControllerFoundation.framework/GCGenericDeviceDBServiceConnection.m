@implementation GCGenericDeviceDBServiceConnection

void __57___GCGenericDeviceDBServiceConnection_hasModelForDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57___GCGenericDeviceDBServiceConnection_hasModelForDevice___block_invoke_2;
  v8[3] = &unk_1EA4D3E00;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "hasModelForDevice:reply:", v6, v8);

}

void __57___GCGenericDeviceDBServiceConnection_hasModelForDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[NSNumber numberWithBool:](&off_1F03A9E90, "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

}

void __62___GCGenericDeviceDBServiceConnection_preparedModelForDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62___GCGenericDeviceDBServiceConnection_preparedModelForDevice___block_invoke_2;
  v8[3] = &unk_1EA4D3E50;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "preparedModelForDevice:reply:", v6, v8);

}

uint64_t __62___GCGenericDeviceDBServiceConnection_preparedModelForDevice___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
