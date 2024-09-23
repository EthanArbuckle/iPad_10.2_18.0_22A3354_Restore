@implementation CKLargeTitleAccessoryView

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;

  v30 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)CKLargeTitleAccessoryView;
  -[CKLargeTitleAccessoryView layoutSubviews](&v28, sel_layoutSubviews);
  -[CKLargeTitleAccessoryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = self->_accessoryButtons;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v15 = v4;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "bounds", (_QWORD)v24);
        v19 = v18;
        v21 = v20;
        v31.origin.x = v4;
        v31.origin.y = v6;
        v31.size.width = v8;
        v31.size.height = v10;
        objc_msgSend(v17, "setFrame:", v15, CGRectGetMidY(v31) + v21 * -0.5, v19, v21);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "conversationListComposeButtonSpacing");
        v15 = v15 + v19 + v23;

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v13);
  }

}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  NSArray *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  int64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGSize result;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_accessoryButtons;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if (v5)
  {
    v9 = v5;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "bounds", (_QWORD)v19);
        v8 = fmax(v12, v8);
        v7 = v7 + v13;
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  if (-[NSArray count](self->_accessoryButtons, "count"))
  {
    v14 = -[NSArray count](self->_accessoryButtons, "count") - 1;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "conversationListComposeButtonSpacing");
    v6 = v16 * (double)v14;

  }
  v17 = v7 + v6;
  v18 = v8;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)setAccessoryButtons:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *accessoryButtons;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_accessoryButtons;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9++), "removeFromSuperview");
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v10 = (NSArray *)objc_msgSend(v4, "copy");
  accessoryButtons = self->_accessoryButtons;
  self->_accessoryButtons = v10;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[CKLargeTitleAccessoryView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

+ (id)newComposeButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentMode:", 4);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newComposeImage");
  objc_msgSend(v2, "setImage:forState:", v5, 0);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v9);

  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("composeButton"));
  objc_msgSend(v2, "setTitle:forState:", 0, 0);
  objc_msgSend(v2, "setBounds:", 0.0, 0.0, 30.0, 30.0);
  if (CKMainScreenScale_once_0 != -1)
    dispatch_once(&CKMainScreenScale_once_0, &__block_literal_global_2);
  v10 = *(double *)&CKMainScreenScale_sMainScreenScale_0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_0 == 0.0)
    v10 = 1.0;
  v11 = round(v10 * 15.0) / v10;
  objc_msgSend(v2, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v11);

  objc_msgSend(v2, "setShowsLargeContentViewer:", 1);
  CKFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("COMPOSE"), &stru_1E276D870, CFSTR("ChatKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLargeContentTitle:", v14);

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("square.and.pencil"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLargeContentImage:", v15);

  objc_msgSend(v2, "setScalesLargeContentImage:", 1);
  return v2;
}

+ (id)newOptionsButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentMode:", 4);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionsImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", v5, 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemFillColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v6);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v9);

  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("optionsButton"));
  objc_msgSend(v2, "setTitle:forState:", 0, 0);
  objc_msgSend(v2, "setBounds:", 0.0, 0.0, 30.0, 30.0);
  if (CKMainScreenScale_once_0 != -1)
    dispatch_once(&CKMainScreenScale_once_0, &__block_literal_global_2);
  v10 = *(double *)&CKMainScreenScale_sMainScreenScale_0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_0 == 0.0)
    v10 = 1.0;
  v11 = round(v10 * 15.0) / v10;
  objc_msgSend(v2, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v11);

  objc_msgSend(v2, "setShowsLargeContentViewer:", 1);
  CKFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MORE"), &stru_1E276D870, CFSTR("ChatKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLargeContentTitle:", v14);

  return v2;
}

- (NSArray)accessoryButtons
{
  return self->_accessoryButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryButtons, 0);
}

@end
