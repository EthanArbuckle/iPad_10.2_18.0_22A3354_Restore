@implementation _PKInkThicknessPicker

- (void)initWithToolConfiguration:(void *)a1
{
  id v3;
  id v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_PKInkThicknessPicker;
    v4 = objc_msgSendSuper2(&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    a1 = v4;
    if (v4)
      -[_PKInkThicknessPicker setToolConfiguration:]((uint64_t)v4, v3);
  }

  return a1;
}

- (void)setToolConfiguration:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  _PKInkThicknessButton *v21;
  float v22;
  double v23;
  double v24;
  double v25;
  id *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1 && (objc_msgSend(*(id *)(a1 + 480), "isEqual:", v4) & 1) == 0)
  {
    v34 = v4;
    objc_storeStrong((id *)(a1 + 480), a2);
    v5 = *(void **)(a1 + 464);
    *(_QWORD *)(a1 + 464) = 0;

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend((id)a1, "thicknessButtons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v42 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "removeFromSuperview", v34);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 480), "strokeWeightsToButtonImages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKInkThicknessPicker _sortedWeights](a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v13;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v46 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v12, "objectForKeyedSubscript:", v18, v34);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "imageWithRenderingMode:", 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = [_PKInkThicknessButton alloc];
          objc_msgSend(v18, "floatValue");
          v23 = v22;
          objc_msgSend(*(id *)(a1 + 480), "strokeWeightButtonSize");
          v26 = -[_PKInkThicknessButton initWithAssetImage:weight:buttonSize:]((id *)&v21->super.super.super.super.super.isa, v20, v23, v24, v25);
          objc_msgSend(*(id *)(a1 + 480), "weightButtonTintColorOverride");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PKInkThicknessButton setImageTintColorOverride:]((uint64_t)v26, v27);

          objc_msgSend(v11, "addObject:", v26);
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v15);
    }

    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v28 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(v11);
          v32 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
          objc_msgSend(v32, "addTarget:action:forControlEvents:", a1, sel_buttonTapped_, 64, v34);
          objc_msgSend((id)a1, "addSubview:", v32);
        }
        v29 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v29);
    }
    v33 = (void *)objc_msgSend(v11, "copy", v34);
    objc_msgSend((id)a1, "setThicknessButtons:", v33);

    objc_msgSend((id)a1, "setNeedsLayout");
    v4 = v35;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  PKToolConfiguration *toolConfiguration;
  double v8;
  double v9;
  CGSize result;

  -[_PKInkThicknessPicker thicknessButtons](self, "thicknessButtons", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)objc_opt_class();
  if (self)
    toolConfiguration = self->_toolConfiguration;
  else
    toolConfiguration = 0;
  -[PKToolConfiguration strokeWeightButtonSize](toolConfiguration, "strokeWeightButtonSize");
  objc_msgSend(v6, "sizeWithButtonCount:buttonSize:", v5);
  result.height = v9;
  result.width = v8;
  return result;
}

+ (CGSize)sizeWithButtonCount:(unint64_t)a3 buttonSize:(CGSize)result
{
  double v4;
  double v5;
  double v6;

  v4 = result.width * (double)a3;
  v5 = (double)(12 * a3 - 12);
  if (a3 <= 1)
    v5 = -0.0;
  v6 = v4 + v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  double weight;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  void *v26;
  unint64_t v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)_PKInkThicknessPicker;
  -[_PKInkThicknessPicker layoutSubviews](&v28, sel_layoutSubviews);
  if (self)
  {
    weight = self->_weight;
    -[_PKInkThicknessPicker _sortedWeights]((uint64_t)self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
      v6 = 0x7FFFFFFFFFFFFFFFLL;
      v7 = INFINITY;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        v10 = vabdd_f64(v9, weight);
        if (v10 < v7)
        {
          v7 = v10;
          v6 = v5;
        }

        ++v5;
      }
      while (v5 < objc_msgSend(v4, "count"));
    }
    else
    {
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v6 = 0;
  }
  -[_PKInkThicknessPicker thicknessButtons](self, "thicknessButtons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      -[_PKInkThicknessPicker thicknessButtons](self, "thicknessButtons");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = 0.0;
      v17 = 0.0;
      v18 = 0.0;
      v19 = 0.0;
      if (self)
      {
        -[PKToolConfiguration strokeWeightButtonSize](self->_toolConfiguration, "strokeWeightButtonSize", 0.0, 0.0, 0.0, 0.0);
        v21 = v20;
        v23 = v22;
        -[PKToolConfiguration strokeWeightButtonSize](self->_toolConfiguration, "strokeWeightButtonSize");
        if (v24 <= 40.0)
          v25 = 12.0;
        else
          v25 = 15.0;
        v19 = DKDCenterRectOverRect(0.0, 0.0, v21, v23, (v21 + v25) * (double)v13, 0.0, v21, v23);
      }
      objc_msgSend(v15, "setFrame:", v19, v18, v17, v16);
      objc_msgSend(v15, "setSelected:", v6 == v13);

      ++v13;
      -[_PKInkThicknessPicker thicknessButtons](self, "thicknessButtons");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

    }
    while (v13 < v27);
  }
}

- (void)buttonTapped:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  float v9;
  double v10;

  v4 = a3;
  -[_PKInkThicknessPicker thicknessButtons](self, "thicknessButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (self)
  {
    -[_PKInkThicknessPicker _sortedWeights]((uint64_t)self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    self->_weight = v10;
    -[_PKInkThicknessPicker setNeedsLayout](self, "setNeedsLayout");
  }

  -[_PKInkThicknessPicker sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  -[_PKInkThicknessPicker setNeedsLayout](self, "setNeedsLayout");
}

- (id)_sortedWeights
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 464);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 480), "strokeWeightsToButtonImages");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 464);
    *(_QWORD *)(a1 + 464) = v5;

    v2 = *(void **)(a1 + 464);
  }
  return v2;
}

- (NSArray)thicknessButtons
{
  return self->_thicknessButtons;
}

- (void)setThicknessButtons:(id)a3
{
  objc_storeStrong((id *)&self->_thicknessButtons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thicknessButtons, 0);
  objc_storeStrong((id *)&self->_toolConfiguration, 0);
  objc_storeStrong((id *)&self->_cachedSortedWeights, 0);
}

@end
