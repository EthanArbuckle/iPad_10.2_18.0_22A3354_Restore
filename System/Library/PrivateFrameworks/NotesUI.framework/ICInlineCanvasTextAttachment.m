@implementation ICInlineCanvasTextAttachment

- (id)image
{
  return 0;
}

- (NSArray)inlineViews
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)attachmentViews
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)updatePaletteVisibility
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ICInlineCanvasTextAttachment inlineViews](self, "inlineViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "window");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICInkPaletteController sharedToolPickerForWindow:](ICInkPaletteController, "sharedToolPickerForWindow:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v9, "isVisible") & 1) != 0)
          v10 = 1;
        else
          v10 = objc_msgSend(v9, "_isAnimatingToVisible");
        objc_msgSend(v9, "setVisible:forFirstResponder:", v10, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)updatePaletteVisibilityToVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICInlineCanvasTextAttachment inlineViews](self, "inlineViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICInkPaletteController sharedToolPickerForWindow:](ICInkPaletteController, "sharedToolPickerForWindow:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setVisible:forFirstResponder:", v3, v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)setViewSelected:(BOOL)a3 inWindow:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ICInlineCanvasTextAttachment attachmentViews](self, "attachmentViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "window");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v6)
        {
          objc_opt_class();
          ICCheckedDynamicCast();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setAttachmentChromeVisible:animated:highlightBackground:", v4, 0, 0);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a6;
  objc_msgSend(v7, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextAttachment printableTextContentForAppearanceType:traitCollection:textContainer:](self, "printableTextContentForAppearanceType:traitCollection:textContainer:", objc_msgSend(v9, "ic_isDark"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
