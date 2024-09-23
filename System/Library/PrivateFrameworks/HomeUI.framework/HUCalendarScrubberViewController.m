@implementation HUCalendarScrubberViewController

- (HUCalendarScrubberViewController)initWithDataSource:(id)a3
{
  id v5;
  void *v6;
  HUCalendarScrubberViewController *v7;
  HUCalendarScrubberViewController *v8;
  objc_super v10;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setScrollDirection:", 1);
  objc_msgSend(v6, "setSectionInset:", 0.0, 20.0, 0.0, 20.0);
  objc_msgSend(v6, "setMinimumLineSpacing:", 16.0);
  v10.receiver = self;
  v10.super_class = (Class)HUCalendarScrubberViewController;
  v7 = -[HUCalendarScrubberViewController initWithCollectionViewLayout:](&v10, sel_initWithCollectionViewLayout_, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataSource, a3);
    -[HUCalendarScrubberDataSource addChangeObserver:](v8->_dataSource, "addChangeObserver:", v8);
  }

  return v8;
}

- (HUCalendarScrubberViewController)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDataSource_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCalendarScrubberViewController.m"), 54, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCalendarScrubberViewController initWithCoder:]",
    v6);

  return 0;
}

- (HUCalendarScrubberViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDataSource_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCalendarScrubberViewController.m"), 58, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCalendarScrubberViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUCalendarScrubberViewController)initWithCollectionViewLayout:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDataSource_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCalendarScrubberViewController.m"), 62, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCalendarScrubberViewController initWithCollectionViewLayout:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUCalendarScrubberViewController;
  -[HUCalendarScrubberViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[HUCalendarScrubberViewController setCurrentSection:](self, "setCurrentSection:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HUCalendarScrubberViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPagingEnabled:", 1);

  -[HUCalendarScrubberViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", 0);

  -[HUCalendarScrubberViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSemanticContentAttribute:", 3);

  -[HUCalendarScrubberViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CalendarScrubberCell"));

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUCalendarScrubberViewController;
  -[HUCalendarScrubberViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[HUCalendarScrubberViewController lastBoundsWidth](self, "lastBoundsWidth");
  -[HUCalendarScrubberViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = NACGFloatEqualToFloat();

  if ((v4 & 1) == 0)
  {
    -[HUCalendarScrubberViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    -[HUCalendarScrubberViewController setLastBoundsWidth:](self, "setLastBoundsWidth:", v6);

    -[HUCalendarScrubberViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = (v8 + -168.0) * 0.125;

    v10 = fmax(v9, 0.0);
    -[HUCalendarScrubberViewController collectionViewLayout](self, "collectionViewLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMinimumLineSpacing:", v10);

    -[HUCalendarScrubberViewController collectionViewLayout](self, "collectionViewLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSectionInset:", 0.0, v10, 0.0, v10);

    -[HUCalendarScrubberViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadData");

    -[HUCalendarScrubberViewController collectionViewLayout](self, "collectionViewLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidateLayout");

  }
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HUCalendarScrubberViewController;
  -[HUCalendarScrubberViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (unint64_t)nextSection
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[HUCalendarScrubberViewController currentSection](self, "currentSection");
  -[HUCalendarScrubberViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v4, "numberOfSections") - 1)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = -[HUCalendarScrubberViewController currentSection](self, "currentSection") + 1;

  return v5;
}

- (unint64_t)previousSection
{
  if (-[HUCalendarScrubberViewController currentSection](self, "currentSection") < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[HUCalendarScrubberViewController currentSection](self, "currentSection") - 1;
}

- (void)jumpToSection:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v5 = a4;
  v20 = a5;
  -[HUCalendarScrubberViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfSections");

  v10 = v20;
  if (v9 > a3)
  {
    -[HUCalendarScrubberViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;

    -[HUCalendarScrubberViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentOffset");
    v18 = v17;

    -[HUCalendarScrubberViewController collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scrollRectToVisible:animated:", v5, v13 * (double)a3, 0.0, v13, v15);

    if (v5 && vabdd_f64(v13 * (double)a3, v18) > 0.00000011920929)
    {
      -[HUCalendarScrubberViewController setScrollCompletionBlock:](self, "setScrollCompletionBlock:", v20);
    }
    else if (v20)
    {
      (*((void (**)(id, uint64_t))v20 + 2))(v20, 1);
    }
    -[HUCalendarScrubberViewController setCurrentSection:](self, "setCurrentSection:", a3);
    v10 = v20;
  }

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[HUCalendarScrubberViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "totalNumberOfWeeks");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CalendarScrubberCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "dayOfMonthForItemAtIndexPath:", v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%li"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDateString:", v10);

  if (v9 == 1)
    objc_msgSend(v8, "shortMonthNameForItemAtIndexPath:", v6);
  else
    objc_msgSend(v8, "dayOfWeekForItemAtIndexPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDayOfWeekString:", v11);

  objc_msgSend(v7, "setEnabled:", objc_msgSend(v8, "eventExistsForItemAtIndexPath:", v6));
  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUCalendarScrubberViewController scrubberDelegate](self, "scrubberDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrubberViewController:didSelectItemAtIndex:", self, v5);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HUCalendarScrubberViewController;
  v7 = a4;
  -[HUCalendarScrubberViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__HUCalendarScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6F4CB78;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __87__HUCalendarScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[HUCalendarScrubberViewController collectionView](self, "collectionView", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v8 = 24.0;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  uint64_t v5;
  double MidX;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  CGRect v11;
  CGRect v12;

  -[HUCalendarScrubberViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberViewController collectionView](self, "collectionView");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "bounds");
  MidX = CGRectGetMidX(v11);
  -[HUCalendarScrubberViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v4, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v12));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[HUCalendarScrubberViewController setCurrentSection:](self, "setCurrentSection:", objc_msgSend(v10, "section"));
  -[HUCalendarScrubberViewController scrubberDelegate](self, "scrubberDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HUCalendarScrubberViewController scrubberDelegate](self, "scrubberDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrubberViewController:didMoveToSection:", self, -[HUCalendarScrubberViewController currentSection](self, "currentSection"));

  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  -[HUCalendarScrubberViewController scrollCompletionBlock](self, "scrollCompletionBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUCalendarScrubberViewController scrollCompletionBlock](self, "scrollCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 1);

    -[HUCalendarScrubberViewController setScrollCompletionBlock:](self, "setScrollCompletionBlock:", 0);
  }
}

- (void)scrubberDataSourceDidReload:(id)a3
{
  id v3;

  -[HUCalendarScrubberViewController collectionView](self, "collectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (HUCalendarScrubberDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (HUCalendarScrubberViewDelegate)scrubberDelegate
{
  return (HUCalendarScrubberViewDelegate *)objc_loadWeakRetained((id *)&self->_scrubberDelegate);
}

- (void)setScrubberDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrubberDelegate, a3);
}

- (int64_t)currentSection
{
  return self->_currentSection;
}

- (void)setCurrentSection:(int64_t)a3
{
  self->_currentSection = a3;
}

- (id)scrollCompletionBlock
{
  return self->_scrollCompletionBlock;
}

- (void)setScrollCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (double)lastBoundsWidth
{
  return self->_lastBoundsWidth;
}

- (void)setLastBoundsWidth:(double)a3
{
  self->_lastBoundsWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scrollCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_scrubberDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
