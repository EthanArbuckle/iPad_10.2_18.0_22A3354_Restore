@implementation PKSqueezePaletteViewExpandedToolsLayout

- (id)initWithContext:(void *)a3 drawingTools:(void *)a4 selectedToolIndex:(void *)a5 visibleToolsCount:
{
  id v10;
  id v11;
  id *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  objc_super v19;

  v10 = a2;
  v11 = a3;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)PKSqueezePaletteViewExpandedToolsLayout;
    v12 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 8, a2);
      v13 = objc_msgSend(v11, "copy");
      v14 = a1[9];
      a1[9] = (id)v13;

      a1[10] = a4;
      a1[11] = a5;
      v15 = PKSqueezePaletteToolContainerWidth;
      a1[1] = (id)PKSqueezePaletteToolsInterItemSpacing;
      a1[2] = (id)v15;
      v16 = -[PKFloatArray initWithCapacity:]([PKFloatArray alloc], objc_msgSend(a1[9], "count"));
      v17 = a1[3];
      a1[3] = v16;

    }
  }

  return a1;
}

- (void)_didTapDrawingTool:(id)a3
{
  -[PKSqueezePaletteViewExpandedToolsLayout _performDrawingToolTapAction:]((uint64_t)self, a3);
}

- (void)_performDrawingToolTapAction:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  id v5;
  int v6;
  _QWORD *v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD *v21;

  v3 = a2;
  if (a1)
  {
    v21 = v3;
    if (v3)
      v4 = (void *)v3[103];
    else
      v4 = 0;
    v5 = v4;
    v6 = objc_msgSend(v5, "_isRulerTool");

    if (v6)
    {
      v7 = -[PKSqueezePaletteViewTapRulerAction initWithRulerTool:]((id *)[PKSqueezePaletteViewTapRulerAction alloc], v21);
      -[PKSqueezePaletteViewTapRulerAction performAction]((uint64_t)v7);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView _didTapRuler]((uint64_t)WeakRetained);
    }
    else
    {
      -[PKSqueezePaletteViewExpandedToolsLayout _selectedTool](a1);
      v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v7 && v7 == v21)
      {
        v9 = *(_QWORD **)(a1 + 64);
        if (v9)
          v9 = (_QWORD *)v9[1];
      }
      else
      {
        -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](v7, 0, 1, 0);
        -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](v21, 1, 1, 0);
        v10 = objc_msgSend(*(id *)(a1 + 72), "indexOfObject:", v21);
        v11 = v10;
        if (v10 >= *(_QWORD *)(a1 + 88))
        {
          v12 = (void *)objc_msgSend(*(id *)(a1 + 72), "mutableCopy");
          objc_msgSend(v12, "removeObjectAtIndex:", v11);
          objc_msgSend(v12, "insertObject:atIndex:", v21, 1);
          v13 = objc_msgSend(v12, "copy");
          v14 = *(void **)(a1 + 72);
          *(_QWORD *)(a1 + 72) = v13;

          *(_QWORD *)(a1 + 80) = 1;
          v15 = objc_loadWeakRetained((id *)(a1 + 56));
          objc_msgSend(v15, "expandedToolsLayout:didChangeDrawingTools:", a1, *(_QWORD *)(a1 + 72));

        }
        else
        {
          *(_QWORD *)(a1 + 80) = v10;
        }
        v16 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(v16, "expandedToolsLayout:didChangeSelectedToolIndex:", a1, *(_QWORD *)(a1 + 80));

        v17 = objc_loadWeakRetained((id *)(a1 + 48));
        if (v21)
          v18 = (void *)v21[103];
        else
          v18 = 0;
        v19 = v18;
        -[PKSqueezePaletteView _didSelectTool:atIndex:]((uint64_t)v17, v19, *(_QWORD *)(a1 + 80));

        v9 = *(_QWORD **)(a1 + 64);
        if (v9)
          v9 = (_QWORD *)v9[1];
      }
      WeakRetained = v9;
      v20 = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v20, WeakRetained);

    }
    v3 = v21;
  }

}

- (id)_selectedTool
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 80) == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:");
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (void)setupUI
{
  id WeakRetained;
  NSArray *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *drawingTools;
  id v15;
  id v16;
  NSArray *v17;
  NSArray *v18;
  NSArray *toolCenterXConstraints;
  NSArray *v20;
  NSArray *toolCenterYConstraints;
  double v22;
  double toolWidth;
  double *v24;
  double v25;
  double *v26;
  double *v27;
  double v28;
  id v29;
  void *v30;
  char v31;
  id *p_paletteView;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[3];
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id location;
  id from[5];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  p_paletteView = (id *)&self->_paletteView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v4 = self->_drawingTools;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    v6 = (void *)MEMORY[0x1E0C809B0];
    if (v5)
    {
      v7 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v43 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_initWeak(from, v9);
          v39[0] = v6;
          v39[1] = 3221225472;
          v39[2] = __50__PKSqueezePaletteViewExpandedToolsLayout_setupUI__block_invoke;
          v39[3] = &unk_1E7778930;
          objc_copyWeak(&v40, from);
          objc_copyWeak(&v41, &location);
          objc_msgSend(v9, "_set_pk_longSqueezeAction:", v39, p_paletteView);
          objc_destroyWeak(&v41);
          objc_destroyWeak(&v40);
          objc_destroyWeak(from);
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v5);
    }

    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = 0;
    v10 = objc_loadWeakRetained(p_paletteView);
    if (v10)
      v11 = v10[65];
    else
      v11 = 0;

    v38 = v11;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_drawingTools, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_drawingTools, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    drawingTools = self->_drawingTools;
    v33[0] = v6;
    v33[1] = 3221225472;
    v33[2] = __50__PKSqueezePaletteViewExpandedToolsLayout_setupUI__block_invoke_2;
    v33[3] = &unk_1E7778958;
    v33[4] = self;
    v36 = v37;
    v15 = v12;
    v34 = v15;
    v16 = v13;
    v35 = v16;
    -[NSArray enumerateObjectsUsingBlock:](drawingTools, "enumerateObjectsUsingBlock:", v33);
    v17 = self->_drawingTools;
    from[0] = v6;
    from[1] = (id)3221225472;
    from[2] = __62__PKSqueezePaletteViewExpandedToolsLayout__updateToolsUIStyle__block_invoke;
    from[3] = &unk_1E77788E8;
    from[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v17, "enumerateObjectsUsingBlock:", from);
    v18 = (NSArray *)objc_msgSend(v15, "copy");
    toolCenterXConstraints = self->_toolCenterXConstraints;
    self->_toolCenterXConstraints = v18;

    v20 = (NSArray *)objc_msgSend(v16, "copy");
    toolCenterYConstraints = self->_toolCenterYConstraints;
    self->_toolCenterYConstraints = v20;

    v22 = -[PKFloatArray lastFloat]((uint64_t)self->_toolAngles);
    toolWidth = self->_toolWidth;
    v24 = (double *)objc_loadWeakRetained(p_paletteView);
    if (v24)
      v25 = v24[63];
    else
      v25 = 0.0;

    v26 = (double *)objc_loadWeakRetained(p_paletteView);
    v27 = v26;
    if (v26)
      v28 = v26[65];
    else
      v28 = 0.0;
    v29 = objc_loadWeakRetained(p_paletteView);
    v30 = v29;
    if (v29)
      v31 = *((_BYTE *)v29 + 488) != 0;
    else
      v31 = 0;
    -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v27, v31, 1, v28, v22 + toolWidth / 6.0 / v25);

    _Block_object_dispose(v37, 8);
    objc_destroyWeak(&location);
  }
}

void __50__PKSqueezePaletteViewExpandedToolsLayout_setupUI__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = objc_loadWeakRetained(v2);
    -[PKSqueezePaletteViewExpandedToolsLayout _performDrawingToolTapAction:]((uint64_t)v5, v4);

  }
}

void __50__PKSqueezePaletteViewExpandedToolsLayout_setupUI__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  double *v18;
  double v19;
  double *v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "addTarget:action:forControlEvents:", v5, sel__didTapDrawingTool_, 64);
  objc_msgSend(v6, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (a3)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(double *)(v16 + 16) + *(double *)(v16 + 8);
    v18 = (double *)objc_loadWeakRetained((id *)(v16 + 48));
    if (v18)
      v19 = v18[63];
    else
      v19 = 0.0;
    v15 = v15 + v17 / v19;

  }
  v20 = (double *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v21 = v20;
  if (v20)
    v22 = v20[63];
  else
    v22 = 0.0;
  v23 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v22, v15);
  v25 = v24;

  objc_msgSend(v10, "setConstant:", v23);
  objc_msgSend(v14, "setConstant:", v25);
  v26 = (void *)MEMORY[0x1E0CB3718];
  v28[0] = v10;
  v28[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v27);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
  -[PKFloatArray setFloat:atIndex:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), a3, v15);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v15;

}

- (uint64_t)_updateToolsUIStyle
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 72);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __62__PKSqueezePaletteViewExpandedToolsLayout__updateToolsUIStyle__block_invoke;
    v2[3] = &unk_1E77788E8;
    v2[4] = result;
    return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);
  }
  return result;
}

- (void)updateUI
{
  id WeakRetained;
  NSArray *drawingTools;
  void *v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    drawingTools = self->_drawingTools;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PKSqueezePaletteViewExpandedToolsLayout_updateUI__block_invoke;
    v6[3] = &unk_1E77788E8;
    v6[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](drawingTools, "enumerateObjectsUsingBlock:", v6);
    -[PKSqueezePaletteViewExpandedToolsLayout _selectedTool]((uint64_t)self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelected:", 1);

  }
}

void __51__PKSqueezePaletteViewExpandedToolsLayout_updateUI__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  double v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v5 = a2;
  objc_msgSend(v5, "setAlpha:", 1.0);
  v6 = -[PKFloatArray floatAtIndex:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), a3);
  CGAffineTransformMakeRotation(&v8, v6 + 1.57079633);
  v7 = v8;
  objc_msgSend(v5, "setTransform:", &v7);

}

- (void)willTransitionToLayout:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_toolCenterXConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_toolCenterYConstraints);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_drawingTools;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "removeTarget:action:forControlEvents:", self, sel__didTapDrawingTool_, 64);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_drawingTools;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * j), "_set_pk_longSqueezeAction:", 0, (_QWORD)v14);
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  id v4;

  -[PKSqueezePaletteViewExpandedToolsLayout _selectedTool]((uint64_t)self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteViewExpandedToolsLayout _performDrawingToolTapAction:]((uint64_t)self, v4);

}

void __62__PKSqueezePaletteViewExpandedToolsLayout__updateToolsUIStyle__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  id v6;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 48);
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

- (PKSqueezePaletteView)paletteView
{
  return (PKSqueezePaletteView *)objc_loadWeakRetained((id *)&self->_paletteView);
}

- (void)setPaletteView:(id)a3
{
  objc_storeWeak((id *)&self->_paletteView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingTools, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_paletteView);
  objc_storeStrong((id *)&self->_toolCenterYConstraints, 0);
  objc_storeStrong((id *)&self->_toolCenterXConstraints, 0);
  objc_storeStrong((id *)&self->_toolAngles, 0);
}

@end
