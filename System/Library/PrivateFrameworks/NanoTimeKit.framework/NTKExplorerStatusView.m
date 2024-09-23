@implementation NTKExplorerStatusView

- (NTKExplorerStatusView)initWithFrame:(CGRect)a3
{
  return -[NTKExplorerStatusView initWithFrame:dotLayoutConstraints:dotColorOptions:](self, "initWithFrame:dotLayoutConstraints:dotColorOptions:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NTKExplorerStatusView)initWithFrame:(CGRect)a3 dotLayoutConstraints:(id)a4 dotColorOptions:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  NTKExplorerStatusView *v14;
  NTKExplorerStatusView *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *dotLayers;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)NTKExplorerStatusView;
  v14 = -[NTKExplorerStatusView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dotLayoutConstraints, a4);
    objc_storeStrong((id *)&v15->_dotColorOptions, a5);
    v16 = 4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      +[_ExplorerDotLayer layer](_ExplorerDotLayer, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);
      -[NTKExplorerStatusView layer](v15, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSublayer:", v18);

      --v16;
    }
    while (v16);
    v20 = objc_msgSend(v17, "copy");
    dotLayers = v15->_dotLayers;
    v15->_dotLayers = (NSArray *)v20;

    -[NTKExplorerStatusView _layoutDotLayers](v15, "_layoutDotLayers");
  }

  return v15;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[NTKExplorerStatusView dotDiameter](self, "dotDiameter", a3.width, a3.height);
  v5 = v4;
  -[NTKExplorerStatusView dotSpacing](self, "dotSpacing");
  v7 = v6 * 3.0 + v5 * 4.0;
  v8 = v5;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setSignalStrengthBars:(int64_t)a3
{
  if (self->_signalStrengthBars != a3)
  {
    self->_signalStrengthBars = a3;
    -[NTKExplorerStatusView _updateDotFillStates](self, "_updateDotFillStates");
  }
}

- (void)setShowsFullSignalStrength:(BOOL)a3
{
  if (self->_showsFullSignalStrength != a3)
  {
    self->_showsFullSignalStrength = a3;
    -[NTKExplorerStatusView _updateDotFillStates](self, "_updateDotFillStates");
  }
}

- (void)_updateDotFillStates
{
  NSArray *dotLayers;
  _QWORD v3[5];

  dotLayers = self->_dotLayers;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__NTKExplorerStatusView__updateDotFillStates__block_invoke;
  v3[3] = &unk_1E6BD08E8;
  v3[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](dotLayers, "enumerateObjectsUsingBlock:", v3);
}

void __45__NTKExplorerStatusView__updateDotFillStates__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  id v12;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  if (*(_BYTE *)(v6 + 424))
  {
    objc_msgSend(v5, "connectivityDotLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "dotDiameter");
    v10 = v11 * 0.5;
    goto LABEL_6;
  }
  v8 = a3 + 1;
  v9 = *(_QWORD *)(v6 + 456);
  objc_msgSend(v5, "connectivityDotLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 <= v9)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "dotBorderWidth");
LABEL_6:
  objc_msgSend(v7, "setBorderWidth:", v10);

}

- (void)setDotLayoutConstraints:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NTKExplorerDotLayoutConstraints isEqual:](self->_dotLayoutConstraints, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_dotLayoutConstraints, a3);
    -[NTKExplorerStatusView _layoutDotLayers](self, "_layoutDotLayers");
  }

}

- (void)setDotColorOptions:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NTKExplorerDotColorOptions isEqual:](self->_dotColorOptions, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dotColorOptions, a3);
    -[NTKExplorerStatusView _layoutDotLayers](self, "_layoutDotLayers");
  }

}

- (void)setState:(int64_t)a3
{
  -[NTKExplorerStatusView setState:animated:](self, "setState:animated:", a3, 0);
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_state != a3)
  {
    -[NTKExplorerStatusView _applyState:animated:](self, "_applyState:animated:", a3, v4);
    self->_state = a3;
  }
}

- (void)_applyState:(int64_t)a3 animated:(BOOL)a4
{
  double v5;
  unint64_t v6;

  if (objc_msgSend((id)objc_opt_class(), "_fixedDotPositionForState:", a3))
    v5 = 1.0;
  else
    v5 = 0.0;
  if (-[NSArray count](self->_dotLayers, "count"))
  {
    v6 = 0;
    do
      -[NTKExplorerStatusView _applyDotRotationFraction:forDotAtIndex:](self, "_applyDotRotationFraction:forDotAtIndex:", v6++, v5);
    while (v6 < -[NSArray count](self->_dotLayers, "count"));
  }
}

+ (unint64_t)_fixedDotPositionForState:(int64_t)a3
{
  return a3 != 1;
}

- (double)dotDiameter
{
  double v3;
  void *dotLayoutConstraints;
  double result;

  -[NTKExplorerDotLayoutConstraints dotDiameter](self->_dotLayoutConstraints, "dotDiameter");
  if (v3 <= 2.22044605e-16)
    dotLayoutConstraints = (void *)objc_opt_class();
  else
    dotLayoutConstraints = self->_dotLayoutConstraints;
  objc_msgSend(dotLayoutConstraints, "dotDiameter");
  return result;
}

- (double)dotBorderWidth
{
  double v3;
  void *dotLayoutConstraints;
  double result;

  -[NTKExplorerDotLayoutConstraints dotBorderWidth](self->_dotLayoutConstraints, "dotBorderWidth");
  if (v3 <= 2.22044605e-16)
    dotLayoutConstraints = (void *)objc_opt_class();
  else
    dotLayoutConstraints = self->_dotLayoutConstraints;
  objc_msgSend(dotLayoutConstraints, "dotBorderWidth");
  return result;
}

- (double)dotSpacing
{
  double v3;
  void *dotLayoutConstraints;
  double result;

  -[NTKExplorerDotLayoutConstraints dotSpacing](self->_dotLayoutConstraints, "dotSpacing");
  if (v3 <= 2.22044605e-16)
    dotLayoutConstraints = (void *)objc_opt_class();
  else
    dotLayoutConstraints = self->_dotLayoutConstraints;
  objc_msgSend(dotLayoutConstraints, "dotSpacing");
  return result;
}

- (double)noServiceDotHeight
{
  double v3;
  void *dotLayoutConstraints;
  double result;

  -[NTKExplorerDotLayoutConstraints noServiceDotHeight](self->_dotLayoutConstraints, "noServiceDotHeight");
  if (v3 <= 2.22044605e-16)
    dotLayoutConstraints = (void *)objc_opt_class();
  else
    dotLayoutConstraints = self->_dotLayoutConstraints;
  objc_msgSend(dotLayoutConstraints, "noServiceDotHeight");
  return result;
}

- (UIColor)connectedDotColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NTKExplorerDotColorOptions connectedDotColor](self->_dotColorOptions, "connectedDotColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "connectedDotColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (UIColor *)v5;
}

- (UIColor)connectedDotBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (self->_tritiumIsOn)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKExplorerDotColorOptions connectedDotBackgroundColor](self->_dotColorOptions, "connectedDotBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v2 = v5;

  }
  return (UIColor *)v2;
}

- (UIColor)noServiceDotColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NTKExplorerDotColorOptions noServiceDotColor](self->_dotColorOptions, "noServiceDotColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "noServiceDotColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (UIColor *)v5;
}

- (id)connectivityDotBackingColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (double)dotDiameter
{
  void *v2;
  void *v3;
  double v4;

  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LayoutConstants_10(v3);

  return v4;
}

+ (double)dotSpacing
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_10(v3);
  v5 = v4;

  return v5;
}

+ (double)dotBorderWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_10(v3);
  v5 = v4;

  return v5;
}

+ (double)noServiceDotHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_10(v3);
  v5 = v4;

  return v5;
}

+ (id)connectedDotColor
{
  if (connectedDotColor_onceToken != -1)
    dispatch_once(&connectedDotColor_onceToken, &__block_literal_global_38);
  return (id)connectedDotColor___color;
}

void __42__NTKExplorerStatusView_connectedDotColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.462745098, 0.858823529, 0.643137255, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)connectedDotColor___color;
  connectedDotColor___color = v0;

}

+ (id)noServiceDotColor
{
  if (noServiceDotColor_onceToken != -1)
    dispatch_once(&noServiceDotColor_onceToken, &__block_literal_global_5_0);
  return (id)noServiceDotColor___color;
}

void __42__NTKExplorerStatusView_noServiceDotColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.682352941, 0.705882353, 0.749019608, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)noServiceDotColor___color;
  noServiceDotColor___color = v0;

}

- (void)_applyDotRotationFraction:(double)a3 forDotAtIndex:(unint64_t)a4
{
  void *v7;
  CGFloat v8;
  void *v9;
  void *v10;
  CGFloat v11;
  void *v12;
  NTKExplorerDotColorOptions *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  float v27;
  void *v28;
  double v29;
  CATransform3D v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;
  CATransform3D v34;
  CATransform3D v35;
  CATransform3D v36;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[NSArray objectAtIndex:](self->_dotLayers, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CLKInterpolateBetweenFloatsUnclipped();
  memset(&v36, 0, sizeof(v36));
  CATransform3DMakeRotation(&v36, v8, 1.0, 0.0, 0.0);
  v35 = v36;
  objc_msgSend(v7, "connectivityDotBackingLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v35;
  objc_msgSend(v9, "setTransform:", &v34);

  v33 = v36;
  objc_msgSend(v7, "connectivityDotLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v33;
  objc_msgSend(v10, "setTransform:", &v32);

  CLKInterpolateBetweenFloatsUnclipped();
  CATransform3DMakeRotation(&v31, v11, 1.0, 0.0, 0.0);
  objc_msgSend(v7, "noServicePillLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v31;
  objc_msgSend(v12, "setTransform:", &v30);

  v13 = self->_dotColorOptions;
  -[NTKExplorerDotColorOptions noServiceDotColor](v13, "noServiceDotColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    +[NTKExplorerStatusView noServiceDotColor](NTKExplorerStatusView, "noServiceDotColor");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  -[NTKExplorerDotColorOptions connectedDotColor](v13, "connectedDotColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = v18;
  }
  else
  {
    +[NTKExplorerStatusView connectedDotColor](NTKExplorerStatusView, "connectedDotColor");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  NTKInterpolateBetweenColors(v20, v17);
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = objc_msgSend(v21, "CGColor");
  objc_msgSend(v7, "noServicePillLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v22);

  v24 = objc_retainAutorelease(v21);
  v25 = objc_msgSend(v24, "CGColor");
  objc_msgSend(v7, "connectivityDotLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBorderColor:", v25);

  objc_msgSend(v7, "noServicePillLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = a3;
  *(float *)&v29 = v27;
  objc_msgSend(v28, "setOpacity:", v29);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  NSArray *dotLayers;
  id v8;
  _QWORD v9[4];
  id v10;

  -[NTKExplorerStatusView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, 0, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    dotLayers = self->_dotLayers;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__NTKExplorerStatusView_transitionToMonochromeWithFraction___block_invoke;
    v9[3] = &unk_1E6BD08E8;
    v10 = v8;
    -[NSArray enumerateObjectsUsingBlock:](dotLayers, "enumerateObjectsUsingBlock:", v9);

    v6 = v8;
  }

}

void __60__NTKExplorerStatusView_transitionToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "noServicePillLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", v3);

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "connectivityDotLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFilters:", v6);
}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  NSArray *dotLayers;
  id v6;
  _QWORD v7[4];
  id v8;

  -[NTKExplorerStatusView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    dotLayers = self->_dotLayers;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__NTKExplorerStatusView_updateMonochromeColor__block_invoke;
    v7[3] = &unk_1E6BD08E8;
    v8 = v6;
    -[NSArray enumerateObjectsUsingBlock:](dotLayers, "enumerateObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

void __46__NTKExplorerStatusView_updateMonochromeColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "noServicePillLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", v3);

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "connectivityDotLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFilters:", v6);
}

- (void)_layoutDotLayers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *dotLayers;
  id v18;
  _QWORD v19[4];
  id v20;
  NTKExplorerStatusView *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  -[NTKExplorerStatusView dotDiameter](self, "dotDiameter");
  v4 = v3;
  -[NTKExplorerStatusView dotSpacing](self, "dotSpacing");
  v6 = v5;
  -[NTKExplorerStatusView dotDiameter](self, "dotDiameter");
  v8 = v7;
  -[NTKExplorerStatusView dotDiameter](self, "dotDiameter");
  v10 = v9;
  v32[0] = CFSTR("backgroundColor");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  v32[1] = CFSTR("borderColor");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v12;
  v32[2] = CFSTR("borderWidth");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKExplorerStatusView noServiceDotHeight](self, "noServiceDotHeight");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  dotLayers = self->_dotLayers;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __41__NTKExplorerStatusView__layoutDotLayers__block_invoke;
  v19[3] = &unk_1E6BD0950;
  v22 = 0;
  v23 = 0;
  v24 = v8;
  v25 = v10;
  v26 = v4;
  v27 = v6;
  v28 = 0;
  v29 = 0;
  v30 = v8;
  v31 = v16;
  v20 = v14;
  v21 = self;
  v18 = v14;
  -[NSArray enumerateObjectsUsingBlock:](dotLayers, "enumerateObjectsUsingBlock:", v19);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[NTKExplorerStatusView _updateDotFillStates](self, "_updateDotFillStates");

}

void __41__NTKExplorerStatusView__layoutDotLayers__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v5 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  v8 = *(double *)(a1 + 72);
  v9 = a2;
  objc_msgSend(v9, "setBounds:", v5, v6, v7, v8);
  objc_msgSend(v9, "setPosition:", *(double *)(a1 + 80) * 0.5 + (double)a3 * (*(double *)(a1 + 80) + *(double *)(a1 + 88)));
  objc_msgSend(v9, "noServicePillLayer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActions:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v16, "setBounds:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(v16, "setCornerRadius:", *(double *)(a1 + 120) * 0.5);
  objc_msgSend(*(id *)(a1 + 40), "noServiceDotColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  objc_msgSend(v16, "setZPosition:", *(double *)(a1 + 120) * 0.5);
  objc_msgSend(v9, "connectivityDotBackingLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActions:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "setCornerRadius:", *(double *)(a1 + 64) * 0.5);
  objc_msgSend(*(id *)(a1 + 40), "connectivityDotBackingColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

  objc_msgSend(v11, "setZPosition:", *(double *)(a1 + 120) + *(double *)(a1 + 72) * 0.5);
  objc_msgSend(v9, "connectivityDotLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setActions:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v13, "setCornerRadius:", *(double *)(a1 + 64) * 0.5);
  objc_msgSend(*(id *)(a1 + 40), "connectedDotBackgroundColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

  objc_msgSend(*(id *)(a1 + 40), "connectedDotColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "setBorderColor:", objc_msgSend(v15, "CGColor"));

  objc_msgSend(v13, "setZPosition:", *(double *)(a1 + 120) + *(double *)(a1 + 72) + *(double *)(a1 + 72) * 0.5);
}

- (void)setDotPosition:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  self->_position = a3;
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (NTKExplorerDotLayoutConstraints)dotLayoutConstraints
{
  return self->_dotLayoutConstraints;
}

- (NTKExplorerDotColorOptions)dotColorOptions
{
  return self->_dotColorOptions;
}

- (int64_t)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (BOOL)showsFullSignalStrength
{
  return self->_showsFullSignalStrength;
}

- (BOOL)tritiumIsOn
{
  return self->_tritiumIsOn;
}

- (void)setTritiumIsOn:(BOOL)a3
{
  self->_tritiumIsOn = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotColorOptions, 0);
  objc_storeStrong((id *)&self->_dotLayoutConstraints, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_dotLayers, 0);
}

@end
