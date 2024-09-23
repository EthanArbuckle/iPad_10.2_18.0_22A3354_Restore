@implementation CNUINavigationListView

- (CNUINavigationListView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  CNUINavigationListView *v4;
  uint64_t v5;
  UILongPressGestureRecognizer *selectionGestureRecognizer;
  _CNUINavigationListViewPermissiveGestureRecognizerDelegate *v7;
  _CNUINavigationListViewPermissiveGestureRecognizerDelegate *selectionGestureRecognizerDelegate;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UISelectionFeedbackGenerator *retargetBehavior;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CNUINavigationListView;
  v4 = -[CNUINavigationListView initWithFrame:style:](&v22, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v4, sel_handleSelectionGestureRecognizerUpdate_);
    selectionGestureRecognizer = v4->_selectionGestureRecognizer;
    v4->_selectionGestureRecognizer = (UILongPressGestureRecognizer *)v5;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v4->_selectionGestureRecognizer, "setMinimumPressDuration:", 0.0);
    v7 = objc_alloc_init(_CNUINavigationListViewPermissiveGestureRecognizerDelegate);
    selectionGestureRecognizerDelegate = v4->_selectionGestureRecognizerDelegate;
    v4->_selectionGestureRecognizerDelegate = v7;

    -[UILongPressGestureRecognizer setDelegate:](v4->_selectionGestureRecognizer, "setDelegate:", v4->_selectionGestureRecognizerDelegate);
    -[CNUINavigationListView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_selectionGestureRecognizer);
    v9 = objc_opt_class();
    +[CNUINavigationListViewCell reuseIdentifier](CNUINavigationListViewCell, "reuseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListView registerClass:forCellReuseIdentifier:](v4, "registerClass:forCellReuseIdentifier:", v9, v10);

    v11 = objc_opt_class();
    +[CNUINavigationListViewDetailCell reuseIdentifier](CNUINavigationListViewDetailCell, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListView registerClass:forCellReuseIdentifier:](v4, "registerClass:forCellReuseIdentifier:", v11, v12);

    objc_msgSend(MEMORY[0x1E0DC4320], "defaultConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C60]), "initWithConfiguration:coordinateSpace:", v13, v4);
    retargetBehavior = v4->_retargetBehavior;
    v4->_retargetBehavior = (UISelectionFeedbackGenerator *)v14;

    -[CNUINavigationListView setAlwaysBounceVertical:](v4, "setAlwaysBounceVertical:", 0);
    -[CNUINavigationListView panGestureRecognizer](v4, "panGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTarget:action:", v4, sel_handlePanGestureRecognizerUpdate_);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel_handleSelectionGestureRecognizerUpdate_);
    -[CNUINavigationListView setPressGestureRecognizer:](v4, "setPressGestureRecognizer:", v17);

    -[CNUINavigationListView pressGestureRecognizer](v4, "pressGestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);

    -[CNUINavigationListView pressGestureRecognizer](v4, "pressGestureRecognizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowedPressTypes:", &unk_1E20D37A8);

    -[CNUINavigationListView pressGestureRecognizer](v4, "pressGestureRecognizer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListView addGestureRecognizer:](v4, "addGestureRecognizer:", v20);

  }
  return v4;
}

- (id)dequeueNavigationListViewCell
{
  void *v3;
  void *v4;

  +[CNUINavigationListViewCell reuseIdentifier](CNUINavigationListViewCell, "reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUINavigationListView dequeueReusableCellWithIdentifier:](self, "dequeueReusableCellWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dequeueDetailNavigationListViewCell
{
  void *v3;
  void *v4;

  +[CNUINavigationListViewDetailCell reuseIdentifier](CNUINavigationListViewDetailCell, "reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUINavigationListView dequeueReusableCellWithIdentifier:](self, "dequeueReusableCellWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)disclosureNavigationListViewCellForRowAtIndexPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[CNUINavigationListView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "accessoryImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isHidden"))
    v8 = 0;
  else
    v8 = v6;
  v9 = v8;

  return v9;
}

- (id)elementAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[CNUINavigationListView bounds](self, "bounds");
  v8.x = x;
  v8.y = y;
  if (CGRectContainsPoint(v9, v8))
  {
    -[CNUINavigationListView indexPathForRowAtPoint:](self, "indexPathForRowAtPoint:", x, y);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)willMoveToWindow:(id)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNUINavigationListView;
  -[CNUINavigationListView willMoveToWindow:](&v7, sel_willMoveToWindow_);
  -[CNUINavigationListView retargetBehavior](self, "retargetBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    objc_msgSend(v5, "activateWithCompletionBlock:", 0);
  else
    objc_msgSend(v5, "deactivate");

}

- (void)handleSelectionGestureRecognizerUpdate:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  BOOL v14;
  _BOOL4 v15;
  uint64_t v16;
  char v17;
  int v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  id v30;
  id v31;

  v31 = a3;
  objc_msgSend(v31, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[CNUINavigationListView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  -[CNUINavigationListView elementAtLocation:](self, "elementAtLocation:", v5, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v31, "state") != 1 && objc_msgSend(v31, "state") != 2;
  v15 = objc_msgSend(v31, "state") == 3 || objc_msgSend(v31, "state") == 4;
  v16 = objc_msgSend(v31, "state");
  if (objc_msgSend(v31, "state") == 1)
  {
    -[CNUINavigationListView setGestureStartLocation:](self, "setGestureStartLocation:", v5, v7);
    -[CNUINavigationListView setGestureStartLocationInWindow:](self, "setGestureStartLocationInWindow:", v10, v12);
  }
  if (v13)
    v17 = v14;
  else
    v17 = 1;
  if ((v17 & 1) != 0)
  {
    if (v13)
      v18 = v15;
    else
      v18 = 1;
    if (v18 == 1)
    {
      -[CNUINavigationListView trackedElementIndexPath](self, "trackedElementIndexPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUINavigationListView stopTrackingElementAtIndexPath:](self, "stopTrackingElementAtIndexPath:", v19);

      if (v15)
      {
        -[CNUINavigationListView additionalSelectionGestureRecognizer](self, "additionalSelectionGestureRecognizer");
        v20 = (id)objc_claimAutoreleasedReturnValue();

        if (v20 == v31)
          -[CNUINavigationListView clearAdditionalSelectionGestureRecognizer](self, "clearAdditionalSelectionGestureRecognizer");
        if (v13 && v16 == 3)
        {
          -[CNUINavigationListView notifyDelegateWithSelectionEventAtPoint:trackedElementIndexPath:](self, "notifyDelegateWithSelectionEventAtPoint:trackedElementIndexPath:", v13, v5, v7);
        }
        else
        {
          -[CNUINavigationListView pressGestureRecognizer](self, "pressGestureRecognizer");
          v30 = (id)objc_claimAutoreleasedReturnValue();

          if (v30 == v31 && v16 == 3)
            -[CNUINavigationListView handlePressSelection](self, "handlePressSelection");
        }
      }
    }
  }
  else
  {
    -[CNUINavigationListView gestureStartLocationInWindow](self, "gestureStartLocationInWindow");
    v22 = v21 - v12;
    -[CNUINavigationListView gestureStartLocation](self, "gestureStartLocation");
    if (v22 == v23 - v7)
    {
      -[CNUINavigationListView trackedElementIndexPath](self, "trackedElementIndexPath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v13, "isEqual:", v26);

      if ((v27 & 1) == 0)
        -[CNUINavigationListView startTrackingElementAtIndexPath:](self, "startTrackingElementAtIndexPath:", v13);
      -[CNUINavigationListView trackedElementIndexPath](self, "trackedElementIndexPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUINavigationListView disclosureNavigationListViewCellForRowAtIndexPath:](self, "disclosureNavigationListViewCellForRowAtIndexPath:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        -[CNUINavigationListView updateCellAccessoryControlState:withTrackedLocation:](self, "updateCellAccessoryControlState:withTrackedLocation:", v29, v5, v7);

    }
    else
    {
      -[CNUINavigationListView selectionGestureRecognizer](self, "selectionGestureRecognizer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setEnabled:", 0);

      -[CNUINavigationListView selectionGestureRecognizer](self, "selectionGestureRecognizer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setEnabled:", 1);

    }
  }

}

- (void)handlePressSelection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNUINavigationListView visibleCells](self, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_19537);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CNUINavigationListView indexPathForCell:](self, "indexPathForCell:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUINavigationListView notifyDelegateWithSelectionEventAtIndexPath:](self, "notifyDelegateWithSelectionEventAtIndexPath:", v5);

}

- (void)handlePanGestureRecognizerUpdate:(id)a3
{
  void *v4;
  _BOOL8 v5;
  id v6;

  v6 = a3;
  -[CNUINavigationListView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !objc_msgSend(v6, "state")
    || objc_msgSend(v6, "state") == 4
    || objc_msgSend(v6, "state") == 5
    || objc_msgSend(v6, "state") == 3;
  objc_msgSend(v4, "setEnabled:", v5);

}

- (void)stopTrackingElementAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNUINavigationListView disclosureNavigationListViewCellForRowAtIndexPath:](self, "disclosureNavigationListViewCellForRowAtIndexPath:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setHighlighted:animated:", 0, 0);
    objc_msgSend(v5, "accessoryImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlighted:", 0);
  }
  else
  {
    -[CNUINavigationListView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlighted:animated:", 0, 0);
  }

  -[CNUINavigationListView setTrackedElementIndexPath:](self, "setTrackedElementIndexPath:", 0);
}

- (void)startTrackingElementAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[CNUINavigationListView trackedElementIndexPath](self, "trackedElementIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNUINavigationListView trackedElementIndexPath](self, "trackedElementIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListView stopTrackingElementAtIndexPath:](self, "stopTrackingElementAtIndexPath:", v5);

  }
  -[CNUINavigationListView setTrackedElementIndexPath:](self, "setTrackedElementIndexPath:", v14);
  -[CNUINavigationListView navigationListViewDelegate](self, "navigationListViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || (-[CNUINavigationListView navigationListViewDelegate](self, "navigationListViewDelegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "navigationListView:shouldHighlightRowAtIndexPath:", self, v14),
        v8,
        v9))
  {
    -[CNUINavigationListView disclosureNavigationListViewCellForRowAtIndexPath:](self, "disclosureNavigationListViewCellForRowAtIndexPath:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "setHighlighted:animated:", 1, 0);
      if (!v4)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      -[CNUINavigationListView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHighlighted:animated:", 1, 0);

      if (!v4)
        goto LABEL_8;
    }
    -[CNUINavigationListView retargetBehavior](self, "retargetBehavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectionChanged");

    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)location:(CGPoint)a3 isInAccessoryControlTouchArea:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(v7, "accessoryImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHidden");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "convertPoint:fromView:", self, x, y);
    v12 = v11;
    v14 = v13;
    objc_msgSend(v7, "accessoryImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");

    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    v17.x = v12;
    v17.y = v14;
    v10 = CGRectContainsPoint(v18, v17);
  }

  return v10;
}

- (void)updateCellAccessoryControlState:(id)a3 withTrackedLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _BOOL8 v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = -[CNUINavigationListView location:isInAccessoryControlTouchArea:](self, "location:isInAccessoryControlTouchArea:", v7, x, y);
  objc_msgSend(v7, "accessoryImageView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setHighlighted:", v8);
}

- (void)notifyDelegateWithSelectionEventAtPoint:(CGPoint)a3 trackedElementIndexPath:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  id v17;

  y = a3.y;
  x = a3.x;
  v17 = a4;
  -[CNUINavigationListView disclosureNavigationListViewCellForRowAtIndexPath:](self, "disclosureNavigationListViewCellForRowAtIndexPath:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && -[CNUINavigationListView location:isInAccessoryControlTouchArea:](self, "location:isInAccessoryControlTouchArea:", v7, x, y))
  {
    -[CNUINavigationListView navigationListViewDelegate](self, "navigationListViewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CNUINavigationListView navigationListViewDelegate](self, "navigationListViewDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationListView:accessoryButtonTappedForRowWithIndexPath:", self, v17);
LABEL_9:

    }
  }
  else
  {
    -[CNUINavigationListView navigationListViewDelegate](self, "navigationListViewDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0
      || (-[CNUINavigationListView navigationListViewDelegate](self, "navigationListViewDelegate"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "navigationListView:shouldSelectRowAtIndexPath:", self, v17),
          v13,
          v14))
    {
      -[CNUINavigationListView navigationListViewDelegate](self, "navigationListViewDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[CNUINavigationListView navigationListViewDelegate](self, "navigationListViewDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "navigationListView:didSelectRowAtIndexPath:", self, v17);
        goto LABEL_9;
      }
    }
  }

}

- (void)notifyDelegateWithSelectionEventAtIndexPath:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNUINavigationListView navigationListViewDelegate](self, "navigationListViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNUINavigationListView navigationListViewDelegate](self, "navigationListViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationListView:didSelectRowAtIndexPath:", self, v7);

  }
}

- (void)startTrackingSelectionFromGestureRecognizer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CNUINavigationListView clearAdditionalSelectionGestureRecognizer](self, "clearAdditionalSelectionGestureRecognizer");
  -[CNUINavigationListView setAdditionalSelectionGestureRecognizer:](self, "setAdditionalSelectionGestureRecognizer:", v5);
  -[CNUINavigationListView additionalSelectionGestureRecognizer](self, "additionalSelectionGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:", self, sel_handleSelectionGestureRecognizerUpdate_);

  -[CNUINavigationListView handleSelectionGestureRecognizerUpdate:](self, "handleSelectionGestureRecognizerUpdate:", v5);
}

- (void)clearAdditionalSelectionGestureRecognizer
{
  void *v3;

  -[CNUINavigationListView additionalSelectionGestureRecognizer](self, "additionalSelectionGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:", self, 0);

  -[CNUINavigationListView setAdditionalSelectionGestureRecognizer:](self, "setAdditionalSelectionGestureRecognizer:", 0);
}

- (CNUINavigationListViewDataSource)navigationListViewDataSource
{
  return (CNUINavigationListViewDataSource *)objc_loadWeakRetained((id *)&self->_navigationListViewDataSource);
}

- (void)setNavigationListViewDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_navigationListViewDataSource, a3);
}

- (CNUINavigationListViewDelegate)navigationListViewDelegate
{
  return (CNUINavigationListViewDelegate *)objc_loadWeakRetained((id *)&self->_navigationListViewDelegate);
}

- (void)setNavigationListViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationListViewDelegate, a3);
}

- (UILongPressGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (void)setSelectionGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, a3);
}

- (UIGestureRecognizer)additionalSelectionGestureRecognizer
{
  return self->_additionalSelectionGestureRecognizer;
}

- (void)setAdditionalSelectionGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_additionalSelectionGestureRecognizer, a3);
}

- (UIGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (void)setPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pressGestureRecognizer, a3);
}

- (NSIndexPath)trackedElementIndexPath
{
  return self->_trackedElementIndexPath;
}

- (void)setTrackedElementIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_trackedElementIndexPath, a3);
}

- (CGPoint)gestureStartLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_gestureStartLocation.x;
  y = self->_gestureStartLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGestureStartLocation:(CGPoint)a3
{
  self->_gestureStartLocation = a3;
}

- (CGPoint)gestureStartLocationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_gestureStartLocationInWindow.x;
  y = self->_gestureStartLocationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGestureStartLocationInWindow:(CGPoint)a3
{
  self->_gestureStartLocationInWindow = a3;
}

- (UISelectionFeedbackGenerator)retargetBehavior
{
  return self->_retargetBehavior;
}

- (void)setRetargetBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_retargetBehavior, a3);
}

- (_CNUINavigationListViewPermissiveGestureRecognizerDelegate)selectionGestureRecognizerDelegate
{
  return self->_selectionGestureRecognizerDelegate;
}

- (void)setSelectionGestureRecognizerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_selectionGestureRecognizerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionGestureRecognizerDelegate, 0);
  objc_storeStrong((id *)&self->_retargetBehavior, 0);
  objc_storeStrong((id *)&self->_trackedElementIndexPath, 0);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_additionalSelectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_navigationListViewDelegate);
  objc_destroyWeak((id *)&self->_navigationListViewDataSource);
}

uint64_t __46__CNUINavigationListView_handlePressSelection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFocused");
}

+ (BOOL)disableHeaderAccessibilityElements
{
  return 0;
}

@end
