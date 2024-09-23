@implementation BCUI2x4AvocadoViewController

- (double)_columnWidthForBounds:(CGRect)a3 andMaxNumViews:(double)a4
{
  return (CGRectGetWidth(a3) + -38.0 + (a4 + -1.0) * -17.0) / a4;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BCUI2x4AvocadoViewController;
  -[BCUIAvocadoViewController _contentSizeCategoryDidChange:](&v22, sel__contentSizeCategoryDidChange_, v4);
  v17 = v4;
  v5 = +[BCUIRingItemView isAX3PlusLayoutRequiredForContentSizeCategory:](BCUIRingItemView, "isAX3PlusLayoutRequiredForContentSizeCategory:", v4);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[BCUIAvocadoViewController _batteryDeviceViews](self, "_batteryDeviceViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[BCUI2x4AvocadoViewController view](self, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bounds");
          -[BCUI2x4AvocadoViewController _columnWidthForBounds:andMaxNumViews:](self, "_columnWidthForBounds:andMaxNumViews:");
          v14 = v13;

          v15 = (double)74 / v14;
          if (!v5)
            v15 = 1.0;
          objc_msgSend(v11, "setRingScale:", v15);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }

  -[BCUI2x4AvocadoViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNeedsLayout");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  int v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double MaxX;
  double v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;

  v50 = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)BCUI2x4AvocadoViewController;
  -[BCUIAvocadoViewController viewWillLayoutSubviews](&v48, sel_viewWillLayoutSubviews);
  -[BCUI2x4AvocadoViewController _maximumNumberOfBatteryDeviceViews](self, "_maximumNumberOfBatteryDeviceViews");
  -[BCUI2x4AvocadoViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[BCUI2x4AvocadoViewController _columnWidthForBounds:andMaxNumViews:](self, "_columnWidthForBounds:andMaxNumViews:");
  v13 = v12;
  v51.origin.x = v5;
  v51.origin.y = v7;
  v51.size.width = v9;
  v51.size.height = v11;
  CGRectGetHeight(v51);
  v14 = objc_msgSend(v3, "_shouldReverseLayoutDirection");
  if (v14)
  {
    v52.origin.y = v7;
    v52.origin.x = v5;
    v52.size.height = v11;
    v52.size.width = v9;
    v15 = CGRectGetMaxX(v52) + -19.0;
  }
  objc_msgSend(v3, "window", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v3, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "screen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    v20 = v19;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v20 = v21;
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[BCUIAvocadoViewController _batteryDeviceViews](self, "_batteryDeviceViews");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v45 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v27, "ringScale");
        if (v28 == 1.0)
        {
          UIRectIntegralWithScale();
        }
        else
        {
          v43 = v20;
          UIRectCenteredYInRectScale();
        }
        v33 = v29;
        v34 = v30;
        v35 = v31;
        v36 = v32;
        objc_msgSend(v27, "setFrame:", v43);
        v37 = v33;
        v38 = v34;
        v39 = v35;
        v40 = v36;
        if (v14)
        {
          MaxX = CGRectGetMinX(*(CGRect *)&v37) - v13;
          v42 = -17.0;
        }
        else
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v37);
          v42 = 17.0;
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v49, 16, MaxX, v42);
    }
    while (v24);
  }

}

- (unint64_t)_maximumNumberOfBatteryDeviceViews
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[BCUI2x4AvocadoViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[BCUIRingItemView isAX3PlusLayoutRequiredForContentSizeCategory:](BCUIRingItemView, "isAX3PlusLayoutRequiredForContentSizeCategory:", v3))
  {
    v4 = 3;
  }
  else
  {
    v4 = 4;
  }

  return v4;
}

- (BOOL)_includeEmptyDevices
{
  return 1;
}

- (id)_newBatteryDeviceView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  BCUIRingItemView *v8;
  double v9;

  -[BCUI2x4AvocadoViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = +[BCUIRingItemView isAX3PlusLayoutRequiredForContentSizeCategory:](BCUIRingItemView, "isAX3PlusLayoutRequiredForContentSizeCategory:", v4);
  -[BCUI2x4AvocadoViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[BCUI2x4AvocadoViewController _columnWidthForBounds:andMaxNumViews:](self, "_columnWidthForBounds:andMaxNumViews:");
  v7 = v6;

  v8 = objc_alloc_init(BCUIRingItemView);
  -[BCUIRingItemView setRingItemViewStyle:](v8, "setRingItemViewStyle:", 1);
  -[BCUIRingItemView setRingLineWidth:](v8, "setRingLineWidth:", 6.0);
  v9 = 1.0;
  if ((_DWORD)v3)
    v9 = (double)74 / v7;
  -[BCUIRingItemView setRingScale:](v8, "setRingScale:", v9);

  return v8;
}

@end
