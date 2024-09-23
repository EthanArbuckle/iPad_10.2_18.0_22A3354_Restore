@implementation CSLayoutStrategy

- (CGRect)suggestedFrameForDateTimeViewInScreenCoordinates:(CGRect)a3 forceCenteredX:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id WeakRetained;
  int v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_persistentLayout);
  objc_msgSend(WeakRetained, "dateTimeMostExtremeLeadingX");
  objc_msgSend(WeakRetained, "dateTimeMostExtremeTrailingX");
  v10 = objc_msgSend(WeakRetained, "containsCenteredDateTimeLayout");
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  CGRectGetMidX(v25);
  if (v10)
  {
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    CGRectGetWidth(v26);
    v11 = BSFloatGreaterThanOrEqualToFloat();
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    CGRectGetWidth(v27);
    if (v11)
    {
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      CGRectGetHeight(v28);
      if (!v4)
        goto LABEL_7;
    }
    else if (!v4)
    {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  CGRectGetWidth(v29);
  if (v4)
  {
LABEL_6:
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    CGRectGetWidth(v30);
  }
LABEL_7:
  objc_msgSend(WeakRetained, "timeLabelBaselineY");
  objc_msgSend(MEMORY[0x1E0DA9E58], "timeFontMetrics");
  objc_msgSend(WeakRetained, "timeLabelBaselineY");
  objc_msgSend(WeakRetained, "timeToSubtitleLabelBaselineDifferenceY");
  objc_msgSend(MEMORY[0x1E0DA9E50], "labelFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descender");

  SBFMainScreenScale();
  BSRectRoundForScale();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)suggestedFrameForListForPage:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = -[CSLayoutStrategy _listLayoutForPage:](self, "_listLayoutForPage:", v9);
  if (v10)
  {
    v11 = v10;
    -[CSLayoutStrategy _customListWidthForPage:startingBounds:](self, "_customListWidthForPage:startingBounds:", v9, x, y, width, height);
    v13 = v12;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v14 = CGRectGetWidth(v26) - v13;
    if (BSFloatGreaterThanFloat())
    {
      if (v11 == 1)
      {
        x = v14 * 0.5;
      }
      else
      {
        -[CSLayoutStrategy _listInsetXForPage:](self, "_listInsetXForPage:", v9);
        v16 = v15;
        v27.origin.x = x;
        v27.origin.y = y;
        v27.size.width = width;
        v27.size.height = height;
        v17 = CGRectGetWidth(v27) - (v13 + v16);
        v18 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
        if (v11 == 2)
          v19 = v17;
        else
          v19 = v16;
        if (v11 == 2)
          v20 = v16;
        else
          v20 = v17;
        if (v18 == 1)
          v21 = v19;
        else
          v21 = v20;
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        height = CGRectGetHeight(v28);
        y = 0.0;
        x = v21;
      }
    }
    else
    {
      v13 = width;
    }
  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v22 = x;
  v23 = y;
  v24 = v13;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (UIEdgeInsets)suggestedContentInsetsForListForPage:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  -[CSLayoutStrategy persistentLayout](self, "persistentLayout", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listMinY");
  v5 = v4;
  objc_msgSend(v3, "bottomContentInset");
  v7 = v6;

  v8 = 0.0;
  v9 = 0.0;
  v10 = v5;
  v11 = v7;
  result.right = v9;
  result.bottom = v11;
  result.left = v8;
  result.top = v10;
  return result;
}

- (CGRect)suggestedVisibleFrameForSleeveInScreenCoordinates:(CGRect)a3 forceCenteredX:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CSLayoutStrategy persistentLayout](self, "persistentLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSLayoutStrategy suggestedFrameForDateTimeViewInScreenCoordinates:forceCenteredX:](self, "suggestedFrameForDateTimeViewInScreenCoordinates:forceCenteredX:", v4, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "windowedAccessoryInset");
  v20 = v19;
  objc_msgSend(MEMORY[0x1E0DA9E50], "labelFontMetrics");
  v22 = v18 - v21;

  v23 = v20 + v12;
  v24 = v14;
  v25 = v16 + v20 * -2.0;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (unint64_t)_listWidthStrategyForPage:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "listWidthStrategy");
  else
    v4 = 2;

  return v4;
}

- (unint64_t)_listLayoutForPage:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "listLayout");
  else
    v4 = 0;

  return v4;
}

- (double)_listInsetXForPage:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "listInsetX");
    v4 = v5;
  }

  return v4;
}

- (double)_customListWidthForPage:(id)a3 startingBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = -[CSLayoutStrategy _listWidthStrategyForPage:](self, "_listWidthStrategyForPage:", v9);
  if (v10)
  {
    if (v10 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DAC668], "idealSearchPlatterWidth");
      goto LABEL_8;
    }
    v11 = 0.0;
    if (v10 == 2 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "customListWidth");
LABEL_8:
      v11 = v12;
    }
  }
  else
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v13 = CGRectGetWidth(v16);
    -[CSLayoutStrategy _listInsetXForPage:](self, "_listInsetXForPage:", v9);
    v11 = v13 + v14 * -2.0;
  }

  return v11;
}

- (CSPersistentContentLayoutProviding)persistentLayout
{
  return (CSPersistentContentLayoutProviding *)objc_loadWeakRetained((id *)&self->_persistentLayout);
}

- (void)setPersistentLayout:(id)a3
{
  objc_storeWeak((id *)&self->_persistentLayout, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistentLayout);
}

@end
