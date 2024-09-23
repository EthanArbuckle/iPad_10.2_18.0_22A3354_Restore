@implementation UIFont

+ (id)bsui_defaultFont:(void *)a3 forTextStyle:(uint64_t)a4 hiFontStyle:(void *)a5 contentSizeCategory:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v8 = a3;
  v9 = a5;
  objc_opt_self();
  if (v9)
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v9);
  else
    objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    if (a2)
      objc_msgSend(MEMORY[0x1E0CEA5E8], "defaultFontForTextStyle:", v8);
    else
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = ((_DWORD)a4 << 12) & 0x18000 | (a4 >> 1) & 3;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v8, ((_DWORD)a4 << 12) & 0x18000 | (a4 >> 1) & 3, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v8, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", v11);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v12, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

@end
