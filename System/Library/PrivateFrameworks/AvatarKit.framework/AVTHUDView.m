@implementation AVTHUDView

- (AVTHUDView)initWithFrame:(CGRect)a3
{
  AVTHUDView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTHUDView;
  v3 = -[AVTHUDView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTHUDView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[AVTHUDView _loadSubviews](v3, "_loadSubviews");
  }
  return v3;
}

- (void)updateWithData:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float var6;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Total latency: %.2f ms"), a3->var0 * 1000.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_totalLatencyLabel, "setText:", v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ARKit latency: %.2f ms"), a3->var1 * 1000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_arKitLatencyLabel, "setText:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sync latency: %.2f ms"), a3->var2 * 1000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_updateSyncLatencyLabel, "setText:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MTL latency: %.2f ms"), a3->var3 * 1000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_metalLatencyLabel, "setText:", v8);

  var6 = a3->var6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Audio time: %f ms"), var6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_audioTimeLabel, "setText:", v10);

  v11 = CFSTR("2x Buffer");
  if (!a3->var8)
    v11 = CFSTR("3x Buffer");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FPS: %d | %@"), a3->var5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_fpsLabel, "setText:", v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Time between ARFrame: %.2f ms"), a3->var4 * 1000.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_timeBetweenARFrameLabel, "setText:", v13);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Frame dropped/s: %d"), a3->var7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_droppedFrameLabel, "setText:", v14);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shader compilation: %d"), a3->var9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_shaderCompilationLabel, "setText:", v15);

  if (a3->var9)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_shaderCompilationLabel, "setTextColor:", v16);

  }
  *(_OWORD *)&self->_lastFrameData.totalLatency = *(_OWORD *)&a3->var0;
  v18 = *(_OWORD *)&a3->var4;
  v17 = *(_OWORD *)&a3->var6;
  v19 = *(_OWORD *)&a3->var2;
  *(_QWORD *)&self->_lastFrameData.onlineShaderCompilationCount = *(_QWORD *)&a3->var9;
  *(_OWORD *)&self->_lastFrameData.timeBetweenARFrame = v18;
  *(_OWORD *)&self->_lastFrameData.audioTime = v17;
  *(_OWORD *)&self->_lastFrameData.updateSyncLatency = v19;
  -[AVTHUDView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTHUDView;
  -[AVTHUDView layoutSubviews](&v5, sel_layoutSubviews);
  -[AVTHUDView bounds](self, "bounds");
  v4 = v3 + -10.0;
  -[UILabel setFrame:](self->_totalLatencyLabel, "setFrame:", 5.0, 5.0, v3 + -10.0, 15.0);
  -[UILabel setFrame:](self->_arKitLatencyLabel, "setFrame:", 5.0, 25.0, v4, 15.0);
  -[UILabel setFrame:](self->_updateSyncLatencyLabel, "setFrame:", 5.0, 45.0, v4, 15.0);
  -[UILabel setFrame:](self->_metalLatencyLabel, "setFrame:", 5.0, 65.0, v4, 15.0);
  -[UILabel setFrame:](self->_audioTimeLabel, "setFrame:", 5.0, 85.0, v4, 15.0);
  -[UILabel setFrame:](self->_fpsLabel, "setFrame:", 5.0, 105.0, v4, 15.0);
  -[UILabel setFrame:](self->_timeBetweenARFrameLabel, "setFrame:", 5.0, 125.0, v4, 15.0);
  -[UILabel setFrame:](self->_droppedFrameLabel, "setFrame:", 5.0, 145.0, v4, 15.0);
  -[UILabel setFrame:](self->_shaderCompilationLabel, "setFrame:", 5.0, 165.0, v4, 15.0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[AVTHUDView _updateLatencyBar:](self, "_updateLatencyBar:", &self->_lastFrameData);
  -[AVTHUDView _updateLatencyGraph:](self, "_updateLatencyGraph:", &self->_lastFrameData);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_updateLatencyBar:(id *)a3
{
  double var0;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;

  var0 = a3->var0;
  v6 = a3->var0 <= 0.0;
  -[CALayer setHidden:](self->_arKitLatencyBar, "setHidden:", v6);
  -[CALayer setHidden:](self->_updateLatencyBar, "setHidden:", v6);
  -[CALayer setHidden:](self->_metalLatencyBar, "setHidden:", v6);
  if (var0 > 0.0)
  {
    -[AVTHUDView bounds](self, "bounds");
    v8 = v7 / 3.0 + -10.0;
    v9 = 0.1;
    if (a3->var0 <= 0.1)
      v9 = a3->var0;
    if (v9 < 0.0)
      v9 = 0.0;
    v10 = v9;
    v11 = v8 * (v10 / a3->var0);
    -[UILabel frame](self->_shaderCompilationLabel, "frame");
    v13 = v12 + 15.0 + 5.0;
    v14 = a3->var1 / a3->var0;
    v15 = a3->var2 / a3->var0;
    v16 = a3->var3 / a3->var0;
    -[AVTHUDView bounds](self, "bounds");
    v18 = v17 - (v11 + 5.0);
    v19 = (float)(v14 * v11);
    -[CALayer setFrame:](self->_arKitLatencyBar, "setFrame:", v18, v13, v19, 5.0);
    v20 = v18 + v19;
    -[CALayer setFrame:](self->_updateLatencyBar, "setFrame:", v20, v13, (float)(v15 * v11), 5.0);
    -[CALayer setFrame:](self->_metalLatencyBar, "setFrame:", v20 + (float)(v15 * v11), v13, (float)(v16 * v11), 5.0);
  }
}

- (void)_updateLatencyGraph:(id *)a3
{
  double v5;
  double v6;
  float v7;
  int v8;
  NSMutableArray *totalLatencyGraphLayers;
  uint64_t v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  int selectedGraphIndex;
  $BE50A9AA43D9A69F4120A6BB065164BC *p_var3;
  double var0;
  double v20;
  double v21;
  float v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[AVTHUDView bounds](self, "bounds");
  v6 = v5 / 3.0 + -10.0;
  v7 = v6 * 0.25;
  v8 = (int)fmaxf(ceilf(v7), 1.0);
  totalLatencyGraphLayers = self->_totalLatencyGraphLayers;
  v10 = v8;
  if (!totalLatencyGraphLayers)
  {
    v11 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    v12 = self->_totalLatencyGraphLayers;
    self->_totalLatencyGraphLayers = v11;

    totalLatencyGraphLayers = self->_totalLatencyGraphLayers;
  }
  if (-[NSMutableArray count](totalLatencyGraphLayers, "count") >= (unint64_t)v8)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_totalLatencyGraphLayers, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSMutableArray count](self->_totalLatencyGraphLayers, "count") >= 2)
    {
      v15 = 1;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_totalLatencyGraphLayers, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](self->_totalLatencyGraphLayers, "setObject:atIndexedSubscript:", v16, v15 - 1);

        ++v15;
      }
      while (-[NSMutableArray count](self->_totalLatencyGraphLayers, "count") > v15);
    }
    -[NSMutableArray setObject:atIndexedSubscript:](self->_totalLatencyGraphLayers, "setObject:atIndexedSubscript:", v13, -[NSMutableArray count](self->_totalLatencyGraphLayers, "count") - 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOpaque:", 1);
    -[NSMutableArray addObject:](self->_totalLatencyGraphLayers, "addObject:", v13);
    -[AVTHUDView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v13);

  }
  selectedGraphIndex = self->_selectedGraphIndex;
  if (selectedGraphIndex == 3)
  {
    p_var3 = ($BE50A9AA43D9A69F4120A6BB065164BC *)&a3->var3;
  }
  else if (selectedGraphIndex == 2)
  {
    p_var3 = ($BE50A9AA43D9A69F4120A6BB065164BC *)&a3->var2;
  }
  else
  {
    p_var3 = a3;
    if (selectedGraphIndex == 1)
      p_var3 = ($BE50A9AA43D9A69F4120A6BB065164BC *)&a3->var1;
  }
  var0 = a3->var0;
  v20 = 0.0;
  if (a3->var0 > 0.0)
  {
    v21 = p_var3->var0;
    if (p_var3->var0 > 0.1)
      v21 = 0.1;
    if (v21 < 0.0)
      v21 = 0.0;
    v22 = v21;
    var0 = v22 / 0.1 * 15.0;
    *(float *)&var0 = var0;
    v20 = *(float *)&var0;
  }
  switch(selectedGraphIndex)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor", var0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor", var0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor", var0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor", var0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  v24 = objc_retainAutorelease(v23);
  objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(v13, "setFrame:", 0.0, 0.0, 3.0, v20);
  -[AVTHUDView bounds](self, "bounds");
  v26 = v25;
  v27 = -[NSMutableArray count](self->_totalLatencyGraphLayers, "count");
  -[CALayer frame](self->_metalLatencyBar, "frame");
  v29 = v28;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = self->_totalLatencyGraphLayers;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v31)
  {
    v32 = v31;
    v33 = v29 + 5.0 + 5.0;
    v34 = v26 - (v6 + 5.0 + 1.0) + (double)(unint64_t)(v10 - v27) * 4.0;
    v35 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(v30);
        v37 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v37, "frame", (_QWORD)v39);
        objc_msgSend(v37, "setFrame:", v34, v33 + 15.0 - v38);
        v34 = v34 + 4.0;
      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v32);
  }

}

- (id)_label
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "monospacedDigitSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0CEB5F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  objc_msgSend(v4, "setTextAlignment:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__tapAction_);
  objc_msgSend(v4, "addGestureRecognizer:", v8);

  return v4;
}

- (void)_loadSubviews
{
  UILabel *v3;
  UILabel *totalLatencyLabel;
  UILabel *v5;
  UILabel *arKitLatencyLabel;
  void *v7;
  UILabel *v8;
  UILabel *updateSyncLatencyLabel;
  void *v10;
  UILabel *v11;
  UILabel *metalLatencyLabel;
  void *v13;
  UILabel *v14;
  UILabel *audioTimeLabel;
  UILabel *v16;
  UILabel *fpsLabel;
  UILabel *v18;
  UILabel *timeBetweenARFrameLabel;
  UILabel *v20;
  UILabel *droppedFrameLabel;
  UILabel *v22;
  UILabel *shaderCompilationLabel;
  CALayer *v24;
  CALayer *arKitLatencyBar;
  id v26;
  CALayer *v27;
  CALayer *updateLatencyBar;
  id v29;
  CALayer *v30;
  CALayer *metalLatencyBar;
  id v32;
  void *v33;
  void *v34;
  id v35;

  -[AVTHUDView _label](self, "_label");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  totalLatencyLabel = self->_totalLatencyLabel;
  self->_totalLatencyLabel = v3;

  -[AVTHUDView _label](self, "_label");
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  arKitLatencyLabel = self->_arKitLatencyLabel;
  self->_arKitLatencyLabel = v5;

  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_arKitLatencyLabel, "setTextColor:", v7);

  -[AVTHUDView _label](self, "_label");
  v8 = (UILabel *)objc_claimAutoreleasedReturnValue();
  updateSyncLatencyLabel = self->_updateSyncLatencyLabel;
  self->_updateSyncLatencyLabel = v8;

  objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_updateSyncLatencyLabel, "setTextColor:", v10);

  -[AVTHUDView _label](self, "_label");
  v11 = (UILabel *)objc_claimAutoreleasedReturnValue();
  metalLatencyLabel = self->_metalLatencyLabel;
  self->_metalLatencyLabel = v11;

  objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_metalLatencyLabel, "setTextColor:", v13);

  -[AVTHUDView _label](self, "_label");
  v14 = (UILabel *)objc_claimAutoreleasedReturnValue();
  audioTimeLabel = self->_audioTimeLabel;
  self->_audioTimeLabel = v14;

  -[UILabel setGestureRecognizers:](self->_audioTimeLabel, "setGestureRecognizers:", 0);
  -[UILabel setUserInteractionEnabled:](self->_audioTimeLabel, "setUserInteractionEnabled:", 0);
  -[AVTHUDView _label](self, "_label");
  v16 = (UILabel *)objc_claimAutoreleasedReturnValue();
  fpsLabel = self->_fpsLabel;
  self->_fpsLabel = v16;

  -[UILabel setGestureRecognizers:](self->_fpsLabel, "setGestureRecognizers:", 0);
  -[UILabel setUserInteractionEnabled:](self->_fpsLabel, "setUserInteractionEnabled:", 0);
  -[AVTHUDView _label](self, "_label");
  v18 = (UILabel *)objc_claimAutoreleasedReturnValue();
  timeBetweenARFrameLabel = self->_timeBetweenARFrameLabel;
  self->_timeBetweenARFrameLabel = v18;

  -[UILabel setGestureRecognizers:](self->_timeBetweenARFrameLabel, "setGestureRecognizers:", 0);
  -[UILabel setUserInteractionEnabled:](self->_timeBetweenARFrameLabel, "setUserInteractionEnabled:", 0);
  -[AVTHUDView _label](self, "_label");
  v20 = (UILabel *)objc_claimAutoreleasedReturnValue();
  droppedFrameLabel = self->_droppedFrameLabel;
  self->_droppedFrameLabel = v20;

  -[UILabel setGestureRecognizers:](self->_droppedFrameLabel, "setGestureRecognizers:", 0);
  -[UILabel setUserInteractionEnabled:](self->_droppedFrameLabel, "setUserInteractionEnabled:", 0);
  -[AVTHUDView _label](self, "_label");
  v22 = (UILabel *)objc_claimAutoreleasedReturnValue();
  shaderCompilationLabel = self->_shaderCompilationLabel;
  self->_shaderCompilationLabel = v22;

  -[UILabel setGestureRecognizers:](self->_shaderCompilationLabel, "setGestureRecognizers:", 0);
  -[UILabel setUserInteractionEnabled:](self->_shaderCompilationLabel, "setUserInteractionEnabled:", 0);
  -[AVTHUDView addSubview:](self, "addSubview:", self->_totalLatencyLabel);
  -[AVTHUDView addSubview:](self, "addSubview:", self->_arKitLatencyLabel);
  -[AVTHUDView addSubview:](self, "addSubview:", self->_updateSyncLatencyLabel);
  -[AVTHUDView addSubview:](self, "addSubview:", self->_metalLatencyLabel);
  -[AVTHUDView addSubview:](self, "addSubview:", self->_fpsLabel);
  -[AVTHUDView addSubview:](self, "addSubview:", self->_audioTimeLabel);
  -[AVTHUDView addSubview:](self, "addSubview:", self->_timeBetweenARFrameLabel);
  -[AVTHUDView addSubview:](self, "addSubview:", self->_droppedFrameLabel);
  -[AVTHUDView addSubview:](self, "addSubview:", self->_shaderCompilationLabel);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v24 = (CALayer *)objc_claimAutoreleasedReturnValue();
  arKitLatencyBar = self->_arKitLatencyBar;
  self->_arKitLatencyBar = v24;

  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](self->_arKitLatencyBar, "setBackgroundColor:", objc_msgSend(v26, "CGColor"));

  -[CALayer setOpaque:](self->_arKitLatencyBar, "setOpaque:", 1);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v27 = (CALayer *)objc_claimAutoreleasedReturnValue();
  updateLatencyBar = self->_updateLatencyBar;
  self->_updateLatencyBar = v27;

  objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](self->_updateLatencyBar, "setBackgroundColor:", objc_msgSend(v29, "CGColor"));

  -[CALayer setOpaque:](self->_updateLatencyBar, "setOpaque:", 1);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v30 = (CALayer *)objc_claimAutoreleasedReturnValue();
  metalLatencyBar = self->_metalLatencyBar;
  self->_metalLatencyBar = v30;

  objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](self->_metalLatencyBar, "setBackgroundColor:", objc_msgSend(v32, "CGColor"));

  -[CALayer setOpaque:](self->_metalLatencyBar, "setOpaque:", 1);
  -[AVTHUDView layer](self, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSublayer:", self->_arKitLatencyBar);

  -[AVTHUDView layer](self, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSublayer:", self->_updateLatencyBar);

  -[AVTHUDView layer](self, "layer");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSublayer:", self->_metalLatencyBar);

}

- (void)_tapAction:(id)a3
{
  UILabel *v4;
  UILabel *totalLatencyLabel;
  UILabel *v6;
  UILabel *arKitLatencyLabel;
  UILabel *v8;
  UILabel *updateSyncLatencyLabel;
  UILabel *v10;
  UILabel *metalLatencyLabel;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "view");
  v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
  totalLatencyLabel = self->_totalLatencyLabel;

  if (v4 == totalLatencyLabel)
    self->_selectedGraphIndex = 0;
  objc_msgSend(v12, "view");
  v6 = (UILabel *)objc_claimAutoreleasedReturnValue();
  arKitLatencyLabel = self->_arKitLatencyLabel;

  if (v6 == arKitLatencyLabel)
    self->_selectedGraphIndex = 1;
  objc_msgSend(v12, "view");
  v8 = (UILabel *)objc_claimAutoreleasedReturnValue();
  updateSyncLatencyLabel = self->_updateSyncLatencyLabel;

  if (v8 == updateSyncLatencyLabel)
    self->_selectedGraphIndex = 2;
  objc_msgSend(v12, "view");
  v10 = (UILabel *)objc_claimAutoreleasedReturnValue();
  metalLatencyLabel = self->_metalLatencyLabel;

  if (v10 == metalLatencyLabel)
    self->_selectedGraphIndex = 3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalLatencyGraphLayers, 0);
  objc_storeStrong((id *)&self->_metalLatencyBar, 0);
  objc_storeStrong((id *)&self->_updateLatencyBar, 0);
  objc_storeStrong((id *)&self->_arKitLatencyBar, 0);
  objc_storeStrong((id *)&self->_shaderCompilationLabel, 0);
  objc_storeStrong((id *)&self->_droppedFrameLabel, 0);
  objc_storeStrong((id *)&self->_timeBetweenARFrameLabel, 0);
  objc_storeStrong((id *)&self->_audioTimeLabel, 0);
  objc_storeStrong((id *)&self->_fpsLabel, 0);
  objc_storeStrong((id *)&self->_metalLatencyLabel, 0);
  objc_storeStrong((id *)&self->_updateSyncLatencyLabel, 0);
  objc_storeStrong((id *)&self->_arKitLatencyLabel, 0);
  objc_storeStrong((id *)&self->_totalLatencyLabel, 0);
}

@end
