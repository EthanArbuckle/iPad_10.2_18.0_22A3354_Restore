@implementation UIFont(MapsUIExtras)

+ (id)_mapsui_preferredFontForTextStyle:()MapsUIExtras maxContentSizeCategory:weight:withSymbolicTraits:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;

  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v10;
  v14 = v13;
  if ((id)*MEMORY[0x1E0DC4938] != v13)
  {
    v14 = v13;
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v12, (UIContentSizeCategory)v13) == NSOrderedAscending)
    {
      v14 = v12;

    }
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", v9, v14, a6, a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
