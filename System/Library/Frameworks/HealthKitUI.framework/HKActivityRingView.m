@implementation HKActivityRingView

- (HKActivityRingView)initWithFrame:(CGRect)a3
{
  HKActivityRingView *v3;
  HKActivityRingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKActivityRingView;
  v3 = -[HKActivityRingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HKActivityRingView _setUpAfterInit](v3, "_setUpAfterInit");
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKActivityRingView;
  -[HKActivityRingView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[HKActivityRingView _updateMaskPath](self, "_updateMaskPath");
}

- (void)_updateMaskPath
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  id v8;
  CGRect v9;
  CGRect v10;

  -[HKActivityRingView bounds](self, "bounds");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  CGRectGetWidth(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGRectGetHeight(v10);
  v7 = (void *)MEMORY[0x24BEBD420];
  -[ARUIRingsView bounds](self->_ringsView, "bounds");
  objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKShapeView setPath:](self->_maskView, "setPath:", v8);

}

- (void)_setUpAfterInit
{
  void *v3;

  self->_ringInsetPercentage = 0.15;
  self->_emptyRingAlpha = 0.15;
  -[HKActivityRingView setOpaque:](self, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivityRingView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[HKActivityRingView _setUpRingsView](self, "_setUpRingsView");
  -[HKActivityRingView setActivitySummary:animated:](self, "setActivitySummary:animated:", 0, 0);
  -[HKActivityRingView _updateMaskPath](self, "_updateMaskPath");
}

- (void)_setUpRingsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  ARUIRenderer *renderer;
  id v25;
  ARUIRingsView *v26;
  ARUIRingsView *ringsView;
  double v28;
  float v29;
  void *v30;
  double v31;
  ARUIRingsView *v32;
  void *v33;
  _HKShapeView *v34;
  _HKShapeView *maskView;
  void *v36;
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE01CA8], "briskColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE01CA8], "sedentaryColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gradientDarkColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v6;
  objc_msgSend(v4, "gradientDarkColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v7;
  objc_msgSend(v5, "gradientDarkColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v3;
  objc_msgSend(v3, "gradientLightColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v10;
  objc_msgSend(v4, "gradientLightColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v11;
  objc_msgSend(v5, "gradientLightColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE01CC0], "activityRingGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 1132134400;
  objc_msgSend(v14, "setGroupDiameter:", v15);
  LODWORD(v16) = 2.0;
  objc_msgSend(v14, "setInterspacing:", v16);
  LODWORD(v17) = 27.0;
  objc_msgSend(v14, "setThickness:", v17);
  v18 = 0;
  v19 = -1;
  do
  {
    v20 = objc_msgSend(v9, "count") + v19;
    LODWORD(v21) = 0;
    objc_msgSend(v14, "setPercentage:ofRingAtIndex:animated:", v18, 0, v21);
    objc_msgSend(v9, "objectAtIndexedSubscript:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTopColor:bottomColor:ofRingAtIndex:", v22, v23, v18);

    ++v18;
    --v19;
  }
  while (v18 != 3);
  renderer = self->_renderer;
  v25 = objc_alloc(MEMORY[0x24BE01CD8]);
  if (renderer)
    v26 = (ARUIRingsView *)objc_msgSend(v25, "initWithRingGroup:renderer:", v14, self->_renderer);
  else
    v26 = (ARUIRingsView *)objc_msgSend(v25, "initWithRingGroup:", v14);
  ringsView = self->_ringsView;
  self->_ringsView = v26;

  -[HKActivityRingView _emptyRingAlpha](self, "_emptyRingAlpha");
  v29 = v28;
  -[ARUIRingsView ringGroup](self->_ringsView, "ringGroup");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v31 = v29;
  objc_msgSend(v30, "setEmptyOpacity:", v31);

  -[ARUIRingsView setPaused:](self->_ringsView, "setPaused:", 1);
  v32 = self->_ringsView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRingsView setBackgroundColor:](v32, "setBackgroundColor:", v33);

  -[ARUIRingsView setOpaque:](self->_ringsView, "setOpaque:", 1);
  -[HKActivityRingView addSubview:](self, "addSubview:", self->_ringsView);
  v34 = objc_alloc_init(_HKShapeView);
  maskView = self->_maskView;
  self->_maskView = v34;

  -[ARUIRingsView setMaskView:](self->_ringsView, "setMaskView:", self->_maskView);
}

- (double)_emptyRingAlpha
{
  return self->_emptyRingAlpha;
}

- (void)setActivitySummary:(HKActivitySummary *)activitySummary animated:(BOOL)animated
{
  -[HKActivityRingView _setActivitySummary:animated:completion:](self, "_setActivitySummary:animated:completion:", activitySummary, animated, 0);
}

- (void)_setActivityRingViewBackgroundColor:(id)a3
{
  self->_backgroundTransparencyOrColorSPIUsed = 1;
  -[ARUIRingsView setBackgroundColor:](self->_ringsView, "setBackgroundColor:", a3);
}

- (void)layoutSubviews
{
  double x;
  double y;
  CGFloat height;
  double Width;
  double v7;
  double v8;
  double v9;
  double v10;
  ARUIRingsView *ringsView;
  double MidX;
  objc_super v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v13.receiver = self;
  v13.super_class = (Class)HKActivityRingView;
  -[HKActivityRingView layoutSubviews](&v13, sel_layoutSubviews);
  if (MEMORY[0x2199CDC74](0x7E00901FFFFFFFFLL))
    -[HKActivityRingView _updateRingsViewDiameter](self, "_updateRingsViewDiameter");
  else
    -[HKActivityRingView _updateRingsViewDiameterLegacy](self, "_updateRingsViewDiameterLegacy");
  -[HKActivityRingView bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  height = v14.size.height;
  Width = CGRectGetWidth(v14);
  v7 = HKUIOnePixel();
  if (Width < v7)
    Width = v7;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = Width;
  v15.size.height = height;
  v8 = CGRectGetHeight(v15);
  v9 = HKUIOnePixel();
  if (v8 >= v9)
    v10 = v8;
  else
    v10 = v9;
  -[ARUIRingsView setBounds:](self->_ringsView, "setBounds:", x, y, Width, v10);
  ringsView = self->_ringsView;
  -[HKActivityRingView bounds](self, "bounds");
  MidX = CGRectGetMidX(v16);
  -[HKActivityRingView bounds](self, "bounds");
  -[ARUIRingsView setCenter:](ringsView, "setCenter:", MidX, CGRectGetMidY(v17));
  -[HKActivityRingView _updateMaskPath](self, "_updateMaskPath");
}

- (void)_updateRingsViewDiameter
{
  double Width;
  double Height;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HKActivityRingView bounds](self, "bounds");
  Width = CGRectGetWidth(v28);
  -[HKActivityRingView bounds](self, "bounds");
  Height = CGRectGetHeight(v29);
  if (Width >= Height)
    Width = Height;
  +[_HKActivityRingViewSizingDirective sortedRingRatioDirectives](_HKActivityRingViewSizingDirective, "sortedRingRatioDirectives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      v12 = 0;
      v13 = v6;
      v6 = v10;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v14 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v12);

        objc_msgSend(v14, "width", (_QWORD)v22);
        if (Width < v15)
        {
          v6 = v13;
          goto LABEL_14;
        }
        v6 = v14;

        ++v12;
        v13 = v6;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v10 = v6;
      v14 = v6;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  objc_msgSend(v6, "width");
  if (HKUIEqualDoubles(floor(Width), v16))
  {
    objc_msgSend(v6, "outerRingOffset");
    v18 = Width - v17;
    objc_msgSend(v6, "ringInterspacing");
    v20 = v19;
    objc_msgSend(v6, "ringThickness");
    -[HKActivityRingView _setRingDiameter:ringInterspacing:ringThickness:](self, "_setRingDiameter:ringInterspacing:ringThickness:", v18, v20, v21);
  }
  else
  {
    -[HKActivityRingView _updateAndInterpolateRingsViewDiameterForWidth:lowerDirective:higherDirective:](self, "_updateAndInterpolateRingsViewDiameterForWidth:lowerDirective:higherDirective:", v6, v14, Width);
  }

}

- (void)_updateAndInterpolateRingsViewDiameterForWidth:(double)a3 lowerDirective:(id)a4 higherDirective:(id)a5
{
  id v8;
  id v9;
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
  double v24;
  double v25;
  double v26;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "width");
  v11 = v10;
  objc_msgSend(v9, "width");
  v13 = v11 - v12;
  objc_msgSend(v9, "width");
  v15 = (a3 - v14) / v13;
  objc_msgSend(v9, "ringThickness");
  v17 = v16;
  objc_msgSend(v8, "ringThickness");
  v19 = v17 + (v18 - v17) * v15;
  objc_msgSend(v9, "ringInterspacing");
  v21 = v20;
  objc_msgSend(v8, "ringInterspacing");
  v23 = v22;

  v24 = v21 + (v23 - v21) * v15;
  objc_msgSend(v9, "outerRingOffset");
  v26 = v25;

  -[HKActivityRingView _setRingDiameter:ringInterspacing:ringThickness:](self, "_setRingDiameter:ringInterspacing:ringThickness:", a3 - v26, v24, v19);
}

- (void)_setRingDiameter:(double)a3 ringInterspacing:(double)a4 ringThickness:(double)a5
{
  double v6;
  double v7;
  double v8;
  id v9;

  -[ARUIRingsView ringGroup](self->_ringsView, "ringGroup");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  *(float *)&v6 = v6;
  objc_msgSend(v9, "setGroupDiameter:", v6);
  UIRoundToViewScale();
  *(float *)&v7 = v7;
  objc_msgSend(v9, "setInterspacing:", v7);
  UIRoundToViewScale();
  *(float *)&v8 = v8;
  objc_msgSend(v9, "setThickness:", v8);
  -[HKActivityRingView setActivitySummary:animated:](self, "setActivitySummary:animated:", self->_activitySummary, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySummary, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

- (HKActivityRingView)initWithFrame:(CGRect)a3 renderer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  HKActivityRingView *v11;
  HKActivityRingView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKActivityRingView;
  v11 = -[HKActivityRingView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_renderer, a4);
    -[HKActivityRingView _setUpAfterInit](v12, "_setUpAfterInit");
  }

  return v12;
}

- (HKActivityRingView)initWithCoder:(id)a3
{
  HKActivityRingView *v3;
  HKActivityRingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKActivityRingView;
  v3 = -[HKActivityRingView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HKActivityRingView _setUpAfterInit](v3, "_setUpAfterInit");
  return v4;
}

- (void)setActivitySummary:(HKActivitySummary *)activitySummary
{
  -[HKActivityRingView setActivitySummary:animated:](self, "setActivitySummary:animated:", activitySummary, 0);
}

- (void)_setEmptyRingAlpha:(double)a3
{
  double v3;
  float v4;
  double v5;
  id v6;

  v3 = fmin(a3, 1.0);
  if (v3 < 0.0)
    v3 = 0.0;
  self->_emptyRingAlpha = v3;
  v4 = v3;
  -[ARUIRingsView ringGroup](self->_ringsView, "ringGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v4;
  objc_msgSend(v6, "setEmptyOpacity:", v5);

}

- (void)_setActivityRingViewBackgroundTransparent:(BOOL)a3
{
  BOOL v4;
  _HKShapeView *maskView;

  self->_backgroundTransparencyOrColorSPIUsed = 1;
  v4 = !a3;
  -[ARUIRingsView setOpaque:](self->_ringsView, "setOpaque:", !a3);
  if (v4)
    maskView = 0;
  else
    maskView = self->_maskView;
  -[ARUIRingsView setMaskView:](self->_ringsView, "setMaskView:", maskView);
}

- (void)_setShouldBypassApplicationStateChecking:(BOOL)a3
{
  self->_shouldBypassApplicationStateChecking = 1;
  -[ARUIRingsView setShouldBypassApplicationStateChecking:](self->_ringsView, "setShouldBypassApplicationStateChecking:", a3);
}

- (void)_displayIconsForWheelchairUser:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;

  -[ARUIRingsView ringGroup](self->_ringsView, "ringGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(MEMORY[0x24BE01CE0], "wheelchairSpriteSheet");
  else
    objc_msgSend(MEMORY[0x24BE01CE0], "defaultSpriteSheet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpriteSheet:", v6);

  -[ARUIRingsView ringGroup](self->_ringsView, "ringGroup");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playSpriteAnimation");

}

- (void)_setActivitySummary:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  void *v10;
  int v11;
  ARUIRingsView *ringsView;
  ARUIRingsView *v13;
  void *v14;
  id v15;

  v6 = a4;
  v15 = a3;
  objc_storeStrong((id *)&self->_activitySummary, a3);
  v9 = a5;
  -[ARUIRingsView hk_configureWithActivitySummary:animated:completion:](self->_ringsView, "hk_configureWithActivitySummary:animated:completion:", v15, v6, v9);

  v10 = v15;
  if (!self->_backgroundTransparencyOrColorSPIUsed)
  {
    v11 = objc_msgSend(v15, "isPaused");
    ringsView = self->_ringsView;
    if (v11)
    {
      -[ARUIRingsView setOpaque:](ringsView, "setOpaque:", 0);
      v13 = self->_ringsView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    }
    else
    {
      -[ARUIRingsView setOpaque:](ringsView, "setOpaque:", 1);
      v13 = self->_ringsView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARUIRingsView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    v10 = v15;
  }

}

- (id)_snapshotImage
{
  return (id)-[ARUIRingsView snapshot](self->_ringsView, "snapshot");
}

- (double)_ringDiameter
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  CGRect v10;
  CGRect v11;

  -[HKActivityRingView bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v7 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v8 = CGRectGetHeight(v11);
  if (v7 < v8)
    v8 = v7;
  return HKUIFloorToScreenScale(v8 * (1.0 - self->_ringInsetPercentage));
}

- (void)_updateRingsViewDiameterLegacy
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[HKActivityRingView _ringDiameter](self, "_ringDiameter");
  if (v3 >= 60.0)
    v4 = 0.3;
  else
    v4 = v3 / 60.0 * 0.3;
  v5 = (v3 - v3 * fmax(v4, 0.25) + -8.0) / 6.0;
  if (v5 < 0.0)
    v5 = 0.0;
  if (v5 >= 2.0)
    v6 = v5;
  else
    v6 = (v5 + 2.0) * 0.5;
  if (v5 >= 2.0)
    v7 = 2.0;
  else
    v7 = (v5 + 2.0) * 0.5;
  -[HKActivityRingView _setRingDiameter:ringInterspacing:ringThickness:](self, "_setRingDiameter:ringInterspacing:ringThickness:", v3, v7, v6);
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKActivityRingView;
  -[HKActivityRingView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[HKActivityRingView _updateMaskPath](self, "_updateMaskPath");
}

- (HKActivitySummary)activitySummary
{
  return self->_activitySummary;
}

- (double)_ringInsetPercentage
{
  return self->_ringInsetPercentage;
}

- (void)_setRingInsetPercentage:(double)a3
{
  self->_ringInsetPercentage = a3;
}

- (BOOL)_shouldBypassApplicationStateChecking
{
  return self->_shouldBypassApplicationStateChecking;
}

@end
