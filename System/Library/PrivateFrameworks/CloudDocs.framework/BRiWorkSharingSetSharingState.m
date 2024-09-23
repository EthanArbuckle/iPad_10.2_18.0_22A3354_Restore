@implementation BRiWorkSharingSetSharingState

void __BRiWorkSharingSetSharingState_block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("fileURL"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __BRiWorkSharingSetSharingState_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs((uint64_t)"BRiWorkSharingSetSharingState_block_invoke_2", 1304);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_19CBF0000, v5, (os_log_type_t)0x90u, "[ERROR] Failed publishing document at %@ - %@%@", buf, 0x20u);
    }

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __BRiWorkSharingSetSharingState_block_invoke_72;
  v10[3] = &unk_1E3DA5150;
  v6 = *(NSObject **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v7;
  v8 = v3;
  dispatch_async(v6, v10);

}

uint64_t __BRiWorkSharingSetSharingState_block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __BRiWorkSharingSetSharingState_block_invoke_2_73(uint64_t a1, void *a2)
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
  v7[2] = __BRiWorkSharingSetSharingState_block_invoke_3;
  v7[3] = &unk_1E3DA5150;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __BRiWorkSharingSetSharingState_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __BRiWorkSharingSetSharingState_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs((uint64_t)"BRiWorkSharingSetSharingState_block_invoke_4", 1318);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_19CBF0000, v5, (os_log_type_t)0x90u, "[ERROR] Failed publishing document at %@ - %@%@", buf, 0x20u);
    }

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __BRiWorkSharingSetSharingState_block_invoke_74;
  v10[3] = &unk_1E3DA5150;
  v6 = *(NSObject **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v7;
  v8 = v3;
  dispatch_async(v6, v10);

}

uint64_t __BRiWorkSharingSetSharingState_block_invoke_74(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
