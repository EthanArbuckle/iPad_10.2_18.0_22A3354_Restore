@implementation SUUIPillsControl

- (SUUIPillsControl)initWithFrame:(CGRect)a3
{
  SUUIPillsControl *v3;
  SUUISegmentedControl *v4;
  uint64_t v5;
  SUUISegmentedControl *segmentedControl;
  SUUISegmentedControl *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUIPillsControl;
  v3 = -[SUUIPillsControl initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUISegmentedControl alloc];
    v5 = -[SUUISegmentedControl initWithItems:](v4, "initWithItems:", MEMORY[0x24BDBD1A8]);
    segmentedControl = v3->_segmentedControl;
    v3->_segmentedControl = (SUUISegmentedControl *)v5;

    -[SUUISegmentedControl addTarget:action:forControlEvents:](v3->_segmentedControl, "addTarget:action:forControlEvents:", v3, sel__segmentedControlAction_, 4096);
    v7 = v3->_segmentedControl;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.588235294, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISegmentedControl setTintColor:](v7, "setTintColor:", v8);

    -[SUUIPillsControl addSubview:](v3, "addSubview:", v3->_segmentedControl);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPillsControl setBackgroundColor:](v3, "setBackgroundColor:", v9);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUISegmentedControl removeTarget:action:forControlEvents:](self->_segmentedControl, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUUIPillsControl;
  -[SUUIPillsControl dealloc](&v3, sel_dealloc);
}

- (void)reloadPills
{
  int64_t v3;
  int64_t v4;
  int64_t maximumNumberOfVisiblePills;
  uint64_t v7;
  uint64_t i;
  SUUISegmentedControl *segmentedControl;
  void *v10;
  BOOL v11;

  -[SUUISegmentedControl removeAllSegments](self->_segmentedControl, "removeAllSegments");
  v3 = -[NSArray count](self->_titles, "count");
  v4 = v3;
  maximumNumberOfVisiblePills = self->_maximumNumberOfVisiblePills;
  if (maximumNumberOfVisiblePills >= v3 || maximumNumberOfVisiblePills <= 0)
    v7 = v3;
  else
    v7 = maximumNumberOfVisiblePills - 1;
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      segmentedControl = self->_segmentedControl;
      -[NSArray objectAtIndex:](self->_titles, "objectAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUISegmentedControl insertSegmentWithTitle:atIndex:animated:](segmentedControl, "insertSegmentWithTitle:atIndex:animated:", v10, i, 0);

    }
    maximumNumberOfVisiblePills = self->_maximumNumberOfVisiblePills;
  }
  if (maximumNumberOfVisiblePills)
    v11 = maximumNumberOfVisiblePills < v4;
  else
    v11 = 0;
  if (v11)
    -[SUUISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segmentedControl, "insertSegmentWithTitle:atIndex:animated:", self->_moreListTitle, v7, 0);
  -[SUUIPillsControl setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)selectedIndex
{
  return -[SUUISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex");
}

- (CGRect)selectedPillFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SUUISegmentedControl frameForSegmentAtIndex:](self->_segmentedControl, "frameForSegmentAtIndex:", -[SUUIPillsControl selectedIndex](self, "selectedIndex"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v4;
  SUUIColorScheme *v5;
  SUUIColorScheme *colorScheme;
  SUUISegmentedControl *segmentedControl;
  void *v8;
  void *v9;
  void *v10;
  SUUIColorScheme *v11;

  v4 = (SUUIColorScheme *)a3;
  if (self->_colorScheme != v4)
  {
    v11 = v4;
    v5 = (SUUIColorScheme *)-[SUUIColorScheme copy](v4, "copy");
    colorScheme = self->_colorScheme;
    self->_colorScheme = v5;

    segmentedControl = self->_segmentedControl;
    if (self->_colorScheme)
    {
      -[SUUIColorScheme secondaryTextColor](v11, "secondaryTextColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUISegmentedControl setTintColor:](segmentedControl, "setTintColor:", v8);

      -[SUUIColorScheme backgroundColor](v11, "backgroundColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.588235294, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUISegmentedControl setTintColor:](segmentedControl, "setTintColor:", v9);

      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPillsControl setBackgroundColor:](self, "setBackgroundColor:", v10);

    v4 = v11;
  }

}

- (void)setSelectedIndex:(int64_t)a3
{
  -[SUUISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SUUIPillsControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = v3 - self->_contentInset.left - self->_contentInset.right;
  -[SUUISegmentedControl frame](self->_segmentedControl, "frame");
  -[SUUISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", v4, v6);
  -[SUUISegmentedControl setFrame:](self->_segmentedControl, "setFrame:", self->_contentInset.left, self->_contentInset.top, v7, v8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SUUISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_segmentedControlAction:(id)a3
{
  -[SUUIPillsControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (int64_t)maximumNumberOfVisiblePills
{
  return self->_maximumNumberOfVisiblePills;
}

- (void)setMaximumNumberOfVisiblePills:(int64_t)a3
{
  self->_maximumNumberOfVisiblePills = a3;
}

- (NSString)moreListTitle
{
  return self->_moreListTitle;
}

- (void)setMoreListTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)setTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_moreListTitle, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end
