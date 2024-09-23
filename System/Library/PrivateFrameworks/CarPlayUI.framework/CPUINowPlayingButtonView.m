@implementation CPUINowPlayingButtonView

- (CPUINowPlayingButtonView)initWithCAML:(id)a3
{
  id v4;
  CPUINowPlayingButtonView *v5;
  uint64_t v6;
  NSMutableArray *barLayers;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPUINowPlayingButtonView;
  v5 = -[CPUINowPlayingButtonView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = objc_opt_new();
    barLayers = v5->_barLayers;
    v5->_barLayers = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDE56E0], "parser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v5);
    objc_msgSend(v8, "parseContentsOfURL:", v4);
    objc_msgSend(v8, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGeometryFlipped:", 1);
    -[CPUINowPlayingButtonView _handleGlyphLayerDidLoad:](v5, "_handleGlyphLayerDidLoad:", v9);
    -[CPUINowPlayingButtonView setStateName:](v5, "setStateName:", CFSTR("Pause"));

  }
  return v5;
}

- (void)_handleGlyphLayerDidLoad:(id)a3
{
  CALayer **p_animatedGlyphLayer;
  id v6;
  CAStateController *v7;
  CAStateController *stateController;
  void *v9;
  void *v10;
  void *v11;
  CALayer *v12;
  _QWORD v13[5];

  p_animatedGlyphLayer = &self->_animatedGlyphLayer;
  objc_storeStrong((id *)&self->_animatedGlyphLayer, a3);
  v6 = a3;
  v7 = (CAStateController *)objc_msgSend(objc_alloc(MEMORY[0x24BDE5788]), "initWithLayer:", v6);
  stateController = self->_stateController;
  self->_stateController = v7;

  -[CPUINowPlayingButtonView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", v6);

  -[CPUINowPlayingButtonView stateName](self, "stateName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer stateWithName:](*p_animatedGlyphLayer, "stateWithName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAStateController setState:ofLayer:](self->_stateController, "setState:ofLayer:", v11, *p_animatedGlyphLayer);
  v12 = *p_animatedGlyphLayer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__CPUINowPlayingButtonView__handleGlyphLayerDidLoad___block_invoke;
  v13[3] = &unk_24DF24178;
  v13[4] = self;
  -[CALayer cpui_enumerateSublayersWithBlock:](v12, "cpui_enumerateSublayersWithBlock:", v13);
  -[CPUINowPlayingButtonView _updateColors](self, "_updateColors");
  -[CPUINowPlayingButtonView setNeedsLayout](self, "setNeedsLayout");

}

void __53__CPUINowPlayingButtonView__handleGlyphLayerDidLoad___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("Bar"))
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("Bars")) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addObject:", v5);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Platter")))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 440), a2);
  }

}

- (void)layoutSubviews
{
  __int128 v3;
  CALayer *animatedGlyphLayer;
  CGAffineTransform v5;
  CGAffineTransform v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPUINowPlayingButtonView;
  -[CPUINowPlayingButtonView layoutSubviews](&v7, sel_layoutSubviews);
  -[CPUINowPlayingButtonView bounds](self, "bounds");
  UIRectGetCenter();
  -[CALayer setPosition:](self->_animatedGlyphLayer, "setPosition:");
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v6.c = v3;
  *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v5.a = *(_OWORD *)&v6.a;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)&v6.tx;
  CGAffineTransformScale(&v6, &v5, 0.5, 0.5);
  animatedGlyphLayer = self->_animatedGlyphLayer;
  v5 = v6;
  -[CALayer setAffineTransform:](animatedGlyphLayer, "setAffineTransform:", &v5);
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[CPUINowPlayingButtonView _updateColors](self, "_updateColors");
  }
}

- (void)_updateColors
{
  void *v3;
  void *v4;
  _QWORD v5[2];
  void (*v6)(uint64_t);
  void *v7;
  CPUINowPlayingButtonView *v8;

  -[CPUINowPlayingButtonView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v6 = __41__CPUINowPlayingButtonView__updateColors__block_invoke;
  v7 = &unk_24DF241A0;
  v8 = self;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "_currentTraitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v3);
    v6((uint64_t)v5);
    objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v4);

  }
}

void __41__CPUINowPlayingButtonView__updateColors__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  if (objc_msgSend(*(id *)(a1 + 32), "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor");
  }
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setBackgroundColor:", objc_msgSend(v3, "CGColor"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 432);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v10 = objc_retainAutorelease(v2);
        objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v10, "CGColor", (_QWORD)v11));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)setStateName:(id)a3
{
  NSString *v4;
  NSString *stateName;
  void *v6;
  double v7;
  id v8;

  v8 = a3;
  if ((-[NSString isEqual:](self->_stateName, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    stateName = self->_stateName;
    self->_stateName = v4;

    -[CALayer stateWithName:](self->_animatedGlyphLayer, "stateWithName:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1.0;
    -[CAStateController setState:ofLayer:transitionSpeed:](self->_stateController, "setState:ofLayer:transitionSpeed:", v6, self->_animatedGlyphLayer, v7);
    -[CALayer cpui_startAnimating](self->_animatedGlyphLayer, "cpui_startAnimating");

  }
}

+ (id)classSubstitions
{
  if (classSubstitions_onceToken != -1)
    dispatch_once(&classSubstitions_onceToken, &__block_literal_global_1);
  return (id)classSubstitions_substitutions;
}

void __44__CPUINowPlayingButtonView_classSubstitions__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("LKState");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("LKEventHandler");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("LKStateAddAnimation");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("LKStateAddElement");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("LKStateElement");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("LKStateRemoveAnimation");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("LKStateRemoveElement");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("LKStateSetValue");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("LKStateSetProperty");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("LKStateTransition");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("LKStateTransitionElement");
  v3[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)classSubstitions_substitutions;
  classSubstitions_substitutions = v0;

}

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "classSubstitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPUINowPlayingButtonView;
  -[CPUINowPlayingButtonView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CPUINowPlayingButtonView _updateColors](self, "_updateColors");
}

- (NSString)stateName
{
  return self->_stateName;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateName, 0);
  objc_storeStrong((id *)&self->_platterLayer, 0);
  objc_storeStrong((id *)&self->_barLayers, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_animatedGlyphLayer, 0);
}

@end
