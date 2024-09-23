@implementation CAMInterfaceModulationView

- (CAMInterfaceModulationView)initWithHostingView:(id)a3
{
  id v4;
  CAMInterfaceModulationView *v5;
  CAMInterfaceModulationView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMInterfaceModulationView;
  v5 = -[CAMInterfaceModulationView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_hostingView, v4);
    v6->_interfaceModulation = 0;
  }

  return v6;
}

- (void)didAddSubview:(id)a3
{
  id v3;

  -[CAMInterfaceModulationView hostingView](self, "hostingView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CAMInterfaceModulationView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMInterfaceModulationView;
  -[CAMInterfaceModulationView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CAMInterfaceModulationView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void)setInterfaceModulation:(unint64_t)a3
{
  -[CAMInterfaceModulationView setInterfaceModulation:animated:](self, "setInterfaceModulation:animated:", a3, 0);
}

- (void)setInterfaceModulation:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  CAMAnimationDelegate *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id location;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (self->_interfaceModulation != a3)
  {
    v4 = a4;
    if (a3 > 2)
      v6 = 0;
    else
      v6 = qword_1EA32CF08[a3];
    self->_interfaceModulation = a3;
    -[CAMInterfaceModulationView _modulationFilter](self, "_modulationFilter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMInterfaceModulationView _keyPathForFilterKey:](self, "_keyPathForFilterKey:", *MEMORY[0x1E0CD2DA8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMInterfaceModulationView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C78]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", &unk_1EA3B0BC8, *MEMORY[0x1E0CD2CB8]);
      objc_msgSend(v7, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2CA8]);
      objc_msgSend(v7, "setName:", CFSTR("modulationFilter"));
      -[CAMInterfaceModulationView _setModulationFilter:](self, "_setModulationFilter:", v7);
      v24[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFilters:", v10);

    }
    if (v4)
    {
      objc_msgSend(v9, "presentationLayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v9, "presentationLayer");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = v9;
      }
      v14 = v13;

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueForKeyPath:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFromValue:", v16);

      objc_msgSend(v15, "setToValue:", v6);
      objc_msgSend(v15, "setDuration:", 0.3);
      -[CAMInterfaceModulationView _setInFlightAnimationCount:](self, "_setInFlightAnimationCount:", -[CAMInterfaceModulationView _inFlightAnimationCount](self, "_inFlightAnimationCount") + 1);
      objc_initWeak(&location, self);
      v17 = objc_alloc_init(CAMAnimationDelegate);
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __62__CAMInterfaceModulationView_setInterfaceModulation_animated___block_invoke;
      v21 = &unk_1EA32A4A0;
      objc_copyWeak(&v22, &location);
      -[CAMAnimationDelegate setCompletion:](v17, "setCompletion:", &v18);
      objc_msgSend(v15, "setDelegate:", v17, v18, v19, v20, v21);
      objc_msgSend(v9, "addAnimation:forKey:", v15, CFSTR("interfaceModulationAnimation"));
      objc_destroyWeak(&v22);

      objc_destroyWeak(&location);
    }
    objc_msgSend(v9, "setValue:forKeyPath:", v6, v8);
    -[CAMInterfaceModulationView _updateModulationLayerEnabled](self, "_updateModulationLayerEnabled");

  }
}

void __62__CAMInterfaceModulationView_setInterfaceModulation_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "modulationAnimationDidStop:", a2);

}

- (void)modulationAnimationDidStop:(BOOL)a3
{
  -[CAMInterfaceModulationView _setInFlightAnimationCount:](self, "_setInFlightAnimationCount:", -[CAMInterfaceModulationView _inFlightAnimationCount](self, "_inFlightAnimationCount", a3) - 1);
  -[CAMInterfaceModulationView _updateModulationLayerEnabled](self, "_updateModulationLayerEnabled");
}

- (void)_updateModulationLayerEnabled
{
  unint64_t v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[CAMInterfaceModulationView interfaceModulation](self, "interfaceModulation");
  if (v3 - 1 >= 2)
  {
    if (v3)
      v4 = 0;
    else
      v4 = -[CAMInterfaceModulationView _inFlightAnimationCount](self, "_inFlightAnimationCount") != 0;
  }
  else
  {
    v4 = 1;
  }
  -[CAMInterfaceModulationView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMInterfaceModulationView _keyPathForFilterKey:](self, "_keyPathForFilterKey:", CFSTR("enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKeyPath:", v5, v6);

}

- (id)_keyPathForFilterKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filters.%@.%@"), CFSTR("modulationFilter"), a3);
}

- (UIView)hostingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_hostingView);
}

- (unint64_t)interfaceModulation
{
  return self->_interfaceModulation;
}

- (CAFilter)_modulationFilter
{
  return self->__modulationFilter;
}

- (void)_setModulationFilter:(id)a3
{
  objc_storeStrong((id *)&self->__modulationFilter, a3);
}

- (unint64_t)_inFlightAnimationCount
{
  return self->__inFlightAnimationCount;
}

- (void)_setInFlightAnimationCount:(unint64_t)a3
{
  self->__inFlightAnimationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__modulationFilter, 0);
  objc_destroyWeak((id *)&self->_hostingView);
}

@end
