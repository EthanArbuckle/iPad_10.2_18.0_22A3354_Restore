@implementation UIView(HUAdditions)

- (uint64_t)hu_setFramePreservingTransform:()HUAdditions
{
  double MidX;
  CGRect v12;
  CGRect v13;

  objc_msgSend(a1, "setBounds:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v12.origin.x = a2;
  v12.origin.y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = a2;
  v13.origin.y = a3;
  v13.size.width = a4;
  v13.size.height = a5;
  return objc_msgSend(a1, "setCenter:", MidX, CGRectGetMidY(v13));
}

- (void)hu_traverseViewHierarchy:()HUAdditions
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v4[2](v4, v10);
        objc_msgSend(v10, "hu_traverseViewHierarchy:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (uint64_t)hu_autoSizeByConstrainingWidth:()HUAdditions
{
  double v6;
  double v7;

  LODWORD(a4) = 1148846080;
  LODWORD(a5) = 1112014848;
  objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a2, *(double *)(MEMORY[0x24BDF7B88] + 8), a4, a5);
  objc_msgSend(a1, "frame");
  v7 = v6;
  objc_msgSend(a1, "frame");
  return objc_msgSend(a1, "setFrame:", v7);
}

+ (void)hu_enableAnimations:()HUAdditions forBlock:
{
  uint64_t v5;
  void (**v6)(void);

  v6 = a4;
  v5 = objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled");
  if ((_DWORD)v5)
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", a3);
  v6[2]();
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", v5);

}

- (BOOL)hu_isHomeAffordancePresent
{
  void *v1;
  double v2;
  _BOOL8 v3;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeAreaInsets");
  v3 = v2 > 0.0;

  return v3;
}

- (uint64_t)hu_isDescendantOfPickerView
{
  id v1;
  void *v2;
  char isKindOfClass;
  uint64_t v4;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    do
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v4;
    }
    while (v4);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (const)hu_contentModeString
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "contentMode");
  if ((unint64_t)(v1 - 1) > 0xB)
    return CFSTR("ScaleToFill");
  else
    return off_250F49E08[v1 - 1];
}

@end
