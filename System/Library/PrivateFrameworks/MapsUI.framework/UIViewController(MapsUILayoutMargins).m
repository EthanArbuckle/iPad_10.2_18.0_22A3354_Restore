@implementation UIViewController(MapsUILayoutMargins)

- (uint64_t)_mapsui_resetViewLayoutMargins
{
  return objc_msgSend(a1, "_mapsui_resetViewLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:respectsSystemMinimum:", 0, 0, 0);
}

- (uint64_t)_mapsui_resetViewLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins
{
  return objc_msgSend(a1, "_mapsui_resetViewLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:respectsSystemMinimum:", a3, 0, 0);
}

- (uint64_t)_mapsui_resetViewLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins insetsFromSafeArea:
{
  return objc_msgSend(a1, "_mapsui_resetViewLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:respectsSystemMinimum:", a3, a4, 0);
}

- (void)_mapsui_resetViewLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins insetsFromSafeArea:respectsSystemMinimum:
{
  id v8;

  objc_msgSend(a1, "setViewRespectsSystemMinimumLayoutMargins:", a5);
  objc_msgSend(a1, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mapsui_resetLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:", a3, a4);

}

- (id)_mapsui_viewLayoutMarginsDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  UIEdgeInsets v24;
  UIEdgeInsets v25;
  NSDirectionalEdgeInsets v26;
  UIEdgeInsets v27;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("{\n"));
  objc_msgSend(a1, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  NSStringFromUIEdgeInsets(v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\tview.layoutMargins: %@,\n"), v4);

  objc_msgSend(a1, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  NSStringFromUIEdgeInsets(v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\tview.safeAreaInsets: %@,\n"), v6);

  objc_msgSend(a1, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "edgesPreservingSuperviewLayoutMargins"))
  {
    objc_msgSend(a1, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "edgesPreservingSuperviewLayoutMargins");

    if (v9 != 15)
    {
      objc_msgSend(a1, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MUStringFromUIRectEdge(objc_msgSend(v10, "edgesPreservingSuperviewLayoutMargins"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendFormat:", CFSTR("\tview.edgesPreservingSuperviewLayoutMargins: (%@),\n"), v11);

      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(a1, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "preservesSuperviewLayoutMargins"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v2, "appendFormat:", CFSTR("\tview.preservesSuperviewLayoutMargins: %@,\n"), v12);
LABEL_9:

  objc_msgSend(a1, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "edgesInsettingLayoutMarginsFromSafeArea"))
  {
    objc_msgSend(a1, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "edgesInsettingLayoutMarginsFromSafeArea");

    if (v15 != 15)
    {
      objc_msgSend(a1, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MUStringFromUIRectEdge(objc_msgSend(v16, "edgesInsettingLayoutMarginsFromSafeArea"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendFormat:", CFSTR("\tview.edgesInsettingLayoutMarginsFromSafeArea: (%@),\n"), v17);

      goto LABEL_17;
    }
  }
  else
  {

  }
  objc_msgSend(a1, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "insetsLayoutMarginsFromSafeArea"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v2, "appendFormat:", CFSTR("\tview.insetsLayoutMarginsFromSafeArea: %@,\n"), v18);
LABEL_17:

  if (objc_msgSend(a1, "viewRespectsSystemMinimumLayoutMargins"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v2, "appendFormat:", CFSTR("\tviewRespectsSystemMinimumLayoutMargins: %@,\n"), v19);
  objc_msgSend(a1, "systemMinimumLayoutMargins");
  NSStringFromDirectionalEdgeInsets(v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\tsystemMinimumLayoutMargins: %@,\n"), v20);

  objc_msgSend(a1, "additionalSafeAreaInsets");
  NSStringFromUIEdgeInsets(v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\tadditionalSafeAreaInsets: %@,\n"), v21);

  objc_msgSend(v2, "appendFormat:", CFSTR("}"));
  v22 = (void *)objc_msgSend(v2, "copy");

  return v22;
}

@end
