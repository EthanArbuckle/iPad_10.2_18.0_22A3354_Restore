@implementation QSSelectionHighlightView

- (QSSelectionHighlightView)initWithFrame:(CGRect)a3
{
  QSSelectionHighlightView *v3;
  QSSelectionHighlightView *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *viewCache;
  QSSelectionHighlightView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)QSSelectionHighlightView;
  v3 = -[QSSelectionHighlightView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[QSSelectionHighlightView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[QSSelectionHighlightView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsHitTesting:", 0);

    -[QSSelectionHighlightView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QSSelectionHighlightView setBackgroundColor:](v4, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    viewCache = v4->_viewCache;
    v4->_viewCache = (NSMutableArray *)v7;

    v9 = v4;
  }

  return v4;
}

- (UIColor)selectionColor
{
  UIColor *selectionColor;
  UIColor *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;

  selectionColor = self->_selectionColor;
  if (selectionColor)
  {
    v3 = selectionColor;
  }
  else
  {
    -[QSSelectionHighlightView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5 == 2)
    {
      v6 = 0.67;
      v7 = 0.35;
      v8 = 1.0;
    }
    else
    {
      v6 = 0.33;
      v7 = 0.65;
      v8 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v8, v6, v7, 0.2);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (UIColor)underlineColor
{
  UIColor *underlineColor;

  underlineColor = self->_underlineColor;
  if (underlineColor)
    return underlineColor;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setHighlightSelectionRects:(id)a3
{
  objc_storeStrong((id *)&self->_highlightSelectionRects, a3);
  -[QSSelectionHighlightView _processSelectionRects](self, "_processSelectionRects");
}

- (void)_processSelectionRects
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t i;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  QSSelectionHighlightDetailedView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = self->_highlightSelectionRects;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v32;
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v30 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "rectValue", v29);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        -[QSSelectionHighlightView frame](self, "frame");
        v39.origin.x = v20;
        v39.origin.y = v21;
        v39.size.width = v22;
        v39.size.height = v23;
        v37.origin.x = v13;
        v37.origin.y = v15;
        v37.size.width = v17;
        v37.size.height = v19;
        v38 = CGRectIntersection(v37, v39);
        if (fabs(v38.size.width) >= 0.001
          && fabs(v38.size.height) >= 0.001
          && v38.size.width > 0.0
          && v38.size.height > 0.0)
        {
          if (v6 >= -[NSMutableArray count](self->_viewCache, "count"))
          {
            v24 = -[QSSelectionHighlightDetailedView initWithFrame:]([QSSelectionHighlightDetailedView alloc], "initWithFrame:", v30, v8, v9, v10);
            objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[QSSelectionHighlightDetailedView setBackgroundColor:](v24, "setBackgroundColor:", v25);

            -[NSMutableArray addObject:](self->_viewCache, "addObject:", v24);
            -[QSSelectionHighlightView addSubview:](self, "addSubview:", v24);
          }
          else
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_viewCache, "objectAtIndexedSubscript:", v6);
            v24 = (QSSelectionHighlightDetailedView *)objc_claimAutoreleasedReturnValue();
          }
          -[QSSelectionHighlightDetailedView setDisplayRect:](v24, "setDisplayRect:", v13, v15, v17, v19);
          -[QSSelectionHighlightView underlineColor](self, "underlineColor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[QSSelectionHighlightDetailedView setUnderlineColor:](v24, "setUnderlineColor:", v26);

          -[QSSelectionHighlightDetailedView setSentenceHighlight:](v24, "setSentenceHighlight:", -[QSSelectionHighlightView sentenceHighlight](self, "sentenceHighlight"));
          -[QSSelectionHighlightView selectionColor](self, "selectionColor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[QSSelectionHighlightDetailedView setSelectionColor:](v24, "setSelectionColor:", v27);

          -[QSSelectionHighlightDetailedView setHidden:](v24, "setHidden:", 0);
          ++v6;

        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  while (v6 < -[NSMutableArray count](self->_viewCache, "count", v29))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_viewCache, "objectAtIndexedSubscript:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidden:", 1);

    ++v6;
  }
}

- (NSArray)highlightSelectionRects
{
  return self->_highlightSelectionRects;
}

- (void)setSelectionColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionColor, a3);
}

- (void)setUnderlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_underlineColor, a3);
}

- (BOOL)sentenceHighlight
{
  return self->_sentenceHighlight;
}

- (void)setSentenceHighlight:(BOOL)a3
{
  self->_sentenceHighlight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlineColor, 0);
  objc_storeStrong((id *)&self->_selectionColor, 0);
  objc_storeStrong((id *)&self->_highlightSelectionRects, 0);
  objc_storeStrong((id *)&self->_viewCache, 0);
}

@end
