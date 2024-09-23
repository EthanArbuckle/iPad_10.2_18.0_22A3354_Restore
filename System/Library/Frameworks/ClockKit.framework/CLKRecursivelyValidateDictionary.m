@implementation CLKRecursivelyValidateDictionary

void __CLKRecursivelyValidateDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = a2;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __CLKRecursivelyValidateDictionary_block_invoke_2;
  v10[3] = &unk_24CBFB510;
  v13 = &v19;
  v8 = v5;
  v11 = v8;
  v14 = &v15;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  if (!*((_BYTE *)v20 + 24) || !*((_BYTE *)v16 + 24))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E20], CFSTR("Dictionary validation failed: expected key and value in classes %@, found [%@: %@]"), *(_QWORD *)(a1 + 32), v8, v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CLKRecursivelyValidateArray(v8, *(void **)(a1 + 32));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      CLKRecursivelyValidateDictionary(v8, *(_QWORD *)(a1 + 32));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CLKRecursivelyValidateArray(v9, *(void **)(a1 + 32));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      CLKRecursivelyValidateDictionary(v9, *(_QWORD *)(a1 + 32));
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

uint64_t __CLKRecursivelyValidateDictionary_block_invoke_2(uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;

  v4 = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 24) = 1;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 56) + 8) + 24))
  {
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 56) + 8) + 24) = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 56) + 8) + 24))
      *a3 = 1;
  }
  return result;
}

@end
