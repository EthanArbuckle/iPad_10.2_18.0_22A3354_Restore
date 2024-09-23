@implementation CKUIThemeClarityUI

- (id)transcriptBackgroundColor
{
  if (transcriptBackgroundColor_once_1530 != -1)
    dispatch_once(&transcriptBackgroundColor_once_1530, &__block_literal_global_1531);
  return (id)transcriptBackgroundColor_sBehavior_1529;
}

void __47__CKUIThemeClarityUI_transcriptBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptBackgroundColor_sBehavior_1529;
  transcriptBackgroundColor_sBehavior_1529 = v0;

}

- (id)transcriptTextColor
{
  int v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)transcriptTextColor_sBehavior_1532;
  if (transcriptTextColor_sBehavior_1532)
    v4 = transcriptTextColor_sIsIncreaseContrastEnabled_transcriptTextColor == v2;
  else
    v4 = 0;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0CEA478];
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.333333333, 0.333333333, 0.345098039, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dynamicColorWithLightColor:darkColor:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)transcriptTextColor_sBehavior_1532;
    transcriptTextColor_sBehavior_1532 = v8;

    transcriptTextColor_sIsIncreaseContrastEnabled_transcriptTextColor = v2;
    v3 = (void *)transcriptTextColor_sBehavior_1532;
  }
  return v3;
}

- (id)gray_balloonColors
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CKUIThemeClarityUI_gray_balloonColors__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (gray_balloonColors_once_1534 != -1)
    dispatch_once(&gray_balloonColors_once_1534, block);
  return (id)gray_balloonColors_sBehavior_1533;
}

void __40__CKUIThemeClarityUI_gray_balloonColors__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)CKUIThemeClarityUI;
  objc_msgSendSuper2(&v17, sel_gray_balloonColors);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1E0CEA478];
        objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dynamicColorWithLightColor:darkColor:", v10, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "addObject:", v11);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v5);
  }

  v12 = (void *)gray_balloonColors_sBehavior_1533;
  gray_balloonColors_sBehavior_1533 = (uint64_t)v2;

}

@end
