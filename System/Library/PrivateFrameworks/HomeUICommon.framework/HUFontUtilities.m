@implementation HUFontUtilities

+ (id)preferredFontForTextStyle:(id)a3 traits:(unsigned int)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, *(_QWORD *)&a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_excessiveLineHeightCharacterSet
{
  if (qword_25433F610 != -1)
    dispatch_once(&qword_25433F610, &__block_literal_global);
  return (id)_MergedGlobals_4;
}

void __51__HUFontUtilities__excessiveLineHeightCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v1 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = v0;

}

+ (id)staticPreferredFontForTextStyle:(id)a3
{
  return +[HUFontUtilities staticPreferredFontForTextStyle:traits:](HUFontUtilities, "staticPreferredFontForTextStyle:traits:", a3, 0);
}

+ (id)staticPreferredFontForTextStyle:(id)a3 traits:(unsigned int)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDF6A78], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, *(_QWORD *)&a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fontDescriptorWithMonospacedDigitsForFontDescriptor:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16 = *MEMORY[0x24BDF7748];
  v3 = *MEMORY[0x24BDF7778];
  v11 = *MEMORY[0x24BDF7780];
  v12 = v3;
  v13 = &unk_250F4CE38;
  v14 = &unk_250F4CE50;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", &v13, &v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (UIEdgeInsets)languageAwareOutsetsForString:(id)a3 withFont:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  UIEdgeInsets result;

  v5 = a4;
  v13 = *MEMORY[0x24BDF7718];
  v14 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_excessiveLineHeightCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v7);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    CTFontGetLanguageAwareOutsets();

  v10 = *((double *)&v13 + 1);
  v9 = *(double *)&v13;
  v12 = *((double *)&v14 + 1);
  v11 = *(double *)&v14;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

@end
