@implementation NTKFaceEditingTabsView

+ (id)labelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", NTKFaceEditingTabsTextSize(), *MEMORY[0x1E0DC1420]);
}

- (void)setOrderedTabs:(id)a3
{
  objc_storeStrong((id *)&self->_orderedTabs, a3);
  -[NTKFaceEditingTabsView _applyOrderedTabsAndLayout](self, "_applyOrderedTabsAndLayout");
}

- (void)_applyOrderedTabsAndLayout
{
  NSArray *orderedTabs;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  -[NTKFaceEditingTabsView _addOrRemoveLabelsAsNeeded](self, "_addOrRemoveLabelsAsNeeded");
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  orderedTabs = self->_orderedTabs;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__NTKFaceEditingTabsView__applyOrderedTabsAndLayout__block_invoke;
  v8[3] = &unk_1E6BD6700;
  v8[4] = self;
  v8[5] = &v9;
  -[NSArray enumerateObjectsUsingBlock:](orderedTabs, "enumerateObjectsUsingBlock:", v8);
  -[UIView frame](self->_labelContainer, "frame");
  v5 = v4;
  v7 = v6;
  -[NTKFaceEditingTabsView frame](self, "frame");
  -[UIView setFrame:](self->_labelContainer, "setFrame:", v5, v7, v10[3]);
  if (-[NSMutableArray count](self->_labels, "count"))
    -[NTKFaceEditingTabsView _applySelectedTab:](self, "_applySelectedTab:", self->_selectedTab);
  _Block_object_dispose(&v9, 8);
}

void __52__NTKFaceEditingTabsView__applyOrderedTabsAndLayout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v6);

  objc_msgSend(v10, "sizeToFit");
  if (a3)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + 14.0;
  objc_msgSend(v10, "frame");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(double *)(v7 + 24);
  *(double *)(v7 + 24) = v9 + v8;
  objc_msgSend(v10, "setFrame:", v8, 0.0);

}

- (void)_addOrRemoveLabelsAsNeeded
{
  NSMutableArray *v3;
  NSMutableArray *labels;
  UIView *v5;
  UIView *labelContainer;
  NSUInteger v7;
  unint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;

  if (!self->_labels)
  {
    v3 = (NSMutableArray *)objc_opt_new();
    labels = self->_labels;
    self->_labels = v3;

  }
  if (!self->_labelContainer)
  {
    v5 = (UIView *)objc_opt_new();
    labelContainer = self->_labelContainer;
    self->_labelContainer = v5;

    -[NTKFaceEditingTabsView addSubview:](self, "addSubview:", self->_labelContainer);
  }
  v7 = -[NSArray count](self->_orderedTabs, "count");
  v8 = -[NSMutableArray count](self->_labels, "count");
  v9 = -[NSArray count](self->_orderedTabs, "count");
  v10 = -[NSMutableArray count](self->_labels, "count");
  if (v7 <= v8)
  {
    if (v9 < v10)
    {
      while (1)
      {
        v14 = -[NSArray count](self->_orderedTabs, "count");
        if (v14 >= -[NSMutableArray count](self->_labels, "count"))
          break;
        -[NSMutableArray lastObject](self->_labels, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeFromSuperview");
        -[NSMutableArray removeLastObject](self->_labels, "removeLastObject");

      }
    }
  }
  else if (v9 > v10)
  {
    do
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "setNumberOfLines:", 1);
      +[NTKFaceEditingTabsView labelFont](NTKFaceEditingTabsView, "labelFont");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFont:", v12);

      -[UIView addSubview:](self->_labelContainer, "addSubview:", v11);
      -[NSMutableArray addObject:](self->_labels, "addObject:", v11);

      v13 = -[NSArray count](self->_orderedTabs, "count");
    }
    while (v13 > -[NSMutableArray count](self->_labels, "count"));
  }
}

- (void)setSelectedTab:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_selectedTab = a3;
  if (-[NSMutableArray count](self->_labels, "count") >= a3)
  {
    -[NTKFaceEditingTabsView _applySelectedTab:](self, "_applySelectedTab:", a3);
  }
  else
  {
    _NTKLoggingObjectForDomain(11, (uint64_t)"NTKLoggingDomainFaceLibraryViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[NSMutableArray count](self->_labels, "count");
      v7 = 134218240;
      v8 = a3;
      v9 = 2048;
      v10 = v6;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Set selected tab (%lu) outside of label count (%lu)", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)_applySelectedTab:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  id v8;

  -[NSMutableArray objectAtIndexedSubscript:](self->_labels, "objectAtIndexedSubscript:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceEditingTabsView _containerOffsetForLabelAtIndex:](self, "_containerOffsetForLabelAtIndex:", a3);
  v6 = v5;
  -[UIView frame](self->_labelContainer, "frame");
  -[UIView setFrame:](self->_labelContainer, "setFrame:", v6);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_labels, "enumerateObjectsUsingBlock:", &__block_literal_global_120);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v7);

}

void __44__NTKFaceEditingTabsView__applySelectedTab___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  v3 = a2;
  objc_msgSend(v2, "colorWithWhite:alpha:", 0.2, 1.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

}

- (void)applyTransitionFraction:(double)a3 fromTab:(unint64_t)a4 toTab:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3 != 0.0 && a4 != a5)
  {
    -[UIView frame](self->_labelContainer, "frame");
    -[NTKFaceEditingTabsView _containerOffsetForLabelAtIndex:](self, "_containerOffsetForLabelAtIndex:", a4);
    -[NTKFaceEditingTabsView _containerOffsetForLabelAtIndex:](self, "_containerOffsetForLabelAtIndex:", a5);
    CLKInterpolateBetweenFloatsUnclipped();
    -[UIView setFrame:](self->_labelContainer, "setFrame:");
    -[NSMutableArray objectAtIndexedSubscript:](self->_labels, "objectAtIndexedSubscript:", a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    CLKInterpolateBetweenFloatsClipped();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColor:", v9);

    -[NSMutableArray objectAtIndexedSubscript:](self->_labels, "objectAtIndexedSubscript:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CLKInterpolateBetweenFloatsClipped();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v11);

  }
}

- (double)_containerOffsetForLabelAtIndex:(int64_t)a3
{
  NSMutableArray *labels;
  unint64_t v6;
  NSMutableArray *v7;
  void *v8;
  double MaxX;
  double MidX;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  if (!-[NSMutableArray count](self->_labels, "count"))
    return 0.0;
  labels = self->_labels;
  if (a3 < 0)
  {
    -[NSMutableArray firstObject](labels, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    MidX = -CGRectGetMidX(v14);
  }
  else
  {
    v6 = -[NSMutableArray count](labels, "count");
    v7 = self->_labels;
    if (v6 >= a3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      MidX = CGRectGetMidX(v15);
    }
    else
    {
      -[NSMutableArray lastObject](v7, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      MaxX = CGRectGetMaxX(v12);
      objc_msgSend(v8, "frame");
      MidX = MaxX + CGRectGetWidth(v13) * 0.5;
    }
  }

  -[NTKFaceEditingTabsView bounds](self, "bounds");
  return CGRectGetMidX(v16) - MidX;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKFaceEditingTabsView;
  -[NTKFaceEditingTabsView layoutSubviews](&v3, sel_layoutSubviews);
  -[NTKFaceEditingTabsView _applyOrderedTabsAndLayout](self, "_applyOrderedTabsAndLayout");
  -[NTKFaceEditingTabsView setSelectedTab:](self, "setSelectedTab:", -[NTKFaceEditingTabsView selectedTab](self, "selectedTab"));
}

- (NSArray)orderedTabs
{
  return self->_orderedTabs;
}

- (unint64_t)selectedTab
{
  return self->_selectedTab;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedTabs, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
