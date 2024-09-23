@implementation PKOverlayDrawingController

- (id)initForView:(void *)a3 delegate:
{
  id v5;
  id v6;
  id *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  objc_super v22;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)PKOverlayDrawingController;
    v7 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 11, v5);
      objc_storeWeak(a1 + 1, v6);
      v8 = objc_opt_new();
      v9 = a1[8];
      a1[8] = (id)v8;

      v10 = objc_opt_new();
      v11 = a1[9];
      a1[9] = (id)v10;

      v12 = objc_opt_new();
      v13 = a1[10];
      a1[10] = (id)v12;

      objc_msgSend(v5, "frame");
      a1[2] = v14;
      a1[3] = v15;
      a1[4] = v16;
      a1[5] = v17;
      objc_msgSend(v5, "frame");
      a1[6] = v18;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = a1[7];
      a1[7] = (id)v19;

    }
  }

  return a1;
}

- (void)viewDidLayout
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
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
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(WeakRetained, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;

    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v6;
    *(double *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = v10;
    if (vabdd_f64(v8, *(double *)(a1 + 48)) >= 0.00999999978)
    {
      *(double *)(a1 + 48) = v8;
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel__updateDrawingViews, 0);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(*(id *)(a1 + 64), "allValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v37 != v14)
              objc_enumerationMutation(v11);
            -[PKOverlayDrawingView imageView](*(id **)(*((_QWORD *)&v36 + 1) + 8 * i));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setHidden:", 1);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v13);
      }

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(*(id *)(a1 + 56), "allValues");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v23 = v22;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v29;
              do
              {
                for (k = 0; k != v25; ++k)
                {
                  if (*(_QWORD *)v29 != v26)
                    objc_enumerationMutation(v23);
                  objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * k), "setHidden:", 1);
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
              }
              while (v25);
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v19);
      }

      objc_msgSend((id)a1, "performSelector:withObject:afterDelay:", sel__updateDrawingViews, 0, 0.1);
    }
  }
}

- (uint64_t)removedFromView
{
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (id *)result;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(*(id *)(result + 56), "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v27;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v27 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v6);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v23;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v23 != v11)
                  objc_enumerationMutation(v8);
                objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12++), "removeFromSuperview");
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
            }
            while (v10);
          }

          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v4);
    }

    objc_msgSend(v1[7], "removeAllObjects");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v1[8], "allValues", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "removeFromSuperview");
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v15);
    }

    objc_msgSend(v1[8], "removeAllObjects");
    objc_msgSend(v1[9], "removeAllObjects");
    return objc_msgSend(v1[10], "removeAllObjects");
  }
  return result;
}

- (void)_updateDrawingViews
{
  PKOverlayDrawingController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  NSMutableDictionary *drawingViewStrokesMap;
  void *v11;
  NSMutableDictionary *drawingViewResultMap;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id WeakRetained;
  void *v26;
  id v27;
  id obj;
  id obja;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[3];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v2 = self;
  v46 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  if (self)
    self = (PKOverlayDrawingController *)self->_drawingViews;
  -[PKOverlayDrawingController allValues](self, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v31;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD **)(*((_QWORD *)&v30 + 1) + 8 * v6);
        if (v7)
          v8 = (void *)v7[53];
        else
          v8 = 0;
        v9 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v2)
            drawingViewStrokesMap = v2->_drawingViewStrokesMap;
          else
            drawingViewStrokesMap = 0;
          -[NSMutableDictionary objectForKeyedSubscript:](drawingViewStrokesMap, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2)
            drawingViewResultMap = v2->_drawingViewResultMap;
          else
            drawingViewResultMap = 0;
          -[NSMutableDictionary objectForKeyedSubscript:](drawingViewResultMap, "objectForKeyedSubscript:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKOverlayDrawingController updateDrawingView:strokes:animationType:result:imageView:]((id *)&v2->super.isa, v7, v11, (void *)2, v13, 0);

        }
        ++v6;
      }
      while (v4 != v6);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
      v4 = v14;
    }
    while (v14);
  }

  if (v2)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[NSMutableDictionary allValues](v2->_activeTokens, "allValues");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v15)
    {
      v16 = v15;
      obja = *(id *)v40;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(id *)v40 != obja)
            objc_enumerationMutation(v27);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v19 = v18;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v36 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
                v26 = WeakRetained;
                if (WeakRetained)
                  objc_msgSend(WeakRetained, "overlayControllerDrawingTransform:", v2);
                else
                  memset(v34, 0, sizeof(v34));
                -[PKMathRecognitionTokenView updateFrameForDrawingTransform:]((uint64_t)v24, v34);

                objc_msgSend(v24, "setHidden:", 0);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            }
            while (v21);
          }

        }
        v16 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v16);
    }

  }
}

- (void)updateDrawingView:(void *)a3 strokes:(void *)a4 animationType:(void *)a5 result:(void *)a6 imageView:
{
  _QWORD *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  const char *v23;
  double v24;
  id WeakRetained;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  id v29[2];
  id location;

  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v15 = (void *)objc_msgSend(v12, "copy");
    v16 = a1[9];
    if (v11)
      v17 = (void *)v11[53];
    else
      v17 = 0;
    v18 = v17;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v18);

    v19 = (void *)objc_msgSend(v13, "copy");
    v20 = a1[10];
    if (v11)
      v21 = (void *)v11[53];
    else
      v21 = 0;
    v22 = v21;
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v22);

    if (objc_msgSend(v12, "count"))
    {
      if (v14)
      {
        objc_msgSend(v14, "setAccessibilityValue:", v13);
        -[PKOverlayDrawingController updateImageView:overlayView:animationType:]((uint64_t)a1, v14, v11, (uint64_t)a4);
      }
      else
      {
        WeakRetained = objc_loadWeakRetained(a1 + 1);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __87__PKOverlayDrawingController_updateDrawingView_strokes_animationType_result_imageView___block_invoke;
        v26[3] = &unk_1E777CAF0;
        objc_copyWeak(v29, &location);
        v27 = v13;
        v28 = v11;
        v29[1] = a4;
        objc_msgSend(WeakRetained, "overlayController:imageViewForStrokes:completion:", a1, v12, v26);

        objc_destroyWeak(v29);
      }
    }
    else
    {
      v24 = 0.2;
      if (!a4)
        v24 = 0.0;
      -[PKOverlayDrawingView hideImageViewWithDuration:]((uint64_t)v11, v23, v24);
    }
    objc_destroyWeak(&location);
  }

}

- (void)hideImageForUUID:(uint64_t)a1
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  id v7;

  if (a1)
  {
    v3 = *(void **)(a1 + 72);
    v4 = a2;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v4);
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v7;
    if (v7)
    {
      -[PKOverlayDrawingView hideImageViewWithDuration:]((uint64_t)v7, v5, 0.0);
      v6 = v7;
    }

  }
}

- (void)updateImageView:(void *)a3 overlayView:(uint64_t)a4 animationType:
{
  id v7;
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
  id WeakRetained;
  void *v19;
  id v20;
  id v21;

  v21 = a2;
  v7 = a3;
  if (a1)
  {
    v8 = 0.3;
    if (a4 == 2)
      v8 = 0.5;
    if (a4)
      v9 = v8;
    else
      v9 = 0.0;
    objc_msgSend(v21, "frame", v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(WeakRetained, "addSubview:", v7);

    objc_msgSend(v21, "setUserInteractionEnabled:", 0);
    objc_msgSend(v21, "setAlpha:", 0.0);
    objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("com.apple.pencilkit.synthesizedMathView"));
    objc_msgSend(v21, "setFrame:", 0.0, 0.0, v15, v17);
    objc_msgSend(v7, "setHidden:", 0);
    objc_msgSend(v21, "setHidden:", 0);
    objc_msgSend(v7, "addSubview:", v21);
    -[PKOverlayDrawingView imageView]((id *)v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      objc_msgSend(v7, "setFrame:", v11, v13, v15, v17);
    v20 = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(v20, "overlayController:willUpdateView:animationDuration:", a1, v7, v9);

    -[PKOverlayDrawingView showImageView:frame:animationType:animationDuration:]((id *)v7, v21, a4, v11, v13, v15, v17, v9);
  }

}

void __87__PKOverlayDrawingController_updateDrawingView_strokes_animationType_result_imageView___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v4, "setAccessibilityValue:", *(_QWORD *)(a1 + 32));
    -[PKOverlayDrawingController updateImageView:overlayView:animationType:]((uint64_t)WeakRetained, v4, *(void **)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

- (PKOverlayDrawingView)viewForUUID:(double)a3 estimatedFrameForNewView:(double)a4
{
  void *v11;
  id v12;
  uint64_t v13;
  PKOverlayDrawingView *v14;
  id WeakRetained;
  const char *v16;
  id v17;

  if (!a1)
  {
    v14 = 0;
    return v14;
  }
  v11 = *(void **)(a1 + 64);
  v12 = a2;
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (PKOverlayDrawingView *)v13;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(WeakRetained, "addSubview:", v14);

LABEL_5:
    objc_setProperty_nonatomic_copy(v14, v16, v12, 424);
    goto LABEL_6;
  }
  v14 = -[PKOverlayDrawingView initWithFrame:]([PKOverlayDrawingView alloc], "initWithFrame:", a3, a4, a5, a6);
  v17 = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(v17, "addSubview:", v14);

  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v14, v12);
  if (v14)
    goto LABEL_5;
LABEL_6:

  return v14;
}

- (void)_removeActiveTokensForItem:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeFromSuperview");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 56), "removeObjectForKey:", v3);
  }

}

- (id)existingViewForUUID:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[8], "objectForKeyedSubscript:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)removeViewForUUID:(int)a3 animated:
{
  id v5;
  id v6;
  void *v7;
  double v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a2;
  if (a1)
  {
    v6 = a1[8];
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (a3)
        v8 = 0.3;
      else
        v8 = 0.0;
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(WeakRetained, "overlayController:willUpdateView:animationDuration:", a1, v7, v8);

      objc_msgSend(a1[8], "removeObjectForKey:", v5);
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v11 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __57__PKOverlayDrawingController_removeViewForUUID_animated___block_invoke;
      v17[3] = &unk_1E7778020;
      v18 = v7;
      v12 = v11;
      v13 = 3221225472;
      v14 = __57__PKOverlayDrawingController_removeViewForUUID_animated___block_invoke_2;
      v15 = &unk_1E7778650;
      v16 = v18;
      objc_msgSend(v10, "animateWithDuration:animations:completion:", v17, &v12, v8);

    }
    objc_msgSend(a1[9], "setObject:forKeyedSubscript:", 0, v5, v12, v13, v14, v15);
    -[PKOverlayDrawingController _removeActiveTokensForItem:]((uint64_t)a1, v5);

  }
}

uint64_t __57__PKOverlayDrawingController_removeViewForUUID_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __57__PKOverlayDrawingController_removeViewForUUID_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)showDetectionAnimationWithImage:(double)a3 frame:(double)a4
{
  objc_class *v11;
  id v12;
  void *v13;
  id WeakRetained;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  dispatch_time_t v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11 = (objc_class *)MEMORY[0x1E0DC3890];
    v12 = a2;
    v13 = (void *)objc_msgSend([v11 alloc], "initWithFrame:", a3, a4, a5, a6);
    objc_msgSend(v13, "setImage:", v12);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(WeakRetained, "addSubview:", v13);

    v15 = objc_alloc_init(MEMORY[0x1E0CD2790]);
    objc_msgSend(v15, "setStartPoint:", -2.0, -2.0);
    objc_msgSend(v15, "setEndPoint:", 0.0, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorWithAlphaComponent:", 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorWithAlphaComponent:", 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setLocations:", &unk_1E77ECE20);
    v20 = objc_retainAutorelease(v17);
    v40[0] = objc_msgSend(v20, "CGColor");
    v21 = objc_retainAutorelease(v19);
    v40[1] = objc_msgSend(v21, "CGColor");
    v22 = objc_retainAutorelease(v21);
    v40[2] = objc_msgSend(v22, "CGColor");
    v23 = objc_retainAutorelease(v20);
    v40[3] = objc_msgSend(v23, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setColors:", v24);

    objc_msgSend(v13, "bounds");
    objc_msgSend(v15, "setFrame:");
    objc_msgSend(v13, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMask:", v15);

    objc_msgSend(v13, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("startPoint"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", -2.0, -2.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFromValue:", v28);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 1.0, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setToValue:", v29);

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("endPoint"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFromValue:", v31);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 3.0, 3.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setToValue:", v32);

    objc_msgSend(v27, "setDuration:", 0.5);
    objc_msgSend(v30, "setDuration:", 0.5);
    objc_msgSend(v27, "setRemovedOnCompletion:", 1);
    objc_msgSend(v30, "setRemovedOnCompletion:", 1);
    objc_msgSend(v27, "keyPath");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v27, v33);

    objc_msgSend(v30, "keyPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v30, v34);

    v35 = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(v35, "overlayController:willUpdateView:animationDuration:", a1, 0, 0.5);

    v36 = dispatch_time(0, 500000000);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __68__PKOverlayDrawingController_showDetectionAnimationWithImage_frame___block_invoke;
    v38[3] = &unk_1E7778020;
    v39 = v13;
    v37 = v13;
    dispatch_after(v36, MEMORY[0x1E0C80D38], v38);

  }
}

uint64_t __68__PKOverlayDrawingController_showDetectionAnimationWithImage_frame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setTokens:(void *)a3 item:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id WeakRetained;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKOverlayDrawingController _removeActiveTokensForItem:](a1, v8);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = v5;
    obj = v5;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(obj);
          +[PKMathRecognitionTokenView viewForToken:item:]((uint64_t)PKMathRecognitionTokenView, *(void **)(*((_QWORD *)&v25 + 1) + 8 * i), v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = v9;
            objc_msgSend(v9, "addObject:", v14);
            WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
            objc_msgSend(WeakRetained, "addSubview:", v14);

            v17 = objc_loadWeakRetained((id *)(a1 + 8));
            v18 = v17;
            if (v17)
              objc_msgSend(v17, "overlayControllerDrawingTransform:", a1);
            else
              memset(v24, 0, sizeof(v24));
            -[PKMathRecognitionTokenView updateFrameForDrawingTransform:]((uint64_t)v14, v24);

            v9 = v15;
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v9, "count"))
    {
      v19 = (void *)objc_msgSend(v9, "copy");
      v20 = *(void **)(a1 + 56);
      objc_msgSend(v7, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

    }
    v5 = v22;
  }

}

- (BOOL)hasVisibleTokensForItem:(uint64_t)a1
{
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (double)timestampForVisibleTokensForItem:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = 0.0;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if (v8)
          v9 = *(double *)(v8 + 440);
        else
          v9 = 0.0;
        if (v6 < v9)
          v6 = v9;
        ++v7;
      }
      while (v4 != v7);
      v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = v10;
    }
    while (v10);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)removeTokensFor:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    objc_msgSend(a2, "uuid");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PKOverlayDrawingController _removeActiveTokensForItem:](a1, v3);

  }
}

- (void)removeToken:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = *(void **)(a1 + 56);
      objc_msgSend(v5, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD **)(*((_QWORD *)&v23 + 1) + 8 * v15);
            if (v16)
              v17 = (void *)v16[53];
            else
              v17 = 0;
            v18 = v17;

            if (v18 == v4)
            {
              objc_msgSend(v16, "removeFromSuperview", (_QWORD)v23);
              objc_msgSend(v11, "removeObject:", v16);
              v20 = (void *)objc_msgSend(v11, "copy");
              v21 = *(void **)(a1 + 56);
              objc_msgSend(v6, "uuid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

              goto LABEL_17;
            }
            ++v15;
          }
          while (v13 != v15);
          v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          v13 = v19;
        }
        while (v19);
      }
LABEL_17:

    }
  }

}

- (uint64_t)removeAllTokens
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(result + 56), "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v18;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v18 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
          v13 = 0u;
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v14;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v14 != v11)
                  objc_enumerationMutation(v8);
                objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "removeFromSuperview");
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
            }
            while (v10);
          }

          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v4);
    }

    return objc_msgSend(*(id *)(v1 + 56), "removeAllObjects");
  }
  return result;
}

- (id)tokenAtLocation:(CGFloat)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  _QWORD *v16;
  id v17;
  void *v18;
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
  CGPoint v31;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(*(id *)(a1 + 56), "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v21;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v21 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD **)(*((_QWORD *)&v20 + 1) + 8 * j);
                objc_msgSend(v16, "frame");
                v31.x = a2;
                v31.y = a3;
                if (CGRectContainsPoint(v32, v31))
                {
                  if (v16)
                    v18 = (void *)v16[53];
                  else
                    v18 = 0;
                  v17 = v18;

                  goto LABEL_22;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              if (v13)
                continue;
              break;
            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        v17 = 0;
      }
      while (v7);
    }
    else
    {
      v17 = 0;
    }
LABEL_22:

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)allViews
{
  id *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL IsNull;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGRect v19;

  v1 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[8], "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v1[8], "allValues", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v8, "superview");
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            objc_msgSend(v8, "frame");
            IsNull = CGRectIsNull(v19);

            if (!IsNull)
              objc_msgSend(v2, "addObject:", v8);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

    v1 = (id *)objc_msgSend(v2, "copy");
  }
  return v1;
}

- (id)drawingViewAtLocation:(double)a3
{
  id *v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t i;
  id *v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGPoint v28;
  CGRect v29;

  v3 = a1;
  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PKOverlayDrawingController allViews](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      v10 = v3 + 11;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v12 = *(id **)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[PKOverlayDrawingView imageView](v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            WeakRetained = objc_loadWeakRetained(v10);
            -[PKOverlayDrawingView imageView](v12);
            v15 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "convertPoint:toView:", v15, a2, a3, (_QWORD)v22);
            v17 = v16;
            v19 = v18;

            -[PKOverlayDrawingView imageView](v12);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "bounds");
            v28.x = v17;
            v28.y = v19;
            LOBYTE(v15) = CGRectContainsPoint(v29, v28);

            if ((v15 & 1) != 0)
            {
              v3 = v12;
              goto LABEL_13;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v8)
          continue;
        break;
      }
    }
    v3 = 0;
LABEL_13:

  }
  return v3;
}

- (id)drawingForAllResultsForSourceDrawing:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(a1[9], "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
      a1 = (id *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStrokes:fromDrawing:", v4, v3);
    else
      a1 = 0;

  }
  return a1;
}

- (void)didUpdateExpressions:(uint64_t)a1 newItems:(void *)a2 removedItems:
{
  id v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  BOOL v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = CACurrentMediaTime();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(a1 + 56), "allKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v11 = -[PKOverlayDrawingController timestampForVisibleTokensForItem:](a1, (uint64_t)v10);
          v12 = v11 <= 0.0 || v4 - v11 <= 30.0;
          if (!v12 && (objc_msgSend(v3, "containsObject:", v10) & 1) == 0)
            -[PKOverlayDrawingController _removeActiveTokensForItem:](a1, v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_drawingViewResultMap, 0);
  objc_storeStrong((id *)&self->_drawingViewStrokesMap, 0);
  objc_storeStrong((id *)&self->_drawingViews, 0);
  objc_storeStrong((id *)&self->_activeTokens, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
