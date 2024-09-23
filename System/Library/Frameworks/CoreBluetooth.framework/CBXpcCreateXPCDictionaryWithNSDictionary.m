@implementation CBXpcCreateXPCDictionaryWithNSDictionary

void __CBXpcCreateXPCDictionaryWithNSDictionary_block_invoke(_QWORD *a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = objc_retainAutorelease(a2);
  v6 = a3;
  *(_QWORD *)(a1[5] + 8 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24)) = objc_msgSend(v5, "UTF8String");
  CBXpcCreateXPCObjectWithNSObject(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = a1[6];
  v9 = 8 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v10 = *(void **)(v8 + v9);
  *(_QWORD *)(v8 + v9) = v7;

  ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
}

@end
