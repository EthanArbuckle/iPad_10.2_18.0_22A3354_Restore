@implementation UIFont(AppleAccountUI)

+ (id)aa_fontForPageTitle
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  v2 = v1 & 0xFFFFFFFFFFFFFFFBLL;
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 32.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 36.0;
  objc_msgSend(v4, "scaledValueForValue:", v7);
  if (v2 == 1)
    objc_msgSend(v3, "_thinSystemFontOfSize:");
  else
    objc_msgSend(v3, "_lightSystemFontOfSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)aa_fontForLargeButton
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  v2 = v1 & 0xFFFFFFFFFFFFFFFBLL;
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 23.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 26.0;
  objc_msgSend(v4, "scaledValueForValue:", v7);
  if (v2 == 1)
    objc_msgSend(v3, "_thinSystemFontOfSize:");
  else
    objc_msgSend(v3, "_lightSystemFontOfSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)aa_fontForPrimaryInformationLabel
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scaledValueForValue:", 13.0);
  objc_msgSend(v0, "systemFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)aa_fontForLargerInformationLabel
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = 17.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v4 = 23.0;
  objc_msgSend(v1, "scaledValueForValue:", v4);
  objc_msgSend(v0, "systemFontOfSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)aa_titleFontForTraitCollection:()AppleAccountUI
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
}

+ (uint64_t)aa_messageFontForTraitCollection:()AppleAccountUI
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
}

@end
