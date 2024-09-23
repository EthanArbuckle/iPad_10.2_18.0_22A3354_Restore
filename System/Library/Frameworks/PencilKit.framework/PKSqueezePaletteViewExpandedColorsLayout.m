@implementation PKSqueezePaletteViewExpandedColorsLayout

- (id)initWithContext:(void *)a3 colorButtons:(uint64_t)a4 selectedColorIndex:(void *)a5 backButton:
{
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD **v25;
  id v26;
  id v27;
  id v28;
  id val;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id from;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id location;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  v28 = a3;
  v27 = a5;
  if (a1
    && (v44.receiver = a1,
        v44.super_class = (Class)PKSqueezePaletteViewExpandedColorsLayout,
        v10 = (char *)objc_msgSendSuper2(&v44, sel_init),
        (val = v10) != 0))
  {
    v25 = (_QWORD **)(v10 + 56);
    objc_storeStrong((id *)v10 + 7, a2);
    *((_QWORD *)val + 9) = a4;
    *((double *)val + 1) = PKSqueezePaletteButtonSize();
    *((_QWORD *)val + 2) = v11;
    v12 = objc_msgSend(v28, "copy");
    v13 = (void *)*((_QWORD *)val + 8);
    *((_QWORD *)val + 8) = v12;

    *((_QWORD *)val + 3) = malloc_type_malloc(8 * objc_msgSend(*((id *)val + 8), "count"), 0x100004000313F17uLL);
    *((_QWORD *)val + 4) = PKSqueezePaletteButtonInterItemSpacing;
    objc_storeStrong((id *)val + 10, a5);
    objc_initWeak(&location, val);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = *((id *)val + 8);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    v16 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      v17 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_initWeak(&from, v19);
          v35[0] = v16;
          v35[1] = 3221225472;
          v35[2] = __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke;
          v35[3] = &unk_1E7778930;
          objc_copyWeak(&v36, &location);
          objc_copyWeak(&v37, &from);
          objc_msgSend(v19, "_set_pk_longSqueezeAction:", v35);
          objc_destroyWeak(&v37);
          objc_destroyWeak(&v36);
          objc_destroyWeak(&from);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v15);
    }

    v20 = *v25;
    if (*v25)
      v20 = (_QWORD *)v20[2];
    v21 = v20;
    objc_initWeak(&from, v21);

    v32[0] = v16;
    v32[1] = 3221225472;
    v32[2] = __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke_2;
    v32[3] = &unk_1E7778930;
    objc_copyWeak(&v33, &location);
    objc_copyWeak(&v34, &from);
    v22 = *v25;
    if (*v25)
      v22 = (_QWORD *)v22[2];
    v23 = v22;
    objc_msgSend(v23, "_set_pk_longSqueezeAction:", v32);

    v30[0] = v16;
    v30[1] = 3221225472;
    v30[2] = __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke_3;
    v30[3] = &unk_1E7777588;
    objc_copyWeak(&v31, &location);
    objc_msgSend(*((id *)val + 10), "_set_pk_longSqueezeAction:", v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    val = 0;
  }

  return val;
}

void __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  -[PKSqueezePaletteViewExpandedColorsLayout _performColorButtonTapAction:]((uint64_t)WeakRetained, v2);

}

- (void)_performColorButtonTapAction:(uint64_t)a1
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  id WeakRetained;
  void *v10;
  id v11;
  uint8_t v12[16];

  v3 = a2;
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Color button tapped", v12, 2u);
    }

    -[PKSqueezePaletteViewExpandedColorsLayout _currentSelectedButton](a1);
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && v5 == v3)
    {
      v7 = *(_QWORD **)(a1 + 56);
      if (v7)
        v7 = (_QWORD *)v7[4];
      v8 = v7;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v8);

    }
    else
    {
      objc_msgSend(v5, "setSelected:", 0);
      *(_QWORD *)(a1 + 72) = objc_msgSend(*(id *)(a1 + 64), "indexOfObject:", v3);
      objc_msgSend(v3, "setSelected:", 1);
      if (v3)
        v10 = (void *)v3[95];
      else
        v10 = 0;
      v11 = v10;
      objc_msgSend(v11, "color");
      v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      -[PKSqueezePaletteViewExpandedColorsLayout _updateSelectedToolColorWithColor:isFromExtendedColorPicker:isContinuousColorSelection:](a1, v8, 0, 0);
    }

  }
}

void __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke_2(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  -[PKSqueezePaletteViewExpandedColorsLayout _performMulticolorButtonTapAction:](WeakRetained, v2);

}

- (void)_performMulticolorButtonTapAction:(id *)a1
{
  _QWORD *v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  const char *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD newValue[4];
  id v13;
  id buf[2];

  v3 = a2;
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Multicolor button tapped", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, a1);
    newValue[0] = MEMORY[0x1E0C809B0];
    newValue[1] = 3221225472;
    newValue[2] = __78__PKSqueezePaletteViewExpandedColorsLayout__performMulticolorButtonTapAction___block_invoke;
    newValue[3] = &unk_1E77789A0;
    objc_copyWeak(&v13, buf);
    v5 = a1 + 6;
    WeakRetained = objc_loadWeakRetained(v5);
    v8 = WeakRetained;
    if (WeakRetained)
      objc_setProperty_nonatomic_copy(WeakRetained, v7, newValue, 608);

    if (v3)
      v9 = (void *)v3[95];
    else
      v9 = 0;
    v10 = v9;
    v11 = objc_loadWeakRetained(v5);
    -[PKSqueezePaletteView _didTapMulticolorButton:currentSelectedColor:]((uint64_t)v11, v3, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }

}

void __103__PKSqueezePaletteViewExpandedColorsLayout_initWithContext_colorButtons_selectedColorIndex_backButton___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteViewExpandedColorsLayout _performBackButtonTapAction]((uint64_t)WeakRetained);

}

- (void)_performBackButtonTapAction
{
  NSObject *v2;
  _QWORD *v3;
  _QWORD *v4;
  id WeakRetained;
  uint8_t v6[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Back button tapped", v6, 2u);
    }

    v3 = *(_QWORD **)(a1 + 56);
    if (v3)
      v3 = (_QWORD *)v3[4];
    v4 = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v4);

  }
}

- (void)dealloc
{
  double *buttonAngles;
  objc_super v4;

  buttonAngles = self->_buttonAngles;
  if (buttonAngles)
  {
    free(buttonAngles);
    self->_buttonAngles = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKSqueezePaletteViewExpandedColorsLayout;
  -[PKSqueezePaletteViewExpandedColorsLayout dealloc](&v4, sel_dealloc);
}

- (void)_didTapMulticolorButton:(id)a3
{
  -[PKSqueezePaletteViewExpandedColorsLayout _performMulticolorButtonTapAction:]((id *)&self->super.isa, a3);
}

void __78__PKSqueezePaletteViewExpandedColorsLayout__performMulticolorButtonTapAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id v6;
  NSObject *v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *WeakRetained;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
      v18 = v6;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Update multicolor button color from extended color picker, color: %{private}@", buf, 0xCu);
    }

    v8 = WeakRetained;
    if (WeakRetained[9] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)WeakRetained[9];
        *(_DWORD *)buf = 134283521;
        v18 = v10;
        _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Unselect color swatch at index: %{private}ld", buf, 0xCu);
      }

      -[PKSqueezePaletteViewExpandedColorsLayout _currentSelectedButton]((uint64_t)WeakRetained);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSelected:", 0);

      v8 = WeakRetained;
      WeakRetained[9] = 0x7FFFFFFFFFFFFFFFLL;
    }
    v12 = (_QWORD *)v8[7];
    if (v12)
      v12 = (_QWORD *)v12[2];
    v13 = v12;
    objc_msgSend(v13, "setSelected:", 1);

    v14 = (_QWORD *)WeakRetained[7];
    if (v14)
      v14 = (_QWORD *)v14[2];
    v15 = v14;
    -[PKSqueezePaletteMulticolorSwatchButton setColor:]((uint64_t)v15, v6);

    -[PKSqueezePaletteViewExpandedColorsLayout _updateSelectedToolColorWithColor:isFromExtendedColorPicker:isContinuousColorSelection:]((uint64_t)WeakRetained, v6, 1, a3);
  }

}

- (id)_currentSelectedButton
{
  if (*(_QWORD *)(a1 + 72) == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateSelectedToolColorWithColor:(uint64_t)a3 isFromExtendedColorPicker:(uint64_t)a4 isContinuousColorSelection:
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  id WeakRetained;
  id v16;

  v16 = a2;
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    v8 = *(id *)(v7 + 8);
    v9 = v8;
    if (v8)
    {
      v10 = (void *)*((_QWORD *)v8 + 103);
      goto LABEL_4;
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = 0;
LABEL_4:
  v11 = v10;
  v12 = (void *)objc_msgSend(v11, "_copyWithColor:", v16);

  if (v12)
  {
    v13 = *(_QWORD **)(a1 + 56);
    if (v13)
      v13 = (_QWORD *)v13[1];
    v14 = v13;
    -[PKSqueezePaletteDrawingTool setTool:]((uint64_t)v14, v12);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[PKSqueezePaletteView _didSelectColor:isFromExtendedColorPicker:isContinuousColorSelection:]((uint64_t)WeakRetained, v16, a3, a4);

}

- (void)_didTapColorButton:(id)a3
{
  -[PKSqueezePaletteViewExpandedColorsLayout _performColorButtonTapAction:]((uint64_t)self, a3);
}

- (uint64_t)_updateColorUIStyle
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  if (result)
  {
    v1 = result;
    WeakRetained = objc_loadWeakRetained((id *)(result + 48));
    v3 = WeakRetained;
    if (WeakRetained)
      v4 = *((_QWORD *)WeakRetained + 74);
    else
      v4 = 0;
    v5 = *(_QWORD *)(v1 + 56);
    if (v5)
    {
      v6 = *(id *)(v5 + 16);
      v7 = v6;
      if (v6)
      {
        if (*((_QWORD *)v6 + 96) != v4)
        {
          *((_QWORD *)v6 + 96) = v4;
          -[PKSqueezePaletteMulticolorSwatchButton _updateUI]((uint64_t)v6);
        }
      }
    }
    else
    {
      v7 = 0;
    }

    v8 = *(void **)(v1 + 64);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__PKSqueezePaletteViewExpandedColorsLayout__updateColorUIStyle__block_invoke;
    v9[3] = &unk_1E77795D0;
    v9[4] = v1;
    return objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  }
  return result;
}

void __63__PKSqueezePaletteViewExpandedColorsLayout__updateColorUIStyle__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  _QWORD *v3;
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
  if (v3 && v3[96] != v5)
  {
    v3[96] = v5;
    -[PKPaletteColorSwatch setColorUserInterfaceStyle:]((_QWORD *)v3[94], v5);
  }

}

- (void)setupUI
{
  PKSqueezePaletteView **p_paletteView;
  id WeakRetained;
  PKSqueezePaletteViewExpandedColorsLayoutContext *context;
  PKSqueezePaletteViewExpandedColorsLayoutContext *v6;
  double multicolorButtonAngle;
  NSArray *colorButtons;
  void *v9;
  double v10;
  double width;
  double interButtonSpace;
  double *v13;
  double v14;
  double *v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  PKSqueezePaletteViewExpandedColorsLayoutContext *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[6];
  uint64_t v42;
  double *v43;
  uint64_t v44;
  double v45;
  _QWORD v46[6];

  v46[4] = *MEMORY[0x1E0C80C00];
  p_paletteView = &self->_paletteView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    context = self->_context;
    if (context)
      context = (PKSqueezePaletteViewExpandedColorsLayoutContext *)context->_multicolorButton;
    v34 = context;
    -[PKSqueezePaletteViewExpandedColorsLayoutContext addTarget:action:forControlEvents:](v34, "addTarget:action:forControlEvents:", self, sel__didTapMulticolorButton_, 64);
    -[UIButton addTarget:action:forControlEvents:](self->_backButton, "addTarget:action:forControlEvents:", self, sel__didTapBackButton_, 64);
    v6 = self->_context;
    if (v6)
      multicolorButtonAngle = v6->_multicolorButtonAngle;
    else
      multicolorButtonAngle = 0.0;
    v42 = 0;
    v43 = (double *)&v42;
    v44 = 0x2020000000;
    v45 = multicolorButtonAngle;
    colorButtons = self->_colorButtons;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __51__PKSqueezePaletteViewExpandedColorsLayout_setupUI__block_invoke;
    v41[3] = &unk_1E77795F8;
    v41[4] = self;
    v41[5] = &v42;
    -[NSArray enumerateObjectsUsingBlock:](colorButtons, "enumerateObjectsUsingBlock:", v41);
    if (self->_selectedColorIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSArray objectAtIndexedSubscript:](self->_colorButtons, "objectAtIndexedSubscript:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSelected:", 1);

    }
    v10 = v43[3];
    width = self->_buttonSize.width;
    interButtonSpace = self->_interButtonSpace;
    v13 = (double *)objc_loadWeakRetained((id *)p_paletteView);
    if (v13)
      v14 = v13[63];
    else
      v14 = 0.0;
    self->_backButtonAngle = v10 - (width + interButtonSpace) / v14;

    v15 = (double *)objc_loadWeakRetained((id *)p_paletteView);
    v16 = v15;
    if (v15)
      v17 = v15[63];
    else
      v17 = 0.0;
    v18 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v17, self->_backButtonAngle);
    v20 = v19;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_backButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = objc_loadWeakRetained((id *)p_paletteView);
    v22 = v21;
    if (v21)
      v23 = (void *)*((_QWORD *)v21 + 70);
    else
      v23 = 0;
    v24 = v23;
    objc_msgSend(v24, "addSubview:", self->_backButton);

    v35 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton centerXAnchor](self->_backButton, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_loadWeakRetained((id *)p_paletteView);
    objc_msgSend(v40, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, v18);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v37;
    -[UIButton centerYAnchor](self->_backButton, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_loadWeakRetained((id *)p_paletteView);
    objc_msgSend(v25, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v26, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v27;
    -[UIButton heightAnchor](self->_backButton, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", self->_buttonSize.height);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v29;
    -[UIButton widthAnchor](self->_backButton, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToConstant:", self->_buttonSize.width);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v32);

    v33 = objc_loadWeakRetained((id *)p_paletteView);
    -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v33, 1, 1, self->_backButtonAngle, multicolorButtonAngle);

    _Block_object_dispose(&v42, 8);
  }
}

void __51__PKSqueezePaletteViewExpandedColorsLayout_setupUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double *v22;
  double v23;
  double v24;
  double *v25;
  double *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__didTapColorButton_, 64);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v7 = WeakRetained;
  if (WeakRetained)
    v8 = (void *)*((_QWORD *)WeakRetained + 70);
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "addSubview:", v5);

  objc_msgSend(v5, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(v11, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(v15, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v20 = *(double *)(v18 + 8);
  v21 = *(double *)(v18 + 32);
  v22 = (double *)objc_loadWeakRetained((id *)(v18 + 48));
  v23 = 0.0;
  v24 = 0.0;
  if (v22)
    v24 = v22[63];

  v25 = (double *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v26 = v25;
  if (v25)
    v23 = v25[63];
  v27 = v19 - (v20 + v21) / v24;
  v28 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v23, v27);
  v30 = v29;

  objc_msgSend(v13, "setConstant:", v28);
  objc_msgSend(v17, "setConstant:", v30);
  v31 = (void *)MEMORY[0x1E0CB3718];
  v37[0] = v13;
  v37[1] = v17;
  objc_msgSend(v5, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", *(double *)(*(_QWORD *)(a1 + 32) + 16));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v33;
  objc_msgSend(v5, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "constraintEqualToConstant:", *(double *)(*(_QWORD *)(a1 + 32) + 8));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v36);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 8 * a3) = v27;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v27;

}

- (void)updateUI
{
  PKSqueezePaletteViewExpandedColorsLayoutContext *context;
  PKSqueezePaletteViewExpandedColorsLayoutContext *v4;
  UIButton *backButton;
  CGAffineTransform v6;
  CGAffineTransform v7;

  -[NSArray enumerateObjectsUsingBlock:](self->_colorButtons, "enumerateObjectsUsingBlock:", &__block_literal_global_29);
  if (self->_selectedColorIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    context = self->_context;
    if (context)
      context = (PKSqueezePaletteViewExpandedColorsLayoutContext *)context->_multicolorButton;
    v4 = context;
    -[PKSqueezePaletteMulticolorSwatchButton setColor:]((uint64_t)v4, 0);

  }
  CGAffineTransformMakeRotation(&v7, self->_backButtonAngle + 1.57079633);
  backButton = self->_backButton;
  v6 = v7;
  -[UIButton setTransform:](backButton, "setTransform:", &v6);
  -[PKSqueezePaletteViewExpandedColorsLayout _updateColorUIStyle]((uint64_t)self);
}

uint64_t __52__PKSqueezePaletteViewExpandedColorsLayout_updateUI__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 1.0);
}

- (void)willTransitionToLayout:(id)a3
{
  PKSqueezePaletteViewExpandedColorsLayoutContext *context;
  UIButton *backButton;
  PKSqueezePaletteViewExpandedColorsLayoutContext *v6;

  -[NSArray enumerateObjectsUsingBlock:](self->_colorButtons, "enumerateObjectsUsingBlock:", &__block_literal_global_14_0);
  context = self->_context;
  if (context)
    context = (PKSqueezePaletteViewExpandedColorsLayoutContext *)context->_multicolorButton;
  v6 = context;
  -[PKSqueezePaletteViewExpandedColorsLayoutContext removeTarget:action:forControlEvents:](v6, "removeTarget:action:forControlEvents:", self, sel__didTapMulticolorButton_, 64);
  -[UIButton removeFromSuperview](self->_backButton, "removeFromSuperview");
  backButton = self->_backButton;
  self->_backButton = 0;

}

uint64_t __67__PKSqueezePaletteViewExpandedColorsLayout_willTransitionToLayout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 0.0);
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  PKSqueezePaletteViewExpandedColorsLayoutContext *context;
  id WeakRetained;
  PKSqueezePaletteViewExpandedColorsLayoutContext *v6;

  context = self->_context;
  if (a3 == 3)
  {
    if (context)
      context = (PKSqueezePaletteViewExpandedColorsLayoutContext *)context->_multicolorButton;
    v6 = context;
    -[PKSqueezePaletteViewExpandedColorsLayout _performMulticolorButtonTapAction:]((id *)&self->super.isa, v6);
  }
  else
  {
    if (context)
      context = (PKSqueezePaletteViewExpandedColorsLayoutContext *)context->_previousLayout;
    v6 = context;
    WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
    -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);

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
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_colorButtons, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_paletteView);
}

@end
