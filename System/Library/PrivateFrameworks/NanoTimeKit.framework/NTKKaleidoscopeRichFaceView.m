@implementation NTKKaleidoscopeRichFaceView

- (id)_newComplicationFactoryForDevice:(id)a3
{
  id v4;
  NTKColorCircularUtilitarianFaceViewComplicationFactory *v5;

  v4 = a3;
  v5 = -[NTKColorCircularUtilitarianFaceViewComplicationFactory initWithFaceView:device:graphicCornerComplications:]([NTKColorCircularUtilitarianFaceViewComplicationFactory alloc], "initWithFaceView:device:graphicCornerComplications:", self, v4, 1);

  -[NTKColorCircularUtilitarianFaceViewComplicationFactory setFaceView:](v5, "setFaceView:", self);
  return v5;
}

- (void)_updateComplicationColors
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKKaleidoscopeRichFaceView;
  -[NTKKaleidoscopeFaceView _updateComplicationColors](&v4, sel__updateComplicationColors);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__NTKKaleidoscopeRichFaceView__updateComplicationColors__block_invoke;
  v3[3] = &unk_1E6BD8C68;
  v3[4] = self;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v3);
}

void __56__NTKKaleidoscopeRichFaceView__updateComplicationColors__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "display");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = v7;
    objc_msgSend(v4, "complicationColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setComplicationColor:", v6);
    objc_msgSend(*(id *)(a1 + 32), "setInterpolatedComplicationColor:", v6);
    objc_msgSend(v5, "updateMonochromeColor");

  }
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
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
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  v4 = a4;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("top-left")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("top-right")))
  {
    -[NTKFaceView complicationFactory](self, "complicationFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keylineFrameForCornerComplicationSlot:selected:", v6, v4);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)NTKKaleidoscopeRichFaceView;
    -[NTKFaceView _keylineFrameForComplicationSlot:selected:](&v24, sel__keylineFrameForComplicationSlot_selected_, v6, v4);
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v15 = v19;
  }

  v20 = v9;
  v21 = v11;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

@end
