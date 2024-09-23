@implementation NTKComplicationStateLayout

void __53___NTKComplicationStateLayout_ruleForLayoutOverride___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "unsignedIntegerValue") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

@end
