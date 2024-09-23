@implementation NSMutableAttributedString(HKAdditions)

+ (id)hk_initWithString:()HKAdditions font:hyphenationFactor:
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DC1290];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "defaultParagraphStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  *(float *)&v12 = a1;
  objc_msgSend(v11, "setHyphenationFactor:", v12);
  objc_msgSend(v11, "setLineBreakMode:", 4);
  v13 = objc_alloc(MEMORY[0x1E0CB3778]);
  v14 = *MEMORY[0x1E0DC1178];
  v18[0] = *MEMORY[0x1E0DC1138];
  v18[1] = v14;
  v19[0] = v8;
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v13, "initWithString:attributes:", v9, v15);
  return v16;
}

+ (id)hk_attributedStringForText:()HKAdditions style:color:boldText:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0DC1350];
  v13 = a4;
  objc_msgSend(v12, "preferredFontForTextStyle:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", v13, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = *MEMORY[0x1E0DC1138];
  v22[0] = *MEMORY[0x1E0DC1140];
  v22[1] = v16;
  v23[0] = v10;
  v23[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v9, v17);
  if (v11)
  {
    v19 = objc_msgSend(v9, "localizedStandardRangeOfString:", v11);
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v18, "addAttribute:value:range:", v16, v15, v19, v20);
  }

  return v18;
}

@end
