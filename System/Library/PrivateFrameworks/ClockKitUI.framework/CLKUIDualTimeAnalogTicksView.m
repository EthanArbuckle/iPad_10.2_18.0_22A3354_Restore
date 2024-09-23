@implementation CLKUIDualTimeAnalogTicksView

- (CLKUIDualTimeAnalogTicksView)initWithConfiguration:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  CGSize var2;
  _OWORD v10[4];
  uint64_t v11;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = *(_OWORD *)&a3->var4;
  v10[2] = a3->var3;
  v10[3] = v7;
  v11 = *(_QWORD *)&a3->var6;
  var2 = a3->var2;
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = var2;
  return -[CLKUIDualTimeAnalogTicksView initWithFrame:configuration:](self, "initWithFrame:configuration:", v10, v3, v4, v5, v6);
}

- (CLKUIDualTimeAnalogTicksView)initWithFrame:(CGRect)a3 configuration:(id *)a4
{
  CLKUIDualTimeAnalogTicksView *v5;
  CLKUIDualTimeAnalogTicksView *v6;
  __int128 v7;
  CGSize var3;
  CGSize var2;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CAReplicatorLayer *minuteTickReplicatorLayer;
  uint64_t v15;
  CALayer *minuteTickLayer;
  uint64_t v17;
  CAReplicatorLayer *hourTickReplicatorLayer;
  uint64_t v19;
  CALayer *hourTickLayer;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[2];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CLKUIDualTimeAnalogTicksView;
  v5 = -[CLKUIDualTimeAnalogTicksView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)&v5->_configuration.minuteTickCount = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v7 = *(_OWORD *)&a4->var4;
    var2 = a4->var2;
    *(_QWORD *)&v5->_configuration.allowBackgroundColorAction = *(_QWORD *)&a4->var6;
    v5->_configuration.hourTickSize = var3;
    *(_OWORD *)&v5->_configuration.minuteTickInset = v7;
    v5->_configuration.minuteTickSize = var2;
    if (a4->var6)
    {
      v25 = CFSTR("position");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23[0] = CFSTR("backgroundColor");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = CFSTR("position");
      v24[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (a4->var0)
    {
      -[CLKUIDualTimeAnalogTicksView _createReplicatorLayerWithTickCount:](v6, "_createReplicatorLayerWithTickCount:");
      v13 = objc_claimAutoreleasedReturnValue();
      minuteTickReplicatorLayer = v6->_minuteTickReplicatorLayer;
      v6->_minuteTickReplicatorLayer = (CAReplicatorLayer *)v13;

      -[CLKUIDualTimeAnalogTicksView _createTickLayerWithSize:actions:](v6, "_createTickLayerWithSize:actions:", v11, a4->var2.width, a4->var2.height);
      v15 = objc_claimAutoreleasedReturnValue();
      minuteTickLayer = v6->_minuteTickLayer;
      v6->_minuteTickLayer = (CALayer *)v15;

      -[CAReplicatorLayer addSublayer:](v6->_minuteTickReplicatorLayer, "addSublayer:", v6->_minuteTickLayer);
    }
    if (a4->var1)
    {
      -[CLKUIDualTimeAnalogTicksView _createReplicatorLayerWithTickCount:](v6, "_createReplicatorLayerWithTickCount:");
      v17 = objc_claimAutoreleasedReturnValue();
      hourTickReplicatorLayer = v6->_hourTickReplicatorLayer;
      v6->_hourTickReplicatorLayer = (CAReplicatorLayer *)v17;

      -[CLKUIDualTimeAnalogTicksView _createTickLayerWithSize:actions:](v6, "_createTickLayerWithSize:actions:", v11, a4->var3.width, a4->var3.height);
      v19 = objc_claimAutoreleasedReturnValue();
      hourTickLayer = v6->_hourTickLayer;
      v6->_hourTickLayer = (CALayer *)v19;

      -[CAReplicatorLayer addSublayer:](v6->_hourTickReplicatorLayer, "addSublayer:", v6->_hourTickLayer);
    }

  }
  return v6;
}

- (void)layoutSubviews
{
  uint64_t v3;
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
  CAReplicatorLayer *minuteTickReplicatorLayer;
  CAReplicatorLayer *hourTickReplicatorLayer;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLKUIDualTimeAnalogTicksView;
  -[CLKUIDualTimeAnalogTicksView layoutSubviews](&v18, sel_layoutSubviews);
  v3 = -[CLKUIDualTimeAnalogTicksView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = MEMORY[0x1D17A167C](v3);
  v14 = v12;
  v15 = v13;
  minuteTickReplicatorLayer = self->_minuteTickReplicatorLayer;
  if (minuteTickReplicatorLayer)
  {
    -[CAReplicatorLayer setPosition:](minuteTickReplicatorLayer, "setPosition:", v12, v13);
    -[CAReplicatorLayer setBounds:](self->_minuteTickReplicatorLayer, "setBounds:", v5, v7, v9, v11);
    -[CALayer setPosition:](self->_minuteTickLayer, "setPosition:", v14, self->_configuration.minuteTickSize.height * 0.5 + self->_configuration.minuteTickInset * 0.5);
  }
  hourTickReplicatorLayer = self->_hourTickReplicatorLayer;
  if (hourTickReplicatorLayer)
  {
    -[CAReplicatorLayer setPosition:](hourTickReplicatorLayer, "setPosition:", v14, v15);
    -[CAReplicatorLayer setBounds:](self->_hourTickReplicatorLayer, "setBounds:", v5, v7, v9, v11);
    -[CALayer setPosition:](self->_hourTickLayer, "setPosition:", v14, self->_configuration.hourTickSize.height * 0.5 + self->_configuration.hourTickInset * 0.5);
  }
}

- (id)_createReplicatorLayerWithTickCount:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CATransform3D v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2828], "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v5, "setInstanceCount:", a3);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setInstanceColor:", objc_msgSend(v6, "CGColor"));

  CATransform3DMakeRotation(&v12, 6.28318531 / (double)a3, 0.0, 0.0, 1.0);
  objc_msgSend(v5, "setInstanceTransform:", &v12);
  v13[0] = CFSTR("position");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("bounds");
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActions:", v9);

  -[CLKUIDualTimeAnalogTicksView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSublayer:", v5);

  return v5;
}

- (id)_createTickLayerWithSize:(CGSize)a3 actions:(id)a4
{
  double height;
  double width;
  void *v6;
  id v7;
  void *v8;
  id v9;

  height = a3.height;
  width = a3.width;
  v6 = (void *)MEMORY[0x1E0CD27A8];
  v7 = a4;
  objc_msgSend(v6, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(v8, "setBounds:", 0.0, 0.0, width, height);
  objc_msgSend(v8, "setCornerRadius:", width * 0.5);
  objc_msgSend(v8, "setActions:", v7);

  return v8;
}

- (void)setHourTickColor:(id)a3 minuteTickColor:(id)a4
{
  CALayer *hourTickLayer;
  id v7;
  id v8;
  CALayer *minuteTickLayer;
  id v10;
  uint64_t v11;

  hourTickLayer = self->_hourTickLayer;
  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  -[CALayer setBackgroundColor:](hourTickLayer, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));
  minuteTickLayer = self->_minuteTickLayer;
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "CGColor");

  -[CALayer setBackgroundColor:](minuteTickLayer, "setBackgroundColor:", v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourTickLayer, 0);
  objc_storeStrong((id *)&self->_minuteTickLayer, 0);
  objc_storeStrong((id *)&self->_hourTickReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_minuteTickReplicatorLayer, 0);
}

@end
