@implementation UISearchBar(SafariExtras)

+ (id)sf_installSearchBarInTableView:()SafariExtras includeSeparator:
{
  objc_class **v4;
  objc_class *v5;
  id v6;
  id v7;
  double Width;
  double v9;
  CGRect v11;
  CGRect v12;

  v4 = (objc_class **)off_1E21E0498;
  if (!a4)
    v4 = (objc_class **)0x1E0DC3C38;
  v5 = *v4;
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setAutoresizingMask:", 2);
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v11);
  objc_msgSend(v7, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, Width, _SFRoundFloatToPixels(v9));
  objc_msgSend(v7, "setSearchBarStyle:", 2);
  objc_msgSend(v6, "setTableHeaderView:", v7);
  objc_msgSend(v7, "frame");
  objc_msgSend(v6, "_setAllowedNavigationOverlapAmount:", CGRectGetHeight(v12));
  objc_msgSend(v6, "_setFirstResponderKeyboardAvoidanceEnabled:", 0);

  return v7;
}

@end
