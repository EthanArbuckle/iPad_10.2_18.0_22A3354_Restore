@implementation NTKColorCircularUtilitarianFaceViewComplicationFactory

- (NTKColorCircularUtilitarianFaceViewComplicationFactory)initWithFaceView:(id)a3 device:(id)a4 graphicCornerComplications:(BOOL)a5
{
  id v8;
  id v9;
  id *v10;
  NTKColorCircularUtilitarianFaceViewComplicationFactory *v11;
  NTKWhistlerAnalogFaceViewComplicationFactory *v12;
  NTKWhistlerAnalogFaceViewComplicationFactory *cornerComplicationFactory;

  v8 = a3;
  v9 = a4;
  v10 = -[NTKColorCircularUtilitarianFaceViewComplicationFactory initForDevice:](self, "initForDevice:", v9);
  v11 = (NTKColorCircularUtilitarianFaceViewComplicationFactory *)v10;
  if (v10)
  {
    objc_storeWeak(v10 + 14, v8);
    v11->_graphicCornerComplications = a5;
    v12 = -[NTKWhistlerAnalogFaceViewComplicationFactory initWithFaceView:dialDiameter:device:]([NTKWhistlerAnalogFaceViewComplicationFactory alloc], "initWithFaceView:dialDiameter:device:", v8, v9, 50.0);
    cornerComplicationFactory = v11->_cornerComplicationFactory;
    v11->_cornerComplicationFactory = v12;

    -[NTKWhistlerAnalogFaceViewComplicationFactory setUsesNarrowTopSlots:](v11->_cornerComplicationFactory, "setUsesNarrowTopSlots:", 1);
  }

  return v11;
}

- (id)initForDevice:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKColorCircularUtilitarianFaceViewComplicationFactory;
  v5 = -[NTKFaceViewComplicationFactory initForDevice:](&v16, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = -[NTKUtilityComplicationFactory initForDevice:]([NTKUtilityComplicationFactory alloc], "initForDevice:", v4);
    v7 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v6;

    objc_msgSend(*((id *)v5 + 9), "setDelegate:", v5);
    objc_msgSend(*((id *)v5 + 9), "setForegroundAlpha:", 1.0);
    objc_msgSend(*((id *)v5 + 9), "setForegroundImageAlpha:", 1.0);
    objc_msgSend(*((id *)v5 + 9), "setBottomCenterLayout:", 3);
    objc_msgSend(v5, "setContentSpecificAnimationDuration:", 0.45);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setForegroundColor:", v8);

    NTKActivityBackgroundPlatterColor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlatterColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v10;

    NTKActivityBackgroundPlatterColor();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v12;

    v14 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = 0;

    objc_storeWeak((id *)v5 + 14, 0);
    *((_BYTE *)v5 + 104) = 0;
  }

  return v5;
}

- (void)loadLayoutRules
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  -[NTKColorCircularUtilitarianFaceViewComplicationFactory loadLayoutRulesForFaceView:](self, "loadLayoutRulesForFaceView:", WeakRetained);

}

- (void)loadLayoutRulesForFaceView:(id)a3
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[NTKColorCircularUtilitarianFaceViewComplicationFactory _utilityComplicationSlots](self, "_utilityComplicationSlots");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v4, "complicationLayoutforSlot:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v19, -[NTKColorCircularUtilitarianFaceViewComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v18), v6, v8, v10, v12);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  if (self->_graphicCornerComplications)
  {
    -[NTKWhistlerAnalogFaceViewComplicationFactory loadLayoutRules](self->_cornerComplicationFactory, "loadLayoutRules");
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__NTKColorCircularUtilitarianFaceViewComplicationFactory_loadLayoutRulesForFaceView___block_invoke;
    v20[3] = &unk_1E6BCE4B8;
    v20[4] = self;
    v21 = v4;
    v22 = v6;
    v23 = v8;
    v24 = v10;
    v25 = v12;
    NTKEnumerateComplicationStates(v20);

  }
}

void __85__NTKColorCircularUtilitarianFaceViewComplicationFactory_loadLayoutRulesForFaceView___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "_keylinePaddingForState:", a2);
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "_edgeGapForState:", a2);
  v7 = v5 + v6;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = NTKCircularSmallComplicationDiameter();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = NTKCircularSmallComplicationDiameter();

  objc_msgSend(*(id *)(a1 + 32), "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v12, 3, 3, v7, v7, v9, v11, v5, v5, v5, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "complicationLayoutforSlot:", CFSTR("top-left"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDefaultLayoutRule:forState:", v13, a2);

  v15 = *(double *)(a1 + 64) - v9 - v7;
  objc_msgSend(*(id *)(a1 + 32), "_lisaGapForState:", a2);
  v17 = v15 - v16;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v18, 3, 3, v17, v7, v9, v11, v5, v5, v5, v5);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "complicationLayoutforSlot:", CFSTR("top-right"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDefaultLayoutRule:forState:", v20, a2);

}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  NTKFaceView **p_faceView;
  id v9;
  id v10;
  id WeakRetained;
  id v12;

  p_faceView = &self->_faceView;
  v9 = a5;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_faceView);
  v12 = -[NTKColorCircularUtilitarianFaceViewComplicationFactory newLegacyViewForComplication:family:slot:faceView:](self, "newLegacyViewForComplication:family:slot:faceView:", v10, a4, v9, WeakRetained);

  return v12;
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "isEqual:", CFSTR("bottom-center")))
  {
    v13 = -[NTKUtilityComplicationFactory newViewForComplication:family:forSlot:](self->_complicationFactory, "newViewForComplication:family:forSlot:", v10, a4, -[NTKColorCircularUtilitarianFaceViewComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v11));
    objc_msgSend(v12, "_configureComplicationView:forSlot:", v13, v11);
  }
  else if (self->_graphicCornerComplications)
  {
    v13 = -[NTKWhistlerAnalogFaceViewComplicationFactory newLegacyViewForComplication:family:slot:faceView:](self->_cornerComplicationFactory, "newLegacyViewForComplication:family:slot:faceView:", v10, a4, v11, v12);
  }
  else
  {
    +[NTKCircularComplicationView viewForComplicationType:](NTKCircularComplicationView, "viewForComplicationType:", objc_msgSend(v10, "complicationType"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setForegroundColor:", v14);

    -[NTKFaceViewComplicationFactory platterColor](self, "platterColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlatterColor:", v15);

  }
  return v13;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  NTKFaceView **p_faceView;
  id v7;
  id v8;
  id WeakRetained;

  p_faceView = &self->_faceView;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_faceView);
  -[NTKColorCircularUtilitarianFaceViewComplicationFactory configureComplicationView:forSlot:faceView:](self, "configureComplicationView:forSlot:faceView:", v8, v7, WeakRetained);

}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL8 v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceViewComplicationFactory platterColor](self, "platterColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_previousForegroundColor, v10);
  objc_storeStrong((id *)&self->_previousPlatterColor, v11);
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("top-left")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("top-right")))
  {
    if (self->_graphicCornerComplications)
      -[NTKWhistlerAnalogFaceViewComplicationFactory configureComplicationView:forSlot:faceView:](self->_cornerComplicationFactory, "configureComplicationView:forSlot:faceView:", v18, v8, v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v18;
      objc_msgSend(v9, "setComplicationColor:", v10);
      objc_msgSend(v9, "setInterpolatedComplicationColor:", v10);
      objc_msgSend(v12, "transitionToMonochromeWithFraction:", 1.0);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v18;
      objc_msgSend(v13, "setForegroundColor:", v10);
      objc_msgSend(v13, "setPlatterColor:", v11);
      objc_msgSend(v13, "setUseRoundedFontDesign:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v14);

    }
  }
  if (objc_msgSend(v8, "isEqual:", CFSTR("bottom-center")))
  {
    v15 = v18;
    -[NTKColorCircularUtilitarianFaceViewComplicationFactory delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "textLayoutStyleForSlot:", v8) == 0;

    objc_msgSend(v15, "setShouldUseBackgroundPlatter:", v17);
    -[NTKUtilityComplicationFactory foregroundAlphaForEditing:](self->_complicationFactory, "foregroundAlphaForEditing:", objc_msgSend(v9, "editing"));
    objc_msgSend(v15, "setForegroundAlpha:");
    objc_msgSend(v15, "setForegroundColor:", v10);
    -[NTKUtilityComplicationFactory foregroundImageAlphaForEditing:](self->_complicationFactory, "foregroundImageAlphaForEditing:", objc_msgSend(v9, "editing"));
    objc_msgSend(v15, "setForegroundImageAlpha:");
    objc_msgSend(v15, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKColorCircularUtilitarianFaceViewComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v8)));
    if (self->_graphicCornerComplications)
    {
      objc_msgSend(v15, "setUseRoundedFontDesign:", 1);
      objc_msgSend(v15, "setFontWeight:", *MEMORY[0x1E0DC1438]);
    }

  }
}

- (CGRect)keylineFrameForCornerComplicationSlot:(id)a3 selected:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[NTKWhistlerAnalogFaceViewComplicationFactory keylineFrameForCornerComplicationSlot:selected:](self->_cornerComplicationFactory, "keylineFrameForCornerComplicationSlot:selected:", a3, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (self->_graphicCornerComplications
    && ((objc_msgSend(v4, "isEqualToString:", CFSTR("top-left")) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", CFSTR("top-right"))))
  {
    -[NTKWhistlerAnalogFaceViewComplicationFactory keylineViewForComplicationSlot:](self->_cornerComplicationFactory, "keylineViewForComplicationSlot:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKUtilityComplicationFactory keylineViewForSlot:](self->_complicationFactory, "keylineViewForSlot:", -[NTKColorCircularUtilitarianFaceViewComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v5));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("bottom-center")))
    return 10;
  else
    return 0;
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  if (a3 == 10)
    return CFSTR("bottom-center");
  else
    return 0;
}

- (int64_t)keylineStyleForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int64_t v7;

  v4 = a3;
  -[NTKFaceViewComplicationFactory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "deviceCategory") == 1)
  {

LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("top-left")) & 1) != 0)
  {

  }
  else
  {
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("top-right"));

    if ((v6 & 1) == 0)
      goto LABEL_7;
  }
  v7 = 1;
LABEL_8:

  return v7;
}

- (double)_edgeGapForState:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      -[NTKFaceViewComplicationFactory device](self, "device");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = NTKColorFaceViewEdgeGapEditing(v3);
    }
    else
    {
      -[NTKFaceViewComplicationFactory device](self, "device");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = NTKColorFaceViewEdgeGapNormal(v3);
    }
  }
  else
  {
    -[NTKFaceViewComplicationFactory device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = NTKColorFaceViewEdgeGapDeselected(v3);
  }
  v5 = v4;

  return v5;
}

- (double)_keylinePaddingForState:(int64_t)a3
{
  double v3;
  double v5;
  void *v6;

  v3 = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v5 = NTKKeylineWidth();
    -[NTKFaceViewComplicationFactory device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 + NTKColorFaceViewDeselectedKeylineInnerPadding(v6);

  }
  return v3;
}

- (double)_lisaGapForState:(int64_t)a3
{
  void *v3;
  double v4;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
    return 0.0;
  -[NTKFaceViewComplicationFactory device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKColorFaceViewLisaKeylineGap(v3);

  return v4;
}

- (id)_utilityComplicationSlots
{
  if (_utilityComplicationSlots_onceToken != -1)
    dispatch_once(&_utilityComplicationSlots_onceToken, &__block_literal_global_8);
  return (id)_utilityComplicationSlots_slots;
}

void __83__NTKColorCircularUtilitarianFaceViewComplicationFactory__utilityComplicationSlots__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("bottom-center");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_utilityComplicationSlots_slots;
  _utilityComplicationSlots_slots = v0;

}

- (id)_colorComplicationSlots
{
  if (_colorComplicationSlots_onceToken != -1)
    dispatch_once(&_colorComplicationSlots_onceToken, &__block_literal_global_8_0);
  return (id)_colorComplicationSlots_slots;
}

void __81__NTKColorCircularUtilitarianFaceViewComplicationFactory__colorComplicationSlots__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("top-left");
  v2[1] = CFSTR("top-right");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_colorComplicationSlots_slots;
  _colorComplicationSlots_slots = v0;

}

- (id)_complicationSlots
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__NTKColorCircularUtilitarianFaceViewComplicationFactory__complicationSlots__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  if (_complicationSlots_onceToken != -1)
    dispatch_once(&_complicationSlots_onceToken, block);
  return (id)_complicationSlots_slots;
}

void __76__NTKColorCircularUtilitarianFaceViewComplicationFactory__complicationSlots__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_utilityComplicationSlots");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_colorComplicationSlots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_complicationSlots_slots;
  _complicationSlots_slots = v3;

}

- (void)prepareForEditingForFaceView:(id)a3
{
  -[NTKColorCircularUtilitarianFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:faceView:](self, "applyComplicationContentSpecificAttributesAnimated:faceView:", 1, a3);
}

- (void)cleanupAfterEditingForFaceView:(id)a3
{
  -[NTKColorCircularUtilitarianFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:faceView:](self, "applyComplicationContentSpecificAttributesAnimated:faceView:", 1, a3);
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
    -[NTKFaceViewComplicationFactory platterColorProviderBlock](self, "platterColorProviderBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = v7 | 8;
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
  unsigned int v6;
  id v8;
  id v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  NTKColorCircularUtilitarianFaceViewComplicationFactory *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  char v33;
  char v34;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if ((v6 & 9) != 0)
  {
    v10 = (v6 >> 3) & 1;
    v11 = v6 & 1;
    -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceViewComplicationFactory platterColor](self, "platterColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v15 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke;
    v26[3] = &unk_1E6BCE548;
    v27 = v9;
    v28 = self;
    v29 = v12;
    v30 = v13;
    v31 = v8;
    v33 = v11;
    v34 = v10;
    v16 = v14;
    v32 = v16;
    v17 = v13;
    v18 = v12;
    objc_msgSend(v31, "enumerateComplicationDisplayWrappersWithBlock:", v26);
    -[NTKFaceViewComplicationFactory contentSpecificAnimationDuration](self, "contentSpecificAnimationDuration");
    v20 = v19;
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3;
    v24[3] = &unk_1E6BCE570;
    v25 = v16;
    v21 = v16;
    +[NTKFaceViewComplicationFactory _genericComplicationAnimationWithDuration:applier:](NTKFaceViewComplicationFactory, "_genericComplicationAnimationWithDuration:applier:", v24, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  __int16 v28;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (!v7 || objc_msgSend(v7, "containsObject:", v5))
  {
    v8 = *(id *)(*(_QWORD *)(a1 + 40) + 88);
    v9 = *(id *)(*(_QWORD *)(a1 + 40) + 96);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2;
    v20 = &unk_1E6BCE520;
    v21 = v8;
    v22 = *(id *)(a1 + 48);
    v23 = v9;
    v10 = *(id *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 40);
    v24 = v10;
    v25 = v11;
    v26 = *(id *)(a1 + 64);
    v27 = v5;
    v28 = *(_WORD *)(a1 + 80);
    v12 = v9;
    v13 = v8;
    v14 = _Block_copy(&v17);
    v15 = *(void **)(a1 + 72);
    v16 = _Block_copy(v14);
    objc_msgSend(v15, "addObject:", v16, v17, v18, v19, v20);

  }
}

void __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id obj;

  NTKInterpolateBetweenColors(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  obj = (id)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 64) + 88), obj);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 64) + 96), v2);
  objc_msgSend(*(id *)(a1 + 72), "normalComplicationDisplayWrapperForSlot:", *(_QWORD *)(a1 + 80));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "display");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (*(_BYTE *)(a1 + 88))
      objc_msgSend(v5, "setForegroundColor:", obj);
    if (*(_BYTE *)(a1 + 89))
      objc_msgSend(v6, "setPlatterColor:", v2);

  }
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F8E9F268) && *(_BYTE *)(a1 + 88))
    objc_msgSend(v4, "setForegroundColor:", obj);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && *(_BYTE *)(a1 + 88))
  {
    v7 = *(void **)(a1 + 72);
    v8 = v4;
    objc_msgSend(v7, "setComplicationColor:", obj);
    objc_msgSend(*(id *)(a1 + 72), "setInterpolatedComplicationColor:", obj);
    objc_msgSend(v8, "transitionToMonochromeWithFraction:", 1.0);

  }
}

void __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3(uint64_t a1, double a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
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
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    v7 = a2;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(float))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))(v7);
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3
{
  return 0;
}

- (unint64_t)textLayoutStyleForSlot:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;

  -[NTKColorCircularUtilitarianFaceViewComplicationFactory delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKColorCircularUtilitarianFaceViewComplicationFactory _slotForUtilitySlot:](self, "_slotForUtilitySlot:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "textLayoutStyleForSlot:", v6);

  return v7;
}

- (void)curvedCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  int64_t v14;
  id v15;

  v14 = -[NTKColorCircularUtilitarianFaceViewComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", a8);
  -[NTKFaceViewComplicationFactory device](self, "device");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  +[NTKUtilityComplicationFactory curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:](NTKUtilityComplicationFactory, "curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:", a3, a4, a5, a6, a7, v14, v15);

}

- (id)curvedMaskForSlot:(id)a3
{
  return -[NTKUtilityComplicationFactory curvedMaskForSlot:](self->_complicationFactory, "curvedMaskForSlot:", -[NTKColorCircularUtilitarianFaceViewComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", a3));
}

- (NTKFaceView)faceView
{
  return (NTKFaceView *)objc_loadWeakRetained((id *)&self->_faceView);
}

- (void)setFaceView:(id)a3
{
  objc_storeWeak((id *)&self->_faceView, a3);
}

- (NTKColorCircularUtilitarianFaceViewComplicationFactoryDelegate)delegate
{
  return (NTKColorCircularUtilitarianFaceViewComplicationFactoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)graphicCornerComplications
{
  return self->_graphicCornerComplications;
}

- (void)setGraphicCornerComplications:(BOOL)a3
{
  self->_graphicCornerComplications = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_faceView);
  objc_storeStrong((id *)&self->_previousPlatterColor, 0);
  objc_storeStrong((id *)&self->_previousForegroundColor, 0);
  objc_storeStrong((id *)&self->_cornerComplicationFactory, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
}

@end
