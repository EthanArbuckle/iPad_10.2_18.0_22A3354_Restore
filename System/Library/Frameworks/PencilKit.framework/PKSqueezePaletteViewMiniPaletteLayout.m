@implementation PKSqueezePaletteViewMiniPaletteLayout

- (id)initWithUndoButton:(void *)a3 redoButton:(void *)a4 drawingTools:(void *)a5 selectedToolIndex:(void *)a6 eraserToolIndex:(void *)a7 visibleToolsCount:(void *)a8 multicolorButton:(double)a9 moreButton:(void *)a10 startAngle:
{
  id v19;
  id v20;
  id *v21;
  id *v22;
  id v23;
  id *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  PKSqueezePaletteClipIndicatorView *v31;
  id v32;
  PKViewWithHitTestHandler *v33;
  id v34;
  const char *v35;
  id v36;
  uint64_t v37;
  id v38;
  id v40;
  id v41;
  id v42;
  _QWORD newValue[4];
  id v44;
  id location;
  objc_super v46;

  v42 = a2;
  v41 = a3;
  v19 = a4;
  v40 = a8;
  v20 = a10;
  if (a1)
  {
    v46.receiver = a1;
    v46.super_class = (Class)PKSqueezePaletteViewMiniPaletteLayout;
    v21 = (id *)objc_msgSendSuper2(&v46, sel_init);
    a1 = v21;
    if (v21)
    {
      *((double *)v21 + 34) = a9;
      objc_storeStrong(v21 + 37, a2);
      objc_storeStrong(a1 + 38, a3);
      v22 = -[PKSqueezePaletteViewUndoRedoLayout initWithUndoButton:redoButton:startAngle:]((id *)[PKSqueezePaletteViewUndoRedoLayout alloc], a1[37], a1[38], a9);
      v23 = a1[1];
      a1[1] = v22;

      v24 = (id *)a1[1];
      if (v24)
        objc_storeWeak(v24 + 12, a1);
      v25 = objc_msgSend(v19, "copy");
      v26 = a1[39];
      a1[39] = (id)v25;

      a1[40] = a5;
      a1[41] = a6;
      a1[42] = a7;
      objc_storeStrong(a1 + 43, a8);
      objc_storeStrong(a1 + 44, a10);
      v27 = PKSqueezePaletteBeforeToolsSpacing;
      a1[2] = (id)PKSqueezePaletteButtonInterItemSpacing;
      a1[3] = (id)v27;
      v28 = PKSqueezePaletteAfterToolsSpacing;
      a1[4] = (id)PKSqueezePaletteToolsInterItemSpacing;
      a1[5] = (id)v28;
      v29 = -[PKFloatArray initWithCapacity:]([PKFloatArray alloc], objc_msgSend(a1[39], "count"));
      v30 = a1[6];
      a1[6] = v29;

      *((int64x2_t *)a1 + 5) = vdupq_n_s64(0x4042800000000000uLL);
      a1[12] = (id)PKSqueezePaletteToolContainerWidth;
      v31 = objc_alloc_init(PKSqueezePaletteClipIndicatorView);
      v32 = a1[22];
      a1[22] = v31;

      v33 = objc_alloc_init(PKViewWithHitTestHandler);
      v34 = a1[20];
      a1[20] = v33;

      objc_initWeak(&location, a1);
      newValue[0] = MEMORY[0x1E0C809B0];
      newValue[1] = 3221225472;
      newValue[2] = __175__PKSqueezePaletteViewMiniPaletteLayout_initWithUndoButton_redoButton_drawingTools_selectedToolIndex_eraserToolIndex_visibleToolsCount_multicolorButton_moreButton_startAngle___block_invoke;
      newValue[3] = &unk_1E77788C0;
      objc_copyWeak(&v44, &location);
      v36 = a1[20];
      if (v36)
        objc_setProperty_nonatomic_copy(v36, v35, newValue, 416);
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = a1[21];
      a1[21] = (id)v37;

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

id __175__PKSqueezePaletteViewMiniPaletteLayout_initWithUndoButton_redoButton_drawingTools_selectedToolIndex_eraserToolIndex_visibleToolsCount_multicolorButton_moreButton_startAngle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id *WeakRetained;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  unint64_t v15;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v4);
  v8 = v6;
  v9 = v5;
  if (!WeakRetained)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v10 = objc_loadWeakRetained(WeakRetained + 36);
  v11 = v10;
  v12 = v10 ? (void *)*((_QWORD *)v10 + 72) : 0;
  v13 = v12;

  if (v13 != WeakRetained
    || (v15 = objc_msgSend(WeakRetained[39], "indexOfObject:", v8), v15 != 0x7FFFFFFFFFFFFFFFLL)
    && v15 < (unint64_t)WeakRetained[42])
  {
    v14 = v8;
  }
  else
  {
LABEL_9:
    v14 = 0;
  }

  return v14;
}

- (void)setPaletteView:(id)a3
{
  id WeakRetained;
  id v5;
  PKSqueezePaletteViewUndoRedoLayout *undoRedoLayout;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_paletteView, obj);
    undoRedoLayout = self->_undoRedoLayout;
    v7 = v5;
    -[PKSqueezePaletteViewUndoRedoLayout setPaletteView:](undoRedoLayout, "setPaletteView:", obj);

  }
}

- (void)_didTapDrawingTool:(id)a3
{
  -[PKSqueezePaletteViewMiniPaletteLayout _performDrawingToolTapAction:]((uint64_t)self, a3);
}

- (void)_performDrawingToolTapAction:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138477827;
      v6 = v3;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "drawing tool tapped: %{private}@", (uint8_t *)&v5, 0xCu);
    }

    -[PKSqueezePaletteViewMiniPaletteLayout _selectTool:](a1, v3);
  }

}

- (void)_selectTool:(uint64_t)a1
{
  id *v3;
  uint64_t v4;
  void *v5;
  double v6;
  id v7;
  id v8;
  char v9;
  void (**v10)(_QWORD, _QWORD);
  id *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void **v28;
  id v29;
  id v30;
  id v31;
  int v32;
  id v33;
  id v34;
  id *v35;
  id *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  id v43;
  int v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[PKSqueezePaletteViewMiniPaletteLayout _selectedTool](a1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4 && (id *)v4 == v3)
  {
    v6 = -[PKFloatArray floatAtIndex:](*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 320));
    v7 = v3[103];
    if ((objc_msgSend(v7, "_isInkingTool") & 1) != 0)
    {
      v8 = v3[103];
      v9 = objc_msgSend(v8, "_isHandwritingTool");

      if ((v9 & 1) == 0)
      {
        v10 = (void (**)(_QWORD, _QWORD))-[PKSqueezePaletteViewExpandedInkingToolLayoutContext initWithDrawingTool:toolAngle:previousLayout:]((id *)[PKSqueezePaletteViewExpandedInkingToolLayoutContext alloc], v3, (void *)a1, v6);
        v11 = (id *)(a1 + 288);
        WeakRetained = objc_loadWeakRetained(v11);
        v13 = WeakRetained;
        if (WeakRetained)
          v14 = (void *)*((_QWORD *)WeakRetained + 71);
        else
          v14 = 0;
        v15 = v14;
        -[PKSqueezePaletteViewLayoutFactory makeExpandedInkingToolLayoutWithContext:](v15, v10);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        v17 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        LOWORD(v44) = 0;
        v18 = "Navigate to expanded inking tool layout";
LABEL_19:
        _os_log_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v44, 2u);
LABEL_20:

        v29 = objc_loadWeakRetained(v11);
        -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v29, v16);

LABEL_24:
        goto LABEL_25;
      }
    }
    else
    {

    }
    v23 = v3[103];
    v24 = objc_msgSend(v23, "_isEraserTool");

    if (v24)
    {
      v10 = (void (**)(_QWORD, _QWORD))-[PKSqueezePaletteViewExpandedEraserToolLayoutContext initWithDrawingTool:toolAngle:previousLayout:]((id *)[PKSqueezePaletteViewExpandedEraserToolLayoutContext alloc], v3, (void *)a1, v6);
      v11 = (id *)(a1 + 288);
      v25 = objc_loadWeakRetained(v11);
      v26 = v25;
      if (v25)
        v27 = (void *)*((_QWORD *)v25 + 71);
      else
        v27 = 0;
      v28 = v27;
      -[PKSqueezePaletteViewLayoutFactory makeExpandedEraserToolLayoutWithContext:](v28, v10);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v17 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      LOWORD(v44) = 0;
      v18 = "Navigate to expanded eraser tool layout";
      goto LABEL_19;
    }
    v31 = v3[103];
    v32 = objc_msgSend(v31, "_isLassoTool");

    if (!v32)
      goto LABEL_26;
    v33 = v3[103];
    objc_msgSend(v33, "_barButtonItemsProvider");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v34 = v3[103];
      ((void (**)(_QWORD, id))v10)[2](v10, v34);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "count"))
      {
        v35 = -[PKSqueezePaletteViewExpandedLassoToolLayoutContext initWithDrawingTool:toolAngle:barButtonItems:previousLayout:]((id *)[PKSqueezePaletteViewExpandedLassoToolLayoutContext alloc], v3, v16, (void *)a1, v6);
        v36 = (id *)(a1 + 288);
        v37 = objc_loadWeakRetained(v36);
        v38 = v37;
        if (v37)
          v39 = (void *)*((_QWORD *)v37 + 71);
        else
          v39 = 0;
        v40 = v39;
        -[PKSqueezePaletteViewLayoutFactory makeExpandedLassoToolLayoutWithContext:]((uint64_t)v40, v35);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v44 = 134217984;
          v45 = objc_msgSend(v16, "count");
          _os_log_impl(&dword_1BE213000, v42, OS_LOG_TYPE_DEFAULT, "Navigate to expanded lasso tool layout, bar button items: %ld", (uint8_t *)&v44, 0xCu);
        }

        v43 = objc_loadWeakRetained(v36);
        -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v43, v41);

      }
      goto LABEL_24;
    }
  }
  else
  {
    if (v3)
      v19 = v3[103];
    else
      v19 = 0;
    v20 = v19;
    v21 = objc_msgSend(v20, "_isRulerTool");

    if (!v21)
    {
      -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](v5, 0, 1, 0);
      *(_QWORD *)(a1 + 320) = objc_msgSend(*(id *)(a1 + 312), "indexOfObject:", v3);
      *(double *)(a1 + 256) = -[PKSqueezePaletteViewMiniPaletteLayout _defaultToolsContentClipIndicatorAngle](a1);
      -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](v3, 1, 1, 0);
      v10 = (void (**)(_QWORD, _QWORD))objc_loadWeakRetained((id *)(a1 + 288));
      if (v3)
        v30 = v3[103];
      else
        v30 = 0;
      v16 = v30;
      -[PKSqueezePaletteView _didSelectTool:atIndex:]((uint64_t)v10, v16, *(_QWORD *)(a1 + 320));
      goto LABEL_24;
    }
    v10 = (void (**)(_QWORD, _QWORD))-[PKSqueezePaletteViewTapRulerAction initWithRulerTool:]((id *)[PKSqueezePaletteViewTapRulerAction alloc], v3);
    -[PKSqueezePaletteViewTapRulerAction performAction]((uint64_t)v10);
    v22 = objc_loadWeakRetained((id *)(a1 + 288));
    -[PKSqueezePaletteView _didTapRuler]((uint64_t)v22);

  }
LABEL_25:

LABEL_26:
}

- (id)_selectedTool
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 320) == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    objc_msgSend(*(id *)(a1 + 312), "objectAtIndexedSubscript:");
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (double)_defaultToolsContentClipIndicatorAngle
{
  uint64_t v2;
  double v3;
  double v4;
  double *WeakRetained;
  double v6;
  double v7;

  if (!a1)
    return 0.0;
  v2 = *(_QWORD *)(a1 + 336);
  if (!v2)
    return 1.79769313e308;
  v3 = -[PKFloatArray floatAtIndex:](*(_QWORD *)(a1 + 48), v2 - 1);
  if (*(_QWORD *)(a1 + 320) == 2)
    v4 = 17.0;
  else
    v4 = 10.0;
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 288));
  if (WeakRetained)
    v6 = WeakRetained[63];
  else
    v6 = 0.0;
  v7 = v3 + v4 / v6;

  return v7;
}

- (void)_performMulticolorButtonTapAction
{
  NSObject *v2;
  PKSqueezePaletteViewExpandedColorsLayoutContext *v3;
  void *v4;
  id *v5;
  id *v6;
  id *WeakRetained;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id *v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  id v24;
  __int16 v25[8];

  if (!a1)
    return;
  v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v25[0] = 0;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "multicolor button tapped", (uint8_t *)v25, 2u);
  }

  v3 = [PKSqueezePaletteViewExpandedColorsLayoutContext alloc];
  -[PKSqueezePaletteViewMiniPaletteLayout _selectedTool](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKSqueezePaletteViewExpandedColorsLayoutContext initWithSelectedTool:multicolorButton:multicolorButtonAngle:previousLayout:]((id *)&v3->super.isa, v4, *(void **)(a1 + 344), (void *)a1, *(double *)(a1 + 104));

  v6 = (id *)(a1 + 288);
  WeakRetained = (id *)objc_loadWeakRetained(v6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[73];
    v10 = v9;
    if (v9)
    {
      v11 = (void *)*((_QWORD *)v9 + 4);
      goto LABEL_7;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = 0;
LABEL_7:
  v12 = v11;

  v13 = (id *)objc_loadWeakRetained(v6);
  v14 = v13;
  if (!v13)
  {
    v16 = 0;
    goto LABEL_17;
  }
  v15 = v13[73];
  v16 = v15;
  if (!v15)
  {
LABEL_17:
    v17 = 0;
    goto LABEL_10;
  }
  v17 = (void *)*((_QWORD *)v15 + 5);
LABEL_10:
  v18 = v17;

  v19 = objc_loadWeakRetained(v6);
  v20 = v19;
  if (v19)
    v21 = (void *)*((_QWORD *)v19 + 71);
  else
    v21 = 0;
  v22 = v21;
  -[PKSqueezePaletteViewLayoutFactory makeExpandedColorsLayoutWithContext:colors:selectedColor:](v22, v5, v12, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_loadWeakRetained(v6);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v24, v23);

}

- (void)_performMoreButtonTapAction
{
  NSObject *v2;
  id *v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  uint8_t v14[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "more button tapped", v14, 2u);
    }

    v3 = (id *)(a1 + 288);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 288));
    if (WeakRetained && (v5 = WeakRetained[73]) != 0)
    {
      v6 = *(unsigned __int8 *)(v5 + 8);

      if (v6)
      {
        v7 = -[PKSqueezePaletteViewExpandedOptionsLayoutContext initMoreButtonAngle:previousLayout:]((id *)[PKSqueezePaletteViewExpandedOptionsLayoutContext alloc], (void *)a1, *(double *)(a1 + 112));
        v8 = objc_loadWeakRetained((id *)(a1 + 288));
        v9 = v8;
        if (v8)
          v10 = (void *)*((_QWORD *)v8 + 71);
        else
          v10 = 0;
        v11 = v10;
        -[PKSqueezePaletteViewLayoutFactory makeExpandedOptionsLayoutWithContext:](v11, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_loadWeakRetained(v3);
        -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v13, v12);

        goto LABEL_12;
      }
    }
    else
    {

    }
    v7 = objc_loadWeakRetained((id *)(a1 + 288));
    -[PKSqueezePaletteView _didTapMoreOptionsButton:]((uint64_t)v7, *(void **)(a1 + 352));
LABEL_12:

  }
}

- (void)_handlePanGesture:(id)a3
{
  PKSqueezePaletteView **p_paletteView;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double MidX;
  id v12;
  double MidY;
  long double v14;
  double v15;
  double v16;
  double v18;
  uint64_t v19;
  PKFloatArray *v20;
  PKFloatArray *toolAnglesBeforePanning;
  PKSqueezePaletteViewUndoRedoLayout *v22;
  double redoButtonAngle;
  NSArray *v24;
  _QWORD *v25;
  unsigned __int8 *v26;
  int v27;
  double startPanGestureAngleOnArc;
  double v29;
  double *v30;
  NSArray *drawingTools;
  id *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  PKFloatArray *v39;
  PKFloatArray *toolAngles;
  PKSqueezePaletteViewUndoRedoLayout *undoRedoLayout;
  PKSqueezePaletteViewUndoRedoLayout *v42;
  unint64_t v43;
  double v44;
  double v45;
  double *v46;
  double *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  unsigned __int8 *v56;
  void *v57;
  int v58;
  char *v59;
  uint64_t v60;
  double v61;
  unint64_t v62;
  double v63;
  double v64;
  double v65;
  double *v66;
  double *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  PKSqueezePaletteViewUndoRedoLayout *v74;
  PKSqueezePaletteViewUndoRedoLayout *v75;
  uint64_t v76;
  id v77;
  _QWORD v78[5];
  _QWORD v79[5];
  CGRect v80;
  CGRect v81;

  v77 = a3;
  p_paletteView = &self->_paletteView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  objc_msgSend(v77, "locationInView:", WeakRetained);
  v7 = v6;
  v9 = v8;

  v10 = objc_loadWeakRetained((id *)&self->_paletteView);
  objc_msgSend(v10, "bounds");
  MidX = CGRectGetMidX(v80);
  v12 = objc_loadWeakRetained((id *)&self->_paletteView);
  objc_msgSend(v12, "bounds");
  MidY = CGRectGetMidY(v81);

  v14 = atan2(v9 - MidY, v7 - MidX);
  v15 = fmod(v14, 6.28318531);
  v16 = 0.0;
  if (v14 <= 6.28318531 && v14 >= 0.0)
    v15 = v14;
  if (v15 < 0.0)
    v15 = v15 + 6.28318531;
  if (v15 == 0.0)
    v18 = 0.0;
  else
    v18 = v15;
  v19 = objc_msgSend(v77, "state");
  if (v19 == 3)
  {
    self->_endPanGestureAngleOnArc = v18;
    -[NSArray enumerateObjectsUsingBlock:](self->_drawingTools, "enumerateObjectsUsingBlock:", &__block_literal_global_14);
    v29 = -[PKFloatArray floatAtIndex:]((uint64_t)self->_toolAngles, 0);
    v30 = (double *)objc_loadWeakRetained((id *)&self->_paletteView);
    if (v30)
      v16 = v30[65];

    if (v29 - v16 >= 0.5)
    {
      v39 = (PKFloatArray *)-[PKFloatArray copy](self->_toolAnglesBeforePanning, "copy");
      toolAngles = self->_toolAngles;
      self->_toolAngles = v39;

      undoRedoLayout = self->_undoRedoLayout;
      if (undoRedoLayout)
      {
        undoRedoLayout->_undoButtonAngle = self->_initialUndoButtonAngle;
        -[PKSqueezePaletteViewUndoRedoLayout _updateUndoButtonConstraints]((uint64_t)undoRedoLayout);
        v42 = self->_undoRedoLayout;
        if (v42)
        {
          v42->_redoButtonAngle = self->_initialRedoButtonAngle;
          -[PKSqueezePaletteViewUndoRedoLayout _updateRedoButtonConstraints]((uint64_t)v42);
        }
      }
      *(_OWORD *)&self->_multicolorButtonAngle = *(_OWORD *)&self->_initialMulticolorButtonAngle;
      self->_toolsContentClippingIndicatorAngle = self->_initialToolsContentClippingIndicatorAngle;
      if (-[NSArray count](self->_drawingTools, "count"))
      {
        v43 = 0;
        v44 = *MEMORY[0x1E0C9D538];
        v45 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        do
        {
          v46 = (double *)objc_loadWeakRetained((id *)&self->_paletteView);
          v47 = v46;
          if (v46)
            v48 = v46[63];
          else
            v48 = 0.0;
          v49 = -[PKFloatArray floatAtIndex:]((uint64_t)self->_toolAngles, v43);
          v50 = PKPointOnArc(v44, v45, v48, v49);
          v52 = v51;

          -[NSArray objectAtIndexedSubscript:](self->_toolCenterXConstraints, "objectAtIndexedSubscript:", v43);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setConstant:", v50);

          -[NSArray objectAtIndexedSubscript:](self->_toolCenterYConstraints, "objectAtIndexedSubscript:", v43);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setConstant:", v52);

          ++v43;
        }
        while (v43 < -[NSArray count](self->_drawingTools, "count"));
      }
      -[PKSqueezePaletteViewMiniPaletteLayout updateUI](self, "updateUI");
    }
    else
    {
      drawingTools = self->_drawingTools;
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke_4;
      v78[3] = &unk_1E77788E8;
      v78[4] = self;
      -[NSArray enumerateObjectsUsingBlock:](drawingTools, "enumerateObjectsUsingBlock:", v78);
      v32 = -[PKSqueezePaletteViewExpandedToolsLayoutContext initWithPreviousLayout:]((id *)[PKSqueezePaletteViewExpandedToolsLayoutContext alloc], self);
      v33 = objc_loadWeakRetained((id *)&self->_paletteView);
      v34 = v33;
      if (v33)
        v35 = (void *)*((_QWORD *)v33 + 71);
      else
        v35 = 0;
      v36 = v35;
      -[PKSqueezePaletteViewLayoutFactory makeExpandedToolsLayoutWithContext:drawingTools:selectedToolIndex:visibleToolsCount:delegate:]((uint64_t)v36, v32, self->_drawingTools, (void *)self->_selectedToolIndex, (void *)self->_visibleToolsCount, self);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = objc_loadWeakRetained((id *)p_paletteView);
      -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v38, v37);

    }
    goto LABEL_63;
  }
  if (v19 != 2)
  {
    if (v19 == 1)
    {
      self->_startPanGestureLocation.y = v9;
      self->_startPanGestureAngleOnArc = v18;
      self->_startPanGestureLocation.x = v7;
      v20 = (PKFloatArray *)-[PKFloatArray copy](self->_toolAngles, "copy");
      toolAnglesBeforePanning = self->_toolAnglesBeforePanning;
      self->_toolAnglesBeforePanning = v20;

      v22 = self->_undoRedoLayout;
      if (v22)
      {
        self->_initialUndoButtonAngle = v22->_undoButtonAngle;
        redoButtonAngle = v22->_redoButtonAngle;
      }
      else
      {
        self->_initialUndoButtonAngle = 0.0;
        redoButtonAngle = 0.0;
      }
      self->_initialRedoButtonAngle = redoButtonAngle;
      *(_OWORD *)&self->_initialMulticolorButtonAngle = *(_OWORD *)&self->_multicolorButtonAngle;
      self->_initialToolsContentClippingIndicatorAngle = self->_toolsContentClippingIndicatorAngle;
      v24 = self->_drawingTools;
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke;
      v79[3] = &unk_1E77788E8;
      v79[4] = self;
      v25 = v79;
LABEL_62:
      -[NSArray enumerateObjectsUsingBlock:](v24, "enumerateObjectsUsingBlock:", v25);
      goto LABEL_63;
    }
    goto LABEL_63;
  }
  v26 = (unsigned __int8 *)objc_loadWeakRetained((id *)&self->_paletteView);
  if (v26)
  {
    v27 = v26[488];
    startPanGestureAngleOnArc = self->_startPanGestureAngleOnArc;

    if (v27)
    {
      if (v18 > startPanGestureAngleOnArc)
        goto LABEL_63;
      goto LABEL_40;
    }
  }
  else
  {
    startPanGestureAngleOnArc = self->_startPanGestureAngleOnArc;
  }
  if (v18 < startPanGestureAngleOnArc)
    goto LABEL_63;
LABEL_40:
  v55 = -[PKFloatArray floatAtIndex:]((uint64_t)self->_toolAnglesBeforePanning, 0)
      + v18
      - self->_startPanGestureAngleOnArc;
  v56 = (unsigned __int8 *)objc_loadWeakRetained((id *)&self->_paletteView);
  v57 = v56;
  if (v56)
  {
    v58 = v56[488];
    v59 = (char *)objc_loadWeakRetained((id *)&self->_paletteView);
    if (v58)
    {
      if (v59)
      {
        v60 = 520;
LABEL_49:
        v61 = *(double *)&v59[v60];
        goto LABEL_50;
      }
      goto LABEL_64;
    }
  }
  else
  {
    v59 = (char *)objc_loadWeakRetained((id *)&self->_paletteView);
  }
  if (v59)
  {
    v60 = 528;
    goto LABEL_49;
  }
LABEL_64:
  v61 = 0.0;
LABEL_50:

  if (v55 >= v61)
  {
    if (-[NSArray count](self->_drawingTools, "count"))
    {
      v62 = 0;
      v63 = *MEMORY[0x1E0C9D538];
      v64 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      do
      {
        v65 = -[PKFloatArray floatAtIndex:]((uint64_t)self->_toolAnglesBeforePanning, v62)
            + v18
            - self->_startPanGestureAngleOnArc;
        -[PKFloatArray setFloat:atIndex:]((uint64_t)self->_toolAngles, v62, v65);
        v66 = (double *)objc_loadWeakRetained((id *)&self->_paletteView);
        v67 = v66;
        if (v66)
          v68 = v66[63];
        else
          v68 = 0.0;
        v69 = PKPointOnArc(v63, v64, v68, v65);
        v71 = v70;

        -[NSArray objectAtIndexedSubscript:](self->_toolCenterXConstraints, "objectAtIndexedSubscript:", v62);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setConstant:", v69);

        -[NSArray objectAtIndexedSubscript:](self->_toolCenterYConstraints, "objectAtIndexedSubscript:", v62);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setConstant:", v71);

        ++v62;
      }
      while (v62 < -[NSArray count](self->_drawingTools, "count"));
    }
    v74 = self->_undoRedoLayout;
    if (v74)
    {
      v74->_undoButtonAngle = self->_initialUndoButtonAngle + v18 - self->_startPanGestureAngleOnArc;
      -[PKSqueezePaletteViewUndoRedoLayout _updateUndoButtonConstraints]((uint64_t)v74);
      v75 = self->_undoRedoLayout;
      if (v75)
      {
        v75->_redoButtonAngle = self->_initialRedoButtonAngle + v18 - self->_startPanGestureAngleOnArc;
        -[PKSqueezePaletteViewUndoRedoLayout _updateRedoButtonConstraints]((uint64_t)v75);
      }
    }
    *(double *)&v76 = v18 - self->_startPanGestureAngleOnArc;
    *(float64x2_t *)&self->_multicolorButtonAngle = vsubq_f64(*(float64x2_t *)&self->_initialMulticolorButtonAngle, (float64x2_t)vdupq_lane_s64(v76, 0));
    self->_toolsContentClippingIndicatorAngle = self->_initialToolsContentClippingIndicatorAngle - *(double *)&v76;
    -[PKSqueezePaletteViewMiniPaletteLayout updateUI](self, "updateUI");
    v24 = self->_drawingTools;
    v25 = &__block_literal_global_13;
    goto LABEL_62;
  }
LABEL_63:

}

void __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 288);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "bringSubviewToFront:", v3);

}

void __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  -[PKSqueezePaletteDrawingTool setDragging:](a2, 1);
}

void __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke_3(uint64_t a1, uint64_t a2)
{
  -[PKSqueezePaletteDrawingTool setDragging:](a2, 0);
}

uint64_t __59__PKSqueezePaletteViewMiniPaletteLayout__handlePanGesture___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__didTapDrawingTool_, 64);
}

- (uint64_t)_updateMulticolorButtonConstraints
{
  uint64_t v1;
  double *WeakRetained;
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (result)
  {
    v1 = result;
    WeakRetained = (double *)objc_loadWeakRetained((id *)(result + 288));
    v3 = WeakRetained;
    if (WeakRetained)
      v4 = WeakRetained[63];
    else
      v4 = 0.0;
    v5 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v4, *(double *)(v1 + 104));
    v7 = v6;

    objc_msgSend(*(id *)(v1 + 224), "setConstant:", v5);
    return objc_msgSend(*(id *)(v1 + 232), "setConstant:", v7);
  }
  return result;
}

- (uint64_t)_updateMoreButtonConstraints
{
  uint64_t v1;
  double *WeakRetained;
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (result)
  {
    v1 = result;
    WeakRetained = (double *)objc_loadWeakRetained((id *)(result + 288));
    v3 = WeakRetained;
    if (WeakRetained)
      v4 = WeakRetained[63];
    else
      v4 = 0.0;
    v5 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v4, *(double *)(v1 + 112));
    v7 = v6;

    objc_msgSend(*(id *)(v1 + 240), "setConstant:", v5);
    return objc_msgSend(*(id *)(v1 + 248), "setConstant:", v7);
  }
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  BOOL v7;
  unint64_t visibleToolsCount;
  PKSqueezePaletteView **p_paletteView;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGPoint v33;
  CGRect v34;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_panGestureRecognizer == a3)
  {
    visibleToolsCount = self->_visibleToolsCount;
    if (visibleToolsCount >= -[NSArray count](self->_drawingTools, "count"))
    {
      v7 = 0;
    }
    else
    {
      p_paletteView = &self->_paletteView;
      WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
      objc_msgSend(v6, "locationInView:", WeakRetained);
      v12 = v11;
      v14 = v13;

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = self->_drawingTools;
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            v21 = objc_loadWeakRetained((id *)p_paletteView);
            objc_msgSend(v21, "convertPoint:toView:", v20, v12, v14, (_QWORD)v27);
            v23 = v22;
            v25 = v24;

            objc_msgSend(v20, "bounds");
            v33.x = v23;
            v33.y = v25;
            if (CGRectContainsPoint(v34, v33))
            {
              v7 = 1;
              goto LABEL_15;
            }
          }
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v17)
            continue;
          break;
        }
      }
      v7 = 0;
LABEL_15:

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)expandedToolsLayout:(id)a3 didChangeSelectedToolIndex:(unint64_t)a4
{
  self->_selectedToolIndex = a4;
}

- (void)expandedToolsLayout:(id)a3 didChangeDrawingTools:(id)a4
{
  NSArray *v5;
  NSArray *drawingTools;

  v5 = (NSArray *)objc_msgSend(a4, "copy", a3);
  drawingTools = self->_drawingTools;
  self->_drawingTools = v5;

}

- (void)setupUI
{
  id WeakRetained;
  uint64_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  PKSqueezePaletteViewMiniPaletteLayout *v10;
  unint64_t visibleToolsCount;
  UIPanGestureRecognizer *v12;
  UIPanGestureRecognizer *panGestureRecognizer;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  double *v36;
  double *v37;
  double v38;
  double beforeToolSpace;
  double *v40;
  double v41;
  void *v42;
  void *v43;
  NSArray *drawingTools;
  uint64_t v45;
  NSArray *toolCenterXConstraints;
  uint64_t v47;
  NSArray *toolCenterYConstraints;
  PKSqueezePaletteViewMiniPaletteLayout *v49;
  unint64_t v50;
  double v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  NSLayoutConstraint *multicolorButtonCenterXConstraint;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  NSLayoutConstraint *multicolorButtonCenterYConstraint;
  double height;
  double afterToolSpace;
  double *v68;
  double v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  NSLayoutConstraint *moreButtonCenterXConstraint;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  NSLayoutConstraint *moreButtonCenterYConstraint;
  double multicolorButtonAngle;
  double v85;
  double interButtonSpace;
  double *v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  NSLayoutConstraint *v92;
  NSLayoutConstraint *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  NSLayoutConstraint *v98;
  NSLayoutConstraint *v99;
  void *v100;
  double *v101;
  double *v102;
  double v103;
  id v104;
  CAShapeLayer *toolsContentClippingShapeMask;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  double v111;
  id v112;
  const char *v113;
  void *v114;
  double *v115;
  double *v116;
  double v117;
  id v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  id *p_paletteView;
  PKSqueezePaletteViewMiniPaletteLayout *v136;
  _QWORD newValue[4];
  id v138;
  _QWORD v139[5];
  id v140;
  id v141;
  id *v142;
  id from;
  id *p_from;
  uint64_t v145;
  double v146;
  _QWORD v147[4];
  id v148;
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD v154[4];
  id v155;
  _QWORD v156[4];
  id v157;
  id location;
  _QWORD v159[8];
  _QWORD v160[4];
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  -[PKSqueezePaletteViewUndoRedoLayout setupUI](self->_undoRedoLayout, "setupUI");
  p_paletteView = (id *)&self->_paletteView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (!WeakRetained)
    return;
  v136 = self;
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v156[0] = MEMORY[0x1E0C809B0];
  v156[1] = 3221225472;
  v156[2] = __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke;
  v156[3] = &unk_1E7777588;
  objc_copyWeak(&v157, &location);
  -[UIView _set_pk_longSqueezeAction:](self->_multicolorButton, "_set_pk_longSqueezeAction:", v156);
  v154[0] = v4;
  v154[1] = 3221225472;
  v154[2] = __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_2;
  v154[3] = &unk_1E7777588;
  objc_copyWeak(&v155, &location);
  -[UIButton _set_pk_longSqueezeAction:](self->_moreButton, "_set_pk_longSqueezeAction:", v154);
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v5 = self->_drawingTools;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v150, v161, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v151;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v151 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * i);
        objc_initWeak(&from, v9);
        v147[0] = v4;
        v147[1] = 3221225472;
        v147[2] = __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_3;
        v147[3] = &unk_1E7778930;
        objc_copyWeak(&v148, &location);
        objc_copyWeak(&v149, &from);
        objc_msgSend(v9, "_set_pk_longSqueezeAction:", v147);
        objc_destroyWeak(&v149);
        objc_destroyWeak(&v148);
        objc_destroyWeak(&from);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v150, v161, 16);
    }
    while (v6);

    v10 = self;
    if (!self)
      goto LABEL_13;
  }
  else
  {

    v10 = self;
  }
  visibleToolsCount = v10->_visibleToolsCount;
  LOBYTE(v10) = visibleToolsCount < -[NSArray count](v10->_drawingTools, "count");
LABEL_13:
  self->_clipIndicatorViewVisible = (char)v10;
  v12 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handlePanGesture_);
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v12;

  -[UIPanGestureRecognizer setDelegate:](self->_panGestureRecognizer, "setDelegate:", self);
  v14 = objc_loadWeakRetained(p_paletteView);
  objc_msgSend(v14, "addGestureRecognizer:", self->_panGestureRecognizer);

  -[PKViewWithHitTestHandler setTranslatesAutoresizingMaskIntoConstraints:](self->_toolsContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = objc_loadWeakRetained(p_paletteView);
  v16 = v15;
  if (v15)
    v17 = (void *)*((_QWORD *)v15 + 69);
  else
    v17 = 0;
  v18 = v17;
  objc_msgSend(v18, "addSubview:", v136->_toolsContentView);

  v120 = (void *)MEMORY[0x1E0CB3718];
  -[PKViewWithHitTestHandler topAnchor](v136->_toolsContentView, "topAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_loadWeakRetained(p_paletteView);
  v131 = v19;
  if (v19)
    v20 = (void *)*((_QWORD *)v19 + 69);
  else
    v20 = 0;
  v118 = v20;
  objc_msgSend(v118, "topAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "constraintEqualToAnchor:", v133);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v160[0] = v127;
  -[PKViewWithHitTestHandler leadingAnchor](v136->_toolsContentView, "leadingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_loadWeakRetained(p_paletteView);
  v125 = v21;
  if (v21)
    v22 = (void *)*((_QWORD *)v21 + 69);
  else
    v22 = 0;
  v119 = v22;
  objc_msgSend(v119, "leadingAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintEqualToAnchor:", v126);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v160[1] = v123;
  -[PKViewWithHitTestHandler trailingAnchor](v136->_toolsContentView, "trailingAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_loadWeakRetained(p_paletteView);
  v24 = v23;
  if (v23)
    v25 = (void *)*((_QWORD *)v23 + 69);
  else
    v25 = 0;
  v26 = v25;
  objc_msgSend(v26, "trailingAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v122);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v160[2] = v27;
  -[PKViewWithHitTestHandler bottomAnchor](v136->_toolsContentView, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_loadWeakRetained(p_paletteView);
  v30 = v29;
  if (v29)
    v31 = (void *)*((_QWORD *)v29 + 69);
  else
    v31 = 0;
  v32 = v31;
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v160[3] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v160, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "activateConstraints:", v35);

  from = 0;
  p_from = &from;
  v145 = 0x2020000000;
  v146 = 0.0;
  v36 = (double *)objc_loadWeakRetained(p_paletteView);
  v37 = v36;
  if (v36)
    v38 = v36[66];
  else
    v38 = 0.0;
  beforeToolSpace = v136->_beforeToolSpace;
  v40 = (double *)objc_loadWeakRetained(p_paletteView);
  if (v40)
    v41 = v40[63];
  else
    v41 = 0.0;

  v146 = v38 + beforeToolSpace / v41;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v136->_drawingTools, "count"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v136->_drawingTools, "count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  drawingTools = v136->_drawingTools;
  v139[0] = v4;
  v139[1] = 3221225472;
  v139[2] = __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_4;
  v139[3] = &unk_1E7778958;
  v139[4] = v136;
  v142 = &from;
  v134 = v42;
  v140 = v134;
  v132 = v43;
  v141 = v132;
  -[NSArray enumerateObjectsUsingBlock:](drawingTools, "enumerateObjectsUsingBlock:", v139);
  v45 = objc_msgSend(v134, "copy");
  toolCenterXConstraints = v136->_toolCenterXConstraints;
  v136->_toolCenterXConstraints = (NSArray *)v45;

  v47 = objc_msgSend(v132, "copy");
  toolCenterYConstraints = v136->_toolCenterYConstraints;
  v136->_toolCenterYConstraints = (NSArray *)v47;

  v49 = v136;
  v50 = v136->_visibleToolsCount;
  if (v50)
  {
    v51 = -[PKFloatArray floatAtIndex:]((uint64_t)v136->_toolAngles, v50 - 1);
    v49 = v136;
  }
  else
  {
    v51 = *((double *)p_from + 3);
  }
  -[PKSqueezePaletteMulticolorSwatchButton setTranslatesAutoresizingMaskIntoConstraints:](v49->_multicolorButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKSqueezePaletteMulticolorSwatchButton addTarget:action:forControlEvents:](v136->_multicolorButton, "addTarget:action:forControlEvents:", v136, sel__didTapMulticolorButton_, 64);
  v52 = objc_loadWeakRetained(p_paletteView);
  v53 = v52;
  if (v52)
    v54 = (void *)*((_QWORD *)v52 + 70);
  else
    v54 = 0;
  v55 = v54;
  objc_msgSend(v55, "addSubview:", v136->_multicolorButton);

  -[NSLayoutConstraint setActive:](v136->_multicolorButtonCenterXConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](v136->_multicolorButtonCenterYConstraint, "setActive:", 0);
  -[PKSqueezePaletteMulticolorSwatchButton centerXAnchor](v136->_multicolorButton, "centerXAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_loadWeakRetained(p_paletteView);
  objc_msgSend(v57, "centerXAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v58);
  v59 = objc_claimAutoreleasedReturnValue();
  multicolorButtonCenterXConstraint = v136->_multicolorButtonCenterXConstraint;
  v136->_multicolorButtonCenterXConstraint = (NSLayoutConstraint *)v59;

  -[PKSqueezePaletteMulticolorSwatchButton centerYAnchor](v136->_multicolorButton, "centerYAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_loadWeakRetained(p_paletteView);
  objc_msgSend(v62, "centerYAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v63);
  v64 = objc_claimAutoreleasedReturnValue();
  multicolorButtonCenterYConstraint = v136->_multicolorButtonCenterYConstraint;
  v136->_multicolorButtonCenterYConstraint = (NSLayoutConstraint *)v64;

  height = v136->_buttonSize.height;
  afterToolSpace = v136->_afterToolSpace;
  v68 = (double *)objc_loadWeakRetained(p_paletteView);
  if (v68)
    v69 = v68[63];
  else
    v69 = 0.0;
  v136->_multicolorButtonAngle = v51 + (height + afterToolSpace) / v69;

  -[PKSqueezePaletteViewMiniPaletteLayout _updateMulticolorButtonConstraints]((uint64_t)v136);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v136->_moreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](v136->_moreButton, "addTarget:action:forControlEvents:", v136, sel__didTapMoreButton_, 64);
  v70 = objc_loadWeakRetained(p_paletteView);
  v71 = v70;
  if (v70)
    v72 = (void *)*((_QWORD *)v70 + 70);
  else
    v72 = 0;
  v73 = v72;
  objc_msgSend(v73, "addSubview:", v136->_moreButton);

  -[NSLayoutConstraint setActive:](v136->_moreButtonCenterXConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](v136->_moreButtonCenterYConstraint, "setActive:", 0);
  -[UIButton centerXAnchor](v136->_moreButton, "centerXAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_loadWeakRetained(p_paletteView);
  objc_msgSend(v75, "centerXAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v76);
  v77 = objc_claimAutoreleasedReturnValue();
  moreButtonCenterXConstraint = v136->_moreButtonCenterXConstraint;
  v136->_moreButtonCenterXConstraint = (NSLayoutConstraint *)v77;

  -[UIButton centerYAnchor](v136->_moreButton, "centerYAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_loadWeakRetained(p_paletteView);
  objc_msgSend(v80, "centerYAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v81);
  v82 = objc_claimAutoreleasedReturnValue();
  moreButtonCenterYConstraint = v136->_moreButtonCenterYConstraint;
  v136->_moreButtonCenterYConstraint = (NSLayoutConstraint *)v82;

  multicolorButtonAngle = v136->_multicolorButtonAngle;
  v85 = v136->_buttonSize.height;
  interButtonSpace = v136->_interButtonSpace;
  v87 = (double *)objc_loadWeakRetained(p_paletteView);
  if (v87)
    v88 = v87[63];
  else
    v88 = 0.0;
  v136->_moreButtonAngle = multicolorButtonAngle + (v85 + interButtonSpace) / v88;

  -[PKSqueezePaletteViewMiniPaletteLayout _updateMoreButtonConstraints]((uint64_t)v136);
  v128 = (void *)MEMORY[0x1E0CB3718];
  -[PKSqueezePaletteMulticolorSwatchButton heightAnchor](v136->_multicolorButton, "heightAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintEqualToConstant:", v136->_buttonSize.height);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v159[0] = v89;
  -[PKSqueezePaletteMulticolorSwatchButton widthAnchor](v136->_multicolorButton, "widthAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToConstant:", v136->_buttonSize.width);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v136->_multicolorButtonCenterXConstraint;
  v93 = v136->_multicolorButtonCenterYConstraint;
  v159[1] = v91;
  v159[2] = v92;
  v159[3] = v93;
  -[UIButton heightAnchor](v136->_moreButton, "heightAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToConstant:", v136->_buttonSize.height);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v159[4] = v95;
  -[UIButton widthAnchor](v136->_moreButton, "widthAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToConstant:", v136->_buttonSize.width);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v136->_moreButtonCenterXConstraint;
  v99 = v136->_moreButtonCenterYConstraint;
  v159[5] = v97;
  v159[6] = v98;
  v159[7] = v99;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 8);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "activateConstraints:", v100);

  v136->_toolsContentClippingIndicatorAngle = -[PKSqueezePaletteViewMiniPaletteLayout _defaultToolsContentClipIndicatorAngle]((uint64_t)v136);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v101 = (double *)objc_loadWeakRetained(p_paletteView);
  v102 = v101;
  if (v101)
    v103 = v101[64];
  else
    v103 = 0.0;
  -[CAShapeLayer setLineWidth:](v136->_toolsContentClippingShapeMask, "setLineWidth:", v103 + *(double *)&PKSqueezePaletteViewToolsContentClippingShapeMaskExtraLineWidth);

  -[CAShapeLayer setLineCap:](v136->_toolsContentClippingShapeMask, "setLineCap:", *MEMORY[0x1E0CD3008]);
  -[CAShapeLayer setFillColor:](v136->_toolsContentClippingShapeMask, "setFillColor:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v104 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](v136->_toolsContentClippingShapeMask, "setStrokeColor:", objc_msgSend(v104, "CGColor"));

  toolsContentClippingShapeMask = v136->_toolsContentClippingShapeMask;
  -[PKViewWithHitTestHandler layer](v136->_toolsContentView, "layer");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setMask:", toolsContentClippingShapeMask);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v107 = objc_loadWeakRetained(p_paletteView);
  v108 = v107;
  if (v107)
    v109 = (void *)*((_QWORD *)v107 + 70);
  else
    v109 = 0;
  v110 = v109;
  objc_msgSend(v110, "addSubview:", v136->_clipIndicatorView);

  -[PKSqueezePaletteViewMiniPaletteLayout _updateClipIndicatorView]((uint64_t)v136, v111);
  newValue[0] = v4;
  newValue[1] = 3221225472;
  newValue[2] = __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_5;
  newValue[3] = &unk_1E7777588;
  objc_copyWeak(&v138, &location);
  v112 = objc_loadWeakRetained(p_paletteView);
  v114 = v112;
  if (v112)
    objc_setProperty_nonatomic_copy(v112, v113, newValue, 600);

  v115 = (double *)objc_loadWeakRetained(p_paletteView);
  v116 = v115;
  if (v115)
    v117 = v115[65];
  else
    v117 = 0.0;
  -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v115, 1, 1, v117, v136->_moreButtonAngle);

  objc_destroyWeak(&v138);
  _Block_object_dispose(&from, 8);
  objc_destroyWeak(&v155);
  objc_destroyWeak(&v157);
  objc_destroyWeak(&location);
}

void __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteViewMiniPaletteLayout _performMulticolorButtonTapAction]((uint64_t)WeakRetained);

}

void __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteViewMiniPaletteLayout _performMoreButtonTapAction]((uint64_t)WeakRetained);

}

void __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  -[PKSqueezePaletteViewMiniPaletteLayout _performDrawingToolTapAction:]((uint64_t)WeakRetained, v2);

}

void __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  id *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double *v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double *v29;
  double *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "setSelected:", 0);
  if (v4)
    objc_storeWeak(v4 + 102, *(id *)(a1 + 32));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__didTapDrawingTool_, 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "addSubview:", v4);
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 288));
  objc_msgSend(WeakRetained, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 288));
  objc_msgSend(v10, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(double *)(v14 + 96) + *(double *)(v14 + 32);
  v16 = (double *)objc_loadWeakRetained((id *)(v14 + 288));
  v17 = 0.0;
  v18 = 0.0;
  if (v16)
    v18 = v16[63];
  v19 = v13 + v15 / v18;

  v20 = (double *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 288));
  v21 = v20;
  if (v20)
    v17 = v20[63];
  v22 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v17, v19);
  v24 = v23;

  objc_msgSend(v8, "setConstant:", v22);
  objc_msgSend(v12, "setConstant:", v24);
  v25 = (void *)MEMORY[0x1E0CB3718];
  v37[0] = v8;
  v37[1] = v12;
  v35 = v12;
  objc_msgSend(v4, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", *(double *)(*(_QWORD *)(a1 + 32) + 96));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v27;
  objc_msgSend(v4, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (double *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 288));
  v30 = v29;
  v31 = v8;
  if (v29)
    v32 = v29[64];
  else
    v32 = 0.0;
  objc_msgSend(v28, "constraintEqualToConstant:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v34);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v31);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v35);
  -[PKFloatArray setFloat:atIndex:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), a3, v19);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v19;
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (uint64_t)_updateClipIndicatorView
{
  uint64_t v2;
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double *v9;
  double v10;
  void *v11;
  __int128 v12;
  id v13;
  void *v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  _OWORD v17[3];

  if (result)
  {
    v2 = result;
    LOBYTE(a2) = *(_BYTE *)(result + 184);
    result = objc_msgSend(*(id *)(result + 176), "setAlpha:", (double)*(unint64_t *)&a2);
    if (*(_QWORD *)(v2 + 336))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 288));
      objc_msgSend(WeakRetained, "bounds");
      UIRectGetCenter();
      v5 = v4;
      v7 = v6;

      v8 = (double *)objc_loadWeakRetained((id *)(v2 + 288));
      v9 = v8;
      v10 = 0.0;
      if (v8)
        v10 = v8[63];
      PKPointOnArc(v5, v7, v10, *(double *)(v2 + 256));

      v11 = *(void **)(v2 + 176);
      v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v17[0] = *MEMORY[0x1E0C9BAA8];
      v17[1] = v12;
      v17[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v11, "setTransform:", v17);

      v13 = objc_loadWeakRetained((id *)(v2 + 288));
      UIRectIntegralWithViewScale();
      objc_msgSend(*(id *)(v2 + 176), "setFrame:");

      CGAffineTransformMakeRotation(&v16, *(double *)(v2 + 256) + -1.57079633);
      v14 = *(void **)(v2 + 176);
      v15 = v16;
      return objc_msgSend(v14, "setTransform:", &v15);
    }
  }
  return result;
}

void __48__PKSqueezePaletteViewMiniPaletteLayout_setupUI__block_invoke_5(uint64_t a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  double *v8;
  double *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  double v16;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v1 = objc_loadWeakRetained(WeakRetained + 36);
    objc_msgSend(v1, "bounds");
    UIRectGetCenter();
    v3 = v2;
    v5 = v4;

    v6 = objc_loadWeakRetained(WeakRetained + 36);
    objc_msgSend(v6, "bounds");
    objc_msgSend(WeakRetained[21], "setFrame:");

    v7 = (void *)MEMORY[0x1E0DC3508];
    v8 = (double *)objc_loadWeakRetained(WeakRetained + 36);
    v9 = v8;
    if (v8)
      v10 = v8[63];
    else
      v10 = 0.0;
    v11 = v10 + *(double *)&PKSqueezePaletteViewToolsContentClippingShapeMaskExtraLineWidth * 0.5;
    v12 = objc_loadWeakRetained(WeakRetained + 36);
    v13 = v12;
    if (v12)
      v14 = *((_BYTE *)v12 + 488) != 0;
    else
      v14 = 0;
    objc_msgSend(v7, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", v14, v3, v5, v11, 0.0, 6.28318531);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(WeakRetained[21], "setPath:", objc_msgSend(v15, "CGPath"));

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    -[PKSqueezePaletteViewMiniPaletteLayout _updateClipIndicatorView]((uint64_t)WeakRetained, v16);
  }

}

- (void)updateUI
{
  id WeakRetained;
  NSArray *drawingTools;
  UIButton *moreButton;
  PKSqueezePaletteMulticolorSwatchButton *multicolorButton;
  double v7;
  void *v8;
  CAShapeLayer *v9;
  CAShapeLayer *toolsContentClippingShapeMask;
  CAShapeLayer *v11;
  void *v12;
  void *v13;
  CAShapeLayer *v14;
  void *v15;
  id *v16;
  id *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  double *v22;
  double *v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  double *v28;
  double v29;
  double v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  _QWORD v35[5];

  -[PKSqueezePaletteViewUndoRedoLayout updateUI](self->_undoRedoLayout, "updateUI");
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (!WeakRetained)
    return;
  drawingTools = self->_drawingTools;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __49__PKSqueezePaletteViewMiniPaletteLayout_updateUI__block_invoke;
  v35[3] = &unk_1E77788E8;
  v35[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](drawingTools, "enumerateObjectsUsingBlock:", v35);
  -[PKSqueezePaletteViewMiniPaletteLayout _updateColorUIStyle]((uint64_t)self);
  -[PKSqueezePaletteMulticolorSwatchButton setAlpha:](self->_multicolorButton, "setAlpha:", 1.0);
  -[UIButton setAlpha:](self->_moreButton, "setAlpha:", 1.0);
  -[PKSqueezePaletteViewMiniPaletteLayout _updateMulticolorButtonConstraints]((uint64_t)self);
  -[PKSqueezePaletteViewMiniPaletteLayout _updateMoreButtonConstraints]((uint64_t)self);
  CGAffineTransformMakeRotation(&v34, self->_moreButtonAngle + 1.57079633);
  moreButton = self->_moreButton;
  v33 = v34;
  -[UIButton setTransform:](moreButton, "setTransform:", &v33);
  CGAffineTransformMakeRotation(&v32, self->_multicolorButtonAngle + 1.57079633);
  multicolorButton = self->_multicolorButton;
  v31 = v32;
  -[PKSqueezePaletteMulticolorSwatchButton setTransform:](multicolorButton, "setTransform:", &v31);
  -[PKSqueezePaletteViewMiniPaletteLayout _updateClipIndicatorView]((uint64_t)self, v7);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[PKViewWithHitTestHandler layer](self->_toolsContentView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mask");
  v9 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  toolsContentClippingShapeMask = self->_toolsContentClippingShapeMask;

  if (self->_clipIndicatorViewVisible && v9 != toolsContentClippingShapeMask)
  {
    v11 = self->_toolsContentClippingShapeMask;
    -[PKViewWithHitTestHandler layer](self->_toolsContentView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v11;
LABEL_8:
    objc_msgSend(v12, "setMask:", v14);

    goto LABEL_9;
  }
  if (!self->_clipIndicatorViewVisible && v9 == toolsContentClippingShapeMask)
  {
    -[PKViewWithHitTestHandler layer](self->_toolsContentView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 0;
    goto LABEL_8;
  }
LABEL_9:
  -[CAShapeLayer setStrokeEnd:](self->_toolsContentClippingShapeMask, "setStrokeEnd:", self->_toolsContentClippingIndicatorAngle / 6.28318531 + 0.0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[PKSqueezePaletteViewMiniPaletteLayout _selectedTool]((uint64_t)self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSelected:", 1);

  v16 = (id *)objc_loadWeakRetained((id *)&self->_paletteView);
  v17 = v16;
  if (!v16)
  {
    v19 = 0;
    goto LABEL_21;
  }
  v18 = v16[73];
  v19 = v18;
  if (!v18)
  {
LABEL_21:
    v20 = 0;
    goto LABEL_12;
  }
  v20 = (void *)*((_QWORD *)v18 + 5);
LABEL_12:
  v21 = v20;
  -[PKSqueezePaletteMulticolorSwatchButton setColor:]((uint64_t)self->_multicolorButton, v21);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v22 = (double *)objc_loadWeakRetained((id *)&self->_paletteView);
  v23 = v22;
  v24 = 0.0;
  v25 = 0.0;
  if (v22)
    v25 = v22[65];
  v26 = objc_loadWeakRetained((id *)&self->_paletteView);
  v27 = v26;
  if (v26)
    v24 = *((double *)v26 + 64) * 0.5;
  v28 = (double *)objc_loadWeakRetained((id *)&self->_paletteView);
  v29 = 0.0;
  if (v28)
    v29 = v28[63];
  v30 = v25 - v24 / v29;

  -[CAShapeLayer setStrokeStart:](self->_toolsContentClippingShapeMask, "setStrokeStart:", v30 / 6.28318531 + 0.0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __49__PKSqueezePaletteViewMiniPaletteLayout_updateUI__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  double v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v5 = a2;
  -[PKSqueezePaletteDrawingTool resetPointerInteractionTransform]((uint64_t)v5);
  v6 = -[PKFloatArray floatAtIndex:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), a3);
  CGAffineTransformMakeRotation(&v8, v6 + 1.57079633);
  v7 = v8;
  objc_msgSend(v5, "setTransform:", &v7);

}

- (void)_updateColorUIStyle
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  if (a1)
  {
    v2 = *(void **)(a1 + 312);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__PKSqueezePaletteViewMiniPaletteLayout__updateColorUIStyle__block_invoke;
    v7[3] = &unk_1E77788E8;
    v7[4] = a1;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 288));
    v4 = WeakRetained;
    if (WeakRetained)
      v5 = *((_QWORD *)WeakRetained + 74);
    else
      v5 = 0;
    v6 = *(_QWORD *)(a1 + 344);
    if (v6)
    {
      if (*(_QWORD *)(v6 + 768) != v5)
      {
        *(_QWORD *)(v6 + 768) = v5;
        -[PKSqueezePaletteMulticolorSwatchButton _updateUI](v6);
      }
    }

  }
}

- (void)willTransitionToLayout:(id)a3
{
  _QWORD *v4;
  double v5;
  char v6;
  NSArray *drawingTools;
  id WeakRetained;
  void *v9;
  id v10;
  double v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKSqueezePaletteViewUndoRedoLayout willTransitionToLayout:](self->_undoRedoLayout, "willTransitionToLayout:", v4);
  objc_opt_class();
  v5 = (double)(objc_opt_isKindOfClass() & 1);
  -[UIButton setAlpha:](self->_undoButton, "setAlpha:", v5);
  -[UIButton setAlpha:](self->_redoButton, "setAlpha:", v5);
  objc_opt_class();
  v6 = objc_opt_isKindOfClass() & 1;
  drawingTools = self->_drawingTools;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__PKSqueezePaletteViewMiniPaletteLayout_willTransitionToLayout___block_invoke;
  v22[3] = &__block_descriptor_33_e25_v32__0__UIButton_8Q16_B24l;
  v23 = v6;
  -[NSArray enumerateObjectsUsingBlock:](drawingTools, "enumerateObjectsUsingBlock:", v22);
  -[PKSqueezePaletteMulticolorSwatchButton setAlpha:](self->_multicolorButton, "setAlpha:", 0.0);
  -[UIButton setAlpha:](self->_moreButton, "setAlpha:", 0.0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_panGestureRecognizer);

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_toolCenterXConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_toolCenterYConstraints);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4)
      v9 = (void *)v4[3];
    else
      v9 = 0;
    v10 = v9;
    -[PKMathResultAttribution setString:]((uint64_t)v10, self);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKSqueezePaletteMulticolorSwatchButton setAlpha:](self->_multicolorButton, "setAlpha:", 1.0);
    -[PKSqueezePaletteMulticolorSwatchButton removeTarget:action:forControlEvents:](self->_multicolorButton, "removeTarget:action:forControlEvents:", self, sel__didTapMulticolorButton_, 64);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[NSArray objectAtIndexedSubscript:](self->_drawingTools, "objectAtIndexedSubscript:", self->_selectedToolIndex);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 1.0);
LABEL_10:

  }
LABEL_11:
  self->_clipIndicatorViewVisible = 0;
  -[PKSqueezePaletteViewMiniPaletteLayout _updateClipIndicatorView]((uint64_t)self, v11);
  -[PKViewWithHitTestHandler layer](self->_toolsContentView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMask:", 0);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_drawingTools;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "removeTarget:action:forControlEvents:", self, sel__didTapDrawingTool_, 64, (_QWORD)v18);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v15);
  }

}

uint64_t __64__PKSqueezePaletteViewMiniPaletteLayout_willTransitionToLayout___block_invoke(uint64_t a1, void *a2, double a3)
{
  LOBYTE(a3) = *(_BYTE *)(a1 + 32);
  return objc_msgSend(a2, "setAlpha:", (double)*(unint64_t *)&a3);
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  void *v5;
  PKSqueezePaletteViewSwitchToEraserAction *switchToEraserAction;
  PKSqueezePaletteViewSwitchToEraserAction *v7;
  PKSqueezePaletteViewSwitchToEraserAction *v8;
  unint64_t selectedToolIndex;
  unint64_t v10;
  PKSqueezePaletteViewSwitchToEraserAction *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id WeakRetained;
  const char *v17;
  void *v18;
  id *v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSUInteger v31;
  unint64_t eraserToolIndex;
  unint64_t v33;
  id v34;
  id location;
  _BYTE buf[24];
  void *v37;
  id v38[2];

  v38[1] = *(id *)MEMORY[0x1E0C80C00];
  +[PKStatisticsManager sharedStatisticsManager]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordPencilAction:doubleTap:]((uint64_t)v5);

  switch(a3)
  {
    case 1:
      if (!self)
        return;
      switchToEraserAction = self->_switchToEraserAction;
      if (switchToEraserAction
        || (v7 = (PKSqueezePaletteViewSwitchToEraserAction *)-[PKSqueezePaletteViewSwitchToEraserAction initWitEraserToolIndex:toolsCount:]([PKSqueezePaletteViewSwitchToEraserAction alloc], self->_eraserToolIndex, -[NSArray count](self->_drawingTools, "count")), v8 = self->_switchToEraserAction, self->_switchToEraserAction = v7, v8, (switchToEraserAction = self->_switchToEraserAction) != 0))
      {
        selectedToolIndex = self->_selectedToolIndex;
        v10 = switchToEraserAction->_selectedToolIndex;
        if (v10 != selectedToolIndex)
        {
          switchToEraserAction->_lastSelectedToolIndex = v10;
          switchToEraserAction->_selectedToolIndex = selectedToolIndex;
          if (v10 == 0x7FFFFFFFFFFFFFFFLL && switchToEraserAction->_eraserToolIndex == selectedToolIndex)
          {
            if (selectedToolIndex + 1 < switchToEraserAction->_toolsCount)
              ++selectedToolIndex;
            switchToEraserAction->_lastSelectedToolIndex = selectedToolIndex;
          }
        }
      }
      -[PKSqueezePaletteViewSwitchToEraserAction performAction](&self->_switchToEraserAction->super.isa);
      v12 = self->_switchToEraserAction;
      if (!v12)
      {
        v13 = 0;
        goto LABEL_41;
      }
      v13 = v12->_selectedToolIndex;
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_41:
        -[NSArray objectAtIndex:](self->_drawingTools, "objectAtIndex:", v13);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        -[PKSqueezePaletteViewMiniPaletteLayout _selectTool:]((uint64_t)self, v34);

        return;
      }
      v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v31 = -[NSArray count](self->_drawingTools, "count");
        v33 = self->_selectedToolIndex;
        eraserToolIndex = self->_eraserToolIndex;
        *(_DWORD *)buf = 134284033;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2049;
        *(_QWORD *)&buf[14] = eraserToolIndex;
        *(_WORD *)&buf[22] = 2049;
        v37 = (void *)v33;
        _os_log_error_impl(&dword_1BE213000, v14, OS_LOG_TYPE_ERROR, "Unable to perform switch to eraser action: next tool couldn't be determined. tools count: %{private}lu, eraser tool index: %{private}lu, selected tool index: %{private}lu", buf, 0x20u);
      }

      return;
    case 2:
      if (self)
      {
        if (self->_selectedToolIndex == 1)
          v26 = 2;
        else
          v26 = 1;
        -[NSArray objectAtIndex:](self->_drawingTools, "objectAtIndex:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE213000, v28, OS_LOG_TYPE_DEFAULT, "Switch to previous tool.", buf, 2u);
        }

        -[PKSqueezePaletteViewMiniPaletteLayout _selectTool:]((uint64_t)self, v27);
      }
      return;
    case 3:
      if (!self)
        return;
      v15 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "Show color palette.", buf, 2u);
      }

      objc_initWeak(&location, self);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __86__PKSqueezePaletteViewMiniPaletteLayout__performPencilPreferredActionShowColorPalette__block_invoke;
      v37 = &unk_1E77789A0;
      objc_copyWeak(v38, &location);
      WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
      v18 = WeakRetained;
      if (WeakRetained)
        objc_setProperty_nonatomic_copy(WeakRetained, v17, buf, 608);

      v19 = (id *)objc_loadWeakRetained((id *)&self->_paletteView);
      v20 = v19;
      if (v19)
      {
        v21 = v19[73];
        v22 = v21;
        if (v21)
        {
          v23 = (void *)*((_QWORD *)v21 + 5);
LABEL_27:
          v24 = v23;

          v25 = objc_loadWeakRetained((id *)&self->_paletteView);
          -[PKSqueezePaletteView _didTapMulticolorButton:currentSelectedColor:]((uint64_t)v25, self->_multicolorButton, v24);

          objc_destroyWeak(v38);
          objc_destroyWeak(&location);
          return;
        }
      }
      else
      {
        v22 = 0;
      }
      v23 = 0;
      goto LABEL_27;
    case 4:
      if (self)
      {
        v29 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE213000, v29, OS_LOG_TYPE_DEFAULT, "Show ink attributes.", buf, 2u);
        }

        -[PKSqueezePaletteViewMiniPaletteLayout _selectedTool]((uint64_t)self);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSqueezePaletteViewMiniPaletteLayout _selectTool:]((uint64_t)self, v30);

      }
      return;
    default:
      return;
  }
}

void __86__PKSqueezePaletteViewMiniPaletteLayout__performPencilPreferredActionShowColorPalette__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id WeakRetained;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = v5;
  if (WeakRetained)
  {
    v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v16 = v6;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Update multicolor button color from extended color picker, color: %{private}@", buf, 0xCu);
    }

    -[PKSqueezePaletteViewMiniPaletteLayout _selectedTool]((uint64_t)WeakRetained);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = *(void **)(v8 + 824);
    else
      v10 = 0;
    v11 = v10;
    v12 = (void *)objc_msgSend(v11, "_copyWithColor:", v6);
    -[PKSqueezePaletteDrawingTool setTool:]((uint64_t)v9, v12);

    -[PKSqueezePaletteMulticolorSwatchButton setColor:](*((_QWORD *)WeakRetained + 43), v6);
    v13 = objc_loadWeakRetained((id *)WeakRetained + 36);
    -[PKSqueezePaletteView _didSelectColor:isFromExtendedColorPicker:isContinuousColorSelection:]((uint64_t)v13, v6, 1, a3);

  }
}

void __60__PKSqueezePaletteViewMiniPaletteLayout__updateColorUIStyle__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  id v6;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 288);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  if (WeakRetained)
    v5 = WeakRetained[74];
  else
    v5 = 0;
  v6 = WeakRetained;
  if (v3 && *((_QWORD *)v3 + 104) != v5)
  {
    *((_QWORD *)v3 + 104) = v5;
    objc_msgSend(*((id *)v3 + 94), "setColorUserInterfaceStyle:");
  }

}

- (double)toolAngle:(id)a3
{
  unint64_t v4;

  v4 = -[NSArray indexOfObject:](self->_drawingTools, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0.0;
  else
    return -[PKFloatArray floatAtIndex:]((uint64_t)self->_toolAngles, v4);
}

- (double)undoRedoLayoutStartAngle:(id)a3
{
  return self->_startAngle;
}

- (PKSqueezePaletteView)paletteView
{
  return (PKSqueezePaletteView *)objc_loadWeakRetained((id *)&self->_paletteView);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_multicolorButton, 0);
  objc_storeStrong((id *)&self->_drawingTools, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_destroyWeak((id *)&self->_paletteView);
  objc_storeStrong((id *)&self->_switchToEraserAction, 0);
  objc_storeStrong((id *)&self->_moreButtonCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_moreButtonCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_multicolorButtonCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_multicolorButtonCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_clipIndicatorView, 0);
  objc_storeStrong((id *)&self->_toolsContentClippingShapeMask, 0);
  objc_storeStrong((id *)&self->_toolsContentView, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_toolCenterYConstraints, 0);
  objc_storeStrong((id *)&self->_toolCenterXConstraints, 0);
  objc_storeStrong((id *)&self->_toolAnglesBeforePanning, 0);
  objc_storeStrong((id *)&self->_toolAngles, 0);
  objc_storeStrong((id *)&self->_undoRedoLayout, 0);
}

@end
