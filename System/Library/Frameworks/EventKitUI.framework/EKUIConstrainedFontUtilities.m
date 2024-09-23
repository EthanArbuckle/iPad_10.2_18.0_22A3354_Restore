@implementation EKUIConstrainedFontUtilities

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EKUIConstrainedFontUtilities_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

void __42__EKUIConstrainedFontUtilities_initialize__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_clearFontCaches, *MEMORY[0x1E0DC48E8], 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_clearFontCaches, *MEMORY[0x1E0C99720], 0);

}

+ (void)clearFontCaches
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)__constrainedBodyTextLabelFont;
  __constrainedBodyTextLabelFont = 0;

  v3 = (void *)__constrainedCaption1TextLabelFont;
  __constrainedCaption1TextLabelFont = 0;

  v4 = (void *)__constrainedBodyBoldTextLabelFont;
  __constrainedBodyBoldTextLabelFont = 0;

}

+ (id)constrainedBodyTextLabelFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)__constrainedBodyTextLabelFont;
  if (!__constrainedBodyTextLabelFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)__constrainedBodyTextLabelFont;
    __constrainedBodyTextLabelFont = v4;

    v2 = (void *)__constrainedBodyTextLabelFont;
  }
  return v2;
}

+ (id)constrainedCaption1TextLabelFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)__constrainedCaption1TextLabelFont;
  if (!__constrainedCaption1TextLabelFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A98], 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)__constrainedCaption1TextLabelFont;
    __constrainedCaption1TextLabelFont = v4;

    v2 = (void *)__constrainedCaption1TextLabelFont;
  }
  return v2;
}

+ (id)constrainedBodyBoldTextLabelFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)__constrainedBodyBoldTextLabelFont;
  if (!__constrainedBodyBoldTextLabelFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)__constrainedBodyBoldTextLabelFont;
    __constrainedBodyBoldTextLabelFont = v4;

    v2 = (void *)__constrainedBodyBoldTextLabelFont;
  }
  return v2;
}

+ (id)constrainedFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4 traitCollection:(id)a5
{
  return (id)objc_msgSend(a1, "constrainedFontForTextStyle:minimumContentSizeCategory:maximumContentSizeCategory:traitCollection:", a3, *MEMORY[0x1E0DC4938], a4, a5);
}

+ (id)constrainedFontForTextStyle:(id)a3 minimumContentSizeCategory:(id)a4 traitCollection:(id)a5
{
  return (id)objc_msgSend(a1, "constrainedFontForTextStyle:minimumContentSizeCategory:maximumContentSizeCategory:traitCollection:", a3, a4, *MEMORY[0x1E0DC4938], a5);
}

+ (id)constrainedFontForTextStyle:(id)a3 minimumContentSizeCategory:(id)a4 maximumContentSizeCategory:(id)a5 traitCollection:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "preferredContentSizeCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredContentSizeCategoryOrOverride");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = (id)*MEMORY[0x1E0DC4938];
  if ((id)*MEMORY[0x1E0DC4938] != v10
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v14, (UIContentSizeCategory)v10) == NSOrderedAscending)
  {
    v17 = v10;

    v14 = v17;
  }
  if (v16 != v11
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v14, (UIContentSizeCategory)v11) == NSOrderedDescending)
  {
    v18 = v11;

    v14 = v18;
  }
  v19 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)constrainedFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4 addingSymbolicTraits:(unsigned int)a5 traitCollection:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "preferredContentSizeCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredContentSizeCategoryOrOverride");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((id)*MEMORY[0x1E0DC4938] != v10
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v13, (UIContentSizeCategory)v10) == NSOrderedDescending)
  {
    v15 = v10;

    v13 = v15;
  }
  v16 = (void *)MEMORY[0x1E0DC1358];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v9, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "fontDescriptorWithSymbolicTraits:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v20 = v19;
  else
    v20 = v18;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v20, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (int64_t)tableViewCellCappedSymbolImageScaleWithScale:(int64_t)a3 traitCollection:(id)a4
{
  id v5;
  NSString *v6;
  NSComparisonResult v7;
  int64_t v8;
  NSString *v9;
  NSComparisonResult v10;
  int64_t v11;
  int64_t v12;

  v5 = a4;
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E0DC48C8]);

  if (v7 == NSOrderedAscending)
  {
    objc_msgSend(v5, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = UIContentSizeCategoryCompareToCategory(v9, (UIContentSizeCategory)*MEMORY[0x1E0DC48D8]);

    v8 = 2;
    if (v10 == NSOrderedAscending)
      v8 = 3;
  }
  else
  {
    v8 = 1;
  }
  if (v8 >= a3)
    v11 = a3;
  else
    v11 = v8;
  if ((unint64_t)(a3 + 1) >= 2)
    v12 = v11;
  else
    v12 = v8;

  return v12;
}

@end
