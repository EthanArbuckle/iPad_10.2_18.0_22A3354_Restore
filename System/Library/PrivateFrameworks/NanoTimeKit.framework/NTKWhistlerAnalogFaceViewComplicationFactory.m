@implementation NTKWhistlerAnalogFaceViewComplicationFactory

- (NTKWhistlerAnalogFaceViewComplicationFactory)initWithFaceView:(id)a3 dialDiameter:(double)a4 device:(id)a5
{
  id v8;
  id *v9;
  NTKWhistlerAnalogFaceViewComplicationFactory *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKWhistlerAnalogFaceViewComplicationFactory;
  v9 = -[NTKFaceViewComplicationFactory initForDevice:](&v13, sel_initForDevice_, a5);
  v10 = (NTKWhistlerAnalogFaceViewComplicationFactory *)v9;
  if (v9)
  {
    objc_storeWeak(v9 + 10, v8);
    v10->_dialDiameter = a4;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceViewComplicationFactory setForegroundColor:](v10, "setForegroundColor:", v11);

  }
  return v10;
}

- (id)initForDevice:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKWhistlerAnalogFaceViewComplicationFactory;
  v3 = -[NTKFaceViewComplicationFactory initForDevice:](&v6, sel_initForDevice_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setForegroundColor:", v4);

  }
  return v3;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NTKWhistlerAnalogFaceViewComplicationFactory faceView](self, "faceView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKWhistlerAnalogFaceViewComplicationFactory configureComplicationView:forSlot:faceView:](self, "configureComplicationView:forSlot:faceView:", v7, v6, v8);

}

- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a4;
  -[NTKWhistlerAnalogFaceViewComplicationFactory faceView](self, "faceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTKFaceViewComplicationFactory legacyLayoutOverrideforComplicationType:slot:faceView:](self, "legacyLayoutOverrideforComplicationType:slot:faceView:", a3, v6, v7);

  return v8;
}

- (void)loadLayoutRules
{
  id v3;

  -[NTKWhistlerAnalogFaceViewComplicationFactory faceView](self, "faceView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKWhistlerAnalogFaceViewComplicationFactory dialDiameter](self, "dialDiameter");
  -[NTKWhistlerAnalogFaceViewComplicationFactory loadLayoutRulesForFaceView:dialDiameter:](self, "loadLayoutRulesForFaceView:dialDiameter:", v3);

}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  -[NTKWhistlerAnalogFaceViewComplicationFactory faceView](self, "faceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NTKWhistlerAnalogFaceViewComplicationFactory newLegacyViewForComplication:family:slot:faceView:](self, "newLegacyViewForComplication:family:slot:faceView:", v9, a4, v8, v10);

  return v11;
}

- (CGPoint)circularComplicationCenterForSlot:(id)a3 inFaceBounds:(CGRect)a4
{
  double height;
  double width;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  v7 = a3;
  -[NTKFaceViewComplicationFactory device](self, "device");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_6);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_6);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_6);
    if (v11 == v8)
    {
      v12 = objc_msgSend(v8, "version");
      v13 = _LayoutConstants___previousCLKDeviceVersion_6;

      if (v12 == v13)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v14 = objc_storeWeak(&_LayoutConstants___cachedDevice_6, v8);
  _LayoutConstants___previousCLKDeviceVersion_6 = objc_msgSend(v8, "version");

  _LayoutConstants__constants_0 = NTKWhistlerSubdialComplicationDistanceFromCenter(v8);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_6);
  v15 = *(double *)&_LayoutConstants__constants_0;

  v16 = width * 0.5;
  v17 = height * 0.5;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("slot1")))
  {
    v16 = v16 - v15;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("slot2")))
  {
    v16 = v16 + v15;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("slot3")))
  {
    v17 = v17 + v15;
  }
  else
  {
    v18 = objc_msgSend(v7, "isEqualToString:", CFSTR("bezel"));
    v19 = 0.0;
    if (v18)
      v19 = v15;
    v17 = v17 - v19;
  }

  v20 = v16;
  v21 = v17;
  result.y = v21;
  result.x = v20;
  return result;
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  __objc2_class *v6;
  void *v7;

  v4 = a3;
  if (-[NTKWhistlerAnalogFaceViewComplicationFactory _isCornerComplicationForSlot:](self, "_isCornerComplicationForSlot:", v4))
  {
    -[NTKWhistlerAnalogFaceViewComplicationFactory _cornerKeylineViewForSlot:](self, "_cornerKeylineViewForSlot:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("bezel")))
    {
      v6 = NTKRichComplicationBezelView;
    }
    else
    {
      if (!-[NTKWhistlerAnalogFaceViewComplicationFactory _isCenterComplicationForSlot:](self, "_isCenterComplicationForSlot:", v4))
      {
        v5 = 0;
        goto LABEL_9;
      }
      v6 = NTKRichComplicationCircularBaseView;
    }
    -[NTKFaceViewComplicationFactory device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class keylineViewForDevice:](v6, "keylineViewForDevice:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v5;
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("bezel")) & 1) != 0
    || -[NTKWhistlerAnalogFaceViewComplicationFactory _isCornerComplicationForSlot:](self, "_isCornerComplicationForSlot:", v4))
  {
    v5 = 3;
  }
  else if (-[NTKWhistlerAnalogFaceViewComplicationFactory _isCenterComplicationForSlot:](self, "_isCenterComplicationForSlot:", v4))
  {
    v5 = 3;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4;

  v4 = a3;
  -[NTKWhistlerAnalogFaceViewComplicationFactory dialDiameter](self, "dialDiameter");
  -[NTKWhistlerAnalogFaceViewComplicationFactory loadLayoutRulesForFaceView:dialDiameter:](self, "loadLayoutRulesForFaceView:dialDiameter:", v4);

}

- (void)loadLayoutRulesForFaceView:(id)a3 dialDiameter:(double)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  NTKWhistlerAnalogFaceViewComplicationFactory *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;

  v6 = a3;
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[NTKFaceViewComplicationFactory device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__NTKWhistlerAnalogFaceViewComplicationFactory_loadLayoutRulesForFaceView_dialDiameter___block_invoke;
  v18[3] = &unk_1E6BCF068;
  v22 = v8;
  v23 = v10;
  v24 = v12;
  v25 = v14;
  v19 = v6;
  v20 = v15;
  v21 = self;
  v26 = a4;
  v16 = v15;
  v17 = v6;
  NTKEnumerateComplicationStates(v18);

}

void __88__NTKWhistlerAnalogFaceViewComplicationFactory_loadLayoutRulesForFaceView_dialDiameter___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("top-left"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 0, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "usesNarrowTopSlots"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultLayoutRule:forState:", v5, a2);
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("top-right"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 1, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "usesNarrowTopSlots"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDefaultLayoutRule:forState:", v7, a2);
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("bottom-left"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 2, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "usesNarrowTopSlots"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDefaultLayoutRule:forState:", v9, a2);
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("bottom-right"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 3, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "usesNarrowTopSlots"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDefaultLayoutRule:forState:", v11, a2);
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("slot1"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "circularComplicationCenterForSlot:inFaceBounds:", CFSTR("slot1"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v14 = v13;
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 48), "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:forDevice:", a2, 0, v17, v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDefaultLayoutRule:forState:", v18, a2);
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("slot2"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "circularComplicationCenterForSlot:inFaceBounds:", CFSTR("slot2"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v21 = v20;
  v23 = v22;
  objc_msgSend(*(id *)(a1 + 48), "device");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:forDevice:", a2, 1, v24, v21, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setDefaultLayoutRule:forState:", v25, a2);
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("slot3"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "circularComplicationCenterForSlot:inFaceBounds:", CFSTR("slot3"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v28 = v27;
  v30 = v29;
  objc_msgSend(*(id *)(a1 + 48), "device");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:forDevice:", a2, 2, v31, v28, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setDefaultLayoutRule:forState:", v32, a2);
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("bezel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKRichComplicationBezelView layoutRuleForState:faceBounds:dialDiameter:forDevice:](NTKRichComplicationBezelView, "layoutRuleForState:faceBounds:dialDiameter:forDevice:", a2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v34 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setDefaultLayoutRule:forState:", v34, a2);
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v10;
  id v11;
  id v12;
  __objc2_class *v13;
  uint64_t v14;
  void *v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[NTKWhistlerAnalogFaceViewComplicationFactory _isCenterComplicationForSlot:](self, "_isCenterComplicationForSlot:", v11))
  {
    v13 = NTKRichComplicationCircularBaseView;
LABEL_9:
    -[__objc2_class viewWithLegacyComplicationType:](v13, "viewWithLegacyComplicationType:", objc_msgSend(v10, "complicationType"));
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!-[NTKWhistlerAnalogFaceViewComplicationFactory _isCornerComplicationForSlot:](self, "_isCornerComplicationForSlot:", v11))
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("bezel")))
    {
      v15 = 0;
      goto LABEL_11;
    }
    v13 = NTKRichComplicationBezelView;
    goto LABEL_9;
  }
  if (a4 != 4)
  {
    v13 = NTKRichComplicationCornerUtilities;
    goto LABEL_9;
  }
  +[NTKCircularComplicationView viewForComplicationType:](NTKCircularComplicationView, "viewForComplicationType:", objc_msgSend(v10, "complicationType"));
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v15 = (void *)v14;
LABEL_11:
  objc_msgSend(v12, "_configureComplicationView:forSlot:", v15, v11);

  return v15;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F8E2C218))
  {
    v9 = v7;
    v10 = 0;
    if (-[NTKWhistlerAnalogFaceViewComplicationFactory _convertCornerSlot:toPosition:](self, "_convertCornerSlot:toPosition:", v8, &v10))
    {
      objc_msgSend(v9, "setCornerComplicationPosition:", v10);
    }
LABEL_7:
    -[NTKFaceViewComplicationFactory alpha](self, "alpha");
    objc_msgSend(v9, "setAlpha:");

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v10 = 0;
    if (-[NTKWhistlerAnalogFaceViewComplicationFactory _convertCircularSlot:toPosition:](self, "_convertCircularSlot:toPosition:", v8, &v10))
    {
      objc_msgSend(v9, "setPosition:", v10);
    }
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)_isCenterComplicationForSlot:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("slot1")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("slot2")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqual:", CFSTR("slot3"));
  }

  return v4;
}

- (BOOL)_isCornerComplicationForSlot:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("top-left")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("top-right")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("bottom-left")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqual:", CFSTR("bottom-right"));
  }

  return v4;
}

- (id)_cornerKeylineViewForSlot:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  v4 = 0;
  if (-[NTKWhistlerAnalogFaceViewComplicationFactory _convertCornerSlot:toPosition:](self, "_convertCornerSlot:toPosition:", a3, &v8))
  {
    v5 = v8;
    -[NTKFaceViewComplicationFactory device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKRichComplicationCornerUtilities keylineViewForPosition:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "keylineViewForPosition:forDevice:narrowTopSlots:", v5, v6, -[NTKWhistlerAnalogFaceViewComplicationFactory usesNarrowTopSlots](self, "usesNarrowTopSlots"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (CGRect)keylineFrameForCornerComplicationSlot:(id)a3 selected:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v58;
  double v59;
  double v60;
  double v61;
  CGAffineTransform v62;
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v63 = 0;
  if (-[NTKWhistlerAnalogFaceViewComplicationFactory _convertCornerSlot:toPosition:](self, "_convertCornerSlot:toPosition:", v6, &v63))
  {
    -[NTKWhistlerAnalogFaceViewComplicationFactory faceView](self, "faceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (v4)
        v9 = 3;
      else
        v9 = 2;
      v10 = v63;
      objc_msgSend(v7, "bounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[NTKFaceViewComplicationFactory device](self, "device");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", v9, v10, v19, -[NTKWhistlerAnalogFaceViewComplicationFactory usesNarrowTopSlots](self, "usesNarrowTopSlots"), v12, v14, v16, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "referenceFrame");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend(v20, "keylinePadding");
      v32 = v22 - v31;
      v34 = v24 - v33;
      v35 = v26 - (-v30 - v31);
      v36 = v28 - (-v29 - v33);
      objc_msgSend(v8, "_complicationContainerViewForSlot:", v6);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "convertRect:fromCoordinateSpace:", v37, v32, v34, v35, v36);
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;

      objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "screenBounds");
      v48 = v47;

      objc_msgSend(v8, "faceViewFrameForEditMode:option:slot:", 1, 0, v6);
      v50 = v49;
      v52 = v51;
      CGAffineTransformMakeScale(&v62, v53 / v48, v53 / v48);
      v64.origin.x = v39;
      v64.origin.y = v41;
      v64.size.width = v43;
      v64.size.height = v45;
      v65 = CGRectApplyAffineTransform(v64, &v62);
      v66 = CGRectOffset(v65, v50, v52);
      x = v66.origin.x;
      y = v66.origin.y;
      width = v66.size.width;
      height = v66.size.height;

    }
    else
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }

  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v58 = x;
  v59 = y;
  v60 = width;
  v61 = height;
  result.size.height = v61;
  result.size.width = v60;
  result.origin.y = v59;
  result.origin.x = v58;
  return result;
}

- (BOOL)_convertCornerSlot:(id)a3 toPosition:(int64_t *)a4
{
  id v5;
  int64_t v6;
  BOOL v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("top-left")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("top-right")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("bottom-left")) & 1) != 0)
  {
    v6 = 2;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("bottom-right")))
    {
      v7 = 0;
      goto LABEL_10;
    }
    v6 = 3;
  }
  *a4 = v6;
  v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)_convertCircularSlot:(id)a3 toPosition:(int64_t *)a4
{
  id v5;
  int64_t v6;
  BOOL v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("slot1")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("slot2")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("slot3")))
    {
      v7 = 0;
      goto LABEL_8;
    }
    v6 = 2;
  }
  *a4 = v6;
  v7 = 1;
LABEL_8:

  return v7;
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
    v8[2] = __66__NTKWhistlerAnalogFaceViewComplicationFactory_setAlpha_faceView___block_invoke;
    v8[3] = &unk_1E6BCF090;
    v8[4] = self;
    v9 = v6;
    objc_msgSend(v9, "enumerateComplicationDisplayWrappersWithBlock:", v8);

  }
}

void __66__NTKWhistlerAnalogFaceViewComplicationFactory_setAlpha_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "display");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureComplicationView:forSlot:faceView:", v7, v6, *(_QWORD *)(a1 + 40));

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

- (BOOL)usesNarrowTopSlots
{
  return self->_usesNarrowTopSlots;
}

- (void)setUsesNarrowTopSlots:(BOOL)a3
{
  self->_usesNarrowTopSlots = a3;
}

- (NTKFaceView)faceView
{
  return (NTKFaceView *)objc_loadWeakRetained((id *)&self->_faceView);
}

- (void)setFaceView:(id)a3
{
  objc_storeWeak((id *)&self->_faceView, a3);
}

- (double)dialDiameter
{
  return self->_dialDiameter;
}

- (void)setDialDiameter:(double)a3
{
  self->_dialDiameter = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_faceView);
}

@end
