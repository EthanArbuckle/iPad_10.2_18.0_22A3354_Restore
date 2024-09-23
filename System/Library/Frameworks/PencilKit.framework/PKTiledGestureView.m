@implementation PKTiledGestureView

- (PKTiledGestureView)init
{
  PKTiledGestureView *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKTiledGestureView;
  v2 = -[PKTiledGestureView init](&v7, sel_init);
  +[PKStatisticsManager sharedStatisticsManager]();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 64);
  else
    v5 = 0;
  objc_storeStrong((id *)&v2->_drawingPaletteStatistics, v5);

  return v2;
}

- (id)scrollView
{
  void *v2;
  void *v3;

  -[PKTiledGestureView tiledView](self, "tiledView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ink
{
  void *v2;
  void *v3;

  -[PKTiledGestureView tiledView](self, "tiledView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hoverController
{
  void *v2;
  void *v3;

  -[PKTiledGestureView tiledView](self, "tiledView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hoverController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setupPencilShadowViewIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[PKTiledGestureView tiledView](self, "tiledView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "toolShadowShouldBeActive");

  if (!v4)
  {
    -[PKTiledGestureView window](self, "window");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilShadowView hideShadowViewForSceneIfNecessary:](PKPencilShadowView, "hideShadowViewForSceneIfNecessary:", v13);
    goto LABEL_5;
  }
  -[PKTiledGestureView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (-[PKPencilObserverInteraction isActive]((uint64_t)v17))
  {
    -[PKTiledGestureView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilShadowView createShadowViewForSceneIfNecessary:](PKPencilShadowView, "createShadowViewForSceneIfNecessary:", v8);

    -[PKTiledGestureView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilShadowView shadowViewForScene:](PKPencilShadowView, "shadowViewForScene:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledGestureView tiledView](self, "tiledView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keepVisibleInTiledView:", v12);

    -[PKTiledGestureView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilShadowView shadowViewForScene:](PKPencilShadowView, "shadowViewForScene:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledGestureView ink](self, "ink");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInk:", v16);

LABEL_5:
  }

}

- (id)rulerController
{
  void *v2;
  void *v3;

  -[PKTiledGestureView tiledView](self, "tiledView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rulerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)selectionController
{
  void *v2;
  void *v3;

  -[PKTiledGestureView tiledView](self, "tiledView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)hitTestUpdateEffects_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5
{
  CGFloat y;
  CGFloat x;
  void *v9;
  id v10;
  CGPoint v11;
  CGRect v12;

  if (a4)
  {
    y = a3.y;
    x = a3.x;
    -[PKTiledGestureView bounds](self, "bounds");
    v11.x = x;
    v11.y = y;
    if (CGRectContainsPoint(v12, v11))
    {
      -[PKTiledGestureView tiledView](self, "tiledView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setupPencilShadowViewIfNecessary");

    }
    if (!a5)
    {
      -[PKTiledGestureView hoverController](self, "hoverController");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[PKHoverController didReceiveNormalTouch:]((uint64_t)v10, 0);

    }
  }
}

- (BOOL)hitTestHandwritingInk_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5
{
  void *v7;
  BOOL v8;

  -[PKTiledGestureView ink](self, "ink", a3.x, a3.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_isHandwritingInk"))
    v8 = a4 & ~a5;
  else
    v8 = 0;

  return v8;
}

- (BOOL)hitTestHandleScrolling_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  const char *v11;
  uint8_t *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int16 v23;
  uint8_t buf[16];
  __int16 v25;
  __int16 v26;

  v5 = a4;
  -[PKTiledGestureView scrollView](self, "scrollView", a4, a5, a3.x, a3.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDecelerating");

  if (v8)
  {
    v9 = os_log_create("com.apple.pencilkit", ");
    v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v26 = 0;
      v11 = "Avoided tiled view hit while decelerating";
      v12 = (uint8_t *)&v26;
LABEL_16:
      _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_INFO, v11, v12, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  -[PKTiledGestureView scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_isAnimatingScroll");

  if (v14)
  {
    v9 = os_log_create("com.apple.pencilkit", ");
    v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v25 = 0;
      v11 = "Avoided tiled view hit while animating scroll";
      v12 = (uint8_t *)&v25;
      goto LABEL_16;
    }
LABEL_17:

    return v10;
  }
  -[PKTiledGestureView scrollView](self, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isDragging");

  if (v16)
  {
    if (v5)
    {
      -[PKTiledGestureView scrollView](self, "scrollView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "panGestureRecognizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "state");

      if (v19)
      {
        -[PKTiledGestureView scrollView](self, "scrollView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "panGestureRecognizer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setState:", 4);

        v9 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_INFO, "Cancelling the pan gesture to start drawing instead.", buf, 2u);
        }
        v10 = 0;
        goto LABEL_17;
      }
    }
    v9 = os_log_create("com.apple.pencilkit", ");
    v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v23 = 0;
      v11 = "Avoided tiled view hit while dragging";
      v12 = (uint8_t *)&v23;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  return 0;
}

- (BOOL)hitTestSelectionView_point:(CGPoint)a3 withEvent:(id)a4 hit:(id *)a5
{
  double y;
  double x;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  -[PKTiledGestureView selectionController](self, "selectionController");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 144);
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
    goto LABEL_9;
  objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v13, "hitTest:withEvent:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    if (objc_msgSend(v13, "isDragging"))
    {
      -[PKTiledGestureView tiledView](self, "tiledView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hitAttachment:includeStandinAttachment:", 1, x, y);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_6;
    }
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  v16 = objc_retainAutorelease(v14);
LABEL_6:
  *a5 = v15;

  v17 = 1;
LABEL_10:

  return v17;
}

- (BOOL)hitTestDragEvent_point:(CGPoint)a3 withEvent:(id)a4 hit:(id *)a5
{
  double y;
  double x;
  id v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  NSClassFromString(CFSTR("UIDragEvent"));
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    -[PKTiledGestureView tiledView](self, "tiledView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledGestureView tiledView](self, "tiledView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", 0, objc_msgSend(v12, "_shouldExpandBottomAttachmentForDragAndDrop"), x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "attachmentContainerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 == v13)
      {
        *a5 = objc_retainAutorelease(v13);
      }
      else
      {
        objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
        objc_msgSend(v15, "hitTest:withEvent:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v16)
          v16 = v15;
        *a5 = objc_retainAutorelease(v16);

      }
    }
    else
    {
      *a5 = 0;
    }

  }
  return isKindOfClass & 1;
}

- (id)_hitTestAttachmentMiniMenu:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PKTiledGestureView tiledView](self, "tiledView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visibleAttachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "convertPoint:fromView:", self, x, y);
        objc_msgSend(v12, "hitMiniMenu:");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)hitTestAttachmentChrome_point:(CGPoint)a3 isStylus:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6
{
  _BOOL8 v7;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v7 = a4;
  y = a3.y;
  x = a3.x;
  v33 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  -[PKTiledGestureView _hitTestAttachmentMiniMenu:](self, "_hitTestAttachmentMiniMenu:", x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    *a6 = objc_retainAutorelease(v12);
    v14 = 1;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[PKTiledGestureView tiledView](self, "tiledView", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "visibleAttachments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v21, "convertPoint:fromView:", self, x, y);
          v23 = v22;
          v25 = v24;
          if (objc_msgSend(v21, "hitChrome:isStylus:", v7))
          {
            *a6 = 0;
            v14 = 1;
            goto LABEL_15;
          }
          objc_msgSend(v21, "hitTest:withEvent:", v11, v23, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            goto LABEL_13;
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v14 = 0;
        if (v18)
          continue;
        break;
      }
    }
    else
    {
LABEL_13:
      v14 = 0;
    }
LABEL_15:

  }
  return v14;
}

- (BOOL)hitTestDataDetector_point:(CGPoint)a3 isStylus:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6
{
  double y;
  double x;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if (a4)
  {
    v12 = 0;
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PKTiledGestureView tiledView](self, "tiledView", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "visibleAttachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v19, "convertPoint:fromView:", self, x, y);
          objc_msgSend(v19, "inlineViewAtPoint:");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          *a6 = v20;
          if (v20)
          {
            v12 = 1;
            goto LABEL_13;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v16)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_13:

  }
  return v12;
}

- (BOOL)_shouldSelectionBeginAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id *v8;
  void *v9;
  int v10;
  id *v11;
  void *v12;
  char v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PKTiledGestureView selectionController](self, "selectionController");
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController selectionInteraction](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEnabled");

  if (v10)
  {
    -[PKTiledGestureView selectionController](self, "selectionController");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "_selectionInteractionShouldBeginAtPoint:forEvent:orGestureRecognizer:", v7, 0, x, y);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldForwardSelectionAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id *v8;
  void *v9;
  int v10;
  id *v11;
  void *v12;
  char v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PKTiledGestureView selectionController](self, "selectionController");
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController selectionInteraction](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEnabled");

  if (v10)
  {
    -[PKTiledGestureView selectionController](self, "selectionController");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "_selectionInteractionShouldForwardAtPoint:forEvent:", v7, x, y);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)hitTestSelectionGestures_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5 withEvent:(id)a6 hit:(id *)a7
{
  _BOOL4 v9;
  double y;
  double x;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  int v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  int v29;
  id v30;

  v9 = a4;
  y = a3.y;
  x = a3.x;
  v13 = a6;
  if (a5
    || !-[PKTiledGestureView _shouldSelectionBeginAtPoint:withEvent:](self, "_shouldSelectionBeginAtPoint:withEvent:", v13, x, y))
  {
    v21 = 0;
  }
  else
  {
    -[PKTiledGestureView selectionController](self, "selectionController");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = *(void **)(v14 + 152);
    else
      v16 = 0;
    v17 = v16;

    -[PKTiledGestureView ink](self, "ink");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "_isLassoInk");

    if ((v19 & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      -[PKTiledGestureView tiledView](self, "tiledView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_msgSend(v22, "allowsFingerDrawing") | v9) ^ 1;

    }
    -[PKTiledGestureView tiledView](self, "tiledView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", 1, 1, x, y);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[PKTiledGestureView selectionController](self, "selectionController");
      v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v25)
        v26 = v25[15] != 0;
      else
        v26 = 0;

    }
    else
    {
      v26 = 0;
    }

    -[PKTiledGestureView tiledView](self, "tiledView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", 0, 0, x, y);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    if (v28)
      v29 = 1;
    else
      v29 = v26;
    if (v17 && v20 | v19 && v29)
    {
      objc_msgSend(v17, "convertPoint:fromView:", self, x, y);
      objc_msgSend(v17, "hitTest:withEvent:", v13);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      *a7 = v30;
      if (v30)
        v21 = -1;
      else
        v21 = 0;
    }

  }
  return v21 & 1;
}

- (BOOL)hitTestDelegateSelection_point:(CGPoint)a3 isHover:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6
{
  double y;
  double x;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  y = a3.y;
  x = a3.x;
  v10 = a5;
  if (!-[PKTiledGestureView _shouldForwardSelectionAtPoint:withEvent:](self, "_shouldForwardSelectionAtPoint:withEvent:", v10, x, y))goto LABEL_5;
  -[PKTiledGestureView tiledView](self, "tiledView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 1;
  objc_msgSend(v11, "hitAttachment:includeStandinAttachment:", 1, x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "attachmentContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v14, "hitTest:withEvent:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = v14;
  *a6 = objc_retainAutorelease(v15);

  v17 = *a6;
  if (!v17)
LABEL_5:
    v12 = 0;

  return v12;
}

- (BOOL)hitTestClearSelectionIfItExists_point:(CGPoint)a3 isHover:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6
{
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;

  -[PKTiledGestureView selectionController](self, "selectionController", a3.x, a3.y);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 || !v10[15])
  {

    return 0;
  }
  -[PKTiledGestureView tiledView](self, "tiledView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectionInteraction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEnabled");

  if (!v14)
    return 0;
  if (a5 && !a4)
  {
    -[PKTiledGestureView selectionController](self, "selectionController");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v15, 1, 0);

  }
  *a6 = 0;
  return 1;
}

- (BOOL)hitTestPencilStickiness_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5 withEvent:(id)a6 hit:(id *)a7
{
  void *v7;
  double y;
  double x;
  id v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  _BOOL4 v26;

  y = a3.y;
  x = a3.x;
  v13 = a6;
  -[PKTiledGestureView tiledView](self, "tiledView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "allowsFingerDrawing"))
  {

    if (a4)
    {
      v16 = 0;
      goto LABEL_21;
    }
LABEL_7:
    -[PKTiledGestureView tiledView](self, "tiledView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hitAttachment:includeStandinAttachment:", 1, x, y);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "attachmentContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isAtEndOfDocument");
    if ((v20 & 1) == 0)
    {
      -[PKTiledGestureView tiledView](self, "tiledView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "standInAttachmentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 != v21)
      {

LABEL_10:
        *a7 = 0;
LABEL_20:

        v16 = 1;
        goto LABEL_21;
      }
    }
    if ((objc_msgSend(v18, "isFirstResponder") & 1) != 0 || objc_msgSend(v19, "isFirstResponder"))
    {
      if ((v20 & 1) == 0)
      {

      }
    }
    else
    {
      -[PKTiledGestureView window](self, "window");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = +[PKToolPicker isActiveToolPickerVisibleForWindow:](PKToolPicker, "isActiveToolPickerVisibleForWindow:", v25);

      if ((v20 & 1) != 0)
      {
        if (!v26)
          goto LABEL_10;
      }
      else
      {

        if (!v26)
          goto LABEL_10;
      }
    }
    if (v19 == v18)
    {
      *a7 = objc_retainAutorelease(v18);
    }
    else
    {
      objc_msgSend(v19, "convertPoint:fromView:", self, x, y);
      objc_msgSend(v19, "hitTest:withEvent:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (!v22)
        v22 = v19;
      *a7 = objc_retainAutorelease(v22);

    }
    goto LABEL_20;
  }
  -[PKTiledGestureView tiledView](self, "tiledView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "isReadOnlyView");

  v16 = 0;
  if (v15 && !a4)
    goto LABEL_7;
LABEL_21:

  return v16;
}

- (BOOL)hitTestInsertNewAttachments_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5 withEvent:(id)a6 hit:(id *)a7
{
  double y;
  double x;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;

  y = a3.y;
  x = a3.x;
  v12 = a6;
  if (a5)
  {
    -[PKTiledGestureView tiledView](self, "tiledView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hitAttachment:includeStandinAttachment:", 1, x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_9:
      *a7 = 0;
      v21 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    -[PKTiledGestureView ink](self, "ink");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "_isHandwritingInk"))
    {

    }
    else
    {
      -[PKTiledGestureView tiledView](self, "tiledView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hitAttachment:", x, y);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        -[PKTiledGestureView tiledView](self, "tiledView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTiledGestureView scrollView](self, "scrollView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "convertPoint:fromView:", self, x, y);
        v20 = objc_msgSend(v18, "insertAttachmentIfInBlankSpace:");

        if ((v20 & 1) == 0)
          goto LABEL_9;
      }
    }
  }
  v21 = 0;
LABEL_10:

  return v21;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  PKTiledGestureView *v12;
  PKTiledGestureView *v13;
  BOOL v14;
  PKTiledGestureView *v15;
  PKTiledGestureView *v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  void *v25;
  char v26;
  _BOOL4 v27;
  PKTiledGestureView *v28;
  PKTiledGestureView *v29;
  PKTiledGestureView *v30;
  PKTiledGestureView *v31;
  PKTiledGestureView *v32;
  PKTiledGestureView *v33;
  PKTiledGestureView *v34;
  PKTiledGestureView *v35;
  PKTiledGestureView *v36;
  id v37;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "_hidEvent"))
  {
    v9 = objc_msgSend(v8, "PK_isEventFromPencil");
    v10 = objc_msgSend(v8, "type");
    v11 = v10 == 11;
    -[PKTiledGestureView hitTestUpdateEffects_point:isStylus:isHover:](self, "hitTestUpdateEffects_point:isStylus:isHover:", v9, v11, x, y);
    -[PKTiledGestureView _recordDrawingStatisticsForHitPoint:withEvent:](self, "_recordDrawingStatisticsForHitPoint:withEvent:", v8, x, y);
    if (-[PKTiledGestureView hitTestHandwritingInk_point:isStylus:isHover:](self, "hitTestHandwritingInk_point:isStylus:isHover:", v9, v11, x, y)|| -[PKTiledGestureView hitTestHandleScrolling_point:isStylus:isHover:](self, "hitTestHandleScrolling_point:isStylus:isHover:", v9, v10 == 11, x, y))
    {
      v12 = 0;
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v37 = 0;
    v14 = -[PKTiledGestureView hitTestSelectionView_point:withEvent:hit:](self, "hitTestSelectionView_point:withEvent:hit:", v8, &v37, x, y);
    v15 = (PKTiledGestureView *)v37;
    v16 = v15;
    if (v14)
      goto LABEL_14;
    v36 = v15;
    v17 = -[PKTiledGestureView hitTestDragEvent_point:withEvent:hit:](self, "hitTestDragEvent_point:withEvent:hit:", v8, &v36, x, y);
    v13 = v36;

    if (!v17)
    {
      v35 = v13;
      v18 = -[PKTiledGestureView hitTestAttachmentChrome_point:isStylus:withEvent:hit:](self, "hitTestAttachmentChrome_point:isStylus:withEvent:hit:", v9, v8, &v35, x, y);
      v16 = v35;

      if (v18)
        goto LABEL_14;
      v34 = v16;
      v19 = -[PKTiledGestureView hitTestDataDetector_point:isStylus:withEvent:hit:](self, "hitTestDataDetector_point:isStylus:withEvent:hit:", v9, v8, &v34, x, y);
      v13 = v34;

      if (v19)
        goto LABEL_16;
      v33 = v13;
      v20 = -[PKTiledGestureView hitTestSelectionGestures_point:isStylus:isHover:withEvent:hit:](self, "hitTestSelectionGestures_point:isStylus:isHover:withEvent:hit:", v9, v10 == 11, v8, &v33, x, y);
      v16 = v33;

      if (v20)
      {
LABEL_14:
        v13 = v16;
LABEL_17:
        v12 = v16;
        goto LABEL_18;
      }
      v32 = v16;
      v21 = -[PKTiledGestureView hitTestDelegateSelection_point:isHover:withEvent:hit:](self, "hitTestDelegateSelection_point:isHover:withEvent:hit:", v10 == 11, v8, &v32, x, y);
      v13 = v32;

      if (!v21)
      {
        v31 = v13;
        v22 = -[PKTiledGestureView hitTestClearSelectionIfItExists_point:isHover:withEvent:hit:](self, "hitTestClearSelectionIfItExists_point:isHover:withEvent:hit:", v10 == 11, v8, &v31, x, y);
        v16 = v31;

        if (v22)
          goto LABEL_14;
        v30 = v16;
        v23 = -[PKTiledGestureView hitTestPencilStickiness_point:isStylus:isHover:withEvent:hit:](self, "hitTestPencilStickiness_point:isStylus:isHover:withEvent:hit:", v9, v10 == 11, v8, &v30, x, y);
        v13 = v30;

        if (!v23)
        {
          -[PKTiledGestureView tiledView](self, "tiledView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isReadOnlyView");

          if ((v26 & 1) != 0)
          {
            v12 = 0;
            goto LABEL_18;
          }
          v29 = v13;
          v27 = -[PKTiledGestureView hitTestInsertNewAttachments_point:isStylus:isHover:withEvent:hit:](self, "hitTestInsertNewAttachments_point:isStylus:isHover:withEvent:hit:", v9, v10 == 11, v8, &v29, x, y);
          v28 = v29;

          if (v27)
            v16 = v28;
          else
            v16 = self;
          v13 = v28;
          goto LABEL_17;
        }
      }
    }
LABEL_16:
    v16 = v13;
    goto LABEL_17;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (void)_recordDrawingStatisticsForHitPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  y = a3.y;
  x = a3.x;
  v14 = a4;
  if (objc_msgSend(v14, "PK_isEventFromPencil"))
  {
    -[PKTiledGestureView tiledView](self, "tiledView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", 1, 0, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTiledGestureView ink](self, "ink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_isHandwritingInk");

    if (v10 && v8)
    {
      -[PKTiledGestureView drawingPaletteStatistics](self, "drawingPaletteStatistics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timestamp");
      objc_msgSend(v11, "recordHandwritingToolUsedOverDrawingAttachmentWithTimestamp:");
LABEL_8:

      goto LABEL_9;
    }
    -[PKTiledGestureView ink](self, "ink");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "_isStrokeGeneratingInk");

    if (v13 && !v8)
    {
      -[PKTiledGestureView drawingPaletteStatistics](self, "drawingPaletteStatistics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timestamp");
      objc_msgSend(v11, "recordInkingToolUsedOverNonDrawingAttachmentWithTimestamp:");
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (PKTiledView)tiledView
{
  return (PKTiledView *)objc_loadWeakRetained((id *)&self->_tiledView);
}

- (void)setTiledView:(id)a3
{
  objc_storeWeak((id *)&self->_tiledView, a3);
}

- (PKDrawingPaletteStatistics)drawingPaletteStatistics
{
  return self->_drawingPaletteStatistics;
}

- (void)setDrawingPaletteStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_drawingPaletteStatistics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingPaletteStatistics, 0);
  objc_destroyWeak((id *)&self->_tiledView);
}

@end
