@implementation IsDictionaryWithKeyStringAndValueArrayOfString

void ___IsDictionaryWithKeyStringAndValueArrayOfString_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  v12 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v12;
  else
    v9 = 0;

  if (!v9)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_19;
LABEL_18:
    MOLogWrite();
LABEL_19:
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (!v11)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_19;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((MIArrayContainsOnlyClass(v10) & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_20:

}

@end
