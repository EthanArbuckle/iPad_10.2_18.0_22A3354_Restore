@implementation MRUEqualizerView

- (MRUEqualizerView)initWithNumberOfBars:(unint64_t)a3 width:(double)a4 spacing:(double)a5
{
  MRUEqualizerView *v8;
  MRUEqualizerView *v9;
  void *i;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *barViews;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MRUEqualizerView;
  v8 = -[MRUEqualizerView init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_width = a4;
    v8->_spacing = a5;
    v8->_visualStyle = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);

      objc_msgSend(v11, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCornerRadius:", 1.0);

      -[MRUEqualizerView addSubview:](v9, "addSubview:", v11);
      objc_msgSend(i, "addObject:", v11);

    }
    v14 = objc_msgSend(i, "copy");
    barViews = v9->_barViews;
    v9->_barViews = (NSArray *)v14;

  }
  return v9;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUEqualizerView;
  -[MRUEqualizerView layoutSubviews](&v3, sel_layoutSubviews);
  if (!self->_animating)
    -[MRUEqualizerView updateBarHeights](self, "updateBarHeights");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MRUEqualizerView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MRUEqualizerView;
  -[MRUEqualizerView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  if (self->_animating)
  {
    -[MRUEqualizerView bounds](self, "bounds");
    if (v13 != v9 || v12 != v11)
      -[MRUEqualizerView startAnimating](self, "startAnimating");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  v5 = -[NSArray count](self->_barViews, "count", a3.width);
  v6 = self->_spacing * (double)(v5 - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  v7 = v6 + (double)v5 * self->_width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (a3)
      -[MRUEqualizerView startAnimating](self, "startAnimating");
    else
      -[MRUEqualizerView stopAnimating](self, "stopAnimating");
  }
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUEqualizerView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setVisualStyle:(int64_t)a3
{
  if (self->_visualStyle != a3)
  {
    self->_visualStyle = a3;
    -[MRUEqualizerView updateVisualStyling](self, "updateVisualStyling");
  }
}

- (void)updateVisualStyling
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_barViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", self->_visualStyle, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)updateBarHeights
{
  _BOOL4 animating;
  double Height;
  NSArray *barViews;
  _QWORD v6[6];
  CGRect v7;

  animating = self->_animating;
  -[MRUEqualizerView bounds](self, "bounds");
  Height = CGRectGetHeight(v7);
  if (!animating)
    Height = Height * 0.3;
  barViews = self->_barViews;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__MRUEqualizerView_updateBarHeights__block_invoke;
  v6[3] = &unk_1E581A0C0;
  v6[4] = self;
  *(double *)&v6[5] = Height;
  -[NSArray enumerateObjectsUsingBlock:](barViews, "enumerateObjectsUsingBlock:", v6);
}

void __36__MRUEqualizerView_updateBarHeights__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double *v4;
  double v5;
  id v6;
  CGRect v7;

  v4 = *(double **)(a1 + 32);
  v5 = (v4[55] + v4[56]) * (double)a3;
  v6 = a2;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v6, "setFrame:", v5, CGRectGetHeight(v7) - *(double *)(a1 + 40), *(double *)(*(_QWORD *)(a1 + 32) + 440));

}

- (void)startAnimating
{
  -[MRUEqualizerView updateBarHeights](self, "updateBarHeights");
  -[NSArray enumerateObjectsUsingBlock:](self->_barViews, "enumerateObjectsUsingBlock:", &__block_literal_global_19);
}

void __34__MRUEqualizerView_startAnimating__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v6, v8 * 7.0 / 12.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v6, v8 * 5.0 / 12.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValues:", v13);

  objc_msgSend(v9, "setKeyPath:", CFSTR("bounds"));
  objc_msgSend(v9, "setKeyTimes:", &unk_1E58784E0);
  objc_msgSend(v9, "setDuration:", 2.0);
  *(float *)&v14 = (float)a3 + 1.0;
  objc_msgSend(v9, "setSpeed:", v14);
  LODWORD(v15) = 2139095040;
  objc_msgSend(v9, "setRepeatCount:", v15);
  objc_msgSend(v4, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BarAnimation_%ld"), a3 + 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v9, v17);

}

- (void)stopAnimating
{
  -[MRUEqualizerView updateBarHeights](self, "updateBarHeights");
  -[NSArray enumerateObjectsUsingBlock:](self->_barViews, "enumerateObjectsUsingBlock:", &__block_literal_global_15);
}

void __33__MRUEqualizerView_stopAnimating__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a2;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v18 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  v9 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v4, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  objc_msgSend(v9, "valueWithCGRect:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFromValue:", v12);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v6, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setToValue:", v13);

  objc_msgSend(v18, "setKeyPath:", CFSTR("bounds"));
  objc_msgSend(v18, "setDuration:", 0.25);
  *(float *)&v14 = (float)a3 + 1.0;
  objc_msgSend(v18, "setSpeed:", v14);
  LODWORD(v15) = 1.0;
  objc_msgSend(v18, "setRepeatCount:", v15);
  objc_msgSend(v4, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BarAnimation_%ld"), a3 + 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v18, v17);

}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (NSArray)barViews
{
  return self->_barViews;
}

- (void)setBarViews:(id)a3
{
  objc_storeStrong((id *)&self->_barViews, a3);
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (int64_t)visualStyle
{
  return self->_visualStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barViews, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end
