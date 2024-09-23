@implementation BCUI4x4AvocadoViewController

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double MaxY;
  uint64_t i;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  double Width;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  v36 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)BCUI4x4AvocadoViewController;
  -[BCUIAvocadoViewController viewWillLayoutSubviews](&v34, sel_viewWillLayoutSubviews);
  -[BCUI4x4AvocadoViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = BCUI6x8RowHeightForBounds(v5, v7, v9, v11);
  -[BCUI4x4AvocadoViewController traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredContentSizeCategory");
  v14 = objc_claimAutoreleasedReturnValue();

  v29 = (void *)v14;
  v30 = 0u;
  v31 = 0u;
  if (+[BCUIRowView isAX3PlusLayoutRequiredForContentSizeCategory:](BCUIRowView, "isAX3PlusLayoutRequiredForContentSizeCategory:", v14))
  {
    v12 = v12 + v12;
  }
  v32 = 0uLL;
  v33 = 0uLL;
  -[BCUIAvocadoViewController _batteryDeviceViews](self, "_batteryDeviceViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    MaxY = 0.0;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v22 = objc_opt_class();
        v23 = v21;
        if (v22)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v24 = v23;
          else
            v24 = 0;
        }
        else
        {
          v24 = 0;
        }
        v25 = v24;

        -[BCUIAvocadoViewController _batteryDeviceViews](self, "_batteryDeviceViews");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastObject");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setSeparatorVisible:", v23 != v27);

        v37.origin.x = v5;
        v37.origin.y = v7;
        v37.size.width = v9;
        v37.size.height = v11;
        Width = CGRectGetWidth(v37);
        objc_msgSend(v23, "setFrame:", 0.0, MaxY, Width, v12);
        v38.origin.x = 0.0;
        v38.origin.y = MaxY;
        v38.size.width = Width;
        v38.size.height = v12;
        MaxY = CGRectGetMaxY(v38);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v17);
  }

}

- (unint64_t)_maximumNumberOfBatteryDeviceViews
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[BCUI4x4AvocadoViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[BCUIRowView isAX3PlusLayoutRequiredForContentSizeCategory:](BCUIRowView, "isAX3PlusLayoutRequiredForContentSizeCategory:", v3))
  {
    v4 = 3;
  }
  else
  {
    v4 = 6;
  }

  return v4;
}

- (BOOL)_includeEmptyDevices
{
  return 1;
}

- (id)_newBatteryDeviceView
{
  return objc_alloc_init(BCUIRowView);
}

- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "setEmpty:", v9 == 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "setTransitionCoordinator:", v10);
  if (v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)BCUI4x4AvocadoViewController;
    -[BCUIAvocadoViewController _configureBatteryDeviceView:withBatteryDevice:transitionCoordinator:](&v11, sel__configureBatteryDeviceView_withBatteryDevice_transitionCoordinator_, v8, v9, v10);
  }

}

@end
