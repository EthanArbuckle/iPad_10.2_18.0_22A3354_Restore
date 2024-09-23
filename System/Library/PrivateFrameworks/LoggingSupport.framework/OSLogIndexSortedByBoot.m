@implementation OSLogIndexSortedByBoot

BOOL ___OSLogIndexSortedByBoot_block_invoke(uint64_t a1, void *a2)
{
  return _os_trace_uuid_map_lookup(**(_QWORD ***)(a1 + 32), (_QWORD *)objc_msgSend(a2, "bootUUID")) != 0;
}

uint64_t ___OSLogIndexSortedByBoot_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v5;
  id v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;

  v5 = **(_QWORD ***)(a1 + 32);
  v6 = a3;
  v7 = _os_trace_uuid_map_lookup(v5, (_QWORD *)objc_msgSend(a2, "bootUUID"));
  v8 = **(_QWORD ***)(a1 + 32);
  v9 = (_QWORD *)objc_msgSend(v6, "bootUUID");

  v10 = _os_trace_uuid_map_lookup(v8, v9);
  if (v7 == v10)
    return 0;
  if ((*(_BYTE *)(a1 + 40) & 8) != 0)
  {
    if (v7 > v10)
      return -1;
    else
      return 1;
  }
  else if (v7 < v10)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

@end
