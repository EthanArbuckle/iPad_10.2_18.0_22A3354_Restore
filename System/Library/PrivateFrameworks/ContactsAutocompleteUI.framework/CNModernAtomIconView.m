@implementation CNModernAtomIconView

- (CNModernAtomIconView)initWithFrame:(CGRect)a3
{
  CNModernAtomIconView *v3;
  id v4;
  uint64_t v5;
  NUIContainerStackView *stackView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNModernAtomIconView;
  v3 = -[CNModernAtomIconView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CFAAB0]);
    -[CNModernAtomIconView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    stackView = v3->_stackView;
    v3->_stackView = (NUIContainerStackView *)v5;

    -[NUIContainerStackView setAutoresizingMask:](v3->_stackView, "setAutoresizingMask:", 18);
    -[NUIContainerStackView setAlignment:](v3->_stackView, "setAlignment:", 3);
    -[NUIContainerStackView setDistribution:](v3->_stackView, "setDistribution:", 3);
    -[CNModernAtomIconView addSubview:](v3, "addSubview:", v3->_stackView);
  }
  return v3;
}

- (void)setIconPadding:(double)a3
{
  -[NUIContainerStackView setSpacing:](self->_stackView, "setSpacing:", a3);
}

- (double)iconPadding
{
  double result;

  -[NUIContainerStackView spacing](self->_stackView, "spacing");
  return result;
}

- (void)setIconImages:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (self->_iconImages != v5)
  {
    objc_storeStrong((id *)&self->_iconImages, a3);
    -[NUIContainerStackView setArrangedSubviews:](self->_stackView, "setArrangedSubviews:", 0);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = objc_alloc(MEMORY[0x1E0CEA658]);
          v13 = (void *)objc_msgSend(v12, "initWithImage:", v11, (_QWORD)v14);
          objc_msgSend(v13, "setContentMode:", 1);
          -[NUIContainerStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v13);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (double)preferredWidth
{
  void *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CNModernAtomIconView iconImages](self, "iconImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__CNModernAtomIconView_preferredWidth__block_invoke;
  v6[3] = &unk_1E62BFBE0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __38__CNModernAtomIconView_preferredWidth__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "size");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "spacing");
  UIRoundToViewScale();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (NSArray)iconImages
{
  return self->_iconImages;
}

- (NUIContainerStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (CGPoint)drawingOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_drawingOffset.x;
  y = self->_drawingOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDrawingOffset:(CGPoint)a3
{
  self->_drawingOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_iconImages, 0);
}

@end
