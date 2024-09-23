@implementation AXUISettingsTickMarkSlider

- (AXUISettingsTickMarkSlider)initWithFrame:(CGRect)a3
{
  AXUISettingsTickMarkSlider *v3;
  AXUISettingsTickMarkSlider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUISettingsTickMarkSlider;
  v3 = -[PSSegmentableSlider initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AXUISettingsTickMarkSlider setContentMode:](v3, "setContentMode:", 3);
    -[AXUISettingsTickMarkSlider setSemanticContentAttribute:](v4, "setSemanticContentAttribute:", 2);
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGContext *CurrentContext;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  float v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v57 = *MEMORY[0x1E0C80C00];
  -[AXUISettingsTickMarkSlider bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v59 = CGRectInset(v58, 2.0, 0.0);
  -[AXUISettingsTickMarkSlider trackRectForBounds:](self, "trackRectForBounds:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  -[AXUISettingsTickMarkSlider trackFillColor](self, "trackFillColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[AXUISettingsTickMarkSlider trackFillColor](self, "trackFillColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.596078431, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "set");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v5, v7, v9, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLineCapStyle:", 1);
  objc_msgSend(v15, "setLineJoinStyle:", 1);
  objc_msgSend(v15, "fill");
  UIGraphicsPopContext();
  UIGraphicsPushContext(CurrentContext);
  v16 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  objc_msgSend(v16, "setLineWidth:", v11);
  objc_msgSend(v16, "setLineCapStyle:", 1);
  objc_msgSend(v16, "setLineJoinStyle:", 1);
  -[AXUISettingsTickMarkSlider value](self, "value");
  v18 = v17;
  -[AXUISettingsTickMarkSlider ticks](self, "ticks");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  if (v21 >= v18)
  {

  }
  else
  {
    -[AXUISettingsTickMarkSlider postTickColor](self, "postTickColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_9;
    -[AXUISettingsTickMarkSlider postTickColor](self, "postTickColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "set");
  }

LABEL_9:
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[AXUISettingsTickMarkSlider ticks](self, "ticks", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v53;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v53 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v27);
        -[AXUISettingsTickMarkSlider tickHeight](self, "tickHeight");
        if (v29 != 0.0)
          -[AXUISettingsTickMarkSlider tickHeight](self, "tickHeight");
        objc_msgSend(v28, "floatValue");
        v60.origin.x = v5;
        v60.origin.y = v7;
        v60.size.width = v9;
        v60.size.height = v11;
        CGRectGetMinX(v60);
        v61.origin.x = v5;
        v61.origin.y = v7;
        v61.size.width = v9;
        v61.size.height = v11;
        CGRectGetWidth(v61);
        PSRoundToPixel();
        v31 = v30;
        PSRoundToPixel();
        objc_msgSend(v16, "moveToPoint:", v31, v32);
        PSRoundToPixel();
        objc_msgSend(v16, "addLineToPoint:", v31, v33);
        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v25);
  }

  objc_msgSend(v16, "closePath");
  objc_msgSend(v16, "stroke");
  UIGraphicsPopContext();
  UIGraphicsPushContext(CurrentContext);
  -[AXUISettingsTickMarkSlider value](self, "value");
  v35 = v34;
  -[AXUISettingsTickMarkSlider ticks](self, "ticks");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "firstObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "doubleValue");
  if (v38 >= v35)
  {

    goto LABEL_22;
  }
  -[AXUISettingsTickMarkSlider postTickColor](self, "postTickColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[AXUISettingsTickMarkSlider ticks](self, "ticks");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    v43 = v9 * v42;

    v44 = v5 + v43;
    -[AXUISettingsTickMarkSlider value](self, "value");
    v46 = v45;
    -[AXUISettingsTickMarkSlider ticks](self, "ticks");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "firstObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "doubleValue");
    v50 = v9 * (v46 - v49);

    -[AXUISettingsTickMarkSlider postTickColor](self, "postTickColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "set");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v44, v7, v50, v11);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setLineCapStyle:", 1);
    objc_msgSend(v36, "setLineJoinStyle:", 1);
    objc_msgSend(v36, "fill");
LABEL_22:

  }
  UIGraphicsPopContext();

}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
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
  objc_super v17;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)AXUISettingsTickMarkSlider;
  -[PSSegmentableSlider thumbRectForBounds:trackRect:value:](&v17, sel_thumbRectForBounds_trackRect_value_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, LODWORD(a5));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AXUISettingsTickMarkSlider minimumValue](self, "minimumValue");
  -[AXUISettingsTickMarkSlider maximumValue](self, "maximumValue");
  -[AXUISettingsTickMarkSlider minimumValue](self, "minimumValue");
  PSRoundToPixel();
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)accessibilityLabel
{
  return AXUILocalizedStringForKey(CFSTR("LEFT_RIGHT_BALANCE_SPOKEN"));
}

- (void)setTicks:(id)a3
{
  objc_storeStrong((id *)&self->_ticks, a3);
  -[AXUISettingsTickMarkSlider setNeedsDisplay](self, "setNeedsDisplay");
}

- (NSArray)ticks
{
  return self->_ticks;
}

- (UIColor)postTickColor
{
  return self->_postTickColor;
}

- (void)setPostTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_postTickColor, a3);
}

- (UIColor)trackFillColor
{
  return self->_trackFillColor;
}

- (void)setTrackFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_trackFillColor, a3);
}

- (double)tickHeight
{
  return self->_tickHeight;
}

- (void)setTickHeight:(double)a3
{
  self->_tickHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackFillColor, 0);
  objc_storeStrong((id *)&self->_postTickColor, 0);
  objc_storeStrong((id *)&self->_ticks, 0);
}

@end
