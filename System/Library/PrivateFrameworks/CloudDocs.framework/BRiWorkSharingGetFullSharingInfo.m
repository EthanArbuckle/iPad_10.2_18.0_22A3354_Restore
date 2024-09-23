@implementation BRiWorkSharingGetFullSharingInfo

void __BRiWorkSharingGetFullSharingInfo_block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("fileURL"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

}

void __BRiWorkSharingGetFullSharingInfo_block_invoke_2(uint64_t a1, char a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;

  v9 = a4;
  v10 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_3;
  v15[3] = &unk_1E3DA5240;
  v11 = *(NSObject **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v17 = v10;
  v18 = v12;
  v19 = a2;
  v20 = a3;
  v16 = v9;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

uint64_t __BRiWorkSharingGetFullSharingInfo_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __BRiWorkSharingGetFullSharingInfo_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_5;
  v7[3] = &unk_1E3DA5150;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __BRiWorkSharingGetFullSharingInfo_block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

void __BRiWorkSharingGetFullSharingInfo_block_invoke_6(uint64_t a1, char a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;

  v9 = a4;
  v10 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_7;
  v15[3] = &unk_1E3DA5240;
  v11 = *(NSObject **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v17 = v10;
  v18 = v12;
  v19 = a2;
  v20 = a3;
  v16 = v9;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

uint64_t __BRiWorkSharingGetFullSharingInfo_block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
