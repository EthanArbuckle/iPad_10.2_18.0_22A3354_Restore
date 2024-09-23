@implementation IPIsDictionaryWithKeysAndValuesOfClasses

void __IPIsDictionaryWithKeysAndValuesOfClasses_block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = (void *)a1[4];
  if (v8)
    v9 = IPObjectIsKindOfClasses(v12, v8) ^ 1;
  else
    v9 = 0;
  v10 = (void *)a1[5];
  if (v10)
    v11 = IPObjectIsKindOfClasses(v7, v10) ^ 1;
  else
    v11 = 0;
  if ((v9 | v11) == 1)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }

}

@end
