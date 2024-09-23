@implementation CLKRecursivelyValidateArray

void __CLKRecursivelyValidateArray_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, _BYTE *);
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = *(void **)(a1 + 32);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __CLKRecursivelyValidateArray_block_invoke_2;
  v9 = &unk_24CBFB4C0;
  v5 = v3;
  v10 = v5;
  v11 = &v12;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v6);
  if (!*((_BYTE *)v13 + 24))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E20], CFSTR("Array validation failed: expected object in classes %@, found %@"), *(_QWORD *)(a1 + 32), v5, v6, v7, v8, v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CLKRecursivelyValidateArray(v5, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      CLKRecursivelyValidateDictionary(v5, *(_QWORD *)(a1 + 32));
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __CLKRecursivelyValidateArray_block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end
