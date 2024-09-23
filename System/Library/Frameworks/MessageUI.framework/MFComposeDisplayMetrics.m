@implementation MFComposeDisplayMetrics

+ (id)displayMetricsWithTraitCollection:(id)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double trailing;
  double v10;
  double leading;
  double v12;
  id v13;
  MFComposeDisplayMetrics *v14;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  trailing = a4.trailing;
  v10 = a4.bottom;
  leading = a4.leading;
  v12 = a4.top;
  v13 = a3;
  if (objc_msgSend(v13, "userInterfaceIdiom") == -1)
  {
    v14 = 0;
  }
  else
  {
    v14 = objc_alloc_init(MFComposeDisplayMetrics);
    -[MFComposeDisplayMetrics setTraitCollection:](v14, "setTraitCollection:", v13);
    -[MFComposeDisplayMetrics setLayoutMargins:](v14, "setLayoutMargins:", v12, leading, v10, trailing);
    -[MFComposeDisplayMetrics setSafeAreaInsets:](v14, "setSafeAreaInsets:", top, left, bottom, right);
  }

  return v14;
}

- (double)trailingButtonMidlineOffset
{
  _BOOL4 v2;
  double result;

  v2 = -[MFComposeDisplayMetrics isCompactHeight](self, "isCompactHeight");
  result = 21.0;
  if (v2)
    return 0.0;
  return result;
}

- (UIEdgeInsets)sendBarButtonItemImageInsets
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  -[MFComposeDisplayMetrics traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection");

  v5 = -[MFComposeDisplayMetrics isCompactHeight](self, "isCompactHeight");
  v6 = 8.5;
  v7 = 0.0;
  if (v5)
    v6 = 0.0;
  if (v4 == 1)
    v8 = v6;
  else
    v8 = 0.0;
  if (v4 == 1)
    v9 = 0.0;
  else
    v9 = v6;
  v10 = v6 <= 0.0;
  if (v6 > 0.0)
    v11 = 0.0;
  else
    v11 = *MEMORY[0x1E0DC49E8];
  if (v10)
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  else
    v12 = v8;
  if (v10)
  {
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v13 = v9;
  }
  result.right = v13;
  result.bottom = v7;
  result.left = v12;
  result.top = v11;
  return result;
}

- (NSDirectionalEdgeInsets)headerViewSeparatorInset
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSDirectionalEdgeInsets result;

  v3 = MEMORY[0x1E0DC3298];
  v4 = *MEMORY[0x1E0DC3298];
  v5 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  -[MFComposeDisplayMetrics layoutMargins](self, "layoutMargins");
  v7 = v6;
  -[MFComposeDisplayMetrics layoutMargins](self, "layoutMargins");
  if (v8 > 30.0)
    -[MFComposeDisplayMetrics layoutMargins](self, "layoutMargins");
  else
    v9 = *(double *)(v3 + 24);
  v10 = v4;
  v11 = v7;
  v12 = v5;
  result.trailing = v9;
  result.bottom = v12;
  result.leading = v11;
  result.top = v10;
  return result;
}

- (BOOL)isCompactHeight
{
  void *v2;
  BOOL v3;

  -[MFComposeDisplayMetrics traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass") == 1;

  return v3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (NSDirectionalEdgeInsets)layoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_layoutMargins.top;
  leading = self->_layoutMargins.leading;
  bottom = self->_layoutMargins.bottom;
  trailing = self->_layoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
