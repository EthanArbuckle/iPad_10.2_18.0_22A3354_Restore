@implementation NTKColorCircularFaceViewComplicationFactory

- (id)initForDevice:(id)a3
{
  id v3;
  NTKFaceColorPalette *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKColorCircularFaceViewComplicationFactory;
  v3 = -[NTKFaceViewComplicationFactory initForDevice:](&v11, sel_initForDevice_, a3);
  if (v3)
  {
    v4 = -[NTKFaceColorPalette initWithDomainName:inBundle:]([NTKFaceColorPalette alloc], "initWithDomainName:inBundle:", 0, 0);
    +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", CFSTR("seasons.spring2015.white"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPalette setPigmentEditOption:](v4, "setPigmentEditOption:", v5);

    objc_msgSend(v3, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:units:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:units:", v6, v4, 51);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "shiftedForegroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setForegroundColor:", v8);

    objc_msgSend(v7, "shiftedBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPlatterColor:", v9);

  }
  return v3;
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__NTKColorCircularFaceViewComplicationFactory_loadLayoutRulesForFaceView___block_invoke;
  v10[3] = &unk_1E6BCE4B8;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v15 = v8;
  v9 = v4;
  NTKEnumerateComplicationStates(v10);

}

void __74__NTKColorCircularFaceViewComplicationFactory_loadLayoutRulesForFaceView___block_invoke(uint64_t a1, uint64_t a2)
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
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  id v28;

  objc_msgSend(*(id *)(a1 + 32), "_colorCircularKeylinePaddingForState:", a2);
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "_colorCircularEdgeGapForState:", a2);
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
  objc_msgSend(*(id *)(a1 + 32), "_colorCircularLisaGapForState:", a2);
  v17 = v15 - v16;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v18, 3, 3, v17, v7, v9, v11, v5, v5, v5, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "complicationLayoutforSlot:", CFSTR("top-right"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDefaultLayoutRule:forState:", v19, a2);

  v21 = *(double *)(a1 + 72) - v11 - v7;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v22, 3, 3, v7, v21, v9, v11, v5, v5, v5, v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "complicationLayoutforSlot:", CFSTR("bottom-left"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDefaultLayoutRule:forState:", v23, a2);

  v25 = *(double *)(a1 + 64) - v9 - v7;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v26, 3, 3, v25, v21, v9, v11, v5, v5, v5, v5);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "complicationLayoutforSlot:", CFSTR("bottom-right"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDefaultLayoutRule:forState:", v28, a2);

}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a6;
  v10 = a5;
  +[NTKCircularComplicationView viewForComplicationType:](NTKCircularComplicationView, "viewForComplicationType:", objc_msgSend(a3, "complicationType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKColorCircularFaceViewComplicationFactory configureComplicationView:forSlot:faceView:](self, "configureComplicationView:forSlot:faceView:", v11, v10, v9);

  return v11;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[NTKFaceViewComplicationFactory foregroundColor](self, "foregroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForegroundColor:", v7);

  -[NTKFaceViewComplicationFactory platterColor](self, "platterColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlatterColor:", v8);

}

- (double)_colorCircularEdgeGapForState:(int64_t)a3
{
  double v3;
  void *v4;
  double v5;

  v3 = 0.0;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      -[NTKFaceViewComplicationFactory device](self, "device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = NTKColorFaceViewEdgeGapEditing(v4);
    }
    else
    {
      -[NTKFaceViewComplicationFactory device](self, "device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = NTKColorFaceViewEdgeGapNormal(v4);
    }
    v3 = v5;

  }
  return v3;
}

- (double)_colorCircularKeylinePaddingForState:(int64_t)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;

  if (a3 == 3)
  {
    v5 = NTKKeylineWidth();
    -[NTKFaceViewComplicationFactory device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = NTKColorFaceViewSelectedKeylineInnerPadding(v6);
    goto LABEL_5;
  }
  v4 = 0.0;
  if (a3 == 2)
  {
    v5 = NTKKeylineWidth();
    -[NTKFaceViewComplicationFactory device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = NTKColorFaceViewDeselectedKeylineInnerPadding(v6);
LABEL_5:
    v4 = v5 + v7;

  }
  return v4;
}

- (double)_colorCircularLisaGapForState:(int64_t)a3
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

@end
