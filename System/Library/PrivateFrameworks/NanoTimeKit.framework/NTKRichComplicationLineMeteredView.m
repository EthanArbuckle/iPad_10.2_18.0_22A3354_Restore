@implementation NTKRichComplicationLineMeteredView

- (void)_setupShapeLayer:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;

  v4 = (void *)MEMORY[0x1E0C944B0];
  v5 = a3;
  objc_msgSend(v4, "currentDevice");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_9);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_9);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_9);
  if (v9 != v6)
  {

LABEL_5:
    v12 = objc_storeWeak(&_LayoutConstants___cachedDevice_9, v6);
    _LayoutConstants___previousCLKDeviceVersion_9 = objc_msgSend(v6, "version");

    ___LayoutConstants_block_invoke_8(v13, v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _LayoutConstants___previousCLKDeviceVersion_9;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_9);

  CDGenerateMeterLayersOnLayer();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationLineMeteredView setMeterLayers:](self, "setMeterLayers:", v14);
  -[CDRichComplicationShapeView progress](self, "progress");
  -[NTKRichComplicationLineMeteredView colorMetersWithProgress:](self, "colorMetersWithProgress:");

}

void __55__NTKRichComplicationLineMeteredView__setupShapeLayer___block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, int a5)
{
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;
  double v12;
  double v13;
  id v14;

  v7 = *(double *)(a1 + 40);
  v8 = *(double *)(a1 + 48);
  if (a5)
    v8 = v8 + *(double *)(a1 + 56);
  v9 = (void *)MEMORY[0x1E0DC3508];
  v10 = *(double *)(a1 + 64);
  v11 = a2;
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v7, v8, v10);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setPath:", objc_msgSend(v14, "CGPath"));
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v7, v8);
  *(float *)&v12 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_pointAtProgress:", v12);
  objc_msgSend(v11, "setPosition:", v7 * 0.5 + v13);

}

- (id)_shapeStrokeColor
{
  return 0;
}

- (void)setProgress:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationLineMeteredView;
  -[CDRichComplicationShapeView setProgress:](&v5, sel_setProgress_);
  -[NTKRichComplicationLineMeteredView colorMetersWithProgress:](self, "colorMetersWithProgress:", a3);
}

- (void)_updateGradient
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationLineMeteredView;
  -[CDRichComplicationShapeView _updateGradient](&v3, sel__updateGradient);
  -[CDRichComplicationShapeView progress](self, "progress");
  -[NTKRichComplicationLineMeteredView colorMetersWithProgress:](self, "colorMetersWithProgress:");
}

- (void)colorMetersWithProgress:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NTKRichComplicationLineMeteredView meterLayers](self, "meterLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NTKRichComplicationLineMeteredView meterLayers](self, "meterLayers");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationShapeView gradientColors](self, "gradientColors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CDColorizeMeterProgress();

  }
}

- (CGPoint)_pointAtProgress:(float)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[NTKRichComplicationLineMeteredView bounds](self, "bounds");
  v5 = v4 * a3;
  v7 = v6 * 0.5;
  result.y = v7;
  result.x = v5;
  return result;
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
