@implementation UIImage(MessageList)

+ (id)mf_imageForChevronType:()MessageList
{
  uint64_t v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", *MEMORY[0x1E0CC6808], 9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = &mf_imageForChevronType__singleChevron;
  v6 = (void *)mf_imageForChevronType__singleChevron;
  mf_imageForChevronType__singleChevron = v4;

  objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", *MEMORY[0x1E0CC6810], 10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)mf_imageForChevronType__chevronCircle;
  mf_imageForChevronType__chevronCircle = v7;

  if (a3 != 1)
  {
    if (a3 != 2)
    {
      v9 = 0;
      return v9;
    }
    v5 = &mf_imageForChevronType__chevronCircle;
  }
  v9 = (id)*v5;
  return v9;
}

+ (id)mf_imageForSummarySymbolWithFont:()MessageList
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("text.line.2.summary"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
