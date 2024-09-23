@implementation UIFont(AVAdditions)

+ (id)avkit_nonScalingFontWithTextStyle:()AVAdditions weight:
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0DC1350];
  v4 = (void *)MEMORY[0x1E0DC3E88];
  v5 = *MEMORY[0x1E0DC4918];
  v6 = a3;
  objc_msgSend(v4, "traitCollectionWithPreferredContentSizeCategory:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:compatibleWithTraitCollection:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v8, "pointSize");
  objc_msgSend(v9, "systemFontOfSize:weight:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)timeFontWithFont:()AVAdditions
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = *MEMORY[0x1E0DC13D0];
    v19[0] = *MEMORY[0x1E0DC13D8];
    v19[1] = v3;
    v20[0] = &unk_1E5BF39C0;
    v20[1] = &unk_1E5BF39D8;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "fontDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0DC1380];
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorByAddingAttributes:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v5, "pointSize");
    objc_msgSend(v10, "fontDescriptorWithSize:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointSize");
    v14 = v13;

    objc_msgSend(v11, "fontWithDescriptor:size:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

+ (id)timeFontWithName:()AVAdditions size:
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithName:size:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeFontWithFont:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)timeFontOfSize:()AVAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeFontWithFont:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)boldTimeFontOfSize:()AVAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeFontWithFont:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)italicTimeFontOfSize:()AVAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "italicSystemFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeFontWithFont:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)monospacedTimeFontOfSize:()AVAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "monospacedDigitSystemFontOfSize:weight:", a2, *MEMORY[0x1E0DC1440]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeFontWithFont:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
