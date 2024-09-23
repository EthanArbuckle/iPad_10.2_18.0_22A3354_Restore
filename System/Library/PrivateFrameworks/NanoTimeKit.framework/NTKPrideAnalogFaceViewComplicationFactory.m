@implementation NTKPrideAnalogFaceViewComplicationFactory

- (NTKPrideAnalogFaceViewComplicationFactory)initWithFaceView:(id)a3 device:(id)a4
{
  id v6;
  NTKPrideAnalogFaceViewComplicationFactory *v7;
  NTKPrideAnalogFaceViewComplicationFactory *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKPrideAnalogFaceViewComplicationFactory;
  v7 = -[NTKFaceViewComplicationFactory initForDevice:](&v12, sel_initForDevice_, a4);
  v8 = v7;
  if (v7)
  {
    -[NTKPrideAnalogFaceViewComplicationFactory setFaceView:](v7, "setFaceView:", v6);
    -[NTKFaceViewComplicationFactory setContentSpecificAnimationDuration:](v8, "setContentSpecificAnimationDuration:", 0.45);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceViewComplicationFactory setForegroundColor:](v8, "setForegroundColor:", v9);

    NTKActivityBackgroundPlatterColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceViewComplicationFactory setPlatterColor:](v8, "setPlatterColor:", v10);

  }
  return v8;
}

- (void)loadLayoutRules
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "face view is nil for NTKPrideAnalogFaceViewComplicationFactory", v1, 2u);
}

void __60__NTKPrideAnalogFaceViewComplicationFactory_loadLayoutRules__block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

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

  v12 = *(double *)(a1 + 72) - v11 - v7;
  v13 = *(double *)(a1 + 64) - v9 - v7;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v14, 3, 3, v7, v7, v9, v11, v5, v5, v5, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "complicationLayoutforSlot:", CFSTR("top-left"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDefaultLayoutRule:forState:", v15, a2);

  objc_msgSend(*(id *)(a1 + 32), "_lisaGapForState:", a2);
  v18 = v13 - v17;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v19, 3, 3, v18, v7, v9, v11, v5, v5, v5, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "complicationLayoutforSlot:", CFSTR("top-right"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDefaultLayoutRule:forState:", v20, a2);

  objc_msgSend(*(id *)(a1 + 32), "device");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v22, 3, 3, v7, v12, v9, v11, v5, v5, v5, v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "complicationLayoutforSlot:", CFSTR("bottom-left"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDefaultLayoutRule:forState:", v23, a2);

  objc_msgSend(*(id *)(a1 + 32), "device");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v25, 3, 3, v13, v12, v9, v11, v5, v5, v5, v5);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "complicationLayoutforSlot:", CFSTR("bottom-right"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDefaultLayoutRule:forState:", v27, a2);

}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  +[NTKCircularComplicationView viewForComplicationType:](NTKCircularComplicationView, "viewForComplicationType:", objc_msgSend(a3, "complicationType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForegroundColor:", v7);

  -[NTKFaceViewComplicationFactory platterColor](self, "platterColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlatterColor:", v8);

  return v6;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForegroundColor:", v6);

  -[NTKFaceViewComplicationFactory platterColor](self, "platterColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlatterColor:", v7);

  objc_msgSend(v5, "setUseRoundedFontDesign:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v8);

}

- (int64_t)keylineStyleForComplicationSlot:(id)a3
{
  void *v3;
  int64_t v4;

  -[NTKFaceViewComplicationFactory device](self, "device", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceCategory") != 1;

  return v4;
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

- (id)_complicationSlots
{
  if (_complicationSlots_onceToken_0 != -1)
    dispatch_once(&_complicationSlots_onceToken_0, &__block_literal_global_129);
  return (id)_complicationSlots_slots_0;
}

void __63__NTKPrideAnalogFaceViewComplicationFactory__complicationSlots__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("top-left");
  v2[1] = CFSTR("top-right");
  v2[2] = CFSTR("bottom-left");
  v2[3] = CFSTR("bottom-right");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_complicationSlots_slots_0;
  _complicationSlots_slots_0 = v0;

}

- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5
{
  return (unint64_t)a4 > 1;
}

- (void)prepareForEditingForFaceView:(id)a3
{
  -[NTKPrideAnalogFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:faceView:](self, "applyComplicationContentSpecificAttributesAnimated:faceView:", 1, a3);
}

- (void)cleanupAfterEditingForFaceView:(id)a3
{
  -[NTKPrideAnalogFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:faceView:](self, "applyComplicationContentSpecificAttributesAnimated:faceView:", 1, a3);
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
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  char v27;
  char v28;

  if ((a3 & 9) != 0)
  {
    v6 = (a3 >> 3) & 1;
    v7 = a3 & 1;
    v8 = a4;
    -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceViewComplicationFactory platterColor](self, "platterColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_new();
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke;
    v23[3] = &unk_1E6BD8108;
    v27 = v7;
    v28 = v6;
    v24 = v9;
    v25 = v10;
    v13 = v11;
    v26 = v13;
    v14 = v10;
    v15 = v9;
    objc_msgSend(v8, "enumerateComplicationDisplayWrappersWithBlock:", v23);

    -[NTKFaceViewComplicationFactory contentSpecificAnimationDuration](self, "contentSpecificAnimationDuration");
    v17 = v16;
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3;
    v21[3] = &unk_1E6BCE570;
    v22 = v13;
    v18 = v13;
    +[NTKFaceViewComplicationFactory _genericComplicationAnimationWithDuration:applier:](NTKFaceViewComplicationFactory, "_genericComplicationAnimationWithDuration:applier:", v21, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

void __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  char v24;

  objc_msgSend(a3, "display");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "foregroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "platterColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2;
  v17 = &unk_1E6BD80E0;
  v23 = *(_BYTE *)(a1 + 56);
  v18 = v4;
  v19 = v5;
  v7 = *(id *)(a1 + 32);
  v24 = *(_BYTE *)(a1 + 57);
  v20 = v7;
  v21 = v6;
  v22 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  v10 = v4;
  v11 = _Block_copy(&v14);
  v12 = *(void **)(a1 + 48);
  v13 = _Block_copy(v11);
  objc_msgSend(v12, "addObject:", v13, v14, v15, v16, v17);

}

void __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = *(void **)(a1 + 32);
    NTKInterpolateBetweenColors(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setForegroundColor:", v3);

  }
  if (*(_BYTE *)(a1 + 73))
  {
    v4 = *(void **)(a1 + 32);
    NTKInterpolateBetweenColors(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlatterColor:", v5);

  }
}

void __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3(uint64_t a1, double a2)
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

- (NTKFaceView)faceView
{
  return (NTKFaceView *)objc_loadWeakRetained((id *)&self->_faceView);
}

- (void)setFaceView:(id)a3
{
  objc_storeWeak((id *)&self->_faceView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_faceView);
}

@end
