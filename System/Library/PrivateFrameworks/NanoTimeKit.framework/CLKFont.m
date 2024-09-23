@implementation CLKFont

void __106__CLKFont_RichComplicationRectangularDailyGraphFont__alternatePunctuationRoundedSemiBoldSystemFontOfSize___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DC13D0];
  v15[0] = *MEMORY[0x1E0DC13D8];
  v15[1] = v0;
  v16[0] = &unk_1E6C9D930;
  v16[1] = &unk_1E6C9D948;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0DC1380];
  v12 = v1;
  v13 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C944D0];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
  objc_msgSend(v5, "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)alternatePunctuationRoundedSemiBoldSystemFontOfSize__baseDescriptor;
  alternatePunctuationRoundedSemiBoldSystemFontOfSize__baseDescriptor = v8;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 512);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)alternatePunctuationRoundedSemiBoldSystemFontOfSize__cache;
  alternatePunctuationRoundedSemiBoldSystemFontOfSize__cache = v10;

}

@end
