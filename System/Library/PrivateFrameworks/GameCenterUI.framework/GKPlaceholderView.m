@implementation GKPlaceholderView

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  v8[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appearanceWhenContainedInInstancesOfClasses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setBackgroundColor:", 0);
  objc_msgSend((id)objc_opt_class(), "appearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

+ (GKPlaceholderView)placeholderViewWithTitle:(id)a3 message:(id)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  GKPlaceholderView *v12;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  v11 = a3;
  v12 = -[_UIContentUnavailableView initWithFrame:title:style:]([GKPlaceholderView alloc], "initWithFrame:title:style:", v11, 0, x, y, width, height);

  -[_UIContentUnavailableView setMessage:](v12, "setMessage:", v10);
  return v12;
}

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
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GKPlaceholderView subviews](self, "subviews", 0);
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
        if (objc_msgSend(v13, "isUserInteractionEnabled"))
        {
          -[GKPlaceholderView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
          if ((objc_msgSend(v13, "pointInside:withEvent:", v7) & 1) != 0)
          {
            v14 = 1;
            goto LABEL_12;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

@end
