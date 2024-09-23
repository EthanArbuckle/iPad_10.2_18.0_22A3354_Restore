@implementation PKSqueezePaletteViewExpandedOptionsLayout

- (id)initWithContext:(void *)a3 backButton:(void *)a4 textBoxButton:(void *)a5 signatureButton:(void *)a6 shapesButton:(void *)a7 stickersButton:(void *)a8 gearButton:
{
  id *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id *val;
  _QWORD v41[4];
  id v42;
  id v43;
  id from;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id location;
  objc_super v50;
  _BYTE v51[128];
  _QWORD v52[7];

  v52[5] = *MEMORY[0x1E0C80C00];
  v32 = a2;
  v33 = a3;
  v34 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a7;
  v38 = a8;
  if (a1
    && (v50.receiver = a1,
        v50.super_class = (Class)PKSqueezePaletteViewExpandedOptionsLayout,
        v16 = (id *)objc_msgSendSuper2(&v50, sel_init, v32, v33, v34, v35, v36, v37, v38),
        (val = v16) != 0))
  {
    objc_storeStrong(v16 + 7, a2);
    objc_storeStrong(val + 8, a3);
    objc_storeStrong(val + 9, a4);
    objc_storeStrong(val + 10, a5);
    objc_storeStrong(val + 11, a6);
    objc_storeStrong(val + 12, a7);
    objc_storeStrong(val + 13, a8);
    *((double *)val + 1) = PKSqueezePaletteButtonSize();
    val[2] = v17;
    val[3] = (id)PKSqueezePaletteButtonInterItemSpacing;
    v18 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v19 = val[11];
    v52[0] = val[13];
    v52[1] = v19;
    v20 = val[9];
    v52[2] = val[10];
    v52[3] = v20;
    v52[4] = val[8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v18, "initWithArray:", v21);

    v22 = val[12];
    if (v22)
      objc_msgSend(v39, "insertObject:atIndex:", v22, objc_msgSend(v39, "indexOfObject:", val[8]));
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v39);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = val[4];
    val[4] = (id)v23;

    val[5] = malloc_type_malloc(8 * objc_msgSend(val[4], "count"), 0x100004000313F17uLL);
    objc_initWeak(&location, val);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v25 = val[4];
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v46;
      v28 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v46 != v27)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_initWeak(&from, v30);
          v41[0] = v28;
          v41[1] = 3221225472;
          v41[2] = __141__PKSqueezePaletteViewExpandedOptionsLayout_initWithContext_backButton_textBoxButton_signatureButton_shapesButton_stickersButton_gearButton___block_invoke;
          v41[3] = &unk_1E7778930;
          objc_copyWeak(&v42, &location);
          objc_copyWeak(&v43, &from);
          objc_msgSend(v30, "_set_pk_longSqueezeAction:", v41);
          objc_destroyWeak(&v43);
          objc_destroyWeak(&v42);
          objc_destroyWeak(&from);
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v26);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    val = 0;
  }

  return val;
}

void __141__PKSqueezePaletteViewExpandedOptionsLayout_initWithContext_backButton_textBoxButton_signatureButton_shapesButton_stickersButton_gearButton___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  -[PKSqueezePaletteViewExpandedOptionsLayout _performButtonAction:]((uint64_t)WeakRetained, v2);

}

- (void)_performButtonAction:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD *v9;
  id WeakRetained;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(id *)(a1 + 64) == v3)
    {
      v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Did tap on back button", buf, 2u);
      }

      v9 = *(_QWORD **)(a1 + 56);
      if (v9)
        v9 = (_QWORD *)v9[2];
      v7 = v9;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v7);

    }
    else if (*(id *)(a1 + 104) == v3)
    {
      v11 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Did tap on gear button", v20, 2u);
      }

      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView _didTapMoreOptionsButton:]((uint64_t)v7, v4);
    }
    else if (*(id *)(a1 + 96) == v3)
    {
      v12 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEFAULT, "Did tap on stickers button", v19, 2u);
      }

      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView _didTapStickersButton:]((uint64_t)v7, v4);
    }
    else if (*(id *)(a1 + 88) == v3)
    {
      v13 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Did tap on shapes button", v18, 2u);
      }

      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView _didTapShapesButton:]((uint64_t)v7, v4);
    }
    else if (*(id *)(a1 + 80) == v3)
    {
      v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEFAULT, "Did tap on signatures button", v17, 2u);
      }

      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      -[PKSqueezePaletteView _didTapSignatureButton:]((uint64_t)v7, v4);
    }
    else
    {
      v5 = *(void **)(a1 + 72);
      v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      v7 = v6;
      if (v5 == v4)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Did tap on text-box button", v16, 2u);
        }

        v7 = objc_loadWeakRetained((id *)(a1 + 48));
        -[PKSqueezePaletteView _didTapTextBoxButton:]((uint64_t)v7, v4);
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_fault_impl(&dword_1BE213000, v7, OS_LOG_TYPE_FAULT, "Unhandled button action", v15, 2u);
      }
    }

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
  v4.super_class = (Class)PKSqueezePaletteViewExpandedOptionsLayout;
  -[PKSqueezePaletteViewExpandedOptionsLayout dealloc](&v4, sel_dealloc);
}

- (void)_didTapButton:(id)a3
{
  -[PKSqueezePaletteViewExpandedOptionsLayout _performButtonAction:]((uint64_t)self, a3);
}

- (void)setupUI
{
  PKSqueezePaletteView **p_paletteView;
  id WeakRetained;
  PKSqueezePaletteViewExpandedOptionsLayoutContext *context;
  double moreButtonAngle;
  NSArray *buttons;
  id v8;
  void *v9;
  PKSqueezePaletteViewExpandedOptionsLayoutContext *v10;
  double v11;
  _QWORD v12[6];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  double v16;

  p_paletteView = &self->_paletteView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    v13 = 0;
    v14 = (double *)&v13;
    v15 = 0x2020000000;
    v16 = 0.0;
    context = self->_context;
    if (context)
      moreButtonAngle = context->_moreButtonAngle;
    else
      moreButtonAngle = 0.0;
    v16 = moreButtonAngle;
    buttons = self->_buttons;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__PKSqueezePaletteViewExpandedOptionsLayout_setupUI__block_invoke;
    v12[3] = &unk_1E777D4E8;
    v12[4] = self;
    v12[5] = &v13;
    -[NSArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v12);
    v8 = objc_loadWeakRetained((id *)p_paletteView);
    v9 = v8;
    v10 = self->_context;
    if (v10)
      v11 = v10->_moreButtonAngle;
    else
      v11 = 0.0;
    -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v8, 1, 1, v14[3], v11);

    _Block_object_dispose(&v13, 8);
  }
}

void __52__PKSqueezePaletteViewExpandedOptionsLayout_setupUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double *v23;
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
  uint64_t v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__didTapButton_, 64);
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

  v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v19 = 0.0;
  v20 = 0.0;
  if (a3)
  {
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(double *)(v21 + 8) + *(double *)(v21 + 24);
    v23 = (double *)objc_loadWeakRetained((id *)(v21 + 48));
    if (v23)
      v24 = v23[63];
    else
      v24 = 0.0;
    v20 = v22 / v24;

  }
  v37 = a3;
  v25 = (double *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v26 = v25;
  if (v25)
    v19 = v25[63];
  v27 = v18 - v20;
  v28 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v19, v27);
  v30 = v29;

  objc_msgSend(v13, "setConstant:", v28);
  objc_msgSend(v17, "setConstant:", v30);
  v31 = (void *)MEMORY[0x1E0CB3718];
  v38[0] = v13;
  v38[1] = v17;
  objc_msgSend(v5, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", *(double *)(*(_QWORD *)(a1 + 32) + 16));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v33;
  objc_msgSend(v5, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", *(double *)(*(_QWORD *)(a1 + 32) + 8));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v36);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8 * v37) = v27;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v27;

}

- (void)updateUI
{
  NSArray *buttons;
  _QWORD v3[5];

  buttons = self->_buttons;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__PKSqueezePaletteViewExpandedOptionsLayout_updateUI__block_invoke;
  v3[3] = &unk_1E777D510;
  v3[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v3);
}

void __53__PKSqueezePaletteViewExpandedOptionsLayout_updateUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v5 = a2;
  objc_msgSend(v5, "setAlpha:", 1.0);
  CGAffineTransformMakeRotation(&v7, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8 * a3) + 1.57079633);
  v6 = v7;
  objc_msgSend(v5, "setTransform:", &v6);

}

- (void)willTransitionToLayout:(id)a3
{
  -[NSArray enumerateObjectsUsingBlock:](self->_buttons, "enumerateObjectsUsingBlock:", &__block_literal_global_84);
}

uint64_t __68__PKSqueezePaletteViewExpandedOptionsLayout_willTransitionToLayout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 0.0);
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  PKSqueezePaletteViewExpandedOptionsLayoutContext *context;
  id WeakRetained;
  PKSqueezePaletteViewExpandedOptionsLayoutContext *v6;

  context = self->_context;
  if (context)
    context = (PKSqueezePaletteViewExpandedOptionsLayoutContext *)context->_previousLayout;
  v6 = context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);

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
  objc_storeStrong((id *)&self->_gearButton, 0);
  objc_storeStrong((id *)&self->_stickersButton, 0);
  objc_storeStrong((id *)&self->_shapesButton, 0);
  objc_storeStrong((id *)&self->_signatureButton, 0);
  objc_storeStrong((id *)&self->_textBoxButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_paletteView);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
