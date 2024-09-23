@implementation MTLumaDodgePillView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)backgroundLuminance
{
  return self->_backgroundLuminance;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0(&dword_20AE59000, a2, a3, "pill=%p dealloc'ed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)layoutSubviews
{
  _MTLumaDodgePillLowQualityEffectView *lowQualityEffectView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLumaDodgePillView;
  -[MTLumaDodgePillView layoutSubviews](&v4, sel_layoutSubviews);
  lowQualityEffectView = self->_lowQualityEffectView;
  -[MTLumaDodgePillView bounds](self, "bounds");
  -[_MTLumaDodgePillLowQualityEffectView setFrame:](lowQualityEffectView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bounceAnimationKeys, 0);
  objc_storeStrong((id *)&self->_lowQualityEffectView, 0);
  objc_destroyWeak((id *)&self->_backgroundLumninanceObserver);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (CGSize)suggestedSizeForContentWidth:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "suggestedSizeForContentWidth:withSettings:", self->_settings, a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setBackgroundLumninanceObserver:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  obj = a3;
  BSDispatchQueueAssertMain();
  if (!obj)
  {
    objc_storeWeak((id *)&self->_backgroundLumninanceObserver, 0);
    -[MTLumaDodgePillView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTracksLuma:", 0);

    self->_lumaIsValid = 0;
    self->_backgroundLuminance = 0;
    goto LABEL_5;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundLumninanceObserver);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_backgroundLumninanceObserver, obj);
    -[MTLumaDodgePillView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTracksLuma:", 1);

LABEL_5:
    v5 = obj;
  }

}

- (void)backdropLayer:(id)a3 didChangeLuma:(double)a4
{
  NSObject *v6;
  int64_t backgroundLuminance;
  _BOOL4 lumaIsValid;
  void *v9;
  int v10;
  int64_t v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  id WeakRetained;
  _MTLumaDodgePillLowQualityEffectView *lowQualityEffectView;
  double luma;
  void *v21;
  unint64_t backgroundLuminanceBias;
  NSObject *v23;
  void *v24;
  void *v25;
  int64_t style;
  int v27;
  _BOOL4 v28;
  _BYTE v29[24];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssertMain();
  v6 = MTLogLuma;
  if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_DEBUG))
    -[MTLumaDodgePillView backdropLayer:didChangeLuma:].cold.1((uint64_t)self, v6, a4);
  backgroundLuminance = self->_backgroundLuminance;
  lumaIsValid = self->_lumaIsValid;
  self->_luma = a4;
  -[MTLumaDodgePillView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "tracksLuma");

  if (!v10)
  {
    v12 = MTLogLuma;
    if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v29 = 134218240;
      *(_QWORD *)&v29[4] = self;
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = a4;
      _os_log_impl(&dword_20AE59000, v12, OS_LOG_TYPE_INFO, "pill=%p unexpected luma change (%.2f) - reporting unknown", v29, 0x16u);
    }
    v11 = 0;
    goto LABEL_19;
  }
  self->_lumaIsValid = 1;
  -[MTLumaDodgePillSettings brightLumaThreshold](self->_settings, "brightLumaThreshold");
  if (BSFloatGreaterThanOrEqualToFloat())
  {
    if (self->_backgroundLuminance == 2)
    {
      v11 = 2;
      goto LABEL_20;
    }
    v14 = MTLogLuma;
    if (!os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    *(_DWORD *)v29 = 134218240;
    *(_QWORD *)&v29[4] = self;
    *(_WORD *)&v29[12] = 2048;
    *(double *)&v29[14] = a4;
    v16 = "pill=%p responding to light luma change (%.2f)";
    goto LABEL_17;
  }
  -[MTLumaDodgePillSettings darkLumaThreshold](self->_settings, "darkLumaThreshold");
  v13 = BSFloatLessThanOrEqualToFloat();
  v11 = self->_backgroundLuminance;
  if (v13)
  {
    if (v11 == 1)
      goto LABEL_20;
    v14 = MTLogLuma;
    v11 = 1;
    if (!os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    *(_DWORD *)v29 = 134218240;
    *(_QWORD *)&v29[4] = self;
    *(_WORD *)&v29[12] = 2048;
    *(double *)&v29[14] = a4;
    v15 = "pill=%p responding to dark luma change (%.2f)";
    goto LABEL_14;
  }
  if (!v11)
  {
    if (self->_backgroundLuminanceBias)
    {
      v21 = (void *)MTLogLuma;
      if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
      {
        backgroundLuminanceBias = self->_backgroundLuminanceBias;
        v23 = v21;
        NSStringFromMTLumaDodgePillBackgroundLuminance(backgroundLuminanceBias);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v29 = 134218498;
        *(_QWORD *)&v29[4] = self;
        *(_WORD *)&v29[12] = 2048;
        *(double *)&v29[14] = a4;
        *(_WORD *)&v29[22] = 2114;
        v30 = v24;
        _os_log_impl(&dword_20AE59000, v23, OS_LOG_TYPE_INFO, "pill=%p ambiguous initial luma (%.2f) - biased %{public}@", v29, 0x20u);

      }
      v11 = self->_backgroundLuminanceBias;
      goto LABEL_19;
    }
    style = self->_style;
    if (style == 4)
    {
      v14 = MTLogLuma;
      v11 = 1;
      if (!os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      *(_DWORD *)v29 = 134218240;
      *(_QWORD *)&v29[4] = self;
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = a4;
      v15 = "pill=%p ambiguous initial luma (%.2f) - assuming dark since current style is white";
    }
    else
    {
      if (style == 3)
      {
        v14 = MTLogLuma;
        if (!os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
          goto LABEL_18;
        *(_DWORD *)v29 = 134218240;
        *(_QWORD *)&v29[4] = self;
        *(_WORD *)&v29[12] = 2048;
        *(double *)&v29[14] = a4;
        v16 = "pill=%p ambiguous initial luma (%.2f) - assuming light since current style is black";
LABEL_17:
        _os_log_impl(&dword_20AE59000, v14, OS_LOG_TYPE_INFO, v16, v29, 0x16u);
LABEL_18:
        v11 = 2;
        goto LABEL_19;
      }
      -[MTLumaDodgePillSettings initialLumaThreshold](self->_settings, "initialLumaThreshold");
      v27 = BSFloatGreaterThanOrEqualToFloat();
      v14 = MTLogLuma;
      v28 = os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO);
      if (v27)
      {
        if (!v28)
          goto LABEL_18;
        *(_DWORD *)v29 = 134218240;
        *(_QWORD *)&v29[4] = self;
        *(_WORD *)&v29[12] = 2048;
        *(double *)&v29[14] = a4;
        v16 = "pill=%p ambiguous initial luma (%.2f) - defaulting light";
        goto LABEL_17;
      }
      if (!v28)
      {
        v11 = 1;
        goto LABEL_19;
      }
      *(_DWORD *)v29 = 134218240;
      *(_QWORD *)&v29[4] = self;
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = a4;
      v15 = "pill=%p ambiguous initial luma (%.2f) - defaulting dark";
    }
LABEL_14:
    v11 = 1;
    _os_log_impl(&dword_20AE59000, v14, OS_LOG_TYPE_INFO, v15, v29, 0x16u);
LABEL_19:
    self->_backgroundLuminance = v11;
  }
LABEL_20:
  if (backgroundLuminance != v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundLumninanceObserver);
    objc_msgSend(WeakRetained, "lumaDodgePillDidDetectBackgroundLuminanceChange:", self);

  }
  if (self->_graphicsQuality == -100 && (!BSFloatEqualToFloat() || self->_lumaIsValid != lumaIsValid))
  {
    lowQualityEffectView = self->_lowQualityEffectView;
    if (self->_lumaIsValid)
      luma = self->_luma;
    else
      luma = 0.5;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", luma, 1.0, *(_OWORD *)v29, *(_QWORD *)&v29[16]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MTLumaDodgePillLowQualityEffectView setBackgroundColor:](lowQualityEffectView, "setBackgroundColor:", v25);

  }
}

+ (CGSize)suggestedSizeForContentWidth:(double)a3 withSettings:(id)a4
{
  id v5;
  void *v6;
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
  double v18;
  double v19;
  double v20;
  CGSize result;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  v8 = v7;
  v10 = v9;

  if (v8 <= v10)
    v11 = v8;
  else
    v11 = v10;
  if (BSFloatLessThanOrEqualToFloat())
  {
    objc_msgSend(v5, "minWidth");
  }
  else
  {
    if (v8 < v10)
      v8 = v10;
    if (!BSFloatGreaterThanOrEqualToFloat())
    {
      objc_msgSend(v5, "minWidth");
      v15 = v14;
      objc_msgSend(v5, "maxWidth");
      v13 = v15 + (a3 - v11) * ((v16 - v15) / (v8 - v11));
      goto LABEL_12;
    }
    objc_msgSend(v5, "maxWidth");
  }
  v13 = v12;
LABEL_12:
  objc_msgSend(v5, "height");
  v18 = v17;

  v19 = v13;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (MTLumaDodgePillView)initWithFrame:(CGRect)a3 settings:(id)a4 graphicsQuality:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  MTLumaDodgePillView *v14;
  MTLumaDodgePillView *v15;
  void *v16;
  _MTLumaDodgePillLowQualityEffectView *v17;
  uint64_t v18;
  _MTLumaDodgePillLowQualityEffectView *lowQualityEffectView;
  _MTLumaDodgePillLowQualityEffectView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  objc_super v42;
  void *v43;
  _QWORD v44[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v44[4] = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLumaDodgePillView.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings != nil"));

  }
  v42.receiver = self;
  v42.super_class = (Class)MTLumaDodgePillView;
  v14 = -[MTPillView initWithFrame:settings:](&v42, sel_initWithFrame_settings_, v13, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    v14->_style = 0;
    v14->_graphicsQuality = a5;
    objc_storeStrong((id *)&v14->_settings, a4);
    if (v15->_graphicsQuality)
    {
      -[MTLumaDodgePillView layer](v15, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setScale:", 0.5);

      v17 = [_MTLumaDodgePillLowQualityEffectView alloc];
      -[MTLumaDodgePillView bounds](v15, "bounds");
      v18 = -[_MTLumaDodgePillLowQualityEffectView initWithFrame:](v17, "initWithFrame:");
      lowQualityEffectView = v15->_lowQualityEffectView;
      v15->_lowQualityEffectView = (_MTLumaDodgePillLowQualityEffectView *)v18;

      v20 = v15->_lowQualityEffectView;
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.5, 1.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MTLumaDodgePillLowQualityEffectView setBackgroundColor:](v20, "setBackgroundColor:", v21);

      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A00]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setName:", CFSTR("colorMatrix"));
      -[_MTLumaDodgePillLowQualityEffectView layer](v15->_lowQualityEffectView, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFilters:", v24);

      -[MTLumaDodgePillView addSubview:](v15, "addSubview:", v15->_lowQualityEffectView);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A88]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setName:", CFSTR("homeAffordanceBase"));
      v25 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "imageNamed:inBundle:", CFSTR("lumaDodgePillMap"), v26);
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v22, "setValue:forKey:", objc_msgSend(v27, "CGImage"), CFSTR("inputColorMap"));

      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setName:", CFSTR("gaussianBlur"));
      objc_msgSend(v28, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("inputNormalizeEdges"));
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59D0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setName:", CFSTR("colorBrightness"));
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A10]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setName:", CFSTR("colorSaturate"));
      -[MTLumaDodgePillView layer](v15, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v22;
      v44[1] = v28;
      v44[2] = v29;
      v44[3] = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setFilters:", v32);

    }
    -[MTLumaDodgePillView _updateStyle](v15, "_updateStyle");
    v33 = MTLogLuma;
    if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_DEBUG))
      -[MTLumaDodgePillView initWithFrame:settings:graphicsQuality:].cold.1((uint64_t)v15, v33, v34, v35, v36, v37, v38, v39);
  }

  return v15;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((__supportedAnimationPropertyKey(v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MTLumaDodgePillView;
    v5 = -[MTLumaDodgePillView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((__supportedAnimationPropertyKey(v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MTLumaDodgePillView;
    v5 = -[MTLumaDodgePillView _shouldAnimatePropertyAdditivelyWithKey:](&v7, sel__shouldAnimatePropertyAdditivelyWithKey_, v4);
  }

  return v5;
}

- (void)_updateStyle
{
  int64_t style;
  __int128 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28[2];
  void *v29;
  _OWORD v30[5];

  if (self->_graphicsQuality)
  {
    style = self->_style;
    if (style == 4)
    {
      *(_OWORD *)v28 = xmmword_20AE69110;
      v27 = xmmword_20AE69160;
      v26 = xmmword_20AE69170;
      v4 = xmmword_20AE69180;
    }
    else
    {
      if (style != 3)
      {
        v26 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 32);
        v27 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 48);
        *(_OWORD *)v28 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 64);
        -[_MTLumaDodgePillLowQualityEffectView layer](self->_lowQualityEffectView, "layer", *MEMORY[0x24BDE53E8], *(_QWORD *)(MEMORY[0x24BDE53E8] + 8), *(_QWORD *)(MEMORY[0x24BDE53E8] + 16), *(_QWORD *)(MEMORY[0x24BDE53E8] + 24));
        goto LABEL_10;
      }
      *(_OWORD *)v28 = xmmword_20AE69110;
      v27 = xmmword_20AE69120;
      v26 = xmmword_20AE69130;
      v4 = xmmword_20AE69140;
    }
    -[_MTLumaDodgePillLowQualityEffectView layer](self->_lowQualityEffectView, "layer", 0xBE1645A2BD991687, 3169417429, v4);
LABEL_10:
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v24;
    v30[1] = v25;
    v30[2] = v26;
    v30[3] = v27;
    v30[4] = *(_OWORD *)v28;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v30, "{CAColorMatrix=ffffffffffffffffffff}");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKeyPath:", v7, CFSTR("filters.colorMatrix.inputColorMatrix"));

    return;
  }
  switch(self->_style)
  {
    case 1:
      -[MTLumaDodgePillSettings thinSettings](self->_settings, "thinSettings");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[MTLumaDodgePillSettings graySettings](self->_settings, "graySettings");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[MTLumaDodgePillSettings blackSettings](self->_settings, "blackSettings");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[MTLumaDodgePillSettings whiteSettings](self->_settings, "whiteSettings");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[MTLumaDodgePillSettings noneSettings](self->_settings, "noneSettings");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v29 = (void *)v5;
  -[MTLumaDodgePillView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[MTLumaDodgePillSettings colorAddWhiteness](self->_settings, "colorAddWhiteness");
  v11 = v10;
  objc_msgSend(v29, "colorAddOpacity");
  objc_msgSend(v9, "numberWithDouble:", v11 * v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKeyPath:", v13, CFSTR("filters.homeAffordanceBase.inputAddWhite"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v29, "lumaMapPlusColorOpacity");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKeyPath:", v15, CFSTR("filters.homeAffordanceBase.inputAmount"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v29, "overlayBlendOpacity");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKeyPath:", v17, CFSTR("filters.homeAffordanceBase.inputOverlayOpacity"));

  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v29, "blur");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKeyPath:", v19, CFSTR("filters.gaussianBlur.inputRadius"));

  v20 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v29, "brightness");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKeyPath:", v21, CFSTR("filters.colorBrightness.inputAmount"));

  v22 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v29, "saturation");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKeyPath:", v23, CFSTR("filters.colorSaturate.inputAmount"));

}

- (void)setStyle:(int64_t)a3
{
  void *v5;
  unint64_t style;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  MTLumaDodgePillView *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssertMain();
  if (self->_style != a3)
  {
    v5 = (void *)MTLogLuma;
    if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
    {
      style = self->_style;
      v7 = v5;
      NSStringFromMTLumaDodgePillStyle(style);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromMTLumaDodgePillStyle(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218498;
      v11 = self;
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_20AE59000, v7, OS_LOG_TYPE_INFO, "pill=%p changing style from %{public}@ to %{public}@", (uint8_t *)&v10, 0x20u);

    }
    self->_style = a3;
    -[MTLumaDodgePillView _updateStyle](self, "_updateStyle");
  }
}

- (void)setBackgroundLuminanceBias:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  self->_backgroundLuminanceBias = a3;
}

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
    MTRegisterMaterialKitLogging();
}

- (MTLumaDodgePillView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  return -[MTLumaDodgePillView initWithFrame:settings:graphicsQuality:](self, "initWithFrame:settings:graphicsQuality:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  -[MTLumaDodgePillSettings maxWidth](self->_settings, "maxWidth", a3.width, a3.height);
  v6 = v5;
  -[MTLumaDodgePillSettings minWidth](self->_settings, "minWidth");
  if (v7 < width)
    v7 = width;
  if (v6 <= v7)
    v8 = v6;
  else
    v8 = v7;
  -[MTLumaDodgePillSettings height](self->_settings, "height");
  v10 = v9;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGRect v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[MTLumaDodgePillView frame](self, "frame");
  NSStringFromCGRect(v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromMTLumaDodgePillStyle(self->_style);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromMTLumaDodgePillBackgroundLuminance(self->_backgroundLuminance);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p frame=%@ style=%@ backgroundLuminance=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  unsigned int bounceAnimationsInFlight;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *bounceAnimationKeys;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssertMain();
  bounceAnimationsInFlight = self->_bounceAnimationsInFlight;
  if (bounceAnimationsInFlight < 2)
  {
    self->_bounceAnimationsInFlight = 0;
    -[MTLumaDodgePillView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_bounceAnimationKeys;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "removeAnimationForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    bounceAnimationKeys = self->_bounceAnimationKeys;
    self->_bounceAnimationKeys = 0;

  }
  else
  {
    self->_bounceAnimationsInFlight = bounceAnimationsInFlight - 1;
  }
}

+ (BOOL)supportsBackgroundLuminanceObserving
{
  return 1;
}

- (void)resetBackgroundLuminanceHysteresis
{
  NSObject *v3;
  void *v4;
  int v5;
  MTLumaDodgePillView *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssertMain();
  v3 = MTLogLuma;
  if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_20AE59000, v3, OS_LOG_TYPE_INFO, "pill=%p resetting luma hysteresis by request", (uint8_t *)&v5, 0xCu);
  }
  self->_backgroundLuminance = 0;
  if (self->_lumaIsValid)
  {
    -[MTLumaDodgePillView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLumaDodgePillView backdropLayer:didChangeLuma:](self, "backdropLayer:didChangeLuma:", v4, self->_luma);

  }
}

- (void)bounce
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *bounceAnimationKeys;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  id v15;

  BSDispatchQueueAssertMain();
  v3 = ++bounce___unique;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bounce-%i.up"), bounce___unique);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v4, "copy");

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("position.y"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdditive:", 1);
  objc_msgSend(v5, "setMass:", 1.0);
  objc_msgSend(v5, "setStiffness:", 300.0);
  objc_msgSend(v5, "setDamping:", 13.0);
  objc_msgSend(v5, "setFromValue:", &unk_24C3E13B8);
  objc_msgSend(v5, "setToValue:", &unk_24C3E13C8);
  v6 = *MEMORY[0x24BDE5978];
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "settlingDuration");
  objc_msgSend(v5, "setDuration:");
  v7 = *MEMORY[0x24BDE5858];
  objc_msgSend(v5, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bounce-%i.dn"), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("position.y"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdditive:", 1);
  objc_msgSend(v10, "setMass:", 1.0);
  objc_msgSend(v10, "setStiffness:", 300.0);
  objc_msgSend(v10, "setDamping:", 13.0);
  objc_msgSend(v10, "setFromValue:", &unk_24C3E13B8);
  objc_msgSend(v10, "setToValue:", &unk_24C3E13D8);
  objc_msgSend(v10, "setFillMode:", v6);
  objc_msgSend(v10, "setRemovedOnCompletion:", 0);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "settlingDuration");
  objc_msgSend(v10, "setDuration:");
  objc_msgSend(v10, "setBeginTime:", 0.2);
  objc_msgSend(v10, "setBeginTimeMode:", v7);
  self->_bounceAnimationsInFlight += 2;
  bounceAnimationKeys = self->_bounceAnimationKeys;
  if (!bounceAnimationKeys)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_bounceAnimationKeys;
    self->_bounceAnimationKeys = v12;

    bounceAnimationKeys = self->_bounceAnimationKeys;
  }
  -[NSMutableArray addObject:](bounceAnimationKeys, "addObject:", v15);
  -[NSMutableArray addObject:](self->_bounceAnimationKeys, "addObject:", v9);
  -[MTLumaDodgePillView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v5, v15);
  objc_msgSend(v14, "addAnimation:forKey:", v10, v9);

}

- (double)suggestedEdgeSpacing
{
  double result;

  -[MTLumaDodgePillSettings edgeSpacing](self->_settings, "edgeSpacing");
  return result;
}

- (MTLumaDodgePillBackgroundLuminanceObserver)backgroundLumninanceObserver
{
  return (MTLumaDodgePillBackgroundLuminanceObserver *)objc_loadWeakRetained((id *)&self->_backgroundLumninanceObserver);
}

- (int64_t)backgroundLuminanceBias
{
  return self->_backgroundLuminanceBias;
}

- (void)initWithFrame:(uint64_t)a3 settings:(uint64_t)a4 graphicsQuality:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AE59000, a2, a3, "pill=%p initialized", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)backdropLayer:(double)a3 didChangeLuma:.cold.1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_20AE59000, a2, OS_LOG_TYPE_DEBUG, "pill=%p luma change (%.2f)", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
