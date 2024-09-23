@implementation AVEditView

- (double)trimStartTime
{
  void *v2;
  double v3;
  double v4;

  -[AVEditView movieScrubber](self, "movieScrubber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trimStartValue");
  v4 = v3;

  return v4;
}

- (double)trimEndTime
{
  void *v2;
  double v3;
  double v4;

  -[AVEditView movieScrubber](self, "movieScrubber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trimEndValue");
  v4 = v3;

  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVEditView;
  -[AVEditView layoutSubviews](&v13, sel_layoutSubviews);
  -[AVEditView bounds](self, "bounds");
  v4 = v3;
  v6 = v5 + 15.0;
  v8 = v7 + 0.0;
  v10 = v9 + -30.0;
  -[AVEditView movieScrubber](self, "movieScrubber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v6, v8, v10, v4);

  -[AVEditView movieScrubber](self, "movieScrubber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEdgeInset:", 15.0);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[AVEditView movieScrubber](self, "movieScrubber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVEditView movieScrubber](self, "movieScrubber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intrinsicContentSize");
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    v9 = *MEMORY[0x1E0DC55F0];
    v10 = *MEMORY[0x1E0DC55F0];
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AVUserInteractionObserverGestureRecognizer *v17;

  -[AVEditView movieScrubber](self, "movieScrubber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVEditView movieScrubber](self, "movieScrubber");
    v17 = (AVUserInteractionObserverGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    -[AVUserInteractionObserverGestureRecognizer reloadData](v17, "reloadData");
  }
  else
  {
    -[AVEditView dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editViewDuration:", self);
    v6 = v5;

    if (v6 <= 0.0)
      return;
    v7 = objc_alloc(MEMORY[0x1E0DC3A10]);
    -[AVEditView bounds](self, "bounds");
    v11 = (void *)objc_msgSend(v7, "initWithFrame:", v8 + 15.0, v9 + 0.0, v10 + -30.0);
    -[AVEditView setMovieScrubber:](self, "setMovieScrubber:", v11);

    -[AVEditView movieScrubber](self, "movieScrubber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDataSource:", self);

    -[AVEditView movieScrubber](self, "movieScrubber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

    -[AVEditView setPrefersThumbVisible:](self, "setPrefersThumbVisible:", 1);
    -[AVEditView movieScrubber](self, "movieScrubber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVEditView addSubview:](self, "addSubview:", v14);

    v17 = -[AVUserInteractionObserverGestureRecognizer initWithTarget:action:]([AVUserInteractionObserverGestureRecognizer alloc], "initWithTarget:action:", self, sel_userObservationGestureRecognizerFired_);
    -[AVEditView movieScrubber](self, "movieScrubber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addGestureRecognizer:", v17);

    -[AVEditView movieScrubber](self, "movieScrubber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEditable:", 1);

  }
}

- (void)userObservationGestureRecognizerFired:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 5)
    -[AVEditView setScrubbing:](self, "setScrubbing:", 0);

}

- (void)setThumbnailImage:(CGImage *)a3 forTimestamp:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AVEditView movieScrubber](self, "movieScrubber");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setThumbnailImage:forTimestamp:", a3, v6);

}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[AVEditView reloadData](self, "reloadData");
    v5 = obj;
  }

}

- (void)setScrubbing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_scrubbing != a3)
  {
    v3 = a3;
    self->_scrubbing = a3;
    -[AVEditView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "editViewDidBeginScrubbing:", self);

    }
    else
    {
      objc_msgSend(v5, "editViewDidEndScrubbing:", self);

      -[AVEditView setTrimming:](self, "setTrimming:", 0);
    }
  }
}

- (void)setPrefersThumbVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_prefersThumbVisible = a3;
  -[AVEditView movieScrubber](self, "movieScrubber");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThumbIsVisible:", v3);

}

- (void)setTrimming:(BOOL)a3
{
  self->_trimming = a3;
  if (a3)
    -[AVEditView setPrefersThumbVisible:](self, "setPrefersThumbVisible:", 0);
}

- (void)setCurrentTime:(double)a3
{
  double v3;
  BOOL v4;
  BOOL v5;
  double v6;
  double v7;
  id v8;

  v3 = fabs(a3);
  v4 = v3 < INFINITY;
  v5 = v3 <= INFINITY;
  v6 = 0.0;
  if (v4)
    v6 = a3;
  if (v5)
    v7 = v6;
  else
    v7 = a3;
  -[AVEditView movieScrubber](self, "movieScrubber");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:", v7);

}

- (double)movieScrubberDuration:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  BOOL v9;
  double result;

  -[AVEditView dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editViewDuration:", self);
  v6 = v5;

  v7 = fabs(v6);
  v8 = v7 < INFINITY;
  v9 = v7 <= INFINITY;
  result = 0.0;
  if (v8)
    result = v6;
  if (!v9)
    return v6;
  return result;
}

- (id)movieScrubber:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  v8 = a5;
  v9 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= 1)
  {
    objc_msgSend(v8, "doubleValue");
    v12 = v11;
    objc_msgSend(v9, "doubleValue");
    v14 = v13;
    v15 = a4 - 1;
    if (a4 != 1)
    {
      v16 = (v13 - v12) / (double)a4;
      v17 = 0.0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12 + v17 * v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18);

        v17 = v17 + 1.0;
        --v15;
      }
      while (v15);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v19);

  }
  return v10;
}

- (double)movieScrubberThumbnailAspectRatio:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[AVEditView dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editViewThumbnailAspectRatio:", self);
  v6 = v5;

  return v6;
}

- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AVEditView dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editView:requestThumbnailImageForTimestamp:", self, v5);

}

- (void)movieScrubber:(id)a3 valueDidChange:(double)a4
{
  id v6;

  -[AVEditView delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editView:currentTimeDidChange:", self, a4);

}

- (void)movieScrubberDidBeginScrubbing:(id)a3 withHandle:(int)a4
{
  -[AVEditView setScrubbing:](self, "setScrubbing:", 1, *(_QWORD *)&a4);
}

- (void)movieScrubberDidEndScrubbing:(id)a3 withHandle:(int)a4
{
  -[AVEditView setScrubbing:](self, "setScrubbing:", 0, *(_QWORD *)&a4);
}

- (void)movieScrubber:(id)a3 editingStartValueDidChange:(double)a4
{
  id v6;

  -[AVEditView setTrimming:](self, "setTrimming:", 1);
  -[AVEditView setScrubbing:](self, "setScrubbing:", 1);
  -[AVEditView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editView:trimStartTimeDidChange:", self, a4);

}

- (void)movieScrubber:(id)a3 editingEndValueDidChange:(double)a4
{
  id v6;

  -[AVEditView setTrimming:](self, "setTrimming:", 1);
  -[AVEditView setScrubbing:](self, "setScrubbing:", 1);
  -[AVEditView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editView:trimEndTimeDidChange:", self, a4);

}

- (void)movieScrubberWillBeginRequestingThumbnails:(id)a3
{
  id v4;

  -[AVEditView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editViewWillBeginRequestingThumbnails:", self);

}

- (void)movieScrubberDidFinishRequestingThumbnails:(id)a3
{
  id v4;

  -[AVEditView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editViewDidFinishRequestingThumbnails:", self);

}

- (AVEditViewDataSource)dataSource
{
  return (AVEditViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (AVEditViewDelegate)delegate
{
  return (AVEditViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)prefersThumbVisible
{
  return self->_prefersThumbVisible;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (BOOL)isTrimming
{
  return self->_trimming;
}

- (UIMovieScrubber)movieScrubber
{
  return (UIMovieScrubber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setMovieScrubber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieScrubber, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
