@implementation AKInkOverlayView_iOS

- (void)commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKInkOverlayView_iOS;
  -[AKInkOverlayView commonInit](&v3, sel_commonInit);
  -[AKInkOverlayView_iOS setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
}

- (id)_viewsToHitTestForEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AKInkOverlayView canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "type");

  if (v6 == 9)
  {
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "_adornmentViewsToHitTest");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
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
  -[AKInkOverlayView_iOS _viewsToHitTestForEvent:](self, "_viewsToHitTestForEvent:", v7);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
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
        if (v13)
        {
          -[AKInkOverlayView_iOS convertPoint:toView:](self, "convertPoint:toView:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), x, y, (_QWORD)v16);
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

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AKInkOverlayView_iOS;
  -[AKInkOverlayView_iOS hitTest:withEvent:](&v25, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[AKInkOverlayView_iOS _viewsToHitTestForEvent:](self, "_viewsToHitTestForEvent:", v7);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (v14)
          {
            -[AKInkOverlayView_iOS convertPoint:toView:](self, "convertPoint:toView:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), x, y, (_QWORD)v21);
            v16 = v15;
            v18 = v17;
            if (objc_msgSend(v14, "pointInside:withEvent:", v7))
            {
              objc_msgSend(v14, "hitTest:withEvent:", v7, v16, v18);
              v19 = objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v8 = (void *)v19;
                goto LABEL_14;
              }
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v11)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_14:

  }
  return v8;
}

@end
