@implementation FCUIActivityBaubleGroupView

- (FCUIActivityBaubleGroupView)initWithBaubleDescriptions:(id)a3 baubleGroupType:(int64_t)a4
{
  id v6;
  FCUIActivityBaubleGroupView *v7;
  FCUIActivityBaubleGroupView *v8;
  NSArray *v9;
  unint64_t v10;
  void *v11;
  FCUIActivityBaubleView *v12;
  void *v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  FCUIActivityBaubleView *v18;
  NSArray *baubleViews;
  __int128 v21;
  int v22;
  uint64_t v23;
  __int128 v24;
  objc_super v25;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FCUIActivityBaubleGroupView;
  v7 = -[FCUIActivityBaubleGroupView init](&v25, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_baubleGroupType = a4;
    v7->_adjustsFontForContentSizeCategory = 1;
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    if (objc_msgSend(v6, "count"))
    {
      v10 = 0;
      v21 = xmmword_214797500;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v10, v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = [FCUIActivityBaubleView alloc];
        if (a4 == 1)
        {
          objc_msgSend(v11, "completeDescriptionWithReferencePointSize:maximumPointSize:referenceDimension:", 15.0, 24.0, 35.0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = xmmword_214797510;
        }
        else
        {
          if (v10 == 1)
            v15 = 10.0;
          else
            v15 = 13.0;
          if (v10 == 1)
            v16 = 19.0;
          else
            v16 = 22.0;
          if (v10 == 1)
            v17 = 19.0;
          else
            v17 = 25.0;
          if (v10 == 2)
          {
            v16 = 16.0;
            v15 = 7.0;
            v17 = 15.0;
          }
          objc_msgSend(v11, "completeDescriptionWithReferencePointSize:maximumPointSize:referenceDimension:", v15, v16, v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v21;
        }
        v22 = 1036831949;
        v23 = 0;
        v24 = v14;
        v18 = -[FCUIActivityBaubleView initWithBaubleDescription:shadowAttributes:](v12, "initWithBaubleDescription:shadowAttributes:", v13, &v22);

        -[FCUIActivityBaubleGroupView addSubview:](v8, "addSubview:", v18);
        -[NSArray addObject:](v9, "addObject:", v18);

        ++v10;
      }
      while (v10 < objc_msgSend(v6, "count"));
    }
    baubleViews = v8->_baubleViews;
    v8->_baubleViews = v9;

  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  CGFloat *v9;
  double height;
  CGFloat width;
  unint64_t v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  double x;
  double v17;
  CGFloat y;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGSize result;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  BSRectWithSize();
  v30 = v5;
  v31 = v4;
  v28 = v7;
  v29 = v6;
  v8 = -[FCUIActivityBaubleGroupView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v9 = (CGFloat *)MEMORY[0x24BDBF070];
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (-[NSArray count](self->_baubleViews, "count"))
  {
    v12 = 0;
    v13 = *v9;
    v14 = v9[1];
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_baubleViews, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      x = FrameForBaubleAtIndex(v15, v12, self->_baubleGroupType, v8, v31, v30, v29, v28);
      y = v17;
      v20 = v19;
      v22 = v21;
      v33.origin.x = v13;
      v33.origin.y = v14;
      v33.size.width = width;
      v33.size.height = height;
      if (CGRectIsNull(v33))
      {
        width = v20;
        height = v22;
      }
      else
      {
        v34.origin.x = v13;
        v34.origin.y = v14;
        v34.size.width = width;
        v34.size.height = height;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = v20;
        v36.size.height = v22;
        v35 = CGRectUnion(v34, v36);
        x = v35.origin.x;
        y = v35.origin.y;
        width = v35.size.width;
        height = v35.size.height;
      }

      ++v12;
      v14 = y;
      v13 = x;
    }
    while (v12 < -[NSArray count](self->_baubleViews, "count"));
  }
  v23 = 0.0;
  if (!self->_baubleGroupType)
  {
    -[NSArray objectAtIndexedSubscript:](self->_baubleViews, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scaledValueForValue:", 3.0);
    v23 = v25;

  }
  v26 = height + v23;
  v27 = width;
  result.height = v26;
  result.width = v27;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int v11;
  unint64_t v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FCUIActivityBaubleGroupView;
  -[FCUIActivityBaubleGroupView layoutSubviews](&v14, sel_layoutSubviews);
  -[FCUIActivityBaubleGroupView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[FCUIActivityBaubleGroupView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (-[NSArray count](self->_baubleViews, "count"))
  {
    v12 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_baubleViews, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      FrameForBaubleAtIndex(v13, v12, self->_baubleGroupType, v11, v4, v6, v8, v10);
      UIRectIntegralWithScale();
      objc_msgSend(v13, "setFrame:");

      ++v12;
    }
    while (v12 < -[NSArray count](self->_baubleViews, "count"));
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_baubleViews;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  NSString *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[FCUIActivityBaubleGroupView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory) == NSOrderedSame)
    goto LABEL_12;
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_baubleViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v6)
  {

LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v5);
      v8 |= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "adjustForContentSizeCategoryChange", (_QWORD)v13);
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v7);

  if ((v8 & 1) == 0)
    goto LABEL_12;
  -[FCUIActivityBaubleGroupView setNeedsLayout](self, "setNeedsLayout");
  v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (int64_t)baubleGroupType
{
  return self->_baubleGroupType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_baubleViews, 0);
}

@end
