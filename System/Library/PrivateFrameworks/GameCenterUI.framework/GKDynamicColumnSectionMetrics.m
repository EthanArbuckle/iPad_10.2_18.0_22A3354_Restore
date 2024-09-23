@implementation GKDynamicColumnSectionMetrics

+ (id)dynamicColumnSectionMetricsWithColumnsInPortrait:(unint64_t)a3 columnsInLandscape:(unint64_t)a4 forIdiom:(int64_t)a5
{
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdiom:", a5);
  if (!a3)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (portraitColumnCount > 0)\n[%s (%s:%d)]"), v10, "+[GKDynamicColumnSectionMetrics dynamicColumnSectionMetricsWithColumnsInPortrait:columnsInLandscape:forIdiom:]", objc_msgSend(v12, "UTF8String"), 637);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
    if (a4)
      goto LABEL_3;
LABEL_5:
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (landscapeColumnCount > 0)\n[%s (%s:%d)]"), v15, "+[GKDynamicColumnSectionMetrics dynamicColumnSectionMetricsWithColumnsInPortrait:columnsInLandscape:forIdiom:]", objc_msgSend(v17, "UTF8String"), 638);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v18);
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "setColumnsInPortrait:", a3);
  objc_msgSend(v7, "setColumnsInLandscape:", a4);
  return v7;
}

+ (id)dynamicColumnSectionMetricsWithColumnsInPortrait:(unint64_t)a3 columnsInLandscape:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v9 = *MEMORY[0x1E0D25B68] == 0;
    else
      v9 = 0;
    v10 = !v9;
  }
  else
  {
    v10 = 0;
  }
  return (id)objc_msgSend(a1, "dynamicColumnSectionMetricsWithColumnsInPortrait:columnsInLandscape:forIdiom:", a3, a4, v10);
}

- (GKDynamicColumnSectionMetrics)initWithIdiom:(int64_t)a3
{
  GKDynamicColumnSectionMetrics *result;
  unint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDynamicColumnSectionMetrics;
  result = -[GKSectionMetrics initWithIdiom:](&v6, sel_initWithIdiom_);
  if (result)
  {
    result->_columnsInLandscape = 2;
    v5 = 1;
    if (a3 == 1)
      v5 = 2;
    result->_columnsInPortrait = v5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKDynamicColumnSectionMetrics;
  v4 = -[GKSectionMetrics copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setColumnsInPortrait:", self->_columnsInPortrait);
    objc_msgSend(v5, "setColumnsInLandscape:", self->_columnsInLandscape);
  }
  return v5;
}

- (CGSize)itemSizeForCollectionView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  int *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  v18.receiver = self;
  v18.super_class = (Class)GKDynamicColumnSectionMetrics;
  v4 = a3;
  -[GKSectionMetrics itemSizeForCollectionView:](&v18, sel_itemSizeForCollectionView_, v4);
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", v18.receiver, v18.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "statusBarOrientation") - 3;

  v9 = &OBJC_IVAR___GKDynamicColumnSectionMetrics__columnsInPortrait;
  if (v8 < 2)
    v9 = &OBJC_IVAR___GKDynamicColumnSectionMetrics__columnsInLandscape;
  v10 = *(unint64_t *)((char *)&self->super.super.super.isa + *v9);
  objc_msgSend(v4, "bounds");
  v12 = v11;

  -[GKSectionMetrics padding](self, "padding");
  v15 = (v12 - (v13 + v14)) / (double)v10;
  v16 = floorf(v15);
  v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)updateColumnsInPortrait:(unint64_t)a3 columnsInLandscape:(unint64_t)a4
{
  -[GKDynamicColumnSectionMetrics setColumnsInLandscape:](self, "setColumnsInLandscape:", a4);
  -[GKDynamicColumnSectionMetrics setColumnsInPortrait:](self, "setColumnsInPortrait:", a3);
}

- (unint64_t)columnsInPortrait
{
  return self->_columnsInPortrait;
}

- (void)setColumnsInPortrait:(unint64_t)a3
{
  self->_columnsInPortrait = a3;
}

- (unint64_t)columnsInLandscape
{
  return self->_columnsInLandscape;
}

- (void)setColumnsInLandscape:(unint64_t)a3
{
  self->_columnsInLandscape = a3;
}

@end
