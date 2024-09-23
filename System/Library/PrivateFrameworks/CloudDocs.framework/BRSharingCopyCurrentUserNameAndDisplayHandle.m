@implementation BRSharingCopyCurrentUserNameAndDisplayHandle

void __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke(uint64_t a1, void *a2)
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
  v7[2] = __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_2;
  v7[3] = &unk_1E3DA5150;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a2;
  v10 = a3;
  v11 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_4;
  v17[3] = &unk_1E3DA52E0;
  v12 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v21 = v13;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_async(v12, v17);

}

uint64_t __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

@end
