@implementation TypeLabel

void ___TypeLabel_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BEBD708]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v2 = (void *)_TypeLabel___typeLabel;
  _TypeLabel___typeLabel = v1;

  objc_msgSend((id)_TypeLabel___typeLabel, "setLineBreakMode:", 0);
  objc_msgSend((id)_TypeLabel___typeLabel, "setNumberOfLines:", 0);
  objc_msgSend((id)_TypeLabel___typeLabel, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_TypeLabel___typeLabel, "setTextColor:", v3);

  objc_msgSend((id)_TypeLabel___typeLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  _LabelFont();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_TypeLabel___typeLabel, "setFont:", v4);

  objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("en"));

  if ((v9 & 1) == 0)
  {
    LODWORD(v10) = 1.0;
    objc_msgSend(v6, "setHyphenationFactor:", v10);
  }
  objc_msgSend((id)_TypeLabel___typeLabel, "_defaultAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BEBB3A8];
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_dictionaryByAddingEntriesFromDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_TypeLabel___typeLabel, "_setDefaultAttributes:", v13);

}

@end
