@implementation NTKDigitalModularFaceViewComplicationFactory

- (id)initForDevice:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKDigitalModularFaceViewComplicationFactory;
  v3 = -[NTKFaceViewComplicationFactory initForDevice:](&v6, sel_initForDevice_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setForegroundColor:", v4);

  }
  return v3;
}

- (id)digitalTimeLayoutRuleForEditMode:(int64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___NTKDigitalModularFaceViewComplicationFactory__timeLayoutRuleEditing;
  if (!a3)
    v3 = &OBJC_IVAR___NTKDigitalModularFaceViewComplicationFactory__timeLayoutRuleNormal;
  return *(id *)((char *)&self->super.super.isa + *v3);
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v4 = a3;
  -[NTKFaceViewComplicationFactory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = NTKDigitalModularFaceViewTopGap(v5);
  -[NTKFaceViewComplicationFactory device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalModularFaceViewComplicationFactory _loadLayoutRulesForState:withTopGap:largeModuleHeight:faceView:](self, "_loadLayoutRulesForState:withTopGap:largeModuleHeight:faceView:", 0, v4, v6, NTKDigitalModularFaceViewLargeModuleHeight(v7));

  -[NTKFaceViewComplicationFactory device](self, "device");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = NTKDigitalModularFaceViewTopGapEditing(v10);
  -[NTKFaceViewComplicationFactory device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalModularFaceViewComplicationFactory _loadLayoutRulesForState:withTopGap:largeModuleHeight:faceView:](self, "_loadLayoutRulesForState:withTopGap:largeModuleHeight:faceView:", 1, v4, v8, NTKDigitalModularFaceViewLargeModuleHeightEditing(v9));

}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;

  v8 = a6;
  v9 = a5;
  v10 = a3;
  v11 = objc_msgSend(v9, "isEqual:", CFSTR("center"));
  v12 = objc_msgSend(v10, "complicationType");

  if (v11)
    +[NTKComplicationModuleView largeModuleViewForComplicationType:](NTKComplicationModuleView, "largeModuleViewForComplicationType:", v12);
  else
    +[NTKComplicationModuleView smallModuleViewForComplicationType:](NTKComplicationModuleView, "smallModuleViewForComplicationType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_configureComplicationView:forSlot:", v13, v9);

  return v13;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[NTKFaceViewComplicationFactory device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentHeight:", NTKDigitalModularFaceViewSmallModuleHeight(v6));

  -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setForegroundColor:", v7);

  -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
    NTKSecondaryForegroundGrayColor();
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSecondaryForegroundColor:", v10);

  -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NTKColorByPremultiplyingAlpha(v11, 0.2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHighlightBackgroundColor:", v12);

  objc_msgSend(v13, "_enumerateForegroundColoringViewsWithBlock:", &__block_literal_global_52);
}

void __91__NTKDigitalModularFaceViewComplicationFactory_configureComplicationView_forSlot_faceView___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "setMulticolorAlpha:", 0.0);

}

- (void)_loadLayoutRulesForState:(int64_t)a3 withTopGap:(double)a4 largeModuleHeight:(double)a5 faceView:(id)a6
{
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  objc_class *v26;
  int *v27;
  uint64_t v28;
  void *v29;
  id v30;
  CGRect v31;

  v9 = *MEMORY[0x1E0DC49E8];
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v11 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v12 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v13 = a6;
  -[NTKFaceViewComplicationFactory device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = NTKDigitalModularFaceViewSideModuleWidth(v14);

  -[NTKFaceViewComplicationFactory device](self, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = NTKDigitalModularFaceViewSmallModuleHeight(v16);

  -[NTKFaceViewComplicationFactory device](self, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v18, 3, 3, 0.0, a4, v15, v17, v9, v10, v11, v12);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "complicationLayoutforSlot:", CFSTR("top-left"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setDefaultLayoutRule:forState:", v30, a3);
  -[NTKFaceViewComplicationFactory device](self, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = NTKDigitalModularFaceViewModuleGap(v20);

  v31.origin.x = 0.0;
  v31.origin.y = a4;
  v31.size.width = v15;
  v31.size.height = v17;
  v22 = v21 + CGRectGetMaxX(v31);
  -[NTKFaceViewComplicationFactory device](self, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v15 + v21 + NTKDigitalModularFaceViewCenterModuleWidth(v23);

  -[NTKFaceViewComplicationFactory device](self, "device");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:](NTKLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", v25, 3, 3, v22, a4, v24, v17);
  v26 = (objc_class *)objc_claimAutoreleasedReturnValue();

  v27 = &OBJC_IVAR___NTKDigitalModularFaceViewComplicationFactory__timeLayoutRuleEditing;
  if (!a3)
    v27 = &OBJC_IVAR___NTKDigitalModularFaceViewComplicationFactory__timeLayoutRuleNormal;
  v28 = *v27;
  v29 = *(Class *)((char *)&self->super.super.isa + v28);
  *(Class *)((char *)&self->super.super.isa + v28) = v26;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLayoutRuleEditing, 0);
  objc_storeStrong((id *)&self->_timeLayoutRuleNormal, 0);
}

@end
