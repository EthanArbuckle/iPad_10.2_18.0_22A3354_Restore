@implementation NTKDigitialUtilitarianFaceViewComplicationFactory

- (id)initForDevice:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKDigitialUtilitarianFaceViewComplicationFactory;
  v5 = -[NTKFaceViewComplicationFactory initForDevice:](&v13, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = -[NTKUtilityComplicationFactory initForDevice:]([NTKUtilityComplicationFactory alloc], "initForDevice:", v4);
    v7 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v6;

    objc_msgSend(*((id *)v5 + 9), "setForegroundAlpha:", 1.0);
    objc_msgSend(*((id *)v5 + 9), "setForegroundImageAlpha:", 1.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, *(double *)off_1E6BC9B88);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v8;

    objc_msgSend(v5, "setAlpha:", 1.0);
    objc_msgSend(v5, "setContentSpecificAnimationDuration:", 0.45);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setForegroundColor:", v10);

    v14[0] = CFSTR("top-right");
    v14[1] = CFSTR("bottom");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSupportedComplicationSlots:", v11);

  }
  return v5;
}

- (UIColor)shadowColor
{
  void (**shadowColorProviderBlock)(id, SEL);
  UIColor *v4;
  UIColor *shadowColor;
  UIColor *v6;

  shadowColorProviderBlock = (void (**)(id, SEL))self->_shadowColorProviderBlock;
  if (shadowColorProviderBlock)
  {
    shadowColorProviderBlock[2](shadowColorProviderBlock, a2);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    shadowColor = v4;
    if (!v4)
      shadowColor = self->_shadowColor;
    v6 = shadowColor;

  }
  else
  {
    v6 = self->_shadowColor;
  }
  return v6;
}

- (double)_timeTravelYAdjustment
{
  void (**timeTravelYAdjustmentProviderBlock)(void);
  double result;

  timeTravelYAdjustmentProviderBlock = (void (**)(void))self->_timeTravelYAdjustmentProviderBlock;
  if (!timeTravelYAdjustmentProviderBlock)
    return 0.0;
  timeTravelYAdjustmentProviderBlock[2]();
  return result;
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4;
  void *v5;
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
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NTKUtilityComplicationFactory *complicationFactory;
  int64_t v29;
  NTKUtilityComplicationFactory *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  NTKUtilityComplicationFactory *v36;
  int64_t v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  uint64_t v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKFaceViewComplicationFactory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _LayoutConstants_8(v5);
  v64 = v7;

  objc_msgSend(v4, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[NTKDigitialUtilitarianFaceViewComplicationFactory _timeTravelYAdjustment](self, "_timeTravelYAdjustment");
  if (v16 != 0.0)
  {
    CLKAlterRect();
    v9 = v17;
    v11 = v18;
    v13 = v19;
    v15 = v20;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[NTKDigitialUtilitarianFaceViewComplicationFactory supportedComplicationSlots](self, "supportedComplicationSlots");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v66;
    v63 = v15;
    v62 = v21;
    v61 = -v6;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v66 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v25);
        objc_msgSend(v4, "complicationLayoutforSlot:", v26, *(_QWORD *)&v61);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isEqualToString:", CFSTR("bottom")))
        {
          complicationFactory = self->_complicationFactory;
          v29 = -[NTKDigitialUtilitarianFaceViewComplicationFactory _photosUtilitySlotForSlot:](self, "_photosUtilitySlotForSlot:", v26);
          v30 = complicationFactory;
          v31 = v27;
          v32 = v9;
          v33 = v11;
          v34 = v13;
          v35 = v15;
LABEL_12:
          -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](v30, "configureComplicationLayout:forSlot:withBounds:", v31, v29, v32, v33, v34, v35);
          goto LABEL_13;
        }
        if (objc_msgSend(v26, "isEqualToString:", CFSTR("top-right")))
        {
          v36 = self->_complicationFactory;
          v37 = -[NTKDigitialUtilitarianFaceViewComplicationFactory _photosUtilitySlotForSlot:](self, "_photosUtilitySlotForSlot:", v26);
          CLKAlterRect();
          v30 = v36;
          v31 = v27;
          v29 = v37;
          goto LABEL_12;
        }
        if (objc_msgSend(v26, "isEqualToString:", CFSTR("date")))
        {
          -[NTKFaceViewComplicationFactory device](self, "device");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = NTKDigitalTimeLabelStyleWideRightSideMargin(v38);
          -[NTKFaceViewComplicationFactory device](self, "device");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 1, v40, v9, v11, v13, v15, v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "layoutRule");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "referenceFrame");
          v44 = v43;
          v45 = v13;
          v46 = v9;
          v48 = v47;
          v49 = v11;
          v50 = v6;
          v52 = v51;
          v54 = v53;

          v71.origin.x = v44;
          v71.origin.y = v48;
          v71.size.width = v52;
          v71.size.height = v54;
          v55 = CGRectGetMaxY(v71) - v64;
          -[NTKFaceViewComplicationFactory device](self, "device");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v55;
          v9 = v46;
          v13 = v45;
          v58 = v52;
          v6 = v50;
          v11 = v49;
          v15 = v63;
          +[NTKLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", v56, 2, 0, v44, v57, v58, 46.0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "setDefaultLayoutRule:forState:", v59, 0);
          v21 = v62;

        }
LABEL_13:

        ++v25;
      }
      while (v23 != v25);
      v60 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      v23 = v60;
    }
    while (v60);
  }

}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v10;
  id v11;
  id v12;
  NTKDateComplicationLabel *v13;
  void *v14;
  NTKDateComplicationLabel *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("date")))
  {
    v13 = [NTKDateComplicationLabel alloc];
    -[NTKFaceViewComplicationFactory device](self, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NTKDateComplicationLabel initWithSizeStyle:accentType:forDevice:](v13, "initWithSizeStyle:accentType:forDevice:", 0, 0, v14);

    -[NTKFaceViewComplicationFactory device](self, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_8(v16);
    v18 = v17;

    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v18, *MEMORY[0x1E0DC1430]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDateComplicationLabel setFont:](v15, "setFont:", v19);
    -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDateComplicationLabel setTextColor:](v15, "setTextColor:", v20);

    -[NTKDateComplicationLabel setUsesLegibility:](v15, "setUsesLegibility:", self->_usesLegibility);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("he"));
    v24 = objc_msgSend(v22, "isEqualToString:", CFSTR("pl"));
    v25 = 4096;
    if (!v24)
      v25 = 0;
    if (v23)
      v26 = 2048;
    else
      v26 = v25;
    -[NTKDateComplicationLabel setOverrideDateStyle:](v15, "setOverrideDateStyle:", v26);

  }
  else
  {
    v15 = -[NTKUtilityComplicationFactory newViewForComplication:family:forSlot:](self->_complicationFactory, "newViewForComplication:family:forSlot:", v10, a4, -[NTKDigitialUtilitarianFaceViewComplicationFactory _photosUtilitySlotForSlot:](self, "_photosUtilitySlotForSlot:", v11));
    -[NTKDigitialUtilitarianFaceViewComplicationFactory configureComplicationView:forSlot:faceView:](self, "configureComplicationView:forSlot:faceView:", v15, v11, v12);
  }

  return v15;
}

- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5
{
  return (unint64_t)a4 > 1;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  -[NTKDigitialUtilitarianFaceViewComplicationFactory _configureComplicationView:forSlot:attributes:faceView:](self, "_configureComplicationView:forSlot:attributes:faceView:", a3, a4, -1, a5);
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4 attributes:(unint64_t)a5 faceView:(id)a6
{
  char v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a5;
  v16 = a3;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(v16, "conformsToProtocol:", &unk_1F8E9F268))
  {
    v12 = v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "setUseBlockyHighlightCorners:", 1);
      if ((v7 & 0x10) == 0)
      {
LABEL_4:
        if ((v7 & 1) == 0)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    else if ((v7 & 0x10) == 0)
    {
      goto LABEL_4;
    }
    objc_msgSend(v12, "setFontWeight:", *MEMORY[0x1E0DC1448]);
    objc_msgSend(v12, "setUseAlternativePunctuation:", 1);
    -[NTKUtilityComplicationFactory foregroundAlphaForEditing:](self->_complicationFactory, "foregroundAlphaForEditing:", objc_msgSend(v11, "editing"));
    objc_msgSend(v12, "setForegroundAlpha:");
    -[NTKUtilityComplicationFactory foregroundImageAlphaForEditing:](self->_complicationFactory, "foregroundImageAlphaForEditing:", objc_msgSend(v11, "editing"));
    objc_msgSend(v12, "setForegroundImageAlpha:");
    objc_msgSend(v12, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKDigitialUtilitarianFaceViewComplicationFactory _photosUtilitySlotForSlot:](self, "_photosUtilitySlotForSlot:", v10)));
    objc_msgSend(v12, "setSuppressesInternalColorOverrides:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    objc_msgSend(v12, "setUsesLegibility:", self->_usesLegibility);
    if ((v7 & 1) == 0)
    {
LABEL_5:
      if ((v7 & 2) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
LABEL_12:
    -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setForegroundColor:", v14);

    if ((v7 & 2) == 0)
    {
LABEL_6:
      if ((v7 & 4) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
LABEL_7:
      -[NTKFaceViewComplicationFactory alpha](self, "alpha");
      objc_msgSend(v12, "setAlpha:");
      goto LABEL_8;
    }
LABEL_13:
    -[NTKDigitialUtilitarianFaceViewComplicationFactory shadowColor](self, "shadowColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowColor:", v15);

    if ((v7 & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_9:

}

- (int64_t)_photosUtilitySlotForSlot:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top-right")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("date")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)prepareForEditingForFaceView:(id)a3
{
  -[NTKDigitialUtilitarianFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:faceView:](self, "applyComplicationContentSpecificAttributesAnimated:faceView:", 1, a3);
}

- (void)cleanupAfterEditingForFaceView:(id)a3
{
  -[NTKDigitialUtilitarianFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:faceView:](self, "applyComplicationContentSpecificAttributesAnimated:faceView:", 1, a3);
}

- (void)applyComplicationContentSpecificAttributesAnimated:(BOOL)a3 faceView:(id)a4
{
  _BOOL8 v4;
  void *v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (v4)
  {
    -[NTKFaceViewComplicationFactory foregroundColorProviderBlock](self, "foregroundColorProviderBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6 != 0;
    -[NTKFaceViewComplicationFactory alphaProviderBlock](self, "alphaProviderBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = v7 | 4;
    else
      v9 = v7;
  }
  else
  {
    v9 = -1;
  }
  -[NTKFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:attributes:faceView:](self, "applyComplicationContentSpecificAttributesAnimated:attributes:faceView:", v4, v9, v10);

}

- (id)createComplicationContentSpecificAttributesAnimationWithAttributes:(unint64_t)a3 faceView:(id)a4 forSlots:(id)a5
{
  char v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  char v29;
  BOOL v30;
  BOOL v31;

  v5 = a3;
  v7 = a4;
  -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitialUtilitarianFaceViewComplicationFactory shadowColor](self, "shadowColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceViewComplicationFactory alpha](self, "alpha");
  v11 = v10;
  v12 = (void *)objc_opt_new();
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke;
  v24[3] = &unk_1E6BD07A0;
  v29 = v5 & 1;
  v25 = v8;
  v30 = (v5 & 4) != 0;
  v28 = v11;
  v14 = v12;
  v31 = (v5 & 2) != 0;
  v26 = v14;
  v27 = v9;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v7, "enumerateComplicationDisplayWrappersWithBlock:", v24);

  -[NTKFaceViewComplicationFactory contentSpecificAnimationDuration](self, "contentSpecificAnimationDuration");
  v18 = v17;
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_4;
  v22[3] = &unk_1E6BCE570;
  v23 = v14;
  v19 = v14;
  +[NTKFaceViewComplicationFactory _genericComplicationAnimationWithDuration:applier:](NTKFaceViewComplicationFactory, "_genericComplicationAnimationWithDuration:applier:", v22, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  _QWORD aBlock[4];
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;

  v5 = a3;
  v6 = objc_msgSend(a2, "isEqualToString:", CFSTR("date"));
  objc_msgSend(v5, "display");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v7, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alpha");
    v10 = v9;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2;
    aBlock[3] = &unk_1E6BD0750;
    v48 = *(_BYTE *)(a1 + 64);
    v43 = v7;
    v44 = v8;
    v45 = *(id *)(a1 + 32);
    v49 = *(_BYTE *)(a1 + 65);
    v11 = *(_QWORD *)(a1 + 56);
    v46 = v10;
    v47 = v11;
    v12 = v8;
    v13 = v7;
    v14 = _Block_copy(aBlock);
    v15 = *(void **)(a1 + 40);
    v16 = _Block_copy(v14);
    objc_msgSend(v15, "addObject:", v16);

    v17 = v43;
  }
  else
  {
    objc_msgSend(v7, "foregroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shadowColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alpha");
    v21 = v20;
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3;
    v31 = &unk_1E6BD0778;
    v39 = *(_BYTE *)(a1 + 64);
    v32 = v7;
    v33 = v18;
    v22 = *(id *)(a1 + 32);
    v40 = *(_BYTE *)(a1 + 66);
    v34 = v22;
    v35 = v19;
    v36 = *(id *)(a1 + 48);
    v41 = *(_BYTE *)(a1 + 65);
    v23 = *(_QWORD *)(a1 + 56);
    v37 = v21;
    v38 = v23;
    v17 = v19;
    v12 = v18;
    v24 = v7;
    v25 = _Block_copy(&v28);
    v26 = *(void **)(a1 + 40);
    v27 = _Block_copy(v25);
    objc_msgSend(v26, "addObject:", v27, v28, v29, v30, v31);

  }
}

void __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = *(void **)(a1 + 32);
    NTKInterpolateBetweenColors(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTextColor:", v3);

  }
  if (*(_BYTE *)(a1 + 73))
  {
    v4 = *(void **)(a1 + 32);
    CLKInterpolateBetweenFloatsUnclipped();
    objc_msgSend(v4, "setAlpha:");
  }
}

void __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (*(_BYTE *)(a1 + 88))
  {
    v2 = *(void **)(a1 + 32);
    NTKInterpolateBetweenColors(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setForegroundColor:", v3);

  }
  if (*(_BYTE *)(a1 + 89))
  {
    v4 = *(void **)(a1 + 32);
    NTKInterpolateBetweenColors(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShadowColor:", v5);

  }
  if (*(_BYTE *)(a1 + 90))
  {
    v6 = *(void **)(a1 + 32);
    CLKInterpolateBetweenFloatsUnclipped();
    objc_msgSend(v6, "setAlpha:");
  }
}

void __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_4(uint64_t a1, double a2)
{
  id v3;
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
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))(a2);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setForegroundColor:(id)a3 faceView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v6) & 1) == 0)
  {
    -[NTKFaceViewComplicationFactory setForegroundColor:](self, "setForegroundColor:", v6);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__NTKDigitialUtilitarianFaceViewComplicationFactory_setForegroundColor_faceView___block_invoke;
    v9[3] = &unk_1E6BCF090;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v10, "enumerateComplicationDisplayWrappersWithBlock:", v9);

  }
}

void __81__NTKDigitialUtilitarianFaceViewComplicationFactory_setForegroundColor_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "display");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configureComplicationView:forSlot:attributes:faceView:", v7, v6, 1, *(_QWORD *)(a1 + 40));

}

- (void)setShadowColor:(id)a3 faceView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  -[NTKDigitialUtilitarianFaceViewComplicationFactory shadowColor](self, "shadowColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v6) & 1) == 0)
  {
    -[NTKDigitialUtilitarianFaceViewComplicationFactory setShadowColor:](self, "setShadowColor:", v6);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__NTKDigitialUtilitarianFaceViewComplicationFactory_setShadowColor_faceView___block_invoke;
    v9[3] = &unk_1E6BCF090;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v10, "enumerateComplicationDisplayWrappersWithBlock:", v9);

  }
}

void __77__NTKDigitialUtilitarianFaceViewComplicationFactory_setShadowColor_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "display");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configureComplicationView:forSlot:attributes:faceView:", v7, v6, 2, *(_QWORD *)(a1 + 40));

}

- (void)setUsesLegibility:(BOOL)a3 faceView:(id)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v6 = a4;
  if (-[NTKDigitialUtilitarianFaceViewComplicationFactory usesLegibility](self, "usesLegibility") != v4)
  {
    -[NTKDigitialUtilitarianFaceViewComplicationFactory setUsesLegibility:](self, "setUsesLegibility:", v4);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__NTKDigitialUtilitarianFaceViewComplicationFactory_setUsesLegibility_faceView___block_invoke;
    v7[3] = &unk_1E6BCF090;
    v7[4] = self;
    v8 = v6;
    objc_msgSend(v8, "enumerateComplicationDisplayWrappersWithBlock:", v7);

  }
}

void __80__NTKDigitialUtilitarianFaceViewComplicationFactory_setUsesLegibility_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "display");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configureComplicationView:forSlot:attributes:faceView:", v7, v6, 16, *(_QWORD *)(a1 + 40));

}

- (void)setAlpha:(double)a3 faceView:(id)a4
{
  id v6;
  double v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  -[NTKFaceViewComplicationFactory alpha](self, "alpha");
  if (v7 != a3)
  {
    -[NTKFaceViewComplicationFactory setAlpha:](self, "setAlpha:", a3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__NTKDigitialUtilitarianFaceViewComplicationFactory_setAlpha_faceView___block_invoke;
    v8[3] = &unk_1E6BCF090;
    v8[4] = self;
    v9 = v6;
    objc_msgSend(v9, "enumerateComplicationDisplayWrappersWithBlock:", v8);

  }
}

void __71__NTKDigitialUtilitarianFaceViewComplicationFactory_setAlpha_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "display");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configureComplicationView:forSlot:attributes:faceView:", v7, v6, 4, *(_QWORD *)(a1 + 40));

}

- (NSArray)supportedComplicationSlots
{
  return self->_supportedComplicationSlots;
}

- (void)setSupportedComplicationSlots:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->_usesLegibility = a3;
}

- (id)shadowColorProviderBlock
{
  return self->_shadowColorProviderBlock;
}

- (void)setShadowColorProviderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)timeTravelYAdjustmentProviderBlock
{
  return self->_timeTravelYAdjustmentProviderBlock;
}

- (void)setTimeTravelYAdjustmentProviderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeTravelYAdjustmentProviderBlock, 0);
  objc_storeStrong(&self->_shadowColorProviderBlock, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_supportedComplicationSlots, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
}

@end
