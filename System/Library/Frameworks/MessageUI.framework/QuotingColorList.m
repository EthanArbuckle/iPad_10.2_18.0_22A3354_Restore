@implementation QuotingColorList

void __QuotingColorList_block_invoke(void **a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  RGBColorCSSStringFromUIColor(a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  RGBColorCSSStringFromUIColor(a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  RGBColorCSSStringFromUIColor(a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)QuotingColorList_darkerQuotingColorCSS;
  QuotingColorList_darkerQuotingColorCSS = v5;

}

void __QuotingColorList_block_invoke_2(void **a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  RGBColorCSSStringFromUIColor(a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  RGBColorCSSStringFromUIColor(a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  RGBColorCSSStringFromUIColor(a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)QuotingColorList_defaultQuotingColorCSS;
  QuotingColorList_defaultQuotingColorCSS = v5;

}

@end
