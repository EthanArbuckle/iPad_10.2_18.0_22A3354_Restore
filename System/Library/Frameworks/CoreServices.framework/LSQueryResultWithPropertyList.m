@implementation LSQueryResultWithPropertyList

void __70___LSQueryResultWithPropertyList_propertyListWithClass_valuesOfClass___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  if (!_NSIsNSString() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    *a4 = 1;
  }

}

@end
