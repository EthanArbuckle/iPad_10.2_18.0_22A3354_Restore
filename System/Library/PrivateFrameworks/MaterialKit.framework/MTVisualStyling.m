@implementation MTVisualStyling

void __68__MTVisualStyling_VisualStylingSupport__applyToView_withColorBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!a2 || v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;

    v7 = v8;
    if (v8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v7 = v8;
    }

  }
}

- (UIColor)color
{
  void *v3;
  SEL v4;
  SEL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  -[MTCoreMaterialVisualStyling tintColorName](self->_coreMaterialVisualStyling, "tintColorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
    goto LABEL_7;
  v4 = NSSelectorFromString((NSString *)v3);
  if (!v4)
    goto LABEL_7;
  v5 = v4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDF6950], "performSelector:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MTCoreMaterialVisualStyling tintColorUIStyle](self->_coreMaterialVisualStyling, "tintColorUIStyle");
  if (v7 >= 1)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resolvedColorWithTraitCollection:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  if (!v6)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", -[MTCoreMaterialVisualStyling tintColor](self->_coreMaterialVisualStyling, "tintColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v6;
}

- (void)applyToView:(id)a3 withColorBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__MTVisualStyling_VisualStylingSupport__applyToView_withColorBlock___block_invoke;
  v12[3] = &unk_24C3DBA68;
  v14 = &v15;
  v8 = v7;
  v12[4] = self;
  v13 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD33610](v12);
  -[MTVisualStyling _coreMaterialVisualStyling](self, "_coreMaterialVisualStyling");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_applyToLayer:withColorBlock:", v11, v9);

  if (!*((_BYTE *)v16 + 24))
    v9[2](v9, 0);

  _Block_object_dispose(&v15, 8);
}

- (MTCoreMaterialVisualStyling)_coreMaterialVisualStyling
{
  return self->_coreMaterialVisualStyling;
}

- (MTVisualStyling)initWithCoreMaterialVisualStyling:(id)a3
{
  id v5;
  MTVisualStyling *v6;
  MTVisualStyling *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTVisualStyling;
  v6 = -[MTVisualStyling init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_coreMaterialVisualStyling, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreMaterialVisualStyling, 0);
}

- (id)visualEffect
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _MTVisualStylingVibrancyEffect *v9;
  uint64_t v11;

  -[MTCoreMaterialVisualStyling _composedFilter](self->_coreMaterialVisualStyling, "_composedFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE5C30]);

  if (v5)
  {
    objc_msgSend(v3, "valueForKey:", *MEMORY[0x24BE1E480]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (void *)MEMORY[0x24BDF6F88];
      objc_msgSend(v6, "CAColorMatrixValue");
      -[MTVisualStyling alpha](self, "alpha");
      objc_msgSend(v8, "_vibrantEffectWithCAColorMatrix:alpha:", &v11);
      v9 = (_MTVisualStylingVibrancyEffect *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = -[_MTVisualStylingVibrancyEffect initWithVisualStyling:]([_MTVisualStylingVibrancyEffect alloc], "initWithVisualStyling:", self);
  }

  return v9;
}

- (id)_layerConfig
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  MTCoreMaterialVisualStyling *coreMaterialVisualStyling;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  unsigned __int8 v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = 0;
  -[MTCoreMaterialVisualStyling _getCompositingFilter:tintColor:](self->_coreMaterialVisualStyling, "_getCompositingFilter:tintColor:", &v17, &v18);
  v3 = (unint64_t)v17;
  if (v3 | v18)
  {
    v4 = (void *)MEMORY[0x24BDF7188];
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerWithTintColor:filterType:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
    v15 = 0;
    coreMaterialVisualStyling = self->_coreMaterialVisualStyling;
    v14 = 0;
    -[MTCoreMaterialVisualStyling _getFilterType:vibrantColor:tintColor:inputReversed:](coreMaterialVisualStyling, "_getFilterType:vibrantColor:tintColor:inputReversed:", &v14, &v16, &v18, &v15);
    v5 = v14;
    v6 = 0;
    if (v5 && v16 && v18)
    {
      v8 = (void *)MEMORY[0x24BDF7190];
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("inputReversed");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layerWithVibrantColor:tintColor:filterType:filterAttributes:", v9, v10, v5, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (NSString)visualStyleSetName
{
  return (NSString *)-[MTCoreMaterialVisualStyling visualStyleSetName](self->_coreMaterialVisualStyling, "visualStyleSetName");
}

- (NSString)visualStyleName
{
  return (NSString *)-[MTCoreMaterialVisualStyling visualStyleName](self->_coreMaterialVisualStyling, "visualStyleName");
}

- (double)alpha
{
  double result;

  -[MTCoreMaterialVisualStyling tintAlpha](self->_coreMaterialVisualStyling, "tintAlpha");
  return result;
}

- (CAFilter)composedFilter
{
  return (CAFilter *)-[MTCoreMaterialVisualStyling _composedFilter](self->_coreMaterialVisualStyling, "_composedFilter");
}

@end
