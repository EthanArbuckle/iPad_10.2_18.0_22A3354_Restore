@implementation BarPopoverSourceInfo

- (BarPopoverSourceInfo)initWithBrowserController:(id)a3 barItem:(int64_t)a4
{
  id v7;
  BarPopoverSourceInfo *v8;
  BarPopoverSourceInfo *v9;
  BarPopoverSourceInfo *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BarPopoverSourceInfo;
  v8 = -[BarPopoverSourceInfo init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_barItem = a4;
    objc_storeStrong((id *)&v8->_browserController, a3);
    if (a4 == 11 && (_SFDeviceIsPad() & 1) == 0)
      v9->_shouldDismissIfSourceRemovedAfterRepositioning = 1;
    v10 = v9;
  }

  return v9;
}

- (id)_sourceInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[BrowserController rootViewController](self->_browserController, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "bars", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "popoverSourceInfoForBarItem:", self->_barItem);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v11 = (void *)v9;

          goto LABEL_13;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }

  v10 = WBS_LOG_CHANNEL_PREFIXUserInterface();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[BarPopoverSourceInfo _sourceInfo].cold.1((uint64_t)self, v3, v10);
  v11 = 0;
LABEL_13:

  return v11;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SFStringForBarItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; barItem = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (UIBarButtonItem)barButtonItem
{
  void *v2;
  void *v3;

  -[BarPopoverSourceInfo _sourceInfo](self, "_sourceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "barButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (UIBarButtonItem *)v3;
}

- (UIView)popoverSourceView
{
  void *v2;
  void *v3;

  -[BarPopoverSourceInfo _sourceInfo](self, "_sourceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "popoverSourceView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (UIView *)v3;
}

- (CGRect)popoverSourceRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[BarPopoverSourceInfo _sourceInfo](self, "_sourceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "popoverSourceRect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D628];
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)shouldDismissIfSourceRemovedAfterRepositioning
{
  return self->_shouldDismissIfSourceRemovedAfterRepositioning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserController, 0);
}

- (void)_sourceInfo
{
  const __CFString *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
    v5 = CFSTR("is NOT");
  else
    v5 = CFSTR("is");
  v6 = a3;
  objc_msgSend(a2, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  if (v7)
    v8 = CFSTR("is NOT");
  else
    v8 = CFSTR("is");
  v10 = a1;
  v11 = 2114;
  v12 = v5;
  v13 = 2114;
  v14 = v8;
  _os_log_fault_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_FAULT, "%{public}@: No inner source info (view controller %{public}@ nil; navigation bar %{public}@ nil)",
    (uint8_t *)&v9,
    0x20u);

}

@end
