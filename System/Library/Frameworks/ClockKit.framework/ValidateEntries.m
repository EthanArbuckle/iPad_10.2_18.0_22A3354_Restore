@implementation ValidateEntries

void ___ValidateEntries_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a2;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = ___ValidateEntries_block_invoke_2;
  v14 = &unk_24CBFAF48;
  v7 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = v9;
  v17 = v8;
  v18 = a4;
  v10 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](&v11);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v11, v12, v13, v14))
    v10[2](v10);
  else
    dispatch_sync(MEMORY[0x24BDAC9B8], v10);

}

uint64_t ___ValidateEntries_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = _ValidateEntry(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    **(_BYTE **)(a1 + 56) = 1;
  }
  return result;
}

@end
