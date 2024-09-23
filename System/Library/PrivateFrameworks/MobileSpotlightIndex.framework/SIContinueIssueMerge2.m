@implementation SIContinueIssueMerge2

void ___SIContinueIssueMerge2_block_invoke_1436(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, NSObject *a5)
{
  uint64_t v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  uint8_t v16[12];
  unsigned int v17;

  if (a2 && *(_BYTE *)(a2 + 2457))
  {
    *(_BYTE *)(a2 + 2457) = 0;
    v17 = -1;
    v10 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 32);
    v11 = (_DWORD)v10 == -1 || (fd_setDir(v10, (int *)&v17) & 1) == 0;
    v12 = *__error();
    v13 = _SILogForLogForCategory(12);
    v14 = 2 * (dword_1EF19FCBC < 4);
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B8270000, v13, v14, "Merge(2) started", v16, 2u);
    }
    *__error() = v12;
    if (!v11)
    {
      v15 = v17;
      MEMORY[0x1BCCB1484](v17);
      if ((v15 & 0x80000000) == 0)
        close(v15);
    }
    si_power_info_init(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 1064, a3, a4, a5);
    si_enqueue_barrier_with_qos(*(_QWORD *)(a2 + 1152), 5, (uint64_t)_SIContinueIssueMerge0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  si_merge_ctx_free(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2 == 0);
}

void ___SIContinueIssueMerge2_block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, NSObject *a5)
{
  uint64_t v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  uint8_t v15[12];
  unsigned int v16;

  if (a2 && *(_BYTE *)(a2 + 2456))
  {
    v16 = -1;
    v9 = *(unsigned int *)(a2 + 32);
    v10 = (_DWORD)v9 == -1 || (fd_setDir(v9, (int *)&v16) & 1) == 0;
    v11 = *__error();
    v12 = _SILogForLogForCategory(12);
    v13 = 2 * (dword_1EF19FCBC < 4);
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B8270000, v12, v13, "Vacuum started", v15, 2u);
    }
    *__error() = v11;
    if (!v10)
    {
      v14 = v16;
      MEMORY[0x1BCCB1484](v16);
      if ((v14 & 0x80000000) == 0)
        close(v14);
    }
    *(_BYTE *)(a2 + 2456) = 0;
    si_sync_index_vaccuum_if_needed(a2, 1, a3, a4, a5);
  }
}

@end
