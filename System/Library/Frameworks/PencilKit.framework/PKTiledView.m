@implementation PKTiledView

- (BOOL)allowsFingerDrawing
{
  PKTiledViewDelegate *delegate;
  char v4;
  uint64_t (**v5)(_QWORD);
  void *v6;
  _QWORD aBlock[5];

  delegate = self->_delegate;
  if (delegate == (PKTiledViewDelegate *)2)
    return 0;
  if (delegate == (PKTiledViewDelegate *)1)
    return 1;
  if (delegate || (objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersPencilOnlyDrawing") & 1) != 0)
    return 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__PKTiledView_allowsFingerDrawing__block_invoke;
  aBlock[3] = &unk_1E7777A48;
  aBlock[4] = self;
  v5 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  -[PKTiledView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PKToolPicker isActiveToolPickerVisibleForWindow:](PKToolPicker, "isActiveToolPickerVisibleForWindow:", v6))
  {
    v4 = 1;
  }
  else
  {
    v4 = v5[2](v5);
  }

  return v4;
}

uint64_t __34__PKTiledView_allowsFingerDrawing__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_paletteViewVisible");

  return v4;
}

- (id)attachments
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double timestampForLatestUserInteraction;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = (*(_BYTE *)&self->_tiledViewFlags & 4) == 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKTiledView attachmentContainerView](self, "attachmentContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView _addAttachmentsUnderView:toArray:](self, "_addAttachmentsUnderView:toArray:", v5, v4);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v7);
          PKProtocolCast(&unk_1EF58B460, *(void **)(*((_QWORD *)&v31 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v6, "addObject:", v11);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v8);
    }

    timestampForLatestUserInteraction = self->_timestampForLatestUserInteraction;
    if (timestampForLatestUserInteraction != 0.0)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = *(id *)&timestampForLatestUserInteraction;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
            if (objc_msgSend(v17, "isExternalAttachment", (_QWORD)v27))
              objc_msgSend(v6, "addObject:", v17);
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
        }
        while (v14);
      }

    }
    v18 = objc_msgSend(v6, "copy", (_QWORD)v27);
  }
  else
  {
    -[PKTiledView delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tiledViewAttachmentViews");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = v20;
    v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v36 != v22)
            objc_enumerationMutation(v6);
          PKProtocolCast(&unk_1EF58B460, *(void **)(*((_QWORD *)&v35 + 1) + 8 * k));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(v4, "addObject:", v24);

        }
        v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v21);
    }

    v18 = objc_msgSend(v4, "copy");
  }
  v25 = (void *)v18;

  return v25;
}

- (UIView)attachmentContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_canvasView);
}

- (void)_addAttachmentsUnderView:(id)a3 toArray:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a3, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "tiledViewAttachmentViews");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v11);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "addObject:", v10);
          }
          else
          {
            objc_msgSend(v10, "subviews");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "count") == 0;

            if (!v13)
              -[PKTiledView _addAttachmentsUnderView:toArray:](self, "_addAttachmentsUnderView:toArray:", v10, v5);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (BOOL)_scrollViewIsScrollingOrZoomingOrResizing
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[PKTiledView _isZoomingOrResizing](self, "_isZoomingOrResizing"))
    return 1;
  -[PKTiledView scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDragging") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[PKTiledView scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isDecelerating") & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      -[PKTiledView scrollView](self, "scrollView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "_isAnimatingScroll") & 1) != 0)
      {
        v3 = 1;
      }
      else
      {
        -[PKTiledView scrollView](self, "scrollView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v7, "_isAnimatingZoom");

      }
    }

  }
  return v3;
}

- (CGRect)newViewFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[PKTiledView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;

  -[PKTiledView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  -[PKTiledView scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;

  v14 = v5;
  v15 = v7;
  v16 = v10;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_attachmentContainerView);
}

void __80__PKTiledView_initInScrollView_sixChannelBlending_defaultDrawingClass_readOnly___block_invoke_2(uint64_t a1, int a2)
{
  id **WeakRetained;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v9[0] = 67109120;
      v9[1] = a2;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Hover supported check completed: %d", (uint8_t *)v9, 8u);
    }

    if (a2)
    {
      objc_msgSend(WeakRetained, "_createHoverControllerIfNecessary");
    }
    else
    {
      *((_BYTE *)WeakRetained + 518) = 1;
      if (WeakRetained[118])
      {
        v5 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v9[0]) = 0;
          _os_log_debug_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEBUG, "Tearing down hover controller since hover isn't supported", (uint8_t *)v9, 2u);
        }

        -[PKHoverController hoverGestureRecognizer](WeakRetained[118]);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeGestureRecognizer:", v6);

        v8 = WeakRetained[118];
        WeakRetained[118] = 0;

      }
    }
  }

}

uint64_t __80__PKTiledView_initInScrollView_sixChannelBlending_defaultDrawingClass_readOnly___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 456) = 1;
  return result;
}

void __54__PKTiledView__layoutSubviewsUpdateTilesForRendering___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateAttachmentOnscreenBounds");
    v2 = (void *)v3[100];
    v3[100] = 0;

    WeakRetained = v3;
  }

}

void __43__PKTiledView__observeScrollViewDidScroll___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scrollViewDidScroll");

}

void __32__PKTiledView_showDebugOutlines__block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
  _MergedGlobals_301 = objc_msgSend(v0, "BOOLForKey:", CFSTR("PKDebugViews"));

}

uint64_t __30__PKTiledView_didMoveToWindow__block_invoke()
{
  return +[PKHoverSettings prewarmIfNecessary](PKHoverSettings, "prewarmIfNecessary");
}

- (id)visibleAttachments
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _visibleAttachments](self, "_visibleAttachments");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_opt_class();
        PKDynamicCast(v9, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10, (_QWORD)v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)updateTilesForVisibleRect
{
  if (!-[PKTiledView _isZoomingOrResizing](self, "_isZoomingOrResizing"))
    -[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:](self, "updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:", 1, 0, 0);
}

- (void)updateForAllowedDrawingInput
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSObject *v26;
  _BOOL4 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  _BOOL4 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = -[PKTiledView allowsFingerDrawing](self, "allowsFingerDrawing");
  if (PKIsVisionDevice())
  {
    -[PKTiledView _updateRemoteEffect](self, "_updateRemoteEffect");
    if (-[PKTiledView _isVirtualDevice](self, "_isVirtualDevice"))
      goto LABEL_12;
    -[PKTiledView drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowedTouchTypes:", &unk_1E77EC8E0);

    -[PKTiledView scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "panGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinimumNumberOfTouches:", 1);

    -[PKTiledView scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "panGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowedTouchTypes:", &unk_1E77EC8F8);
  }
  else
  {
    if (v3)
      v9 = &unk_1E77EC910;
    else
      v9 = &unk_1E77EC928;
    -[PKTiledView drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowedTouchTypes:", v9);

    -[PKTiledView scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "panGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v3)
      v12 = 2;
    else
      v12 = 1;
    objc_msgSend(v11, "setMinimumNumberOfTouches:", v12);
  }

LABEL_12:
  -[PKTiledView drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allowedTouchTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView generationToolGestureRecognizer](self, "generationToolGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowedTouchTypes:", v14);

  -[PKTiledView drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allowedTouchTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView simultaneousDrawingGestureRecognizer](self, "simultaneousDrawingGestureRecognizer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowedTouchTypes:", v17);

  -[PKTiledView selectionController](self, "selectionController");
  v19 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController selectionInteraction](v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView ink](self, "ink");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_updateAllowedTouchTypesForSelectedInk:", v21);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "fingerDrawingEnabledDidChange");
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v23);
  }

  v26 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = -[PKTiledView allowsFingerDrawing](self, "allowsFingerDrawing");
    *(_DWORD *)buf = 67109120;
    v33 = v27;
    _os_log_impl(&dword_1BE213000, v26, OS_LOG_TYPE_INFO, "Update allows finger drawing: %{BOOL}d", buf, 8u);
  }

}

- (BOOL)sixChannelBlending
{
  return self->_shouldHideCanvasAfterScroll;
}

- (BOOL)showDebugOutlines
{
  return self->_isLayingOut;
}

- (void)set_maxFileFormatVersion:(int64_t)a3
{
  self->_editMenuInteraction = (UIEditMenuInteraction *)a3;
}

- (void)setSupportsCopyAsText:(BOOL)a3
{
  self->_hoverPreviewActive = a3;
}

- (void)setInsertSpaceEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKTiledView selectionController](self, "selectionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController setInsertSpaceEnabled:]((uint64_t)v4, v3);

}

- (void)setDrawingUndoTarget:(id)a3
{
  objc_storeWeak((id *)&self->_drawingUndoSelector, a3);
}

- (void)setDrawingUndoSelector:(SEL)a3
{
  self->_selectionController = (PKSelectionController *)a3;
}

- (void)setCurrentDrawingBeingCopiedToCanvas:(id *)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    objc_storeWeak(a1 + 93, v3);
    objc_msgSend(a1, "canvasView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrentDrawingBeingCopiedToCanvas:", v5);

    v3 = v5;
  }

}

- (void)setCanvasViewZOrderPolicy:(int64_t)a3
{
  void *drawingPolicy;
  unint64_t v5;
  id v6;

  self->_contentSnapshottingView = (UIView *)a3;
  drawingPolicy = (void *)self->_drawingPolicy;
  if (drawingPolicy)
  {
    objc_msgSend(drawingPolicy, "removeFromSuperview");
    v5 = self->_drawingPolicy;
    -[PKTiledView scrollView](self, "scrollView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PKTiledView insertCanvasView:intoScrollView:](self, "insertCanvasView:intoScrollView:", v5);

  }
}

- (void)setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_drawingPolicy, a3);
}

- (void)setAttachmentContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_canvasView, a3);
}

- (PKSelectionInteraction)selectionInteraction
{
  return (PKSelectionInteraction *)-[PKSelectionController selectionInteraction]((id *)&self->_tileController->super.isa);
}

- (PKSelectionController)selectionController
{
  return (PKSelectionController *)self->_tileController;
}

- (id)rulerHostingView
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  PKTiledView *v8;

  -[PKTiledView rulerHostingDelegate](self, "rulerHostingDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[PKTiledView rulerHostingDelegate](self, "rulerHostingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || (-[PKTiledView rulerHostingDelegate](self, "rulerHostingDelegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "rulerHostingView"),
        v8 = (PKTiledView *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
LABEL_4:
    v8 = self;
  }
  return v8;
}

- (PKRulerHostingDelegate)rulerHostingDelegate
{
  return (PKRulerHostingDelegate *)objc_loadWeakRetained((id *)&self->_tileSize);
}

- (void)resizeTiles:(id)a3 completion:(id)a4
{
  void (**v6)(id, BOOL);
  UITouch *drawingTouchThatHitNothing;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  _BOOL4 v25;
  PKTiledGestureView *gestureView;
  PKTiledView *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  PKTiledGestureView *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v6 = (void (**)(id, BOOL))a4;
  drawingTouchThatHitNothing = self->_drawingTouchThatHitNothing;
  if (!drawingTouchThatHitNothing
    || self->_disableTileRendering
    || -[PKTiledView isSystemSnapshotting](self))
  {
    if (v6)
      v6[2](v6, drawingTouchThatHitNothing == 0);
  }
  else
  {
    v27 = self;
    v8 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      gestureView = self->_gestureView;
      *(_DWORD *)buf = 134217984;
      v40 = gestureView;
      _os_log_debug_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEBUG, "New tile level: %ld", buf, 0xCu);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = v28;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v13, "tiles", v27);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectEnumerator");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v30;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v30 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
                if (v19)
                  *(_BYTE *)(v19 + 83) = 1;
              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v16);
          }

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v10);
    }

    if (v27->_tileScale <= 0.0
      || (-[PKTiledView frame](v27, "frame"), v21 == 0.0)
      || v20 == 0.0
      || (-[PKTiledView _layerContentsScale](v27, "_layerContentsScale"), v22 <= 0.0)
      || (-[PKTiledView scrollView](v27, "scrollView"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "zoomScale"),
          v25 = v24 > 0.0,
          v23,
          !v25))
    {
      if (v6)
        v6[2](v6, 0);
    }
    else
    {
      -[PKTiledView blitOldTilesIntoNewTiles:completion:](v27, "blitOldTilesIntoNewTiles:completion:", v9, v6);
    }
  }

}

- (void)purgeNonVisibleTiles
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;

  v53 = *MEMORY[0x1E0C80C00];
  if ((!self || !self->_didDisableScrollViewPanGestureRecognizer)
    && !-[PKTiledView _isZoomingOrResizing](self, "_isZoomingOrResizing"))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "systemUptime");
    v4 = v3;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[PKTiledView attachmentViews](self, "attachmentViews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (!v5)
      goto LABEL_41;
    v36 = *(_QWORD *)v47;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v7, "viewRep");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isHidden");

        if (!v9)
        {
          -[PKTiledView bounds](self, "bounds");
          v55 = CGRectInset(v54, -v54.size.width, -v54.size.height);
          -[PKTiledView _tilesForAttachment:bounds:invert:](self, "_tilesForAttachment:bounds:invert:", v7, 1, v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v11 = v23;
          v24 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          if (!v24)
            goto LABEL_38;
          v25 = *(_QWORD *)v39;
          while (1)
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v39 != v25)
                objc_enumerationMutation(v11);
              v27 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v26);
              if (v27)
              {
                if (*(_BYTE *)(v27 + 84))
                  goto LABEL_34;
                *(double *)&v28 = COERCE_DOUBLE(atomic_load((unint64_t *)(v27 + 24)));
                v29 = *(double *)&v28;
              }
              else
              {
                v29 = 0.0;
              }
              if (v4 - v29 >= 0.1)
              {
                -[PKRendererTile purgeTileLayers](*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v26));
                objc_msgSend(v7, "purgedTiles");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKRendererTile properties]((PKRendererTileProperties *)v27);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setObject:forKeyedSubscript:", v27, v31);

                objc_msgSend(v7, "tiles");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKRendererTile properties]((PKRendererTileProperties *)v27);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "removeObjectForKey:", v33);

              }
LABEL_34:
              ++v26;
            }
            while (v24 != v26);
            v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
            v24 = v34;
            if (!v34)
            {
LABEL_38:

              goto LABEL_39;
            }
          }
        }
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v7, "tiles");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allValues");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v43;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v43 != v13)
                objc_enumerationMutation(v11);
              v15 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v14);
              if (v15)
              {
                *(double *)&v16 = COERCE_DOUBLE(atomic_load((unint64_t *)(v15 + 24)));
                v17 = *(double *)&v16;
              }
              else
              {
                v17 = 0.0;
              }
              if (v4 - v17 >= 0.1)
              {
                -[PKRendererTile purgeTileLayers](*(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v14));
                objc_msgSend(v7, "purgedTiles");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKRendererTile properties]((PKRendererTileProperties *)v15);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v19);

                objc_msgSend(v7, "tiles");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKRendererTile properties]((PKRendererTileProperties *)v15);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "removeObjectForKey:", v21);

              }
              ++v14;
            }
            while (v12 != v14);
            v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
            v12 = v22;
          }
          while (v22);
        }
LABEL_39:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (!v5)
      {
LABEL_41:

        return;
      }
    }
  }
}

- (UIImage)paperTexture
{
  void *v2;
  void *v3;

  -[PKTiledView canvasView](self, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paperTexture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)newCanvasView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  PKTiledCanvasView *v20;

  -[PKTiledView scrollView](self, "scrollView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v20 = -[PKTiledCanvasView initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:]([PKTiledCanvasView alloc], "initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:", 0, 0, -[PKTiledView _sixChannelBlendingIsActive](self, "_sixChannelBlendingIsActive"), v4, v6, fmax(v8, 1.0), fmax(v10, 1.0));
  v11 = objc_alloc_init(-[PKTiledView defaultDrawingClass](self, "defaultDrawingClass"));
  -[PKTiledCanvasView setDrawing:](v20, "setDrawing:", v11);

  -[PKTiledCanvasView setSelectionController:](v20, "setSelectionController:", self->_tileController);
  -[PKTiledCanvasView setRulerController:](v20, "setRulerController:", self->_hoverController);
  -[PKTiledCanvasView setHidden:](v20, "setHidden:", 1);
  if (qword_1EF55D0C8 != -1)
    dispatch_once(&qword_1EF55D0C8, &__block_literal_global_1285);
  if (objc_retainAutorelease((id)qword_1EF55D0D0))
  {
    -[PKTiledView scrollView](self, "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      -[PKTiledCanvasView setIsPDFCanvasForAnalytics:](v20, "setIsPDFCanvasForAnalytics:", 1);
  }
  if (-[PKTiledView showDebugOutlines](self, "showDebugOutlines"))
  {
    -[PKTiledCanvasView layer](v20, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderWidth:", 2.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "CGColor");
    -[PKTiledCanvasView layer](v20, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBorderColor:", v16);

  }
  -[PKTiledView setDrawingUndoTarget:](self, "setDrawingUndoTarget:", self);
  -[PKTiledView setDrawingUndoSelector:](self, "setDrawingUndoSelector:", sel_performUndo_);
  -[PKTiledCanvasView setDelegate:](v20, "setDelegate:", self);
  -[PKTiledCanvasView setUserInteractionEnabled:](v20, "setUserInteractionEnabled:", 0);
  -[PKTiledView setCanvasView:](self, "setCanvasView:", v20);
  -[PKTiledView setupGestures](self, "setupGestures");
  -[PKTiledView scrollView](self, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView insertCanvasView:intoScrollView:](self, "insertCanvasView:intoScrollView:", v20, v18);

}

- (BOOL)needToUpdateViewFrame
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;

  if (!self)
    return 1;
  if (self->_tileScale == 0.0)
    return 1;
  -[PKTiledView frame](self, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PKTiledView newViewFrame](self, "newViewFrame");
  v17.origin.x = v12;
  v17.origin.y = v13;
  v17.size.width = v14;
  v17.size.height = v15;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  return !CGRectEqualToRect(v16, v17);
}

- (void)layoutSubviews
{
  int v3;
  UITouch *drawingTouchThatHitNothing;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKTiledView;
  -[PKTiledView layoutSubviews](&v9, sel_layoutSubviews);
  if (-[PKTiledView needToUpdateViewFrame](self, "needToUpdateViewFrame"))
    -[PKTiledView _layoutSubviews](self, "_layoutSubviews");
  -[PKSelectionController _layoutViewsIfNecessary]((id *)&self->_tileController->super.isa);
  if ((-[PKTiledView isSystemSnapshotting](self) & 1) != 0)
  {
    self->_disableUndoManager = 1;
  }
  else
  {
    v3 = -[PKTiledView invertColors](self, "invertColors");
    drawingTouchThatHitNothing = self->_drawingTouchThatHitNothing;
    if (drawingTouchThatHitNothing)
    {
      LOBYTE(drawingTouchThatHitNothing[1].super.isa) = v3;
      -[PKMetalRendererController setInvertColors:]((uint64_t)drawingTouchThatHitNothing[3].super.isa, v3);
    }
    v5 = -[PKTiledView _sixChannelBlendingIsActive](self, "_sixChannelBlendingIsActive");
    -[PKTiledView canvasView](self, "canvasView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSixChannelBlending:", v5);

    v7 = -[PKTiledView drawBitmapEraserMask](self, "drawBitmapEraserMask");
    -[PKTiledView canvasView](self, "canvasView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDrawBitmapEraserMask:", v7);

  }
}

- (uint64_t)isSystemSnapshotting
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isPerformingSystemSnapshot");

  return v3;
}

- (BOOL)isDrawing
{
  void *v2;
  char v3;

  -[PKTiledView canvasView](self, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDrawing");

  return v3;
}

- (BOOL)invertColors
{
  void *v2;
  BOOL v3;

  -[PKTiledView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle") == 2;

  return v3;
}

- (void)insertCanvasView:(id)a3 intoScrollView:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[PKTiledView canvasViewZOrderPolicy](self, "canvasViewZOrderPolicy"))
    objc_msgSend(v6, "addSubview:", v7);
  else
    objc_msgSend(v6, "insertSubview:atIndex:", v7, 0);

}

- (PKInk)ink
{
  void *v2;
  void *v3;

  -[PKTiledView canvasView](self, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKInk *)v3;
}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id WeakRetained;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id *v20;
  void *v21;
  id *v22;
  void *v23;
  PKWelcomeController *v24;
  void *v25;
  PKTiledGestureView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  PKAutoRefineController *v36;
  void *v37;
  PKTiledViewAnimationController *v38;
  void *v39;
  _QWORD v41[4];
  id v42;
  id location;
  _QWORD block[4];
  id v45;
  objc_super v46;

  v8 = a4;
  v10 = a3;
  objc_msgSend(v10, "bounds");
  v46.receiver = self;
  v46.super_class = (Class)PKTiledView;
  v11 = -[PKTiledView initWithFrame:](&v46, sel_initWithFrame_);
  if (v11)
  {
    +[PKGenerationModelAvailabilityController sharedInstance](PKGenerationModelAvailabilityController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queryGenerationModelAvailabilityStatus");

    *((_QWORD *)v11 + 77) = 3;
    *((_BYTE *)v11 + 456) = !v8;
    v13 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__PKTiledView_initInScrollView_sixChannelBlending_defaultDrawingClass_readOnly___block_invoke;
      block[3] = &unk_1E7776F38;
      v45 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    objc_storeStrong((id *)v11 + 67, a5);
    *((_BYTE *)v11 + 507) = v8;
    *((_BYTE *)v11 + 506) = +[PKTiledView showDebugOutlines](PKTiledView, "showDebugOutlines");
    objc_opt_self();
    *((_QWORD *)v11 + 88) = 0x4080000000000000;
    v14 = objc_storeWeak((id *)v11 + 69, v10);
    objc_msgSend(v10, "_addScrollViewScrollObserver:", v11);

    WeakRetained = objc_loadWeakRetained((id *)v11 + 69);
    objc_msgSend(WeakRetained, "_setLayoutObserver:", v11);

    v16 = objc_loadWeakRetained((id *)v11 + 69);
    objc_msgSend(v16, "contentOffset");
    *((_QWORD *)v11 + 119) = v17;
    *((_QWORD *)v11 + 120) = v18;

    v19 = objc_loadWeakRetained((id *)v11 + 69);
    objc_storeWeak((id *)v11 + 70, v19);

    v20 = -[PKSelectionController initWithTiledView:]((id *)[PKSelectionController alloc], v11);
    v21 = (void *)*((_QWORD *)v11 + 84);
    *((_QWORD *)v11 + 84) = v20;

    v22 = -[PKRulerController initWithDelegate:]((id *)[PKRulerController alloc], v11);
    v23 = (void *)*((_QWORD *)v11 + 117);
    *((_QWORD *)v11 + 117) = v22;

    -[PKRulerController setRulerHostingDelegate:](*((_QWORD *)v11 + 117), v11);
    *((_BYTE *)v11 + 510) = 1;
    v24 = -[PKWelcomeController initWithTiledView:]([PKWelcomeController alloc], "initWithTiledView:", v11);
    v25 = (void *)*((_QWORD *)v11 + 78);
    *((_QWORD *)v11 + 78) = v24;

    v26 = objc_alloc_init(PKTiledGestureView);
    v27 = (void *)*((_QWORD *)v11 + 91);
    *((_QWORD *)v11 + 91) = v26;

    objc_msgSend(*((id *)v11 + 91), "setTiledView:", v11);
    objc_msgSend(v11, "addSubview:", *((_QWORD *)v11 + 91));
    if (!a6)
      objc_msgSend(v11, "newCanvasView");
    objc_msgSend(v10, "addSubview:", v11);
    objc_msgSend(v11, "set_maxFileFormatVersion:", +[PKDrawing _currentSerializationVersion](PKDrawingConcrete, "_currentSerializationVersion"));
    *((_BYTE *)v11 + 504) = 1;
    *((_QWORD *)v11 + 72) = dyld_program_sdk_at_least() ^ 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v11, sel__updateForToolPickerVisibilityChange_, CFSTR("PKToolPickerWillShowNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v11, sel__updateForToolPickerVisibilityChange_, CFSTR("PKToolPickerDidShowNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v11, sel__updateForToolPickerVisibilityChange_, CFSTR("PKToolPickerDidHideNotification"), 0);

    objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", v11, CFSTR("prefersPencilOnlyDrawing"), 0, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v11, sel__handlePencilSqueezeInteractionDidChangePaletteViewVisibilityNotification_, CFSTR("PKPencilSqueezeInteractionDidChangePaletteViewVisibilityNotification"), 0);

    objc_msgSend(v11, "updateForAllowedDrawingInput");
    objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("com.apple.pencilkit.tiledView"));
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", v11);
    v33 = (void *)*((_QWORD *)v11 + 52);
    *((_QWORD *)v11 + 52) = v32;

    objc_msgSend(v10, "addInteraction:", *((_QWORD *)v11 + 52));
    objc_initWeak(&location, v11);
    v41[0] = v13;
    v41[1] = 3221225472;
    v41[2] = __80__PKTiledView_initInScrollView_sixChannelBlending_defaultDrawingClass_readOnly___block_invoke_2;
    v41[3] = &unk_1E7777A98;
    objc_copyWeak(&v42, &location);
    +[PKHoverSettings checkIfHoverIsSupported:](PKHoverSettings, "checkIfHoverIsSupported:", v41);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", v11);
    v35 = (void *)*((_QWORD *)v11 + 116);
    *((_QWORD *)v11 + 116) = v34;

    objc_msgSend(v11, "addInteraction:", *((_QWORD *)v11 + 116));
    *((_BYTE *)v11 + 526) = 0;
    *((_BYTE *)v11 + 509) = 1;
    *((_BYTE *)v11 + 472) = 1;
    v36 = objc_alloc_init(PKAutoRefineController);
    v37 = (void *)*((_QWORD *)v11 + 60);
    *((_QWORD *)v11 + 60) = v36;

    v38 = -[PKTiledViewAnimationController initWithTiledView:]([PKTiledViewAnimationController alloc], "initWithTiledView:", v11);
    v39 = (void *)*((_QWORD *)v11 + 66);
    *((_QWORD *)v11 + 66) = v38;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5
{
  return -[PKTiledView initInScrollView:sixChannelBlending:defaultDrawingClass:readOnly:](self, "initInScrollView:sixChannelBlending:defaultDrawingClass:readOnly:", a3, a4, a5, 0);
}

- (vector<AttachmentTileInfo,)getVisibleTiles:(PKTiledView *)self
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  AttachmentTileInfo *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double MaxX;
  double v39;
  double MaxY;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  AttachmentTileInfo *var0;
  AttachmentTileInfo *v53;
  AttachmentTileInfo *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  __int128 v63;
  AttachmentTileInfo *var1;
  void *v65;
  uint64_t v66;
  vector<AttachmentTileInfo, std::allocator<AttachmentTileInfo>> *result;
  id v68;
  double v69;
  double v70;
  double v71;
  double v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  _BYTE v83[128];
  uint64_t v84;
  CGRect v85;
  CGRect v86;

  v84 = *MEMORY[0x1E0C80C00];
  v68 = a4;
  -[PKTiledView scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v71 = v8;
  v72 = v7;
  v69 = v10;
  v70 = v9;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v68;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
  if (v11)
  {
    v12 = 0;
    v74 = *(_QWORD *)v79;
    do
    {
      v13 = 0;
      v75 = v11;
      do
      {
        if (*(_QWORD *)v79 != v74)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v13);
        objc_msgSend(v14, "viewRep");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        v77 = v13;
        if (v16 <= 1.0)
          goto LABEL_11;
        objc_msgSend(v14, "viewRep");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "frame");
        if (fabs(v21) == INFINITY || (v22 = fabs(v18), v22 >= INFINITY) && v22 <= INFINITY)
        {

LABEL_11:
          goto LABEL_12;
        }
        v23 = fabs(v19);
        v24 = v23 > INFINITY || v23 < INFINITY;
        v25 = fabs(v20);
        v26 = v25 > INFINITY || v25 < INFINITY;

        if (v24 && v26)
        {
          objc_msgSend(v14, "tileContainerView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTiledView scrollView](self, "scrollView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "convertRect:fromView:", v28, v72, v71, v70, v69);
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v36 = v35;

          v37 = self ? self->_tileScale : 0.0;
          v85.origin.x = v30;
          v85.origin.y = v32;
          v85.size.width = v34;
          v85.size.height = v36;
          MaxX = CGRectGetMaxX(v85);
          v39 = self ? self->_tileScale : 0.0;
          v86.origin.x = v30;
          v86.origin.y = v32;
          v86.size.width = v34;
          v86.size.height = v36;
          MaxY = CGRectGetMaxY(v86);
          v41 = self ? self->_tileScale : 0.0;
          v42 = v30 / v37 + -1.0;
          v43 = MaxX / v39 + 1.0;
          v44 = (double)(uint64_t)v42;
          if (v43 >= v44)
          {
            v45 = (uint64_t)v42;
            v76 = (uint64_t)(v32 / v37 + -1.0);
            v46 = MaxY / v41 + 1.0;
            do
            {
              if (v46 >= (double)v76)
              {
                v47 = (double)v76;
                v48 = v76;
                do
                {
                  v82 = 0;
                  if (-[PKTiledView tileIsVisibleForOffset:inAttachment:distanceToMiddle:](self, "tileIsVisibleForOffset:inAttachment:distanceToMiddle:", v14, &v82, v44, v47))
                  {
                    v49 = v14;
                    v50 = v49;
                    v51 = v82;
                    var0 = retstr->var2.var0;
                    if (v12 >= var0)
                    {
                      v54 = retstr->var0;
                      v55 = (v12 - retstr->var0) >> 5;
                      v56 = v55 + 1;
                      if ((unint64_t)(v55 + 1) >> 59)
                        std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                      v57 = var0 - v54;
                      if (v57 >> 4 > v56)
                        v56 = v57 >> 4;
                      if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFE0)
                        v58 = 0x7FFFFFFFFFFFFFFLL;
                      else
                        v58 = v56;
                      if (v58)
                      {
                        if (v58 >> 59)
                          std::__throw_bad_array_new_length[abi:ne180100]();
                        v59 = (char *)operator new(32 * v58);
                      }
                      else
                      {
                        v59 = 0;
                      }
                      v60 = &v59[32 * v55];
                      *(_QWORD *)v60 = v50;
                      *((double *)v60 + 1) = v44;
                      *((double *)v60 + 2) = v47;
                      *((_QWORD *)v60 + 3) = v51;
                      if (v12 == v54)
                      {
                        v53 = (AttachmentTileInfo *)(v60 + 32);
                        retstr->var0 = (AttachmentTileInfo *)v60;
                        retstr->var1 = (AttachmentTileInfo *)(v60 + 32);
                        retstr->var2.var0 = (AttachmentTileInfo *)&v59[32 * v58];
                      }
                      else
                      {
                        v61 = &v59[32 * v55];
                        do
                        {
                          v62 = *((_QWORD *)v12 - 4);
                          v12 = (AttachmentTileInfo *)((char *)v12 - 32);
                          *(_QWORD *)v12 = 0;
                          *((_QWORD *)v61 - 4) = v62;
                          v61 -= 32;
                          v63 = *(_OWORD *)((char *)v12 + 8);
                          *((_QWORD *)v61 + 3) = *((_QWORD *)v12 + 3);
                          *(_OWORD *)(v61 + 8) = v63;
                        }
                        while (v12 != v54);
                        v12 = retstr->var0;
                        var1 = retstr->var1;
                        v53 = (AttachmentTileInfo *)(v60 + 32);
                        retstr->var0 = (AttachmentTileInfo *)v61;
                        retstr->var1 = (AttachmentTileInfo *)(v60 + 32);
                        retstr->var2.var0 = (AttachmentTileInfo *)&v59[32 * v58];
                        while (var1 != v12)
                        {
                          v65 = (void *)*((_QWORD *)var1 - 4);
                          var1 = (AttachmentTileInfo *)((char *)var1 - 32);

                        }
                      }
                      if (v12)
                        operator delete(v12);
                    }
                    else
                    {
                      *(_QWORD *)v12 = v49;
                      *((double *)v12 + 1) = v44;
                      *((double *)v12 + 2) = v47;
                      v53 = (AttachmentTileInfo *)((char *)v12 + 32);
                      *((_QWORD *)v12 + 3) = v51;
                    }
                    retstr->var1 = v53;
                    v12 = v53;
                  }
                  v47 = (double)++v48;
                }
                while (v46 >= (double)v48);
              }
              v44 = (double)++v45;
            }
            while (v43 >= (double)v45);
          }
        }
LABEL_12:
        v13 = v77 + 1;
      }
      while (v77 + 1 != v75);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
      v11 = v66;
    }
    while (v66);
  }

  return result;
}

- (id)drawingGestureRecognizer
{
  void *v2;
  void *v3;

  -[PKTiledView canvasView](self, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawingGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)drawBitmapEraserMask
{
  return self->_isDoingInteractiveResize;
}

- (BOOL)disableTileRendering
{
  return BYTE4(self->_refineAnimationController);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKTiledView;
  -[PKTiledView didMoveToWindow](&v13, sel_didMoveToWindow);
  -[PKTiledView updateForAllowedDrawingInput](self, "updateForAllowedDrawingInput");
  -[PKTiledView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__sceneDidActivate_, *MEMORY[0x1E0DC5308], v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__sceneWillDeactivate_, *MEMORY[0x1E0DC5330], v10);

    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_1);
  }
  else
  {
    -[PKTiledView _endAnalyticsSessionsIfNecessary](self, "_endAnalyticsSessionsIfNecessary");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5308], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5330], 0);

  }
}

- (Class)defaultDrawingClass
{
  return (Class)self->_linedPaper;
}

- (UICoordinateSpace)contentCoordinateSpace
{
  return (UICoordinateSpace *)self->_maximumSupportedContentVersion;
}

- (double)canvasZoomScale
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v9;
  double v10;

  -[PKTiledView contentCoordinateSpace](self, "contentCoordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKTiledView contentCoordinateSpaceTransform](self, "contentCoordinateSpaceTransform");
    return sqrt(v10 * v10 + v9 * v9);
  }
  else
  {
    -[PKTiledView scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PKTiledView scrollView](self, "scrollView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "zoomScale");
      v4 = v7;

    }
    else
    {
      return 1.0;
    }
  }
  return v4;
}

- (PKTiledCanvasView)canvasView
{
  return (PKTiledCanvasView *)(id)self->_drawingPolicy;
}

- (int64_t)canvasViewZOrderPolicy
{
  return (int64_t)self->_contentSnapshottingView;
}

- (id)attachmentForUUID:(id)a3
{
  void *v3;
  id v4;

  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)_updateAttachmentOnscreenBounds
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKTiledView attachments](self, "attachments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "drawing");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTiledView visibleOnscreenBoundsForDrawing:](self, "visibleOnscreenBoundsForDrawing:", v8);
        objc_msgSend(v7, "visibleOnscreenBoundsDidChange:");

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (BOOL)_sixChannelBlendingIsActive
{
  _BOOL4 v3;

  v3 = -[PKTiledView sixChannelBlending](self, "sixChannelBlending");
  if (v3)
    LOBYTE(v3) = !-[PKTiledView invertColors](self, "invertColors");
  return v3;
}

- (void)_scrollViewDidScroll
{
  void *v3;
  id v4;

  if (!self->_hideCanvasBlock)
    -[PKTiledView _updateAttachmentOnscreenBounds](self, "_updateAttachmentOnscreenBounds");
  -[PKTiledView purgeNonVisibleTiles](self, "purgeNonVisibleTiles");
  if (self->_aggd_didMergeWithCollaborator)
    -[PKTiledView _hideCanvas](self, "_hideCanvas");
  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTiledView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  objc_msgSend(v4, "logScrollEventWithContentOffset:");

}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;

  if (-[PKTiledView needToUpdateViewFrame](self, "needToUpdateViewFrame", a3))
  {
    -[PKTiledView _endHoverToolPreview](self, "_endHoverToolPreview");
    -[PKTiledView newViewFrame](self, "newViewFrame");
    v28 = v4;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PKTiledView frame](self, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[PKTiledView window](self, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "windowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "screen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "nativeScale");
    v23 = v22;

    if (v23 <= 1.0)
      v24 = 1.0;
    else
      v24 = 1.0 / v23;
    if (-[PKTiledView isDrawing](self, "isDrawing")
      && (v8 != v16 || v10 != v18 || sqrt((v6 - v14) * (v6 - v14) + (v28 - v12) * (v28 - v12)) >= v24))
    {
      -[PKTiledView canvasView](self, "canvasView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "drawingGestureRecognizer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "cancel");

    }
    -[PKTiledView canvasView](self, "canvasView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_finishCombiningStrokesIfNecessary");

    -[PKTiledView _layoutSubviews](self, "_layoutSubviews");
    -[PKSelectionController _layoutViewsIfNecessary]((id *)&self->_tileController->super.isa);
  }
}

- (void)_sceneDidActivate:(id)a3
{
  if (self)
  {
    if (self->_disableUndoManager)
    {
      self->_disableUndoManager = 0;
      -[PKTiledView updateAfterTraitCollectionChange](self, "updateAfterTraitCollectionChange", a3);
      -[PKTiledView updateTilesForVisibleRect](self, "updateTilesForVisibleRect");
    }
  }
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  PKTileController *tileController;
  double y;
  double a;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id updateAttachmentBoundsBlock;
  dispatch_block_t v19;
  id v20;
  dispatch_time_t v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  NSArray *cachedAdditionalStrokes;
  void *v26;
  double v27;
  BOOL v28;
  void *v29;
  NSArray *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  PKTileController **p_tileController;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD block[4];
  id v41;
  id location;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  tileController = self->_tileController;
  y = self->_lastContentOffset.y;
  a = self->_strokeTransformAtStartOfStroke.a;
  -[PKTiledView scrollView](self, "scrollView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  -[PKSelectionController didScroll:]((id *)&tileController->super.isa, y - v8, a - v9);

  -[PKTiledView setNeedsLayout](self, "setNeedsLayout");
  -[PKTiledView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentOffset");
  v12 = v11;
  v14 = v13;
  v15 = self->_lastContentOffset.y;
  v16 = self->_strokeTransformAtStartOfStroke.a;

  if (v12 != v15 || v14 != v16)
  {
    updateAttachmentBoundsBlock = self->_updateAttachmentBoundsBlock;
    if (updateAttachmentBoundsBlock)
      dispatch_block_cancel(updateAttachmentBoundsBlock);
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PKTiledView__observeScrollViewDidScroll___block_invoke;
    block[3] = &unk_1E7777B30;
    objc_copyWeak(&v41, &location);
    v19 = dispatch_block_create((dispatch_block_flags_t)0, block);
    v20 = self->_updateAttachmentBoundsBlock;
    self->_updateAttachmentBoundsBlock = v19;

    self->_aggd_didMergeWithCollaborator = 1;
    v21 = dispatch_time(0, 100000000);
    dispatch_after(v21, MEMORY[0x1E0C80D38], self->_updateAttachmentBoundsBlock);
    -[PKTiledView scrollView](self, "scrollView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contentOffset");
    self->_lastContentOffset.y = v23;
    self->_strokeTransformAtStartOfStroke.a = v24;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  cachedAdditionalStrokes = self->_cachedAdditionalStrokes;
  -[PKTiledView scrollView](self, "scrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "zoomScale");
  v28 = vabdd_f64(*(double *)&cachedAdditionalStrokes, v27) < 0.00999999978;

  if (!v28)
  {
    -[PKTiledView scrollView](self, "scrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "zoomScale");
    self->_cachedAdditionalStrokes = v30;

  }
  -[PKTiledView updateTilesForVisibleRect](self, "updateTilesForVisibleRect");
  if (-[PKTiledView _scrollViewIsScrollingOrZoomingOrResizing](self, "_scrollViewIsScrollingOrZoomingOrResizing")
    || !self->_updateAttachmentBoundsBlock)
  {
    -[PKTiledView purgeNonVisibleTiles](self, "purgeNonVisibleTiles");
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v37;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v34++), "containingScrollViewDidScroll");
      }
      while (v32 != v34);
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v32);
  }

  p_tileController = &self->_tileController;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", *p_tileController);
  -[PKTileController performSelector:withObject:afterDelay:](*p_tileController, "performSelector:withObject:afterDelay:", sel_didEndScroll, 0, 0.3);
}

- (void)_layoutSubviews
{
  -[PKTiledView _layoutSubviewsUpdateTilesForRendering:](self, "_layoutSubviewsUpdateTilesForRendering:", 1);
}

- (void)_layoutSubviewsUpdateTilesForRendering:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  id updateVisibleTilesAfterZoomOutBlock;
  dispatch_block_t v8;
  id *p_updateVisibleTilesAfterZoomOutBlock;
  dispatch_block_t v10;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  PKAttachmentView *liveAttachment;
  void *v34;
  int64_t v35;
  int64_t v36;
  double v37;
  double tileScale;
  double v39;
  id hideCanvasBlock;
  id v41;
  dispatch_block_t v42;
  id v43;
  dispatch_time_t v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  PKTileController *tileController;
  NSMutableArray *v53;
  char v54;
  PKTileController *v55;
  void *v56;
  double v57;
  double v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  double v63;
  double v64;
  double v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  _QWORD block[4];
  id v91;
  id location;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v3 = a3;
  v96 = *MEMORY[0x1E0C80C00];
  if (self && self->_didDisableScrollViewPanGestureRecognizer)
  {
LABEL_3:
    -[PKTiledView scrollView](self, "scrollView");
    v75 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "zoomScale");
    if (self)
      v6 = *(double *)&self->_tileLevel;
    else
      v6 = 0.0;
    if (v5 >= v6)
    {

    }
    else
    {
      updateVisibleTilesAfterZoomOutBlock = self->_updateVisibleTilesAfterZoomOutBlock;

      if (!updateVisibleTilesAfterZoomOutBlock)
      {
        objc_initWeak(&location, self);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __54__PKTiledView__layoutSubviewsUpdateTilesForRendering___block_invoke;
        block[3] = &unk_1E7777B30;
        objc_copyWeak(&v91, &location);
        v8 = dispatch_block_create((dispatch_block_flags_t)0, block);
        p_updateVisibleTilesAfterZoomOutBlock = &self->_updateVisibleTilesAfterZoomOutBlock;
        v10 = *p_updateVisibleTilesAfterZoomOutBlock;
        *p_updateVisibleTilesAfterZoomOutBlock = v8;

        v11 = dispatch_time(0, 100000000);
        dispatch_after(v11, MEMORY[0x1E0C80D38], *p_updateVisibleTilesAfterZoomOutBlock);
        objc_destroyWeak(&v91);
        objc_destroyWeak(&location);
      }
    }
    return;
  }
  -[PKTiledView scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isZooming")
    && (!self ? (v13 = 0.0) : (v13 = *(double *)&self->_tileLevel),
        -[PKTiledView canvasZoomScale](self, "canvasZoomScale"),
        v13 + v13 > v14))
  {
    -[PKTiledView scrollView](self, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "zoomScale");
    v17 = v16;
    if (self)
      v18 = *(double *)&self->_tileLevel;
    else
      v18 = 0.0;
    v19 = v18 * 0.5;

    if (v17 > v19)
      goto LABEL_3;
  }
  else
  {

  }
  if (self)
  {
    if (self->_disableTileRendering || (-[PKTiledView isSystemSnapshotting](self) & 1) != 0)
      return;
    self->_didDisableScrollViewPanGestureRecognizer = 1;
  }
  -[PKTiledView frame](self, "frame");
  v21 = v20;
  v23 = v22;
  -[PKTiledView newViewFrame](self, "newViewFrame");
  -[PKTiledView setFrame:](self, "setFrame:");
  -[PKTiledView frame](self, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[PKTiledView canvasView](self, "canvasView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

  -[PKTiledView bounds](self, "bounds");
  if (self)
    liveAttachment = self->_liveAttachment;
  else
    liveAttachment = 0;
  -[PKAttachmentView setFrame:](liveAttachment, "setFrame:");
  -[PKTiledView scrollView](self, "scrollView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "zoomScale");
  v36 = v35;

  if (self)
  {
    v37 = floor(log2(1.0 / *(double *)&v36)) + 1.0;
    self->_gestureView = (PKTiledGestureView *)(uint64_t)v37;
    tileScale = self->_tileScale;
    v39 = *(double *)&self->_tileLevel;
    objc_opt_self();
    self->_tileScale = round(exp2((double)(uint64_t)v37) * 256.0);
    self->_tileLevel = v36;
  }
  else
  {
    objc_opt_self();
    v39 = 0.0;
    tileScale = 0.0;
  }
  hideCanvasBlock = self->_hideCanvasBlock;
  if (hideCanvasBlock)
  {
    dispatch_block_cancel(hideCanvasBlock);
    v41 = self->_hideCanvasBlock;
    self->_hideCanvasBlock = 0;

  }
  if (!-[PKTiledView _scrollViewIsScrollingOrZoomingOrResizing](self, "_scrollViewIsScrollingOrZoomingOrResizing"))
  {
    objc_initWeak(&location, self);
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __54__PKTiledView__layoutSubviewsUpdateTilesForRendering___block_invoke_2;
    v88[3] = &unk_1E7777B30;
    objc_copyWeak(&v89, &location);
    v42 = dispatch_block_create((dispatch_block_flags_t)0, v88);
    v43 = self->_hideCanvasBlock;
    self->_hideCanvasBlock = v42;

    v44 = dispatch_time(0, 100000000);
    dispatch_after(v44, MEMORY[0x1E0C80D38], self->_hideCanvasBlock);
    objc_destroyWeak(&v89);
    objc_destroyWeak(&location);
  }
  -[PKTiledView frame](self, "frame");
  if (v46 == v21 && v45 == v23 && self->_tileScale == tileScale && *(double *)&self->_tileLevel == v39)
  {
    -[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:](self, "updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:", v3, 0, 0);
LABEL_71:
    self->_didDisableScrollViewPanGestureRecognizer = 0;
    return;
  }
  if (self->_disableTileRendering)
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    -[PKTiledView attachmentViews](self, "attachmentViews");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v85 != v49)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "purgedTiles");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "removeAllObjects");

        }
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
      }
      while (v48);
    }

  }
  tileController = self->_tileController;
  if (tileController)
  {
    if (*(_QWORD *)&tileController[2]._invertColors)
    {
      v53 = tileController[2]._tasks;
      v54 = -[NSMutableArray isDragging](v53, "isDragging");

      if ((v54 & 1) == 0)
      {
        v55 = self->_tileController;
        if (v55)
          -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v55, 1, 0);
      }
    }
  }
  -[PKTiledView _dismissInsertSpaceHandlesIfNecessary](self, "_dismissInsertSpaceHandlesIfNecessary");
  -[PKTiledView attachmentViews](self, "attachmentViews");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView frame](self, "frame");
  if (v58 != v21 || v57 != v23)
  {
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v59 = v56;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
    if (v60)
    {
      v61 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v81 != v61)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * j), "updateFrameForTextContainer");
        }
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
      }
      while (v60);

      if (!self)
      {
        v63 = 0.0;
        goto LABEL_61;
      }
    }
    else
    {

    }
  }
  v63 = *(double *)&self->_tileLevel;
LABEL_61:
  if (v63 != v39)
  {
    -[PKTiledView _layerContentsScale](self, "_layerContentsScale");
    v65 = v64;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v66 = v56;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
    if (v67)
    {
      v68 = *(_QWORD *)v77;
      do
      {
        for (k = 0; k != v67; ++k)
        {
          if (*(_QWORD *)v77 != v68)
            objc_enumerationMutation(v66);
          v70 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
          -[PKTiledView scrollView](self, "scrollView");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "pixelAlignForContentScale:enclosingScrollView:", v71, v65);

        }
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
      }
      while (v67);
    }

  }
  -[PKTiledView _hideCanvas](self, "_hideCanvas");
  -[PKTiledView canvasView](self, "canvasView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView frame](self, "frame");
  objc_msgSend(v72, "_setFixedPointSize:drawingScale:", v73, v74, *(double *)&v36);

  -[PKTiledView resizeTiles:completion:](self, "resizeTiles:completion:", v56, 0);
  -[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:](self, "updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:", v3, 0, 0);
  if (self)
    goto LABEL_71;
}

- (double)_layerContentsScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  -[PKTiledView canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKTiledView canvasView](self, "canvasView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerContentsScale");
    v6 = v5;

  }
  else
  {
    +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
    v6 = v7;
  }

  return v6;
}

- (BOOL)_isZoomingOrResizing
{
  void *v3;
  char v4;

  -[PKTiledView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isZooming") & 1) != 0 || self && self->_disableTileRendering)
    v4 = 1;
  else
    v4 = -[PKTiledView isSystemSnapshotting](self);

  return v4;
}

- (void)_hideCanvas
{
  void *v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PKTiledView canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_finishCombiningStrokesIfNecessary");

  WeakRetained = objc_loadWeakRetained((id *)&self->_lastZoomScale);
  if (WeakRetained)
  {
    v5 = os_log_create("com.apple.pencilkit", "Rendering");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEBUG, "currentDrawingBeingCopiedToCanvas is not nil when it should be", buf, 2u);
    }

    -[PKTiledView setCurrentDrawingBeingCopiedToCanvas:]((id *)&self->super.super.super.isa, 0);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9++), "setContentHidden:", 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  -[PKTiledView canvasView](self, "canvasView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isHidden");

  -[PKTiledView canvasView](self, "canvasView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 1);

  -[PKTiledView setCurrentDrawingBeingCopiedToCanvas:]((id *)&self->super.super.super.isa, 0);
  if ((v11 & 1) == 0 && (*(_BYTE *)&self->_tiledViewFlags & 0x20) != 0)
  {
    -[PKTiledView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "canvasView:didChangeHiddenState:", self, 1);

  }
  if (-[PKTiledView canvasViewZOrderPolicy](self, "canvasViewZOrderPolicy") == 2)
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v19 = *MEMORY[0x1E0C9BAA8];
    v20 = v14;
    v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[PKTiledView canvasView](self, "canvasView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v19;
    v18[1] = v20;
    v18[2] = v21;
    objc_msgSend(v15, "setTransform:", v18);

    -[PKTiledView canvasView](self, "canvasView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView scrollView](self, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView insertCanvasView:intoScrollView:](self, "insertCanvasView:intoScrollView:", v16, v17);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[PKTiledView resumeWorkAfterDrawing](self, "resumeWorkAfterDrawing");
}

- (void)_endHoverToolPreview
{
  void *v3;
  SEL v4;
  SEL v5;
  NSUUID *currentPreviewDrawingUUID;

  if (self)
  {
    if (LOBYTE(self->_refineAnimationController))
    {
      -[PKTiledView canvasView](self, "canvasView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_previewDrawingEnded");

    }
    if (self->_toolPreviewView)
    {
      if (-[PKDrawing count](self->_erasePreviewDrawing, "count"))
      {
        -[PKTiledView _setAdditionalStrokes:inDrawing:invalidateTiles:](self, "_setAdditionalStrokes:inDrawing:invalidateTiles:", MEMORY[0x1E0C9AA60], self->_toolPreviewView, 1);
        objc_setProperty_nonatomic_copy(self, v4, 0, 864);
      }
      objc_storeStrong((id *)&self->_toolPreviewView, 0);
    }
    objc_storeStrong((id *)&self->_pencilStatisticsManager, 0);
    LOBYTE(self->_refineAnimationController) = 0;
    *(&self->_editMenuVisible + 1) = 0;
    BYTE1(self->_refineAnimationController) = 0;
    -[NSOrderedSet removeFromSuperview](self->_eraseOrLassoPreviewStrokes, "removeFromSuperview");
    objc_storeStrong((id *)&self->_eraseOrLassoPreviewStrokes, 0);
    objc_setProperty_nonatomic_copy(self, v5, 0, 864);
  }
  else
  {
    objc_msgSend(0, "removeFromSuperview");
  }
  -[NSUUID removeFromSuperview](self->_currentPreviewDrawingUUID, "removeFromSuperview");
  currentPreviewDrawingUUID = self->_currentPreviewDrawingUUID;
  self->_currentPreviewDrawingUUID = 0;

}

- (void)_dismissInsertSpaceHandlesIfNecessary
{
  PKTileController *tileController;
  PKTileController *v4;
  PKTileController *v5;

  tileController = self->_tileController;
  if (tileController)
  {
    if (-[PKMetalRendererController isCurrentlyAddingSpace](tileController[2]._rendererController, "isCurrentlyAddingSpace"))
    {
      v4 = self->_tileController;
      if (v4)
      {
        -[PKMetalRendererController didMoveStrokes](v4[2]._rendererController, "didMoveStrokes");
        v5 = self->_tileController;
        if (v5)
          -[PKMetalRendererController commitSpacingResize](v5[2]._rendererController, "commitSpacingResize");
      }
    }
  }
}

+ (BOOL)showDebugOutlines
{
  if (qword_1EF55D0C0 != -1)
    dispatch_once(&qword_1EF55D0C0, &__block_literal_global_234);
  return _MergedGlobals_301;
}

- (id)initInScrollView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[PKTiledView initInScrollView:defaultDrawingClass:](self, "initInScrollView:defaultDrawingClass:", v4, objc_opt_class());

  return v5;
}

- (id)initInScrollView:(id)a3 defaultDrawingClass:(Class)a4
{
  return -[PKTiledView initInScrollView:sixChannelBlending:defaultDrawingClass:](self, "initInScrollView:sixChannelBlending:defaultDrawingClass:", a3, 0, a4);
}

- (void)dealloc
{
  id hoverConvertToShapeBlock;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id updateAttachmentBoundsBlock;
  id v9;
  id hideCanvasBlock;
  id v11;
  void *v12;
  void *v13;
  id WeakRetained;
  id v15;
  double timestampForLatestUserInteraction;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PKTiledView _reenableScrollViewPanGestureIfNecessary](self, "_reenableScrollViewPanGestureIfNecessary");
  objc_msgSend((id)self->_drawingPolicy, "removeFromSuperview");
  hoverConvertToShapeBlock = self->_hoverConvertToShapeBlock;
  if (hoverConvertToShapeBlock)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = hoverConvertToShapeBlock;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "removeAllActionsWithTarget:", self);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v5);
    }

  }
  updateAttachmentBoundsBlock = self->_updateAttachmentBoundsBlock;
  if (updateAttachmentBoundsBlock)
  {
    dispatch_block_cancel(updateAttachmentBoundsBlock);
    v9 = self->_updateAttachmentBoundsBlock;
    self->_updateAttachmentBoundsBlock = 0;

  }
  hideCanvasBlock = self->_hideCanvasBlock;
  if (hideCanvasBlock)
  {
    dispatch_block_cancel(hideCanvasBlock);
    v11 = self->_hideCanvasBlock;
    self->_hideCanvasBlock = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:", self);

  objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:", self, CFSTR("prefersPencilOnlyDrawing"));
  -[PKTileController teardown]((uint64_t)self->_drawingTouchThatHitNothing);
  -[UIDropInteraction view](self->_dropInteraction, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeInteraction:", self->_dropInteraction);

  WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentContainerView);
  objc_msgSend(WeakRetained, "_setLayoutObserver:", 0);

  v15 = objc_loadWeakRetained((id *)&self->_attachmentContainerView);
  objc_msgSend(v15, "_removeScrollViewScrollObserver:", self);

  timestampForLatestUserInteraction = self->_timestampForLatestUserInteraction;
  self->_timestampForLatestUserInteraction = 0.0;

  v17.receiver = self;
  v17.super_class = (Class)PKTiledView;
  -[PKTiledView dealloc](&v17, sel_dealloc);
}

- (int64_t)effectiveMaximumSupportedContentVersion
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[PKTiledView maximumSupportedContentVersion](self, "maximumSupportedContentVersion");
  -[PKTiledView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "maximumSupportedContentVersion");
  else
    v6 = 3;
  if (v3 >= v6)
    v3 = v6;

  return v3;
}

- (void)setDelegate:(id)a3
{
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  id v10;

  v10 = a3;
  objc_storeWeak((id *)&self->_canvasViewZOrderPolicy, v10);
  *(_BYTE *)&self->_tiledViewFlags = *(_BYTE *)&self->_tiledViewFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 2;
  else
    v4 = 0;
  *(_BYTE *)&self->_tiledViewFlags = *(_BYTE *)&self->_tiledViewFlags & 0xFD | v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 4;
  else
    v5 = 0;
  *(_BYTE *)&self->_tiledViewFlags = *(_BYTE *)&self->_tiledViewFlags & 0xFB | v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 8;
  else
    v6 = 0;
  *(_BYTE *)&self->_tiledViewFlags = *(_BYTE *)&self->_tiledViewFlags & 0xF7 | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 16;
  else
    v7 = 0;
  *(_BYTE *)&self->_tiledViewFlags = *(_BYTE *)&self->_tiledViewFlags & 0xEF | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 32;
  else
    v8 = 0;
  *(_BYTE *)&self->_tiledViewFlags = *(_BYTE *)&self->_tiledViewFlags & 0xDF | v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 64;
  else
    v9 = 0;
  *(_BYTE *)&self->_tiledViewFlags = *(_BYTE *)&self->_tiledViewFlags & 0xBF | v9;

}

- (void)_disableScrollViewPanGestureIfNecessary
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[16];

  if (!self || !BYTE2(self->_refineAnimationController))
  {
    -[PKTiledView scrollView](self, "scrollView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "panGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEnabled") & 1) != 0)
    {
      v4 = -[PKTiledView _shouldPreventScrollViewPanGestureWhilePreviewing](self, "_shouldPreventScrollViewPanGestureWhilePreviewing");

      if (v4)
      {
        v5 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "Disable scroll view pan gesture recognizer", buf, 2u);
        }

        if (self)
          BYTE2(self->_refineAnimationController) = 1;
        -[PKTiledView scrollView](self, "scrollView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "panGestureRecognizer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setEnabled:", 0);

      }
    }
    else
    {

    }
  }
}

- (void)_reenableScrollViewPanGestureIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (self && BYTE2(self->_refineAnimationController))
  {
    v3 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_INFO, "Reenabling scroll view pan gesture recognizer", v6, 2u);
    }

    -[PKTiledView scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 1);

    BYTE2(self->_refineAnimationController) = 0;
  }
}

- (PKTileController)tileController
{
  UITouch *v3;
  void *v4;
  void *v5;
  void *v6;
  PKMetalConfig *v7;
  PKMetalConfig *v8;
  double v9;
  double v10;
  PKTileController *v11;
  char v12;
  double v13;
  UITouch *v14;
  UITouch *drawingTouchThatHitNothing;
  int v16;
  UITouch *v17;
  double v18;

  if (-[PKTiledView disableTileRendering](self, "disableTileRendering"))
  {
    v3 = 0;
  }
  else
  {
    if (!self->_drawingTouchThatHitNothing)
    {
      -[PKTiledView canvasView](self, "canvasView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metalConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
        v7 = v5;
      else
        v7 = objc_alloc_init(PKMetalConfig);
      v8 = v7;

      objc_opt_self();
      +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
      v10 = v9;
      v11 = [PKTileController alloc];
      v12 = -[PKTiledView _sixChannelBlendingIsActive](self, "_sixChannelBlendingIsActive");
      v13 = ceil(v10 * 512.0);
      v14 = (UITouch *)-[PKTileController initWithPixelSize:actualSize:pixelFormat:sixChannelBlending:metalConfig:](v11, (void *)0x50, v12, v8, v13, v13, v13, v13);
      drawingTouchThatHitNothing = self->_drawingTouchThatHitNothing;
      self->_drawingTouchThatHitNothing = v14;

      v16 = -[PKTiledView invertColors](self, "invertColors");
      v17 = self->_drawingTouchThatHitNothing;
      if (v17)
      {
        LOBYTE(v17[1].super.isa) = v16;
        -[PKMetalRendererController setInvertColors:]((uint64_t)v17[3].super.isa, v16);
      }

    }
    -[PKTiledView canvasZoomScale](self, "canvasZoomScale");
    -[PKTileController setContentZoomScale:]((uint64_t)self->_drawingTouchThatHitNothing, v18);
    v3 = self->_drawingTouchThatHitNothing;
  }
  return (PKTileController *)v3;
}

- (double)timestampForLatestUserInteraction
{
  void *v3;
  void *v4;
  char v5;

  -[PKTiledView canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isDrawing") & 1) != 0)
  {
    -[PKTiledView canvasView](self, "canvasView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPreviewing");

    if ((v5 & 1) == 0)
      return CACurrentMediaTime();
  }
  else
  {

  }
  return *(double *)&self->_drawingEnabled;
}

- (void)_cancelCurrentStrokeAndReduceMemoryFootprint
{
  id v3;

  -[PKTiledView _endHoverToolPreview](self, "_endHoverToolPreview");
  -[PKHoverController reset](*(_QWORD *)&self->_lastContentOffset.x);
  -[PKTiledView _resetDrawingState](self, "_resetDrawingState");
  -[PKTiledView _flushCaches](self, "_flushCaches");
  -[PKTiledView canvasView](self, "canvasView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_reduceMemoryFootprint");

}

- (void)_flushCaches
{
  void *v3;
  UITouch *drawingTouchThatHitNothing;

  objc_msgSend((id)self->_drawingPolicy, "_rendererController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController flushMemoryIfPossible]((uint64_t)v3);

  drawingTouchThatHitNothing = self->_drawingTouchThatHitNothing;
  if (drawingTouchThatHitNothing)
    -[PKMetalRendererController flushMemoryIfPossible]((uint64_t)drawingTouchThatHitNothing[3].super.isa);
}

- (void)_resetDrawingState
{
  void *v3;

  -[PKTiledView drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  if ((objc_msgSend((id)self->_drawingPolicy, "isHidden") & 1) == 0)
    -[PKTiledView _hideCanvas](self, "_hideCanvas");
}

- (void)_beginAnalyticsSessionIfNecessary
{
  PKAnalyticsSession *v3;
  void *aggd_cachedVisibleStrokeCount;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  const char *v14;
  void *v15;
  id obj;

  if (!self->_aggd_cachedVisibleStrokeCount)
  {
    v3 = objc_alloc_init(PKAnalyticsSession);
    aggd_cachedVisibleStrokeCount = (void *)self->_aggd_cachedVisibleStrokeCount;
    self->_aggd_cachedVisibleStrokeCount = (int64_t)v3;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsSession);

  if (!WeakRetained)
  {
    -[PKTiledView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = *(void **)(v8 + 56);
    else
      v10 = 0;
    obj = v10;

    v11 = objc_storeWeak((id *)&self->_analyticsSession, obj);
    -[PKPencilStatisticsManager startAnalyticsSessionIfNecessary]((uint64_t)obj);

    v12 = objc_loadWeakRetained((id *)&self->_analyticsSession);
    -[PKTiledView ink](self, "ink");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_setProperty_nonatomic_copy(v12, v14, v15, 40);

  }
}

- (void)_endAnalyticsSessionsIfNecessary
{
  PKTiledView *v2;
  void *aggd_cachedVisibleStrokeCount;
  id WeakRetained;

  v2 = self;
  -[PKAnalyticsSession endSessionAndSendAnalytics]((uint64_t *)self->_aggd_cachedVisibleStrokeCount);
  aggd_cachedVisibleStrokeCount = (void *)v2->_aggd_cachedVisibleStrokeCount;
  v2->_aggd_cachedVisibleStrokeCount = 0;

  v2 = (PKTiledView *)((char *)v2 + 896);
  WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  -[PKPencilStatisticsManager endAnalyticsSessionIfNecessary]((uint64_t)WeakRetained);

  objc_storeWeak((id *)&v2->super.super.super.isa, 0);
}

- (void)setupGestures
{
  PKLongPressGestureRecognizer *v3;
  UIPanGestureRecognizer *simultaneousDrawingGestureRecognizer;
  PKDrawingGestureRecognizer *v5;
  UIPanGestureRecognizer *generationToolGestureRecognizer;
  PKDrawingGestureRecognizer *v7;
  id drawingUndoTarget;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  PKAttachmentView *v14;
  void *v15;
  void *v16;
  UIPanGestureRecognizer *v17;
  void *v18;
  int v19;

  v3 = objc_alloc_init(PKLongPressGestureRecognizer);
  simultaneousDrawingGestureRecognizer = self->_simultaneousDrawingGestureRecognizer;
  self->_simultaneousDrawingGestureRecognizer = (UIPanGestureRecognizer *)v3;

  v5 = objc_alloc_init(PKDrawingGestureRecognizer);
  generationToolGestureRecognizer = self->_generationToolGestureRecognizer;
  self->_generationToolGestureRecognizer = (UIPanGestureRecognizer *)v5;

  -[UIPanGestureRecognizer setDelegate:](self->_generationToolGestureRecognizer, "setDelegate:", self);
  -[UIPanGestureRecognizer setName:](self->_generationToolGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.simultaneous"));
  v7 = objc_alloc_init(PKDrawingGestureRecognizer);
  drawingUndoTarget = self->_drawingUndoTarget;
  self->_drawingUndoTarget = v7;

  objc_msgSend(self->_drawingUndoTarget, "setName:", CFSTR("com.apple.PencilKit.generationTool"));
  objc_msgSend(self->_drawingUndoTarget, "setThresholdDistance:", 5.0);
  if (!_os_feature_enabled_impl() || PKIsDeviceLocked())
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if ((v11 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((os_variant_has_internal_diagnostics() & 1) == 0)
  {

    goto LABEL_7;
  }
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.TestApp")) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.ZoomTestApp")) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.PaperKitTestApp")) & 1) != 0)
  {

LABEL_4:
    -[PKAttachmentView addGestureRecognizer:](self->_liveAttachment, "addGestureRecognizer:", self->_drawingUndoTarget);
    goto LABEL_7;
  }
  v19 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.pencilkit.MultiDrawingCanvasTestApp"));

  if (v19)
    goto LABEL_4;
LABEL_7:
  v14 = self->_liveAttachment;
  -[PKTiledView canvasView](self, "canvasView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "drawingGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAttachmentView addGestureRecognizer:](v14, "addGestureRecognizer:", v16);

  if (_os_feature_enabled_impl())
  {
    v17 = self->_simultaneousDrawingGestureRecognizer;
    -[PKTiledView canvasView](self, "canvasView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowSimultaneousGR:", v17);

    -[PKAttachmentView addGestureRecognizer:](self->_liveAttachment, "addGestureRecognizer:", self->_generationToolGestureRecognizer);
    -[PKAttachmentView addGestureRecognizer:](self->_liveAttachment, "addGestureRecognizer:", self->_simultaneousDrawingGestureRecognizer);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v6;
  UIPanGestureRecognizer *v7;
  UIPanGestureRecognizer *v8;
  UIPanGestureRecognizer *generationToolGestureRecognizer;
  BOOL v11;
  void *v12;
  UIPanGestureRecognizer *v13;
  char v14;
  UIPanGestureRecognizer *simultaneousDrawingGestureRecognizer;
  BOOL v17;
  char v19;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = (UIPanGestureRecognizer *)a4;
  v8 = v7;
  generationToolGestureRecognizer = self->_generationToolGestureRecognizer;
  v11 = generationToolGestureRecognizer == v6 || generationToolGestureRecognizer == v7;
  -[PKTiledView canvasView](self, "canvasView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "drawingGestureRecognizer");
  v13 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v14 = 1;
  }
  else
  {
    simultaneousDrawingGestureRecognizer = self->_simultaneousDrawingGestureRecognizer;
    v17 = v13 != v6 && v13 != v8;
    v19 = simultaneousDrawingGestureRecognizer != v6 && simultaneousDrawingGestureRecognizer != v8 || v17;
    v14 = v19 ^ 1;
  }

  return v14;
}

- (void)setDefaultDrawingClass:(Class)a3
{
  PKLinedPaper **p_linedPaper;
  id v6;

  p_linedPaper = &self->_linedPaper;
  if (*p_linedPaper != (PKLinedPaper *)a3)
  {
    objc_storeStrong((id *)p_linedPaper, a3);
    v6 = objc_alloc_init(a3);
    objc_msgSend((id)self->_drawingPolicy, "setDrawing:");

  }
}

- (void)setInk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t maxFileFormatVersion;
  void *v26;
  void *v27;
  int v28;
  PKTileController *tileController;
  PKTileController *v30;
  char v31;
  PKTileController *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  PKTileController *v37;
  PKTileController *v38;
  void *v39;
  id *v40;
  void *v41;
  BOOL v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id location;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView canvasView](self, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    -[PKTiledView window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilShadowView shadowViewForScene:](PKPencilShadowView, "shadowViewForScene:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInk:", v4);

    if ((objc_msgSend(v4, "_isEraserInk") & 1) != 0
      || (-[PKTiledView canvasView](self, "canvasView"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "ink"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "_isEraserInk"),
          v14,
          v13,
          (v15 & 1) != 0))
    {
      if (!self)
      {
LABEL_10:
        WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsSession);
        -[PKPencilStatisticsManager endAnalyticsSessionIfNecessary]((uint64_t)WeakRetained);

        objc_storeWeak((id *)&self->_analyticsSession, 0);
        goto LABEL_11;
      }
    }
    else
    {
      LOBYTE(self->_autoRefineController) = 1;
    }
    if (LOBYTE(self->_refineAnimationController) || BYTE1(self->_refineAnimationController))
    {
      -[PKTiledView _endHoverToolPreview](self, "_endHoverToolPreview");
      -[PKTiledView hoverController](self, "hoverController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverController reset]((uint64_t)v16);

      -[PKTiledView _resetDrawingState](self, "_resetDrawingState");
    }
    goto LABEL_10;
  }
LABEL_11:
  -[PKTiledView _updateDrawingGestureEnablementWithInk:](self, "_updateDrawingGestureEnablementWithInk:", v4);
  -[PKTiledView canvasView](self, "canvasView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ink");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "isEqual:", CFSTR("com.apple.ink.objectEraser")))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[PKTiledView canvasView](self, "canvasView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v4;
  objc_msgSend(v21, "ink");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isEqual:", v24) & 1) != 0
    || (maxFileFormatVersion = self->__maxFileFormatVersion,
        maxFileFormatVersion != -[PKTiledView _totalVisibleStrokes](self, "_totalVisibleStrokes")))
  {

    v4 = v43;
    goto LABEL_17;
  }
  v42 = -[PKTiledView aggd_didMergeWithCollaborator](self, "aggd_didMergeWithCollaborator");

  v4 = v43;
  if (!v42)
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordInkPickerNoOp:]((uint64_t)v26, CFSTR("eraser"));

    goto LABEL_22;
  }
LABEL_18:
  objc_msgSend(v4, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqual:", CFSTR("com.apple.ink.objectEraser"));

  if (v28)
  {
    self->__maxFileFormatVersion = -[PKTiledView _totalVisibleStrokes](self, "_totalVisibleStrokes");
    -[PKTiledView setAggd_didMergeWithCollaborator:](self, "setAggd_didMergeWithCollaborator:", 0);
  }
  else if (objc_msgSend(v4, "_isHandwritingInk"))
  {
    -[PKTiledView setRulerEnabled:](self, "setRulerEnabled:", 0);
  }
LABEL_22:
  tileController = self->_tileController;
  if (tileController)
    tileController = (PKTileController *)tileController[2]._tasks;
  v30 = tileController;
  v31 = -[PKTileController isDragging](v30, "isDragging");

  if ((v31 & 1) != 0)
    goto LABEL_34;
  v32 = self->_tileController;
  if (v32 && *(_QWORD *)&v32[2]._invertColors
    || -[PKSelectionController _hasExternalElementsSelectedInAttachment:]((uint64_t)v32, 0))
  {
    objc_msgSend(v4, "inkType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView ink](self, "ink");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "inkType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v33, "isEqual:", v35);

    if ((v36 & 1) == 0)
    {
      v38 = self->_tileController;
      if (v38)
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v38, 1, 0);
      goto LABEL_34;
    }
  }
  v37 = self->_tileController;
  if (!v37 || !*(_QWORD *)&v37[2]._invertColors)
  {
LABEL_34:
    -[PKTiledView canvasView](self, "canvasView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setInk:", v4);

    -[PKTiledView selectionController](self, "selectionController");
    v40 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_updateAllowedTouchTypesForSelectedInk:", v4);

    objc_initWeak(&location, self);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __22__PKTiledView_setInk___block_invoke;
    v44[3] = &unk_1E7777A98;
    objc_copyWeak(&v45, &location);
    +[PKHoverSettings checkIfHoverIsSupported:](PKHoverSettings, "checkIfHoverIsSupported:", v44);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }

}

void __22__PKTiledView_setInk___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKToolPicker existingPaletteViewForWindow:](PKToolPicker, "existingPaletteViewForWindow:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v5, "setHoverDelegate:", v6);

    WeakRetained = v6;
  }

}

- (void)setSelectedStrokesColor:(id)a3
{
  PKTileController *tileController;
  PKTileController *v5;
  char v6;
  PKTileController *v7;
  id v8;

  v8 = a3;
  tileController = self->_tileController;
  if (tileController)
    tileController = (PKTileController *)tileController[2]._tasks;
  v5 = tileController;
  v6 = -[PKTileController isDragging](v5, "isDragging");

  if ((v6 & 1) == 0)
  {
    v7 = self->_tileController;
    if (v7)
    {
      if (*(_QWORD *)&v7[2]._invertColors)
        -[PKSelectionController changeColorOfSelection:]((uint64_t)v7, v8);
    }
  }

}

- (void)setPaperTexture:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKTiledView canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaperTexture:", v5);

}

- (int64_t)_totalVisibleStrokes
{
  void *v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  -[PKTiledView attachments](self, "attachments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "drawing");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "strokes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        v3 += v9;
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  return v3;
}

- (BOOL)_toolPickerIsOrWillBeVisible
{
  void *v2;
  void *v3;
  char v4;

  -[PKTiledView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((objc_msgSend(v3, "isVisible") & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "_isAnimatingToVisible");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_setDrawingEnabled:(BOOL)a3
{
  if (self->_supportsCopyAsText != a3)
  {
    self->_supportsCopyAsText = a3;
    -[PKTiledView _updateDrawingGestureEnablement](self, "_updateDrawingGestureEnablement");
  }
}

- (void)setDrawingPolicy:(unint64_t)a3
{
  if (self->_delegate != (PKTiledViewDelegate *)a3)
  {
    self->_delegate = (PKTiledViewDelegate *)a3;
    -[PKTiledView updateForAllowedDrawingInput](self, "updateForAllowedDrawingInput");
  }
}

- (void)_updateForToolPickerVisibilityChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PKToolPickerNotificationWindowSceneUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
    -[PKTiledView _toolPickerVisibilityDidChange](self, "_toolPickerVisibilityDidChange");

}

- (void)_handlePencilSqueezeInteractionDidChangePaletteViewVisibilityNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[PKTiledView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_paletteViewVisible");

  if (v7)
    -[PKTiledView updateForAllowedDrawingInput](self, "updateForAllowedDrawingInput");
}

- (void)_updateDrawingGestureEnablement
{
  void *v3;
  id v4;

  -[PKTiledView canvasView](self, "canvasView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _updateDrawingGestureEnablementWithInk:](self, "_updateDrawingGestureEnablementWithInk:", v3);

}

- (void)_updateDrawingGestureEnablementWithInk:(id)a3
{
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[PKTiledView _isDrawingEnabled](self, "_isDrawingEnabled"))
  {
    v4 = objc_msgSend(v12, "_isLassoInk");
    v5 = objc_msgSend(v12, "_isGenerationTool");
    -[PKTiledView drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (v4 | v5) ^ 1;
    objc_msgSend(v6, "setEnabled:", v7);

    -[PKTiledView simultaneousDrawingGestureRecognizer](self, "simultaneousDrawingGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v7);

    -[PKTiledView generationToolGestureRecognizer](self, "generationToolGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", v5);
  }
  else
  {
    -[PKTiledView drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

    -[PKTiledView simultaneousDrawingGestureRecognizer](self, "simultaneousDrawingGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 0);

    -[PKTiledView generationToolGestureRecognizer](self, "generationToolGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 0);
  }

}

- (BOOL)_isVirtualDevice
{
  PKIsVisionDevice();
  return 0;
}

- (void)setLinedPaper:(id)a3
{
  id v4;
  UIScrollView *v5;
  UIScrollView *scrollView;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (UIScrollView *)objc_msgSend(v4, "copy");
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  -[PKTiledView canvasView](self, "canvasView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLinedPaper:", v4);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setNeedsLayout");
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)setRulerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  PKHoverController *hoverController;
  void *v6;
  id v7;

  v3 = a3;
  if (!PKIsVisionDevice())
  {
    self->_rulerEnabled = v3;
    hoverController = self->_hoverController;
    if (v3)
    {
      -[PKRulerController showRuler]((uint64_t)hoverController);
    }
    else if (hoverController)
    {
      -[PKRulerController hideRulerAnimated:]((uint64_t)hoverController, 1);
    }
    -[PKTiledView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isRulerActive") != v3)
      objc_msgSend(v7, "setRulerActive:", v3);

  }
}

- (BOOL)rulerEnabled
{
  return self->_rulerEnabled;
}

- (CGAffineTransform)rulerTransform
{
  CGAffineTransform *result;

  -[PKRulerController rulerTransform]((uint64_t)self->_hoverController, retstr);
  return result;
}

- (double)rulerWidth
{
  PKHoverController *hoverController;
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  PKHoverController *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;

  hoverController = self->_hoverController;
  if (hoverController)
  {
    v4 = *(id *)&hoverController->_waitingForHoverHoldTimestamp;
    v5 = v4;
    if (v4)
    {
      v6 = (void *)*((_QWORD *)v4 + 53);
      goto LABEL_4;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = 0;
LABEL_4:
  v7 = v6;
  objc_msgSend(v7, "rulerWidth");
  v9 = v8;
  v10 = self->_hoverController;
  if (!v10)
  {
    v12 = 0;
    goto LABEL_11;
  }
  v11 = *(id *)&v10->_waitingForHoverHoldTimestamp;
  v12 = v11;
  if (!v11)
  {
LABEL_11:
    v13 = 0;
    goto LABEL_7;
  }
  v13 = (void *)*((_QWORD *)v11 + 53);
LABEL_7:
  v14 = v13;
  objc_msgSend(v14, "rulerAlignInset");
  v16 = v9 - v15;

  return v16;
}

- (void)setRulerHostingDelegate:(id)a3
{
  double *p_tileSize;
  PKTiledView *v5;
  PKTiledView *v6;

  p_tileSize = &self->_tileSize;
  v6 = (PKTiledView *)a3;
  objc_storeWeak((id *)p_tileSize, v6);
  if (v6)
    v5 = v6;
  else
    v5 = self;
  -[PKRulerController setRulerHostingDelegate:]((uint64_t)self->_hoverController, v5);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)selectionSupportsCopyAsText
{
  return -[PKSelectionController supportsCopyAsText]((uint64_t)self->_tileController);
}

- (BOOL)selectionSupportsTranslate
{
  if (self->_tileController)
    return objc_msgSend(getLTUITranslationViewControllerClass(), "isAvailable");
  else
    return 0;
}

- (void)selectionSupportsRefinement:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[PKSelectionController refinementEnabled]((uint64_t)self->_tileController) & 1) != 0)
  {
    -[PKSelectionController supportsRefinement:]((id *)&self->_tileController->super.isa, v4);
  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)refineSelection
{
  -[PKSelectionController refine:]((uint64_t)self->_tileController, 0);
}

- (void)copyTranscriptionOfSelection
{
  -[PKSelectionController copyTranscription:]((uint64_t)self->_tileController);
}

- (void)translateSelection
{
  -[PKSelectionController translate:]((uint64_t)self->_tileController);
}

- (void)straightenSelection
{
  -[PKSelectionController straighten:]((uint64_t)self->_tileController, 0);
}

- (void)selectAll:(id)a3
{
  -[PKSelectionController selectAll:]((id *)&self->_tileController->super.isa, a3);
}

- (void)paste:(id)a3
{
  -[PKSelectionController paste:]((uint64_t)self->_tileController, a3);
}

- (void)cut:(id)a3
{
  -[PKSelectionController cut:](&self->_tileController->super.isa, a3);
}

- (void)copy:(id)a3
{
  -[PKSelectionController copy:](&self->_tileController->super.isa, a3);
}

- (void)delete:(id)a3
{
  -[PKSelectionController delete:]((uint64_t)self->_tileController, a3);
}

- (void)duplicate:(id)a3
{
  -[PKSelectionController duplicate:]((id *)&self->_tileController->super.isa);
}

- (void)insertSpace:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[PKStatisticsManager sharedStatisticsManager]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordInsertSpaceWithType:]((uint64_t)v4, 2);

  -[PKSelectionController insertSpace:]((id *)&self->_tileController->super.isa, v5);
}

- (void)insertSpaceAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;

  y = a3.y;
  x = a3.x;
  +[PKStatisticsManager sharedStatisticsManager]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordInsertSpaceWithType:]((uint64_t)v6, 2);

  -[PKSelectionController insertSpaceAtPoint:addDefaultSpace:strokesAbove:strokesBelow:]((id *)&self->_tileController->super.isa, 1, 0, 0, x, y);
}

- (void)_share:(id)a3
{
  -[PKSelectionController _share:]((uint64_t)self->_tileController, a3);
}

- (id)_currentStroke
{
  return (id)objc_msgSend((id)self->_drawingPolicy, "currentStroke");
}

- (id)_liveDrawing
{
  return (id)objc_msgSend((id)self->_drawingPolicy, "liveDrawing");
}

- (BOOL)_shouldExpandBottomAttachmentForDragAndDrop
{
  return 0;
}

- (double)inputScale
{
  void *drawingPolicy;
  double result;

  drawingPolicy = (void *)self->_drawingPolicy;
  if (!drawingPolicy)
    return 1.0;
  objc_msgSend(drawingPolicy, "_inputScale");
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKTiledView;
  -[PKTiledView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  if (self->_drawingTouchThatHitNothing)
  {
    -[PKTiledView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "activationState");

    if (v7 == 2)
      self->_disableUndoManager = 1;
    else
      -[PKTiledView updateAfterTraitCollectionChange](self, "updateAfterTraitCollectionChange");
  }

}

- (void)setSixChannelBlending:(BOOL)a3
{
  if (self->_shouldHideCanvasAfterScroll != a3)
  {
    self->_shouldHideCanvasAfterScroll = a3;
    objc_msgSend((id)self->_drawingPolicy, "setSixChannelBlending:");
    -[PKTiledView updateAfterTraitCollectionChange](self, "updateAfterTraitCollectionChange");
  }
}

- (void)setDrawBitmapEraserMask:(BOOL)a3
{
  if (self->_isDoingInteractiveResize != a3)
  {
    self->_isDoingInteractiveResize = a3;
    objc_msgSend((id)self->_drawingPolicy, "setDrawBitmapEraserMask:");
  }
}

- (BOOL)isAutoRefineEnabled
{
  NSArray *externalAttachments;

  externalAttachments = self->_externalAttachments;
  return externalAttachments && LOBYTE(externalAttachments[3].super.isa) != 0;
}

- (void)setIsAutoRefineEnabled:(BOOL)a3
{
  NSArray *externalAttachments;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  externalAttachments = self->_externalAttachments;
  if (externalAttachments)
    -[PKAutoRefineController setIsAutoRefineOn:force:]((uint64_t)externalAttachments, a3, 1);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "_handleAutoRefineSettingsDidChange");
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)updateAfterTraitCollectionChange
{
  int v3;
  _BOOL8 v4;
  _BYTE *v5;
  _BOOL4 v6;
  _BYTE *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[PKTiledView invertColors](self, "invertColors");
  v4 = -[PKTiledView _sixChannelBlendingIsActive](self, "_sixChannelBlendingIsActive");
  -[PKTiledView tileController](self, "tileController");
  v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5[9] != 0;
  else
    v6 = 0;

  -[PKTiledView tileController](self, "tileController");
  v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ v6;
  if (v7)
    v9 = v7[8] != 0;
  else
    v9 = 0;
  v10 = v3 ^ v9 | v8;

  if (v10 == 1)
  {
    -[PKTiledView tileController](self, "tileController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      *(_BYTE *)(v11 + 8) = v3;
      -[PKMetalRendererController setInvertColors:](*(_QWORD *)(v11 + 24), v3);
    }

    -[PKTiledView tileController](self, "tileController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTileController setSixChannelBlending:]((uint64_t)v13, v4);

    -[PKTiledView cancelTileGenerationInvalidateTiles:](self, "cancelTileGenerationInvalidateTiles:", 1);
    if (v8)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[PKTiledView attachmentViews](self, "attachmentViews", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v20;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "setSixChannelBlending:", v4);
          }
          while (v15 != v17);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v15);
      }

      -[PKTiledView canvasView](self, "canvasView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSixChannelBlending:", v4);

    }
    -[PKTiledView _layoutSubviews](self, "_layoutSubviews");
  }
}

- (id)attachmentViews
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView attachments](self, "attachments");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = objc_opt_class();
        PKDynamicCast(v9, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10, (_QWORD)v13);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (id)_visibleAttachments
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView attachments](self, "attachments");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "viewRep", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isHidden");

        if ((v10 & 1) == 0)
          objc_msgSend(v3, "addObject:", v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)visibleOnScreenStrokesForDrawing:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView attachmentForUUID:](self, "attachmentForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "strokeSpatialCache");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = *(void **)(v6 + 24);
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (id)smoothedHullForStroke:(id)a3
{
  id v3;
  void *v4;
  PKStroke *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *__p[3];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  __n128 (*v16)(__n128 *, __n128 *);
  void (*v17)(uint64_t);
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x4812000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = "";
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__PKTiledView_smoothedHullForStroke___block_invoke;
  v12[3] = &unk_1E77775D8;
  v12[4] = &v13;
  objc_msgSend(v3, "interpolatePointDataWithStep:usingBlock:", v12, 1.0);
  +[PKPathUtility smoothedHullForPoints:](PKPathUtility, "smoothedHullForPoints:", v14 + 6);
  +[PKPathUtility bezierPathFromPoints:](PKPathUtility, "bezierPathFromPoints:", __p);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PKStroke alloc];
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "CGPath");
  objc_msgSend(v3, "ink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKStroke _initWithPath:ink:inputScale:](v5, "_initWithPath:ink:inputScale:", v7, v8, 1.0);

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  _Block_object_dispose(&v13, 8);
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }

  return v9;
}

void __37__PKTiledView_smoothedHullForStroke___block_invoke(uint64_t a1, double a2, double a3)
{
  _QWORD *v5;
  double *v6;
  unint64_t v7;
  double *v8;
  double *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  double *v15;
  char *v16;

  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (double *)v5[7];
  v7 = v5[8];
  if ((unint64_t)v6 >= v7)
  {
    v9 = (double *)v5[6];
    v10 = ((char *)v6 - (char *)v9) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    v12 = v7 - (_QWORD)v9;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(v5 + 8), v13);
      v9 = (double *)v5[6];
      v6 = (double *)v5[7];
    }
    else
    {
      v14 = 0;
    }
    v15 = (double *)&v14[16 * v10];
    v16 = &v14[16 * v13];
    *v15 = a2;
    v15[1] = a3;
    v8 = v15 + 2;
    if (v6 != v9)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v6 - 1);
        v15 -= 2;
        v6 -= 2;
      }
      while (v6 != v9);
      v9 = (double *)v5[6];
    }
    v5[6] = v15;
    v5[7] = v8;
    v5[8] = v16;
    if (v9)
      operator delete(v9);
  }
  else
  {
    *v6 = a2;
    v6[1] = a3;
    v8 = v6 + 2;
  }
  v5[7] = v8;
}

- (id)canvasView:(id)a3 attachmentViewForDrawing:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "uuid", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView attachmentForUUID:](self, "attachmentForUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)canvasView:(id)a3 textStrokesCoveredByStroke:(id)a4 drawing:(id)a5 completion:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v9 = a6;
  objc_msgSend(a5, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView attachmentForUUID:](self, "attachmentForUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "recognitionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager textStrokesCoveredByStroke:completion:]((uint64_t)v12, v13, v9);

}

- (id)_attachmentForUUID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKTiledView attachments](self, "attachments");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "drawing", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_setExternalAttachments:(id)a3
{
  double v4;
  double timestampForLatestUserInteraction;
  id v6;

  v6 = a3;
  v4 = COERCE_DOUBLE(objc_msgSend(v6, "copy"));
  timestampForLatestUserInteraction = self->_timestampForLatestUserInteraction;
  self->_timestampForLatestUserInteraction = v4;

}

- (id)topZAttachment
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKTiledView _visibleAttachments](self, "_visibleAttachments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        if (!v3
          || (objc_msgSend(v3, "viewRep"),
              v8 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v7, "viewRep"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v10 = objc_msgSend(v8, "PK_isBelowViewInDepth:", v9),
              v9,
              v8,
              v10))
        {
          v11 = v7;

          v3 = v11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  return v3;
}

- (id)undoManager
{
  objc_super v4;

  if (-[PKTiledView disableUndoManager](self, "disableUndoManager"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)PKTiledView;
  -[PKTiledView undoManager](&v4, sel_undoManager);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)standInAttachmentView
{
  return 0;
}

- (void)startedDrawingInBlankSpaceWithTouch:(id)a3 location:(CGPoint)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_rulerHostingDelegate, a3);
  if (v12)
  {
    -[PKTiledView viewForAttachmentAtBlankSpace](self, "viewForAttachmentAtBlankSpace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "drawing");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = +[PKTiledView newInlineDrawingOfClass:](PKTiledView, "newInlineDrawingOfClass:", -[PKTiledView defaultDrawingClass](self, "defaultDrawingClass"));
  -[PKTiledView canvasView](self, "canvasView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDrawing:", v7);

  -[PKTiledView defaultDrawingClass](self, "defaultDrawingClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDrawing:", v7);

    -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView canvasView](self, "canvasView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView renderAttachment:intoCanvas:showing:](self, "renderAttachment:intoCanvas:showing:", v10, v11, 1);

LABEL_10:
    goto LABEL_11;
  }
  if (v6)
  {
    -[PKTiledView canvasView](self, "canvasView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView renderAttachment:intoCanvas:showing:](self, "renderAttachment:intoCanvas:showing:", v6, v10, 1);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)canvasViewWillBeginNewStroke:(id)a3 withTouch:(id)a4 location:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  PKRulerHostingDelegate *rulerHostingDelegate;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  _BYTE v39[48];
  uint8_t buf[48];

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  if (v10)
  {
    -[PKTiledView hoverController](self, "hoverController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHoverController didReceiveNormalTouch:]((uint64_t)v11, v10);

    -[PKTiledView canvasZoomScale](self, "canvasZoomScale");
    v13 = v12;
    -[PKTiledView drawingController](self, "drawingController");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = *(void **)(v14 + 64);
    else
      v16 = 0;
    v17 = v16;
    -[PKMetalRendererController setContentZoomScale:]((uint64_t)v17, v13);

    objc_msgSend(v10, "locationInView:", self);
    x = v18;
    y = v19;
  }
  v20 = -[PKTiledView tileController](self, "tileController");
  if (v10)
  {
    -[PKHoverController reset](*(_QWORD *)&self->_lastContentOffset.x);
    -[PKTiledView selectionController](self, "selectionController");
    v21 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = v21[15];

      if (!v22)
        goto LABEL_11;
      -[PKTiledView selectionController](self, "selectionController");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v23)
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v23, 1, 0);
    }
    else
    {
      v24 = 0;
    }

  }
LABEL_11:
  -[PKTiledView cancelTileGenerationInvalidateTiles:](self, "cancelTileGenerationInvalidateTiles:", 0);
  kdebug_trace();
  if (self)
  {
    self->_aggd_didMergeWithCollaborator = 0;
    self->_symbolPreviewActive = 0;
  }
  -[PKTiledView _hitAttachment:](self, "_hitAttachment:", x, y);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    if (v10)
    {
      -[PKTiledView drawingTouchThatHitNothing](self, "drawingTouchThatHitNothing");
      v26 = (id)objc_claimAutoreleasedReturnValue();

      if (self)
      {
        if (v26 == v10)
          self->_symbolPreviewActive = 1;
      }
    }
    rulerHostingDelegate = self->_rulerHostingDelegate;
    self->_rulerHostingDelegate = 0;

    v28 = objc_opt_class();
    PKDynamicCast(v28, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_currentDrawingBeingCopiedToCanvas, v29);

    if (objc_msgSend(v9, "isErasingObjects"))
    {
      objc_msgSend(v25, "drawing");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDrawing:", v30);

      -[PKTiledView getAttachment:tileTransform:strokeTransform:paperTransform:](self, "getAttachment:tileTransform:strokeTransform:paperTransform:", v25, buf, v39, &v38);
      goto LABEL_26;
    }
    objc_msgSend(v9, "drawing");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView liveAttachment](self, "liveAttachment");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "drawing");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 != v33)
    {

LABEL_25:
      -[PKTiledView _layoutSubviewsUpdateTilesForRendering:](self, "_layoutSubviewsUpdateTilesForRendering:", 0);
      -[PKTiledView liveAttachment](self, "liveAttachment");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledView renderAttachment:intoCanvas:showing:](self, "renderAttachment:intoCanvas:showing:", v36, v9, 1);

      goto LABEL_26;
    }
    -[PKTiledView canvasView](self, "canvasView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isHidden");

    if (v35)
      goto LABEL_25;
    v37 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v37, OS_LOG_TYPE_INFO, "Skip render attachment", buf, 2u);
    }

  }
  else if ((objc_msgSend(v9, "isErasingObjects") & 1) == 0)
  {
    -[PKTiledView startedDrawingInBlankSpaceWithTouch:location:](self, "startedDrawingInBlankSpaceWithTouch:location:", v10, x, y);
  }
LABEL_26:

}

- (void)setLiveAttachment:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 736), a2);
}

- (void)_canvasViewWillBeginDrawing:(id)a3 startPoint:(id *)a4 forPreview:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  double *v11;
  CFTimeInterval v12;
  PKAutoRefineController **p_autoRefineController;
  NSObject *v14;
  double var12;
  double v16;
  os_unfair_lock_s *v17;
  os_unfair_lock_s *v18;
  void *v19;
  double v20;
  _QWORD *v21;
  os_unfair_lock_s *v22;
  os_unfair_lock_s *v23;
  int v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5)
  {
    -[PKTiledView _setupPencilShadowViewIfNecessary](self, "_setupPencilShadowViewIfNecessary");
  }
  else
  {
    -[PKTiledView hoverController](self, "hoverController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHoverController didReceiveNormalTouch:]((uint64_t)v9, 0);

    -[PKTiledView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_canvasViewWillBeginDrawing:", self);

  }
  +[PKPencilDevice activePencil]();
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    p_autoRefineController = &self->_autoRefineController;
LABEL_8:
    if (!*(_BYTE *)p_autoRefineController)
      goto LABEL_14;
    goto LABEL_9;
  }
  v12 = CACurrentMediaTime() - v11[2];

  p_autoRefineController = &self->_autoRefineController;
  if (v12 <= 60.0)
    goto LABEL_8;
  *(_BYTE *)p_autoRefineController = 1;
LABEL_9:
  v14 = os_log_create("com.apple.pencilkit", "Drawing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    var12 = a4->var12;
    v24 = 134217984;
    v25 = var12;
    _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEFAULT, "Resetting base roll value to: %g", (uint8_t *)&v24, 0xCu);
  }

  *(_BYTE *)p_autoRefineController = 0;
  v16 = a4->var12;
  +[PKPencilDevice activePencil]();
  v17 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    os_unfair_lock_lock(v17 + 2);
    *(double *)&v18[10]._os_unfair_lock_opaque = v16;
    os_unfair_lock_unlock(v18 + 2);
  }

LABEL_14:
  +[PKPencilDevice activePencil]();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PKPencilDevice baseRollAngle]((uint64_t)v19);
  -[PKTiledView drawingController](self, "drawingController");
  v21 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKController inputController](v21);
  v22 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    os_unfair_lock_lock(v22 + 76);
    *(double *)&v23[90]._os_unfair_lock_opaque = v20;
    os_unfair_lock_unlock(v23 + 76);
  }

}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  -[PKTiledView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canvasViewDidBeginDrawing:", self);

  objc_msgSend(v13, "activeDrawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView attachmentForUUID:](self, "attachmentForUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didBeginDrawing");

  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEndSelectionSessionIfNecessary");

  -[PKTiledView selectionController](self, "selectionController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = *(void **)(v9 + 136);
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v12, "invalidateCachedStrokes");

}

- (void)canvasViewDidEndDrawing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  _BYTE v20[48];
  _BYTE v21[40];
  double v22;
  _BYTE v23[48];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD src[3];
  uint8_t buf[4];
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKTiledView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canvasViewDidEndDrawing:", self);

  objc_msgSend(v4, "activeDrawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  PKDynamicCast(v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "didEndDrawing");
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  src[0] = *MEMORY[0x1E0C9BAA8];
  src[1] = v12;
  src[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (self)
  {
    objc_copyStruct(&self->_strokeTransformAdjustment.b, src, 48, 1, 0);
    if (self->_symbolPreviewActive)
    {
      v25 = 0u;
      v26 = 0u;
      v24 = 0u;
      if (v8)
      {
        objc_msgSend(v8, "drawingTransform");
        v13 = *((double *)&v24 + 1);
        v14 = *(double *)&v24;
      }
      else
      {
        v13 = 0.0;
        v14 = 0.0;
      }
      v15 = sqrt(v13 * v13 + v14 * v14);
      if (v15 <= 0.0)
      {
        self->_symbolPreviewActive = 0;
      }
      else
      {
        -[PKTiledView getAttachment:tileTransform:strokeTransform:paperTransform:](self, "getAttachment:tileTransform:strokeTransform:paperTransform:", v8, v23, v21, v20);
        v16 = self->_strokeTransformAdjustment.a - v22;
        v17 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v29 = v16;
          v30 = 2048;
          v31 = v15;
          _os_log_debug_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEBUG, "Adjusting stroke transform at end of stroke: %g, %g", buf, 0x16u);
        }

        CGAffineTransformMakeTranslation(&v19, 0.0, v16 / v15);
        v18 = v19;
        objc_copyStruct(&self->_strokeTransformAdjustment.b, &v18, 48, 1, 0);
      }
    }
  }
  -[PKTiledView setLiveAttachment:]((uint64_t)self, 0);

}

- (BOOL)canvasView:(id)a3 shouldDiscardEndedStroke:(id)a4 drawing:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v7 = a4;
  objc_msgSend(a5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  PKDynamicCast(v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(v11, "shouldDiscardEndedStroke:", v7);
  else
    v13 = 0;

  return v13;
}

- (BOOL)canvasView:(id)a3 shouldDelayDrawingBeganWithTouch:(id)a4
{
  return LOBYTE(self->_previouslySelectedDrawingUUID) == 0;
}

- (BOOL)canvasViewShouldCombineStrokes:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  char v7;
  void *v9;
  char v10;

  v4 = a3;
  if (!self->_needUpdateAfterBackgroundTraitCollectionChange
    || -[PKTiledView _hasSelection](self, "_hasSelection")
    || (-[PKTiledView selectionController](self, "selectionController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[PKSelectionController _hasExternalElementsSelectedInAttachment:]((uint64_t)v5, 0),
        v5,
        v6))
  {
    v7 = 0;
  }
  else
  {
    -[PKTiledView rulerController](self, "rulerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKRulerController rulerSelected]((uint64_t)v9);

    v7 = v10 ^ 1;
  }

  return v7;
}

- (id)canvasViewContentCoordinateSpace:(id)a3
{
  -[PKTiledView contentCoordinateSpace](self, "contentCoordinateSpace", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)canvasView:(id)a3 beganStroke:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  *(CFTimeInterval *)&self->_drawingEnabled = CACurrentMediaTime();
  if (-[PKTiledView toolShadowShouldBeActive](self, "toolShadowShouldBeActive"))
  {
    -[PKTiledView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilShadowView shadowViewForScene:](PKPencilShadowView, "shadowViewForScene:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "strokeBegan");

  }
  -[PKTiledView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "canvasView:beganStroke:", self, v6);

  objc_msgSend(v14, "activeDrawing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView attachmentForUUID:](self, "attachmentForUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "beganStroke:", v6);

}

- (void)replayCanvasViewDrawingMoved:(id)a3 inputPoint:(id *)a4 inputType:(int64_t)a5
{
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  char v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[8];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.freeform"));

  if (v10)
  {
    -[PKTiledView contentCoordinateSpace](self, "contentCoordinateSpace");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = -[PKTiledView toolShadowShouldBeActive](self, "toolShadowShouldBeActive");

      v14 = !v13;
      if (a5 != 1)
        v14 = 1;
      if ((v14 & 1) == 0)
      {
        -[PKTiledView contentCoordinateSpace](self, "contentCoordinateSpace");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "convertPoint:toCoordinateSpace:", self, a4->var0.var0.x, a4->var0.var0.y);
        v17 = v16;
        v19 = v18;

        a4->var0.var0.x = v17;
        a4->var0.var0.y = v19;
        v20 = *(_OWORD *)&a4->var9;
        v24[4] = *(_OWORD *)&a4->var7;
        v24[5] = v20;
        v21 = *(_OWORD *)&a4->var13;
        v24[6] = *(_OWORD *)&a4->var11;
        v24[7] = v21;
        v22 = *(_OWORD *)&a4->var5;
        v24[2] = *(_OWORD *)&a4->var3;
        v24[3] = v22;
        v23 = *(_OWORD *)&a4->var1;
        v24[0] = a4->var0;
        v24[1] = v23;
        -[PKTiledView _updatePencilShadowView:](self, "_updatePencilShadowView:", v24);
      }
    }
  }
}

- (void)changeStrokesUsingTransformations:(id)a3 strokeGroups:(id)a4 drawing:(id)a5 originalStrokes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;

  v10 = a5;
  -[PKTiledView generateStrokeDataFromApplyingTransformations:strokeGroups:drawing:originalStrokes:](self, "generateStrokeDataFromApplyingTransformations:strokeGroups:drawing:originalStrokes:", a3, a4, v10, a6);
  v11 = v22;
  v12 = v23;
  v13 = v24;
  objc_msgSend(v10, "transformStrokes:paths:masks:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "shouldClearSelectionAfterStraightening");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PKTiledView_changeStrokesUsingTransformations_strokeGroups_drawing_originalStrokes___block_invoke;
  block[3] = &unk_1E7777B80;
  v21 = v15;
  block[4] = self;
  v19 = v14;
  v20 = v10;
  v16 = v10;
  v17 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __86__PKTiledView_changeStrokesUsingTransformations_strokeGroups_drawing_originalStrokes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v2, 1, 0);

  }
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canvasView:registerUndoCommands:", v5, *(_QWORD *)(a1 + 40));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "canvasView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canvasView:drawingDidChange:", v7, *(_QWORD *)(a1 + 48));

  v8 = *(void **)(a1 + 32);
  v10[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_selectionRefreshWithChangeToDrawings:completion:", v9, &__block_literal_global_394);

}

- ($E702C6FE4E45F7E1DA9D39EB52BE3C83)generateStrokeDataFromApplyingTransformations:(SEL)a3 strokeGroups:(id)a4 drawing:(id)a5 originalStrokes:(id)a6
{
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  $E702C6FE4E45F7E1DA9D39EB52BE3C83 *result;
  $E702C6FE4E45F7E1DA9D39EB52BE3C83 *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  unint64_t i;
  void *v40;
  id obj;
  void *v42;
  void *v43;
  id v44;
  _OWORD v45[3];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v33 = retstr;
  v56 = *MEMORY[0x1E0C80C00];
  v36 = a4;
  v38 = a5;
  v44 = a6;
  v34 = a7;
  v35 = (void *)objc_msgSend(v34, "mutableCopy");
  +[PKDrawing sortStrokes:](PKDrawing, "sortStrokes:");
  v43 = (void *)objc_opt_new();
  v42 = (void *)objc_opt_new();
  for (i = 0; objc_msgSend(v38, "count", v33) > i; ++i)
  {
    objc_msgSend(v38, "objectAtIndexedSubscript:", i);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v37;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v51 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
          objc_msgSend(v15, "strokeUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "_visibleStrokeForIdentifier:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v15, "strokeUUID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v11, "containsObject:", v18);

            if ((v19 & 1) == 0)
            {
              objc_msgSend(v15, "strokeUUID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v20);

              objc_msgSend(v40, "addObject:", v17);
            }
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v12);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v21 = v40;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v47;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v47 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
          objc_msgSend(v25, "path");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v25, "transform");
          else
            memset(v45, 0, sizeof(v45));
          v27 = (void *)objc_msgSend(v26, "copyTransformed:inCoordinateSpace:", v10, v45);
          objc_msgSend(v25, "_strokeUUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v27, v28);

          objc_msgSend(v25, "_strokeMask");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "maskTransformedBy:", v10);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_strokeUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v30, v31);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v22);
    }

  }
  v33->var0 = v34;
  v33->var1 = v43;
  v33->var2 = v42;

  return result;
}

- (void)straightenStrokes:(id)a3 drawing:(id)a4 completionBlockWithStrokeTransformInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  PKTiledView *v38;
  id v39;
  _QWORD *v40;
  _QWORD v41[3];
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = a5;
  v30 = v8;
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v11;
  objc_msgSend(v11, "recognitionController");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = *(void **)(v12 + 48);
  else
    v14 = 0;
  v15 = v14;

  v33 = v15;
  -[PKRecognitionSessionManager session](v15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16888]), "initWithRecognitionSession:", v34);
  +[PKStrokeProvider slicesForStrokes:](PKStrokeProvider, "slicesForStrokes:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "strokeIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v23);

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v20);
  }

  v24 = (void *)objc_msgSend(v9, "copy");
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKTiledView_straightenStrokes_drawing_completionBlockWithStrokeTransformInfo___block_invoke;
  aBlock[3] = &unk_1E7777620;
  v25 = v32;
  v39 = v25;
  v26 = v24;
  v36 = v26;
  v27 = v30;
  v40 = v41;
  v37 = v27;
  v38 = self;
  v28 = _Block_copy(aBlock);
  v29 = (id)objc_msgSend(v16, "strokePointTransformationsForContextStrokes:completionWithTelemetry:shouldCancel:", v18, v28, &__block_literal_global_401);

  _Block_object_dispose(v41, 8);
}

void __80__PKTiledView_straightenStrokes_drawing_completionBlockWithStrokeTransformInfo___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  (*(void (**)(void))(a1[7] + 16))();
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PKTiledView_straightenStrokes_drawing_completionBlockWithStrokeTransformInfo___block_invoke_2;
  v7[3] = &unk_1E7777440;
  v7[4] = a1[6];
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __80__PKTiledView_straightenStrokes_drawing_completionBlockWithStrokeTransformInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_beginAnalyticsSessionIfNecessary");
    v3 = *(id *)(v2 + 904);
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  -[PKAnalyticsSession incrementTextLineStraighteningCount](v3);

  +[PKStatisticsManager sharedStatisticsManager]();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordTextLineStraightening:withUndo:]((uint64_t)v5, *(void **)(a1 + 40), 0);

}

uint64_t __80__PKTiledView_straightenStrokes_drawing_completionBlockWithStrokeTransformInfo___block_invoke_3()
{
  return 0;
}

- (void)straighten:(id)a3 strokes:(id)a4 drawing:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PKTiledView_straighten_strokes_drawing___block_invoke;
  v5[3] = &unk_1E7777668;
  v5[4] = self;
  -[PKTiledView straightenStrokes:drawing:completionBlockWithStrokeTransformInfo:](self, "straightenStrokes:drawing:completionBlockWithStrokeTransformInfo:", a4, a5, v5);
}

uint64_t __42__PKTiledView_straighten_strokes_drawing___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeStrokesUsingTransformations:strokeGroups:drawing:originalStrokes:", a2, a3, a4, a5);
}

- (void)_straightenStrokes:(id)a3 drawing:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__PKTiledView__straightenStrokes_drawing_completionBlock___block_invoke;
  v14[3] = &unk_1E7777690;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  -[PKTiledView straightenStrokes:drawing:completionBlockWithStrokeTransformInfo:](self, "straightenStrokes:drawing:completionBlockWithStrokeTransformInfo:", v12, v13, v14);

}

void __58__PKTiledView__straightenStrokes_drawing_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "_newStrokesFromApplyingTransformations:strokeGroups:drawing:originalStrokes:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)_newStrokesFromApplyingTransformations:(id)a3 strokeGroups:(id)a4 drawing:(id)a5 originalStrokes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  id v18;
  id v19;

  v10 = a5;
  -[PKTiledView generateStrokeDataFromApplyingTransformations:strokeGroups:drawing:originalStrokes:](self, "generateStrokeDataFromApplyingTransformations:strokeGroups:drawing:originalStrokes:", a3, a4, v10, a6);
  v11 = v17;
  v12 = v19;
  v13 = v18;
  v14 = v11;
  objc_msgSend(v10, "_originalStrokeUUIDToTransformedStrokeDictFromStrokes:pathDict:maskDict:", v14, v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_createPKStrokesFromCHDrawing:(id)a3 inputScale:(double)a4 sourceStroke:(id)a5 ink:(id)a6
{
  id v9;
  id v10;
  id v11;
  __int128 v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16 = *MEMORY[0x1E0C9BAA8];
  v17 = v12;
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (v10)
  {
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }
  +[PKStroke _createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:](PKStroke, "_createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:", v9, &v16, v13, objc_opt_class(), v11, 1, a4, -1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  return v14;
}

- (id)_createPKStrokesFromCHDrawing:(id)a3 transform:(CGAffineTransform *)a4 inputScale:(double)a5 sourceStroke:(id)a6
{
  id v9;
  id v10;
  __int128 v11;
  void *v12;
  void *v13;
  _OWORD v15[2];
  __int128 v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = *(_OWORD *)&a4->c;
  v15[0] = *(_OWORD *)&a4->a;
  v15[1] = v11;
  v16 = *(_OWORD *)&a4->tx;
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1, v15[0], v11, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKStroke _createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:](PKStroke, "_createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:", v9, v15, v12, objc_opt_class(), 0, 1, a5, -1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)clearRefinableStrokes
{
  -[PKAutoRefineController clearRefinableStrokes]((uint64_t)self->_externalAttachments);
}

- (BOOL)hasRefinableStrokes
{
  NSArray *externalAttachments;

  externalAttachments = self->_externalAttachments;
  return externalAttachments && -[objc_class count](externalAttachments[1].super.isa, "count") > 0;
}

- (BOOL)isRefinableStroke:(id)a3
{
  return -[PKAutoRefineController isRefinableStroke:]((uint64_t)self->_externalAttachments, a3);
}

- (void)enumerateRefinableStrokesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  NSArray *externalAttachments;

  externalAttachments = self->_externalAttachments;
  if (externalAttachments)
    -[objc_class enumerateObjectsWithOptions:usingBlock:](externalAttachments[1].super.isa, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (void)autoRefineTask:(id)a3 synthesizeRefinedDrawingForStrokes:(id)a4 transcription:(id)a5 drawingUUID:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "drawing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "copy");

  v32 = (void *)v17;
  objc_msgSend(v15, "recognitionController");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v14;
  v20 = (void *)v18;
  if (v18)
    v21 = *(void **)(v18 + 48);
  else
    v21 = 0;
  v22 = v21;

  -[PKRecognitionSessionManager session](v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView inputScale](self, "inputScale");
  v25 = v24;
  v26 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE213000, v26, OS_LOG_TYPE_DEBUG, "AutoRefine executeSynthesisWithSession session with last provider version.", buf, 2u);
  }

  v27 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke;
  v35[3] = &unk_1E7777708;
  v35[4] = self;
  v28 = v11;
  v36 = v28;
  v29 = v32;
  v37 = v29;
  v30 = v12;
  v38 = v30;
  v39 = v25;
  v33[0] = v27;
  v33[1] = 3221225472;
  v33[2] = __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_2_409;
  v33[3] = &unk_1E7776F60;
  v31 = v19;
  v34 = v31;
  -[PKAutoRefineTask executeSynthesisWithSession:tokenProcessingBlock:completionBlock:]((uint64_t)v28, v23, v35, v33);

}

void __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_2;
  v14[3] = &unk_1E77776E0;
  v10 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v10;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v19 = v8;
  v20 = v9;
  v21 = *(_QWORD *)(a1 + 64);
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  PKAutoRefineLogEntry *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_currentStroke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "drawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  v7 = *(void **)(a1 + 64);
  v8 = *(void **)(a1 + 72);
  v36 = 0;
  v37 = 0;
  v9 = -[PKAutoRefineTask isInvalidatedGivenDrawing:autoRefineController:currentStroke:inStrokesToReplace:lineDrawing:strokeGroup:outStrokesToReplace:outStrokesToPreserve:](v4, v5, v6, v2, v7, v3, v8, &v37, &v36);
  v10 = v37;
  v11 = v36;
  if (v9)
  {
    -[PKAutoRefineTask cancel](*(_QWORD *)(a1 + 48));
LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    -[PKAutoRefineTask logEventCompletionWithSuccess:](*(_QWORD *)(a1 + 48), 0);
    goto LABEL_16;
  }
  if (!objc_msgSend(v10, "count"))
    goto LABEL_11;
  v12 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v3, "strokeCount");
    v26 = objc_msgSend(*(id *)(a1 + 64), "count");
    *(_DWORD *)buf = 138740483;
    v39 = v24;
    v40 = 2048;
    v41 = v25;
    v42 = 2048;
    v43 = v26;
    _os_log_debug_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEBUG, "AutoRefine in view delegate callback inside the synthesis query call for token with string = _%{sensitive}@_, new drawing with %ld strokes replacing %ld strokes", buf, 0x20u);

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480);
  v34 = 0;
  v35 = 0;
  -[PKAutoRefineController computeSynthesisParametersFromSourceStrokes:outInk:outReferenceStroke:](v13, v10, &v35, &v34);
  v14 = v35;
  v27 = v34;
  objc_msgSend(*(id *)(a1 + 32), "_createPKStrokesFromCHDrawing:inputScale:sourceStroke:ink:", v3, *(double *)(a1 + 88));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(*(id *)(a1 + 56), "undoableAddNewStrokes:replacingOldStrokes:", v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[PKSqueezePaletteViewContext setSelectedColor:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 480), v27);
      -[PKMathResultAttribution setDate:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 480), v14);
      -[PKAutoRefineController removeAsRefinableStrokes:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 480), v10);
      v17 = *(_QWORD *)(a1 + 48);
      if (v17)
        *(_BYTE *)(v17 + 90) = 1;
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 528);
      v20 = *(_QWORD *)(a1 + 56);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_404;
      v28[3] = &unk_1E77776B8;
      v28[4] = v18;
      v33 = *(id *)(a1 + 80);
      v29 = *(id *)(a1 + 48);
      v30 = v15;
      v31 = v10;
      v32 = v11;
      objc_msgSend(v19, "refineFrom:to:in:completionHandler:", v31, v30, v20, v28);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      -[PKAutoRefineTask logEventCompletionWithSuccess:](*(_QWORD *)(a1 + 48), 0);
      v21 = [PKAutoRefineLogEntry alloc];
      -[PKAutoRefineTask debugInfo](*(_QWORD *)(a1 + 48));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PKAutoRefineLogEntry initWithRefinedStrokes:originalStrokes:unchangedStrokes:debugInfo:]((id *)&v21->super.isa, v15, v10, v11, v22);

      +[PKAutoRefineLogger sharedAutoRefineLogger]();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAutoRefineLogger addLogEntry:](v23, v16);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    -[PKAutoRefineTask logEventCompletionWithSuccess:](*(_QWORD *)(a1 + 48), 0);
  }

LABEL_16:
}

void __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_404(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PKAutoRefineLogEntry *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "canvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canvasView:registerUndoCommands:", v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v7, 1, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  -[PKAutoRefineTask logEventCompletionWithSuccess:](*(_QWORD *)(a1 + 40), 1);
  v9 = [PKAutoRefineLogEntry alloc];
  v10 = *(void **)(a1 + 56);
  v11 = *(void **)(a1 + 64);
  v12 = *(void **)(a1 + 48);
  -[PKAutoRefineTask debugInfo](*(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKAutoRefineLogEntry initWithRefinedStrokes:originalStrokes:unchangedStrokes:debugInfo:]((id *)&v9->super.isa, v12, v10, v11, v13);

  +[PKAutoRefineLogger sharedAutoRefineLogger]();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAutoRefineLogger addLogEntry:](v15, v14);

}

uint64_t __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_2_409(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)refine:(id)a3 strokes:(id)a4 drawing:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  PKTiledView *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[3];
  char v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v47 = a4;
  v7 = a5;
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v9;
  objc_msgSend(v9, "recognitionController");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 48);
  else
    v12 = 0;
  v13 = v12;

  -[PKRecognitionSessionManager session](v13);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v13;
  +[PKStrokeProvider slicesForStrokes:](PKStrokeProvider, "slicesForStrokes:", v47);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v45, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v15 = v45;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v62 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "strokeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v19);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v16);
  }

  -[PKTiledView selectionController](self, "selectionController");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = *(void **)(v20 + 120);
  else
    v22 = 0;
  v48 = v22;

  -[PKTiledView selectionController](self, "selectionController");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v42 = objc_msgSend(*(id *)(v23 + 144), "selectionType");
  else
    v42 = 0;

  if (v48)
  {
    objc_msgSend(v48, "strokes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      objc_msgSend(v48, "drawing");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqual:", v28);

      if ((v29 & 1) != 0)
        goto LABEL_21;
    }
    else
    {

    }
  }
  v48 = 0;
LABEL_21:
  v30 = (void *)objc_msgSend(v7, "copy");

  -[PKTiledView inputScale](self, "inputScale");
  v32 = v31;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v60 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16890]), "initWithRecognitionSession:", v46);
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __38__PKTiledView_refine_strokes_drawing___block_invoke;
  v49[3] = &unk_1E77777A0;
  v41 = v30;
  v50 = v41;
  v51 = self;
  v57 = v32;
  v36 = v34;
  v52 = v36;
  v37 = v33;
  v53 = v37;
  v38 = v44;
  v54 = v38;
  v39 = v48;
  v58 = v42;
  v55 = v39;
  v56 = v59;
  v40 = (id)objc_msgSend(v35, "refinementOfContextStrokesWithTranscriptions:completion:shouldCancel:", v14, v49, &__block_literal_global_418);

  _Block_object_dispose(v59, 8);
}

void __38__PKTiledView_refine_strokes_drawing___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
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
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  unint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  unint64_t i;
  _QWORD block[5];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v37 = a2;
  v39 = a3;
  v35 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v39, "count"); ++i)
  {
    objc_msgSend(v37, "objectAtIndexedSubscript:", i);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__411;
    v59 = __Block_byref_object_dispose__412;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v39, "objectAtIndexedSubscript:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokeUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_visibleStrokeForIdentifier:", v11);
    v60 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __38__PKTiledView_refine_strokes_drawing___block_invoke_413;
    v52[3] = &unk_1E7777730;
    v53 = *(id *)(a1 + 32);
    v54 = &v55;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v52);

    objc_msgSend(*(id *)(a1 + 40), "_createPKStrokesFromCHDrawing:inputScale:sourceStroke:ink:", v38, v56[5], 0, *(double *)(a1 + 88));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v14 = *(void **)(a1 + 48);
      objc_msgSend(v35, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

      v16 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

      objc_msgSend(v36, "addObjectsFromArray:", v13);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      objc_msgSend(v39, "objectAtIndexedSubscript:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v49 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(a1 + 32);
            objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "strokeUUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "_visibleStrokeForIdentifier:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v18, "addObject:", v25);
              objc_msgSend(v7, "addObject:", v25);
            }

          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
        }
        while (v20);
      }

      +[PKStroke _applyPropertiesToNewStrokes:fromOldStrokes:](PKStroke, "_applyPropertiesToNewStrokes:fromOldStrokes:", v13, v18);
    }

    _Block_object_dispose(&v55, 8);
  }
  for (k = 0; k < objc_msgSend(*(id *)(a1 + 56), "count"); ++k)
  {
    v27 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", k);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", k);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager cacheTranscription:strokeGroup:](v27, v28, v29);

  }
  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "undoableDeleteStrokes:", v7);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "undoableAddNewStrokes:", v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v30 && v31)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__PKTiledView_refine_strokes_drawing___block_invoke_2;
      block[3] = &unk_1E7777778;
      block[4] = *(_QWORD *)(a1 + 40);
      v32 = v31;
      v42 = v32;
      v30 = v30;
      v43 = v30;
      v44 = *(id *)(a1 + 72);
      v33 = v36;
      v34 = *(_QWORD *)(a1 + 96);
      v45 = v33;
      v47 = v34;
      v46 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    v32 = 0;
    v30 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;

}

void __38__PKTiledView_refine_strokes_drawing___block_invoke_413(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v10 = v6;
  objc_msgSend(v6, "strokeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_visibleStrokeForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v9, "_isSynthesizedInk") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v9);
    *a4 = 1;
  }

}

void __38__PKTiledView_refine_strokes_drawing___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v15[0] = *(_QWORD *)(a1 + 40);
  v15[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "canvasView:registerUndoCommands:", v3, v5);

  LOBYTE(v2) = *(_QWORD *)(a1 + 56) == 0;
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id *)v6;
  if ((v2 & 1) != 0)
  {
    if (v6)
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v6, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", *(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectStrokes:forSelectionType:inDrawing:](v7, v8, *(_QWORD *)(a1 + 80), *(void **)(a1 + 72));

  }
  v10 = *(void **)(a1 + 32);
  v9 = a1 + 32;
  v11 = (uint64_t *)(v9 + 40);
  objc_msgSend(v10, "didChangeDrawing:", *(_QWORD *)(v9 + 40));
  v12 = *(void **)v9;
  v14 = *v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_selectionRefreshWithChangeToDrawings:completion:", v13, &__block_literal_global_416);

}

uint64_t __38__PKTiledView_refine_strokes_drawing___block_invoke_4()
{
  return 0;
}

- (void)canvasView:(id)a3 endedStroke:(id)a4 shapeStrokes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  *(CFTimeInterval *)&self->_drawingEnabled = CACurrentMediaTime();
  if ((*(_BYTE *)&self->_tiledViewFlags & 2) != 0)
  {
    -[PKTiledView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "canvasView:endedStroke:shapeStrokes:", self, v8, v9);
  }
  else
  {
    if ((*(_BYTE *)&self->_tiledViewFlags & 1) == 0)
      goto LABEL_6;
    -[PKTiledView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "canvasView:endedStroke:", self, v8);
  }

LABEL_6:
  objc_msgSend(v16, "activeDrawing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView attachmentForUUID:](self, "attachmentForUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PKAutoRefineController indexRefinableStroke:]((uint64_t)self->_externalAttachments, v8);
    objc_msgSend(v13, "recognitionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager updateWithRefinableStroke:]((uint64_t)v14, v8);

  }
  -[PKTiledView _beginAnalyticsSessionIfNecessary](self, "_beginAnalyticsSessionIfNecessary");
  v15 = (id)self->_aggd_cachedVisibleStrokeCount;
  -[PKAnalyticsSession incrementStrokeCount](v15);

  objc_msgSend(v13, "endedStroke:", v8);
}

- (void)canvasView:(id)a3 cancelledStroke:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  PKRulerHostingDelegate *rulerHostingDelegate;
  id v15;

  v15 = a3;
  v6 = a4;
  *(CFTimeInterval *)&self->_drawingEnabled = CACurrentMediaTime();
  if (v6)
  {
    -[PKTiledView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "canvasView:cancelledStroke:", self, v6);

    objc_msgSend(v15, "activeDrawing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView attachmentForUUID:](self, "attachmentForUUID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelledStroke:", v6);

  }
  -[PKTiledView canvasView](self, "canvasView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_finishCombiningStrokesIfNecessary");

  -[PKTiledView canvasView](self, "canvasView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "wantsCanvasVisible");

  if ((v13 & 1) == 0)
  {
    rulerHostingDelegate = self->_rulerHostingDelegate;
    self->_rulerHostingDelegate = 0;

    -[PKTiledView _hideCanvas](self, "_hideCanvas");
    -[PKTiledView updateTilesForVisibleRect](self, "updateTilesForVisibleRect");
  }

}

- (void)_canvasViewDidEraseStrokes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  *(CFTimeInterval *)&self->_drawingEnabled = CACurrentMediaTime();
  -[PKTiledView canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKTiledView canvasView](self, "canvasView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "drawing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_opt_class();
    PKDynamicCast(v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "drawingDidEraseStrokes:", v16);

  }
  -[PKTiledView delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[PKTiledView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "canvasViewDidEraseStrokes:", v16);

  }
}

- (void)_canvasView:(id)a3 eraserMoved:(CGPoint)a4 attachment:(id)a5
{
  objc_msgSend(a5, "eraserMovedToLocation:", a3, a4.x, a4.y);
}

- (void)_cancelHideCanvasIfNecessary
{
  NSMutableArray *undoManagersRegisteredWith;
  NSMutableArray *v4;

  undoManagersRegisteredWith = self->_undoManagersRegisteredWith;
  if (undoManagersRegisteredWith)
  {
    dispatch_block_cancel(undoManagersRegisteredWith);
    v4 = self->_undoManagersRegisteredWith;
    self->_undoManagersRegisteredWith = 0;

  }
}

- (void)_canvasView:(id)a3 didFinishRenderingNewStrokes:(id)a4 inDrawing:(id)a5 forPreview:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;

  v18 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_opt_class();
    PKDynamicCast(v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && objc_msgSend(v14, "updateHeightAfterDrawing") && (objc_msgSend(v10, "_isEmpty") & 1) == 0)
    {
      -[PKTiledView _updateHeightOfAttachmentIfNecessary:](self, "_updateHeightOfAttachmentIfNecessary:", v15);
      -[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:](self, "updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:", 0, 0, 0);
    }
    -[PKTiledView cancelTileGenerationInvalidateTiles:](self, "cancelTileGenerationInvalidateTiles:", 0);
    v16 = objc_msgSend(v18, "wantsCanvasVisible");
    if ((v16 & 1) == 0)
      objc_msgSend(v9, "count");
    -[PKTiledView canvasView](self, "canvasView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView _copyFromCanvas:intoAttachment:hideCanvas:strokes:](self, "_copyFromCanvas:intoAttachment:hideCanvas:strokes:", v17, v12, v16 ^ 1u, v9);

  }
  else if ((objc_msgSend(v18, "wantsCanvasVisible") & 1) == 0)
  {
    -[PKTiledView _hideCanvas](self, "_hideCanvas");
  }

}

- (void)updateCurrentSelectionWithNewDrawingIfNecessary:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKTiledView selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController updateCurrentSelectionWithNewDrawingIfNecessary:]((uint64_t)v4, v5);

}

- (void)_handleDrawingDidChangeForAttachment:(id)a3
{
  -[PKTiledView _handleDrawingDidChangeForAttachment:didChangeVisibleStrokes:](self, "_handleDrawingDidChangeForAttachment:didChangeVisibleStrokes:", a3, 1);
}

- (void)_handleDrawingDidChangeForAttachment:(id)a3 didChangeVisibleStrokes:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  dispatch_time_t v20;
  _QWORD block[4];
  id v22;
  id v23[5];
  id location;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "drawing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v6, "drawing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView visibleOnscreenBoundsForDrawing:](self, "visibleOnscreenBoundsForDrawing:", v8);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = objc_opt_class();
    PKDynamicCast(v17, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "drawingDidChangeVisibleStrokes:", v4);
    v20 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PKTiledView__handleDrawingDidChangeForAttachment_didChangeVisibleStrokes___block_invoke;
    block[3] = &unk_1E77777E8;
    objc_copyWeak(v23, &location);
    v22 = v6;
    v23[1] = v10;
    v23[2] = v12;
    v23[3] = v14;
    v23[4] = v16;
    dispatch_after(v20, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }

}

void __76__PKTiledView__handleDrawingDidChangeForAttachment_didChangeVisibleStrokes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  CGRect v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "drawing");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "drawing");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "visibleOnscreenBoundsForDrawing:", v3);
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;

      v13.origin.x = v5;
      v13.origin.y = v7;
      v13.size.width = v9;
      v13.size.height = v11;
      if (!CGRectEqualToRect(v13, *(CGRect *)(a1 + 48)))
        objc_msgSend(*(id *)(a1 + 32), "visibleOnscreenBoundsDidChange:", v5, v7, v9, v11);
    }
  }

}

- (void)canvasView:(id)a3 drawingDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a4;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "drawing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mergeWithDrawing:", v5);

    -[PKTiledView _handleDrawingDidChangeForAttachment:](self, "_handleDrawingDidChangeForAttachment:", v7);
  }
  else
  {
    v9 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1BE213000, v9, OS_LOG_TYPE_ERROR, "Drawing did change that is not in text.", v10, 2u);
    }

  }
  -[PKTiledView updateCurrentSelectionWithNewDrawingIfNecessary:](self, "updateCurrentSelectionWithNewDrawingIfNecessary:", v5);

}

- (BOOL)canvasView:(id)a3 shouldBeginDrawingWithTouch:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BYTE *v17;
  _QWORD *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id *v24;
  void *v25;
  char v26;
  BOOL v27;
  int v28;
  int v29;
  uint8_t v31[16];

  v5 = a4;
  -[PKTiledView _beginAnalyticsSessionIfNecessary](self, "_beginAnalyticsSessionIfNecessary");
  -[PKTiledView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PKTiledView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canvasView:shouldBeginDrawingWithTouch:", self, v5);

  }
  else
  {
    v9 = 1;
  }
  if (objc_msgSend(v5, "type"))
  {
    if ((v9 & 1) == 0)
      goto LABEL_27;
  }
  else
  {
    -[PKTiledView hoverController](self, "hoverController");
    v17 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v17 && self && v17[56])
    {
      if (LOBYTE(self->_refineAnimationController))
      {

        goto LABEL_27;
      }
      v28 = BYTE1(self->_refineAnimationController);

      if (v28)
        v29 = 0;
      else
        v29 = v9;
      if (v29 != 1)
        goto LABEL_27;
    }
    else
    {

      if ((v9 & 1) == 0)
        goto LABEL_27;
    }
  }
  -[PKTiledView drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawingTouch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PKTiledView drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "drawingTouch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");

    v15 = objc_msgSend(v5, "type");
    if (v14 == 2 && v15 != 2)
    {
      v16 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_1BE213000, v16, OS_LOG_TYPE_INFO, "Avoided started drawing since we were already drawing with a pencil.", v31, 2u);
      }

      goto LABEL_27;
    }
  }
  -[PKTiledView selectionController](self, "selectionController");
  v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = v18[15];

    if (v19)
    {
      objc_msgSend(v5, "locationInView:", self);
      v21 = v20;
      v23 = v22;
      -[PKTiledView selectionController](self, "selectionController");
      v24 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "_selectionShouldReceiveTouchForPoint:", v21, v23);

      if ((v26 & 1) != 0)
      {
LABEL_27:
        v27 = 0;
        goto LABEL_28;
      }
    }
  }
  -[PKTiledView _cancelHideCanvasIfNecessary](self, "_cancelHideCanvasIfNecessary");
  v27 = 1;
LABEL_28:

  return v27;
}

- (void)canvasViewDrawingMoved:(id)a3 withTouch:(id)a4
{
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _OWORD v10[8];
  __int128 __s1;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v5 = a4;
  *(CFTimeInterval *)&self->_drawingEnabled = CACurrentMediaTime();
  if (-[PKTiledView toolShadowShouldBeActive](self, "toolShadowShouldBeActive") && objc_msgSend(v5, "type") == 2)
    -[PKTiledView _keepPencilShadowVisible](self, "_keepPencilShadowVisible");
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  __s1 = 0u;
  -[PKTiledView canvasView](self, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_drawingController");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKController inputController](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_latestStrokePoint");
  }
  else
  {
    v16 = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    __s1 = 0u;
  }

  if (memcmp(&__s1, &_PKStrokePointZero, 0x58uLL))
  {
    memset(v10, 0, sizeof(v10));
    -[PKTiledView _updateToolPreviewIndicatorInputPoint:](self, "_updateToolPreviewIndicatorInputPoint:", v10);
  }

}

- (void)canvasViewInvalidateTiles:(id)a3
{
  -[PKTiledView cancelTileGenerationInvalidateTiles:](self, "cancelTileGenerationInvalidateTiles:", 1);
  -[PKTiledView updateTilesForVisibleRect](self, "updateTilesForVisibleRect");
}

- (CGAffineTransform)canvasView:(SEL)a3 transformForStroke:(id)a4
{
  uint64_t v5;
  __int128 v6;

  if (self && (BYTE1(self[10].tx) & 1) != 0)
  {
    objc_copyStruct(retstr, &self[21].b, 48, 1, 0);
  }
  else
  {
    v5 = MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v6;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  }
  return self;
}

- (void)_handleSingleTapAtLocation:(CGPoint)a3 forAttachment:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = objc_opt_class();
  PKDynamicCast(v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "drawing");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10
      || (objc_msgSend(v7, "drawing"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          -[PKTiledView transformFromViewToStrokeSpaceInDrawing:](self, "transformFromViewToStrokeSpaceInDrawing:", v11),
          v11,
          (objc_msgSend(v9, "_handleSingleTapAtDrawingLocation:", y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0) & 1) == 0))
    {
      -[PKTiledView _showEditMenuFromLocation:forAttachment:](self, "_showEditMenuFromLocation:forAttachment:", v9, x, y);
    }
  }

}

- (void)_showEditMenuFromLocation:(CGPoint)a3 forAttachment:(id)a4
{
  double y;
  double x;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;

  y = a3.y;
  x = a3.x;
  v12 = a4;
  -[PKTiledView becomeFirstResponder](self, "becomeFirstResponder");
  objc_msgSend(v12, "setAttachmentChromeVisible:animated:highlightBackground:", 1, 1, 0);
  objc_msgSend(MEMORY[0x1E0DC3798], "configurationWithIdentifier:sourcePoint:", CFSTR("PKEditMenuConfigurationIdentifier"), x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView selectionController](self, "selectionController");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    WeakRetained = objc_loadWeakRetained((id *)(v8 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "editMenuInteraction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentEditMenuWithConfiguration:", v7);

}

- (void)didChangeDrawing:(id)a3
{
  id v3;

  v3 = -[PKTiledView didChangeDrawing:undoable:](self, "didChangeDrawing:undoable:", a3, 0);
}

- (id)didChangeDrawing:(id)a3 undoable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isExternalAttachment") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "externalAttachmentDidChangeDrawing:", v6);
  objc_msgSend(v8, "drawing");
  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "undoableMergeWithDrawing:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mergeWithDrawing:", v6);
    v10 = 0;
  }

  -[PKTiledView _handleDrawingDidChangeForAttachment:](self, "_handleDrawingDidChangeForAttachment:", v8);
  return v10;
}

- (void)registerUndoCommand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  PKTiledView *v7;
  id hoverConvertToShapeBlock;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  -[PKTiledView undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKTiledView undoManager](self, "undoManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView drawingUndoTarget](self, "drawingUndoTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerWithUndoManager:target:selector:", v5, v6, -[PKTiledView drawingUndoSelector](self, "drawingUndoSelector"));

    -[PKTiledView drawingUndoTarget](self, "drawingUndoTarget");
    v7 = (PKTiledView *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
    {
      hoverConvertToShapeBlock = self->_hoverConvertToShapeBlock;
      if (!hoverConvertToShapeBlock)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
        v10 = self->_hoverConvertToShapeBlock;
        self->_hoverConvertToShapeBlock = v9;

        hoverConvertToShapeBlock = self->_hoverConvertToShapeBlock;
      }
      -[PKTiledView undoManager](self, "undoManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(hoverConvertToShapeBlock, "indexOfObjectIdenticalTo:", v11);

      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = self->_hoverConvertToShapeBlock;
        -[PKTiledView undoManager](self, "undoManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

      }
    }
  }

}

- (void)registerUndoCommands:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKTiledView undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2
      || (-[PKTiledView undoManager](self, "undoManager"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "groupsByEvent"),
          v6,
          (v7 & 1) != 0))
    {
      v8 = 0;
    }
    else
    {
      -[PKTiledView undoManager](self, "undoManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "beginUndoGrouping");

      v8 = 1;
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v10);
          -[PKTiledView registerUndoCommand:](self, "registerUndoCommand:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), (_QWORD)v15);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    if (v8)
    {
      -[PKTiledView undoManager](self, "undoManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endUndoGrouping");

    }
  }

}

- (void)registerUndoCommands:(id)a3 andChangeToDrawing:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKTiledView registerUndoCommands:](self, "registerUndoCommands:", v6);
  -[PKTiledView didChangeDrawing:](self, "didChangeDrawing:", v7);
  -[PKTiledView selectionController](self, "selectionController");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v8, 1, 0);

  -[PKTiledView didChangeDrawing:](self, "didChangeDrawing:", v7);
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _selectionRefreshWithChangeToDrawings:completion:](self, "_selectionRefreshWithChangeToDrawings:completion:", v10, &__block_literal_global_425);

}

- (void)canvasView:(id)a3 registerMultiStepUndoCommands:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PKTiledView undoManager](self, "undoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_msgSend(v7, "count");

    if (v9)
    {
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledView canvasView:registerUndoCommands:](self, "canvasView:registerUndoCommands:", v6, v10);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__PKTiledView_canvasView_registerMultiStepUndoCommands___block_invoke;
      block[3] = &unk_1E7776FB0;
      block[4] = self;
      v12 = v6;
      v13 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

void __56__PKTiledView_canvasView_registerMultiStepUndoCommands___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 48), "count") - 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "canvasView:registerMultiStepUndoCommands:", v2);

}

- (void)canvasView:(id)a3 registerUndoCommands:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[PKTiledView undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PKTiledView registerUndoCommands:](self, "registerUndoCommands:", v6);

}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double MaxY;
  void *v36;
  _QWORD block[4];
  id v38;
  id v39;
  id buf[2];
  double v41;
  double v42;
  _QWORD v43[4];
  id v44;
  CGRect v45;

  v4 = a3;
  +[PKStatisticsManager sharedStatisticsManager]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordUndoIfNecessary]((uint64_t)v5);

  -[PKAutoRefineController clearRefinableStrokes]((uint64_t)self->_externalAttachments);
  -[PKTiledView _dismissInsertSpaceHandlesIfNecessary](self, "_dismissInsertSpaceHandlesIfNecessary");
  -[PKTiledView canvasView](self, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isCombiningStrokes");

  if (v7)
  {
    -[PKTiledView canvasView](self, "canvasView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_finishCombiningStrokesIfNecessary");

  }
  -[PKTiledView _endHoverToolPreview](self, "_endHoverToolPreview");
  -[PKHoverController reset](*(_QWORD *)&self->_lastContentOffset.x);
  objc_msgSend(v4, "drawingUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[PKTiledView updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:withCallback:](self, "updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:withCallback:", 0, 0);
    goto LABEL_20;
  }
  -[PKTiledView undoManager](self, "undoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActionName:", v12);

  objc_msgSend(v10, "drawing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyToDrawingReturnInverted:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v36 = (void *)v14;
  if (v14)
    -[PKTiledView registerUndoCommand:](self, "registerUndoCommand:", v14);
  +[PKStatisticsManager sharedStatisticsManager]();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView canvasView](self, "canvasView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ink");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordUndo:forStrokes:fallbackInkIdentifier:]((uint64_t)v15, v16, v17, v20);

  -[PKTiledView _beginAnalyticsSessionIfNecessary](self, "_beginAnalyticsSessionIfNecessary");
  v21 = (id)self->_aggd_cachedVisibleStrokeCount;
  -[PKAnalyticsSession incrementUndoCount](v21);

  if (v7)
  {
    -[PKTiledView canvasView](self, "canvasView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isHidden"))
    {

    }
    else
    {
      -[PKTiledView canvasView](self, "canvasView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "wantsCanvasVisible");

      if (v24)
      {
        v25 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1BE213000, v25, OS_LOG_TYPE_INFO, "Skipping tile update since canvas is visible", (uint8_t *)buf, 2u);
        }

        goto LABEL_16;
      }
    }
    -[PKTiledView updateTilesForVisibleRect](self, "updateTilesForVisibleRect");
  }
  else
  {
    -[PKTiledView updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:withCallback:](self, "updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:withCallback:", 0, 0);
  }
LABEL_16:
  -[PKTiledView _handleDrawingDidChangeForAttachment:didChangeVisibleStrokes:](self, "_handleDrawingDidChangeForAttachment:didChangeVisibleStrokes:", v10, objc_msgSend(v4, "changesVisibleStrokes"));
  dispatch_get_global_queue(0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawing");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __27__PKTiledView_performUndo___block_invoke;
  v43[3] = &unk_1E7777378;
  v29 = v10;
  v44 = v29;
  objc_msgSend(v27, "clipStrokesIfNeededOnQueue:completion:", v26, v43);

  if (objc_msgSend(v29, "isAtEndOfDocument"))
  {
    objc_msgSend(v29, "drawing");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "_isEmpty");

    if ((v31 & 1) == 0)
    {
      v32 = objc_opt_class();
      PKDynamicCast(v32, v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "drawing");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bounds");
      MaxY = CGRectGetMaxY(v45);
      objc_msgSend(v29, "drawingTransform");
      objc_msgSend(v33, "updateDrawingHeight:", MaxY * sqrt(v42 * v42 + v41 * v41));

    }
  }
  objc_initWeak(buf, self);
  block[0] = v28;
  block[1] = 3221225472;
  block[2] = __27__PKTiledView_performUndo___block_invoke_3;
  block[3] = &unk_1E7777B58;
  objc_copyWeak(&v39, buf);
  v38 = v29;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v39);
  objc_destroyWeak(buf);

LABEL_20:
}

void __27__PKTiledView_performUndo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__PKTiledView_performUndo___block_invoke_2;
  block[3] = &unk_1E7777440;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void __27__PKTiledView_performUndo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "drawing");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mergeWithDrawing:", *(_QWORD *)(a1 + 40));

  v2 = objc_opt_class();
  PKDynamicCast(v2, *(void **)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "drawingDidChange");

}

void __27__PKTiledView_performUndo___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "drawing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateCurrentSelectionWithNewDrawingIfNecessary:", v2);

}

+ (id)newInlineDrawingOfClass:(Class)a3
{
  id v3;

  v3 = objc_alloc_init(a3);
  objc_msgSend(v3, "set_canvasBounds:", 0.0, 0.0, 768.0, 120.0);
  return v3;
}

- (BOOL)_isScrollViewSizeAnimating
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKTiledView scrollView](self, "scrollView", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasPrefix:", CFSTR("bounds.size")) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)_didAddDrawingAttachmentView
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  PKRulerHostingDelegate *rulerHostingDelegate;
  char v8;
  NSObject *v9;
  void *v10;
  _QWORD *v11;
  uint8_t v12[16];

  if (self->_rulerHostingDelegate)
  {
    -[PKTiledView canvasView](self, "canvasView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isDrawing");

    -[PKTiledView canvasView](self, "canvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView drawingTouchThatHitNothing](self, "drawingTouchThatHitNothing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView canvasViewWillBeginNewStroke:withTouch:location:](self, "canvasViewWillBeginNewStroke:withTouch:location:", v5, v6, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    rulerHostingDelegate = self->_rulerHostingDelegate;
    if (rulerHostingDelegate)
      v8 = 1;
    else
      v8 = v4;
    if ((v8 & 1) == 0)
    {
      v9 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_debug_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEBUG, "Stroke already ended in _didAddDrawingAttachmentView", v12, 2u);
      }

      -[PKTiledView canvasView](self, "canvasView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledView canvasViewDidEndDrawing:](self, "canvasViewDidEndDrawing:", v10);

      rulerHostingDelegate = self->_rulerHostingDelegate;
    }
    self->_rulerHostingDelegate = 0;

  }
  -[PKTiledView selectionController](self, "selectionController");
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _didAddDrawingAttachmentView](v11);

}

void __54__PKTiledView__layoutSubviewsUpdateTilesForRendering___block_invoke(uint64_t a1)
{
  double *WeakRetained;
  void *v2;
  void *v3;
  double v4;
  void *v5;
  int v6;
  double *v7;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)*((_QWORD *)WeakRetained + 55);
    WeakRetained[55] = 0.0;
    v7 = WeakRetained;

    objc_msgSend(v7, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "zoomScale");
    if (v4 >= v7[89])
    {

      WeakRetained = v7;
    }
    else
    {
      objc_msgSend(v7, "scrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isZooming");

      WeakRetained = v7;
      if (v6)
      {
        objc_msgSend(v7, "updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:", 1, 0, 0);
        WeakRetained = v7;
      }
    }
  }

}

- (void)getAttachment:(id)a3 tileTransform:(CGAffineTransform *)a4 strokeTransform:(CGAffineTransform *)a5 paperTransform:(CGAffineTransform *)a6
{
  void *v10;
  id v11;

  v11 = a3;
  -[PKTiledView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentOffset");
  -[PKTiledView getAttachment:tileTransform:strokeTransform:paperTransform:scrollViewContentOffset:](self, "getAttachment:tileTransform:strokeTransform:paperTransform:scrollViewContentOffset:", v11, a4, a5, a6);

}

- (CGAffineTransform)contentCoordinateSpaceTransform
{
  void *v5;
  CGAffineTransform *result;
  void *v7;
  uint64_t v8;
  __int128 v9;
  id v10;

  -[PKTiledView contentCoordinateSpace](self, "contentCoordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKTiledView contentCoordinateSpace](self, "contentCoordinateSpace");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PKTiledView canvasView](self, "canvasView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v10, v7, retstr);

  }
  else
  {
    v8 = MEMORY[0x1E0C9BAA8];
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  }
  return result;
}

- (void)getAttachment:(id)a3 tileTransform:(CGAffineTransform *)a4 strokeTransform:(CGAffineTransform *)a5 paperTransform:(CGAffineTransform *)a6 scrollViewContentOffset:(CGPoint)a7
{
  double y;
  double x;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48[2];
  CGAffineTransform t2;
  CGAffineTransform t1;

  y = a7.y;
  x = a7.x;
  v13 = a3;
  -[PKTiledView scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "zoomScale");
  v16 = v15;

  -[PKTiledView drawingTouchThatHitNothing](self, "drawingTouchThatHitNothing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
    v18 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v18;
  }
  memset(&v48[1], 0, sizeof(CGAffineTransform));
  if (v13)
    objc_msgSend(v13, "drawingTransform");
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  objc_msgSend(v13, "tileContainerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v13, "tileContainerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "convertRect:fromView:", v29, v22, v24, v26, v28);
  v31 = v30;
  v33 = v32;

  -[PKTiledView _layerContentsScale](self, "_layerContentsScale");
  v35 = v34;
  memset(v48, 0, 48);
  -[PKTiledView canvasView](self, "canvasView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
    objc_msgSend(v36, "_replayCoordinateSystemTransform");
  else
    memset(v48, 0, 48);

  v47 = v48[0];
  if (CGAffineTransformIsIdentity(&v47))
  {
    -[PKTiledView contentCoordinateSpace](self, "contentCoordinateSpace");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      memset(&t1, 0, sizeof(t1));
      -[PKTiledView contentCoordinateSpaceTransform](self, "contentCoordinateSpaceTransform");
      v31 = *MEMORY[0x1E0C9D538];
      v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v16 = sqrt(t1.b * t1.b + t1.a * t1.a);
      y = -t1.ty;
      x = -t1.tx;
    }
  }
  else
  {
    x = -v48[0].tx;
    y = -v48[0].ty;
    v31 = *MEMORY[0x1E0C9D538];
    v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v16 = sqrt(v48[0].b * v48[0].b + v48[0].a * v48[0].a);
  }
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeTranslation(&v46, v31 - x, v33 - y);
  CGAffineTransformMakeScale(&v43, v16, v16);
  t1 = v48[1];
  t2 = v43;
  CGAffineTransformConcat(&v44, &t1, &t2);
  t1 = v44;
  t2 = v46;
  CGAffineTransformConcat(&v45, &t1, &t2);
  v39 = *(_OWORD *)&v45.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v45.a;
  *(_OWORD *)&a5->c = v39;
  *(_OWORD *)&a5->tx = *(_OWORD *)&v45.tx;
  CGAffineTransformMakeScale(&v44, v35, v35);
  v40 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t1.c = v40;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a5->tx;
  t2 = v44;
  CGAffineTransformConcat(&v45, &t1, &t2);
  v41 = *(_OWORD *)&v45.c;
  *(_OWORD *)&a4->a = *(_OWORD *)&v45.a;
  *(_OWORD *)&a4->c = v41;
  *(_OWORD *)&a4->tx = *(_OWORD *)&v45.tx;
  CGAffineTransformMakeTranslation(&t1, -x / v16, -y / v16);
  v42 = *(_OWORD *)&t1.c;
  *(_OWORD *)&a6->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&a6->c = v42;
  *(_OWORD *)&a6->tx = *(_OWORD *)&t1.tx;

}

- (id)canvasViewTouchView:(id)a3
{
  void *v4;

  -[PKTiledView liveAttachment](self, "liveAttachment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PKTiledView liveAttachment](self, "liveAttachment");
  else
    -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_hitAttachment:(CGPoint)a3
{
  return -[PKTiledView _hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "_hitAttachment:includeStandinAttachment:expandBottomAttachment:", 0, 1, a3.x, a3.y);
}

- (id)hitAttachment:(CGPoint)a3
{
  return -[PKTiledView hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", 0, 1, a3.x, a3.y);
}

- (id)_hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4
{
  return -[PKTiledView _hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "_hitAttachment:includeStandinAttachment:expandBottomAttachment:", a4, 1, a3.x, a3.y);
}

- (id)hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4
{
  return -[PKTiledView hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", a4, 1, a3.x, a3.y);
}

- (id)_hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4 expandBottomAttachment:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double y;
  double x;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  int v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v5 = a5;
  v6 = a4;
  y = a3.y;
  x = a3.x;
  v66 = *MEMORY[0x1E0C80C00];
  -[PKTiledView contentCoordinateSpace](self, "contentCoordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && -[PKTiledView disableTileRendering](self, "disableTileRendering"))
  {
    -[PKTiledView _visibleAttachments](self, "_visibleAttachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 == 1)
    {
      -[PKTiledView _visibleAttachments](self, "_visibleAttachments");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      return v14;
    }
  }
  else
  {

  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[PKTiledView _visibleAttachments](self, "_visibleAttachments", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (!v16)
  {

    if (!v6)
      goto LABEL_27;
    goto LABEL_23;
  }
  v17 = *(_QWORD *)v62;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v62 != v17)
        objc_enumerationMutation(v15);
      v19 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
      objc_msgSend(v19, "viewRep");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      if (v19 && (objc_msgSend(v19, "isAtEndOfDocument") & v5) == 1)
      {
        -[PKTiledView scrollView](self, "scrollView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "bounds");
        v31 = v30;

        v28 = v28 + v31;
      }
      objc_msgSend(v19, "viewRep");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "convertPoint:fromView:", self, x, y);
      v34 = v33;
      v36 = v35;

      if (objc_msgSend(v19, "hitByTouchLocation:bounds:", v34, v36, v22, v24, v26, v28))
      {
        v14 = v19;
        goto LABEL_19;
      }
    }
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v16)
      continue;
    break;
  }
  v14 = 0;
LABEL_19:

  if (!v14 && v6)
  {
LABEL_23:
    -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "attachmentContainerView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isHidden");

      if ((v40 & 1) == 0)
      {
        -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "bounds");
        v43 = v42;
        v45 = v44;
        v47 = v46;
        v49 = v48;

        -[PKTiledView scrollView](self, "scrollView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "bounds");
        v52 = v51;

        -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "convertPoint:fromView:", self, x, y);
        v55 = v54;
        v57 = v56;

        -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "hitByTouchLocation:bounds:", v55, v57, v43, v45, v47, v49 + v52);

        if (v59)
        {
          -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          return v14;
        }
      }
    }
LABEL_27:
    v14 = 0;
  }
  return v14;
}

- (id)hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4 expandBottomAttachment:(BOOL)a5
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[PKTiledView _hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "_hitAttachment:includeStandinAttachment:expandBottomAttachment:", a4, a5, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  PKDynamicCast(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)insertAttachmentIfInBlankSpace:(CGPoint)a3
{
  return 0;
}

- (BOOL)isReadOnlyView
{
  return self->_drawingPolicy == 0;
}

- (BOOL)isInNotesTextView
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if (v5)
  {
    -[PKTiledView superview](self, "superview");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v7, "superview");
        v8 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v8;
        if (!v8)
          goto LABEL_6;
      }

      LOBYTE(v6) = 1;
    }
  }
  else
  {
LABEL_6:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_setupPencilShadowViewIfNecessary
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[PKTiledView toolShadowShouldBeActive](self, "toolShadowShouldBeActive");
  -[PKTiledView window](self, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    +[PKPencilShadowView createShadowViewForSceneIfNecessary:](PKPencilShadowView, "createShadowViewForSceneIfNecessary:", v4);
  else
    +[PKPencilShadowView hideShadowViewForSceneIfNecessary:](PKPencilShadowView, "hideShadowViewForSceneIfNecessary:", v4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__411;
  v21 = __Block_byref_object_dispose__412;
  v22 = 0;
  -[PKTiledView subviews](self, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __33__PKTiledView_hitTest_withEvent___block_invoke;
  v12[3] = &unk_1E7777830;
  v15 = x;
  v16 = y;
  v14 = &v17;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v12);

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __33__PKTiledView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  objc_msgSend(a2, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(a2, "hitTest:withEvent:", *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    || ((v10 = *(void **)(*(_QWORD *)(a1 + 32) + 728), v10 == a2) ? (v11 = v10 == 0) : (v11 = 1), !v11))
  {
    *a4 = 1;
  }
}

- (id)_visibleTilesForAttachment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PKTiledView bounds](self, "bounds");
  -[PKTiledView _tilesForAttachment:bounds:invert:](self, "_tilesForAttachment:bounds:invert:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_tilesForAttachment:(id)a3 bounds:(CGRect)a4 invert:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  uint64_t v34;
  id v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  PKDynamicCast(v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v14;
  if (v14)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v14, "tiles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v39;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v16);
          v20 = *(double **)(*((_QWORD *)&v38 + 1) + 8 * v19);
          if (v20)
          {
            v22 = v20[27];
            v21 = v20[28];
            v23 = v20[29];
            v24 = v20[30];
          }
          else
          {
            v21 = 0.0;
            v23 = 0.0;
            v24 = 0.0;
            v22 = 0.0;
          }
          objc_msgSend(v11, "tileContainerView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTiledView convertRect:fromView:](self, "convertRect:fromView:", v25, v22, v21, v23, v24);
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v33 = v32;

          v44.origin.x = v27;
          v44.origin.y = v29;
          v44.size.width = v31;
          v44.size.height = v33;
          v45.origin.x = x;
          v45.origin.y = y;
          v45.size.width = width;
          v45.size.height = height;
          if (CGRectIntersectsRect(v44, v45) != v5)
            objc_msgSend(v12, "addObject:", v20);
          ++v19;
        }
        while (v17 != v19);
        v34 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        v17 = v34;
      }
      while (v34);
    }

    v35 = v12;
  }
  else
  {
    v35 = (id)MEMORY[0x1E0C9AA60];
  }

  return v35;
}

- (BOOL)_snapshottingDisabled
{
  char v2;
  void *v4;

  if ((*(_BYTE *)&self->_tiledViewFlags & 0x10) == 0)
    return 0;
  -[PKTiledView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "_canvasViewSnapshottingDisabled:", self);

  return v2;
}

- (void)_canvasViewWillCreateSnapshot
{
  id v3;

  if ((*(_BYTE *)&self->_tiledViewFlags & 8) != 0)
  {
    -[PKTiledView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_canvasViewWillCreateSnapshot:", self);

  }
}

- (void)setDisableTileRendering:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  UITouch *drawingTouchThatHitNothing;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  BYTE4(self->_refineAnimationController) = a3;
  if (a3 && self->_drawingTouchThatHitNothing)
  {
    -[PKTiledView cancelTileGenerationInvalidateTiles:](self, "cancelTileGenerationInvalidateTiles:", 1);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[PKTiledView attachmentViews](self, "attachmentViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v25 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v8, "tiles");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectEnumerator");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v21 != v12)
                  objc_enumerationMutation(v10);
                v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
                if (v14)
                {
                  v15 = (unint64_t *)(v14 + 16);
                  do
                    v16 = __ldaxr(v15);
                  while (__stlxr(v16 + 1, v15));
                }
                -[PKRendererTile purgeTileLayers](v14);
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v11);
          }

          objc_msgSend(v8, "tiles");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeAllObjects");

          objc_msgSend(v8, "purgedTiles");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeAllObjects");

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v5);
    }

    -[PKTileController teardown]((uint64_t)self->_drawingTouchThatHitNothing);
    drawingTouchThatHitNothing = self->_drawingTouchThatHitNothing;
    self->_drawingTouchThatHitNothing = 0;

  }
}

- (void)_finishCombiningStrokesIfNecessaryForAttachment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[PKTiledView canvasView](self, "canvasView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "_isCombiningStrokes"))
    {
LABEL_5:

      goto LABEL_6;
    }
    -[PKTiledView canvasView](self, "canvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_combineStrokesDrawingUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "drawing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      -[PKTiledView canvasView](self, "canvasView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_finishCombiningStrokesIfNecessary");
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)suspendWorkForDrawing
{
  -[PKTileController suspendPreviews]((uint64_t)self->_drawingTouchThatHitNothing);
}

- (void)resumeWorkAfterDrawing
{
  -[PKTileController resumePreviews]((uint64_t)self->_drawingTouchThatHitNothing);
  -[objc_class didEndDrawing](self->_defaultDrawingClass, "didEndDrawing");
}

- (void)renderAttachment:(id)a3 intoCanvas:(id)a4 showing:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double x;
  double y;
  CGFloat width;
  double height;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  void *v57;
  __int128 v58;
  _BOOL4 v59;
  void *v60;
  _BYTE *v61;
  _BOOL8 v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  const __CFString *v91;
  void *v92;
  char v93;
  CGFloat v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  Class defaultDrawingClass;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  __int128 v113;
  double sx;
  void *sxa;
  void *v116;
  __CFString *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  id v123;
  BOOL v124;
  void *v125;
  _QWORD v126[4];
  id v127;
  id v128;
  PKTiledView *v129;
  id v130[5];
  __int128 v131;
  __int128 v132;
  __int128 v133;
  BOOL v134;
  _OWORD v135[3];
  _OWORD v136[3];
  _QWORD v137[4];
  id v138;
  id v139;
  PKTiledView *v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t *v143;
  CATransform3D v144;
  CGAffineTransform m;
  CATransform3D v146;
  CGAffineTransform v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t (*v151)(uint64_t, uint64_t);
  void (*v152)(uint64_t);
  id v153;
  uint64_t v154;
  uint64_t *v155;
  uint64_t v156;
  __n128 (*v157)(uint64_t, uint64_t);
  uint64_t (*v158)();
  const char *v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _OWORD v163[3];
  _OWORD v164[3];
  _OWORD v165[3];
  id location;
  _QWORD v167[8];
  _QWORD v168[11];
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;

  v168[8] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PKTiledView currentDrawingBeingCopiedToCanvas]((id *)&self->super.super.super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v11)
  {
    -[PKTiledView _finishCombiningStrokesIfNecessaryForAttachment:](self, "_finishCombiningStrokesIfNecessaryForAttachment:", v8);
    -[PKTiledView _visibleTilesForAttachment:](self, "_visibleTilesForAttachment:", v8);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView canvasView](self, "canvasView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tileMaskView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v8, "tileMaskView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:fromView:", v22, v15, v17, v19, v21);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    if (v8)
    {
      if ((objc_msgSend(v8, "isAtEndOfDocument") & 1) != 0
        || (-[PKTiledView standInAttachmentView](self, "standInAttachmentView"),
            v31 = (id)objc_claimAutoreleasedReturnValue(),
            v31,
            v31 == v8))
      {
        -[PKTiledView scrollView](self, "scrollView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "bounds");
        v34 = v33;

        -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v30 = v30 + v34;

        if (v35 == v8)
        {
          -[PKTiledView scrollView](self, "scrollView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "bounds");
          v28 = v37;

        }
      }
    }
    -[PKTiledView bounds](self, "bounds");
    v173.origin.x = v38;
    v173.origin.y = v39;
    v173.size.width = v40;
    v173.size.height = v41;
    v169.origin.x = v24;
    v169.origin.y = v26;
    v169.size.width = v28;
    v169.size.height = v30;
    v170 = CGRectIntersection(v169, v173);
    x = v170.origin.x;
    y = v170.origin.y;
    width = v170.size.width;
    height = v170.size.height;
    -[PKTiledView bounds](self, "bounds");
    v47 = v46;
    -[PKTiledView _layerContentsScale](self, "_layerContentsScale");
    v49 = DKDMultiplyRectScalar(x, v47 - y - height, width, height, v48);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    -[PKTiledView suspendWorkForDrawing](self, "suspendWorkForDrawing");
    v124 = a5;
    objc_initWeak(&location, self);
    -[PKTiledView getAttachment:tileTransform:strokeTransform:paperTransform:](self, "getAttachment:tileTransform:strokeTransform:paperTransform:", v8, v165, v164, v163);
    if (self)
    {
      v56 = v164[1];
      *(_OWORD *)&self->_strokeTransformAtStartOfStroke.b = v164[0];
      *(_OWORD *)&self->_strokeTransformAtStartOfStroke.d = v56;
      *(_OWORD *)&self->_strokeTransformAtStartOfStroke.ty = v164[2];
    }
    objc_msgSend(v8, "drawing");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView setCurrentDrawingBeingCopiedToCanvas:]((id *)&self->super.super.super.isa, v57);

    v154 = 0;
    v155 = &v154;
    v156 = 0x6012000000;
    v157 = __Block_byref_object_copy__433;
    v158 = __Block_byref_object_dispose__434;
    v159 = "";
    v58 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v160 = *MEMORY[0x1E0C9BAA8];
    v161 = v58;
    v162 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v148 = 0;
    v149 = &v148;
    v150 = 0x3032000000;
    v151 = __Block_byref_object_copy__411;
    v152 = __Block_byref_object_dispose__412;
    v153 = 0;
    v59 = -[PKTiledView _sixChannelBlendingIsActive](self, "_sixChannelBlendingIsActive");
    if (v59 && !-[PKTiledView _snapshottingDisabled](self, "_snapshottingDisabled"))
    {
      -[PKTiledView _canvasViewWillCreateSnapshot](self, "_canvasViewWillCreateSnapshot");
      -[PKTiledView window](self, "window");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledView contentSnapshottingView](self, "contentSnapshottingView");
      v123 = (id)objc_claimAutoreleasedReturnValue();
      if (!v123)
        v123 = v119;
      -[PKTiledView canvasView](self, "canvasView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "_rendererController");
      v61 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v61)
        v62 = v61[489] != 0;
      else
        v62 = 0;

      +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
      v64 = v63;
      objc_msgSend(v123, "layer");
      v116 = v55;
      v65 = v51;
      v66 = v49;
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "bounds");
      sx = v64;
      v71 = DKDMultiplyRectScalar(v67, v68, v69, v70, v64);
      v171.origin.x = DKDRoundedRectForScale(v71, v72, v73, v74, 1.0);
      v75 = v171.origin.x;
      v76 = v171.origin.y;
      v77 = v171.size.width;
      v78 = v171.size.height;
      v79 = CGRectGetWidth(v171);
      v172.origin.x = v75;
      v172.origin.y = v76;
      v172.size.width = v77;
      v172.size.height = v78;
      v80 = CGRectGetHeight(v172);
      -[PKTiledView canvasView](self, "canvasView");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v81;
      v83 = 1.0;
      if (v80 >= 1.0)
        v84 = v80;
      else
        v84 = 1.0;
      if (v79 >= 1.0)
        v83 = v79;
      objc_msgSend(v81, "snapshotFramebufferWithSize:", v83, v84);
      v122 = objc_claimAutoreleasedReturnValue();

      v51 = v65;
      v55 = v116;
      v49 = v66;
      v85 = (void *)v122;
      if (v122 && *(_QWORD *)(v122 + 56))
      {
        v117 = (__CFString *)(id)*MEMORY[0x1E0CD30B0];
        -[PKTiledView window](self, "window");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "screen");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "displayConfiguration");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "name");
        v120 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v120)
        {
          objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "name");
          v90 = objc_claimAutoreleasedReturnValue();

          v91 = CFSTR("LCD");
          if (v90)
            v91 = (const __CFString *)v90;
          v120 = (void *)v91;
        }
        -[PKTiledView window](self, "window");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "windowScene");
        v118 = (void *)objc_claimAutoreleasedReturnValue();

        v93 = objc_opt_respondsToSelector();
        v94 = sx;
        if ((v93 & 1) != 0)
        {
          objc_msgSend(v118, "renderingEnvironment", sx);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v95, "systemDisplayIdentifier");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            if (v96)
            {

              v97 = v96;
              v117 = CFSTR("systemIdentifier");
              v120 = v97;
            }

          }
          v94 = sx;
        }
        memset(&v147, 0, sizeof(v147));
        CGAffineTransformMakeScale(&v147, v94, v94);
        m = v147;
        memset(&v146, 0, sizeof(v146));
        CATransform3DMakeAffineTransform(&v146, &m);
        v98 = *MEMORY[0x1E0CD3110];
        v167[0] = *MEMORY[0x1E0CD30F0];
        v167[1] = v117;
        v168[0] = v98;
        v168[1] = v120;
        v99 = *MEMORY[0x1E0CD30A8];
        v168[2] = *(_QWORD *)(v122 + 56);
        v100 = *MEMORY[0x1E0CD3140];
        v167[2] = v99;
        v167[3] = v100;
        v144 = v146;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v144);
        sxa = (void *)objc_claimAutoreleasedReturnValue();
        v168[3] = sxa;
        v167[4] = *MEMORY[0x1E0CD3098];
        v101 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v121, "context");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "numberWithUnsignedInt:", objc_msgSend(v102, "contextId"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v168[4] = v103;
        v167[5] = *MEMORY[0x1E0CD30E8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v121);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v168[5] = v104;
        v167[6] = *MEMORY[0x1E0CD30D0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v62);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v167[7] = *MEMORY[0x1E0CD30C8];
        v168[6] = v105;
        v168[7] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v167, 8);
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        defaultDrawingClass = self->_defaultDrawingClass;
        v137[0] = MEMORY[0x1E0C809B0];
        v137[1] = 3221225472;
        v137[2] = __51__PKTiledView_renderAttachment_intoCanvas_showing___block_invoke;
        v137[3] = &unk_1E7777858;
        v138 = v106;
        v139 = v123;
        v140 = self;
        v142 = &v154;
        v143 = &v148;
        v141 = v122;
        v108 = v106;
        -[objc_class avoidSnapshot:](defaultDrawingClass, "avoidSnapshot:", v137);

        v85 = (void *)v122;
      }

    }
    -[PKTiledView canvasView](self, "canvasView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "drawing");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
      v111 = (void *)MEMORY[0x1E0C9AA60];
    else
      v111 = v125;
    v136[1] = v165[1];
    v136[2] = v165[2];
    v112 = v149[5];
    v113 = *((_OWORD *)v155 + 4);
    v135[0] = *((_OWORD *)v155 + 3);
    v135[1] = v113;
    v135[2] = *((_OWORD *)v155 + 5);
    v136[0] = v165[0];
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __51__PKTiledView_renderAttachment_intoCanvas_showing___block_invoke_449;
    v126[3] = &unk_1E7777880;
    v127 = v9;
    v130[1] = *(id *)&v49;
    v130[2] = v51;
    v130[3] = v53;
    v130[4] = v55;
    v131 = v163[0];
    v132 = v163[1];
    v133 = v163[2];
    objc_copyWeak(v130, &location);
    v134 = v124;
    v128 = v8;
    v129 = self;
    objc_msgSend(v109, "_setDrawing:tiles:tileTransform:snapshotTexture:snapshotTextureTransform:completionBlock:", v110, v111, v136, v112, v135, v126);

    objc_destroyWeak(v130);
    _Block_object_dispose(&v148, 8);

    _Block_object_dispose(&v154, 8);
    objc_destroyWeak(&location);

  }
}

- (id)currentDrawingBeingCopiedToCanvas
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 93);
  return WeakRetained;
}

void __51__PKTiledView_renderAttachment_intoCanvas_showing___block_invoke(uint64_t a1)
{
  NSObject *v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  _OWORD *v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;

  v2 = os_log_create("com.apple.pencilkit", "Tiles");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Snapshot", buf, 2u);
  }

  if (CARenderServerSnapshot())
  {
    objc_msgSend(*(id *)(a1 + 40), "bounds");
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "bounds");
    objc_msgSend(*(id *)(a1 + 48), "convertRect:fromView:", *(_QWORD *)(a1 + 40), 0.0, 0.0, v4);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 48), "bounds");
    DKDNormalizedSubrectInRect(v6, v8, v10, v12);
    +[PKMetalUtility transformConvertingRect:toRect:percent:](PKMetalUtility, "transformConvertingRect:toRect:percent:", 0x3FF0000000000000);
    v13 = *(_OWORD **)(*(_QWORD *)(a1 + 64) + 8);
    v14 = v18;
    v13[3] = *(_OWORD *)buf;
    v13[4] = v14;
    v13[5] = v19;
    v15 = *(_QWORD *)(a1 + 56);
    if (v15)
      v16 = *(void **)(v15 + 24);
    else
      v16 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v16);
  }
}

void __51__PKTiledView_renderAttachment_intoCanvas_showing___block_invoke_449(uint64_t a1)
{
  __int128 v2;
  _BYTE *WeakRetained;
  _BYTE *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat MidX;
  CGFloat MidY;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  _OWORD v41[3];
  CGAffineTransform v42;
  _OWORD v43[3];
  CGRect v44;
  CGRect v45;

  objc_msgSend(*(id *)(a1 + 32), "setViewScissor:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v2 = *(_OWORD *)(a1 + 112);
  v43[0] = *(_OWORD *)(a1 + 96);
  v43[1] = v2;
  v43[2] = *(_OWORD *)(a1 + 128);
  objc_msgSend(*(id *)(a1 + 32), "setPaperTransform:", v43);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (*(_BYTE *)(a1 + 144))
  {
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "canvasView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "wantsCanvasVisible");

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        objc_msgSend(*(id *)(a1 + 40), "drawing");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "attachmentForUUID:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(*(id *)(a1 + 48), "_sixChannelBlendingIsActive")
          || objc_msgSend(*(id *)(a1 + 32), "hasSnapshot"))
        {
          objc_msgSend(v9, "setContentHidden:", 1);
        }
        if (objc_msgSend(v4, "canvasViewZOrderPolicy") == 2)
        {
          v10 = *(void **)(a1 + 32);
          objc_msgSend(v10, "bounds");
          v12 = v11;
          v14 = v13;
          v16 = v15;
          v18 = v17;
          objc_msgSend(v9, "superview");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "convertRect:toView:", v19, v12, v14, v16, v18);
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;

          objc_msgSend(*(id *)(a1 + 32), "frame");
          objc_msgSend(*(id *)(a1 + 32), "bounds", DKDTransformConvertingRectToRectAtPercent((uint64_t)v41, v28, v29, v30, v31, v21, v23, v25, v27, 1.0));
          MidX = CGRectGetMidX(v44);
          objc_msgSend(*(id *)(a1 + 32), "bounds");
          MidY = CGRectGetMidY(v45);
          CGAffineTransformMakeTranslation(&v40, MidX, MidY);
          DKDTransformInTransformSpace(v41, &v40, &v42);
          v34 = *(void **)(a1 + 32);
          v39 = v42;
          objc_msgSend(v34, "setTransform:", &v39);
          objc_msgSend(v9, "superview");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "insertSubview:aboveSubview:", *(_QWORD *)(a1 + 32), v9);

          objc_msgSend(v4, "topZAttachment");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setIsUnderBlendedContent:", v9 != v36);

        }
        v37 = objc_msgSend(*(id *)(a1 + 32), "isHidden");
        objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
        if (v37 && (v4[448] & 0x20) != 0)
        {
          objc_msgSend(v4, "delegate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "canvasView:didChangeHiddenState:", v4, 0);

        }
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        kdebug_trace();

      }
    }
  }
  -[PKTiledView setCurrentDrawingBeingCopiedToCanvas:]((id *)v4, 0);

}

- (void)_copyFromCanvas:(id)a3 intoAttachment:(id)a4 hideCanvas:(BOOL)a5 strokes:(id)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  BOOL v25;
  const char *v26;
  id Property;
  id v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  uint64_t v61;
  unint64_t *v62;
  unint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void (**v80)(_QWORD);
  uint64_t *v81;
  id v82;
  void *v83;
  void *v84;
  char v85;
  id v86;
  _BOOL4 v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  _QWORD v93[4];
  void (**v94)(_QWORD);
  _QWORD aBlock[4];
  id v96;
  id v97;
  id v98;
  id v99;
  PKTiledView *v100;
  id v101;
  id v102;
  id v103;
  char v104;
  BOOL v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint8_t buf[16];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[48];
  _BYTE v132[48];
  _BYTE v133[48];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;

  v87 = a5;
  v140 = *MEMORY[0x1E0C80C00];
  v82 = a3;
  v89 = a4;
  v90 = a6;
  objc_msgSend(v89, "drawing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "strokes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v84 = v10;
  -[PKTiledView _visibleTilesForAttachment:](self, "_visibleTilesForAttachment:", v89);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  objc_msgSend(v90, "reverseObjectEnumerator");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v128;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v128 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * i);
        objc_msgSend(v11, "lastObject", v82);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v17, "isEqual:", v16);

        if (!(_DWORD)v16)
        {
          v31 = os_log_create("com.apple.pencilkit", "Sketching");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v32 = "Unexpected stroke in expectedTileStrokes";
LABEL_28:
            _os_log_impl(&dword_1BE213000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
          }
LABEL_29:

          goto LABEL_30;
        }
        objc_msgSend(v11, "removeLastObject");
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
      if (v13)
        continue;
      break;
    }
  }

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v12 = v91;
  v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v123;
LABEL_11:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v123 != v20)
        objc_enumerationMutation(v12);
      v22 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v21);
      v23 = v22 ? objc_getProperty(*(id *)(*((_QWORD *)&v122 + 1) + 8 * v21), v18, 136, 1) : 0;
      v24 = v23;
      v25 = v24 == 0;

      if (v25)
        break;
      if (v22)
        Property = objc_getProperty(v22, v26, 136, 1);
      else
        Property = 0;
      v28 = Property;
      v29 = objc_msgSend(v28, "isEqualToArray:", v11);

      if ((v29 & 1) == 0)
      {
        v31 = os_log_create("com.apple.pencilkit", "Sketching");
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
        *(_WORD *)buf = 0;
        v32 = "Detected a tile with unexpected strokes";
        goto LABEL_28;
      }
      if (v19 == ++v21)
      {
        v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
        v19 = v30;
        if (v30)
          goto LABEL_11;
        goto LABEL_25;
      }
    }
LABEL_30:
    v85 = 1;
  }
  else
  {
LABEL_25:
    v85 = 0;
  }

  -[PKTiledView scrollView](self, "scrollView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "contentOffset");
  -[PKTiledView getAttachment:tileTransform:strokeTransform:paperTransform:scrollViewContentOffset:](self, "getAttachment:tileTransform:strokeTransform:paperTransform:scrollViewContentOffset:", v89, v133, v132, v131);

  if (v87)
    -[PKTiledView setLiveAttachment:]((uint64_t)self, 0);
  if (objc_msgSend(v90, "count", v82))
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v38 = v90;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v119;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v119 != v40)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * j), "renderBounds");
          v143.origin.x = v42;
          v143.origin.y = v43;
          v143.size.width = v44;
          v143.size.height = v45;
          v141.origin.x = x;
          v141.origin.y = y;
          v141.size.width = width;
          v141.size.height = height;
          v142 = CGRectUnion(v141, v143);
          x = v142.origin.x;
          y = v142.origin.y;
          width = v142.size.width;
          height = v142.size.height;
        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
      }
      while (v39);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v91, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v47 = v91;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v114, v136, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v115;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v115 != v49)
            objc_enumerationMutation(v47);
          v51 = *(_QWORD **)(*((_QWORD *)&v114 + 1) + 8 * v50);
          if (v51)
          {
            v52 = v51[23];
            v53 = v51[24];
            v54 = v51[25];
            v55 = v51[26];
          }
          else
          {
            v53 = 0;
            v54 = 0;
            v55 = 0;
            v52 = 0;
          }
          v144.origin.x = x;
          v144.origin.y = y;
          v144.size.width = width;
          v144.size.height = height;
          if (CGRectIntersectsRect(*(CGRect *)&v52, v144))
            objc_msgSend(v46, "addObject:", v51);
          ++v50;
        }
        while (v48 != v50);
        v56 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v114, v136, 16);
        v48 = v56;
      }
      while (v56);
    }

  }
  else
  {
    v46 = 0;
    v85 = 1;
  }
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v57 = v46;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v110, v135, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v111;
    do
    {
      for (k = 0; k != v58; ++k)
      {
        if (*(_QWORD *)v111 != v59)
          objc_enumerationMutation(v57);
        v61 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * k);
        if (v61)
        {
          v62 = (unint64_t *)(v61 + 16);
          do
            v63 = __ldaxr(v62);
          while (__stlxr(v63 + 1, v62));
        }
      }
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v110, v135, 16);
    }
    while (v58);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v91, "count"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v65 = v91;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v106, v134, 16);
  if (v66)
  {
    v67 = *(_QWORD *)v107;
    do
    {
      v68 = 0;
      do
      {
        if (*(_QWORD *)v107 != v67)
          objc_enumerationMutation(v65);
        v69 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * v68);
        if (v69)
          v70 = atomic_load((unint64_t *)(v69 + 16));
        else
          v70 = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69)
          v72 = *(void **)(v69 + 120);
        else
          v72 = 0;
        v73 = v72;
        objc_msgSend(v64, "setObject:forKeyedSubscript:", v71, v73);

        ++v68;
      }
      while (v66 != v68);
      v74 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v106, v134, 16);
      v66 = v74;
    }
    while (v74);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke;
  aBlock[3] = &unk_1E77778A8;
  v75 = v57;
  v96 = v75;
  v76 = v64;
  v97 = v76;
  v77 = v65;
  v98 = v77;
  v104 = v85;
  v78 = v84;
  v105 = v87;
  v99 = v78;
  v100 = self;
  v86 = v83;
  v101 = v86;
  v88 = v89;
  v102 = v88;
  v79 = v90;
  v103 = v79;
  v80 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v75, "count") && !-[PKTiledView disableTileRendering](self, "disableTileRendering"))
  {
    -[PKTiledView tileController](self, "tileController");
    v81 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke_451;
    v93[3] = &unk_1E7776F60;
    v94 = v80;
    if (v81)
      -[PKMetalRendererController updateTiles:withNewStrokes:completionBlock:](v81[3], v75, v79, v93);

  }
  else
  {
    v80[2](v80);
  }

}

void __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  id v14;
  char v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  id *v37;
  int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  int v46;
  _QWORD v47[4];
  NSObject *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  int v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v54;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v54 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v5);
        if (v6)
        {
          v7 = atomic_load((unint64_t *)(v6 + 16));
          v8 = *(void **)(v6 + 120);
        }
        else
        {
          v7 = 0;
          v8 = 0;
        }
        v9 = *(void **)(a1 + 40);
        v10 = v8;
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v7 == objc_msgSend(v11, "unsignedIntegerValue");

        if (v12)
          -[PKRendererTile updateDisableTransactionActions:reloadContents:](v6, 1, 1);
        ++v5;
      }
      while (v3 != v5);
      v13 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      v3 = v13;
    }
    while (v13);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v14 = *(id *)(a1 + 48);
  v15 = 0;
  v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v50;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v14);
        v20 = *(unint64_t **)(*((_QWORD *)&v49 + 1) + 8 * v19);
        if (*(_BYTE *)(a1 + 96))
        {
          v21 = 0;
          if (v20)
            goto LABEL_26;
        }
        else
        {
          if (v20)
          {
            v22 = atomic_load(v20 + 2);
            v23 = (void *)v20[15];
          }
          else
          {
            v22 = 0;
            v23 = 0;
          }
          v24 = *(void **)(a1 + 40);
          v25 = v23;
          objc_msgSend(v24, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v22 == objc_msgSend(v26, "unsignedIntegerValue");

          if (v27)
          {
            v21 = *(void **)(a1 + 56);
            if (!v20)
              goto LABEL_27;
LABEL_26:
            objc_setProperty_atomic_copy(v20, v16, v21, 136);
            goto LABEL_27;
          }
          v15 = 1;
        }
LABEL_27:
        ++v19;
      }
      while (v17 != v19);
      v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      v17 = v28;
    }
    while (v28);
  }

  if (*(_BYTE *)(a1 + 97))
  {
    objc_msgSend(*(id *)(a1 + 64), "liveAttachment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      kdebug_trace();
      objc_msgSend(*(id *)(a1 + 64), "_hideCanvas");
      v35 = (void *)MEMORY[0x1E0CD28B0];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke_450;
      v47[3] = &unk_1E7776F38;
      v48 = *(id *)(a1 + 72);
      objc_msgSend(v35, "setCompletionBlock:", v47);
      v31 = v48;
    }
    else
    {
      v31 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE213000, v31, OS_LOG_TYPE_DEBUG, "Skipped hiding canvas because a new stroke started", buf, 2u);
      }
    }
    goto LABEL_41;
  }
  objc_msgSend(*(id *)(a1 + 72), "drawing");
  v31 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 80), "drawing");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v31 != v32)
  {

    goto LABEL_38;
  }
  -[PKTiledView currentDrawingBeingCopiedToCanvas](*(id **)(a1 + 64));
  v41 = objc_claimAutoreleasedReturnValue();
  if (!v41)
  {

LABEL_41:
    goto LABEL_42;
  }
  v42 = (void *)v41;
  -[PKTiledView currentDrawingBeingCopiedToCanvas](*(id **)(a1 + 64));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 80), "drawing");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v43 == v44;

  if (!v45)
  {
LABEL_38:
    v33 = objc_opt_class();
    PKDynamicCast(v33, *(void **)(a1 + 80));
    v34 = objc_claimAutoreleasedReturnValue();
    v31 = v34;
    if (v34)
      -[NSObject setContentHidden:](v34, "setContentHidden:", 0);
    goto LABEL_41;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if ((*(_BYTE *)(a1 + 96) != 0) | v15 & 1)
  {
    v36 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v46 = *(unsigned __int8 *)(a1 + 96);
      *(_DWORD *)buf = 67109376;
      v58 = v46;
      v59 = 1024;
      v60 = v15 & 1;
      _os_log_debug_impl(&dword_1BE213000, v36, OS_LOG_TYPE_DEBUG, "Updating tiles after copyFromCanvas: %d, %d", buf, 0xEu);
    }

    objc_msgSend(*(id *)(a1 + 64), "updateTilesForVisibleRect");
  }
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    objc_msgSend(*(id *)(a1 + 64), "selectionController");
    v37 = (id *)objc_claimAutoreleasedReturnValue();
    v38 = -[PKSelectionController hasStrokesOrElementsSelection](v37);

    if (v38)
    {
      objc_msgSend(*(id *)(a1 + 64), "selectionController");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v39;
      if (v39)
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v39, 1, 0);

    }
  }
}

uint64_t __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke_450(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishHideCanvasTransaction");
}

void __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke_451(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (BOOL)_shouldUpdateHeightOfAttachments
{
  return 0;
}

- (BOOL)_shouldPreventScrollViewPanGestureWhilePreviewing
{
  return 0;
}

- (BOOL)_updateHeightOfAttachmentIfNecessary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  char v9;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double MaxY;
  NSObject *v32;
  double rect;
  uint8_t buf[16];
  CGRect v35;
  CGRect v36;

  v4 = a3;
  if (-[PKTiledView _shouldUpdateHeightOfAttachments](self, "_shouldUpdateHeightOfAttachments"))
  {
    objc_msgSend(v4, "drawing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    PKDynamicCast(v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "_isEmpty");
    if (v7)
      v9 = v8;
    else
      v9 = 1;
    if ((v9 & 1) != 0)
    {
LABEL_6:
      v10 = 0;
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v7, "drawing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heightFromDrawing:delta:", v11, 10.0);
    v13 = v12;

    objc_msgSend(v7, "bounds");
    if (v13 <= v14)
    {
      objc_msgSend(v5, "bounds");
      rect = v16;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      objc_msgSend(v5, "_canvasBounds");
      v27 = v26;
      v28 = v23;
      v10 = 0;
      if (fabs(v26) == INFINITY)
        goto LABEL_10;
      if (fabs(v23) == INFINITY)
        goto LABEL_10;
      v29 = v24;
      v10 = 0;
      if (fabs(v24) == INFINITY)
        goto LABEL_10;
      v30 = v25;
      if (fabs(v25) == INFINITY)
        goto LABEL_10;
      v10 = 0;
      if (fabs(v18) == INFINITY)
        goto LABEL_10;
      if (fabs(v20) == INFINITY)
        goto LABEL_10;
      v10 = 0;
      if (fabs(v22) == INFINITY || fabs(rect) == INFINITY)
        goto LABEL_10;
      v35.origin.x = v18;
      v35.origin.y = v20;
      v35.size.width = v22;
      v35.size.height = rect;
      MaxY = CGRectGetMaxY(v35);
      v36.origin.x = v27;
      v36.origin.y = v28;
      v36.size.width = v29;
      v36.size.height = v30;
      if (MaxY <= CGRectGetMaxY(v36))
        goto LABEL_6;
      v32 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE213000, v32, OS_LOG_TYPE_DEBUG, "Detected a drawing that will be clipped at the bottom", buf, 2u);
      }

    }
    objc_msgSend(v7, "updateDrawingHeight:", v13);
    v10 = 1;
    goto LABEL_10;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_transientlyUpdateHeightOfAttachment:(id)a3 delta:(double)a4
{
  void *v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "drawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_isEmpty") & 1) != 0)
  {

  }
  else
  {
    v7 = -[PKTiledView _shouldUpdateHeightOfAttachments](self, "_shouldUpdateHeightOfAttachments");

    if (v7)
    {
      objc_msgSend(v11, "drawing");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "heightFromDrawing:delta:", v8, a4 + 10.0);
      v10 = v9;

      objc_msgSend(v11, "updateDrawingHeight:notifyDrawingDidChange:", 0, v10);
    }
  }

}

- (void)cancelTileGenerationInvalidateTiles:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v3 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.pencilkit", "Tiles");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEBUG, "cancel tile generation", buf, 2u);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v9);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v10, "tiles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectEnumerator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v34;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v34 != v15)
                objc_enumerationMutation(v12);
              v17 = *(unint64_t **)(*((_QWORD *)&v33 + 1) + 8 * v16);
              if (v17)
              {
                v18 = v17 + 2;
                do
                  v19 = __ldaxr(v18);
                while (__stlxr(v19 + 1, v18));
                if (v3)
                  objc_setProperty_atomic_copy(v17, v13, 0, 136);
              }
              ++v16;
            }
            while (v16 != v14);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          }
          while (v14);
        }

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v10, "offscreenTiles", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectEnumerator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v30;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v30 != v23)
                objc_enumerationMutation(v21);
              v25 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24);
              if (v25)
              {
                v26 = (unint64_t *)(v25 + 16);
                do
                  v27 = __ldaxr(v26);
                while (__stlxr(v27 + 1, v26));
              }
              -[PKRendererTile purgeTileLayers](v25);
              ++v24;
            }
            while (v24 != v22);
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
          }
          while (v22);
        }

        objc_msgSend(v10, "offscreenTiles");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeAllObjects");

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

}

- (void)updateTilesForVisibleRectForceIfZooming:(BOOL)a3
{
  if (a3 || !-[PKTiledView _isZoomingOrResizing](self, "_isZoomingOrResizing"))
    -[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:](self, "updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:", 1, 0, 0);
}

- (void)swapOffscreenCallback:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void (**v15)(void);
  id obj;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v15 = (void (**)(void))a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  if (self && LOBYTE(self->_refineAnimationController))
    -[PKTiledView _pauseHoverPreviewForTimeInterval:](self, "_pauseHoverPreviewForTimeInterval:", 0.0);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews", self);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        v9 = os_log_create("com.apple.pencilkit", "Tiles");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "offscreenTiles");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");
          *(_DWORD *)buf = 134217984;
          v27 = v13;
          _os_log_debug_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEBUG, "swap offscreen tiles %ld", buf, 0xCu);

        }
        objc_msgSend(v8, "offscreenTiles");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v6;
        v17[1] = 3221225472;
        v17[2] = __37__PKTiledView_swapOffscreenCallback___block_invoke;
        v17[3] = &unk_1E77778D0;
        v17[4] = v8;
        v17[5] = &v22;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);

        objc_msgSend(v8, "offscreenTiles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeAllObjects");

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v4);
  }

  if (v15)
    v15[2]();
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (*((_BYTE *)v23 + 24))
    objc_msgSend(v14, "updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:", 1, 0, 0);
  _Block_object_dispose(&v22, 8);

}

void __37__PKTiledView_swapOffscreenCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  unint64_t *v12;
  unint64_t v13;
  int v14;
  id *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)v6;
  if (v6)
  {
    if (*((double *)v6 + 20) == 1.0)
    {
      v6[84] = 0;
      objc_msgSend(*((id *)v6 + 11), "setHidden:", 0);
      objc_msgSend(v7[12], "setHidden:", 0);
      objc_msgSend(*(id *)(a1 + 32), "tiles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v5);
      v9 = objc_claimAutoreleasedReturnValue();

      if (v9)
        -[PKRendererTile purgeTileLayers]((uint64_t)v9);
      objc_msgSend(*(id *)(a1 + 32), "tiles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v5);

      v11 = os_log_create("com.apple.pencilkit", "Tiles");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v14 = 138412290;
        v15 = v7;
        _os_log_debug_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEBUG, "show tile %@", (uint8_t *)&v14, 0xCu);
      }

      goto LABEL_12;
    }
    v12 = (unint64_t *)(v6 + 16);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 + 1, v12));
  }
  -[PKRendererTile purgeTileLayers]((uint64_t)v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v9 = os_log_create("com.apple.pencilkit", "Tiles");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_debug_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEBUG, "purge %@", (uint8_t *)&v14, 0xCu);
  }
LABEL_12:

}

- (void)updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:(id)a3 withCallback:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  PKTiledView *v18;
  void (**v19)(_QWORD);
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[PKTiledView _isZoomingOrResizing](self, "_isZoomingOrResizing"))
  {
    if (v6)
    {
      v8 = os_log_create("com.apple.pencilkit", "Tiles");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEBUG, "zooming/resizing - requeuing tiles", buf, 2u);
      }

      v9 = dispatch_time(0, 50000000);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __88__PKTiledView_updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes_withCallback___block_invoke_453;
      v13[3] = &unk_1E77773F0;
      v13[4] = self;
      v14 = v6;
      v15 = v7;
      dispatch_after(v9, MEMORY[0x1E0C80D38], v13);

    }
    else
    {
      v7[2](v7);
    }
  }
  else
  {
    v10 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[PKTiledView canvasView](self, "canvasView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      v21 = objc_msgSend(v12, "isHidden");
      _os_log_debug_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEBUG, "updateTilesForVisibleRectRendering canvasVisible:%d", buf, 8u);

    }
    -[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:](self, "updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:", 1, 1, v6);
    -[PKTiledView tileController](self, "tileController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__PKTiledView_updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes_withCallback___block_invoke;
    v16[3] = &unk_1E77773F0;
    v17 = v6;
    v18 = self;
    v19 = v7;
    -[PKTileController callbackAfterTileGeneration:]((uint64_t)v11, v16);

  }
}

uint64_t __88__PKTiledView_updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes_withCallback___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v12;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "swapOffscreenCallback:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v15;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(a1 + 40), "attachmentForUUID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "offscreenTiles");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "count") == 0;

          if (v10)
          {

            goto LABEL_14;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          continue;
        break;
      }
    }

    return objc_msgSend(*(id *)(a1 + 40), "swapOffscreenCallback:", *(_QWORD *)(a1 + 48));
  }
LABEL_14:
  v12 = os_log_create("com.apple.pencilkit", "Tiles");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_debug_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEBUG, "offscreen cancelled - requeuing tiles", v13, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:withCallback:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

uint64_t __88__PKTiledView_updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes_withCallback___block_invoke_453(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:withCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)tileIsVisibleForOffset:(CGPoint)a3 inAttachment:(id)a4 distanceToMiddle:(double *)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  PKTiledGestureView *gestureView;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double MidY;
  double v49;
  CGFloat v50;
  BOOL v51;
  double MidX;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  -[PKTiledView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  if (self)
    gestureView = self->_gestureView;
  else
    gestureView = 0;
  v20 = +[PKRendererTile layerFrameForLevel:offset:](x, y, (uint64_t)PKRendererTile, (uint64_t)gestureView);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v9, "tileContainerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewRep");
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "convertRect:toView:", v28, v20, v22, v24, v26);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  objc_msgSend(v9, "tileContainerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bounds");
  v60.origin.x = v30;
  v60.origin.y = v32;
  v60.size.width = v34;
  v60.size.height = v36;
  LOBYTE(v28) = CGRectIntersectsRect(v54, v60);

  if ((v28 & 1) == 0)
    goto LABEL_8;
  objc_msgSend(v9, "viewRep");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView scrollView](self, "scrollView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "convertRect:toView:", v39, v30, v32, v34, v36);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;

  v55.origin.x = v12;
  v55.origin.y = v14;
  v55.size.width = v16;
  v55.size.height = v18;
  v61.origin.x = v41;
  v61.origin.y = v43;
  v61.size.width = v45;
  v61.size.height = v47;
  if (CGRectIntersectsRect(v55, v61))
  {
    if (a5)
    {
      v56.origin.x = v12;
      v56.origin.y = v14;
      v56.size.width = v16;
      v56.size.height = v18;
      MidX = CGRectGetMidX(v56);
      v57.origin.x = v12;
      v57.origin.y = v14;
      v57.size.width = v16;
      v57.size.height = v18;
      MidY = CGRectGetMidY(v57);
      v58.origin.x = v41;
      v58.origin.y = v43;
      v58.size.width = v45;
      v58.size.height = v47;
      v49 = CGRectGetMidX(v58);
      v59.origin.x = v41;
      v59.origin.y = v43;
      v59.size.width = v45;
      v59.size.height = v47;
      v50 = CGRectGetMidY(v59);
      *a5 = (MidY - v50) * (MidY - v50) + (MidX - v49) * (MidX - v49);
    }
    v51 = 1;
  }
  else
  {
LABEL_8:
    v51 = 0;
  }

  return v51;
}

- (void)updateExistingTiles:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PKRendererTileProperties *v19;
  double b;
  double a;
  double c;
  double d;
  void *v24;
  _BOOL4 v25;
  void *v26;
  id v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;

  v3 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  -[PKTiledView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v38;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v32);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v13, "tiles");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allValues");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v34;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v34 != v17)
                objc_enumerationMutation(v15);
              v19 = *(PKRendererTileProperties **)(*((_QWORD *)&v33 + 1) + 8 * v18);
              if (!v3)
                goto LABEL_15;
              if (v19)
              {
                a = v19[2]._drawingTransform.a;
                b = v19[2]._drawingTransform.b;
                c = v19[2]._drawingTransform.c;
                d = v19[2]._drawingTransform.d;
              }
              else
              {
                b = 0.0;
                c = 0.0;
                d = 0.0;
                a = 0.0;
              }
              objc_msgSend(v13, "tileContainerView");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKTiledView convertRect:fromView:](self, "convertRect:fromView:", v24, a, b, c, d);
              v45.origin.x = v6;
              v45.origin.y = v8;
              v45.size.width = v10;
              v45.size.height = v12;
              v25 = CGRectIntersectsRect(v44, v45);

              if (v25)
              {
LABEL_15:
                -[PKRendererTile properties](v19);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "offset");
                v27 = -[PKTiledView generateTile:inAttachment:rendering:offscreen:overrideAdditionalStrokes:](self, "generateTile:inAttachment:rendering:offscreen:overrideAdditionalStrokes:", v13, 1, 0, 0);

              }
              ++v18;
            }
            while (v16 != v18);
            v28 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            v16 = v28;
          }
          while (v28);
        }

        ++v32;
      }
      while (v32 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v31);
  }

}

- (void)updateTilesForVisibleRectRendering:(BOOL)a3 offscreen:(BOOL)a4 overrideAdditionalStrokes:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id updateVisibleTilesAfterZoomOutBlock;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  char v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  double *i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v47;
  id v48;
  _OWORD v49[3];
  _OWORD v50[3];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  double *v62;
  double *v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v5 = a4;
  v6 = a3;
  v66 = *MEMORY[0x1E0C80C00];
  v48 = a5;
  updateVisibleTilesAfterZoomOutBlock = self->_updateVisibleTilesAfterZoomOutBlock;
  if (updateVisibleTilesAfterZoomOutBlock)
  {
    dispatch_block_cancel(updateVisibleTilesAfterZoomOutBlock);
    v9 = self->_updateVisibleTilesAfterZoomOutBlock;
    self->_updateVisibleTilesAfterZoomOutBlock = 0;

  }
  -[PKTiledView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "zoomScale");
  v12 = v11;

  if (self->_tileScale >= 1.0)
  {
    -[PKTiledView frame](self, "frame");
    if (v14 != 0.0 && v13 != 0.0)
    {
      -[PKTiledView frame](self, "frame");
      if (fabs(v18) != INFINITY && fabs(v15) != INFINITY && fabs(v16) != INFINITY && fabs(v17) != INFINITY)
      {
        v19 = -[PKTiledView disableTileRendering](self, "disableTileRendering");
        v20 = v12 == 0.0 || v19;
        if ((v20 & 1) == 0 && *(double *)&self->_tileLevel != 0.0)
        {
          -[PKTiledView visibleAttachments](self, "visibleAttachments");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTiledView getVisibleTiles:](self, "getVisibleTiles:", v21);

          v22 = 126 - 2 * __clz(((char *)v63 - (char *)v62) >> 5);
          if (v63 == v62)
            v23 = 0;
          else
            v23 = v22;
          std::__introsort<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *,false>((uint64_t)v62, v63, v23, 1);
          for (i = v62; i != v63; i += 4)
          {
            v25 = objc_opt_class();
            PKDynamicCast(v25, *(void **)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v26)
              objc_msgSend(v26, "clearTileDrawingTransform");
            objc_msgSend(v27, "drawing");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "uuid");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = -[PKTiledView generateTile:inAttachment:rendering:offscreen:overrideAdditionalStrokes:](self, "generateTile:inAttachment:rendering:offscreen:overrideAdditionalStrokes:", *(_QWORD *)i, v6, v5, v30, i[1], i[2]);
          }
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          -[PKTiledView attachmentViews](self, "attachmentViews");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
          if (v33)
          {
            obj = v32;
            v47 = *(_QWORD *)v59;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v59 != v47)
                  objc_enumerationMutation(obj);
                v35 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
                v56 = 0u;
                v57 = 0u;
                v55 = 0u;
                if (v35)
                  objc_msgSend(v35, "drawingTransform");
                v53 = 0u;
                v54 = 0u;
                v51 = 0u;
                v52 = 0u;
                objc_msgSend(v35, "tiles");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "allKeys");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
                if (v38)
                {
                  v39 = *(_QWORD *)v52;
                  do
                  {
                    for (k = 0; k != v38; ++k)
                    {
                      if (*(_QWORD *)v52 != v39)
                        objc_enumerationMutation(v37);
                      v41 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
                      v50[0] = v55;
                      v50[1] = v56;
                      v50[2] = v57;
                      if (v41)
                        objc_msgSend(v41, "drawingTransform");
                      else
                        memset(v49, 0, sizeof(v49));
                      if (!DKDNearlyEqualTransforms((double *)v50, (double *)v49))
                      {
                        objc_msgSend(v35, "tiles");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "objectForKeyedSubscript:", v41);
                        v43 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v35, "tiles");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v44, "removeObjectForKey:", v41);

                        -[PKRendererTile purgeTileLayers]((uint64_t)v43);
                        objc_msgSend(v35, "purgedTiles");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v45, "setObject:forKeyedSubscript:", v43, v41);

                      }
                    }
                    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
                  }
                  while (v38);
                }

              }
              v32 = obj;
              v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
            }
            while (v33);
          }

          *(_QWORD *)&v55 = &v62;
          std::vector<AttachmentTileInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v55);
        }
      }
    }
  }

}

- (void)blitOldTilesIntoNewTiles:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  PKTiledView *v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  uint64_t gestureView;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  id v57;
  void *v58;
  double v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t drawingTouchThatHitNothing;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  double *v77;
  void *v78;
  id obj;
  PKTiledView *v80;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  id v85;
  PKTiledView *v86;
  id v87;
  _OWORD v88[3];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _OWORD v97[3];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  double *v101;
  double *v102;
  double v103;
  double v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  double **v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;
  CGRect v114;

  v113 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v76 = a4;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable", v6);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
  v80 = self;
  if (v7)
  {
    v8 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v106 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        v11 = objc_opt_class();
        PKDynamicCast(v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "drawingTransform");
          if (sqrt(v104 * v104 + v103 * v103) > 0.0)
          {
            objc_msgSend(v13, "tiles");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v14, "copy");
            objc_msgSend(v78, "setObject:forKey:", v15, v10);

            objc_msgSend(v13, "tiles");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "removeAllObjects");

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _layerContentsScale](self, "_layerContentsScale");
  v19 = v18;
  -[PKTiledView scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "zoomScale");
  v22 = v21;

  v23 = self;
  -[PKTiledView getVisibleTiles:](self, "getVisibleTiles:", obj);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v24 = v101;
  v77 = v102;
  if (v101 != v102)
  {
    v25 = v19 * v22;
    do
    {
      if (*(_QWORD *)v24)
      {
        objc_msgSend(*(id *)v24, "drawingTransform");
        v26 = *((double *)&v98 + 1);
        v27 = *(double *)&v98;
        if (!v23)
          goto LABEL_19;
      }
      else
      {
        v99 = 0u;
        v100 = 0u;
        v26 = 0.0;
        v27 = 0.0;
        v98 = 0u;
        if (!v23)
        {
LABEL_19:
          gestureView = 0;
          goto LABEL_16;
        }
      }
      gestureView = (uint64_t)v23->_gestureView;
LABEL_16:
      v29 = +[PKRendererTile layerFrameForLevel:offset:](v24[1], v24[2], (uint64_t)PKRendererTile, gestureView);
      v31 = v30;
      v33 = v32;
      v35 = v34;
      if (*(_QWORD *)v24)
        objc_msgSend(*(id *)v24, "drawingTransform");
      else
        memset(v97, 0, sizeof(v97));
      +[PKRendererTile drawingFrameForLayerFrame:drawingTransform:contentScale:](v29, v31, v33, v35, v25 * sqrt(v26 * v26 + v27 * v27), (uint64_t)PKRendererTile, v97);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      objc_msgSend(v78, "objectForKey:", *(_QWORD *)v24);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectEnumerator");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0;
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
      if (v47)
      {
        v48 = *(_QWORD *)v94;
        do
        {
          v49 = 0;
          do
          {
            if (*(_QWORD *)v94 != v48)
              objc_enumerationMutation(v45);
            v50 = *(_QWORD **)(*((_QWORD *)&v93 + 1) + 8 * v49);
            if (v50)
            {
              v51 = v50[23];
              v52 = v50[24];
              v53 = v50[25];
              v54 = v50[26];
            }
            else
            {
              v52 = 0;
              v53 = 0;
              v54 = 0;
              v51 = 0;
            }
            v114.origin.x = v37;
            v114.origin.y = v39;
            v114.size.width = v41;
            v114.size.height = v43;
            if (CGRectIntersectsRect(*(CGRect *)&v51, v114))
            {
              if (!v46)
              {
                v55 = v24[1];
                v56 = v24[2];
                v57 = *(id *)v24;
                -[PKTiledView scrollView](v80, "scrollView");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "zoomScale");
                -[PKTiledView tileForOffset:inAttachment:offscreen:tileZoomScale:](v80, "tileForOffset:inAttachment:offscreen:tileZoomScale:", v57, 0, v55, v56, v59);
                v46 = objc_claimAutoreleasedReturnValue();

                if (v46)
                {
                  *(_BYTE *)(v46 + 84) = 1;
                  objc_msgSend(*(id *)(v46 + 88), "setHidden:", 1);
                  objc_msgSend(*(id *)(v46 + 96), "setHidden:", 1);
                }
              }
              objc_msgSend(v17, "objectForKey:", v46);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v60)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKey:", v60, v46);
              }
              objc_msgSend(v60, "addObject:", v50);

            }
            ++v49;
          }
          while (v47 != v49);
          v61 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
          v47 = v61;
        }
        while (v61);
      }

      v24 += 4;
      v23 = v80;
    }
    while (v24 != v77);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v63 = obj;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v89, v110, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v64; ++j)
      {
        if (*(_QWORD *)v90 != v65)
          objc_enumerationMutation(v63);
        v67 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j);
        v68 = (void *)MEMORY[0x1E0CB3B18];
        if (v67)
          objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "drawingTransform");
        else
          memset(v88, 0, sizeof(v88));
        objc_msgSend(v68, "valueWithCGAffineTransform:", v88);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setObject:forKey:", v69, v67);

      }
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v89, v110, 16);
    }
    while (v64);
  }

  drawingTouchThatHitNothing = (uint64_t)v80->_drawingTouchThatHitNothing;
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __51__PKTiledView_blitOldTilesIntoNewTiles_completion___block_invoke;
  v81[3] = &unk_1E77778F8;
  v71 = v63;
  v82 = v71;
  v72 = v62;
  v83 = v72;
  v73 = v17;
  v84 = v73;
  v74 = v78;
  v85 = v74;
  v75 = v76;
  v86 = v80;
  v87 = v75;
  -[PKTileController renderTilesIntoTiles:completion:](drawingTouchThatHitNothing, v73, v81);

  v109 = &v101;
  std::vector<AttachmentTileInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v109);

}

void __51__PKTiledView_blitOldTilesIntoNewTiles_completion___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PKTiledView_blitOldTilesIntoNewTiles_completion___block_invoke_2;
  v3[3] = &unk_1E77778F8;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v2 = *(id *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __51__PKTiledView_blitOldTilesIntoNewTiles_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[3];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v44 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v7 = objc_opt_class();
        PKDynamicCast(v7, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            objc_msgSend(v9, "CGAffineTransformValue");
          }
          else
          {
            v41 = 0u;
            v42 = 0u;
            v40 = 0u;
          }
          v39[0] = v40;
          v39[1] = v41;
          v39[2] = v42;
          objc_msgSend(v8, "setTileDrawingTransform:", v39);

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v3);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "keyEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
        -[PKRendererTile updateDisableTransactionActions:reloadContents:](v15, 1, 1);
        if (v15)
        {
          *(_BYTE *)(v15 + 84) = 0;
          objc_msgSend(*(id *)(v15 + 88), "setHidden:", 0);
          objc_msgSend(*(id *)(v15 + 96), "setHidden:", 0);
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v12);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(a1 + 56), "objectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v48, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * k);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v20, "objectEnumerator", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v47, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v28;
          do
          {
            for (m = 0; m != v22; ++m)
            {
              if (*(_QWORD *)v28 != v23)
                objc_enumerationMutation(v21);
              -[PKRendererTile purgeTileLayers](*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * m));
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v47, 16);
          }
          while (v22);
        }

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v48, 16);
    }
    while (v17);
  }

  v25 = *(_QWORD *)(a1 + 72);
  if (v25)
    (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  return objc_msgSend(*(id *)(a1 + 64), "updateTilesForVisibleRect");
}

- (id)tileForOffset:(CGPoint)a3 inAttachment:(id)a4 offscreen:(BOOL)a5 tileZoomScale:(double)a6
{
  _BOOL8 v7;
  double y;
  double x;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PKRendererTileProperties *v18;
  PKTiledGestureView *gestureView;
  PKRendererTileProperties *v20;
  void *v21;
  void *v22;
  double *v23;
  void *v24;
  double *v25;
  void *v26;
  double v27;
  double *v28;
  uint64_t v29;
  id v30;
  double *v31;
  double *v32;
  double *v33;
  int v34;
  id *v35;
  id *v36;
  double v37;
  float v38;
  double v39;
  void *v40;
  PKTiledGestureView *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  PKRendererTile *v68;
  void *v69;
  double *v70;
  double *v71;
  __int128 v72[3];
  _OWORD v73[3];
  __int128 v74;
  __int128 v75;
  __int128 v76;

  v7 = a5;
  y = a3.y;
  x = a3.x;
  v11 = a4;
  v12 = objc_opt_class();
  PKDynamicCast(v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v13, "setSixChannelBlending:", -[PKTiledView _sixChannelBlendingIsActive](self, "_sixChannelBlendingIsActive"));
  -[PKTiledView _layerContentsScale](self, "_layerContentsScale");
  v15 = v14;
  if (v11)
  {
    objc_msgSend(v11, "drawingTransform");
    v16 = *((double *)&v74 + 1);
    v17 = *(double *)&v74;
  }
  else
  {
    v75 = 0u;
    v76 = 0u;
    v74 = 0u;
    v16 = 0.0;
    v17 = 0.0;
  }
  v18 = [PKRendererTileProperties alloc];
  if (!self)
  {
    gestureView = 0;
    if (v11)
      goto LABEL_8;
LABEL_10:
    memset(v73, 0, sizeof(v73));
    goto LABEL_11;
  }
  gestureView = self->_gestureView;
  if (!v11)
    goto LABEL_10;
LABEL_8:
  objc_msgSend(v11, "drawingTransform");
LABEL_11:
  v20 = -[PKRendererTileProperties initWithLevel:offset:drawingTransform:sixChannelMode:](v18, "initWithLevel:offset:drawingTransform:sixChannelMode:", gestureView, v73, -[PKTiledView _sixChannelBlendingIsActive](self, "_sixChannelBlendingIsActive"), x, y);
  objc_msgSend(v13, "tiles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v20);
  v71 = (double *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "offscreenTiles");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v20);
  v23 = (double *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "purgedTiles");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v20);
  v25 = (double *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "purgedTiles");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeObjectForKey:", v20);
  v27 = v15 * a6 * sqrt(v16 * v16 + v17 * v17);

  if (v25 && v25[19] != v27)
  {

    v25 = 0;
  }
  if (!v23)
    goto LABEL_17;
  if (v23[19] != v27)
  {

LABEL_17:
    v28 = 0;
    goto LABEL_19;
  }
  v28 = v23;
LABEL_19:
  if (v71)
  {
    if (v71[19] == v27)
      goto LABEL_23;

  }
  v71 = 0;
LABEL_23:
  if (v7)
  {
    if (!v28)
    {
      v70 = v25;
      if (v71)
      {
        v29 = objc_msgSend(v71, "copy");
        v30 = (id)v29;
        if (v29)
        {
          *(_BYTE *)(v29 + 84) = 1;
          objc_msgSend(*(id *)(v29 + 88), "setHidden:", 1);
          objc_msgSend(*((id *)v30 + 12), "setHidden:", 1);
LABEL_38:
          objc_msgSend(v13, "offscreenTiles");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:
          v69 = v40;
          if (v30)
          {
            *((double *)v30 + 19) = v27;
            atomic_store(*(unint64_t *)&v27, (unint64_t *)v30 + 1);
            objc_msgSend(*((id *)v30 + 11), "setContentsScale:", v27);
            objc_msgSend(*((id *)v30 + 12), "setContentsScale:", v27);
          }
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v30, v20);
          if (v30 && *((_BYTE *)v30 + 82))
          {
            objc_msgSend(v11, "tileContainerView");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "layer");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKRendererTile tileMultiplyLayer]((double *)v30);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addSublayer:", v44);

          }
          objc_msgSend(v11, "tileContainerView");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "layer");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKRendererTile tileLayer]((double *)v30);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addSublayer:", v47);

          if (-[PKTiledView showDebugOutlines](self, "showDebugOutlines"))
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, dbl_1BE4FBE40[((int)(x + y) & 1) == 0]);
            v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v49 = objc_msgSend(v48, "CGColor");
            -[PKRendererTile tileLayer]((double *)v30);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setBackgroundColor:", v49);

            v51 = objc_alloc_init(MEMORY[0x1E0CD28A0]);
            -[PKTiledView scrollView](self, "scrollView");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "zoomScale");
            v54 = v53;
            -[PKTiledView scrollView](self, "scrollView");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "zoomScale");
            objc_msgSend(v51, "setFrame:", 0.0, 0.0, 100.0 / v54, 30.0 / v56);

            if (v30)
            {
              v57 = *((_QWORD *)v30 + 16);
              v58 = (int)*((double *)v30 + 21);
              v59 = (int)*((double *)v30 + 22);
            }
            else
            {
              v58 = 0;
              v57 = 0;
              v59 = 0;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld, (%d, %d)"), v57, v58, v59, v40);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setString:", v60);

            objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
            v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v51, "setForegroundColor:", objc_msgSend(v61, "CGColor"));

            -[PKTiledView scrollView](self, "scrollView");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "zoomScale");
            objc_msgSend(v51, "setFontSize:", 14.0 / v63);

            -[PKTiledView scrollView](self, "scrollView");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "zoomScale");
            objc_msgSend(v51, "setContentsScale:", v65 + v65);

            -[PKRendererTile tileLayer]((double *)v30);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "addSublayer:", v51);

          }
          v32 = (double *)v30;

          v31 = v32;
          goto LABEL_56;
        }
      }
LABEL_32:
      v33 = v70;
      if (v70)
      {
        v34 = -[PKRendererTile recreatePurgedTileLayersIfPossible]((uint64_t)v70);
        v33 = v70;
        if (v34)
        {
          v35 = v70;
          v36 = v35;
          v37 = 1.0;
          if (v7)
            v37 = 0.0;
          *((double *)v35 + 20) = v37;
          v38 = v37;
          *(float *)&v37 = v38;
          objc_msgSend(v35[11], "setOpacity:", v37);
          *(float *)&v39 = v38;
          objc_msgSend(v36[12], "setOpacity:", v39);
          *((_BYTE *)v36 + 84) = v7;
          objc_msgSend(v36[11], "setHidden:", v7);
          objc_msgSend(v36[12], "setHidden:", v7);
          if (v7)
            goto LABEL_37;
          goto LABEL_45;
        }
      }
      v70 = v33;
      v68 = [PKRendererTile alloc];
      if (self)
      {
        v41 = self->_gestureView;
        if (v11)
        {
LABEL_41:
          objc_msgSend(v11, "drawingTransform");
          goto LABEL_44;
        }
      }
      else
      {
        v41 = 0;
        if (v11)
          goto LABEL_41;
      }
      memset(v72, 0, sizeof(v72));
LABEL_44:
      v36 = (id *)-[PKRendererTile initWithLevel:offset:drawingTransform:contentsScale:sixChannelMode:](v68, (uint64_t)v41, v72, -[PKTiledView _sixChannelBlendingIsActive](self, "_sixChannelBlendingIsActive"), x, y, v27);
      if (v7)
      {
LABEL_37:
        v30 = v36;
        goto LABEL_38;
      }
LABEL_45:
      objc_msgSend(v13, "tiles");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v36;
      goto LABEL_46;
    }
  }
  else if (!v28)
  {
    v70 = v25;
    if (v71)
    {
      v31 = v71;
      v32 = 0;
LABEL_56:
      v25 = v70;
      goto LABEL_57;
    }
    goto LABEL_32;
  }
  v31 = v28;
  v32 = 0;
LABEL_57:

  return v31;
}

- (id)generateTile:(CGPoint)a3 inAttachment:(id)a4 rendering:(BOOL)a5 offscreen:(BOOL)a6 overrideAdditionalStrokes:(id)a7
{
  _BOOL8 v8;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  PKDrawingVersion *cachedDrawingVersionForAdditionalStrokes;
  void *v31;
  void *v32;
  id didScrollBlock;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PKDrawingUUID *cachedDrawingUUIDForAdditionalStrokes;
  void *v53;
  PKDrawingUUID *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  PKTiledView *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD aBlock[4];
  id v67;
  PKTiledView *v68;
  id v69;

  v8 = a6;
  y = a3.y;
  x = a3.x;
  v13 = a4;
  v14 = a7;
  if (self && *(double *)&self->_tileLevel != 0.0)
  {
    -[PKTiledView tileForOffset:inAttachment:offscreen:tileZoomScale:](self, "tileForOffset:inAttachment:offscreen:tileZoomScale:", v13, v8, x, y);
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (!v16 || !a5)
      goto LABEL_29;
    objc_msgSend(v13, "drawing");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "strokes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_opt_class();
    PKDynamicCast(v19, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
    {
      v23 = v16;
LABEL_28:

      v15 = v16;
LABEL_29:

      goto LABEL_30;
    }
    v54 = (PKDrawingUUID *)v18;
    v55 = v20;
    if (v14)
    {
      v22 = v14;
    }
    else
    {
      objc_msgSend(v20, "additionalStrokes");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v22;
    -[PKDrawing uuid](self->_dirtyDrawing, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "drawing");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "isEqual:", v27);
    if (v24)
      v29 = v28;
    else
      v29 = 0;

    if (v14
      || !v29
      || !objc_msgSend(v24, "isEqualToArray:", self->_cachedVisibleStrokesWithAdditionalStrokesForDirtyDrawing))
    {
LABEL_24:
      -[PKRendererTile updateLastUsedTimestamp]((uint64_t)v16);
      v36 = objc_msgSend(v55, "wantsFullyRendered", v24);
      v37 = MEMORY[0x1E0C809B0];
      if (v36)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke;
        aBlock[3] = &unk_1E7776FB0;
        v67 = v55;
        v68 = self;
        v69 = v13;
        v38 = _Block_copy(aBlock);

      }
      else
      {
        v38 = 0;
      }
      -[PKDrawing uuid](self->_dirtyDrawing, "uuid");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v38;
      -[PKDrawing version](self->_dirtyDrawing, "version");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_msgSend(v24, "copy");
      ++v16[18];
      -[PKTiledView tileController](self, "tileController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v37;
      v56[1] = 3221225472;
      v56[2] = __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke_2;
      v56[3] = &unk_1E7777948;
      v40 = v16;
      v57 = v40;
      v58 = v55;
      v41 = v51;
      v65 = v41;
      v42 = v24;
      v59 = v42;
      v60 = v14;
      v61 = self;
      v43 = v49;
      v62 = v43;
      v44 = v53;
      v63 = v44;
      v45 = v50;
      v64 = v45;
      -[PKTileController renderStrokes:additionalStrokes:intoTile:completionBlock:]((uint64_t)v39, v54, v42, v40, v56);

      v46 = v40;
      v18 = v54;
      v21 = v55;
      goto LABEL_28;
    }
    cachedDrawingVersionForAdditionalStrokes = self->_cachedDrawingVersionForAdditionalStrokes;
    objc_msgSend(v13, "drawing");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v24;
    objc_msgSend(v31, "uuid");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKDrawingVersion isEqual:](cachedDrawingVersionForAdditionalStrokes, "isEqual:", v32))
    {
      didScrollBlock = self->_didScrollBlock;
      objc_msgSend(v13, "drawing");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "version");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(didScrollBlock, "isEqual:", v35))
      {
        cachedDrawingUUIDForAdditionalStrokes = self->_cachedDrawingUUIDForAdditionalStrokes;

        if (!cachedDrawingUUIDForAdditionalStrokes)
        {
          v24 = v48;
          goto LABEL_24;
        }
        v32 = v54;
        v31 = v48;
        v54 = self->_cachedDrawingUUIDForAdditionalStrokes;
        v24 = 0;
        goto LABEL_23;
      }

    }
    v24 = v48;
LABEL_23:

    goto LABEL_24;
  }
  v15 = 0;
LABEL_30:

  return v15;
}

void __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "tiles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (v7
          && *(uint64_t *)(v7 + 144) >= 1
          && (objc_msgSend(*(id *)(a1 + 40), "tileIsVisibleForOffset:inAttachment:distanceToMiddle:", *(_QWORD *)(a1 + 48), 0, *(double *)(v7 + 168), *(double *)(v7 + 176)) & 1) != 0)
        {

          return;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "fullyRendered");
}

void __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke_3;
  block[3] = &unk_1E7777920;
  v11 = *(id *)(a1 + 32);
  v21 = a2;
  v12 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 96);
  v13 = *(id *)(a1 + 48);
  v14 = v5;
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(void **)(a1 + 72);
  v15 = v6;
  v16 = v7;
  v17 = v8;
  v18 = *(id *)(a1 + 80);
  v19 = *(id *)(a1 + 88);
  v9 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke_3(uint64_t a1, const char *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    --*(_QWORD *)(v3 + 144);
  v4 = *(_DWORD *)(a1 + 112);
  switch(v4)
  {
    case 1:
      v5 = *(_QWORD *)(a1 + 32);
      if (!v5 || *(double *)(v5 + 160) < 1.0)
LABEL_9:
        -[PKRendererTile updateDisableTransactionActions:reloadContents:](v5, objc_msgSend(*(id *)(a1 + 40), "disableTileAnimations"), *(_DWORD *)(a1 + 112) == 3);
      break;
    case 2:
      v6 = *(void **)(a1 + 32);
      if (v6)
        objc_setProperty_atomic_copy(v6, a2, 0, 136);
      break;
    case 3:
      v5 = *(_QWORD *)(a1 + 32);
      goto LABEL_9;
    default:
      break;
  }
  v7 = *(_QWORD *)(a1 + 104);
  if (v7)
    (*(void (**)(void))(v7 + 16))();
  if (*(_QWORD *)(a1 + 48))
  {
    if (*(_QWORD *)(a1 + 56))
    {
      if (!*(_QWORD *)(a1 + 64))
      {
        v8 = *(void **)(a1 + 72);
        if (v8)
        {
          objc_setProperty_nonatomic_copy(v8, a2, *(id *)(a1 + 80), 760);
          v10 = *(void **)(a1 + 72);
          if (v10)
          {
            objc_setProperty_nonatomic_copy(v10, v9, *(id *)(a1 + 56), 768);
            v12 = *(void **)(a1 + 72);
            if (v12)
            {
              objc_setProperty_nonatomic_copy(v12, v11, *(id *)(a1 + 88), 776);
              v14 = *(void **)(a1 + 72);
              if (v14)
                objc_setProperty_nonatomic_copy(v14, v13, *(id *)(a1 + 96), 784);
            }
          }
        }
      }
    }
  }
}

- (id)_adornmentViewsToHitTest
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView selectionController](self, "selectionController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 152);
  else
    v6 = 0;
  v7 = v6;

  -[PKTiledView selectionController](self, "selectionController");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = *(void **)(v8 + 144);
  else
    v10 = 0;
  v11 = v10;

  -[PKTiledView rulerView](self, "rulerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "addObject:", v11);
  if ((objc_msgSend(v7, "isHidden") & 1) == 0)
    objc_msgSend(v3, "addObject:", v7);
  if (v12)
    objc_msgSend(v3, "addObject:", v12);
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (void)_willBeginInteractiveResize
{
  if (self)
    self->_disableTileRendering = 1;
}

- (void)_didEndInteractiveResize
{
  if (self)
    self->_disableTileRendering = 0;
  -[PKTiledView updateTilesForVisibleRect](self, "updateTilesForVisibleRect");
}

- (void)selectionDidChange
{
  PKTileController *tileController;
  PKTileController *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id obj;

  tileController = self->_tileController;
  if (tileController)
    tileController = *(PKTileController **)&tileController[2]._invertColors;
  v4 = tileController;
  -[PKTileController drawing](v4, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)&self->_shouldResetBaseRollAngleOnNextStroke;
  if (!v6)
  {
LABEL_8:
    v8 = obj;
    if (!obj)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (!obj)
  {
LABEL_7:
    -[PKTiledView attachmentForUUID:](self, "attachmentForUUID:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectionDidChange");

    goto LABEL_8;
  }
  v7 = objc_msgSend(*(id *)&self->_shouldResetBaseRollAngleOnNextStroke, "isEqual:", obj);
  v8 = obj;
  if (v7)
  {
    v6 = *(_QWORD *)&self->_shouldResetBaseRollAngleOnNextStroke;
    goto LABEL_7;
  }
LABEL_9:
  -[PKTiledView attachmentForUUID:](self, "attachmentForUUID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionDidChange");

  v8 = obj;
LABEL_10:
  objc_storeStrong((id *)&self->_shouldResetBaseRollAngleOnNextStroke, v8);
  -[PKTiledView canvasView](self, "canvasView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_isCombiningStrokes");

  if (v12)
  {
    -[PKTiledView canvasView](self, "canvasView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_finishCombiningStrokesIfNecessary");

  }
  -[PKTiledView _updateRemoteEffect](self, "_updateRemoteEffect");

}

- (void)setSelectedStrokeIds:(id)a3 selectionType:(int64_t)a4 forAttachment:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PKTileController *tileController;
  void *v20;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v21 = a4;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v9, "drawing");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_strokeForIdentifier:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            objc_msgSend(v10, "addObject:", v17);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    v18 = objc_msgSend(v10, "count");
    tileController = self->_tileController;
    if (v18)
    {
      objc_msgSend(v9, "drawing");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectStrokes:forSelectionType:inDrawing:]((id *)&tileController->super.isa, v10, v21, v20);

    }
    else if (tileController)
    {
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)self->_tileController, 1, 0);
    }

  }
}

- (id)selectedStrokeIdsForAttachment:(id)a3
{
  id v4;
  PKTileController *tileController;
  PKTileController *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  tileController = self->_tileController;
  if (tileController)
    tileController = *(PKTileController **)&tileController[2]._invertColors;
  v6 = tileController;
  -[PKTileController drawing](v6, "drawing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v4);

  if ((v9 & 1) != 0)
    -[PKTileController strokeIdentifiers](v6, "strokeIdentifiers");
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIView)selectionView
{
  PKTileController *tileController;

  tileController = self->_tileController;
  if (tileController)
    return (UIView *)tileController[2]._tasks;
  else
    return 0;
}

- (PKStrokeSelectionImage)selectionImage
{
  PKTileController *tileController;
  PKTileController *v3;
  void *v4;

  tileController = self->_tileController;
  if (tileController)
    tileController = *(PKTileController **)&tileController[2]._invertColors;
  v3 = tileController;
  -[PKTileController strokeImage](v3, "strokeImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKStrokeSelectionImage *)v4;
}

- (void)transformingSelectionBegan
{
  PKTileController *tileController;
  PKTileController *v4;
  void *v5;
  void *v6;
  void *v7;
  PKTileController *tasks;
  PKTileController *v9;
  PKTileController *v10;
  PKTileController *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  _BYTE v15[48];
  CGAffineTransform v16;
  _BYTE v17[48];

  tileController = self->_tileController;
  if (tileController)
    tileController = *(PKTileController **)&tileController[2]._invertColors;
  v4 = tileController;
  -[PKTileController drawing](v4, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKTiledView getAttachment:tileTransform:strokeTransform:paperTransform:](self, "getAttachment:tileTransform:strokeTransform:paperTransform:", v7, v17, &v16, v15);
    v13 = v16;
    CGAffineTransformInvert(&v14, &v13);
    tasks = self->_tileController;
    if (tasks)
      tasks = (PKTileController *)tasks[2]._tasks;
    v9 = tasks;
    v12 = v14;
    -[PKTileController setSelectionDrawingStrokeTransform:](v9, "setSelectionDrawingStrokeTransform:", &v12);

  }
  v10 = self->_tileController;
  if (v10)
    v10 = (PKTileController *)v10[2]._tasks;
  v11 = v10;
  -[PKTileController transformBegan](v11, "transformBegan");

}

- (void)transformingSelectionChanged:(CGAffineTransform *)a3
{
  PKTileController *tileController;
  PKTileController *v5;
  __int128 v6;
  _OWORD v7[3];

  tileController = self->_tileController;
  if (tileController)
    tileController = (PKTileController *)tileController[2]._tasks;
  v5 = tileController;
  v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  -[PKTileController transformChanged:](v5, "transformChanged:", v7);

}

- (void)transformingSelectionEnded
{
  PKTileController *tileController;
  PKTileController *v3;

  tileController = self->_tileController;
  if (tileController)
    tileController = (PKTileController *)tileController[2]._tasks;
  v3 = tileController;
  -[PKTileController transformEnded](v3, "transformEnded");

}

- (void)transformingSelectionCancelled
{
  PKTileController *tileController;
  PKTileController *v3;

  tileController = self->_tileController;
  if (tileController)
    tileController = (PKTileController *)tileController[2]._tasks;
  v3 = tileController;
  -[PKTileController transformCancelled](v3, "transformCancelled");

}

- (void)setSelectionHidden:(BOOL)a3
{
  _BOOL8 v3;
  PKTileController *tileController;
  PKTileController *v5;

  v3 = a3;
  tileController = self->_tileController;
  if (tileController)
    tileController = (PKTileController *)tileController[2]._tasks;
  v5 = tileController;
  -[PKTileController setHidden:](v5, "setHidden:", v3);

}

- (BOOL)hitSelectionAt:(CGPoint)a3
{
  PKTileController *tileController;
  double y;
  double x;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  BOOL v10;

  tileController = self->_tileController;
  if (!tileController)
  {
    v8 = 0;
    goto LABEL_5;
  }
  y = a3.y;
  x = a3.x;
  v7 = tileController[2]._tasks;
  v8 = v7;
  if (!v7)
  {
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  -[NSMutableArray convertPoint:fromView:](v7, "convertPoint:fromView:", self, x, y);
  -[NSMutableArray hitTest:withEvent:](v8, "hitTest:withEvent:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

LABEL_6:
  return v10;
}

- (BOOL)_hasSelection
{
  PKTileController *tileController;

  tileController = self->_tileController;
  return tileController && *(_QWORD *)&tileController[2]._invertColors != 0;
}

- (void)_selectionRefreshWithChangeToDrawings:(id)a3 completion:(id)a4
{
  -[PKTiledView _selectionRefreshWithChangeToDrawings:overrideAdditionalStrokes:completion:](self, "_selectionRefreshWithChangeToDrawings:overrideAdditionalStrokes:completion:", a3, 0, a4);
}

- (void)_selectionRefreshWithChangeToDrawings:(id)a3 overrideAdditionalStrokes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  PKTiledView *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __90__PKTiledView__selectionRefreshWithChangeToDrawings_overrideAdditionalStrokes_completion___block_invoke;
  v18 = &unk_1E77773A0;
  v11 = v8;
  v19 = v11;
  v20 = self;
  v12 = v9;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(&v15);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v15, v16, v17, v18))
    v14[2](v14);
  else
    dispatch_sync(MEMORY[0x1E0C80D38], v14);

}

uint64_t __90__PKTiledView__selectionRefreshWithChangeToDrawings_overrideAdditionalStrokes_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(v6, "uuid", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_attachmentForUUID:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isAtEndOfDocument"))
          objc_msgSend(*(id *)(a1 + 40), "_updateAttachmentHeightIfNecessaryForDrawing:", v6);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 40), "updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:withCallback:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_updateAttachmentHeightIfNecessaryForDrawing:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 && -[PKTiledView _updateHeightOfAttachmentIfNecessary:](self, "_updateHeightOfAttachmentIfNecessary:", v5))
    -[PKTiledView _handleDrawingDidChangeForAttachment:](self, "_handleDrawingDidChangeForAttachment:", v5);

}

- (void)commitSelectionIfNecessaryWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void (**v8)(void);
  _QWORD block[5];
  void (**v10)(void);

  v8 = (void (**)(void))a3;
  -[PKTiledView selectionController](self, "selectionController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    if (*(_QWORD *)(v4 + 120))
    {

      goto LABEL_5;
    }
    v6 = objc_msgSend(*(id *)(v4 + 136), "isCurrentlyAddingSpace");

    if (v6)
    {
LABEL_5:
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        -[PKTiledView selectionController](self, "selectionController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)v7, v8);

      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__PKTiledView_commitSelectionIfNecessaryWithCompletion___block_invoke;
        block[3] = &unk_1E7777B08;
        block[4] = self;
        v10 = v8;
        dispatch_sync(MEMORY[0x1E0C80D38], block);

      }
      goto LABEL_10;
    }
  }
  if (v8)
    v8[2]();
LABEL_10:

}

void __56__PKTiledView_commitSelectionIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)v2, *(void **)(a1 + 40));

}

- (CGPoint)pointInStrokeSpace:(CGPoint)a3 inDrawing:(id)a4
{
  float64x2_t v4;
  double v5;
  double y;
  double x;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[PKTiledView transformFromViewToStrokeSpaceInDrawing:](self, "transformFromViewToStrokeSpaceInDrawing:", a4);
  v4 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, y), (float64x2_t)0, x));
  v5 = v4.f64[1];
  result.x = v4.f64[0];
  result.y = v5;
  return result;
}

- (CGAffineTransform)transformFromViewToStrokeSpaceInDrawing:(SEL)a3
{
  CGAffineTransform v6;

  -[PKTiledView transformFromStrokeSpaceToViewInDrawing:](self, "transformFromStrokeSpaceToViewInDrawing:", a4);
  return CGAffineTransformInvert(retstr, &v6);
}

- (CGAffineTransform)transformFromViewToStrokeSpaceInAttachment:(SEL)a3
{
  CGAffineTransform v6;

  -[PKTiledView transformFromStrokeSpaceToViewInAttachment:](self, "transformFromStrokeSpaceToViewInAttachment:", a4);
  return CGAffineTransformInvert(retstr, &v6);
}

- (CGAffineTransform)transformFromStrokeSpaceToViewInDrawing:(SEL)a3
{
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  CGAffineTransform *result;
  uint8_t v12[16];

  objc_msgSend(a4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKTiledView transformFromStrokeSpaceToViewInAttachment:](self, "transformFromStrokeSpaceToViewInAttachment:", v7);
  }
  else
  {
    v8 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1BE213000, v8, OS_LOG_TYPE_ERROR, "Attachment view not found from drawing", v12, 2u);
    }

    v9 = MEMORY[0x1E0C9BAA8];
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v10;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v9 + 32);
  }

  return result;
}

- (CGAffineTransform)transformFromStrokeSpaceToViewInAttachment:(SEL)a3
{
  void *v6;
  void *v7;
  CGAffineTransform *result;
  id v9;

  v9 = a4;
  -[PKTiledView canvasView](self, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_strokeTransformForAttachment:", v9);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGRect)attachmentBoundsForDrawing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "viewRep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)boundsForDrawing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  objc_msgSend(v6, "tileContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "tileContainerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "convertRect:fromView:", v17, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;

  -[PKTiledView scrollView](self, "scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentOffset");
  v24 = v23;
  v26 = v25;

  objc_msgSend(v4, "bounds");
  v28 = v27;
  v30 = v29;

  v31 = v19 - v24;
  v32 = v21 - v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)visibleOnscreenBoundsForDrawing:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a3;
  -[PKTiledView bounds](self, "bounds");
  -[PKTiledView visibleOnscreenBoundsForDrawing:slack:](self, "visibleOnscreenBoundsForDrawing:slack:", v4, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)visibleOnscreenBoundsForDrawing:(id)a3 slack:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGAffineTransform v55[2];
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect result;
  CGRect v64;
  CGRect v65;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[PKTiledView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v57 = CGRectInset(v56, -width, -height);
  x = v57.origin.x;
  y = v57.origin.y;
  v11 = v57.size.width;
  v12 = v57.size.height;

  objc_msgSend(v7, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _attachmentForUUID:](self, "_attachmentForUUID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTiledView scrollView](self, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewRep");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v14, "viewRep");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertRect:fromView:", v25, v18, v20, v22, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = v11;
  v58.size.height = v12;
  v64.origin.x = v27;
  v64.origin.y = v29;
  v64.size.width = v31;
  v64.size.height = v33;
  if (CGRectIntersectsRect(v58, v64))
  {
    v59.origin.x = v27;
    v59.origin.y = v29;
    v59.size.width = v31;
    v59.size.height = v33;
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = v11;
    v65.size.height = v12;
    v60 = CGRectIntersection(v59, v65);
    v34 = v60.origin.x;
    v35 = v60.origin.y;
    v36 = v60.size.width;
    v37 = v60.size.height;
    -[PKTiledView scrollView](self, "scrollView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView convertRect:fromView:](self, "convertRect:fromView:", v38, v34, v35, v36, v37);
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;

    memset(&v55[1], 0, sizeof(CGAffineTransform));
    -[PKTiledView transformFromViewToStrokeSpaceInDrawing:](self, "transformFromViewToStrokeSpaceInDrawing:", v7);
    v55[0] = v55[1];
    v61.origin.x = v40;
    v61.origin.y = v42;
    v61.size.width = v44;
    v61.size.height = v46;
    v62 = CGRectApplyAffineTransform(v61, v55);
    v47 = v62.origin.x;
    v48 = v62.origin.y;
    v49 = v62.size.width;
    v50 = v62.size.height;
  }
  else
  {
    v47 = *MEMORY[0x1E0C9D628];
    v48 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v49 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v50 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v51 = v47;
  v52 = v48;
  v53 = v49;
  v54 = v50;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

- (BOOL)_isValidDropPointForStrokes:(CGPoint)a3
{
  char v4;

  v4 = 0;
  return -[PKTiledView _isValidDropPointForStrokes:didInsertNewAttachment:](self, "_isValidDropPointForStrokes:didInsertNewAttachment:", &v4, a3.x, a3.y);
}

- (BOOL)_isValidDropPointForStrokes:(CGPoint)a3 didInsertNewAttachment:(BOOL *)a4
{
  double y;
  double x;
  void *v8;
  BOOL result;
  void *v10;
  _BOOL4 v11;

  y = a3.y;
  x = a3.x;
  *a4 = 0;
  -[PKTiledView hitAttachment:](self, "hitAttachment:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    return 1;
  -[PKTiledView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:fromView:", self, x, y);
  v11 = -[PKTiledView insertAttachmentIfInBlankSpace:](self, "insertAttachmentIfInBlankSpace:");

  if (!v11)
    return 0;
  result = 1;
  *a4 = 1;
  return result;
}

- (CGAffineTransform)strokeTransform
{
  void *v4;
  CGAffineTransform *result;
  id v6;

  -[PKTiledView canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend(v4, "strokeTransform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)_setAdditionalStrokes:(id)a3 inDrawing:(id)a4 completion:(id)a5
{
  -[PKTiledView _setAdditionalStrokes:inDrawing:invalidateTiles:forceOffscreen:completion:](self, "_setAdditionalStrokes:inDrawing:invalidateTiles:forceOffscreen:completion:", a3, a4, 0, 0, a5);
}

- (void)_setAdditionalStrokes:(id)a3 inDrawing:(id)a4 invalidateTiles:(BOOL)a5
{
  -[PKTiledView _setAdditionalStrokes:inDrawing:invalidateTiles:forceOffscreen:completion:](self, "_setAdditionalStrokes:inDrawing:invalidateTiles:forceOffscreen:completion:", a3, a4, a5, 0, &__block_literal_global_463);
}

- (void)_setAdditionalStrokes:(id)a3 inDrawing:(id)a4 invalidateTiles:(BOOL)a5 forceOffscreen:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  os_signpost_id_t v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  os_signpost_id_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v8 = a6;
  v9 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  _PKSignpostLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_generate(v15);

  _PKSignpostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Set Additional Strokes", (const char *)&unk_1BE532412, buf, 2u);
  }

  v19 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v19, OS_LOG_TYPE_INFO, "BEGIN \"Set Additional Strokes\", buf, 2u);
  }

  v20 = os_log_create("com.apple.pencilkit", "Tiles");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v27 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 134218240;
    v41 = v27;
    v42 = 1024;
    v43 = v8;
    _os_log_debug_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEBUG, "setAdditionalStrokes %ld forceOffscreen:%d", buf, 0x12u);
  }

  if (v8)
  {
    -[PKTiledView cancelTileGenerationInvalidateTiles:](self, "cancelTileGenerationInvalidateTiles:", v9);
    v39 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v22;
    v38 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __89__PKTiledView__setAdditionalStrokes_inDrawing_invalidateTiles_forceOffscreen_completion___block_invoke;
    v31[3] = &unk_1E7777990;
    v31[4] = self;
    v32 = v13;
    v33 = v12;
    v35 = v16;
    v34 = v14;
    -[PKTiledView _selectionRefreshWithChangeToDrawings:overrideAdditionalStrokes:completion:](self, "_selectionRefreshWithChangeToDrawings:overrideAdditionalStrokes:completion:", v21, v23, v31);

  }
  else
  {
    objc_storeStrong((id *)&self->_dirtyDrawing, a4);
    objc_msgSend(v13, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView attachmentForUUID:](self, "attachmentForUUID:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAdditionalStrokes:", v12);

    -[PKTiledView cancelTileGenerationInvalidateTiles:](self, "cancelTileGenerationInvalidateTiles:", v9);
    v36 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __89__PKTiledView__setAdditionalStrokes_inDrawing_invalidateTiles_forceOffscreen_completion___block_invoke_464;
    v28[3] = &unk_1E7777A70;
    v30 = v16;
    v29 = v14;
    -[PKTiledView _selectionRefreshWithChangeToDrawings:completion:](self, "_selectionRefreshWithChangeToDrawings:completion:", v26, v28);

  }
}

uint64_t __89__PKTiledView__setAdditionalStrokes_inDrawing_invalidateTiles_forceOffscreen_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  uint64_t result;
  uint8_t v11[16];
  uint8_t buf[16];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdditionalStrokes:", v3);

  _PKSignpostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v7, OS_SIGNPOST_INTERVAL_END, v8, "Set Additional Strokes", (const char *)&unk_1BE532412, buf, 2u);
  }

  v9 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_INFO, "END \"Set Additional Strokes\", v11, 2u);
  }

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __89__PKTiledView__setAdditionalStrokes_inDrawing_invalidateTiles_forceOffscreen_completion___block_invoke_464(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t result;
  uint8_t v7[16];
  uint8_t buf[16];

  _PKSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Set Additional Strokes", (const char *)&unk_1BE532412, buf, 2u);
  }

  v5 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "END \"Set Additional Strokes\", v7, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_resetSelectedStrokeStateForRenderer
{
  PKDrawing *dirtyDrawing;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD block[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dirtyDrawing = self->_dirtyDrawing;
  self->_dirtyDrawing = 0;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "additionalStrokes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (!v11)
        {
          objc_msgSend(v9, "setAdditionalStrokes:", 0);
          v6 = 1;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);

    if ((v6 & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PKTiledView__resetSelectedStrokeStateForRenderer__block_invoke;
      block[3] = &unk_1E7776F38;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {

  }
}

uint64_t __51__PKTiledView__resetSelectedStrokeStateForRenderer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTilesForVisibleRect");
}

- (void)_clearSelectionIfNecessary
{
  PKTileController *tileController;

  if (-[PKSelectionController _hasStrokesOrExternalElementsSelectedInAttachment:]((uint64_t)self->_tileController, 0))
  {
    tileController = self->_tileController;
    if (tileController)
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)tileController, 1, 0);
  }
}

- (BOOL)insertSpaceEnabled
{
  _BYTE *v2;
  BOOL v3;

  -[PKTiledView selectionController](self, "selectionController");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[106] != 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)isGenerationModelAvailable
{
  void *v2;
  char v3;

  +[PKGenerationModelAvailabilityController sharedInstance](PKGenerationModelAvailabilityController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGenerationModelAvailable");

  return v3;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  id *v33;
  id *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  id *v39;
  int v40;
  _BYTE *v41;
  BOOL v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView selectionController](self, "selectionController");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v8 && (v9 = v8[15], v8, v9))
  {
    -[PKTiledView selectionController](self, "selectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController editMenuActionsForConfiguration:]((uint64_t)v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v11);

  }
  else
  {
    v12 = -[PKSelectionController _hasExternalElementsSelectedInAttachment:]((uint64_t)self->_tileController, 0);
    v13 = (void *)MEMORY[0x1E0DC3428];
    _PencilKitBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Select All"), CFSTR("Select All"), CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("character.textbox"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
    v73[3] = &unk_1E7777AE0;
    v73[4] = self;
    v17 = v6;
    v74 = v17;
    objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v15, v16, 0, v73);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0DC3428];
    _PencilKitBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Paste"), CFSTR("Paste"), CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.clipboard"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2;
    v71[3] = &unk_1E7777AE0;
    v71[4] = self;
    v22 = v17;
    v72 = v22;
    objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v20, v21, 0, v71);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0DC3428];
    _PencilKitBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Insert Space Above"), CFSTR("Insert Space Above"), CFSTR("Localizable"));
    else
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Insert Space"), CFSTR("Insert Space"), CFSTR("Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.expand.vertical"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3;
    v69[3] = &unk_1E7777AE0;
    v69[4] = self;
    v27 = v22;
    v70 = v27;
    objc_msgSend(v23, "actionWithTitle:image:identifier:handler:", v25, v26, 0, v69);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTiledView selectionController](self, "selectionController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sourcePoint");
    -[PKSelectionController _drawingForSelectionRect:]((uint64_t)v28, v29 + -60.0, v30 + -60.0, 120.0, 120.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "strokes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    -[PKTiledView selectionController](self, "selectionController");
    v33 = (id *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v33, (uint64_t)sel_selectAll_, self, 0);

    if (((v32 != 0) | v26) == 1)
      objc_msgSend(v7, "addObject:", v63);
    -[PKTiledView selectionController](self, "selectionController");
    v34 = (id *)objc_claimAutoreleasedReturnValue();
    v35 = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v34, (uint64_t)sel_paste_, self, 0);

    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = CFSTR("com.apple.drawing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "containsPasteboardTypes:", v37);

    if ((!v12 & (v38 | v35)) == 1)
      objc_msgSend(v7, "addObject:", v62);
    -[PKTiledView selectionController](self, "selectionController");
    v39 = (id *)objc_claimAutoreleasedReturnValue();
    v40 = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v39, (uint64_t)sel_insertSpace_, self, 0);

    if (((v32 != 0) | v40) == 1)
    {
      -[PKTiledView selectionController](self, "selectionController");
      v41 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        v42 = v41[106] == 0;

        if (!v42)
          objc_msgSend(v7, "addObject:", v61);
      }
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "BOOLForKey:", CFSTR("internalSettings.drawing.enableCopyAllHandwritingTranscription"));

    if (v44)
    {
      v45 = (void *)MEMORY[0x1E0DC3428];
      _PencilKitBundle();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Copy All Transcription"), CFSTR("Copy All Transcription"), CFSTR("Localizable"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("character.textbox"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4;
      v67[3] = &unk_1E7777AE0;
      v67[4] = self;
      v68 = v27;
      objc_msgSend(v45, "actionWithTitle:image:identifier:handler:", v47, v48, 0, v67);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKTiledView selectionController](self, "selectionController");
      v50 = (id *)objc_claimAutoreleasedReturnValue();
      LODWORD(v48) = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v50, (uint64_t)sel__getAllHandwritingTranscription_, self, 0);

      if (((v32 != 0) | v48) == 1)
        objc_msgSend(v7, "addObject:", v49);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "BOOLForKey:", CFSTR("internalSettings.drawing.enableCopyAll"));

    if (v52)
    {
      v53 = (void *)MEMORY[0x1E0DC3428];
      _PencilKitBundle();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("Copy All"), CFSTR("Copy All"), CFSTR("Localizable"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("character.textbox"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_5;
      v65[3] = &unk_1E7777AE0;
      v65[4] = self;
      v66 = v27;
      objc_msgSend(v53, "actionWithTitle:image:identifier:handler:", v55, v56, 0, v65);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKTiledView selectionController](self, "selectionController");
      v58 = (id *)objc_claimAutoreleasedReturnValue();
      LODWORD(v56) = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v58, (uint64_t)sel__copyAll_, self, 0);

      if (((v32 != 0) | v56) == 1)
        objc_msgSend(v7, "addObject:", v57);

    }
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v7);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

uint64_t __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectAll:", *(_QWORD *)(a1 + 40));
}

uint64_t __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paste:", *(_QWORD *)(a1 + 40));
}

uint64_t __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSpace:", *(_QWORD *)(a1 + 40));
}

uint64_t __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getAllHandwritingTranscription:", *(_QWORD *)(a1 + 40));
}

uint64_t __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_copyAll:", *(_QWORD *)(a1 + 40));
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v5 = a4;
  -[PKTiledView selectionController](self, "selectionController");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v6 && (v7 = v6[15], v6, v7))
  {
    -[PKTiledView selectionController](self, "selectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKSelectionController editMenuTargetRect]((uint64_t)v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[PKTiledView selectionController](self, "selectionController");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = *(void **)(v16 + 144);
    else
      v18 = 0;
    v19 = v18;
    -[PKTiledView convertRect:fromView:](self, "convertRect:fromView:", v19, v9, v11, v13, v15);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

  }
  else
  {
    objc_msgSend(v5, "sourcePoint");
    v21 = v28;
    objc_msgSend(v5, "sourcePoint");
    v23 = v29;
    v25 = 5.0;
    v27 = 5.0;
  }

  v30 = v21;
  v31 = v23;
  v32 = v25;
  v33 = v27;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__PKTiledView_editMenuInteraction_willPresentMenuForConfiguration_animator___block_invoke;
  v5[3] = &unk_1E7776F38;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __76__PKTiledView_editMenuInteraction_willPresentMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditMenuVisible:", 1);
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__PKTiledView_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
  v5[3] = &unk_1E7776F38;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

void __76__PKTiledView_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setEditMenuVisible:", 0);
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v2 || (v3 = v2[15], v2, !v3))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "canvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeDrawing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachmentForUUID:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "becomeFirstResponder");
  }
}

- (PKController)drawingController
{
  void *v2;
  void *v3;

  -[PKTiledView canvasView](self, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_drawingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKController *)v3;
}

- (void)_createHoverControllerIfNecessary
{
  int64x2_t *v3;
  CGFloat x;
  void *v5;
  uint64_t v6;
  CGFloat v7;

  if (!*(_QWORD *)&self->_lastContentOffset.x && !self->_editMenuVisible)
  {
    v3 = -[PKHoverController initWithDelegate:view:]((int64x2_t *)[PKHoverController alloc], self, self);
    x = self->_lastContentOffset.x;
    *(_QWORD *)&self->_lastContentOffset.x = v3;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "maximumFramesPerSecond");

    if (v6 >= 101)
      -[PKHoverController setShouldGenerate120HzEvents:](*(_QWORD *)&self->_lastContentOffset.x, 1);
    v7 = self->_lastContentOffset.x;
    if (v7 != 0.0)
      *(_QWORD *)(*(_QWORD *)&v7 + 448) = 0x3FB999999999999ALL;
  }
}

- (id)hoverGestureRecognizer
{
  id *v3;
  void *v4;

  -[PKTiledView _createHoverControllerIfNecessary](self, "_createHoverControllerIfNecessary");
  -[PKTiledView hoverController](self, "hoverController");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKHoverController hoverGestureRecognizer](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)rulerHostWantsSharedRuler
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  -[PKTiledView rulerHostingDelegate](self, "rulerHostingDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[PKTiledView rulerHostingDelegate](self, "rulerHostingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  -[PKTiledView rulerHostingDelegate](self, "rulerHostingDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rulerHostWantsSharedRuler");

  return v8;
}

- (id)rulerView
{
  PKHoverController *hoverController;

  hoverController = self->_hoverController;
  if (hoverController)
    return *(id *)&hoverController->_waitingForHoverHoldTimestamp;
  else
    return 0;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return -[PKTileController dropInteraction:canHandleSession:](self->_tileController, "dropInteraction:canHandleSession:", a3, a4);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  -[PKTileController dropInteraction:sessionDidUpdate:](self->_tileController, "dropInteraction:sessionDidUpdate:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  -[PKTileController dropInteraction:performDrop:](self->_tileController, "dropInteraction:performDrop:", a3, a4);
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return -[PKTileController _dropInteraction:dataOwnerForSession:](self->_tileController, "_dropInteraction:dataOwnerForSession:", a3, a4);
}

- (void)replaceInkTexture:(id)a3 image:(CGImage *)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PKTiledView canvasView](self, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_rendererController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController replaceInkTexture:image:]((uint64_t)v7, v8, (uint64_t)a4);

}

- (double)_latestLatency
{
  void *v2;
  void *v3;
  double v4;

  -[PKTiledView canvasView](self, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_rendererController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKMetalRendererController _latestLatency]((uint64_t)v3);

  return v4;
}

- (id)viewForAttachmentAtBlankSpace
{
  return 0;
}

- (id)viewToMakeFirstResponderWhenHoveringOverAttachment:(id)a3
{
  return 0;
}

- (void)_pauseHoverPreviewForTimeInterval:(double)a3
{
  -[PKTiledView _endHoverToolPreview](self, "_endHoverToolPreview");
  -[PKHoverController reset](*(_QWORD *)&self->_lastContentOffset.x);
  self->_hoverPreviewStartTimestamp = a3;
}

- (BOOL)toolShadowShouldBeActive
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;

  if (!self->_supportsCopyAsText || !*(_QWORD *)&self->_lastContentOffset.x)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if ((v4 & 1) != 0
    || (+[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "toolShadowActiveOutsideNotes")))
  {
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "toolShadowActive") & 1) != 0)
    {

      v6 = 1;
      if ((v4 & 1) != 0)
        return v6;
    }
    else
    {
      +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "toolShadowActiveOnOldPencils");

      if ((v4 & 1) != 0)
        return v6;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)paletteViewHoverView:(id)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  PKTiledView *v8;
  CGFloat x;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  PKTiledView *v17;

  -[PKTiledView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v5);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (v7 = v6[8]) == 0 || !*(_BYTE *)(v7 + 56))
  {
    x = self->_lastContentOffset.x;
    if (x == 0.0)
    {
      v13 = 0.0;
    }
    else
    {
      if (*(_BYTE *)(*(_QWORD *)&x + 56))
      {
LABEL_11:
        v8 = self;
        goto LABEL_12;
      }
      v11 = *(_QWORD *)(*(_QWORD *)&x + 32);
      v10 = *(_QWORD *)(*(_QWORD *)&x + 40);
      v12 = (double *)(*(_QWORD *)&x + 160);
      if (v10 != v11)
        v12 = (double *)(v11 + 64);
      v13 = *v12;
    }
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "systemUptime");
    v16 = v15;

    if (v16 - v13 >= 0.1)
    {
      v17 = 0;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  objc_msgSend(v6, "view");
  v8 = (PKTiledView *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v17 = v8;
LABEL_13:

  return v17;
}

- (CGPoint)paletteViewHoverLocation:(id)a3
{
  void *v4;
  void *v5;
  double *v6;
  uint64_t v7;
  double *v8;
  double *v9;
  CGFloat x;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[PKTiledView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v5);
  v6 = (double *)objc_claimAutoreleasedReturnValue();

  if (v6 && (v7 = *((_QWORD *)v6 + 8)) != 0 && *(_BYTE *)(v7 + 56))
  {
    v8 = v6 + 15;
    v9 = v6 + 16;
  }
  else
  {
    x = self->_lastContentOffset.x;
    if (x == 0.0)
    {
      v11 = 0.0;
      v12 = 0.0;
      goto LABEL_10;
    }
    v8 = *(double **)(*(_QWORD *)&x + 32);
    if (*(double **)(*(_QWORD *)&x + 40) == v8)
    {
      v8 = (double *)(*(_QWORD *)&x + 96);
      v9 = (double *)(*(_QWORD *)&x + 104);
    }
    else
    {
      v9 = v8 + 1;
    }
  }
  v11 = *v8;
  v12 = *v9;
LABEL_10:

  v13 = v11;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)paletteViewPencilDidTap:(id)a3
{
  id v3;

  -[PKTiledView canvasView](self, "canvasView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_finishCombiningStrokesIfNecessary");

}

- ($78FB54F4A6B442EA15B736438C71FAD1)convertInputPoint:(SEL)a3 toAttachment:(id *)a4
{
  $78FB54F4A6B442EA15B736438C71FAD1 *result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;

  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  result = -[PKTiledView transformFromViewToStrokeSpaceInAttachment:](self, "transformFromViewToStrokeSpaceInAttachment:", a5);
  a4->var0 = ($9076B28992D74D3AA2059476C2B9E2A9)vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, a4->var0.var0.y), v12, a4->var0.var0.x));
  a4->var9 = -1;
  a4->var1 = 1.0;
  v8 = *(_OWORD *)&a4->var13;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&a4->var11;
  *(_OWORD *)&retstr->var13 = v8;
  v9 = *(_OWORD *)&a4->var5;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&a4->var3;
  *(_OWORD *)&retstr->var5 = v9;
  v10 = *(_OWORD *)&a4->var9;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&a4->var7;
  *(_OWORD *)&retstr->var9 = v10;
  v11 = *(_OWORD *)&a4->var1;
  retstr->var0 = a4->var0;
  *(_OWORD *)&retstr->var1 = v11;
  return result;
}

- (id)attachmentForHoverPreviewAt:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  objc_class *v8;
  char v9;
  void *v10;
  char isKindOfClass;

  -[PKTiledView ink](self, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isHandwritingInk");

  -[PKTiledView hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", v6 ^ 1u, v6 ^ 1u, a3->var0.var0.x, a3->var0.var0.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PKDrawing drawingClassForPaper](PKDrawing, "drawingClassForPaper");
  if (v7)
    v9 = v6 ^ 1;
  else
    v9 = 1;
  if ((v9 & 1) == 0)
  {
    if (!v8
      || (objc_msgSend(v7, "drawing"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v10,
          (isKindOfClass & 1) == 0))
    {

      v7 = 0;
    }
  }
  return v7;
}

- (BOOL)hoverController:(id)a3 shouldBeActiveAt:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void *v21;

  y = a4.y;
  x = a4.x;
  if (!-[PKTiledView rulerEnabled](self, "rulerEnabled", a3))
    goto LABEL_8;
  -[PKTiledView rulerController](self, "rulerController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = v7 ? *(void **)(v7 + 56) : 0;
  v10 = v9;
  objc_msgSend(v10, "convertPoint:fromView:", self, x, y);
  v12 = v11;
  v14 = v13;

  -[PKTiledView rulerController](self, "rulerController");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = v15 ? *(void **)(v15 + 56) : 0;
  v18 = v17;
  objc_msgSend(v18, "hitTest:withEvent:", 0, v12, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    return 0;
LABEL_8:
  if ((*(_BYTE *)&self->_tiledViewFlags & 0x40) == 0)
    return 1;
  -[PKTiledView delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v21, "canvasView:hoverShouldBeActiveAt:", self, x, y);

  return v20;
}

- (void)hoverController:(id)a3 intentionalHoverWithDuration:(double)a4
{
  double *WeakRetained;

  if (self && LOBYTE(self->_refineAnimationController))
  {
    -[PKTiledView _beginAnalyticsSessionIfNecessary](self, "_beginAnalyticsSessionIfNecessary", a3);
    WeakRetained = (double *)objc_loadWeakRetained((id *)&self->_analyticsSession);
    if (WeakRetained)
      WeakRetained[12] = WeakRetained[12] + a4;

  }
}

- (void)hoverController:(id)a3 didBegin:(id *)a4
{
  void *v6;
  void *v7;
  double v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _OWORD v28[8];

  -[PKTiledView _beginAnalyticsSessionIfNecessary](self, "_beginAnalyticsSessionIfNecessary", a3);
  -[PKTiledView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolPicker existingPaletteViewForWindow:](PKToolPicker, "existingPaletteViewForWindow:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "setHoverDelegate:", self);
  v8 = CACurrentMediaTime();
  -[PKTiledView canvasView](self, "canvasView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHidden");
  if (self)
  {
    v11 = 0.1;
    if (!v10)
      v11 = 0.0;
    self->_extraHoverPreviewDelay = v8 + v11 + self->_hoverPreviewStartTimestamp;

    self->_hoverPreviewStartTimestamp = 0.0;
  }
  else
  {

  }
  -[PKTiledView canvasView](self, "canvasView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isHidden"))
  {
    -[PKTiledView canvasView](self, "canvasView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "latestRenderTimestamp");
    v15 = v14;
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inactivityTimeInterval");
    v18 = v15 + v17;

    if (v8 <= v18)
      goto LABEL_12;
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "extraHoverPreviewDelay");
    if (self)
      self->_extraHoverPreviewDelay = v19 + self->_extraHoverPreviewDelay;
  }

LABEL_12:
  if (-[PKTiledView shouldStartToolPreviewWhenHovering](self, "shouldStartToolPreviewWhenHovering"))
  {
    v20 = *(_OWORD *)&a4->var9;
    v28[4] = *(_OWORD *)&a4->var7;
    v28[5] = v20;
    v21 = *(_OWORD *)&a4->var13;
    v28[6] = *(_OWORD *)&a4->var11;
    v28[7] = v21;
    v22 = *(_OWORD *)&a4->var1;
    v28[0] = a4->var0;
    v28[1] = v22;
    v23 = *(_OWORD *)&a4->var5;
    v28[2] = *(_OWORD *)&a4->var3;
    v28[3] = v23;
    -[PKTiledView attachmentForHoverPreviewAt:](self, "attachmentForHoverPreviewAt:", v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView _finishCombiningStrokesIfNecessaryForAttachment:](self, "_finishCombiningStrokesIfNecessaryForAttachment:", v24);
    if (v24)
    {
      -[PKTiledView standInAttachmentView](self, "standInAttachmentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 != v25)
      {
        -[PKTiledView viewToMakeFirstResponderWhenHoveringOverAttachment:](self, "viewToMakeFirstResponderWhenHoveringOverAttachment:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          objc_msgSend(v26, "becomeFirstResponder");
          if (self)
            self->_extraHoverPreviewDelay = self->_extraHoverPreviewDelay + 0.1;
        }

      }
    }

  }
}

- (void)_keepPencilShadowVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (-[PKTiledView toolShadowShouldBeActive](self, "toolShadowShouldBeActive"))
  {
    -[PKTiledView _setupPencilShadowViewIfNecessary](self, "_setupPencilShadowViewIfNecessary");
    -[PKTiledView window](self, "window");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilShadowView shadowViewForScene:](PKPencilShadowView, "shadowViewForScene:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView ink](self, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInk:", v5);

    -[PKTiledView window](self, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilShadowView shadowViewForScene:](PKPencilShadowView, "shadowViewForScene:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keepVisibleInTiledView:", self);

  }
}

- (void)_updatePencilShadowView:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  double v23[2];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  if (-[PKTiledView toolShadowShouldBeActive](self, "toolShadowShouldBeActive"))
  {
    -[PKTiledView _keepPencilShadowVisible](self, "_keepPencilShadowVisible");
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "toolShadowLocationWorkaround") & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.freeform"));

      if ((v8 & 1) == 0)
        return;
    }
    -[PKTiledView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView PK_convertPoint:toCoordinateSpace:](self, "PK_convertPoint:toCoordinateSpace:", v12, a3->var0.var0.x, a3->var0.var0.y);
    v14 = v13;
    v16 = v15;
    v17 = *(_OWORD *)&a3->var11;
    v35 = *(_OWORD *)&a3->var9;
    v36 = v17;
    v37 = *(_OWORD *)&a3->var13;
    v18 = *(_OWORD *)&a3->var3;
    v31 = *(_OWORD *)&a3->var1;
    v32 = v18;
    v19 = *(_OWORD *)&a3->var7;
    v33 = *(_OWORD *)&a3->var5;
    v34 = v19;
    -[PKTiledView window](self, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "windowScene");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v23[1] = v16;
    v28 = v35;
    v29 = v36;
    v30 = v37;
    v24 = v31;
    v25 = v32;
    v26 = v33;
    v27 = v34;
    -[PKPencilObserverInteraction _updatePencilShadowView:]((uint64_t)v22, v23);

  }
}

- (void)hoverController:(id)a3 didUpdate:(id *)a4
{
  void *v6;
  int v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  PKPencilStatisticsManager *pencilStatisticsManager;
  PKPencilStatisticsManager *v15;
  PKPencilStatisticsManager *v16;
  PKPencilStatisticsManager *v17;
  PKPencilStatisticsManager *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double var6;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  PKStrokePreviewView *strokePreviewView;
  double v53;
  double v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  double v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BOOL4 v95;
  void *v96;
  NSUUID *currentPreviewDrawingUUID;
  PKToolPreviewView *v98;
  NSUUID *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  char v112;
  void *v113;
  void *v114;
  void *v115;
  _OWORD v116[8];
  _QWORD v117[4];
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  id location;
  _OWORD v128[8];
  _OWORD v129[8];
  _OWORD v130[8];
  _OWORD v131[8];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _OWORD v140[8];
  _OWORD v141[8];
  _OWORD v142[8];
  _OWORD v143[9];

  if (-[PKTiledView _scrollViewIsScrollingOrZoomingOrResizing](self, "_scrollViewIsScrollingOrZoomingOrResizing", a3)
    || self
    && LOBYTE(self->_refineAnimationController)
    && (-[PKTiledView canvasView](self, "canvasView"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "_hasStrokeTransformChanged"),
        v6,
        v7))
  {
    -[PKTiledView canvasView](self, "canvasView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_finishCombiningStrokesIfNecessary");

    -[PKHoverController reset](*(_QWORD *)&self->_lastContentOffset.x);
    return;
  }
  v9 = *(_OWORD *)&a4->var9;
  v143[4] = *(_OWORD *)&a4->var7;
  v143[5] = v9;
  v10 = *(_OWORD *)&a4->var13;
  v143[6] = *(_OWORD *)&a4->var11;
  v143[7] = v10;
  v11 = *(_OWORD *)&a4->var1;
  v143[0] = a4->var0;
  v143[1] = v11;
  v12 = *(_OWORD *)&a4->var5;
  v143[2] = *(_OWORD *)&a4->var3;
  v143[3] = v12;
  -[PKTiledView attachmentForHoverPreviewAt:](self, "attachmentForHoverPreviewAt:", v143);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _finishCombiningStrokesIfNecessaryForAttachment:](self, "_finishCombiningStrokesIfNecessaryForAttachment:", v13);
  if (self)
    pencilStatisticsManager = self->_pencilStatisticsManager;
  else
    pencilStatisticsManager = 0;
  v15 = pencilStatisticsManager;
  v16 = v15;
  if (!v13 || !v15)
  {

    if (!v13)
    {
      -[PKHoverController reset](*(_QWORD *)&self->_lastContentOffset.x);
      goto LABEL_70;
    }
LABEL_15:
    v23 = *(_OWORD *)&a4->var9;
    v142[4] = *(_OWORD *)&a4->var7;
    v142[5] = v23;
    v24 = *(_OWORD *)&a4->var13;
    v142[6] = *(_OWORD *)&a4->var11;
    v142[7] = v24;
    v25 = *(_OWORD *)&a4->var1;
    v142[0] = a4->var0;
    v142[1] = v25;
    v26 = *(_OWORD *)&a4->var5;
    v142[2] = *(_OWORD *)&a4->var3;
    v142[3] = v26;
    -[PKTiledView _updatePencilShadowView:](self, "_updatePencilShadowView:", v142);
    kdebug_trace();
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "toolPreviewShouldWaitForHoverAndHold");

    if ((v28 & 1) == 0)
    {
      v29 = *(_OWORD *)&a4->var9;
      v141[4] = *(_OWORD *)&a4->var7;
      v141[5] = v29;
      v30 = *(_OWORD *)&a4->var13;
      v141[6] = *(_OWORD *)&a4->var11;
      v141[7] = v30;
      v31 = *(_OWORD *)&a4->var1;
      v141[0] = a4->var0;
      v141[1] = v31;
      v32 = *(_OWORD *)&a4->var5;
      v141[2] = *(_OWORD *)&a4->var3;
      v141[3] = v32;
      -[PKTiledView startToolPreviewIfPossibleForInputPoint:](self, "startToolPreviewIfPossibleForInputPoint:", v141);
    }
    -[PKTiledView hoverController](self, "hoverController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "toolPreviewMaxZDistance");
    v35 = *(_OWORD *)&a4->var9;
    v140[4] = *(_OWORD *)&a4->var7;
    v140[5] = v35;
    v36 = *(_OWORD *)&a4->var13;
    v140[6] = *(_OWORD *)&a4->var11;
    v140[7] = v36;
    v37 = *(_OWORD *)&a4->var1;
    v140[0] = a4->var0;
    v140[1] = v37;
    v38 = *(_OWORD *)&a4->var5;
    v140[2] = *(_OWORD *)&a4->var3;
    v140[3] = v38;
    v40 = -[PKHoverController adjustedZLimitFromLimit:inputPoint:]((uint64_t)v33, v140, v39);

    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "toolPreviewFadeOutDistance");
    v43 = v42;

    if (v40 >= v43)
      v44 = v43;
    else
      v44 = v40;
    v45 = v40 - v44;
    var6 = a4->var6;
    v47 = 1.0;
    if (var6 > v45)
    {
      if (v44 <= 0.0)
      {
        if (var6 >= v45)
          v47 = 0.0;
        else
          v47 = 1.0;
      }
      else
      {
        v48 = var6 - v45;
        if (v48 >= v44)
          v48 = v44;
        v47 = 1.0 - v48 / v44;
      }
    }
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "toolShadowFadeInDistance");

    v50 = *(_QWORD *)&self->_lastContentOffset.x;
    if (v50)
    {
      objc_msgSend(*(id *)&self->_lastContentOffset.x, "currentMovementSpeed");
      -[PKHoverController alphaFactorFromMovementSpeed:](v50);
    }
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "toolShadowMaxOpacity");

    if (LOBYTE(self->_refineAnimationController)
      || BYTE1(self->_refineAnimationController)
      || *(&self->_editMenuVisible + 1))
    {
      strokePreviewView = self->_strokePreviewView;
      v53 = (CACurrentMediaTime() - *(double *)&strokePreviewView)
          / (*(double *)&strokePreviewView + 0.3 - *(double *)&strokePreviewView);
      v54 = 0.0;
      if (v53 >= 0.0)
      {
        v54 = v53;
        if (v53 > 1.0)
          v54 = 1.0;
      }
      v47 = v47 * v54;
    }
    -[PKTiledView canvasView](self, "canvasView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "_rendererController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setPreviewStrokeAlpha:]((uint64_t)v56, v47);

    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v57 = *(_OWORD *)&a4->var9;
    v131[4] = *(_OWORD *)&a4->var7;
    v131[5] = v57;
    v58 = *(_OWORD *)&a4->var13;
    v131[6] = *(_OWORD *)&a4->var11;
    v131[7] = v58;
    v59 = *(_OWORD *)&a4->var1;
    v131[0] = a4->var0;
    v131[1] = v59;
    v60 = *(_OWORD *)&a4->var5;
    v131[2] = *(_OWORD *)&a4->var3;
    v131[3] = v60;
    -[PKTiledView convertInputPoint:toAttachment:](self, "convertInputPoint:toAttachment:", v131, v13);
    if (!*(&self->_editMenuVisible + 1))
      goto LABEL_42;
    -[PKTiledView canvasView](self, "canvasView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v61, "isDrawing"))
    {

      goto LABEL_42;
    }
    -[PKTiledView canvasView](self, "canvasView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "_isLiveAnimating");

    if ((v63 & 1) != 0)
    {
LABEL_42:
      if (LOBYTE(self->_refineAnimationController) || BYTE1(self->_refineAnimationController))
      {
        -[PKTiledView hoverController](self, "hoverController");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "toolPreviewMaxZDistance");
        v67 = v66;
        +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "deactivateExtraDistance");
        v70 = *(_OWORD *)&a4->var9;
        v129[4] = *(_OWORD *)&a4->var7;
        v129[5] = v70;
        v71 = *(_OWORD *)&a4->var13;
        v129[6] = *(_OWORD *)&a4->var11;
        v129[7] = v71;
        v72 = *(_OWORD *)&a4->var1;
        v129[0] = a4->var0;
        v129[1] = v72;
        v73 = *(_OWORD *)&a4->var5;
        v129[2] = *(_OWORD *)&a4->var3;
        v129[3] = v73;
        v74 = -[PKHoverController adjustedZLimitFromLimit:inputPoint:]((uint64_t)v64, v129, v67 + v69);

        if (a4->var6 > v74)
        {
          +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "toolPreviewShouldWaitForHoverAndHold");

          if (v76)
          {
            -[PKTiledView hoverController](self, "hoverController");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKHoverController resetHoverHold]((uint64_t)v77);

          }
          -[PKTiledView _endHoverToolPreview](self, "_endHoverToolPreview");
          goto LABEL_69;
        }
        if (!LOBYTE(self->_refineAnimationController))
        {
          if (BYTE1(self->_refineAnimationController))
          {
            v91 = *(_OWORD *)&a4->var9;
            v116[4] = *(_OWORD *)&a4->var7;
            v116[5] = v91;
            v92 = *(_OWORD *)&a4->var13;
            v116[6] = *(_OWORD *)&a4->var11;
            v116[7] = v92;
            v93 = *(_OWORD *)&a4->var1;
            v116[0] = a4->var0;
            v116[1] = v93;
            v94 = *(_OWORD *)&a4->var5;
            v116[2] = *(_OWORD *)&a4->var3;
            v116[3] = v94;
            -[PKTiledView _updateSymbolPreviewViewForTouch:attachment:alpha:](self, "_updateSymbolPreviewViewForTouch:attachment:alpha:", v116, v13, v47);
          }
          goto LABEL_69;
        }
        -[PKTiledView canvasView](self, "canvasView");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v128[4] = v136;
        v128[5] = v137;
        v128[6] = v138;
        v128[7] = v139;
        v128[0] = v132;
        v128[1] = v133;
        v128[2] = v134;
        v128[3] = v135;
        objc_msgSend(v78, "_previewDrawingMoved:tiledViewLocation:", v128, a4->var0.var0.x, a4->var0.var0.y);

        -[PKTiledView ink](self, "ink");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "identifier");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v78) = objc_msgSend(v80, "isEqual:", CFSTR("com.apple.ink.pen"));

        -[PKTiledView ink](self, "ink");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "identifier");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v80) = objc_msgSend(v82, "isEqual:", CFSTR("com.apple.ink.marker"));

        -[PKTiledView ink](self, "ink");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "identifier");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "isEqual:", CFSTR("com.apple.ink.pencil"));

        if ((v78 | v80 | v85) == 1)
        {
          +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v86, "toolIndicatorActive"))
          {

LABEL_62:
            +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v96, "toolIndicatorActive"))
            {
              currentPreviewDrawingUUID = self->_currentPreviewDrawingUUID;

              if (!currentPreviewDrawingUUID)
              {
                v98 = objc_alloc_init(PKToolPreviewView);
                v99 = self->_currentPreviewDrawingUUID;
                self->_currentPreviewDrawingUUID = (NSUUID *)v98;

                -[NSUUID setTranslatesAutoresizingMaskIntoConstraints:](self->_currentPreviewDrawingUUID, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                -[NSUUID setHidden:](self->_currentPreviewDrawingUUID, "setHidden:", 1);
                -[PKTiledView addSubview:](self, "addSubview:", self->_currentPreviewDrawingUUID);
              }
            }
            else
            {

            }
            -[NSUUID setAlpha:](self->_currentPreviewDrawingUUID, "setAlpha:", v47);
            objc_initWeak(&location, self);
            if (self->_currentPreviewDrawingUUID)
            {
              -[PKTiledView canvasView](self, "canvasView");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "_rendererController");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v117[0] = MEMORY[0x1E0C809B0];
              v117[1] = 3221225472;
              v117[2] = __41__PKTiledView_hoverController_didUpdate___block_invoke;
              v117[3] = &unk_1E77779B8;
              objc_copyWeak(&v118, &location);
              v123 = v136;
              v124 = v137;
              v125 = v138;
              v126 = v139;
              v119 = v132;
              v120 = v133;
              v121 = v134;
              v122 = v135;
              -[PKMetalRendererController addBlockToCallAfterPresenting:]((uint64_t)v101, v117);

              objc_destroyWeak(&v118);
            }
            objc_destroyWeak(&location);
            goto LABEL_69;
          }
          v95 = -[PKTiledView toolShadowShouldBeActive](self, "toolShadowShouldBeActive");

          if (v95)
            goto LABEL_62;
        }
      }
LABEL_69:
      kdebug_trace();
      goto LABEL_70;
    }
    -[PKTiledView ink](self, "ink");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "identifier");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v88, "isEqual:", CFSTR("com.apple.ink.objectEraser")) & 1) == 0)
    {
      -[PKTiledView ink](self, "ink");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "identifier");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v90, "isEqualToString:", CFSTR("com.apple.ink.lasso")) & 1) == 0)
      {
        -[PKTiledView ink](self, "ink");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v115, "_isHandwritingInk") & 1) == 0)
        {
          -[PKTiledView ink](self, "ink");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "identifier");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = objc_msgSend(v113, "isEqual:", CFSTR("com.apple.ink.generationtool"));

          if ((v112 & 1) == 0)
          {
            +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v102, "toolPreviewActive"))
              v103 = 2;
            else
              v103 = 1;
            -[PKTiledView canvasView](self, "canvasView");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "_rendererController");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKMetalRendererController setPreviewStrokeMaxPoints:]((uint64_t)v105, v103);

            -[PKTiledView window](self, "window");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKToolPicker existingPaletteViewForWindow:](PKToolPicker, "existingPaletteViewForWindow:", v106);
            v107 = (void *)objc_claimAutoreleasedReturnValue();

            v108 = objc_msgSend(v107, "isPalettePresentingPopover");
            -[PKTiledView canvasView](self, "canvasView");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v130[4] = v136;
            v130[5] = v137;
            v130[6] = v138;
            v130[7] = v139;
            v130[0] = v132;
            v130[1] = v133;
            v130[2] = v134;
            v130[3] = v135;
            objc_msgSend(v109, "_previewDrawingBegan:tiledViewLocation:disableDetachedRendering:", v130, v108, a4->var0.var0.x, a4->var0.var0.y);

            LOBYTE(self->_refineAnimationController) = 1;
            objc_msgSend(v13, "drawing");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "uuid");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKTiledView setCurrentPreviewDrawingUUID:]((uint64_t)self, v111);

            *(&self->_editMenuVisible + 1) = 0;
            goto LABEL_69;
          }
          goto LABEL_58;
        }

      }
    }

LABEL_58:
    BYTE1(self->_refineAnimationController) = 1;
    *(&self->_editMenuVisible + 1) = 0;
    goto LABEL_69;
  }
  if (self)
    v17 = self->_pencilStatisticsManager;
  else
    v17 = 0;
  v18 = v17;
  objc_msgSend(v13, "drawing");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PKPencilStatisticsManager isEqual:](v18, "isEqual:", v20);

  if ((v21 & 1) != 0)
    goto LABEL_15;
  -[PKTiledView hoverController](self, "hoverController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHoverController reset]((uint64_t)v22);

LABEL_70:
}

- (void)setCurrentPreviewDrawingUUID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 888), a2);
}

void __41__PKTiledView_hoverController_didUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_OWORD *)(a1 + 120);
  v7[4] = *(_OWORD *)(a1 + 104);
  v7[5] = v3;
  v4 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v4;
  v5 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v5;
  v6 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v6;
  objc_msgSend(WeakRetained, "_updateToolPreviewIndicatorInputPoint:", v7);

}

- (void)_updateSymbolPreviewViewForTouch:(id *)a3 attachment:(id)a4 alpha:(double)a5
{
  void *v8;
  char v9;
  unint64_t v10;
  void *v11;
  int v12;
  PKToolPreviewView *v13;
  NSUUID *currentPreviewDrawingUUID;
  double v15;
  void *v16;
  int v17;
  double x;
  double y;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double height;
  double width;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  id *p_isa;
  PKStrokePreviewView *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  id *v61;
  void *v62;
  id v63;
  id newValue;
  id v65;
  PKTiledView *v66;
  id obj;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGAffineTransform v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v82 = *MEMORY[0x1E0C80C00];
  v65 = a4;
  v66 = self;
  -[PKTiledView ink](self, "ink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_isEraserInk");

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[PKTiledView ink](self, "ink");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_isHandwritingInk");

    if (v12)
      v10 = 3;
    else
      v10 = 2;
  }
  if (self->_currentPreviewDrawingUUID)
  {
    -[PKTiledView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
  else
  {
    v13 = objc_alloc_init(PKToolPreviewView);
    currentPreviewDrawingUUID = self->_currentPreviewDrawingUUID;
    self->_currentPreviewDrawingUUID = (NSUUID *)v13;

    -[NSUUID setTranslatesAutoresizingMaskIntoConstraints:](self->_currentPreviewDrawingUUID, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKTiledView addSubview:](self, "addSubview:", self->_currentPreviewDrawingUUID);
  }
  objc_opt_self();
  if (v10 == 3)
    v15 = 4.0;
  else
    v15 = 12.0;
  -[PKToolPreviewView prepareWithFrame:mode:]((void **)&self->_currentPreviewDrawingUUID->super.isa, v10, a3->var0.var0.x - v15 * 0.5, a3->var0.var0.y - v15 * 0.5, v15, v15);
  -[NSUUID setAlpha:](self->_currentPreviewDrawingUUID, "setAlpha:", a5);
  -[PKTiledView ink](self, "ink");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_isEraserInk");

  if (v17)
  {
    x = a3->var0.var0.x;
    y = a3->var0.var0.y;
    memset(&v79, 0, sizeof(v79));
    -[PKTiledView transformFromViewToStrokeSpaceInAttachment:](self, "transformFromViewToStrokeSpaceInAttachment:", v65);
    objc_msgSend(v65, "strokeSpatialCache");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20 && *(_BYTE *)(v20 + 8))
    {
      objc_msgSend(v65, "strokeSpatialCache");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = *(void **)(v22 + 24);
      else
        v24 = 0;
      v63 = v24;

    }
    else
    {
      v63 = 0;
    }

    objc_msgSend(v65, "drawing");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "strokesIntersectedByPoint:prevPoint:onscreenVisibleStrokes:", v63, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0);
    newValue = (id)objc_claimAutoreleasedReturnValue();

    if ((-[PKDrawing isEqualToOrderedSet:](self->_erasePreviewDrawing, "isEqualToOrderedSet:", newValue) & 1) == 0)
    {
      objc_setProperty_nonatomic_copy(self, v26, newValue, 864);
      +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "erasePreviewAlphaFactor");
      v29 = v28;

      if (v29 <= 0.0 || v29 >= 1.0)
      {
        v43 = *MEMORY[0x1E0C9D628];
        v44 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        width = *(double *)(MEMORY[0x1E0C9D628] + 16);
        height = *(double *)(MEMORY[0x1E0C9D628] + 24);
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v47 = newValue;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
        if (v48)
        {
          v49 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v72 != v49)
                objc_enumerationMutation(v47);
              objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "renderBounds");
              v89.origin.x = v51;
              v89.origin.y = v52;
              v89.size.width = v53;
              v89.size.height = v54;
              v83.origin.x = v43;
              v83.origin.y = v44;
              v83.size.width = width;
              v83.size.height = height;
              v84 = CGRectUnion(v83, v89);
              v43 = v84.origin.x;
              v44 = v84.origin.y;
              width = v84.size.width;
              height = v84.size.height;
            }
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
          }
          while (v48);
        }

        v85.origin.x = v43;
        v85.origin.y = v44;
        v85.size.width = width;
        v85.size.height = height;
        p_isa = (id *)&v66->super.super.super.isa;
        if (CGRectIsNull(v85))
        {
          -[NSOrderedSet removeFromSuperview](v66->_eraseOrLassoPreviewStrokes, "removeFromSuperview");
          objc_storeStrong((id *)&v66->_eraseOrLassoPreviewStrokes, 0);
        }
        else
        {
          if (!v66->_eraseOrLassoPreviewStrokes)
          {
            v56 = objc_alloc_init(PKStrokePreviewView);
            objc_storeStrong((id *)&v66->_eraseOrLassoPreviewStrokes, v56);

            p_isa = (id *)&v66->super.super.super.isa;
            -[NSOrderedSet setTranslatesAutoresizingMaskIntoConstraints:](v66->_eraseOrLassoPreviewStrokes, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            objc_msgSend(p_isa, "addSubview:", p_isa[107]);
            -[NSOrderedSet setOpaque:](v66->_eraseOrLassoPreviewStrokes, "setOpaque:", 0);
            -[NSOrderedSet setAlpha:](v66->_eraseOrLassoPreviewStrokes, "setAlpha:", 1.0);
          }
          v69 = v79;
          memset(&v70, 0, sizeof(v70));
          CGAffineTransformInvert(&v70, &v69);
          v68 = v70;
          v86.origin.x = v43;
          v86.origin.y = v44;
          v86.size.width = width;
          v86.size.height = height;
          v87 = CGRectApplyAffineTransform(v86, &v68);
          v88 = CGRectIntegral(v87);
          v57 = v88.origin.x;
          v58 = v88.origin.y;
          v59 = v88.size.width;
          v60 = v88.size.height;
          v61 = (id *)p_isa[107];
          objc_msgSend(v47, "array");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKStrokePreviewView prepareWithFrame:strokeBounds:strokes:](v61, v62, v57, v58, v59, v60, v43, v44, width, height);

        }
      }
      else
      {
        objc_msgSend(v65, "drawing");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_toolPreviewView, v30);

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(newValue, "count"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        obj = newValue;
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
        if (v32)
        {
          v33 = *(_QWORD *)v76;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v76 != v33)
                objc_enumerationMutation(obj);
              v35 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
              objc_msgSend(v35, "ink");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "color");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "alphaComponent");
              objc_msgSend(v37, "colorWithAlphaComponent:", v29 * v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v36, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              v41 = (void *)objc_msgSend(v35, "mutableCopy");
              objc_msgSend(v41, "setInk:", v40);
              objc_msgSend(v41, "_setRenderGroupID:", 0);
              objc_msgSend(v31, "addObject:", v41);

            }
            v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
          }
          while (v32);
        }

        objc_msgSend(v65, "drawing");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTiledView _setAdditionalStrokes:inDrawing:invalidateTiles:](v66, "_setAdditionalStrokes:inDrawing:invalidateTiles:", v31, v42, 1);

      }
    }

  }
}

- (void)_updateToolPreviewIndicatorInputPoint:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double tx;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double x;
  double y;
  id v41;
  uint64_t v42;
  NSUUID *currentPreviewDrawingUUID;
  NSUUID *v44;
  CGAffineTransform v45;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  _OWORD v53[8];
  CGAffineTransform v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  CGAffineTransform __s1;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  CGRect v62;
  CGRect v63;

  if (self->_currentPreviewDrawingUUID)
  {
    -[PKTiledView ink](self, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.ink.pen"));

    -[PKTiledView ink](self, "ink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.ink.marker"));

    -[PKTiledView ink](self, "ink");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", CFSTR("com.apple.ink.pencil"));

    v61 = 0;
    v59 = 0u;
    v60 = 0u;
    memset(&__s1, 0, sizeof(__s1));
    -[PKTiledView canvasView](self, "canvasView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_drawingController");
    v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[PKController inputController](v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "_latestStrokePoint");
    }
    else
    {
      v61 = 0;
      v59 = 0u;
      v60 = 0u;
      memset(&__s1, 0, sizeof(__s1));
    }

    if (!memcmp(&__s1, &_PKStrokePointZero, 0x58uLL))
    {
      -[PKTiledView canvasView](self, "canvasView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_drawingController");
      v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      -[PKController inputController](v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = *(_OWORD *)&a3->var9;
      v53[4] = *(_OWORD *)&a3->var7;
      v53[5] = v22;
      v23 = *(_OWORD *)&a3->var13;
      v53[6] = *(_OWORD *)&a3->var11;
      v53[7] = v23;
      v24 = *(_OWORD *)&a3->var1;
      v53[0] = a3->var0;
      v53[1] = v24;
      v25 = *(_OWORD *)&a3->var5;
      v53[2] = *(_OWORD *)&a3->var3;
      v53[3] = v25;
      if (v20)
      {
        objc_msgSend(v20, "outputCurrentStrokePoint:", v53);
      }
      else
      {
        v57 = 0;
        v55 = 0u;
        v56 = 0u;
        memset(&v54, 0, sizeof(v54));
      }
      __s1 = v54;
      v59 = v55;
      v60 = v56;
      v61 = v57;

    }
    memset(&v54, 0, sizeof(v54));
    -[PKTiledView canvasView](self, "canvasView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
      objc_msgSend(v26, "strokeTransform");
    else
      memset(&v54, 0, sizeof(v54));

    v51 = v54;
    CGAffineTransformInvert(&v52, &v51);
    if (!self->_currentPreviewDrawingUUID)
      goto LABEL_22;
    v28 = __s1.d / sqrt(v52.b * v52.b + v52.a * v52.a);
    v29 = v54.tx + __s1.c * v54.c + v54.a * __s1.b;
    v30 = v54.ty + __s1.c * v54.d + v54.b * __s1.b;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v29 - (v28 + 1.0) * 0.5, v30 - (v28 + 1.0) * 0.5, v28 + 1.0, v28 + 1.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
LABEL_22:
        v41 = 0;
LABEL_23:

        return;
      }
    }
    else
    {
      if ((v10 | v13) != 1)
        goto LABEL_22;
      tx = __s1.tx;
      v33 = *((double *)&v59 + 1);
      -[PKTiledView ink](self, "ink");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "behavior");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "particleDescriptor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "particleSize");
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x1E0C9D538] - tx * (v28 + v28) * v37 * 0.5, *(double *)(MEMORY[0x1E0C9D538] + 8) - (v28 + v28) * v38 * 0.5, tx * (v28 + v28) * v37, (v28 + v28) * v38, 2.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v50, 0, sizeof(v50));
      CGAffineTransformMakeRotation(&v50, v33);
      memset(&v49, 0, sizeof(v49));
      CGAffineTransformMakeTranslation(&v49, v29, v30);
      t1 = v50;
      t2 = v49;
      CGAffineTransformConcat(&v48, &t1, &t2);
      objc_msgSend(v31, "applyTransform:", &v48);

      if (!v31)
        goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setLowLatency:", 1);
    objc_msgSend(v31, "bounds");
    v63 = CGRectInset(v62, -50.0, -50.0);
    x = v63.origin.x;
    y = v63.origin.y;
    -[PKToolPreviewView prepareWithFrame:mode:]((void **)&self->_currentPreviewDrawingUUID->super.isa, 0, v63.origin.x, v63.origin.y, v63.size.width, v63.size.height);
    CGAffineTransformMakeTranslation(&v45, -x, -y);
    objc_msgSend(v31, "applyTransform:", &v45);
    v41 = objc_retainAutorelease(v31);
    v42 = objc_msgSend(v41, "CGPath");
    currentPreviewDrawingUUID = self->_currentPreviewDrawingUUID;
    if (currentPreviewDrawingUUID)
    {
      -[objc_class setPath:](currentPreviewDrawingUUID[53].super.isa, "setPath:", v42);
      v44 = self->_currentPreviewDrawingUUID;
    }
    else
    {
      v44 = 0;
    }
    -[NSUUID setHidden:](v44, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    goto LABEL_23;
  }
}

- (void)hoverControllerDidEnd:(id)a3
{
  void *v4;
  int v5;
  _QWORD block[5];

  -[PKTiledView _reenableScrollViewPanGestureIfNecessary](self, "_reenableScrollViewPanGestureIfNecessary", a3);
  -[PKTiledView _endHoverToolPreview](self, "_endHoverToolPreview");
  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "toolShadowLocationWorkaround");

  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PKTiledView_hoverControllerDidEnd___block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __37__PKTiledView_hoverControllerDidEnd___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPencilObserverInteraction workaroundShadowUpdateEnded]((uint64_t)v2);

}

- (void)hoverController:(id)a3 holdGestureMeanTouch:(id *)a4 latestTouch:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];

  v7 = a3;
  if (!self
    || !LOBYTE(self->_refineAnimationController)
    && !*(&self->_editMenuVisible + 1)
    && !BYTE1(self->_refineAnimationController))
  {
    -[PKTiledView convertToShapeAtLocation:](self, "convertToShapeAtLocation:", a5->var0.var0.x, a5->var0.var0.y);
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "toolPreviewShouldWaitForHoverAndHold");

    if (v9)
    {
      v10 = *(_OWORD *)&a5->var9;
      v14[4] = *(_OWORD *)&a5->var7;
      v14[5] = v10;
      v11 = *(_OWORD *)&a5->var13;
      v14[6] = *(_OWORD *)&a5->var11;
      v14[7] = v11;
      v12 = *(_OWORD *)&a5->var1;
      v14[0] = a5->var0;
      v14[1] = v12;
      v13 = *(_OWORD *)&a5->var5;
      v14[2] = *(_OWORD *)&a5->var3;
      v14[3] = v13;
      -[PKTiledView startToolPreviewIfPossibleForInputPoint:](self, "startToolPreviewIfPossibleForInputPoint:", v14);
    }
  }

}

- (void)hoverControllerHoldGestureEnded:(id)a3
{
  double delayHoverPreviewUntil;
  SEL v5;
  id v6;

  if (self)
  {
    delayHoverPreviewUntil = self->_delayHoverPreviewUntil;
    if (delayHoverPreviewUntil != 0.0)
    {
      dispatch_block_cancel(*(dispatch_block_t *)&delayHoverPreviewUntil);
      objc_setProperty_nonatomic_copy(self, v5, 0, 824);
    }
  }
  -[PKTiledView hoverController](self, "hoverController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hideLabel");

}

- (BOOL)shouldStartToolPreviewWhenHovering
{
  id v2;
  char v3;
  void *v4;
  void *v5;

  if (!self->_supportsCopyAsText)
    return 0;
  v2 = *(id *)&self->_delayHoverPreviewUntil;
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "toolPreviewActive") & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "toolIndicatorActive");

    }
  }

  return v3;
}

- (void)startToolPreviewIfPossibleForInputPoint:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  double v8;
  double extraHoverPreviewDelay;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  _OWORD v21[8];

  if (!self
    || !*(&self->_editMenuVisible + 1)
    && !LOBYTE(self->_refineAnimationController)
    && !BYTE1(self->_refineAnimationController))
  {
    -[PKTiledView canvasView](self, "canvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_isCombiningStrokes"))
    {

    }
    else
    {
      -[PKTiledView canvasView](self, "canvasView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isHidden");

      if ((v7 & 1) == 0)
        return;
    }
    v8 = CACurrentMediaTime();
    if (self)
      extraHoverPreviewDelay = self->_extraHoverPreviewDelay;
    else
      extraHoverPreviewDelay = 0.0;
    if (v8 >= extraHoverPreviewDelay
      && !-[PKTiledView _scrollViewIsScrollingOrZoomingOrResizing](self, "_scrollViewIsScrollingOrZoomingOrResizing")
      && !-[PKTiledView _isScrollViewSizeAnimating](self, "_isScrollViewSizeAnimating")
      && -[PKTiledView shouldStartToolPreviewWhenHovering](self, "shouldStartToolPreviewWhenHovering"))
    {
      -[PKTiledView hoverController](self, "hoverController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "toolPreviewMaxZDistance");
      v12 = *(_OWORD *)&a3->var9;
      v21[4] = *(_OWORD *)&a3->var7;
      v21[5] = v12;
      v13 = *(_OWORD *)&a3->var13;
      v21[6] = *(_OWORD *)&a3->var11;
      v21[7] = v13;
      v14 = *(_OWORD *)&a3->var1;
      v21[0] = a3->var0;
      v21[1] = v14;
      v15 = *(_OWORD *)&a3->var5;
      v21[2] = *(_OWORD *)&a3->var3;
      v21[3] = v15;
      v17 = -[PKHoverController adjustedZLimitFromLimit:inputPoint:]((uint64_t)v10, v21, v16);

      if (a3->var6 <= v17)
      {
        if (self)
        {
          *(&self->_editMenuVisible + 1) = 1;
          *(CFTimeInterval *)&self->_strokePreviewView = CACurrentMediaTime();
        }
        else
        {
          CACurrentMediaTime();
        }
        -[PKTiledView _disableScrollViewPanGestureIfNecessary](self, "_disableScrollViewPanGestureIfNecessary");
      }
      else
      {
        if (self)
          *(&self->_editMenuVisible + 1) = 0;
        +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "toolPreviewShouldWaitForHoverAndHold");

        if (v19)
        {
          -[PKTiledView hoverController](self, "hoverController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKHoverController resetHoverHold]((uint64_t)v20);

        }
      }
    }
  }
}

- (void)convertToShapeAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PKShapeDrawingController *v22;
  double v23;
  void *v24;
  void *v25;
  const char *v26;
  dispatch_block_t v27;
  void *v28;
  void *v29;
  double v30;
  dispatch_time_t v31;
  double delayHoverPreviewUntil;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id location;
  _OWORD v39[8];
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;

  y = a3.y;
  x = a3.x;
  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "snapToShapeActive"))
  {

  }
  else
  {
    -[PKTiledView ink](self, "ink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_isStrokeGeneratingInk");

    if ((v8 & 1) != 0)
      return;
  }
  -[PKTiledView _hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "_hitAttachment:includeStandinAttachment:expandBottomAttachment:", 0, 0, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "drawing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledView transformFromViewToStrokeSpaceInAttachment:](self, "transformFromViewToStrokeSpaceInAttachment:", v10);
    objc_msgSend(v10, "strokeSpatialCache");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12 && *(_BYTE *)(v12 + 8))
    {
      objc_msgSend(v10, "strokeSpatialCache");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = *(void **)(v14 + 24);
      else
        v16 = 0;
      v17 = v16;

    }
    else
    {
      v17 = 0;
    }

    objc_msgSend(v11, "strokesIntersectedByPoint:prevPoint:onscreenVisibleStrokes:", v17, v44 + y * v42 + v40 * x, v45 + y * v43 + v41 * x, v44 + y * v42 + v40 * x + 1.0, v45 + y * v43 + v41 * x + 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count") != 1)
      goto LABEL_28;
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "_shapeType"))
    {
      objc_msgSend(v19, "_strokeData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v20, "hasValidPointTimestampData"))
      {
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(v19, "_strokeMask");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        v22 = objc_alloc_init(PKShapeDrawingController);
        v20 = v22;
        if (v22)
          v22->_shapeRecognitionOn = 1;
        -[PKTiledView inputScale](self, "inputScale");
        memset(v39, 0, sizeof(v39));
        -[PKShapeDrawingController shapeFromStroke:inputScale:averageInputPoint:allowedShapeTypes:]((uint64_t)v20, v19, v39, 0, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24 && objc_msgSend(v24, "type") != 6 && objc_msgSend(v25, "type") != 7)
        {
          objc_initWeak(&location, self);
          block[1] = 3221225472;
          block[2] = __40__PKTiledView_convertToShapeAtLocation___block_invoke;
          block[3] = &unk_1E7777A00;
          block[0] = MEMORY[0x1E0C809B0];
          objc_copyWeak(&v37, &location);
          v34 = v11;
          v35 = v19;
          v36 = v25;
          v27 = dispatch_block_create((dispatch_block_flags_t)0, block);
          if (self)
            objc_setProperty_nonatomic_copy(self, v26, v27, 824);

          -[PKTiledView hoverController](self, "hoverController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKHoverController showLabel:atLocation:](v28, CFSTR("Snap to Shape"), x, y);

          +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "hoverAndHoldActionTimeInterval");
          v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
          if (self)
            delayHoverPreviewUntil = self->_delayHoverPreviewUntil;
          else
            delayHoverPreviewUntil = 0.0;
          dispatch_after(v31, MEMORY[0x1E0C80D38], *(dispatch_block_t *)&delayHoverPreviewUntil);

          objc_destroyWeak(&v37);
          objc_destroyWeak(&location);
        }

        goto LABEL_26;
      }
    }
LABEL_27:

LABEL_28:
  }

}

void __40__PKTiledView_convertToShapeAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v15[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "undoableDeleteStrokes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "strokes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "undoableAddNewStrokes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "canvasView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "canvasView:registerUndoCommands:", v9, v10);

    objc_msgSend(WeakRetained, "didChangeDrawing:", *(_QWORD *)(a1 + 32));
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_selectionRefreshWithChangeToDrawings:completion:", v11, &__block_literal_global_511);

    objc_msgSend(WeakRetained, "hoverController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hideLabel");

  }
}

- (CAMetalLayer)metalLayer
{
  return (CAMetalLayer *)objc_msgSend((id)self->_drawingPolicy, "metalLayer");
}

- (void)_findSelectionTranscriptionWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[PKTiledView selectionController](self, "selectionController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 144);
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "_findTranscriptionWithCompletion:", v8);

}

- (id)_accessibilityUserTestingChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v16.receiver = self;
  v16.super_class = (Class)PKTiledView;
  -[PKTiledView _accessibilityUserTestingChildren](&v16, sel__accessibilityUserTestingChildren);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "_accessibilityUserTestingChildren");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)_getAllHandwritingTranscription:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKTiledView selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController getAllHandwritingTranscription:]((uint64_t)v4);

}

- (void)_copyAll:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKTiledView selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController copyAll:]((uint64_t)v4, v5);

}

- (BOOL)_isDrawingEnabled
{
  return self->_supportsCopyAsText;
}

- (PKTiledViewAnimationController)refineAnimationController
{
  return (PKTiledViewAnimationController *)self->_defaultDrawingClass;
}

- (PKLinedPaper)linedPaper
{
  return (PKLinedPaper *)self->_scrollView;
}

- (BOOL)cropDrawingAttachmentsWhenViewIsSmaller
{
  return self->_shouldAdjustStrokeTransformAtEndOfStroke;
}

- (void)setCropDrawingAttachmentsWhenViewIsSmaller:(BOOL)a3
{
  self->_shouldAdjustStrokeTransformAtEndOfStroke = a3;
}

- (unint64_t)drawingPolicy
{
  return (unint64_t)self->_delegate;
}

- (void)setShowDebugOutlines:(BOOL)a3
{
  self->_isLayingOut = a3;
}

- (PKTiledViewDelegate)delegate
{
  return (PKTiledViewDelegate *)objc_loadWeakRetained((id *)&self->_canvasViewZOrderPolicy);
}

- (BOOL)combiningStrokesEnabled
{
  return self->_needUpdateAfterBackgroundTraitCollectionChange;
}

- (void)setCombiningStrokesEnabled:(BOOL)a3
{
  self->_needUpdateAfterBackgroundTraitCollectionChange = a3;
}

- (UIView)contentSnapshottingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentCoordinateSpace);
}

- (void)setContentSnapshottingView:(id)a3
{
  objc_storeWeak((id *)&self->_contentCoordinateSpace, a3);
}

- (void)setContentCoordinateSpace:(id)a3
{
  objc_storeStrong((id *)&self->_maximumSupportedContentVersion, a3);
}

- (int64_t)maximumSupportedContentVersion
{
  return (int64_t)self->_welcomeController;
}

- (void)setMaximumSupportedContentVersion:(int64_t)a3
{
  self->_welcomeController = (PKWelcomeController *)a3;
}

- (BOOL)allowSnapToShape
{
  return self->_hoverIsKnownToBeUnsupported;
}

- (void)setAllowSnapToShape:(BOOL)a3
{
  self->_hoverIsKnownToBeUnsupported = a3;
}

- (PKWelcomeController)welcomeController
{
  return (PKWelcomeController *)self->_pencilLongPressGestureRecognizer;
}

- (void)setWelcomeController:(id)a3
{
  objc_storeStrong((id *)&self->_pencilLongPressGestureRecognizer, a3);
}

- (UIGestureRecognizer)pencilLongPressGestureRecognizer
{
  return &self->_simultaneousDrawingGestureRecognizer->super;
}

- (UIPanGestureRecognizer)simultaneousDrawingGestureRecognizer
{
  return self->_generationToolGestureRecognizer;
}

- (UIPanGestureRecognizer)generationToolGestureRecognizer
{
  return (UIPanGestureRecognizer *)self->_drawingUndoTarget;
}

- (id)drawingUndoTarget
{
  return objc_loadWeakRetained((id *)&self->_drawingUndoSelector);
}

- (SEL)drawingUndoSelector
{
  return (SEL)self->_selectionController;
}

- (void)setTileController:(id)a3
{
  objc_storeStrong((id *)&self->_drawingTouchThatHitNothing, a3);
}

- (UITouch)drawingTouchThatHitNothing
{
  return (UITouch *)self->_rulerHostingDelegate;
}

- (BOOL)selectionHidden
{
  return self->_shouldBeginHoverPreview;
}

- (BOOL)supportsCopyAsText
{
  return self->_hoverPreviewActive;
}

- (id)liveAttachment
{
  return self->_currentDrawingBeingCopiedToCanvas;
}

- (BOOL)aggd_didMergeWithCollaborator
{
  return BYTE3(self->_refineAnimationController);
}

- (void)setAggd_didMergeWithCollaborator:(BOOL)a3
{
  BYTE3(self->_refineAnimationController) = a3;
}

- (int64_t)_maxFileFormatVersion
{
  return (int64_t)self->_editMenuInteraction;
}

- (BOOL)disableUndoManager
{
  return BYTE5(self->_refineAnimationController);
}

- (void)setDisableUndoManager:(BOOL)a3
{
  BYTE5(self->_refineAnimationController) = a3;
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return (UIEditMenuInteraction *)self->_rulerController;
}

- (BOOL)editMenuVisible
{
  return BYTE6(self->_refineAnimationController);
}

- (void)setEditMenuVisible:(BOOL)a3
{
  BYTE6(self->_refineAnimationController) = a3;
}

- (PKRulerController)rulerController
{
  return (PKRulerController *)self->_hoverController;
}

- (PKHoverController)hoverController
{
  return *(PKHoverController **)&self->_lastContentOffset.x;
}

- (void)setHoverController:(id)a3
{
  objc_storeStrong((id *)&self->_lastContentOffset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastContentOffset, 0);
  objc_storeStrong((id *)&self->_hoverController, 0);
  objc_storeStrong((id *)&self->_rulerController, 0);
  objc_storeStrong((id *)&self->_aggd_cachedVisibleStrokeCount, 0);
  objc_destroyWeak((id *)&self->_analyticsSession);
  objc_storeStrong((id *)&self->_pencilStatisticsManager, 0);
  objc_storeStrong((id *)&self->_currentPreviewDrawingUUID, 0);
  objc_storeStrong((id *)&self->_toolPreviewView, 0);
  objc_storeStrong((id *)&self->_erasePreviewDrawing, 0);
  objc_storeStrong((id *)&self->_eraseOrLassoPreviewStrokes, 0);
  objc_storeStrong((id *)&self->_delayHoverPreviewUntil, 0);
  objc_storeStrong(&self->_hoverConvertToShapeBlock, 0);
  objc_storeStrong((id *)&self->_undoManagersRegisteredWith, 0);
  objc_storeStrong(&self->_hideCanvasBlock, 0);
  objc_storeStrong(&self->_updateAttachmentBoundsBlock, 0);
  objc_storeStrong(&self->_didScrollBlock, 0);
  objc_storeStrong((id *)&self->_cachedDrawingVersionForAdditionalStrokes, 0);
  objc_storeStrong((id *)&self->_cachedDrawingUUIDForAdditionalStrokes, 0);
  objc_storeStrong((id *)&self->_cachedVisibleStrokesWithAdditionalStrokesForDirtyDrawing, 0);
  objc_destroyWeak((id *)&self->_lastZoomScale);
  objc_storeStrong((id *)&self->_currentDrawingBeingCopiedToCanvas, 0);
  objc_storeStrong((id *)&self->_liveAttachment, 0);
  objc_destroyWeak((id *)&self->_tileSize);
  objc_storeStrong((id *)&self->_rulerHostingDelegate, 0);
  objc_storeStrong((id *)&self->_drawingTouchThatHitNothing, 0);
  objc_storeStrong((id *)&self->_tileController, 0);
  objc_destroyWeak((id *)&self->_drawingUndoSelector);
  objc_storeStrong(&self->_drawingUndoTarget, 0);
  objc_storeStrong((id *)&self->_generationToolGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_simultaneousDrawingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pencilLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_maximumSupportedContentVersion, 0);
  objc_destroyWeak((id *)&self->_contentCoordinateSpace);
  objc_destroyWeak((id *)&self->_canvasViewZOrderPolicy);
  objc_storeStrong((id *)&self->_drawingPolicy, 0);
  objc_destroyWeak((id *)&self->_canvasView);
  objc_destroyWeak((id *)&self->_attachmentContainerView);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_linedPaper, 0);
  objc_storeStrong((id *)&self->_defaultDrawingClass, 0);
  objc_storeStrong((id *)&self->_timestampForLatestUserInteraction, 0);
  objc_storeStrong((id *)&self->_externalAttachments, 0);
  objc_storeStrong((id *)&self->_shouldResetBaseRollAngleOnNextStroke, 0);
  objc_storeStrong(&self->_updateVisibleTilesAfterZoomOutBlock, 0);
  objc_storeStrong((id *)&self->_dirtyDrawing, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
}

- (void)updateTilesForVisibleRectRendering:(uint64_t)a3 offscreen:(char)a4 overrideAdditionalStrokes:
{
  double *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  __int128 v16;
  void *v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double *v22;
  double *v23;
  unint64_t v24;
  double v25;
  double *v26;
  double v27;
  unint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  void *v34;
  BOOL v35;
  double v36;
  uint64_t v37;
  double v38;
  double *v39;
  double v40;
  unint64_t v41;
  double *v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  double *v52;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  double *v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  int64_t v66;
  int64_t v67;
  int64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 *v92;
  double *v93;
  uint64_t v94;
  void *v95;
  __int128 v96;
  void *v97;
  uint64_t v98;
  unint64_t v99;
  double v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  __int128 v105;
  void *v106;
  void *v107;
  double *v109;
  uint64_t v110;
  double v111;
  double *v112;
  double *v113;
  uint64_t v114;
  void *v115;
  double v116;
  void *v117;
  uint64_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint64_t v127;
  uint64_t v128;

- (void)setupRefineAnimationFrom:(id)a3 to:(id)a4 inDrawing:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PKTiledView refineAnimationController](self, "refineAnimationController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setupRefineAnimationFrom:to:in:completionHandler:", v13, v12, v11, v10);

}

- (void)setupStrokeInAnimationTo:(id)a3 inDrawing:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKTiledView refineAnimationController](self, "refineAnimationController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setupStrokeInAnimationTo:in:completionHandler:", v10, v9, v8);

}

- (void)startRefineAnimationWithDuration:(double)a3
{
  id v4;

  -[PKTiledView refineAnimationController](self, "refineAnimationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startRefineAnimationWithDuration:", a3);

}

- (void)stopRefineAnimation
{
  id v2;

  -[PKTiledView refineAnimationController](self, "refineAnimationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRefineAnimation");

}

@end
