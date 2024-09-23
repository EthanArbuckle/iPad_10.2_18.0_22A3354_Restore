@implementation UIView(MapsUILayoutMargins)

- (uint64_t)_mapsui_resetLayoutMargins
{
  return objc_msgSend(a1, "_mapsui_resetLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:", 0, 0);
}

- (uint64_t)_mapsui_resetLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins
{
  return objc_msgSend(a1, "_mapsui_resetLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:", a3, 0);
}

- (uint64_t)_mapsui_resetLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins insetsFromSafeArea:
{
  uint64_t result;

  objc_msgSend(a1, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  if (objc_msgSend(a1, "preservesSuperviewLayoutMargins") != (_DWORD)a3)
    objc_msgSend(a1, "setPreservesSuperviewLayoutMargins:", a3);
  result = objc_msgSend(a1, "insetsLayoutMarginsFromSafeArea");
  if ((_DWORD)result != (_DWORD)a4)
    return objc_msgSend(a1, "setInsetsLayoutMarginsFromSafeArea:", a4);
  return result;
}

- (id)_mapsui_layoutMarginsDescription
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  UIEdgeInsets v11;
  UIEdgeInsets v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("{\n"));
  objc_msgSend(a1, "layoutMargins");
  NSStringFromUIEdgeInsets(v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\tlayoutMargins: %@,\n"), v3);

  objc_msgSend(a1, "safeAreaInsets");
  NSStringFromUIEdgeInsets(v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\tsafeAreaInsets: %@,\n"), v4);

  if (objc_msgSend(a1, "edgesPreservingSuperviewLayoutMargins")
    && objc_msgSend(a1, "edgesPreservingSuperviewLayoutMargins") != 15)
  {
    MUStringFromUIRectEdge(objc_msgSend(a1, "edgesPreservingSuperviewLayoutMargins"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("\tedgesPreservingSuperviewLayoutMargins: (%@),\n"), v6);

  }
  else
  {
    if (objc_msgSend(a1, "preservesSuperviewLayoutMargins"))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    objc_msgSend(v2, "appendFormat:", CFSTR("\tpreservesSuperviewLayoutMargins: %@,\n"), v5);
  }
  if (objc_msgSend(a1, "edgesInsettingLayoutMarginsFromSafeArea")
    && objc_msgSend(a1, "edgesInsettingLayoutMarginsFromSafeArea") != 15)
  {
    MUStringFromUIRectEdge(objc_msgSend(a1, "edgesInsettingLayoutMarginsFromSafeArea"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("\tedgesInsettingLayoutMarginsFromSafeArea: (%@),\n"), v8);

  }
  else
  {
    if (objc_msgSend(a1, "insetsLayoutMarginsFromSafeArea"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    objc_msgSend(v2, "appendFormat:", CFSTR("\tinsetsLayoutMarginsFromSafeArea: %@,\n"), v7);
  }
  objc_msgSend(v2, "appendFormat:", CFSTR("}"));
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

- (id)_mapsui_preservedLayoutMarginsDescription
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v1, "_mapsui_layoutMarginsDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@\n%@"), v1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "superview");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    while (1)
    {
      v7 = objc_msgSend(v1, "preservesSuperviewLayoutMargins");

      if (!v7)
        break;
      objc_msgSend(v1, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "_mapsui_layoutMarginsDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n  * "));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@\n%@\n  * %@"), v8, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v12;
      v1 = v8;
      if (!v6)
        goto LABEL_7;
    }
  }
  v8 = v1;
  v12 = v4;
LABEL_7:

  return v12;
}

- (id)_mapsui_recursiveLayoutMarginsDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_mapsui_layoutMarginsDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@\n%@"), a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a1, "subviews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      v9 = v4;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v11 = objc_msgSend(v10, "preservesSuperviewLayoutMargins");
        v12 = CFSTR("|");
        if (v11)
          v12 = CFSTR("*");
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = v12;
        objc_msgSend(v10, "_mapsui_recursiveLayoutMarginsDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n  %@ "), v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@\n  %@ %@"), v9, v14, v17);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v4;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v4;
}

@end
