@implementation SIInitSDB

void ___SIInitSDB_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9[4];

  if (a2)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (unsigned int *)malloc_type_malloc(0x28uLL, 0x10A0040A9CEF559uLL);
    v7 = 0;
    atomic_store(1u, v6);
    *((_QWORD *)v6 + 2) = a2;
    *((_QWORD *)v6 + 3) = a3;
    *((_QWORD *)v6 + 4) = dbGCUnmap;
    do
    {
      v8 = *(_QWORD *)(v5 + 1008 + v7);
      if (v8)
        si_enqueue_cleanup_if_busy(v8, (uint64_t)v6);
      v7 += 8;
    }
    while (v7 != 136);
    v9[0] = v6;
    memset(&v9[1], 0, 24);
    si_collect_inner(v9);
  }
}

void ___SIInitSDB_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7[4];

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (unsigned int *)malloc_type_malloc(0x28uLL, 0x10A0040A9CEF559uLL);
    v5 = 0;
    atomic_store(1u, v4);
    *((_QWORD *)v4 + 2) = a2;
    *((_QWORD *)v4 + 3) = 0;
    *((_QWORD *)v4 + 4) = dbGCFree;
    do
    {
      v6 = *(_QWORD *)(v3 + 1008 + v5);
      if (v6)
        si_enqueue_cleanup_if_busy(v6, (uint64_t)v4);
      v5 += 8;
    }
    while (v5 != 136);
    v7[0] = v4;
    memset(&v7[1], 0, 24);
    si_collect_inner(v7);
  }
}

void ___SIInitSDB_block_invoke_3(uint64_t a1, const void *a2)
{
  si_collect_block(*(_QWORD *)(a1 + 32), a2);
}

uint64_t ___SIInitSDB_block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 1184);
  if (a2)
    return si_set_obj_state_locked(v3, v4, 1);
  else
    return si_set_obj_state((os_unfair_lock_s *)v3, v4);
}

uint64_t ___SIInitSDB_block_invoke_5(uint64_t a1)
{
  return si_set_obj_state(*(os_unfair_lock_s **)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 6624));
}

uint64_t ___SIInitSDB_block_invoke_6(uint64_t a1, uint64_t a2)
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = ___SIInitSDB_block_invoke_7;
  v3[3] = &__block_descriptor_tmp_895;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = a2;
  ContentIndexSetDirtyCallback(a2, v3);
  return 1;
}

uint64_t ___SIInitSDB_block_invoke_7(uint64_t a1)
{
  return si_set_obj_state(*(os_unfair_lock_s **)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
