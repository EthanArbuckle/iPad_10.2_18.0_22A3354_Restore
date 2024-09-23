@implementation UITraitCollection(MailUI)

- (double)mf_leadingEdgeToBackButtonText
{
  const __CFString *v1;
  void *v2;
  double v3;
  double v4;

  if (objc_msgSend(a1, "verticalSizeClass") == 1)
    v1 = CFSTR("UINavigationBarBackIndicatorLandscape");
  else
    v1 = CFSTR("UINavigationBarBackIndicatorDefault");
  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3 + -8.0 + 6.0;

  return v4;
}

- (BOOL)mf_traitDifferenceAffectsTextLayout:()MailUI
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;

  v4 = a3;
  v5 = objc_msgSend(a1, "layoutDirection");
  if (v5 != objc_msgSend(v4, "layoutDirection"))
    goto LABEL_8;
  objc_msgSend(a1, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  if (v7 != v8)
    goto LABEL_8;
  v9 = objc_msgSend(a1, "horizontalSizeClass");
  if (v9 != objc_msgSend(v4, "horizontalSizeClass"))
    goto LABEL_8;
  v10 = objc_msgSend(a1, "verticalSizeClass");
  if (v10 != objc_msgSend(v4, "verticalSizeClass"))
    goto LABEL_8;
  objc_msgSend(a1, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12 && (v13 = objc_msgSend(a1, "legibilityWeight"), v13 == objc_msgSend(v4, "legibilityWeight")))
  {
    v14 = objc_msgSend(a1, "_splitViewControllerContext");
    v15 = v14 != objc_msgSend(v4, "_splitViewControllerContext");
  }
  else
  {
LABEL_8:
    v15 = 1;
  }

  return v15;
}

@end
