@implementation NTKFullscreenSubdialComplicationFactory

- (id)initForDevice:(id)a3
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NTKFullscreenSubdialComplicationFactory;
  v3 = -[NTKFaceViewComplicationFactory initForDevice:](&v17, sel_initForDevice_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = v3 + 10;
    objc_msgSend(v3, "device");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_34);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_34);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v9 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_34);
      if (v9 == v6)
      {
        v10 = objc_msgSend(v6, "version");
        v11 = _LayoutConstants___previousCLKDeviceVersion_34;

        if (v10 == v11)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_34);
          v14 = _LayoutConstants__constants_0_1;
          v15 = _LayoutConstants__constants_1;

          *v5 = v14;
          v4[11] = v15;

          return v4;
        }
      }
      else
      {

      }
    }
    v12 = objc_storeWeak(&_LayoutConstants___cachedDevice_34, v6);
    _LayoutConstants___previousCLKDeviceVersion_34 = objc_msgSend(v6, "version");

    ___LayoutConstants_block_invoke_31(v13, v6);
    goto LABEL_7;
  }
  return v4;
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "isEqualToString:", CFSTR("subdial-top"));
  -[NTKFaceViewComplicationFactory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKRichComplicationCircularBaseView keylineViewForDevice:wide:expanded:](NTKRichComplicationCircularBaseView, "keylineViewForDevice:wide:expanded:", v5, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  NTKFullscreenSubdialComplicationFactory *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[NTKFaceViewComplicationFactory device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__NTKFullscreenSubdialComplicationFactory_loadLayoutRulesForFaceView___block_invoke;
  v16[3] = &unk_1E6BD3F58;
  v17 = v4;
  v18 = self;
  v20 = v6;
  v21 = v8;
  v22 = v10;
  v23 = v12;
  v19 = v13;
  v14 = v13;
  v15 = v4;
  NTKEnumerateComplicationStates(v16);

}

void __70__NTKFullscreenSubdialComplicationFactory_loadLayoutRulesForFaceView___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("subdial-left"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_circularComplicationCenterForSlot:inFaceBounds:", CFSTR("subdial-left"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:", a2, 0, 1, 0, *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultLayoutRule:forState:", v5, a2);
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("subdial-right"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_circularComplicationCenterForSlot:inFaceBounds:", CFSTR("subdial-right"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:", a2, 1, 1, 0, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDefaultLayoutRule:forState:", v7, a2);
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("subdial-bottom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_circularComplicationCenterForSlot:inFaceBounds:", CFSTR("subdial-bottom"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:", a2, 2, 1, 0, *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDefaultLayoutRule:forState:", v9, a2);
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("subdial-top"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_circularComplicationCenterForSlot:inFaceBounds:", CFSTR("subdial-top"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:", a2, 3, 1, 1, *(_QWORD *)(a1 + 48));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDefaultLayoutRule:forState:", v11, a2);
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v8;
  id v9;
  void *v10;

  v8 = a6;
  v9 = a5;
  +[NTKRichComplicationCircularBaseView viewWithLegacyComplicationType:](NTKRichComplicationCircularBaseView, "viewWithLegacyComplicationType:", objc_msgSend(a3, "complicationType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_configureComplicationView:forSlot:", v10, v9);

  return v10;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v10 = 0;
    if (-[NTKFullscreenSubdialComplicationFactory _convertCircularSlot:toPosition:](self, "_convertCircularSlot:toPosition:", v8, &v10))
    {
      objc_msgSend(v9, "setPosition:", v10);
    }
    -[NTKFaceViewComplicationFactory alpha](self, "alpha");
    objc_msgSend(v9, "setAlpha:");

  }
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
    v8[2] = __61__NTKFullscreenSubdialComplicationFactory_setAlpha_faceView___block_invoke;
    v8[3] = &unk_1E6BCF090;
    v8[4] = self;
    v9 = v6;
    objc_msgSend(v9, "enumerateComplicationDisplayWrappersWithBlock:", v8);

  }
}

void __61__NTKFullscreenSubdialComplicationFactory_setAlpha_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  return 3;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NTKFullscreenSubdialComplicationFactory faceView](self, "faceView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFullscreenSubdialComplicationFactory configureComplicationView:forSlot:faceView:](self, "configureComplicationView:forSlot:faceView:", v7, v6, v8);

}

- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a4;
  -[NTKFullscreenSubdialComplicationFactory faceView](self, "faceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTKFaceViewComplicationFactory legacyLayoutOverrideforComplicationType:slot:faceView:](self, "legacyLayoutOverrideforComplicationType:slot:faceView:", a3, v6, v7);

  return v8;
}

- (void)loadLayoutRules
{
  id v3;

  -[NTKFullscreenSubdialComplicationFactory faceView](self, "faceView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFullscreenSubdialComplicationFactory loadLayoutRulesForFaceView:](self, "loadLayoutRulesForFaceView:", v3);

}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  -[NTKFullscreenSubdialComplicationFactory faceView](self, "faceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NTKFullscreenSubdialComplicationFactory newLegacyViewForComplication:family:slot:faceView:](self, "newLegacyViewForComplication:family:slot:faceView:", v9, a4, v8, v10);

  return v11;
}

- (CGPoint)_circularComplicationCenterForSlot:(id)a3 inFaceBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = MEMORY[0x1BCCA72B8](x, y, width, height);
  v12 = v11;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("subdial-top")))
  {
    v12 = v12 - self->_circularComplicationDistanceFromCenter.y;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("subdial-left")))
  {
    v10 = v10 - self->_circularComplicationDistanceFromCenter.x;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("subdial-right")))
  {
    v10 = v10 + self->_circularComplicationDistanceFromCenter.x;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("subdial-bottom")))
  {
    v12 = v12 + self->_circularComplicationDistanceFromCenter.y;
  }

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)_convertCircularSlot:(id)a3 toPosition:(int64_t *)a4
{
  id v5;
  int64_t v6;
  BOOL v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("subdial-left")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("subdial-right")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("subdial-bottom")) & 1) != 0)
  {
    v6 = 2;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("subdial-top")))
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

- (CGPoint)circularComplicationDistanceFromCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_circularComplicationDistanceFromCenter.x;
  y = self->_circularComplicationDistanceFromCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCircularComplicationDistanceFromCenter:(CGPoint)a3
{
  self->_circularComplicationDistanceFromCenter = a3;
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
