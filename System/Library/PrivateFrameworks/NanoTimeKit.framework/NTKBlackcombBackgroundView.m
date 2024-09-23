@implementation NTKBlackcombBackgroundView

- (id)initForDevice:(id)a3
{
  id v5;
  NTKBlackcombBackgroundView *v6;
  id *p_isa;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKBlackcombBackgroundView;
  v6 = -[NTKBlackcombBackgroundView init](&v11, sel_init);
  p_isa = (id *)&v6->super.super.super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    objc_msgSend(p_isa, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[52], "screenCornerRadius");
    objc_msgSend(v8, "setCornerRadius:");

    objc_msgSend(p_isa, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    objc_msgSend(p_isa, "_setupTicks");
    objc_msgSend(p_isa, "_layoutTopLargeTick");
  }

  return p_isa;
}

- (CGRect)_tickLayoutBounds
{
  CGFloat dx[2];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  CGRect v11;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)dx = 0u;
  v3 = 0u;
  -[CLKDevice screenBounds](self->_device, "screenBounds", _LayoutConstants_13(self->_device, (uint64_t)dx).n128_f64[0]);
  return CGRectInset(v11, dx[0], dx[0]);
}

- (void)_setupTicks
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  void *v25;
  id v26;
  NSArray *v27;
  NSArray *smallTicks;
  CALayer *v29;
  CALayer *smallTickCoveringLayer;
  CALayer *v31;
  CALayer *v32;
  double v33;
  CALayer *v34;
  id v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  double v42;
  double v43;
  void *v44;
  id v45;
  double v46;
  void *v47;
  NSArray *v48;
  NSArray *mediumTicks;
  void *v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  CLKDevice *device;
  id v57;
  double v58;
  void *v59;
  NSArray *v60;
  NSArray *largeTicks;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  CGAffineTransform v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  _OWORD v85[4];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  CGRect v91;
  CGRect v92;

  v84 = 0;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v3 = -[NTKBlackcombBackgroundView _tickLayoutBounds](self, "_tickLayoutBounds", _LayoutConstants_13(self->_device, (uint64_t)&v76).n128_f64[0]);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = MEMORY[0x1BCCA72B8](v3);
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v5;
  objc_msgSend(v15, "setBounds:", v5, v7, v9, v11);
  objc_msgSend(v15, "setPosition:", v12, v14);
  -[CLKDevice screenCornerRadius](self->_device, "screenCornerRadius");
  v17 = v16;
  -[CLKDevice screenBounds](self->_device, "screenBounds");
  v19 = v17 * (v18 + *(double *)&v76 * -2.0);
  -[CLKDevice screenBounds](self->_device, "screenBounds");
  objc_msgSend(v15, "setCornerRadius:", v19 / v20);
  v21 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v15, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(v15, "setMasksToBounds:", 1);
  if (objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode"))
  {
    objc_msgSend(v15, "setShouldRasterize:", 1);
    -[CLKDevice screenScale](self->_device, "screenScale");
    objc_msgSend(v15, "setRasterizationScale:");
  }
  v22 = *((_QWORD *)&v76 + 1);
  v72 = *((_QWORD *)&v80 + 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 >= 1)
  {
    v23 = 0;
    v24 = *(double *)&v77;
    do
    {
      if (v23 % (v22 / v72))
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setBounds:", 0.0, 0.0, v11, v24);
        objc_msgSend(v25, "setAnchorPoint:", 0.0, 0.5);
        objc_msgSend(v25, "setPosition:", v12, v14);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v25, "setBackgroundColor:", objc_msgSend(v26, "CGColor"));

        CGAffineTransformMakeRotation(&v75, (double)v23 * (6.28318531 / (double)v22) + -1.57079633);
        objc_msgSend(v25, "setAffineTransform:", &v75);
        objc_msgSend(v15, "addSublayer:", v25);
        objc_msgSend(v63, "addObject:", v25);

      }
      ++v23;
    }
    while (v22 != v23);
  }
  v70 = v14;
  v71 = v12;
  v27 = (NSArray *)objc_msgSend(v63, "copy");
  smallTicks = self->_smallTicks;
  self->_smallTicks = v27;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v29 = (CALayer *)objc_claimAutoreleasedReturnValue();
  smallTickCoveringLayer = self->_smallTickCoveringLayer;
  self->_smallTickCoveringLayer = v29;

  v31 = self->_smallTickCoveringLayer;
  MEMORY[0x1BCCA72B8](v67, v7, v9, v11);
  -[CALayer setPosition:](v31, "setPosition:");
  v32 = self->_smallTickCoveringLayer;
  v33 = *((double *)&v77 + 1);
  v91.origin.x = v67;
  v91.origin.y = v7;
  v91.size.width = v9;
  v91.size.height = v11;
  v92 = CGRectInset(v91, *((CGFloat *)&v77 + 1), *((CGFloat *)&v77 + 1));
  -[CALayer setBounds:](v32, "setBounds:", v92.origin.x, v92.origin.y, v92.size.width, v92.size.height);
  v34 = self->_smallTickCoveringLayer;
  -[NTKBlackcombColorPalette background](self->_palette, "background");
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v34, "setBackgroundColor:", objc_msgSend(v35, "CGColor"));

  -[CLKDevice screenCornerRadius](self->_device, "screenCornerRadius");
  -[CALayer setCornerRadius:](self->_smallTickCoveringLayer, "setCornerRadius:", v36 - v33);
  -[CALayer setCornerCurve:](self->_smallTickCoveringLayer, "setCornerCurve:", v21);
  objc_msgSend(v15, "addSublayer:", self->_smallTickCoveringLayer);
  -[NTKBlackcombBackgroundView layer](self, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addSublayer:", v15);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v72;
  v62 = (double)v72;
  if (v72 >= 1)
  {
    v40 = 0;
    v41 = v78;
    v65 = *(double *)&v78;
    v68 = *((double *)&v79 + 1) + *((double *)&v79 + 1);
    v64 = *(double *)&v78 * 0.5;
    v42 = 6.28318531 / v62;
    do
    {
      v43 = _LargeOrMediumTickLengthAtIndex(v40, self->_device, *((double *)&v41 + 1), *((double *)&v41 + 1), v68);
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setBounds:", 0.0, 0.0, v65, v43);
      objc_msgSend(v44, "setCornerRadius:", v64);
      CGAffineTransformMakeRotation(&v74, (double)v40 * v42 + 3.14159265);
      objc_msgSend(v44, "setAffineTransform:", &v74);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.6, 1.0);
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v44, "setBackgroundColor:", objc_msgSend(v45, "CGColor"));
      -[NTKBlackcombBackgroundView _outerDialRadiusAtMediumTick:verticalLength:horizontalLength:](self, "_outerDialRadiusAtMediumTick:verticalLength:horizontalLength:", v40, *((double *)&v41 + 1), *((double *)&v41 + 1));
      objc_msgSend(v44, "setPosition:", _TickPosition(self->_device, v12, v14, v46, (double)v40 * v42 + -1.57079633));
      -[NTKBlackcombBackgroundView layer](self, "layer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addSublayer:", v44);

      objc_msgSend(v38, "addObject:", v44);
      v39 = v72;

      ++v40;
    }
    while (v72 != v40);
  }
  v48 = (NSArray *)objc_msgSend(v38, "copy");
  mediumTicks = self->_mediumTicks;
  self->_mediumTicks = v48;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39 >= 1)
  {
    v51 = 0;
    v53 = *((double *)&v81 + 1);
    v52 = *(double *)&v82;
    v66 = *(double *)&v81 * 0.5;
    v69 = *(double *)&v81;
    do
    {
      v54 = _LargeOrMediumTickLengthAtIndex(v51, self->_device, v52, v53, 0.0);
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setBounds:", 0.0, 0.0, v69, v54);
      objc_msgSend(v55, "setCornerRadius:", v66);
      device = self->_device;
      v90 = 0;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      memset(v85, 0, sizeof(v85));
      _LayoutConstants_13(device, (uint64_t)v85);
      CGAffineTransformMakeRotation(&v73, (double)v51 * (6.28318531 / (double)*((uint64_t *)&v86 + 1)) + 3.14159265);
      objc_msgSend(v55, "setAffineTransform:", &v73);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v55, "setBackgroundColor:", objc_msgSend(v57, "CGColor"));
      -[NTKBlackcombBackgroundView _innerDialRadiusAtLargeTick:verticalLength:horizontalLength:](self, "_innerDialRadiusAtLargeTick:verticalLength:horizontalLength:", v51, v52, v53);
      objc_msgSend(v55, "setPosition:", _TickPosition(self->_device, v71, v70, v58, (double)v51 * (6.28318531 / v62) + -1.57079633));
      -[NTKBlackcombBackgroundView layer](self, "layer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addSublayer:", v55);

      objc_msgSend(v50, "addObject:", v55);
      ++v51;
    }
    while (v72 != v51);
  }
  v60 = (NSArray *)objc_msgSend(v50, "copy");
  largeTicks = self->_largeTicks;
  self->_largeTicks = v60;

}

- (void)_applyBackgroundColor:(id)a3
{
  void *v4;
  id v5;
  CALayer *smallTickCoveringLayer;
  id v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0CD28B0];
  v5 = a3;
  objc_msgSend(v4, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[NTKBlackcombBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v5);
  smallTickCoveringLayer = self->_smallTickCoveringLayer;
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "CGColor");

  -[CALayer setBackgroundColor:](smallTickCoveringLayer, "setBackgroundColor:", v8);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)applyPalette:(id)a3
{
  id v5;
  NSArray *smallTicks;
  uint64_t v7;
  id v8;
  NSArray *mediumTicks;
  id v10;
  NSArray *largeTicks;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  objc_storeStrong((id *)&self->_palette, a3);
  smallTicks = self->_smallTicks;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __43__NTKBlackcombBackgroundView_applyPalette___block_invoke;
  v18[3] = &unk_1E6BD18B8;
  v8 = v5;
  v19 = v8;
  -[NSArray enumerateObjectsUsingBlock:](smallTicks, "enumerateObjectsUsingBlock:", v18);
  mediumTicks = self->_mediumTicks;
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __43__NTKBlackcombBackgroundView_applyPalette___block_invoke_2;
  v16[3] = &unk_1E6BD18B8;
  v10 = v8;
  v17 = v10;
  -[NSArray enumerateObjectsUsingBlock:](mediumTicks, "enumerateObjectsUsingBlock:", v16);
  largeTicks = self->_largeTicks;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __43__NTKBlackcombBackgroundView_applyPalette___block_invoke_3;
  v14[3] = &unk_1E6BD18B8;
  v15 = v10;
  v13 = v10;
  -[NSArray enumerateObjectsUsingBlock:](largeTicks, "enumerateObjectsUsingBlock:", v14);
  -[NTKBlackcombColorPalette background](self->_palette, "background");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBlackcombBackgroundView _applyBackgroundColor:](self, "_applyBackgroundColor:", v12);

}

void __43__NTKBlackcombBackgroundView_applyPalette___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "smallTick");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

}

void __43__NTKBlackcombBackgroundView_applyPalette___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "largeTick");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

}

void __43__NTKBlackcombBackgroundView_applyPalette___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hourMarker");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  NSArray *smallTicks;
  uint64_t v22;
  id v23;
  id v24;
  NSArray *mediumTicks;
  double v26;
  id v27;
  id v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSArray *largeTicks;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  double v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  double v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  id v52;
  double v53;
  uint64_t v54;
  _OWORD v55[4];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v37 = a4;
  v8 = a5;
  objc_msgSend(v37, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    -[NTKBlackcombBackgroundView applyPalette:](self, "applyPalette:", v37);
  }
  else
  {
    objc_msgSend(v37, "background");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "background");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBlackcombBackgroundView _applyBackgroundColor:](self, "_applyBackgroundColor:", v14);

    if (a3 <= 0.5)
      v15 = v37;
    else
      v15 = v8;
    objc_storeStrong((id *)&self->_palette, v15);
    CLKCompressFraction();
    v17 = v16;
    v60 = 0;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    memset(v55, 0, sizeof(v55));
    _LayoutConstants_13(self->_device, (uint64_t)v55);
    v18 = (double)*((uint64_t *)&v55[0] + 1);
    v19 = (uint64_t)(v17 * (double)*((uint64_t *)&v55[0] + 1));
    v20 = -[NSArray count](self->_smallTicks, "count");
    smallTicks = self->_smallTicks;
    v22 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke;
    v50[3] = &unk_1E6BD18E0;
    v53 = v18 / (double)v20;
    v54 = v19;
    v23 = v8;
    v51 = v23;
    v24 = v37;
    v52 = v24;
    -[NSArray enumerateObjectsUsingBlock:](smallTicks, "enumerateObjectsUsingBlock:", v50);
    mediumTicks = self->_mediumTicks;
    v45[0] = v22;
    v45[1] = 3221225472;
    v45[2] = __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke_2;
    v45[3] = &unk_1E6BD18E0;
    v26 = v18 / (double)*((uint64_t *)&v56 + 1);
    v48 = v26;
    v49 = v19;
    v27 = v23;
    v46 = v27;
    v28 = v24;
    v47 = v28;
    -[NSArray enumerateObjectsUsingBlock:](mediumTicks, "enumerateObjectsUsingBlock:", v45);
    v29 = MEMORY[0x1BCCA72B8](-[NTKBlackcombBackgroundView _tickLayoutBounds](self, "_tickLayoutBounds"));
    v31 = v30;
    objc_msgSend(v28, "hourMarker");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hourMarker");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    largeTicks = self->_largeTicks;
    v38[0] = v22;
    v38[1] = 3221225472;
    v38[2] = __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke_3;
    v38[3] = &unk_1E6BD1908;
    v41 = v26;
    v42 = v19;
    v39 = v32;
    v40 = v33;
    v43 = v29;
    v44 = v31;
    v35 = v33;
    v36 = v32;
    -[NSArray enumerateObjectsUsingBlock:](largeTicks, "enumerateObjectsUsingBlock:", v38);

  }
}

void __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v3 = 40;
  if (*(double *)(a1 + 48) * (double)a3 < (double)*(uint64_t *)(a1 + 56))
    v3 = 32;
  v4 = *(void **)(a1 + v3);
  v5 = a2;
  objc_msgSend(v4, "smallTick");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

}

void __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v3 = 40;
  if (*(double *)(a1 + 48) * (double)a3 < (double)*(uint64_t *)(a1 + 56))
    v3 = 32;
  v4 = *(void **)(a1 + v3);
  v5 = a2;
  objc_msgSend(v4, "largeTick");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

}

void __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  CGColor *v7;
  CGColor *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[11];

  v35[9] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = 32;
  if (*(double *)(a1 + 48) * (double)a3 < (double)*(uint64_t *)(a1 + 56))
    v6 = 40;
  v7 = (CGColor *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + v6)), "CGColor");
  v8 = (CGColor *)objc_msgSend(v5, "backgroundColor");
  objc_msgSend(v5, "setBackgroundColor:", v7);
  if (!CGColorEqualToColor(v7, v8))
  {
    objc_msgSend(v5, "position");
    v10 = *(double *)(a1 + 64) - v9;
    v12 = *(double *)(a1 + 72) - v11;
    v13 = sqrt(v12 * v12 + v10 * v10);
    v14 = v10 / v13;
    v15 = v12 / v13;
    v16 = v10 / v13 * 5.0;
    v17 = v12 / v13 * 5.0;
    v33 = (void *)objc_opt_new();
    objc_msgSend(v33, "setDuration:", 0.5);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("backgroundColor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDuration:", 0.5);
    objc_msgSend(v34, "setFromValue:", v8);
    objc_msgSend(v34, "setToValue:", v7);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDuration:", 0.33);
    objc_msgSend(v32, "setByValue:", &unk_1E6CA4598);
    objc_msgSend(v32, "setCumulative:", 1);
    v18 = *MEMORY[0x1E0CD2B58];
    objc_msgSend(v32, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.x"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDuration:", 0.33);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setByValue:", v20);

    objc_msgSend(v19, "setCumulative:", 1);
    objc_msgSend(v19, "setFillMode:", v18);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.y"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDuration:", 0.33);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setByValue:", v21);

    objc_msgSend(v31, "setCumulative:", 1);
    objc_msgSend(v31, "setFillMode:", v18);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDuration:", 0.33);
    objc_msgSend(v22, "setByValue:", &unk_1E6CA45A8);
    objc_msgSend(v22, "setCumulative:", 1);
    objc_msgSend(v22, "setFillMode:", v18);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDuration:", 0.17);
    objc_msgSend(v23, "setByValue:", &unk_1E6CA45B8);
    objc_msgSend(v23, "setBeginTime:", 0.33);
    objc_msgSend(v23, "setCumulative:", 1);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.x"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDuration:", 0.17);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -(v14 * 5.0));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setByValue:", v25);

    objc_msgSend(v24, "setBeginTime:", 0.33);
    objc_msgSend(v24, "setCumulative:", 1);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.y"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDuration:", 0.17);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -(v15 * 5.0));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setByValue:", v27);

    objc_msgSend(v26, "setBeginTime:", 0.33);
    objc_msgSend(v26, "setCumulative:", 1);
    objc_msgSend(v26, "setFillMode:", v18);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDuration:", 0.17);
    objc_msgSend(v28, "setByValue:", &unk_1E6CA45C8);
    objc_msgSend(v28, "setBeginTime:", 0.33);
    objc_msgSend(v28, "setCumulative:", 1);
    v35[0] = v34;
    v35[1] = v32;
    v35[2] = v19;
    v35[3] = v31;
    v35[4] = v22;
    v35[5] = v23;
    v35[6] = v24;
    v35[7] = v26;
    v35[8] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAnimations:", v29);

    LODWORD(v30) = 2.0;
    objc_msgSend(v33, "setSpeed:", v30);

    objc_msgSend(v5, "addAnimation:forKey:", v33, CFSTR("Key"));
  }

}

- (void)_layoutTopLargeTick
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  _OWORD v13[6];
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _BYTE v17[120];
  double v18;

  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  memset(v13, 0, sizeof(v13));
  _LayoutConstants_13(self->_device, (uint64_t)v13);
  v3 = *(double *)&v14;
  if (self->_showingStatus)
    v4 = *(double *)&v15;
  else
    v4 = 0.0;
  v5 = MEMORY[0x1BCCA72B8](-[NTKBlackcombBackgroundView _tickLayoutBounds](self, "_tickLayoutBounds"));
  v7 = v6;
  -[NTKBlackcombBackgroundView _innerDialRadiusAtLargeTick:verticalLength:horizontalLength:](self, "_innerDialRadiusAtLargeTick:verticalLength:horizontalLength:", 0, v3, 0.0);
  v9 = v8 + v4 * -0.5;
  -[NSArray objectAtIndexedSubscript:](self->_largeTicks, "objectAtIndexedSubscript:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPosition:", _TickPosition(self->_device, v5, v7, v9, -1.57079633));
  objc_msgSend(v12, "bounds");
  v11 = v10;
  _LayoutConstants_13(self->_device, (uint64_t)v17);
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v11, v3 - v4 + v18);

}

- (void)setUsesLongSideTicks:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  double v7;
  NSArray *largeTicks;
  uint64_t v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  if (self->_usesLongSideTicks != a3)
  {
    v3 = a3;
    self->_usesLongSideTicks = a3;
    v32 = 0;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    _LayoutConstants_13(self->_device, (uint64_t)&v24);
    v5 = v30;
    if (v3)
      v6 = v30;
    else
      v6 = *((_QWORD *)&v29 + 1);
    v7 = MEMORY[0x1BCCA72B8](-[NTKBlackcombBackgroundView _tickLayoutBounds](self, "_tickLayoutBounds"));
    v10[1] = 3221225472;
    v16 = v29;
    v17 = v30;
    v18 = v31;
    v12 = v25;
    v13 = v26;
    v14 = v27;
    largeTicks = self->_largeTicks;
    v15 = v28;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[2] = __51__NTKBlackcombBackgroundView_setUsesLongSideTicks___block_invoke;
    v10[3] = &unk_1E6BD1930;
    v10[4] = self;
    v19 = v32;
    v11 = v24;
    v20 = v5;
    v21 = v6;
    v22 = v7;
    v23 = v9;
    -[NSArray enumerateObjectsUsingBlock:](largeTicks, "enumerateObjectsUsingBlock:", v10);
  }
}

void __51__NTKBlackcombBackgroundView_setUsesLongSideTicks___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    v5 = (double)(unint64_t)a3 * (6.28318531 / (double)*(uint64_t *)(a1 + 112)) + -1.57079633;
    objc_msgSend(*(id *)(a1 + 32), "_innerDialRadiusAtLargeTick:verticalLength:horizontalLength:", a3, *(double *)(a1 + 176), *(double *)(a1 + 184));
    objc_msgSend(v8, "setPosition:", _TickPosition(*(void **)(*(_QWORD *)(a1 + 32) + 416), *(double *)(a1 + 192), *(double *)(a1 + 200), v6, v5));
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "setBounds:", 0.0, 0.0, v7, _LargeOrMediumTickLengthAtIndex(a3, *(void **)(*(_QWORD *)(a1 + 32) + 416), *(double *)(a1 + 176), *(double *)(a1 + 184), 0.0));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_layoutTopLargeTick");
  }

}

- (void)applyTransitionFractionToUsesLongSideTicks:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  NSArray *largeTicks;
  uint64_t v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = 0;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  _LayoutConstants_13(self->_device, (uint64_t)&v24);
  v4 = v30;
  CLKInterpolateBetweenFloatsClipped();
  v6 = v5;
  v7 = MEMORY[0x1BCCA72B8](-[NTKBlackcombBackgroundView _tickLayoutBounds](self, "_tickLayoutBounds"));
  v10[1] = 3221225472;
  v16 = v29;
  v17 = v30;
  v18 = v31;
  v12 = v25;
  v13 = v26;
  v14 = v27;
  largeTicks = self->_largeTicks;
  v15 = v28;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __73__NTKBlackcombBackgroundView_applyTransitionFractionToUsesLongSideTicks___block_invoke;
  v10[3] = &unk_1E6BD1930;
  v10[4] = self;
  v19 = v32;
  v11 = v24;
  v20 = v4;
  v21 = v6;
  v22 = v7;
  v23 = v9;
  -[NSArray enumerateObjectsUsingBlock:](largeTicks, "enumerateObjectsUsingBlock:", v10);
}

void __73__NTKBlackcombBackgroundView_applyTransitionFractionToUsesLongSideTicks___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    v5 = (double)(unint64_t)a3 * (6.28318531 / (double)*(uint64_t *)(a1 + 112)) + -1.57079633;
    objc_msgSend(*(id *)(a1 + 32), "_innerDialRadiusAtLargeTick:verticalLength:horizontalLength:", a3, *(double *)(a1 + 176), *(double *)(a1 + 184));
    objc_msgSend(v8, "setPosition:", _TickPosition(*(void **)(*(_QWORD *)(a1 + 32) + 416), *(double *)(a1 + 192), *(double *)(a1 + 200), v6, v5));
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "setBounds:", 0.0, 0.0, v7, _LargeOrMediumTickLengthAtIndex(a3, *(void **)(*(_QWORD *)(a1 + 32) + 416), *(double *)(a1 + 176), *(double *)(a1 + 184), 0.0));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_layoutTopLargeTick");
  }

}

- (void)configureTicksForStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  self->_showingStatus = a3;
  -[NSArray firstObject](self->_mediumTicks, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[NSArray firstObject](self->_smallTicks, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3);

  -[NSArray lastObject](self->_smallTicks, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v3);

  -[NTKBlackcombBackgroundView _layoutTopLargeTick](self, "_layoutTopLargeTick");
}

- (double)_outerDialRadiusAtMediumTick:(int64_t)a3 verticalLength:(double)a4 horizontalLength:(double)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;
  double v17[17];
  _BYTE v18[48];
  double v19;

  -[NTKBlackcombBackgroundView _tickLayoutBounds](self, "_tickLayoutBounds");
  v10 = v9;
  v12 = v11;
  _LayoutConstants_13(self->_device, (uint64_t)v18);
  v13 = v19;
  _LayoutConstants_13(self->_device, (uint64_t)v17);
  v14 = (v10 - a5) * 0.5;
  v15 = (v12 - a4) * 0.5;
  switch(a3)
  {
    case 0:
    case 6:
      result = v15 + v13;
      break;
    case 1:
    case 5:
    case 7:
    case 11:
      result = v15 / 0.866025404 - v17[8];
      break;
    case 2:
    case 4:
    case 8:
    case 10:
      result = v13 + v14 / 0.866025404;
      break;
    case 3:
    case 9:
      result = v14 + v13;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (double)_innerDialRadiusAtLargeTick:(int64_t)a3 verticalLength:(double)a4 horizontalLength:(double)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double result;
  double v14;
  _BYTE v15[128];
  double v16;
  _BYTE v17[120];
  double v18;
  _BYTE v19[104];
  double v20;

  -[NTKBlackcombBackgroundView _tickLayoutBounds](self, "_tickLayoutBounds");
  v10 = v9;
  v12 = v11;
  _LayoutConstants_13(self->_device, (uint64_t)v19);
  result = (v10 - a5) * 0.5 - v20;
  v14 = (v12 - a4) * 0.5 - v20;
  switch(a3)
  {
    case 0:
    case 6:
      _LayoutConstants_13(self->_device, (uint64_t)v17);
      result = v14 + v18;
      break;
    case 1:
    case 5:
    case 7:
    case 11:
      _LayoutConstants_13(self->_device, (uint64_t)v15);
      result = v14 / 0.866025404 - v16;
      break;
    case 2:
    case 4:
    case 8:
    case 10:
      result = result / 0.866025404;
      break;
    case 3:
    case 9:
      return result;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (BOOL)usesLongSideTicks
{
  return self->_usesLongSideTicks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTicks, 0);
  objc_storeStrong((id *)&self->_mediumTicks, 0);
  objc_storeStrong((id *)&self->_smallTicks, 0);
  objc_storeStrong((id *)&self->_smallTickCoveringLayer, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
