@implementation HUMultiStateControlView

- (HUMultiStateControlView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  HUMultiStateControlView *v7;
  uint64_t v8;
  UISegmentedControl *segmentedControl;
  uint64_t v10;
  NSMutableArray *possibleValues;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)HUMultiStateControlView;
  v7 = -[HUMultiStateControlView initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA990]), "initWithFrame:", x, y, width, height);
    segmentedControl = v7->_segmentedControl;
    v7->_segmentedControl = (UISegmentedControl *)v8;

    -[UISegmentedControl setAutoresizingMask:](v7->_segmentedControl, "setAutoresizingMask:", 18);
    -[UISegmentedControl addTarget:action:forControlEvents:](v7->_segmentedControl, "addTarget:action:forControlEvents:", v7, sel__selectedIndexChanged_, 4096);
    -[HUMultiStateControlView addSubview:](v7, "addSubview:", v7->_segmentedControl);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    possibleValues = v7->_possibleValues;
    v7->_possibleValues = (NSMutableArray *)v10;

  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUMultiStateControlView segmentedControl](self, "segmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)addPossibleValue:(id)a3 withTitle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  -[HUMultiStateControlView segmentedControl](self, "segmentedControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMultiStateControlView possibleValues](self, "possibleValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSegmentWithTitle:atIndex:animated:", v6, objc_msgSend(v8, "count"), 0);

  -[NSMutableArray addObject:](self->_possibleValues, "addObject:", v9);
}

- (void)addPossibleValue:(id)a3 withImage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  -[HUMultiStateControlView segmentedControl](self, "segmentedControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMultiStateControlView possibleValues](self, "possibleValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSegmentWithImage:atIndex:animated:", v6, objc_msgSend(v8, "count"), 0);

  -[NSMutableArray addObject:](self->_possibleValues, "addObject:", v9);
}

- (void)_selectedIndexChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUMultiStateControlView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlViewDidBeginUserInteraction:", self);

  -[HUMultiStateControlView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMultiStateControlView value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlView:valueDidChange:", self, v6);

  -[HUMultiStateControlView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlViewDidEndUserInteraction:", self);

}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)value
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[HUMultiStateControlView segmentedControl](self, "segmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedSegmentIndex");

  if (v4 == -1)
  {
    v6 = 0;
  }
  else
  {
    -[HUMultiStateControlView possibleValues](self, "possibleValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)setValue:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[HUMultiStateControlView possibleValues](self, "possibleValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", v10);

    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[HUMultiStateControlView possibleValues](self, "possibleValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Desired value (%@) is not in set of possible values (%@)"), v10, v6);

    }
    -[HUMultiStateControlView segmentedControl](self, "segmentedControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v5;
  }
  else
  {
    -[HUMultiStateControlView segmentedControl](self, "segmentedControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = -1;
  }
  objc_msgSend(v7, "setSelectedSegmentIndex:", v9);

}

- (BOOL)isDisabled
{
  void *v2;
  char v3;

  -[HUMultiStateControlView segmentedControl](self, "segmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled") ^ 1;

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[HUMultiStateControlView segmentedControl](self, "segmentedControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (HUControlViewDelegate)delegate
{
  return (HUControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSArray)possibleValues
{
  return &self->_possibleValues->super;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_possibleValues, 0);
}

@end
