@implementation BRGetURLForPublishedItemWithOptions

void __BRGetURLForPublishedItemWithOptions_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v13 = *(_OWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 56);
    brc_bread_crumbs((uint64_t)"BRGetURLForPublishedItemWithOptions_block_invoke", 462);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_debug_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx failed getting Item Service failed: %@%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    __brc_leave_section((uint64_t)&v13);
  }
  else
  {
    v9 = *(unsigned __int8 *)(a1 + 72);
    v10 = *(_QWORD *)(a1 + 64);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __BRGetURLForPublishedItemWithOptions_block_invoke_20;
    v11[3] = &unk_1E3DA4F98;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v5, "getPublishedURLForStreaming:requestedTTL:reply:", v9, v10, v11);

  }
}

uint64_t __BRGetURLForPublishedItemWithOptions_block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __BRGetURLForPublishedItemWithOptions_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  __int128 v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs((uint64_t)"BRGetURLForPublishedItemWithOptions_block_invoke_2", 473);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v9 = v6;
    v10 = 2112;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx getting container failed: %@%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  __brc_leave_section((uint64_t)&v6);

}

@end
