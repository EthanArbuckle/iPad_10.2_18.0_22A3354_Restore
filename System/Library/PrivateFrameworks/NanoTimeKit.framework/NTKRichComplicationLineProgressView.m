@implementation NTKRichComplicationLineProgressView

- (id)initForFamily:(int64_t)a3 device:(id)a4 progressFillStyle:(int64_t)a5
{
  id v8;
  id v9;
  void (**v10)(void *, uint64_t);
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  objc_super v17;
  _QWORD aBlock[4];
  id v19;

  v8 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__NTKRichComplicationLineProgressView_initForFamily_device_progressFillStyle___block_invoke;
  aBlock[3] = &unk_1E6BD5930;
  v9 = v8;
  v19 = v9;
  v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if ((unint64_t)a5 > 1)
    v11 = 0;
  else
    v11 = objc_opt_class();
  v10[2](v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)NTKRichComplicationLineProgressView;
  v14 = -[CDRichComplicationProgressView initForFamily:device:backgroundShapeView:foregroundShapeView:](&v17, sel_initForFamily_device_backgroundShapeView_foregroundShapeView_, a3, v9, v12, v13);
  v15 = v14;
  if (v14)
    v14[66] = a5;

  return v15;
}

id __78__NTKRichComplicationLineProgressView_initForFamily_device_progressFillStyle___block_invoke(uint64_t a1, Class a2)
{
  return (id)objc_msgSend([a2 alloc], "initForDevice:withFilterStyle:", *(_QWORD *)(a1 + 32), 0);
}

- (void)setProgress:(double)a3
{
  void *v5;
  objc_super v6;

  -[NTKRichComplicationLineProgressView progressFillStyle](self, "progressFillStyle");
  if (CDRichComplicationProgressFillStyleIsMetered())
  {
    -[CDRichComplicationProgressView backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProgress:", 1.0);

  }
  v6.receiver = self;
  v6.super_class = (Class)NTKRichComplicationLineProgressView;
  -[CDRichComplicationProgressView setProgress:](&v6, sel_setProgress_, a3);
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[NTKRichComplicationLineProgressView progressFillStyle](self, "progressFillStyle");
  if (CDRichComplicationProgressFillStyleIsMetered() && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "count");
    CDGenerateMeterBackgroundGradientColors();
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKRichComplicationLineProgressView;
    -[CDRichComplicationProgressView overrideBackgroundGradientColorsForGradientColors:](&v8, sel_overrideBackgroundGradientColorsForGradientColors_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3 locations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[NTKRichComplicationLineProgressView progressFillStyle](self, "progressFillStyle");
  if (CDRichComplicationProgressFillStyleIsMetered() && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "count");
    CDGenerateMeterBackgroundGradientColors();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)NTKRichComplicationLineProgressView;
    -[CDRichComplicationProgressView overrideBackgroundGradientColorsForGradientColors:locations:](&v11, sel_overrideBackgroundGradientColorsForGradientColors_locations_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (int64_t)progressFillStyle
{
  return self->_progressFillStyle;
}

@end
