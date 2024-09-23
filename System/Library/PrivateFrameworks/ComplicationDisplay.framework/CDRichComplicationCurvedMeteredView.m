@implementation CDRichComplicationCurvedMeteredView

- (id)customizeMeterLayerBlock
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD aBlock[9];

  objc_msgSend(MEMORY[0x24BDB8730], "currentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_LayoutConstants___cachedDevice_2, v3);
    _LayoutConstants___previousCLKDeviceVersion_2 = objc_msgSend(v3, "version");

    ___LayoutConstants_block_invoke_2(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _LayoutConstants___previousCLKDeviceVersion_2;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  v11 = _LayoutConstants___constants_0_1;
  v12 = _LayoutConstants___constants_1_1;
  v13 = _LayoutConstants___constants_2;
  v14 = _LayoutConstants___constants_3;

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CDRichComplicationCurvedMeteredView_customizeMeterLayerBlock__block_invoke;
  aBlock[3] = &unk_24CF21398;
  aBlock[4] = self;
  aBlock[5] = v11;
  aBlock[6] = v12;
  aBlock[7] = v13;
  aBlock[8] = v14;
  v15 = _Block_copy(aBlock);
  v16 = _Block_copy(v15);

  return v16;
}

void __63__CDRichComplicationCurvedMeteredView_customizeMeterLayerBlock__block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, int a5)
{
  void *v7;
  float v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  __int128 v19;
  CGFloat v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  v9 = a2;
  *(float *)&v10 = v8;
  objc_msgSend(v7, "pointAtProgress:", v10);
  v13 = v11;
  v14 = v12;
  v15 = *(double *)(a1 + 40);
  v16 = *(double *)(a1 + 48);
  if (a5)
    v16 = v16 + *(double *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", v11, v12, *(double *)(a1 + 40), v16, *(double *)(a1 + 64));
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "setPath:", objc_msgSend(v17, "CGPath"));
  objc_msgSend(v9, "setBounds:", v13, v14, v15, v16);
  objc_msgSend(v9, "setPosition:", v13, v14);
  *(float *)&v18 = v8;
  objc_msgSend(*(id *)(a1 + 32), "rotationAngleAtProgress:", v18);
  v19 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v22.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v22.c = v19;
  *(_OWORD *)&v22.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformRotate(&v23, &v22, v20);
  v21 = v23;
  objc_msgSend(v9, "setAffineTransform:", &v21);

}

- (void)_setupShapeLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CDRichComplicationCurvedMeteredView customizeMeterLayerBlock](self, "customizeMeterLayerBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CDGenerateMeterLayersOnLayer(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRichComplicationCurvedMeteredView setMeterLayers:](self, "setMeterLayers:", v6);
  -[CDRichComplicationShapeView progress](self, "progress");
  -[CDRichComplicationCurvedMeteredView colorMetersWithProgress:](self, "colorMetersWithProgress:");
}

- (id)_shapeStrokeColor
{
  return 0;
}

- (void)setProgress:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCurvedMeteredView;
  -[CDRichComplicationShapeView setProgress:](&v5, sel_setProgress_);
  -[CDRichComplicationCurvedMeteredView colorMetersWithProgress:](self, "colorMetersWithProgress:", a3);
}

- (void)_updateGradient
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRichComplicationCurvedMeteredView;
  -[CDRichComplicationShapeView _updateGradient](&v3, sel__updateGradient);
  -[CDRichComplicationShapeView progress](self, "progress");
  -[CDRichComplicationCurvedMeteredView colorMetersWithProgress:](self, "colorMetersWithProgress:");
}

- (void)colorMetersWithProgress:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CDRichComplicationCurvedMeteredView meterLayers](self, "meterLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CDRichComplicationCurvedMeteredView meterLayers](self, "meterLayers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationShapeView gradientColors](self, "gradientColors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CDColorizeMeterProgress(v7, v6, 0, a3);

  }
}

- (double)rotationAngleAtProgress:(float)a3
{
  double v3;

  -[CDRichComplicationCurveView _angleAtProgress:](self, "_angleAtProgress:");
  return v3 + 1.57079633;
}

- (NSArray)meterLayers
{
  return self->_meterLayers;
}

- (void)setMeterLayers:(id)a3
{
  objc_storeStrong((id *)&self->_meterLayers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meterLayers, 0);
}

@end
