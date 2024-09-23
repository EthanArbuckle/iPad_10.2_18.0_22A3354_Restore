@implementation NTKCircularAnalogDialView

- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  NTKCircularAnalogDialView *v10;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  _LayoutConstants_22(v9, &v15);
  v12 = 0;
  v13 = v15;
  v14 = v16;
  v10 = -[NTKCircularAnalogDialView initWithFrame:options:device:](self, "initWithFrame:options:device:", &v12, v9, x, y, width, height);

  return v10;
}

- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4 smallTicksMatchingMinutes:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  NTKCircularAnalogDialView *v12;
  _BOOL8 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  v11 = a4;
  _LayoutConstants_22(v11, &v17);
  v15 = v17;
  v16 = v18;
  v14 = v5;
  v12 = -[NTKCircularAnalogDialView initWithFrame:options:device:](self, "initWithFrame:options:device:", &v14, v11, x, y, width, height);

  return v12;
}

- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4 hideHourTicks:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  uint64_t v12;
  NTKCircularAnalogDialView *v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  v11 = a4;
  _LayoutConstants_22(v11, &v18);
  v16 = v18;
  v17 = v19;
  v12 = 256;
  if (!v5)
    v12 = 0;
  v15 = v12;
  v13 = -[NTKCircularAnalogDialView initWithFrame:options:device:](self, "initWithFrame:options:device:", &v15, v11, x, y, width, height);

  return v13;
}

- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 options:(id *)a4 device:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  char *v13;
  NTKCircularAnalogDialView *v14;
  _BYTE *v15;
  CGFloat v16;
  __int128 v17;
  NTKWhistlerAnalogColorPalette *v18;
  NTKWhistlerAnalogColorPalette *colorPalette;
  void *v20;
  void *v21;
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
  void *v32;
  uint64_t v33;
  CALayer *dialBackgroundLayer;
  uint64_t v35;
  CALayer *ticksLayer;
  NSArray *v37;
  unint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  NSArray *allHourTicks;
  NSArray *v44;
  NSArray *allSmallTicks;
  NSArray *v46;
  NSArray *smallMatchingHourTicks;
  id v49;
  NSArray *v50;
  NSArray *v51;
  objc_super v52;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v52.receiver = self;
  v52.super_class = (Class)NTKCircularAnalogDialView;
  v13 = -[NTKCircularAnalogDialView initWithFrame:](&v52, sel_initWithFrame_, x, y, width, height);
  v14 = (NTKCircularAnalogDialView *)v13;
  if (v13)
  {
    v15 = v13 + 488;
    v16 = a4->var3.height;
    v17 = *(_OWORD *)&a4->var2.height;
    *(_OWORD *)(v13 + 488) = *(_OWORD *)&a4->var0;
    *(_OWORD *)(v13 + 504) = v17;
    *((CGFloat *)v13 + 65) = v16;
    objc_storeStrong((id *)v13 + 52, a5);
    v49 = v12;
    v18 = -[NTKWhistlerAnalogColorPalette initWithDevice:]([NTKWhistlerAnalogColorPalette alloc], "initWithDevice:", v12);
    colorPalette = v14->_colorPalette;
    v14->_colorPalette = v18;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCircularAnalogDialView setBackgroundColor:](v14, "setBackgroundColor:", v20);

    -[NTKCircularAnalogDialView layer](v14, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = v26 * 0.5;
    v31 = v28 * 0.5;
    objc_msgSend((id)objc_opt_class(), "_disabledLayerActions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_new();
    dialBackgroundLayer = v14->_dialBackgroundLayer;
    v14->_dialBackgroundLayer = (CALayer *)v33;

    -[CALayer setPosition:](v14->_dialBackgroundLayer, "setPosition:", v30, v31);
    -[CALayer setBounds:](v14->_dialBackgroundLayer, "setBounds:", v23, v25, v27, v29);
    -[CALayer setActions:](v14->_dialBackgroundLayer, "setActions:", v32);
    -[CALayer setCornerRadius:](v14->_dialBackgroundLayer, "setCornerRadius:", v30);
    objc_msgSend(v21, "addSublayer:", v14->_dialBackgroundLayer);
    v35 = objc_opt_new();
    ticksLayer = v14->_ticksLayer;
    v14->_ticksLayer = (CALayer *)v35;

    -[CALayer setPosition:](v14->_ticksLayer, "setPosition:", v30, v31);
    -[CALayer setBounds:](v14->_ticksLayer, "setBounds:", v23, v25, v27, v29);
    -[CALayer setActions:](v14->_ticksLayer, "setActions:", v32);
    objc_msgSend(v21, "addSublayer:", v14->_ticksLayer);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v50 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = 60;
    if (!*v15)
      v39 = 120;
    v14->_numberOfTicks = v39;
    do
    {
      v40 = -[NTKCircularAnalogDialView isTickIndexForHour:](v14, "isTickIndexForHour:", v38);
      v41 = (void *)objc_opt_new();
      objc_msgSend(v41, "setBounds:", 0.0, 0.0, v14->_options.smallTickSize.width, v14->_options.smallTickSize.height);
      objc_msgSend(v41, "setCornerRadius:", v14->_options.smallTickSize.width * 0.5);
      objc_msgSend(v41, "setPosition:", v30, v14->_options.smallTickSize.height * 0.5);
      objc_msgSend(v41, "setActions:", v32);
      -[CALayer addSublayer:](v14->_ticksLayer, "addSublayer:", v41);
      -[NSArray addObject:](v37, "addObject:", v41);
      if (v40)
      {
        objc_msgSend(v41, "setHidden:", !a4->var1);
        -[NSArray addObject:](v51, "addObject:", v41);
        if (!a4->var1)
        {
          v42 = (void *)objc_opt_new();
          objc_msgSend(v42, "setBounds:", 0.0, 0.0, v14->_options.hourTickSize.width, v14->_options.hourTickSize.height);
          objc_msgSend(v42, "setCornerRadius:", v14->_options.hourTickSize.width * 0.5);
          objc_msgSend(v42, "setPosition:", v30, v14->_options.hourTickSize.height * 0.5);
          objc_msgSend(v42, "setActions:", v32);
          -[CALayer addSublayer:](v14->_ticksLayer, "addSublayer:", v42);
          -[NSArray addObject:](v50, "addObject:", v42);
          objc_msgSend(v42, "setHidden:", a4->var1);

        }
      }

      ++v38;
    }
    while (v14->_numberOfTicks > v38);
    allHourTicks = v14->_allHourTicks;
    v14->_allHourTicks = v50;
    v44 = v50;

    allSmallTicks = v14->_allSmallTicks;
    v14->_allSmallTicks = v37;
    v46 = v37;

    smallMatchingHourTicks = v14->_smallMatchingHourTicks;
    v14->_smallMatchingHourTicks = v51;

    -[NTKCircularAnalogDialView _toggleRasterization:](v14, "_toggleRasterization:", 1);
    v12 = v49;
  }

  return v14;
}

- (void)layoutSubviews
{
  unint64_t numberOfTicks;
  unint64_t i;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKCircularAnalogDialView;
  -[NTKCircularAnalogDialView layoutSubviews](&v8, sel_layoutSubviews);
  numberOfTicks = self->_numberOfTicks;
  if (numberOfTicks)
  {
    for (i = 0; i < numberOfTicks; ++i)
    {
      v5 = (double)(int)i / (double)numberOfTicks * 360.0;
      -[NSArray objectAtIndexedSubscript:](self->_allSmallTicks, "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCircularAnalogDialView layoutLayerTicks:rotationAngleInDegree:smallTicks:](self, "layoutLayerTicks:rotationAngleInDegree:smallTicks:", v6, 1, v5);
      if (-[NTKCircularAnalogDialView isTickIndexForHour:](self, "isTickIndexForHour:", i))
      {
        -[NSArray objectAtIndexedSubscript:](self->_allHourTicks, "objectAtIndexedSubscript:", i / (self->_numberOfTicks / 0xC));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCircularAnalogDialView layoutLayerTicks:rotationAngleInDegree:smallTicks:](self, "layoutLayerTicks:rotationAngleInDegree:smallTicks:", v7, 0, v5);

      }
      numberOfTicks = self->_numberOfTicks;
    }
  }
}

- (BOOL)isTickIndexForHour:(unint64_t)a3
{
  return a3 % (self->_numberOfTicks / 0xC) == 0;
}

- (void)layoutLayerTicks:(id)a3 rotationAngleInDegree:(double)a4 smallTicks:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  double v8;
  double v9;
  double height;
  double v11;
  double tickPadding;
  double v13;
  CGFloat v14;
  CGFloat v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  v5 = a5;
  v7 = a3;
  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v20.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v20.c = v16;
  *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[NTKCircularAnalogDialView bounds](self, "bounds");
  v9 = v8;
  height = self->_options.hourTickSize.height;
  v11 = self->_options.smallTickSize.height;
  tickPadding = self->_tickPadding;
  *(_OWORD *)&v19.a = *(_OWORD *)&v20.a;
  *(_OWORD *)&v19.c = v16;
  *(_OWORD *)&v19.tx = *(_OWORD *)&v20.tx;
  CGAffineTransformTranslate(&v20, &v19, 0.0, tickPadding);
  objc_msgSend(v7, "size");
  v14 = v9 * 0.5 - v13 * 0.5 - self->_tickPadding;
  v18 = v20;
  CGAffineTransformTranslate(&v19, &v18, 0.0, v14);
  v20 = v19;
  CLKDegreesToRadians();
  v18 = v20;
  CGAffineTransformRotate(&v19, &v18, v15);
  v20 = v19;
  v18 = v19;
  CGAffineTransformTranslate(&v19, &v18, 0.0, -v14);
  v20 = v19;
  if (v5)
  {
    v18 = v20;
    CGAffineTransformTranslate(&v19, &v18, 0.0, (height - v11) * 0.5);
    v20 = v19;
  }
  v17 = v20;
  objc_msgSend(v7, "setAffineTransform:", &v17);

}

- (void)setDialBackgroundColor:(id)a3
{
  -[CALayer setBackgroundColor:](self->_dialBackgroundLayer, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
}

- (void)applyColorTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  CALayer *dialBackgroundLayer;
  char v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSArray *allSmallTicks;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *allHourTicks;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  _OWORD v36[2];
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  char v41;
  _QWORD v42[4];
  id v43;
  id v44;
  double v45;
  _QWORD v46[4];
  id v47;
  id v48;
  char v49;
  _QWORD aBlock[5];
  id v51;
  id v52;
  double v53;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "circularDialFillColor");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "circularDialFillColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v10;
  NTKInterpolateBetweenColors(v10, v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dialBackgroundLayer = self->_dialBackgroundLayer;
  v33 = objc_retainAutorelease(v11);
  -[CALayer setBackgroundColor:](dialBackgroundLayer, "setBackgroundColor:", objc_msgSend(v33, "CGColor"));
  if ((objc_msgSend(v8, "isMulticolorPalette") & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v9, "isMulticolorPalette");
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke;
  aBlock[3] = &unk_1E6BD3FE8;
  aBlock[4] = self;
  v15 = v8;
  v51 = v15;
  v16 = v9;
  v52 = v16;
  v53 = a3;
  v17 = _Block_copy(aBlock);
  objc_msgSend(v15, "circularDialSubtickColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "circularDialSubtickColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v32, v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  allSmallTicks = self->_allSmallTicks;
  v46[0] = v14;
  v46[1] = 3221225472;
  v46[2] = __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_2;
  v46[3] = &unk_1E6BD4010;
  v49 = v13;
  v47 = v18;
  v48 = v17;
  v30 = v18;
  v29 = v17;
  -[NSArray enumerateObjectsUsingBlock:](allSmallTicks, "enumerateObjectsUsingBlock:", v46);
  v42[0] = v14;
  v42[1] = 3221225472;
  v42[2] = __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_3;
  v42[3] = &unk_1E6BD4038;
  v43 = v15;
  v44 = v16;
  v45 = a3;
  v20 = v16;
  v21 = v15;
  v22 = _Block_copy(v42);
  objc_msgSend(v21, "circularDialTickColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "circularDialTickColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  allHourTicks = self->_allHourTicks;
  v38[0] = v14;
  v38[1] = 3221225472;
  v38[2] = __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_4;
  v38[3] = &unk_1E6BD4010;
  v41 = v13;
  v39 = v25;
  v40 = v22;
  v27 = v25;
  v28 = v22;
  -[NSArray enumerateObjectsUsingBlock:](allHourTicks, "enumerateObjectsUsingBlock:", v38);
  v37 = 0u;
  memset(v36, 0, sizeof(v36));
  _LayoutConstants_22(self->_device, v36);
  *(_QWORD *)&self->_tickPadding = v37;
  -[NTKCircularAnalogDialView setNeedsLayout](self, "setNeedsLayout");

}

id __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424);
  if (v4 >= 0x3D)
  {
    if (v4 != 120)
      __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_cold_1();
    v2 = a2 >> 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "colorForCircularTicksForMinute:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "colorForCircularTicksForMinute:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;
  id v9;

  if (*(_BYTE *)(a1 + 48))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
    v7 = a2;
    v6(v5, a3);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

  }
  else
  {
    v8 = objc_retainAutorelease(*(id *)(a1 + 32));
    v9 = a2;
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));
  }

}

id __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "colorForCircularTicksForHour:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "colorForCircularTicksForHour:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;
  id v9;

  if (*(_BYTE *)(a1 + 48))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
    v7 = a2;
    v6(v5, a3);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

  }
  else
  {
    v8 = objc_retainAutorelease(*(id *)(a1 + 32));
    v9 = a2;
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));
  }

}

- (void)applyColorTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  CALayer *dialBackgroundLayer;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(void *, void *);
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD aBlock[4];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[NTKWhistlerAnalogColorPalette dialFillColorForColorPalette:](self->_colorPalette, "dialFillColorForColorPalette:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  -[NTKWhistlerAnalogColorPalette dialFillColorForColorPalette:](self->_colorPalette, "dialFillColorForColorPalette:", v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v9;
  NTKInterpolateBetweenColors(v9, v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dialBackgroundLayer = self->_dialBackgroundLayer;
  v32 = objc_retainAutorelease(v10);
  -[CALayer setBackgroundColor:](dialBackgroundLayer, "setBackgroundColor:", objc_msgSend(v32, "CGColor"));
  -[NTKWhistlerAnalogColorPalette minuteTicksColorForColorPalette:](self->_colorPalette, "minuteTicksColorForColorPalette:", v7);
  v12 = objc_claimAutoreleasedReturnValue();
  -[NTKWhistlerAnalogColorPalette minuteTicksColorForColorPalette:](self->_colorPalette, "minuteTicksColorForColorPalette:", v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v12;
  NTKInterpolateBetweenColors(v12, v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v14 = self->_allSmallTicks;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v48;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v18++), "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v13), "CGColor"));
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v16);
  }

  v35 = v7;
  -[NTKWhistlerAnalogColorPalette hourTicksColorForColorPalette:](self->_colorPalette, "hourTicksColorForColorPalette:", v7);
  v19 = objc_claimAutoreleasedReturnValue();
  -[NTKWhistlerAnalogColorPalette hourTicksColorForColorPalette:](self->_colorPalette, "hourTicksColorForColorPalette:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v19;
  NTKInterpolateBetweenColors(v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v22 = self->_allHourTicks;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v44;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v26++), "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v21), "CGColor"));
      }
      while (v24 != v26);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v24);
  }

  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  _LayoutConstants_22(self->_device, &v40);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__NTKCircularAnalogDialView_applyColorTransitionFraction_fromFaceColorPalette_toFaceColorPalette___block_invoke;
  aBlock[3] = &__block_descriptor_80_e29_d16__0__NTKFaceColorPalette_8l;
  v37 = v40;
  v38 = v41;
  v39 = v42;
  v27 = (void (**)(void *, void *))_Block_copy(aBlock);
  v27[2](v27, v35);
  v27[2](v27, v8);
  CLKInterpolateBetweenFloatsClipped();
  self->_tickPadding = v28;
  -[NTKCircularAnalogDialView setNeedsLayout](self, "setNeedsLayout");

}

double __98__NTKCircularAnalogDialView_applyColorTransitionFraction_fromFaceColorPalette_toFaceColorPalette___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "isWhiteColor");
  v4 = 64;
  if (v3)
    v4 = 72;
  return *(double *)(a1 + v4);
}

- (id)_instantaneousAnimationForKeyPath:(id)a3 value:(id)a4
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CD2710];
  v5 = a4;
  objc_msgSend(v4, "animationWithKeyPath:", CFSTR("instanceDelay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v5);
  objc_msgSend(v6, "setToValue:", v5);

  objc_msgSend(v6, "setBeginTime:", 0.00000011920929);
  objc_msgSend(v6, "setDuration:", 0.00001);
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  return v6;
}

- (void)prepareForEdit
{
  -[NTKCircularAnalogDialView _toggleRasterization:](self, "_toggleRasterization:", 0);
}

- (void)cleanupAfterEdit
{
  -[NTKCircularAnalogDialView _toggleRasterization:](self, "_toggleRasterization:", 1);
}

- (void)setHideHourTicks:(BOOL)a3
{
  NSArray *allHourTicks;
  uint64_t v6;
  NSArray *smallMatchingHourTicks;
  _QWORD v8[4];
  BOOL v9;
  _QWORD v10[4];
  BOOL v11;

  self->_options.hideHourTicks = a3;
  allHourTicks = self->_allHourTicks;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__NTKCircularAnalogDialView_setHideHourTicks___block_invoke;
  v10[3] = &__block_descriptor_33_e24_v32__0__CALayer_8Q16_B24l;
  v11 = a3;
  -[NSArray enumerateObjectsUsingBlock:](allHourTicks, "enumerateObjectsUsingBlock:", v10);
  smallMatchingHourTicks = self->_smallMatchingHourTicks;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __46__NTKCircularAnalogDialView_setHideHourTicks___block_invoke_2;
  v8[3] = &__block_descriptor_33_e24_v32__0__CALayer_8Q16_B24l;
  v9 = a3;
  -[NSArray enumerateObjectsUsingBlock:](smallMatchingHourTicks, "enumerateObjectsUsingBlock:", v8);
}

uint64_t __46__NTKCircularAnalogDialView_setHideHourTicks___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __46__NTKCircularAnalogDialView_setHideHourTicks___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", *(_BYTE *)(a1 + 32) == 0);
}

- (void)setHourTicksOpacity:(double)a3 bezelTextWidthRadians:(double)a4
{
  NSArray *allHourTicks;
  uint64_t v8;
  NSArray *smallMatchingHourTicks;
  _QWORD v10[7];
  _QWORD v11[7];

  allHourTicks = self->_allHourTicks;
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__NTKCircularAnalogDialView_setHourTicksOpacity_bezelTextWidthRadians___block_invoke;
  v11[3] = &unk_1E6BD40A0;
  v11[4] = self;
  *(double *)&v11[5] = a4;
  *(double *)&v11[6] = a3;
  -[NSArray enumerateObjectsUsingBlock:](allHourTicks, "enumerateObjectsUsingBlock:", v11);
  smallMatchingHourTicks = self->_smallMatchingHourTicks;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __71__NTKCircularAnalogDialView_setHourTicksOpacity_bezelTextWidthRadians___block_invoke_2;
  v10[3] = &unk_1E6BD40A0;
  v10[4] = self;
  *(double *)&v10[5] = a4;
  *(double *)&v10[6] = a3;
  -[NSArray enumerateObjectsUsingBlock:](smallMatchingHourTicks, "enumerateObjectsUsingBlock:", v10);
}

void __71__NTKCircularAnalogDialView_setHourTicksOpacity_bezelTextWidthRadians___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_tickOpactiyAtIndex:bezelTextWidthInRadius:invisibleTicksAlpha:visibleTicksAlpha:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) / 0xCuLL * a3, *(double *)(a1 + 40), 0.0, *(double *)(a1 + 48));
  *(float *)&v5 = v5;
  objc_msgSend(v6, "setOpacity:", v5);

}

void __71__NTKCircularAnalogDialView_setHourTicksOpacity_bezelTextWidthRadians___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_tickOpactiyAtIndex:bezelTextWidthInRadius:invisibleTicksAlpha:visibleTicksAlpha:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) / 0xCuLL * a3, *(double *)(a1 + 40), 0.0, 1.0 - *(double *)(a1 + 48));
  *(float *)&v5 = v5;
  objc_msgSend(v6, "setOpacity:", v5);

}

- (void)fillDialTransitionWithFraction:(double)a3 bezelTextWidthRadians:(double)a4
{
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSArray *allSmallTicks;
  _QWORD v10[8];

  v6 = (unint64_t)((double)-[NSArray count](self->_allSmallTicks, "count") * a3);
  v7 = -[NSArray count](self->_allSmallTicks, "count");
  v8 = -[NSArray count](self->_allHourTicks, "count");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __82__NTKCircularAnalogDialView_fillDialTransitionWithFraction_bezelTextWidthRadians___block_invoke;
  v10[3] = &unk_1E6BD40C8;
  allSmallTicks = self->_allSmallTicks;
  v10[1] = 3221225472;
  v10[4] = self;
  *(double *)&v10[5] = a4;
  v10[6] = v6;
  v10[7] = v7 / v8;
  -[NSArray enumerateObjectsUsingBlock:](allSmallTicks, "enumerateObjectsUsingBlock:", v10);
}

void __82__NTKCircularAnalogDialView_fillDialTransitionWithFraction_bezelTextWidthRadians___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_tickOpactiyAtIndex:bezelTextWidthInRadius:invisibleTicksAlpha:", a3, *(double *)(a1 + 40), 0.0);
  *(float *)&v5 = v5;
  if (*(_QWORD *)(a1 + 48) <= a3)
    *(float *)&v5 = 0.0;
  objc_msgSend(v8, "setOpacity:", v5);
  if (!(a3 % *(_QWORD *)(a1 + 56)))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v6 + 489))
    {
      objc_msgSend(*(id *)(v6 + 456), "objectAtIndexedSubscript:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "opacity");
      objc_msgSend(v7, "setOpacity:");

    }
  }

}

- (void)showAllTicksInDial
{
  -[NTKCircularAnalogDialView transitTicksWithInitialBezelTextWidthInRadius:finalBezelTextWidthInRadius:fraction:](self, "transitTicksWithInitialBezelTextWidthInRadius:finalBezelTextWidthInRadius:fraction:", 0.0, 0.0, 1.0);
}

- (void)transitTicksWithInitialBezelTextWidthInRadius:(double)a3 finalBezelTextWidthInRadius:(double)a4 fraction:(double)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  NSArray *allHourTicks;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  NTKCircularAnalogDialView *v14;
  id v15;
  _QWORD aBlock[8];

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__NTKCircularAnalogDialView_transitTicksWithInitialBezelTextWidthInRadius_finalBezelTextWidthInRadius_fraction___block_invoke;
  aBlock[3] = &unk_1E6BD40C8;
  aBlock[4] = self;
  *(double *)&aBlock[5] = a3;
  *(double *)&aBlock[6] = a4;
  *(double *)&aBlock[7] = a5;
  v7 = _Block_copy(aBlock);
  v8 = v7;
  if (!self->_options.hideHourTicks)
  {
    allHourTicks = self->_allHourTicks;
    v10 = v6;
    v11 = 3221225472;
    v12 = __112__NTKCircularAnalogDialView_transitTicksWithInitialBezelTextWidthInRadius_finalBezelTextWidthInRadius_fraction___block_invoke_2;
    v13 = &unk_1E6BD40F0;
    v14 = self;
    v15 = v7;
    -[NSArray enumerateObjectsUsingBlock:](allHourTicks, "enumerateObjectsUsingBlock:", &v10);

  }
  -[NSArray enumerateObjectsUsingBlock:](self->_allSmallTicks, "enumerateObjectsUsingBlock:", v8, v10, v11, v12, v13);

}

void __112__NTKCircularAnalogDialView_transitTicksWithInitialBezelTextWidthInRadius_finalBezelTextWidthInRadius_fraction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(double *)(a1 + 40);
  v8 = a2;
  objc_msgSend(v5, "_tickOpactiyAtIndex:bezelTextWidthInRadius:invisibleTicksAlpha:", a3, v6, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "_tickOpactiyAtIndex:bezelTextWidthInRadius:invisibleTicksAlpha:", a3, *(double *)(a1 + 48), 0.0);
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&v7 = v7;
  objc_msgSend(v8, "setOpacity:", v7);

}

uint64_t __112__NTKCircularAnalogDialView_transitTicksWithInitialBezelTextWidthInRadius_finalBezelTextWidthInRadius_fraction___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) / 0xCuLL * a3);
}

- (void)transitInvisibleTicksAlphaWithBezelTextWidthInRadius:(double)a3 invisbleTicksAlpha:(double)a4
{
  uint64_t v5;
  void *v6;
  NSArray *allHourTicks;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[7];

  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__NTKCircularAnalogDialView_transitInvisibleTicksAlphaWithBezelTextWidthInRadius_invisbleTicksAlpha___block_invoke;
  aBlock[3] = &unk_1E6BD40A0;
  aBlock[4] = self;
  *(double *)&aBlock[5] = a3;
  *(double *)&aBlock[6] = a4;
  v6 = _Block_copy(aBlock);
  allHourTicks = self->_allHourTicks;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __101__NTKCircularAnalogDialView_transitInvisibleTicksAlphaWithBezelTextWidthInRadius_invisbleTicksAlpha___block_invoke_2;
  v9[3] = &unk_1E6BD40F0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[NSArray enumerateObjectsUsingBlock:](allHourTicks, "enumerateObjectsUsingBlock:", v9);
  -[NSArray enumerateObjectsUsingBlock:](self->_allSmallTicks, "enumerateObjectsUsingBlock:", v8);

}

void __101__NTKCircularAnalogDialView_transitInvisibleTicksAlphaWithBezelTextWidthInRadius_invisbleTicksAlpha___block_invoke(double *a1, void *a2, uint64_t a3)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v4 = (void *)*((_QWORD *)a1 + 4);
  v5 = a1[5];
  v6 = a1[6];
  v8 = a2;
  objc_msgSend(v4, "_tickOpactiyAtIndex:bezelTextWidthInRadius:invisibleTicksAlpha:", a3, v5, v6);
  *(float *)&v7 = v7;
  objc_msgSend(v8, "setOpacity:", v7);

}

uint64_t __101__NTKCircularAnalogDialView_transitInvisibleTicksAlphaWithBezelTextWidthInRadius_invisbleTicksAlpha___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) / 0xCuLL * a3);
}

+ (id)_disabledLayerActions
{
  if (_disabledLayerActions_onceToken_2 != -1)
    dispatch_once(&_disabledLayerActions_onceToken_2, &__block_literal_global_89);
  return (id)_disabledLayerActions__dictionary_2;
}

void __50__NTKCircularAnalogDialView__disabledLayerActions__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[9];
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = CFSTR("instanceTransform");
  v3[1] = CFSTR("contentsMultiplyColor");
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = CFSTR("transform");
  v3[3] = CFSTR("hidden");
  v4[2] = v0;
  v4[3] = v0;
  v3[4] = CFSTR("position");
  v3[5] = CFSTR("opacity");
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = CFSTR("instanceCount");
  v3[7] = CFSTR("instanceDelay");
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = CFSTR("backgroundColor");
  v4[8] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_disabledLayerActions__dictionary_2;
  _disabledLayerActions__dictionary_2 = v1;

}

- (double)_tickOpactiyAtIndex:(int64_t)a3 bezelTextWidthInRadius:(double)a4 invisibleTicksAlpha:(double)a5
{
  double result;

  -[NTKCircularAnalogDialView _tickOpactiyAtIndex:bezelTextWidthInRadius:invisibleTicksAlpha:visibleTicksAlpha:](self, "_tickOpactiyAtIndex:bezelTextWidthInRadius:invisibleTicksAlpha:visibleTicksAlpha:", a3, a4, a5, 1.0);
  return result;
}

- (double)_tickOpactiyAtIndex:(int64_t)a3 bezelTextWidthInRadius:(double)a4 invisibleTicksAlpha:(double)a5 visibleTicksAlpha:(double)a6
{
  double v8;
  double v9;

  v8 = a4 * 0.5;
  CLKDegreesToRadians();
  if (v9 >= v8)
    return a6;
  else
    return a5;
}

- (void)_toggleRasterization:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[NTKCircularAnalogDialView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setShouldRasterize:", 1);
    -[CLKDevice screenScale](self->_device, "screenScale");
    objc_msgSend(v6, "setRasterizationScale:");
  }
  else
  {
    objc_msgSend(v5, "setShouldRasterize:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_smallMatchingHourTicks, 0);
  objc_storeStrong((id *)&self->_allHourTicks, 0);
  objc_storeStrong((id *)&self->_allSmallTicks, 0);
  objc_storeStrong((id *)&self->_ticksLayer, 0);
  objc_storeStrong((id *)&self->_dialBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_cold_1()
{
  __assert_rtn("-[NTKCircularAnalogDialView applyColorTransitionFraction:fromColorPalette:toColorPalette:]_block_invoke", "NTKCircularAnalogDialView.m", 226, "self->_numberOfTicks == 120");
}

@end
