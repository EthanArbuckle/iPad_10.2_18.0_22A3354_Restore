@implementation HKAFibBurdenClampedLowerBoundAttributedLocalizedString

void __HKAFibBurdenClampedLowerBoundAttributedLocalizedString_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("com.apple.Health.valueText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (_QWORD *)(a1 + 40);
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", *v8, a3, a4);
    goto LABEL_6;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("com.apple.Health.unitText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v8 = (_QWORD *)(a1 + 48);
    goto LABEL_5;
  }
LABEL_6:

}

@end
