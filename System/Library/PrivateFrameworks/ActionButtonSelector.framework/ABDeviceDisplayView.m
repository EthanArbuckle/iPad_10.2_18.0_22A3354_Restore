@implementation ABDeviceDisplayView

- (ABDeviceDisplayView)initWithFrame:(CGRect)a3
{
  ABDeviceDisplayView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CAPackage *package;
  void *v8;
  uint64_t v9;
  CALayer *islandLayer;
  uint64_t v11;
  CALayer *ringerLayer;
  uint64_t v13;
  CAStateController *ringerStateController;
  uint64_t v15;
  ABFloatSpringProperty *islandY;
  uint64_t v17;
  ABFloatSpringProperty *islandWidth;
  uint64_t v19;
  ABFloatSpringProperty *islandHeight;
  uint64_t v21;
  ABFloatSpringProperty *islandShake1;
  uint64_t v23;
  ABFloatSpringProperty *islandShake2;
  uint64_t v25;
  ABFloatSpringProperty *ringerVisible;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)ABDeviceDisplayView;
  v3 = -[ABDeviceDisplayView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("Display"), CFSTR("ca"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE5718], "packageWithContentsOfURL:type:options:error:", v5, *MEMORY[0x24BDE5D50], 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    package = v3->_package;
    v3->_package = (CAPackage *)v6;

    -[CAPackage rootLayer](v3->_package, "rootLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGeometryFlipped:", 1);

    -[CAPackage publishedObjectWithName:](v3->_package, "publishedObjectWithName:", CFSTR("island"));
    v9 = objc_claimAutoreleasedReturnValue();
    islandLayer = v3->_islandLayer;
    v3->_islandLayer = (CALayer *)v9;

    -[CAPackage publishedObjectWithName:](v3->_package, "publishedObjectWithName:", CFSTR("ringer"));
    v11 = objc_claimAutoreleasedReturnValue();
    ringerLayer = v3->_ringerLayer;
    v3->_ringerLayer = (CALayer *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDE5788]), "initWithLayer:", v3->_ringerLayer);
    ringerStateController = v3->_ringerStateController;
    v3->_ringerStateController = (CAStateController *)v13;

    -[ABDeviceDisplayView _setSilentModeEnabled:animated:](v3, "_setSilentModeEnabled:animated:", 1, 0);
    v15 = objc_opt_new();
    islandY = v3->_islandY;
    v3->_islandY = (ABFloatSpringProperty *)v15;

    v17 = objc_opt_new();
    islandWidth = v3->_islandWidth;
    v3->_islandWidth = (ABFloatSpringProperty *)v17;

    v19 = objc_opt_new();
    islandHeight = v3->_islandHeight;
    v3->_islandHeight = (ABFloatSpringProperty *)v19;

    v21 = objc_opt_new();
    islandShake1 = v3->_islandShake1;
    v3->_islandShake1 = (ABFloatSpringProperty *)v21;

    -[ABFloatSpringProperty setBounce:duration:](v3->_islandShake1, "setBounce:duration:", 0.0, 0.45);
    v23 = objc_opt_new();
    islandShake2 = v3->_islandShake2;
    v3->_islandShake2 = (ABFloatSpringProperty *)v23;

    -[ABFloatSpringProperty setBounce:duration:](v3->_islandShake2, "setBounce:duration:", 0.82322, 0.22214);
    v25 = objc_opt_new();
    ringerVisible = v3->_ringerVisible;
    v3->_ringerVisible = (ABFloatSpringProperty *)v25;

    -[ABDeviceDisplayView _transitionIslandToInert](v3, "_transitionIslandToInert");
    -[ABDeviceDisplayView _resetSprings](v3, "_resetSprings");
    objc_initWeak(&location, v3);
    v27 = (void *)MEMORY[0x24BDF6F90];
    v36[0] = v3->_islandY;
    v36[1] = v3->_islandWidth;
    v36[2] = v3->_islandHeight;
    v36[3] = v3->_ringerVisible;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __37__ABDeviceDisplayView_initWithFrame___block_invoke;
    v32[3] = &unk_25073EE18;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v27, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v28, v32);

    -[ABDeviceDisplayView layer](v3, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAPackage rootLayer](v3->_package, "rootLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSublayer:", v30);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __37__ABDeviceDisplayView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (_QWORD)setIslandMode:(_QWORD *)result
{
  void *v2;

  if (result)
  {
    v2 = result;
    if (result[63] != a2)
    {
      result[63] = a2;
      switch(a2)
      {
        case 0:
          result = (_QWORD *)objc_msgSend(result, "_transitionIslandToInert");
          break;
        case 1:
          result = (_QWORD *)objc_msgSend(result, "_transitionIslandToCompact");
          break;
        case 2:
          result = (_QWORD *)objc_msgSend(result, "_transitionIslandToGrowing");
          break;
        case 3:
          objc_msgSend(result, "_transitionIslandToLarge");
          result = (_QWORD *)objc_msgSend(v2, "_toggleSilentMode");
          break;
        default:
          return result;
      }
    }
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CAPackage rootLayer](self->_package, "rootLayer", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  long double v19;
  double v20;
  CALayer *ringerLayer;
  void *v22;
  double v23;
  CALayer *v24;
  void *v25;
  double v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)ABDeviceDisplayView;
  -[ABDeviceDisplayView layoutSubviews](&v27, sel_layoutSubviews);
  v3 = objc_msgSend(MEMORY[0x24BDE57D8], "disableActions");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[ABDeviceDisplayView bounds](self, "bounds");
  v5 = v4 * 0.5;
  v7 = v6 * 0.5;
  -[CAPackage rootLayer](self->_package, "rootLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPosition:", v5, v7);

  -[ABFloatSpringProperty output](self->_islandWidth, "output");
  v10 = v9;
  -[ABFloatSpringProperty output](self->_islandHeight, "output");
  v12 = v11;
  if (v11 > 105.0)
  {
    -[CALayer setBounds:](self->_islandLayer, "setBounds:", 0.0, 0.0, v10, v11);
    -[ABFloatSpringProperty output](self->_islandShake1, "output");
    v14 = v5 + v13;
    -[ABFloatSpringProperty output](self->_islandShake2, "output");
    v16 = v14 + v15;
    -[ABFloatSpringProperty output](self->_islandY, "output");
    -[CALayer setPosition:](self->_islandLayer, "setPosition:", v16, v17);
    -[CALayer setCornerRadius:](self->_islandLayer, "setCornerRadius:", v12 * 0.5);
    -[ABFloatSpringProperty output](self->_ringerVisible, "output");
    v19 = pow(v18, 3.0);
    v20 = v19;
    *(float *)&v19 = v19;
    -[CALayer setOpacity:](self->_ringerLayer, "setOpacity:", (double)v19);
    ringerLayer = self->_ringerLayer;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 20.0 - v20 * 20.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setValue:forKeyPath:](ringerLayer, "setValue:forKeyPath:", v22, CFSTR("filters.gaussianBlur.inputRadius"));

    v23 = v12 / 110.0 * (v20 * 0.5 + 0.5);
    v24 = self->_ringerLayer;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setValue:forKeyPath:](v24, "setValue:forKeyPath:", v25, CFSTR("transform.scale.xy"));

    -[CALayer bounds](self->_ringerLayer, "bounds");
    -[CALayer setPosition:](self->_ringerLayer, "setPosition:", v23 * v26 * 0.5 + (v12 - v23 * v26) * 0.5, v12 * 0.5);
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", v3);
}

- (void)_resetSprings
{
  -[ABFloatSpringProperty input](self->_islandY, "input");
  -[ABFloatSpringProperty setOutput:](self->_islandY, "setOutput:");
  -[ABFloatSpringProperty input](self->_islandWidth, "input");
  -[ABFloatSpringProperty setOutput:](self->_islandWidth, "setOutput:");
  -[ABFloatSpringProperty input](self->_islandHeight, "input");
  -[ABFloatSpringProperty setOutput:](self->_islandHeight, "setOutput:");
  -[ABFloatSpringProperty input](self->_ringerVisible, "input");
  -[ABFloatSpringProperty setOutput:](self->_ringerVisible, "setOutput:");
}

- (void)_setSilentModeEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  CALayer *ringerLayer;
  const __CFString *v7;
  uint64_t v8;
  double v9;
  id v11;

  v4 = a4;
  self->_isSilentModeEnabled = a3;
  ringerLayer = self->_ringerLayer;
  if (a3)
    v7 = CFSTR("silent");
  else
    v7 = CFSTR("ringer");
  -[CALayer stateWithName:](ringerLayer, "stateWithName:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 0;
  if (v4)
    *(float *)&v9 = 1.0;
  v11 = (id)v8;
  -[CAStateController setState:ofLayer:transitionSpeed:](self->_ringerStateController, "setState:ofLayer:transitionSpeed:", v9);
  if (self->_isSilentModeEnabled && v4)
    -[ABDeviceDisplayView _shake](self, "_shake");

}

- (void)_toggleSilentMode
{
  -[ABDeviceDisplayView _setSilentModeEnabled:animated:](self, "_setSilentModeEnabled:animated:", !self->_isSilentModeEnabled, 1);
}

- (void)_shake
{
  ABFloatSpringProperty *islandShake1;
  double v4;
  dispatch_time_t v5;
  _QWORD block[5];

  islandShake1 = self->_islandShake1;
  -[ABFloatSpringProperty input](islandShake1, "input");
  -[ABFloatSpringProperty setInput:](islandShake1, "setInput:", v4 + 20.0);
  v5 = dispatch_time(0, 275000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ABDeviceDisplayView__shake__block_invoke;
  block[3] = &unk_25073ED10;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
}

uint64_t __29__ABDeviceDisplayView__shake__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  objc_msgSend(v1, "input");
  return objc_msgSend(v1, "setInput:", v2 + -20.0);
}

- (void)_transitionIslandToInert
{
  -[ABFloatSpringProperty setBounce:duration:](self->_islandWidth, "setBounce:duration:", 0.0, 0.5);
  -[ABFloatSpringProperty setInput:](self->_islandWidth, "setInput:", 371.0);
  -[ABFloatSpringProperty setBounce:duration:](self->_islandHeight, "setBounce:duration:", 0.0, 0.5);
  -[ABFloatSpringProperty setInput:](self->_islandHeight, "setInput:", 110.0);
  -[ABFloatSpringProperty setBounce:duration:](self->_islandY, "setBounce:duration:", 0.0, 0.55);
  -[ABFloatSpringProperty setInput:](self->_islandY, "setInput:", 90.0);
  -[ABFloatSpringProperty setInput:](self->_ringerVisible, "setInput:", 0.0);
}

- (void)_transitionIslandToCompact
{
  -[ABFloatSpringProperty setBounce:duration:](self->_islandWidth, "setBounce:duration:", 0.0, 0.35);
  -[ABFloatSpringProperty setInput:](self->_islandWidth, "setInput:", 540.0);
  -[ABFloatSpringProperty setBounce:duration:](self->_islandHeight, "setBounce:duration:", 0.0, 0.35);
  -[ABFloatSpringProperty setInput:](self->_islandHeight, "setInput:", 110.0);
  -[ABFloatSpringProperty setBounce:duration:](self->_islandY, "setBounce:duration:", 0.0, 0.55);
  -[ABFloatSpringProperty setInput:](self->_islandY, "setInput:", 90.0);
  -[ABFloatSpringProperty setInput:](self->_ringerVisible, "setInput:", 1.0);
}

- (void)_transitionIslandToGrowing
{
  -[ABFloatSpringProperty setBounce:duration:](self->_islandWidth, "setBounce:duration:", 0.0, 2.5);
  -[ABFloatSpringProperty setInput:](self->_islandWidth, "setInput:", 624.0);
  -[ABFloatSpringProperty setBounce:duration:](self->_islandHeight, "setBounce:duration:", 0.0, 2.5);
  -[ABFloatSpringProperty setInput:](self->_islandHeight, "setInput:", 171.0);
  -[ABFloatSpringProperty setBounce:duration:](self->_islandY, "setBounce:duration:", 0.0, 2.5);
  -[ABFloatSpringProperty setInput:](self->_islandY, "setInput:", 105.0);
  -[ABFloatSpringProperty setInput:](self->_ringerVisible, "setInput:", 1.0);
}

- (void)_transitionIslandToLarge
{
  -[ABFloatSpringProperty setBounce:duration:](self->_islandWidth, "setBounce:duration:", 0.4, 0.5);
  -[ABFloatSpringProperty setInput:](self->_islandWidth, "setInput:", 624.0);
  -[ABFloatSpringProperty setBounce:duration:](self->_islandHeight, "setBounce:duration:", 0.4, 0.55);
  -[ABFloatSpringProperty setInput:](self->_islandHeight, "setInput:", 171.0);
  -[ABFloatSpringProperty setBounce:duration:](self->_islandY, "setBounce:duration:", 0.0, 0.55);
  -[ABFloatSpringProperty setInput:](self->_islandY, "setInput:", 105.0);
  -[ABFloatSpringProperty setInput:](self->_ringerVisible, "setInput:", 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringerVisible, 0);
  objc_storeStrong((id *)&self->_islandShake2, 0);
  objc_storeStrong((id *)&self->_islandShake1, 0);
  objc_storeStrong((id *)&self->_islandHeight, 0);
  objc_storeStrong((id *)&self->_islandWidth, 0);
  objc_storeStrong((id *)&self->_islandY, 0);
  objc_storeStrong((id *)&self->_ringerStateController, 0);
  objc_storeStrong((id *)&self->_ringerLayer, 0);
  objc_storeStrong((id *)&self->_islandLayer, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end
