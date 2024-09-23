@implementation NTKSimpleTextFaceViewComplicationFactory

- (NTKSimpleTextFaceViewComplicationFactory)init
{
  NTKSimpleTextFaceViewComplicationFactory *v2;
  void *v3;
  uint64_t v4;
  CLKDevice *device;
  CLKDevice *v6;
  id WeakRetained;
  void *v8;
  CLKDevice *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NTKSimpleTextFaceViewComplicationFactory;
  v2 = -[NTKSimpleTextFaceViewComplicationFactory init](&v16, sel_init);
  if (v2)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v4 = objc_claimAutoreleasedReturnValue();
    device = v2->_device;
    v2->_device = (CLKDevice *)v4;

    v6 = v2->_device;
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_19);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_19);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v9 = (CLKDevice *)objc_loadWeakRetained(&_LayoutConstants___cachedDevice_19);
      if (v9 == v6)
      {
        v10 = -[CLKDevice version](v6, "version");
        v11 = _LayoutConstants___previousCLKDeviceVersion_19;

        if (v10 == v11)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_19);
          v14 = _LayoutConstants__constants_0_0;

          *(_QWORD *)&v2->_verticalCenterOffset = v14;
          return v2;
        }
      }
      else
      {

      }
    }
    v12 = objc_storeWeak(&_LayoutConstants___cachedDevice_19, v6);
    _LayoutConstants___previousCLKDeviceVersion_19 = -[CLKDevice version](v6, "version");

    ___LayoutConstants_block_invoke_16(v13, (uint64_t)v6);
    goto LABEL_7;
  }
  return v2;
}

- (void)loadLayoutRules
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__NTKSimpleTextFaceViewComplicationFactory_loadLayoutRules__block_invoke;
  v2[3] = &unk_1E6BD1F38;
  v2[4] = self;
  NTKEnumerateComplicationStates(v2);
}

void __59__NTKSimpleTextFaceViewComplicationFactory_loadLayoutRules__block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "_referenceFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  +[NTKRichComplicationCircularBaseView keylineImageWithFilled:wide:expanded:forDevice:](NTKRichComplicationCircularBaseView, "keylineImageWithFilled:wide:expanded:forDevice:", 0, 1, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "size");
  v13 = (v12 - v9) * 0.5;
  objc_msgSend(v20, "size");
  v15 = (v14 - v11) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v16, 3, 3, 0, v5, v7, v9, v11, v15, v13, v15, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "faceView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "complicationLayoutforSlot:", CFSTR("subdial-top"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDefaultLayoutRule:forState:", v17, a2);

}

- (CGRect)_referenceFrame
{
  void *v3;
  void *v4;
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
  CGRect result;

  NTKWhistlerSubdialComplicationDiameter(self->_device);
  -[NTKSimpleTextFaceViewComplicationFactory device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenBounds");

  -[NTKSimpleTextFaceViewComplicationFactory faceView](self, "faceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[NTKSimpleTextFaceViewComplicationFactory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  NTKRichComplicationCircularBaseView *v5;

  v5 = -[NTKRichComplicationCircularBaseView initWithFamily:]([NTKRichComplicationCircularBaseView alloc], "initWithFamily:", 10);
  -[NTKRichComplicationCircularBaseView setHidden:](v5, "setHidden:", 1);
  return v5;
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKSimpleTextFaceViewComplicationFactory faceView](self, "faceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_defaultKeylineViewForComplicationSlot:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (NTKFaceView)faceView
{
  return (NTKFaceView *)objc_loadWeakRetained((id *)&self->_faceView);
}

- (void)setFaceView:(id)a3
{
  objc_storeWeak((id *)&self->_faceView, a3);
}

- (double)verticalCenterOffset
{
  return self->_verticalCenterOffset;
}

- (void)setVerticalCenterOffset:(double)a3
{
  self->_verticalCenterOffset = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_faceView);
}

@end
