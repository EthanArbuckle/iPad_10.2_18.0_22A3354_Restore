@implementation MTStylingProvidingSolidColorView

- (void)setHighlighted:(BOOL)a3
{
  UIView *highlightView;
  id v5;
  UIView *v6;
  UIView *v7;
  double v8;
  _QWORD v9[5];

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    highlightView = self->_highlightView;
    if (!highlightView)
    {
      v5 = objc_alloc(MEMORY[0x24BDF6F90]);
      -[MTStylingProvidingSolidColorView bounds](self, "bounds");
      v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      v7 = self->_highlightView;
      self->_highlightView = v6;

      -[UIView setUserInteractionEnabled:](self->_highlightView, "setUserInteractionEnabled:", 0);
      -[UIView setAutoresizingMask:](self->_highlightView, "setAutoresizingMask:", 18);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __51__MTStylingProvidingSolidColorView_setHighlighted___block_invoke;
      v9[3] = &unk_24C3DB8E0;
      v9[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v9);
      highlightView = self->_highlightView;
      *(_DWORD *)&a3 = self->_highlighted;
    }
    v8 = 1.0;
    if (!a3)
      v8 = 0.0;
    -[UIView setAlpha:](highlightView, "setAlpha:", v8);
  }
}

void __51__MTStylingProvidingSolidColorView_setHighlighted___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cornerRadius");
  if (v2 > 0.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cornerRadius");
    objc_msgSend(v3, "setCornerRadius:");
    objc_msgSend(v6, "cornerCurve");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCornerCurve:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416), 0);
  objc_msgSend(*(id *)(a1 + 32), "visualStylingProviderForCategory:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "automaticallyUpdateView:withStyle:andObserverBlock:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416), 4, &__block_literal_global_2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
}

id __51__MTStylingProvidingSolidColorView_setHighlighted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];

  objc_msgSend(a3, "alpha");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__MTStylingProvidingSolidColorView_setHighlighted___block_invoke_3;
  v5[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v5[4] = v3;
  return (id)MEMORY[0x20BD33610](v5);
}

uint64_t __51__MTStylingProvidingSolidColorView_setHighlighted___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", *(double *)(a1 + 32));
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  NSMutableDictionary *stylingProviders;
  void *v6;
  MTVisualStylingProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;

  stylingProviders = self->_stylingProviders;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](stylingProviders, "objectForKey:", v6);
  v7 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[MTStylingProvidingSolidColorView _stylingProvidingSolidColorLayer](self, "_stylingProvidingSolidColorLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visualStylingProviderForCategory:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[MTVisualStylingProvider initWithCoreMaterialVisualStylingProvider:]([MTVisualStylingProvider alloc], "initWithCoreMaterialVisualStylingProvider:", v10);
    v11 = self->_stylingProviders;
    if (!v11)
    {
      v12 = (NSMutableDictionary *)objc_opt_new();
      v13 = self->_stylingProviders;
      self->_stylingProviders = v12;

      v11 = self->_stylingProviders;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v7, v14);

  }
  return v7;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (NSMutableDictionary)stylingProviders
{
  return self->_stylingProviders;
}

- (void)setStylingProviders:(id)a3
{
  objc_storeStrong((id *)&self->_stylingProviders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProviders, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
}

@end
