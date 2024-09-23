@implementation TSNavigationBarTitleView

+ (id)emptyNavigationBarTitleView
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0DC4298]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setHideBackButton:", 1);
  objc_msgSend(v3, "setHideStandardTitle:", 1);
  objc_msgSend(v3, "setHideLeadingBarButtons:", 1);
  objc_msgSend(v3, "setHideTrailingBarButtons:", 1);
  return v3;
}

@end
