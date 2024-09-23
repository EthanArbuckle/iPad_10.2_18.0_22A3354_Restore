@implementation NSOQOpFinished

void ____NSOQOpFinished_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  int v10;
  unint64_t *v11;
  unint64_t v12;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 16);
  LODWORD(v2) = atomic_load((unsigned __int8 *)(v2 + 237));
  if ((_DWORD)v2 == 244)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v4;
    if (!v4)
      v5 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v5 + 16) = v3;
    if (v3)
      v6 = (_QWORD *)(v3 + 8);
    else
      v6 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    *v6 = v4;
    if (*(unsigned __int8 *)(a1 + 48) >= 0x88u)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_DWORD *)(v7 + 172);
      v9 = __OFSUB__(v8, 1);
      v10 = v8 - 1;
      if (v10 < 0 == v9)
        *(_DWORD *)(v7 + 172) = v10;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 0;
    op_invalidate_queue_and_schedule_locked(*(_QWORD *)(a1 + 40));
  }
  if (!*(_BYTE *)(a1 + 49))
  {
    v11 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 144);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 - 1, v11));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

@end
