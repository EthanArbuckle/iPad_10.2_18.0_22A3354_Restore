@implementation CBXpcCreateNSDictionaryWithXpcDictionary

uint64_t __CBXpcCreateNSDictionaryWithXpcDictionary_block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithUTF8String:", a2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = a1[5];
  v9 = 8 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v10 = *(void **)(v8 + v9);
  *(_QWORD *)(v8 + v9) = v7;

  CBXpcCreateNSObjectWithXpcObject(v6);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = a1[6];
  v13 = 8 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v14 = *(void **)(v12 + v13);
  *(_QWORD *)(v12 + v13) = v11;

  ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return 1;
}

@end
