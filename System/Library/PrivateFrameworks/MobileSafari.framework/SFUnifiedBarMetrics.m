@implementation SFUnifiedBarMetrics

+ (NSArray)traitsAffectingBarMetrics
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (double)defaultItemHeight
{
  return 36.0;
}

+ (double)minimumSquishScale
{
  return 0.7;
}

+ (double)separatorWidth
{
  return 2.0;
}

+ (double)squishedInlineBarHeight
{
  return 19.0;
}

+ (double)transitioningItemScale
{
  return 0.8;
}

+ (double)defaultSquishedContentSpacing
{
  return 8.0;
}

- (SFUnifiedBarMetrics)initWithTraitCollection:(id)a3
{
  id v4;
  SFUnifiedBarMetrics *v5;
  SFUnifiedBarMetrics *v6;
  SFUnifiedBarMetrics *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedBarMetrics;
  v5 = -[SFUnifiedBarMetrics init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SFUnifiedBarMetrics updateWithTraitCollection:](v5, "updateWithTraitCollection:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)setMetricsCategory:(int64_t)a3
{
  if (self->_metricsCategory != a3)
  {
    self->_metricsCategory = a3;
    -[SFUnifiedBarMetrics _updateMetrics](self, "_updateMetrics");
  }
}

- (BOOL)updateWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "legibilityWeight");

  LOBYTE(self) = -[SFUnifiedBarMetrics _updateWithContentSizeCategory:legibilityWeight:](self, "_updateWithContentSizeCategory:legibilityWeight:", v5, v6);
  return (char)self;
}

- (BOOL)_updateWithContentSizeCategory:(id)a3 legibilityWeight:(int64_t)a4
{
  id v6;
  void *v7;
  UILegibilityWeight v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UITraitCollection *v14;
  UITraitCollection *traitCollection;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[UITraitCollection preferredContentSizeCategory](self->_traitCollection, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!WBSIsEqual())
  {

    goto LABEL_5;
  }
  v8 = -[UITraitCollection legibilityWeight](self->_traitCollection, "legibilityWeight");

  if (v8 != a4)
  {
LABEL_5:
    v10 = (void *)MEMORY[0x1E0DC3E88];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithLegibilityWeight:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traitCollectionWithTraitsFromCollections:", v13);
    v14 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    traitCollection = self->_traitCollection;
    self->_traitCollection = v14;

    -[SFUnifiedBarMetrics _updateMetrics](self, "_updateMetrics");
    v9 = 1;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (void)_updateMetrics
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[SFUnifiedBarMetrics defaultItemHeight](self, "defaultItemHeight");
  v4 = v3;
  -[SFUnifiedBarMetrics _scaledValueForValue:](self, "_scaledValueForValue:");
  self->_itemHeight = fmax(v5, v4);
  objc_msgSend((id)objc_opt_class(), "squishedInlineBarHeight");
  -[SFUnifiedBarMetrics _scaledValueForValue:](self, "_scaledValueForValue:");
  self->_squishedInlineBarHeight = v6;
}

- (double)_scaledValueForValue:(double)a3
{
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValueForValue:compatibleWithTraitCollection:", self->_traitCollection, a3);
  v7 = v6;

  return v7;
}

- (double)cutoutBorderWidth
{
  return 2.0;
}

- (double)defaultItemHeight
{
  double result;

  result = 36.0;
  if (self->_metricsCategory)
    return 28.0;
  return result;
}

- (double)itemCornerRadius
{
  return 10.0;
}

- (double)leadingTabIconInset
{
  double result;

  result = 7.0;
  if (!self->_metricsCategory)
    return 10.0;
  return result;
}

- (double)maximumItemSpacing
{
  return 34.0;
}

- (double)minimumItemSpacing
{
  return 20.0;
}

- (double)tabCloseButtonWidth
{
  double result;

  result = 33.0;
  if (!self->_metricsCategory)
    return 36.0;
  return result;
}

- (int64_t)metricsCategory
{
  return self->_metricsCategory;
}

- (double)itemHeight
{
  return self->_itemHeight;
}

- (double)squishedInlineBarHeight
{
  return self->_squishedInlineBarHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
