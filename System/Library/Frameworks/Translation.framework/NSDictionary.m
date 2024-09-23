@implementation NSDictionary

void __67__NSDictionary_TranslationAdditions__lt_ensureTypesForKeys_values___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  id v9;

  v9 = a2;
  v7 = a3;
  if (a1[5])
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if (!a1[6])
      goto LABEL_7;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_8;
  }
  else if (!a1[6])
  {
    goto LABEL_9;
  }
  isKindOfClass = objc_opt_isKindOfClass();
LABEL_7:
  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_9:

}

@end
