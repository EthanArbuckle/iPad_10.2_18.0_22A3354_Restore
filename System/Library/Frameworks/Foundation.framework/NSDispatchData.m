@implementation NSDispatchData

BOOL __34___NSDispatchData_getBytes_range___block_invoke(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  size_t v20;
  NSUInteger v22;

  v5 = a1[5];
  v6 = a5 + a3;
  v7 = a1[6] + v5;
  if (a5 + a3 >= v7)
    v8 = a1[6] + v5;
  else
    v8 = a5 + a3;
  v9 = v8 - v5;
  v10 = v5 < a3 || v5 >= v6;
  if (v10)
    v11 = 0;
  else
    v11 = a1[5];
  if (v10)
    v9 = 0;
  v12 = v8 - a3;
  v13 = v5 <= a3 && v7 > a3;
  if (v13)
    v14 = a3;
  else
    v14 = v11;
  if (v13)
    v15 = v12;
  else
    v15 = v9;
  if (v15)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    v18 = a4 + v14 - a3;
    if (v15 < 0x80000
      || (v19 = (_QWORD *)MEMORY[0x1E0C85AD8], ((*MEMORY[0x1E0C85AD8] - 1) & (v17 | v18)) != 0)
      || (malloc_default_zone(), malloc_zone_claimed_address()))
    {
      v20 = v15;
    }
    else
    {
      v22 = v15 & -*v19;
      NSCopyMemoryPages((const void *)v18, (void *)v17, v22);
      v20 = v15 - v22;
      if (v15 == v22)
        goto LABEL_27;
      v18 += v22;
      v17 += v22;
    }
    memmove((void *)v17, (const void *)v18, v20);
LABEL_27:
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v15;
    v7 = a1[6] + a1[5];
  }
  return v6 < v7;
}

BOOL __49___NSDispatchData_enumerateByteRangesUsingBlock___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v2 == 0;
}

uint64_t __23___NSDispatchData_hash__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (a5 > 0x4F || *(_QWORD *)(a1 + 40) == a5)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFHashBytes();
  return 0;
}

@end
