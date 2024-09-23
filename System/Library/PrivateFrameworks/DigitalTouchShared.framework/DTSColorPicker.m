@implementation DTSColorPicker

- (DTSColorPicker)initWithFrame:(CGRect)a3
{
  DTSColorPicker *v3;
  uint64_t v4;
  UILongPressGestureRecognizer *longPressRecognizer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DTSColorPicker;
  v3 = -[DTSColorPicker initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", v3, sel_didReceiveLongPress_);
    longPressRecognizer = v3->_longPressRecognizer;
    v3->_longPressRecognizer = (UILongPressGestureRecognizer *)v4;

    -[DTSColorPicker addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_longPressRecognizer);
  }
  return v3;
}

- (UIColor)selectedColor
{
  return (UIColor *)-[ETPaletteCircleView backgroundColor](self->_selectedCircle, "backgroundColor");
}

- (double)colorCircleHorizontalSpacing
{
  unint64_t colorCircleSize;
  double result;

  colorCircleSize = self->_colorCircleSize;
  result = 6.0;
  if (colorCircleSize == 1)
    result = 24.0;
  if (colorCircleSize == 2)
    return 36.0;
  return result;
}

- (double)colorCircleDiameter
{
  unint64_t colorCircleSize;
  double result;

  colorCircleSize = self->_colorCircleSize;
  if (colorCircleSize == 2)
    return 36.0;
  if (colorCircleSize == 1)
    return 30.0;
  result = 20.0;
  if (!colorCircleSize)
    +[ETPaletteCircleView paletteCircleDiameter](ETPaletteCircleView, "paletteCircleDiameter", 20.0);
  return result;
}

- (void)setColorCircleSize:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (self->_colorCircleSize != a3)
  {
    self->_colorCircleSize = a3;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = self->_paletteCircles;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v9, "frame", (_QWORD)v20);
          v11 = v10;
          v13 = v12;
          -[DTSColorPicker colorCircleDiameter](self, "colorCircleDiameter");
          v15 = v14;
          objc_msgSend(v9, "center");
          v17 = v16;
          v19 = v18;
          objc_msgSend(v9, "setFrame:", v11, v13, v15, v15);
          objc_msgSend(v9, "setCenter:", v17, v19);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

    -[ETPaletteCircleView setNeedsLayout](self->_selectedCircle, "setNeedsLayout");
    -[DTSColorPicker setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)createPaletteCirclesWithParentView:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t i;
  ETPaletteCircleView *v11;
  void *v12;
  void *v13;
  NSArray *paletteCircles;
  NSArray *v15;
  NSArray *v16;
  void *v17;
  ETPaletteCircleView *v18;
  ETPaletteCircleView *selectedCircle;
  id v20;

  v20 = a3;
  +[ETPaletteCircleView paletteCircleDiameter](ETPaletteCircleView, "paletteCircleDiameter");
  v5 = v4;
  +[ETColorStore defaultStore](ETColorStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v8);
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      v11 = -[ETPaletteCircleView initWithFrame:]([ETPaletteCircleView alloc], "initWithFrame:", 0.0, 0.0, v5, v5);
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ETPaletteCircleView setBackgroundColor:](v11, "setBackgroundColor:", v12);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_paletteCircleTapped_);
      objc_msgSend(v13, "requireGestureRecognizerToFail:", self->_longPressRecognizer);
      -[ETPaletteCircleView addGestureRecognizer:](v11, "addGestureRecognizer:", v13);
      -[NSArray addObject:](v9, "addObject:", v11);
      objc_msgSend(v20, "addSubview:", v11);

    }
  }
  paletteCircles = self->_paletteCircles;
  self->_paletteCircles = v9;
  v15 = v9;

  v16 = self->_paletteCircles;
  +[ETColorStore defaultStore](ETColorStore, "defaultStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](v16, "objectAtIndex:", objc_msgSend(v17, "selectedColorIndex"));
  v18 = (ETPaletteCircleView *)objc_claimAutoreleasedReturnValue();
  selectedCircle = self->_selectedCircle;
  self->_selectedCircle = v18;

  -[ETPaletteCircleView setSelected:](self->_selectedCircle, "setSelected:", 1);
}

- (void)selectCircle:(id)a3 completion:(id)a4
{
  ETPaletteCircleView *v6;
  id v7;
  id v8;
  ETPaletteCircleView *selectedCircle;
  ETPaletteCircleView *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = (ETPaletteCircleView *)a3;
  v7 = a4;
  -[ETPaletteCircleView setSelected:animated:completion:](self->_selectedCircle, "setSelected:animated:completion:", 0, 1, 0);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__DTSColorPicker_selectCircle_completion___block_invoke;
  v12[3] = &unk_24F6E6A70;
  v13 = v7;
  v8 = v7;
  -[ETPaletteCircleView setSelected:animated:completion:](v6, "setSelected:animated:completion:", 1, 1, v12);
  selectedCircle = self->_selectedCircle;
  self->_selectedCircle = v6;
  v10 = v6;

  +[ETColorStore defaultStore](ETColorStore, "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelectedColorIndex:", -[NSArray indexOfObject:](self->_paletteCircles, "indexOfObject:", self->_selectedCircle));

}

uint64_t __42__DTSColorPicker_selectCircle_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)paletteCircleTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[DTSColorPicker selectedCircle](self, "selectedCircle");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v7)
  {
    -[DTSColorPicker selectCircle:completion:](self, "selectCircle:completion:", v7, 0);
    -[DTSColorPicker delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorPickerSelectedColorDidChange:", self);

  }
  -[DTSColorPicker delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorPickerTapped:", self);

}

- (void)didReceiveLongPress:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGPoint v25;
  CGRect v26;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    objc_msgSend(v4, "locationInView:", self);
    v6 = v5;
    v8 = v7;
    -[DTSColorPicker paletteCircles](self, "paletteCircles");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "frame");
          v25.x = v6;
          v25.y = v8;
          if (CGRectContainsPoint(v26, v25))
          {
            v15 = v14;

            if (v15)
            {
              objc_msgSend(v9, "lastObject");
              v16 = (id)objc_claimAutoreleasedReturnValue();

              if (v15 != v16)
              {
                -[DTSColorPicker selectedCircle](self, "selectedCircle");
                v17 = (id)objc_claimAutoreleasedReturnValue();

                if (v15 == v17)
                {
                  -[DTSColorPicker showColorWheel](self, "showColorWheel");
                }
                else
                {
                  v18[0] = MEMORY[0x24BDAC760];
                  v18[1] = 3221225472;
                  v18[2] = __38__DTSColorPicker_didReceiveLongPress___block_invoke;
                  v18[3] = &unk_24F6E6A98;
                  v18[4] = self;
                  -[DTSColorPicker selectCircle:completion:](self, "selectCircle:completion:", v15, v18);
                }
              }
            }
            goto LABEL_16;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }

    v15 = 0;
LABEL_16:

  }
}

uint64_t __38__DTSColorPicker_didReceiveLongPress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showColorWheel");
}

- (DTSColorPickerDelegate)delegate
{
  return (DTSColorPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
}

- (unint64_t)colorCircleSize
{
  return self->_colorCircleSize;
}

- (NSArray)paletteCircles
{
  return self->_paletteCircles;
}

- (void)setPaletteCircles:(id)a3
{
  objc_storeStrong((id *)&self->_paletteCircles, a3);
}

- (ETPaletteCircleView)selectedCircle
{
  return self->_selectedCircle;
}

- (void)setSelectedCircle:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCircle, a3);
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_selectedCircle, 0);
  objc_storeStrong((id *)&self->_paletteCircles, 0);
}

@end
