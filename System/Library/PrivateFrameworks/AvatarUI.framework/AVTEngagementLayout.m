@implementation AVTEngagementLayout

+ (double)minimumInterItemSpacingForVisibileBoundsSize:(CGSize)a3 defaultCellSize:(CGSize)a4 engagedCellSize:(CGSize)a5
{
  CGFloat v5;
  double v6;
  double v7;

  v5 = (a3.width - a5.width) * 0.5;
  v6 = floor(a4.width * 0.5);
  v7 = floor(v5 - v6) + 1.0;
  if (v5 <= v6)
    return v7;
  else
    return -v6;
}

+ (UIEdgeInsets)insetsToCenterFirstAndLastItemsGivenContainerSize:(CGSize)a3 itemSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v4 = a3.width * 0.5 - a4.width * 0.5;
  v5 = *MEMORY[0x1E0CEB4B0];
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v7 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (AVTEngagementLayout)initWithDefaultCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 baseInteritemSpacing:(double)a5
{
  double height;
  double width;
  double v7;
  double v8;
  void *v10;
  AVTEngagementLayout *v11;
  _QWORD v13[5];

  height = a4.height;
  width = a4.width;
  v7 = a3.height;
  v8 = a3.width;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__AVTEngagementLayout_initWithDefaultCellSize_engagedCellSize_baseInteritemSpacing___block_invoke;
  v13[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(double *)&v13[4] = a5;
  v10 = (void *)MEMORY[0x1DF0D0754](v13, a2);
  v11 = -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:interItemSpacingProvider:](self, "initWithDefaultCellSize:engagedCellSize:interItemSpacingProvider:", v10, v8, v7, width, height);

  return v11;
}

double __84__AVTEngagementLayout_initWithDefaultCellSize_engagedCellSize_baseInteritemSpacing___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (AVTEngagementLayout)initWithDefaultCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 interItemSpacingProvider:(id)a5
{
  return -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:useEngagementSpacing:interItemSpacingProvider:](self, "initWithDefaultCellSize:engagedCellSize:useEngagementSpacing:interItemSpacingProvider:", 1, a5, a3.width, a3.height, a4.width, a4.height);
}

- (AVTEngagementLayout)initWithDefaultCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 useEngagementSpacing:(BOOL)a5 interItemSpacingProvider:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  id v12;
  AVTEngagementLayout *v13;
  AVTEngagementLayout *v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  id interItemSpacingProvider;
  void *v19;
  uint64_t v20;
  AVTUILogger *logger;
  objc_super v23;

  height = a4.height;
  width = a4.width;
  v9 = a3.height;
  v10 = a3.width;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)AVTEngagementLayout;
  v13 = -[AVTEngagementLayout init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_defaultCellSize.width = v10;
    v13->_defaultCellSize.height = v9;
    v15 = (_OWORD *)MEMORY[0x1E0CEB4B0];
    v13->_engagedCellSize.width = width;
    v13->_engagedCellSize.height = height;
    v16 = v15[1];
    *(_OWORD *)&v13->_engagementBoundsInsets.top = *v15;
    *(_OWORD *)&v13->_engagementBoundsInsets.bottom = v16;
    v13->_useEngagementSpacing = a5;
    v17 = objc_msgSend(v12, "copy");
    interItemSpacingProvider = v14->_interItemSpacingProvider;
    v14->_interItemSpacingProvider = (id)v17;

    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    logger = v14->_logger;
    v14->_logger = (AVTUILogger *)v20;

  }
  return v14;
}

- (CGRect)engagementBoundsForContainerBounds:(CGRect)a3
{
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  x = a3.origin.x;
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[AVTEngagementLayout engagementSizeForVisibleBoundsSize:](self, "engagementSizeForVisibleBoundsSize:", a3.size.width, a3.size.height);
  v7 = v6;
  v9 = v8;
  -[AVTEngagementLayout engagementBoundsInsets](self, "engagementBoundsInsets");
  v11 = x + v10;
  v12 = v5;
  v13 = v7;
  v14 = v9;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGSize)engagementSizeForVisibleBoundsSize:(CGSize)a3
{
  CGFloat height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AVTEngagementLayout engagementBoundsInsets](self, "engagementBoundsInsets");
  v7 = width - v6;
  -[AVTEngagementLayout engagementBoundsInsets](self, "engagementBoundsInsets");
  v9 = v7 - v8;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)xAxisScale
{
  double v3;
  double v4;
  double (**v5)(double);
  double v6;
  double v7;
  double v8;
  double (**v9)(double);
  double v10;

  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  v4 = v3;
  -[AVTEngagementLayout interItemSpacingProvider](self, "interItemSpacingProvider");
  v5 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  v6 = v4 + v5[2](0.0);
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  v8 = v7;
  -[AVTEngagementLayout interItemSpacingProvider](self, "interItemSpacingProvider");
  v9 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  v10 = v6 / (v8 + v9[2](1.0));

  return v10;
}

- (double)contentOriginXForVisibleSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_opt_class();
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  objc_msgSend(v6, "insetsToCenterFirstAndLastItemsGivenContainerSize:itemSize:", width, height, v7, v8);
  return v9;
}

- (double)contentTrailingXForVisibleSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_opt_class();
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  objc_msgSend(v6, "insetsToCenterFirstAndLastItemsGivenContainerSize:itemSize:", width, height, v7, v8);
  return v9;
}

- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[AVTEngagementLayout engagementBoundsForContainerBounds:](self, "engagementBoundsForContainerBounds:");
  -[AVTEngagementLayout frameForElementAtIndex:visibleBounds:engagementBounds:verticalBounds:](self, "frameForElementAtIndex:visibleBounds:engagementBounds:verticalBounds:", a3, x, y, width, height, v10, v11, v12, v13, *(_QWORD *)&y, *(_QWORD *)&height);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4 engagementBounds:(CGRect)a5 verticalBounds:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v10;
  CGFloat v11;
  int64_t v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat rect;
  CGFloat rect_24;
  double rect_24a;
  double v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4.size.height;
  v11 = a4.size.width;
  rect_24 = a4.origin.y;
  rect = a4.origin.x;
  v12 = a3;
  v14 = v37;
  -[AVTEngagementLayout contentOriginXForVisibleSize:](self, "contentOriginXForVisibleSize:", a3, *(_QWORD *)&a6.var0, *(_QWORD *)&a6.var1, a4.size.width, a4.size.height);
  v32 = v15;
  -[AVTEngagementLayout xAxisScale](self, "xAxisScale");
  v17 = 1.0 - v16;
  v38.origin.x = rect;
  v38.origin.y = rect_24;
  v38.size.width = v11;
  v38.size.height = v10;
  v18 = v32 + v17 * CGRectGetMinX(v38);
  if (v12 >= 1)
  {
    do
    {
      -[AVTEngagementLayout frameForElementAfterElementEndingAt:engagementBounds:verticalBounds:](self, "frameForElementAfterElementEndingAt:engagementBounds:verticalBounds:", v18, x, y, width, height, v36, v14);
      v19 = v39.origin.x;
      v20 = v39.origin.y;
      v21 = x;
      v22 = y;
      v23 = width;
      v24 = height;
      v25 = v39.size.width;
      v26 = v39.size.height;
      -[AVTEngagementLayout spacingAfterElementEndingAt:engagementBounds:](self, "spacingAfterElementEndingAt:engagementBounds:", CGRectGetMaxX(v39), v21, v22, v23, v24);
      rect_24a = v27;
      v40.origin.x = v19;
      v40.origin.y = v20;
      v40.size.width = v25;
      height = v24;
      width = v23;
      y = v22;
      x = v21;
      v40.size.height = v26;
      v14 = v37;
      v18 = rect_24a + CGRectGetMaxX(v40);
      --v12;
    }
    while (v12);
  }
  -[AVTEngagementLayout frameForElementAfterElementEndingAt:engagementBounds:verticalBounds:](self, "frameForElementAfterElementEndingAt:engagementBounds:verticalBounds:", v18, x, y, width, height, v36, v14);
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)frameForElementAfterElementEndingAt:(double)a3 engagementBounds:(CGRect)a4 verticalBounds:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double MaxX;
  double v13;
  double v14;
  double MidX;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MinX = CGRectGetMinX(a4);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  MaxX = CGRectGetMaxX(v34);
  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  v14 = MaxX - v13;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  MidX = CGRectGetMidX(v35);
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  -[AVTEngagementLayout engagementForValue:withRangeMin:rangeMax:rangePeak:](self, "engagementForValue:withRangeMin:rangeMax:rangePeak:", a3, MinX, v14, MidX + v16 * -0.5);
  -[AVTEngagementLayout cellSizeForEngagement:](self, "cellSizeForEngagement:");
  v19 = v18;
  v20 = v17;
  if (v18 == INFINITY || v17 == INFINITY)
  {
    -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
    v19 = v22;
    v20 = v23;
  }
  v36.origin.x = a3;
  v36.origin.y = a5.var0 + (a5.var1 - v20) * 0.5;
  v36.size.width = v19;
  v36.size.height = v20;
  if (CGRectIsInfinite(v36))
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    v37.origin.x = a3;
    v37.origin.y = a5.var0 + (a5.var1 - v20) * 0.5;
    v37.size.width = v19;
    v37.size.height = v20;
    NSStringFromCGRect(v37);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    NSStringFromCGRect(v38);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Frame %@ has infinity values based on parameters previousElementMaxX=%f, engagementBounds=%@, verticalBounds=(%f %f)"), v25, *(_QWORD *)&a3, v26, *(_QWORD *)&a5.var1, *(_QWORD *)&a5.var0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTEngagementLayout logger](self, "logger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "logDebug:", v27);

  }
  v29 = a3;
  v30 = a5.var0 + (a5.var1 - v20) * 0.5;
  v31 = v19;
  v32 = v20;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (double)spacingAfterElementEndingAt:(double)a3 engagementBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MinX;
  double v19;
  double v20;
  double MaxX;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  double v28;
  double result;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MidX = CGRectGetMidX(a4);
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  v12 = MidX - v11 * 0.5;
  -[AVTEngagementLayout interitemSpacingForEngagement:](self, "interitemSpacingForEngagement:", 1.0);
  v14 = v12 - v13;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v15 = CGRectGetMidX(v30);
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  v17 = v15 + v16 * 0.5;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MinX = CGRectGetMinX(v31);
  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  v20 = MinX + v19;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MaxX = CGRectGetMaxX(v32);
  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  v23 = MaxX - v22;
  -[AVTEngagementLayout interitemSpacingForEngagement:](self, "interitemSpacingForEngagement:", 0.0);
  -[AVTEngagementLayout engagementForValue:withRangeMin:rangeMax:rangePeakBegin:rangePeakEnd:](self, "engagementForValue:withRangeMin:rangeMax:rangePeakBegin:rangePeakEnd:", a3, v20, v23 - v24, v14, v17);
  v26 = v25;
  v27 = -[AVTEngagementLayout useEngagementSpacing](self, "useEngagementSpacing");
  v28 = 1.0;
  if (v27)
    v28 = v26;
  -[AVTEngagementLayout interitemSpacingForEngagement:](self, "interitemSpacingForEngagement:", v28);
  return result;
}

- (CGRect)frameForElementBeforeElementStartingAt:(double)a3 engagementBounds:(CGRect)a4 verticalBounds:(id)a5
{
  double var1;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double v13;
  double v14;
  double MaxX;
  double MidX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double var0;
  CGRect v25;
  CGRect v26;
  CGRect result;

  var1 = a5.var1;
  var0 = a5.var0;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MinX = CGRectGetMinX(a4);
  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  v14 = MinX + v13;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MidX = CGRectGetMidX(v26);
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  -[AVTEngagementLayout engagementForValue:withRangeMin:rangeMax:rangePeak:](self, "engagementForValue:withRangeMin:rangeMax:rangePeak:", a3, v14, MaxX, MidX + v17 * 0.5);
  -[AVTEngagementLayout cellSizeForEngagement:](self, "cellSizeForEngagement:");
  v19 = v18;
  v21 = v20;
  v22 = a3 - v18;
  v23 = var0 + (var1 - v20) * 0.5;
  result.size.height = v21;
  result.size.width = v19;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (double)spacingBeforElementStartingAt:(double)a3 engagementBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MinX;
  double v19;
  double v20;
  double v21;
  double v22;
  double MaxX;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  double v28;
  double result;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MidX = CGRectGetMidX(a4);
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  v12 = MidX - v11 * 0.5;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v13 = CGRectGetMidX(v30);
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  v15 = v13 + v14 * 0.5;
  -[AVTEngagementLayout interitemSpacingForEngagement:](self, "interitemSpacingForEngagement:", 1.0);
  v17 = v16 + v15;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MinX = CGRectGetMinX(v31);
  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  v20 = MinX + v19;
  -[AVTEngagementLayout interitemSpacingForEngagement:](self, "interitemSpacingForEngagement:", 0.0);
  v22 = v21 + v20;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MaxX = CGRectGetMaxX(v32);
  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  -[AVTEngagementLayout engagementForValue:withRangeMin:rangeMax:rangePeakBegin:rangePeakEnd:](self, "engagementForValue:withRangeMin:rangeMax:rangePeakBegin:rangePeakEnd:", a3, v22, MaxX - v24, v12, v17);
  v26 = v25;
  v27 = -[AVTEngagementLayout useEngagementSpacing](self, "useEngagementSpacing");
  v28 = 1.0;
  if (v27)
    v28 = v26;
  -[AVTEngagementLayout interitemSpacingForEngagement:](self, "interitemSpacingForEngagement:", v28);
  return result;
}

- (double)engagementForValue:(double)a3 withRangeMin:(double)a4 rangeMax:(double)a5 rangePeak:(double)a6
{
  double result;

  -[AVTEngagementLayout engagementForValue:withRangeMin:rangeMax:rangePeakBegin:rangePeakEnd:](self, "engagementForValue:withRangeMin:rangeMax:rangePeakBegin:rangePeakEnd:", a3, a4, a5, a6, a6);
  return result;
}

- (double)engagementForValue:(double)a3 withRangeMin:(double)a4 rangeMax:(double)a5 rangePeakBegin:(double)a6 rangePeakEnd:(double)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double result;

  v7 = a5 - a7;
  if (a3 > a7)
  {
    v8 = a3 - a7;
  }
  else
  {
    v7 = 1.0;
    v8 = 0.0;
  }
  v9 = a6 - a3;
  v10 = a6 - a4;
  v11 = a3 < a6;
  if (a3 < a6)
    v12 = v10;
  else
    v12 = v7;
  if (v11)
    v13 = v9;
  else
    v13 = v8;
  result = fmin(1.0 - v13 / v12, 1.0);
  if (result < 0.0)
    return 0.0;
  return result;
}

- (CGSize)cellSizeForEngagement:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  v6 = v5;
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  v8 = v7;
  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  v10 = v6 + (v8 - v9) * a3;
  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  v12 = v11;
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  v14 = v13;
  -[AVTEngagementLayout defaultCellSize](self, "defaultCellSize");
  v16 = v12 + (v14 - v15) * a3;
  v17 = v10;
  result.height = v16;
  result.width = v17;
  return result;
}

- (double)interitemSpacingForEngagement:(double)a3
{
  double (**v4)(double);
  double v5;

  -[AVTEngagementLayout interItemSpacingProvider](self, "interItemSpacingProvider");
  v4 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  v5 = v4[2](a3);

  return v5;
}

- (id)indexesForElementsInRect:(CGRect)a3 visibleBounds:(CGRect)a4 numberOfItems:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  CGRect v23;
  CGRect v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 >= 1)
  {
    v16 = 0;
    do
    {
      -[AVTEngagementLayout frameForElementAtIndex:visibleBounds:](self, "frameForElementAtIndex:visibleBounds:", v16, x, y, width, height);
      v24.origin.x = v17;
      v24.origin.y = v18;
      v24.size.width = v19;
      v24.size.height = v20;
      v23.origin.x = v13;
      v23.origin.y = v12;
      v23.size.width = v11;
      v23.size.height = v10;
      if (CGRectIntersectsRect(v23, v24))
        objc_msgSend(v15, "addIndex:", v16);
      ++v16;
    }
    while (a5 != v16);
  }
  v21 = (void *)objc_msgSend(v15, "copy");

  return v21;
}

- (CGPoint)centerForCenteringElementAtIndex:(int64_t)a3 visibleBoundsSize:(CGSize)a4 proposedOrigin:(CGPoint)a5
{
  double y;
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MinX;
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
  double v27;
  double v28;
  double v29;
  CGPoint result;
  CGRect v31;

  y = a5.y;
  height = a4.height;
  width = a4.width;
  -[AVTEngagementLayout engagementSizeForVisibleBoundsSize:](self, "engagementSizeForVisibleBoundsSize:", a4.width, a4.height, a5.x);
  v11 = v10;
  v13 = v12;
  -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
  MinX = v14 * -0.5;
  if (a3 >= 1)
  {
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = v11 * -0.5;
    do
    {
      -[AVTEngagementLayout spacingBeforElementStartingAt:engagementBounds:](self, "spacingBeforElementStartingAt:engagementBounds:", MinX, v17, v16, v11, v13);
      -[AVTEngagementLayout frameForElementBeforeElementStartingAt:engagementBounds:verticalBounds:](self, "frameForElementBeforeElementStartingAt:engagementBounds:verticalBounds:", MinX - v18, v17, v16, v11, v13, y, height);
      MinX = CGRectGetMinX(v31);
      --a3;
    }
    while (a3);
  }
  -[AVTEngagementLayout contentOriginXForVisibleSize:](self, "contentOriginXForVisibleSize:", width, height);
  v20 = MinX - v19;
  -[AVTEngagementLayout engagementBoundsInsets](self, "engagementBoundsInsets");
  v22 = v11 * 0.5 + v21;
  -[AVTEngagementLayout xAxisScale](self, "xAxisScale");
  v24 = v22 + (-v20 - v22) / v23;
  -[AVTEngagementLayout engagementBoundsInsets](self, "engagementBoundsInsets");
  v26 = v25;
  -[AVTEngagementLayout engagementBoundsInsets](self, "engagementBoundsInsets");
  v28 = v24 + (v26 - v27) * 0.5;
  v29 = y + height * 0.5;
  result.y = v29;
  result.x = v28;
  return result;
}

- (CGSize)contentSizeForVisibleBounds:(CGRect)a3 numberOfItems:(int64_t)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;

  if (a4 <= 0)
  {
    v14 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[AVTEngagementLayout centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:](self, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", a4 - 1, a3.size.width, a3.size.height, a3.origin.x, a3.origin.y);
    v10 = v9;
    -[AVTEngagementLayout contentTrailingXForVisibleSize:](self, "contentTrailingXForVisibleSize:", width, height);
    v12 = v11;
    -[AVTEngagementLayout engagedCellSize](self, "engagedCellSize");
    v14 = v12 + v10 + v13 * 0.5;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v15 = CGRectGetHeight(v18);
  }
  v16 = v14;
  result.height = v15;
  result.width = v16;
  return result;
}

- (CGRect)frameForElementBeforeOriginForVisibleBounds:(CGRect)a3
{
  double width;
  double x;
  double y;
  double height;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
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
  double v27;
  double v28;
  double v29;
  CGFloat rect;
  double rect_8;
  double rect_16;
  CGRect v33;
  CGRect v34;
  CGRect result;

  width = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  rect_8 = a3.size.height;
  rect_16 = a3.origin.y;
  height = a3.size.height;
  -[AVTEngagementLayout frameForElementAtIndex:visibleBounds:](self, "frameForElementAtIndex:visibleBounds:", 0);
  v9 = v8;
  rect = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[AVTEngagementLayout engagementBoundsForContainerBounds:](self, "engagementBoundsForContainerBounds:", x, y, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v33.origin.x = v9;
  v33.origin.y = v11;
  v33.size.width = v13;
  v33.size.height = v15;
  -[AVTEngagementLayout spacingBeforElementStartingAt:engagementBounds:](self, "spacingBeforElementStartingAt:engagementBounds:", CGRectGetMinX(v33), v17, v19, v21, v23);
  v25 = v24;
  v34.origin.x = rect;
  v34.origin.y = v11;
  v34.size.width = v13;
  v34.size.height = v15;
  -[AVTEngagementLayout frameForElementBeforeElementStartingAt:engagementBounds:verticalBounds:](self, "frameForElementBeforeElementStartingAt:engagementBounds:verticalBounds:", CGRectGetMinX(v34) - v25, v17, v19, v21, v23, rect_16, rect_8);
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGSize)defaultCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultCellSize.width;
  height = self->_defaultCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)engagedCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_engagedCellSize.width;
  height = self->_engagedCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)engagementBoundsInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_engagementBoundsInsets.top;
  left = self->_engagementBoundsInsets.left;
  bottom = self->_engagementBoundsInsets.bottom;
  right = self->_engagementBoundsInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEngagementBoundsInsets:(UIEdgeInsets)a3
{
  self->_engagementBoundsInsets = a3;
}

- (BOOL)useEngagementSpacing
{
  return self->_useEngagementSpacing;
}

- (void)setUseEngagementSpacing:(BOOL)a3
{
  self->_useEngagementSpacing = a3;
}

- (id)interItemSpacingProvider
{
  return self->_interItemSpacingProvider;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->_interItemSpacingProvider, 0);
}

@end
