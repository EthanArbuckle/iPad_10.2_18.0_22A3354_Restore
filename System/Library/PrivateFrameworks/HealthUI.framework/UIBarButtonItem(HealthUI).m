@implementation UIBarButtonItem(HealthUI)

+ (id)hk_backButtonWithTitle:()HealthUI
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DC34F0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithTitle:style:target:action:", v4, 0, 0, 0);

  return v5;
}

+ (id)hk_backButtonForDate:()HealthUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  HKLocalizedStringForDateAndTemplate(v3, 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hk_backButtonWithTitle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hk_sequencingButtonWithTitle:()HealthUI accessibilityFormatString:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0DC3990]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  objc_msgSend(v8, "setText:", v5);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v9);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v10);

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v8);

  return v11;
}

@end
