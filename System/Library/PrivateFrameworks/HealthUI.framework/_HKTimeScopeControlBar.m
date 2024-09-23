@implementation _HKTimeScopeControlBar

- (_HKTimeScopeControlBar)initWithFrame:(CGRect)a3 timeScopes:(id)a4
{
  _HKTimeScopeControlBar *v4;
  _HKTimeScopeControlBar *v5;
  UISegmentedControl *segments;
  _HKTimeScopeControlBar *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_HKTimeScopeControlBar;
  v4 = -[HKTimeScopeControl initWithFrame:timeScopes:](&v9, sel_initWithFrame_timeScopes_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    segments = v4->_segments;
    v4->_segments = 0;

    -[_HKTimeScopeControlBar setAutoresizesSubviews:](v5, "setAutoresizesSubviews:", 1);
    -[_HKTimeScopeControlBar setAutoresizingMask:](v5, "setAutoresizingMask:", 2);
    -[_HKTimeScopeControlBar _rebuildSegments](v5, "_rebuildSegments");
    v7 = v5;
  }

  return v5;
}

- (double)minimumWidth
{
  double result;

  -[UISegmentedControl intrinsicContentSize](self->_segments, "intrinsicContentSize");
  return result;
}

- (void)_rebuildSegments
{
  NSInteger v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  void *v14;
  NSUInteger v15;
  UISegmentedControl *segments;
  void *v17;
  void *v18;
  UISegmentedControl *v19;
  void *v20;
  UISegmentedControl *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = -[UISegmentedControl selectedSegmentIndex](self->_segments, "selectedSegmentIndex");
  -[_HKTimeScopeControlBar traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->super._timeScopes;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        HKStringForHKTimeScope(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "integerValue", (_QWORD)v22), v5 != 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  if (self->_segments)
  {
    if (objc_msgSend(v6, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v13, (_QWORD)v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[UISegmentedControl numberOfSegments](self->_segments, "numberOfSegments");
        segments = self->_segments;
        if (v13 >= v15)
          -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](segments, "insertSegmentWithTitle:atIndex:animated:", v14, v13, 0);
        else
          -[UISegmentedControl setTitle:forSegmentAtIndex:](segments, "setTitle:forSegmentAtIndex:", v14, v13);
        -[UISegmentedControl infoViewForSegment:](self->_segments, "infoViewForSegment:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setNeedsLayout");
        objc_msgSend(v17, "superview");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layoutIfNeeded");

        objc_msgSend(v17, "_removeAllAnimations:", 1);
        ++v13;
      }
      while (v13 < objc_msgSend(v6, "count"));
    }
  }
  else
  {
    v19 = (UISegmentedControl *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v6);
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CE9EC0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl setAccessibilityIdentifier:](v19, "setAccessibilityIdentifier:", v20);

    -[UISegmentedControl setSelectedSegmentIndex:](v19, "setSelectedSegmentIndex:", v3);
    -[UISegmentedControl addTarget:action:forControlEvents:](v19, "addTarget:action:forControlEvents:", self, sel__segmentValueChanged_, 4096);
    -[UISegmentedControl _setAutosizeText:](v19, "_setAutosizeText:", 1);
    -[_HKTimeScopeControlBar addSubview:](self, "addSubview:", v19);
    v21 = self->_segments;
    self->_segments = v19;

  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 44.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  UISegmentedControl *segments;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKTimeScopeControlBar;
  -[_HKTimeScopeControlBar layoutSubviews](&v8, sel_layoutSubviews);
  -[_HKTimeScopeControlBar bounds](self, "bounds");
  HKUIOnePixel();
  HKUIOnePixel();
  UIRectInset();
  segments = self->_segments;
  HKUIRectIntegralToScreenScale(v4, v5, v6, v7);
  -[UISegmentedControl setFrame:](segments, "setFrame:");
}

- (int64_t)selectedTimeScope
{
  return -[HKTimeScopeControl _timeScopeForIndex:](self, "_timeScopeForIndex:", -[UISegmentedControl selectedSegmentIndex](self->_segments, "selectedSegmentIndex"));
}

- (void)setSelectedTimeScope:(int64_t)a3
{
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segments, "setSelectedSegmentIndex:", -[HKTimeScopeControl _indexForTimeScope:](self, "_indexForTimeScope:", a3));
}

- (void)_segmentValueChanged:(id)a3
{
  -[_HKTimeScopeControlBar sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKTimeScopeControlBar;
  v4 = a3;
  -[_HKTimeScopeControlBar traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[_HKTimeScopeControlBar traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  v7 = objc_msgSend(v4, "horizontalSizeClass");

  if (v6 != v7)
    -[_HKTimeScopeControlBar _rebuildSegments](self, "_rebuildSegments");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
