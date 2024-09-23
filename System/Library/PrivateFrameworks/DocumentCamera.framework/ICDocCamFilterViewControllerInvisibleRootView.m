@implementation ICDocCamFilterViewControllerInvisibleRootView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ICDocCamFilterViewControllerInvisibleRootView subviews](self, "subviews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[ICDocCamFilterViewControllerInvisibleRootView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        if ((objc_msgSend(v13, "pointInside:withEvent:", v7) & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  ICDocCamFilterViewControllerInvisibleRootView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICDocCamFilterViewControllerInvisibleRootView;
  -[ICDocCamFilterViewControllerInvisibleRootView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (ICDocCamFilterViewControllerInvisibleRootView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (id)accessibilityLabel
{
  return +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Filter picker"), CFSTR("Filter picker"), CFSTR("Localizable"));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end
