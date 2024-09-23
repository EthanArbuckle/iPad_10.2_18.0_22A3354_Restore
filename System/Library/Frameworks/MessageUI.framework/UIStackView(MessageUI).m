@implementation UIStackView(MessageUI)

+ (id)mf_baselineAlignedVerticalStackView
{
  void *v0;

  v0 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v0, "setAxis:", 1);
  objc_msgSend(v0, "setAlignment:", 0);
  objc_msgSend(v0, "setBaselineRelativeArrangement:", 1);
  return v0;
}

+ (id)mf_baselineAlignedHorizontalStackView
{
  void *v0;

  v0 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v0, "setAxis:", 0);
  objc_msgSend(v0, "setAlignment:", 2);
  objc_msgSend(v0, "setDistribution:", 2);
  return v0;
}

+ (id)mf_equallyFilledVerticalStackView
{
  void *v0;

  v0 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v0, "setAxis:", 1);
  objc_msgSend(v0, "setAlignment:", 0);
  objc_msgSend(v0, "setDistribution:", 1);
  return v0;
}

+ (id)mf_equallyFilledHorizontalStackView
{
  void *v0;

  v0 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v0, "setAxis:", 0);
  objc_msgSend(v0, "setAlignment:", 0);
  objc_msgSend(v0, "setDistribution:", 1);
  return v0;
}

+ (id)mf_equalSpacingHorizontalStackView
{
  void *v0;

  v0 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v0, "setAxis:", 0);
  objc_msgSend(v0, "setDistribution:", 3);
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v0;
}

- (void)mf_addArrangedSubviews:()MessageUI
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

@end
