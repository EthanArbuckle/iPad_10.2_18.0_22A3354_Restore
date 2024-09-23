@implementation IXDictionaryContainsOnlyClassesCheckingValueTypes

void __IXDictionaryContainsOnlyClassesCheckingValueTypes_block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  char v7;
  id v8;

  v8 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = a1[6];
    if (v6 == a1[7])
    {
      v7 = IXDictionaryContainsOnlyClassesCheckingValueTypes(v8, a1[8], a1[9], 0, 0);
    }
    else if (v6 == a1[10])
    {
      v7 = IXArrayContainsOnlyClass(v8);
    }
    else
    {
      if (v6 != a1[11])
        goto LABEL_11;
      v7 = IXSetContainsOnlyClass(v8);
    }
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  }
LABEL_11:
  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
    *a4 = 1;

}

@end
