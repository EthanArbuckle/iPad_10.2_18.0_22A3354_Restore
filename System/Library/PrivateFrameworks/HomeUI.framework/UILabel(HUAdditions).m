@implementation UILabel(HUAdditions)

+ (id)labelWithText:()HUAdditions font:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSString *v11;
  uint64_t v12;

  v5 = (objc_class *)MEMORY[0x1E0CEA700];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setFont:", v6);

  objc_msgSend(v9, "setText:", v7);
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v11))
    v12 = 0;
  else
    v12 = 2;
  objc_msgSend(v9, "setNumberOfLines:", v12);

  return v9;
}

@end
