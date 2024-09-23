@implementation NSArray

void __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke_2;
  aBlock[3] = &unk_24DCAC808;
  v6 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = a3;
  v7 = v5;
  v8 = _Block_copy(aBlock);
  v9 = *(void **)(a1 + 32);
  v10 = _Block_copy(v8);
  objc_msgSend(v9, "addObject:", v10);

}

uint64_t __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  v3 = _Block_copy(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(v2, "addObject:", v3);

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v4 == result)
  {
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[5] + 16))(a1[5], a1[4], a1[6], a3);
}

void __53__NSArray_CDMRecursiveSearch___cdm_hasKey_withValue___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v6, "_cdm_hasKey:withValue:", a1[4], a1[5]);
  *a4 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24);

}

@end
