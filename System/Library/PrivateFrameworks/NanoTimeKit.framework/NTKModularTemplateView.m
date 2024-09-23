@implementation NTKModularTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  return 0;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  CLKComplicationTemplate *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL8 v12;
  NTKFaceColorPalette *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CLKComplicationTemplate *v24;

  v6 = (CLKComplicationTemplate *)a3;
  if (self->_complicationTemplate != v6)
  {
    v24 = v6;
    objc_storeStrong((id *)&self->_complicationTemplate, a3);
    v7 = -[NTKModularTemplateView highlightMode](self, "highlightMode");
    -[NTKModularTemplateView _update](self, "_update");
    v8 = -[NTKModularTemplateView highlightMode](self, "highlightMode");
    -[CLKComplicationTemplate tintColor](self->_complicationTemplate, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKModuleView setOverrideColor:](self, "setOverrideColor:", v9);

    -[NTKModuleView colorScheme](self, "colorScheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsOverrideFaceColor");

    if (v11)
    {
      v12 = self->_highlightMode - 1 < 2;
      v13 = -[NTKFaceColorPalette initWithDomainName:inBundle:]([NTKFaceColorPalette alloc], "initWithDomainName:inBundle:", 0, 0);
      +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", CFSTR("special.multicolor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFaceColorPalette setPigmentEditOption:](v13, "setPigmentEditOption:", v14);

      -[NTKModuleView device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKModuleView overrideColor](self, "overrideColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKModuleView colorScheme](self, "colorScheme");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", v15, v13, v16, objc_msgSend(v17, "units"), v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKModularTemplateView setContainsOverrideFaceColor:](self, "setContainsOverrideFaceColor:", v18);

LABEL_6:
      v6 = v24;
      goto LABEL_7;
    }
    v6 = v24;
    if (v7 != v8)
    {
      v19 = self->_highlightMode == 1;
      -[NTKModuleView device](self, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKModuleView colorScheme](self, "colorScheme");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "faceColorPalette");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKModuleView colorScheme](self, "colorScheme");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", v20, v22, 0, objc_msgSend(v23, "units"), v19);
      v13 = (NTKFaceColorPalette *)objc_claimAutoreleasedReturnValue();

      -[NTKModularTemplateView setContainsOverrideFaceColor:](self, "setContainsOverrideFaceColor:", v13);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4
{
  unint64_t highlightMode;
  _BOOL8 v7;
  id v8;
  double v10;
  void *v11;
  void *v12;
  id v13;

  highlightMode = self->_highlightMode;
  v7 = highlightMode == 1;
  v8 = a3;
  if (objc_msgSend(v8, "isMulticolor"))
  {
    v7 = highlightMode == 1 || self->_highlightMode == 2;
    -[NTKModuleView overrideColor](self, "overrideColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0.0;
  }
  else
  {
    v13 = 0;
    v10 = 1.0;
  }
  -[NTKModuleView transitionToMonochromeWithFraction:](self, "transitionToMonochromeWithFraction:", v10);
  -[NTKModuleView device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", v11, v8, v13, a4, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKModularTemplateView setContainsOverrideFaceColor:](self, "setContainsOverrideFaceColor:", v12);
}

- (void)_setColorScheme:(id)a3 propagateToSubviews:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKModularTemplateView;
  -[NTKModuleView setColorScheme:](&v7, sel_setColorScheme_, v6);
  if (v4)
    -[NTKModularTemplateView _propagateColorSchemeToSubviews:](self, "_propagateColorSchemeToSubviews:", v6);

}

- (void)setContainsOverrideFaceColor:(id)a3
{
  -[NTKModularTemplateView _setColorScheme:propagateToSubviews:](self, "_setColorScheme:propagateToSubviews:", a3, 1);
}

- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 units:(unint64_t)a6 brightenedUnits:(unint64_t)a7
{
  id v12;
  id v13;
  char v14;
  char v15;
  char v16;
  unint64_t highlightMode;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void (**v27)(void *, void *);
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void (**v33)(void *, void *);
  uint64_t v34;
  _QWORD v35[4];
  void (**v36)(void *, void *);
  _QWORD v37[4];
  void (**v38)(void *, void *);
  _QWORD aBlock[5];
  id v40;
  id v41;
  id v42;
  unint64_t v43;
  double v44;
  char v45;
  BOOL v46;
  char v47;

  v12 = a4;
  v13 = a5;
  v14 = objc_msgSend(v12, "isMulticolor");
  v15 = objc_msgSend(v13, "isMulticolor");
  v16 = v15;
  highlightMode = self->_highlightMode;
  if ((v14 & 1) != 0 || (v15 & 1) != 0)
  {
    v22 = highlightMode == 1;
    +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", CFSTR("special.multicolor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v12, "copyWithOption:", v23);

    v25 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke;
    aBlock[3] = &unk_1E6BD6D80;
    v45 = v14;
    v46 = v22;
    aBlock[4] = self;
    v26 = v24;
    v40 = v26;
    v43 = a6;
    v41 = v12;
    v47 = v16;
    v42 = v13;
    v44 = a3;
    v27 = (void (**)(void *, void *))_Block_copy(aBlock);
    -[CLKComplicationTemplate tintColor](self->_complicationTemplate, "tintColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      -[NTKModuleView overrideColor](self, "overrideColor");
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    v31 = v30;

    v27[2](v27, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKModularTemplateView _setColorScheme:propagateToSubviews:](self, "_setColorScheme:propagateToSubviews:", v32, 0);
    if (objc_msgSend(v32, "containsOverrideFaceColor"))
    {
      v37[0] = v25;
      v37[1] = 3221225472;
      v37[2] = __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke_2;
      v37[3] = &unk_1E6BD6DA8;
      v33 = v27;
      v38 = v33;
      -[NTKModuleView _enumerateForegroundColoringViewsWithBlock:](self, "_enumerateForegroundColoringViewsWithBlock:", v37);
      v35[0] = v25;
      v35[1] = 3221225472;
      v35[2] = __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke_3;
      v35[3] = &unk_1E6BD6DA8;
      v36 = v33;
      -[NTKModuleView _enumerateSecondaryForegroundColoringViewsWithBlock:](self, "_enumerateSecondaryForegroundColoringViewsWithBlock:", v35);

    }
  }
  else
  {
    v18 = highlightMode == 1;
    -[NTKModuleView device](self, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKModuleView overrideColor](self, "overrideColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v34) = v18;
    +[NTKFaceColorScheme interpolationForDevice:fromFaceColorPalette:toFaceColorPalette:fraction:units:brightenUnits:overrideColor:alternateHighlight:](NTKFaceColorScheme, "interpolationForDevice:fromFaceColorPalette:toFaceColorPalette:fraction:units:brightenUnits:overrideColor:alternateHighlight:", v19, v12, v13, a6, a7, v20, a3, v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKModularTemplateView setContainsOverrideFaceColor:](self, "setContainsOverrideFaceColor:", v21);

  }
  -[NTKModuleView _applyMonochromeTransitionFraction:fromFaceColorPalette:toFaceColorPalette:](self, "_applyMonochromeTransitionFraction:fromFaceColorPalette:toFaceColorPalette:", v12, v13, a3);

}

id __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;

  v3 = a2;
  if (*(_BYTE *)(a1 + 80))
  {
    v4 = *(_QWORD **)(a1 + 32);
    if (*(_BYTE *)(a1 + 81))
      v5 = 1;
    else
      v5 = v4[76] == 2;
    objc_msgSend(v4, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 64);
    v10 = v6;
    v11 = v3;
    v9 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(unsigned __int8 *)(a1 + 81);
    v10 = v6;
    v11 = 0;
  }
  +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", v10, v7, v11, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 82))
  {
    v13 = *(_QWORD **)(a1 + 32);
    if (*(_BYTE *)(a1 + 81))
      v14 = 1;
    else
      v14 = v13[76] == 2;
    objc_msgSend(v13, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 64);
    v19 = v15;
    v20 = v3;
    v18 = v14;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 64);
    v18 = *(unsigned __int8 *)(a1 + 81);
    v19 = v15;
    v20 = 0;
  }
  +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", v19, v16, v20, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKFaceColorScheme interpolationFrom:to:fraction:](NTKFaceColorScheme, "interpolationFrom:to:fraction:", v12, v21, *(double *)(a1 + 72));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "overrideColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "foregroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v5);

  }
}

void __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "overrideColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryForegroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v5);

  }
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  NSDate *timeTravelDate;
  NSDate *v9;
  _BOOL4 v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v6 = a3;
  v7 = v6;
  timeTravelDate = self->_timeTravelDate;
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqual:", timeTravelDate) & 1) != 0)
      goto LABEL_14;
    v9 = self->_timeTravelDate;
    v11 = -[CLKComplicationTemplate timeTravelUpdateFrequency](self->_complicationTemplate, "timeTravelUpdateFrequency") == 2
       || v9 == 0;
  }
  else
  {
    if (!timeTravelDate || (objc_msgSend(0, "isEqual:") & 1) != 0)
      goto LABEL_14;
    v11 = 1;
  }
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  v12 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__NTKModularTemplateView_setTimeTravelDate_animated___block_invoke;
  v14[3] = &unk_1E6BD41E0;
  v14[4] = self;
  -[NTKModuleView _enumerateForegroundColoringViewsWithBlock:](self, "_enumerateForegroundColoringViewsWithBlock:", v14);
  v13[0] = v12;
  v13[1] = 3221225472;
  v13[2] = __53__NTKModularTemplateView_setTimeTravelDate_animated___block_invoke_2;
  v13[3] = &unk_1E6BD41E0;
  v13[4] = self;
  -[NTKModuleView _enumerateSecondaryForegroundColoringViewsWithBlock:](self, "_enumerateSecondaryForegroundColoringViewsWithBlock:", v13);
  if (v11)
    -[NTKModularTemplateView _update](self, "_update");
LABEL_14:

}

void __53__NTKModularTemplateView_setTimeTravelDate_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setInTimeTravel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592) != 0);

}

void __53__NTKModularTemplateView_setTimeTravelDate_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setInTimeTravel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592) != 0);

}

- (BOOL)_useInvertedHighlightForColorScheme:(id)a3
{
  id v4;
  void *v5;
  unint64_t highlightMode;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  highlightMode = self->_highlightMode;
  v7 = highlightMode == 1 || highlightMode == 2 && (objc_msgSend(v4, "containsOverrideFaceColor") & 1) != 0;

  return v7;
}

- (void)_enumerateColoringViewsSubviewsWithBlock:(id)a3 invertedHighlight:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__NTKModularTemplateView__enumerateColoringViewsSubviewsWithBlock_invertedHighlight___block_invoke;
  v13[3] = &unk_1E6BD6DD0;
  v8 = v6;
  v14 = v8;
  v15 = a4;
  -[NTKModuleView _enumerateForegroundColoringViewsWithBlock:](self, "_enumerateForegroundColoringViewsWithBlock:", v13);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __85__NTKModularTemplateView__enumerateColoringViewsSubviewsWithBlock_invertedHighlight___block_invoke_2;
  v10[3] = &unk_1E6BD6DD0;
  v11 = v8;
  v12 = a4;
  v9 = v8;
  -[NTKModuleView _enumerateSecondaryForegroundColoringViewsWithBlock:](self, "_enumerateSecondaryForegroundColoringViewsWithBlock:", v10);

}

uint64_t __85__NTKModularTemplateView__enumerateColoringViewsSubviewsWithBlock_invertedHighlight___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_BYTE *)(a1 + 40) == 0);
}

uint64_t __85__NTKModularTemplateView__enumerateColoringViewsSubviewsWithBlock_invertedHighlight___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

- (void)_propagateColorSchemeToSubviews:(id)a3
{
  id v4;
  _BOOL8 v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[NTKModularTemplateView _useInvertedHighlightForColorScheme:](self, "_useInvertedHighlightForColorScheme:", v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__NTKModularTemplateView__propagateColorSchemeToSubviews___block_invoke;
  v7[3] = &unk_1E6BD6DF8;
  v8 = v4;
  v6 = v4;
  -[NTKModularTemplateView _enumerateColoringViewsSubviewsWithBlock:invertedHighlight:](self, "_enumerateColoringViewsSubviewsWithBlock:invertedHighlight:", v7, v5);

}

void __58__NTKModularTemplateView__propagateColorSchemeToSubviews___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  id v10;

  v5 = a2;
  if (a3)
  {
    v10 = v5;
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsOverrideFaceColor");
    objc_msgSend(v10, "overrideColor");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (!v9)
      objc_msgSend(v10, "setColor:", v7);

    v5 = v10;
  }

}

- (CLKComplicationTemplate)complicationTemplate
{
  return self->_complicationTemplate;
}

- (void)setComplicationTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_complicationTemplate, a3);
}

- (NSDate)timeTravelDate
{
  return (NSDate *)objc_getProperty(self, a2, 592, 1);
}

- (unint64_t)highlightMode
{
  return self->_highlightMode;
}

- (void)setHighlightMode:(unint64_t)a3
{
  self->_highlightMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationTemplate, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
}

@end
