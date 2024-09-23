@implementation ContinuousReadingViewController

- (UIScrollView)_outerScrollView
{
  UIScrollView *outerScrollView;
  UIScrollView *v4;
  UIScrollView *v5;
  void *v6;

  outerScrollView = self->_outerScrollView;
  if (!outerScrollView)
  {
    v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    v5 = self->_outerScrollView;
    self->_outerScrollView = v4;

    -[UIScrollView setShowsVerticalScrollIndicator:](self->_outerScrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setPagingEnabled:](self->_outerScrollView, "setPagingEnabled:", 1);
    -[UIScrollView setAutoresizingMask:](self->_outerScrollView, "setAutoresizingMask:", 18);
    -[UIScrollView setDelegate:](self->_outerScrollView, "setDelegate:", self);
    -[UIScrollView _setAutoScrollEnabled:](self->_outerScrollView, "_setAutoScrollEnabled:", 0);
    -[UIScrollView setScrollsToTop:](self->_outerScrollView, "setScrollsToTop:", 0);
    -[UIScrollView setScrollEnabled:](self->_outerScrollView, "setScrollEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView setBackgroundColor:](self->_outerScrollView, "setBackgroundColor:", v6);

    self->_suppressingAutoScroll = 1;
    outerScrollView = self->_outerScrollView;
  }
  return outerScrollView;
}

- (BOOL)isCommittingToContinuousDocument
{
  return self->_committingToContinuousDocument;
}

- (ContinuousReadingBannerView)topBannerView
{
  return -[ContinuousReadingPreviewView bannerView](self->_previousItemPreviewView, "bannerView");
}

- (BOOL)isScrollingToNextContinuousDocument
{
  return self->_scrollingToNextContinuousDocument;
}

- (ContinuousReadingPreviewView)previewView
{
  return self->_previewView;
}

- (void)updateContinuousPreviewViewSizeAttributes
{
  id WeakRetained;
  double v4;
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
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  id v26;

  WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
  if (WeakRetained)
  {
    v26 = WeakRetained;
    objc_msgSend(WeakRetained, "bounds");
    v5 = v4;
    v7 = v6;
    -[ContinuousReadingPreviewView setContentViewSize:](self->_previousItemPreviewView, "setContentViewSize:", v4, v6);
    -[ContinuousReadingPreviewView setContentViewSize:](self->_previewView, "setContentViewSize:", v5, v7);
    objc_msgSend(v26, "_obscuredInsets");
    UIEdgeInsetsReplace();
    v25 = v8;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = v5 - (v9 + v13);
    objc_msgSend(v26, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentInset");
    v18 = v17;
    v20 = v19;

    -[ContinuousReadingPreviewView contentView](self->_previousItemPreviewView, "contentView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v26 != v21)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v21, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v15, v7, v15, v7, v5, v7);
      else
        objc_msgSend(v21, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:", v15, v7, v5, v7);
      objc_msgSend(v21, "scrollView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_sf_setContentInsetAdjustments:", 0.0, v18, 0.0, v20);

      objc_msgSend(v21, "_setObscuredInsets:", v25, v10, v12, v14);
    }
    -[ContinuousReadingPreviewView contentView](self->_previewView, "contentView");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if (v23 != v26)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v23, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v15, v7, v15, v7, v5, v7);
      else
        objc_msgSend(v23, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:", v15, v7, v5, v7);
      objc_msgSend(v23, "scrollView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_sf_setContentInsetAdjustments:", 0.0, v18, 0.0, v20);

      objc_msgSend(v23, "_setObscuredInsets:", v25, v10, v12, v14);
    }

    WeakRetained = v26;
  }

}

- (void)setBannerTheme:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  objc_storeStrong((id *)&self->_bannerTheme, a3);
  v7 = a3;
  -[ContinuousReadingPreviewView setBannerTheme:animated:](self->_previousItemPreviewView, "setBannerTheme:animated:", v7, v4);
  -[ContinuousReadingPreviewView setBannerTheme:animated:](self->_previewView, "setBannerTheme:animated:", v7, v4);

}

- (void)innerScrollViewDidScroll:(id)a3
{
  void *v4;
  double MaxY;
  double v6;
  double v7;
  double v8;
  double v9;
  double MinY;
  double v11;
  double v12;
  _BOOL4 v13;
  uint64_t v14;
  id v15;
  CGRect v16;
  CGRect v17;

  v15 = a3;
  if ((-[ContinuousReadingPreviewView canShowContentView](self->_previewView, "canShowContentView")
     || -[ContinuousReadingPreviewView canShowContentView](self->_previousItemPreviewView, "canShowContentView"))
    && !self->_suppressingAutoScroll)
  {
    -[ContinuousReadingViewController _outerScrollView](self, "_outerScrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    MaxY = CGRectGetMaxY(v16);
    objc_msgSend(v15, "contentSize");
    v7 = MaxY - v6;
    objc_msgSend(v15, "contentInset");
    v9 = v7 - v8;
    if (v7 - v8 >= 0.0)
    {
      v14 = -[ContinuousReadingPreviewView canShowContentView](self->_previewView, "canShowContentView", v9);
    }
    else
    {
      objc_msgSend(v15, "bounds", v9);
      MinY = CGRectGetMinY(v17);
      objc_msgSend(v15, "contentInset");
      v12 = MinY + v11;
      v13 = -[ContinuousReadingPreviewView canShowContentView](self->_previousItemPreviewView, "canShowContentView");
      v14 = v12 > 0.0 || v13;
      if (v12 > 0.0 && !v13)
      {
        if (!-[ContinuousReadingPreviewView canShowContentView](self->_previewView, "canShowContentView", v14))
        {
LABEL_14:

          goto LABEL_15;
        }
        v14 = 1;
      }
    }
    objc_msgSend(v4, "setScrollEnabled:", v14);
    goto LABEL_14;
  }
LABEL_15:

}

- (ContinuousReadingItem)currentItem
{
  return self->_currentItem;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ContinuousReadingPreviewView)previousItemPreviewView
{
  return self->_previousItemPreviewView;
}

- (void)setPreviousItemPreviewView:(id)a3
{
  ContinuousReadingPreviewView *v5;
  ContinuousReadingPreviewView *previousItemPreviewView;
  ContinuousReadingPreviewView *v7;

  v5 = (ContinuousReadingPreviewView *)a3;
  previousItemPreviewView = self->_previousItemPreviewView;
  v7 = v5;
  if (previousItemPreviewView != v5)
  {
    -[ContinuousReadingPreviewView removeFromSuperview](previousItemPreviewView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_previousItemPreviewView, a3);
    -[ContinuousReadingPreviewView setBannerTheme:animated:](v7, "setBannerTheme:animated:", self->_bannerTheme, 0);
    -[ContinuousReadingViewController updateOuterScrollView](self, "updateOuterScrollView");
  }

}

- (void)setCurrentWebView:(id)a3
{
  objc_storeWeak((id *)&self->_currentWebView, a3);
}

- (void)updateOuterScrollView
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[ContinuousReadingViewController _outerScrollView](self, "_outerScrollView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v4 = v3;
  v6 = v5;
  v7 = -[ContinuousReadingPreviewView canShowContentView](self->_previewView, "canShowContentView");
  v8 = -0.0;
  if (v7)
    v8 = v6;
  objc_msgSend(v12, "setContentSize:", v4, v6 + v8);
  if (-[ContinuousReadingPreviewView canShowContentView](self->_previousItemPreviewView, "canShowContentView"))
  {
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
  }
  else
  {
    v6 = *MEMORY[0x1E0DC49E8];
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  objc_msgSend(v12, "setContentInset:", v6, v9, v10, v11);

}

- (void)setPreviewView:(id)a3
{
  ContinuousReadingPreviewView *v5;
  ContinuousReadingPreviewView *previewView;
  ContinuousReadingPreviewView *v7;

  v5 = (ContinuousReadingPreviewView *)a3;
  previewView = self->_previewView;
  v7 = v5;
  if (previewView != v5)
  {
    -[ContinuousReadingPreviewView removeFromSuperview](previewView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_previewView, a3);
    -[ContinuousReadingPreviewView setBannerTheme:animated:](v7, "setBannerTheme:animated:", self->_bannerTheme, 0);
    -[ContinuousReadingViewController updateOuterScrollView](self, "updateOuterScrollView");
  }

}

- (BOOL)isUserInteractingWithContainer
{
  void *v3;
  BOOL v4;
  double v5;
  double v6;
  double v7;

  -[ContinuousReadingViewController _outerScrollView](self, "_outerScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTracking") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "contentOffset");
    v6 = v5;
    -[ContinuousReadingViewController scrollOffsetYForCurrentDocument](self, "scrollOffsetYForCurrentDocument");
    v4 = v6 != v7;
  }

  return v4;
}

- (void)didCreateWebViewForNextDocument:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[3];

  v4 = a3;
  -[ContinuousReadingPreviewView contentView](self->_previewView, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
    objc_msgSend(WeakRetained, "frame");
    v10 = v9;
    v12 = v11;

    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v17[0] = *MEMORY[0x1E0C9BAA8];
    v17[1] = v13;
    v17[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v4, "setTransform:", v17);
    objc_msgSend(v4, "setFrame:", v6, v7, v10, v12);
    objc_msgSend(v4, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClipsToBounds:", 1);

    objc_msgSend(v4, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScrollsToTop:", 0);

    -[ContinuousReadingPreviewView setContentView:](self->_previewView, "setContentView:", v4);
    -[ContinuousReadingViewController _outerScrollView](self, "_outerScrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClippingView:", v16);

    -[ContinuousReadingViewController updateOuterScrollView](self, "updateOuterScrollView");
  }

}

- (void)didCreateWebViewForPreviousDocument:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[3];

  v4 = a3;
  -[ContinuousReadingPreviewView contentView](self->_previousItemPreviewView, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
    objc_msgSend(WeakRetained, "frame");
    v10 = v9;
    v12 = v11;

    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v17[0] = *MEMORY[0x1E0C9BAA8];
    v17[1] = v13;
    v17[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v4, "setTransform:", v17);
    objc_msgSend(v4, "setFrame:", v6, v7, v10, v12);
    objc_msgSend(v4, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClipsToBounds:", 1);

    objc_msgSend(v4, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScrollsToTop:", 0);

    -[ContinuousReadingPreviewView setContentView:](self->_previousItemPreviewView, "setContentView:", v4);
    -[ContinuousReadingViewController _outerScrollView](self, "_outerScrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClippingView:", v16);

    -[ContinuousReadingViewController updateOuterScrollView](self, "updateOuterScrollView");
  }

}

- (void)_willCommitToContinuousDocumentInPreviewView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  double v14;
  id v15;

  v4 = a3;
  -[ContinuousReadingViewController _outerScrollView](self, "_outerScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  -[ContinuousReadingViewController _outerScrollView](self, "_outerScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  objc_msgSend(v4, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "scrollView");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_sf_setContentInsetAdjustments:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v15, "contentOffset");
  v10 = v9;
  v12 = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "continuousReadingViewControllerNextWebViewLandingOffset:includeBottomBar:", self, 0);
  objc_msgSend(v15, "setContentOffset:", v10, v12 - v14);

}

- (void)_commitToNextContinuousDocument
{
  void *v3;
  id WeakRetained;

  -[ContinuousReadingViewController _willCommitToContinuousDocumentInPreviewView:](self, "_willCommitToContinuousDocumentInPreviewView:", self->_previewView);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[ContinuousReadingPreviewView continuousReadingItem](self->_previewView, "continuousReadingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_committingToContinuousDocument = 1;
  objc_msgSend(WeakRetained, "continuousReadingViewControllerWillCommitToLoadNextItem:", self);
  objc_msgSend(WeakRetained, "continuousReadingViewController:didCommitToLoadItem:", self, v3);
  self->_committingToContinuousDocument = 0;

}

- (void)_commitToPreviousContinuousDocument
{
  void *v3;
  id WeakRetained;

  -[ContinuousReadingViewController _willCommitToContinuousDocumentInPreviewView:](self, "_willCommitToContinuousDocumentInPreviewView:", self->_previousItemPreviewView);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[ContinuousReadingPreviewView continuousReadingItem](self->_previousItemPreviewView, "continuousReadingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_committingToContinuousDocument = 1;
  objc_msgSend(WeakRetained, "continuousReadingViewControllerCommitToLoadPreviousItem:", self);
  objc_msgSend(WeakRetained, "continuousReadingViewController:didCommitToLoadItem:", self, v3);
  self->_committingToContinuousDocument = 0;

}

- (double)scrollOffsetYForCurrentDocument
{
  return 0.0;
}

- (double)_scrollOffsetYForNextDocument
{
  void *v2;
  double Height;
  CGRect v5;

  -[ContinuousReadingViewController _outerScrollView](self, "_outerScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  Height = CGRectGetHeight(v5);

  return Height;
}

- (double)_scrollOffsetYForPreviousDocument
{
  void *v2;
  double v3;
  CGRect v5;

  -[ContinuousReadingViewController _outerScrollView](self, "_outerScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v3 = -CGRectGetHeight(v5);

  return v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  id v10;

  v4 = a3;
  if (!self->_suppressingAutoScroll)
  {
    v10 = v4;
    objc_msgSend(v4, "contentOffset");
    if (v5 < 0.0
      && !-[ContinuousReadingPreviewView canShowContentView](self->_previousItemPreviewView, "canShowContentView"))
    {
      objc_msgSend(v10, "setContentOffset:", 0.0, 0.0);
      goto LABEL_7;
    }
    objc_msgSend(v10, "contentOffset");
    v7 = v6;
    -[ContinuousReadingViewController scrollOffsetYForCurrentDocument](self, "scrollOffsetYForCurrentDocument");
    v4 = v10;
    if (v7 != v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "continuousReadingViewController:scrollViewDidScroll:", self, v10);

LABEL_7:
      v4 = v10;
    }
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double v7;
  id WeakRetained;
  void *v9;
  id v10;
  CGFloat v11;
  _QWORD v12[5];
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  y = a5->y;
  -[ContinuousReadingViewController _scrollOffsetYForNextDocument](self, "_scrollOffsetYForNextDocument", a3, a4.x, a4.y);
  if (y == v7)
  {
    self->_scrollingToNextContinuousDocument = 1;
    memset(&v16, 0, sizeof(v16));
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
    v9 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "transform");
    else
      memset(&v16, 0, sizeof(v16));

    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "continuousReadingViewControllerNextWebViewLandingOffset:includeBottomBar:", self, 1);
    v14 = v16;
    CGAffineTransformTranslate(&v15, &v14, 0.0, v11);
    v16 = v15;

    v12[1] = 3221225472;
    v13 = v16;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[2] = __94__ContinuousReadingViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke;
    v12[3] = &unk_1E9CF7820;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, 0.15);
  }
}

void __94__ContinuousReadingViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  _OWORD v4[3];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(WeakRetained, "setTransform:", v4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "contentOffset");
  v5 = v4;
  -[ContinuousReadingViewController _scrollOffsetYForNextDocument](self, "_scrollOffsetYForNextDocument");
  if (v5 == v6)
  {
    -[ContinuousReadingViewController _commitToNextContinuousDocument](self, "_commitToNextContinuousDocument");
    self->_scrollingToNextContinuousDocument = 0;
  }
  else
  {
    objc_msgSend(v10, "contentOffset");
    v8 = v7;
    -[ContinuousReadingViewController _scrollOffsetYForPreviousDocument](self, "_scrollOffsetYForPreviousDocument");
    if (v8 == v9)
      -[ContinuousReadingViewController _commitToPreviousContinuousDocument](self, "_commitToPreviousContinuousDocument");
  }

}

- (void)setCurrentItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentItem, a3);
}

- (_SFWebView)currentWebView
{
  return (_SFWebView *)objc_loadWeakRetained((id *)&self->_currentWebView);
}

- (BOOL)isSuppressingAutoScroll
{
  return self->_suppressingAutoScroll;
}

- (void)setSuppressingAutoScroll:(BOOL)a3
{
  self->_suppressingAutoScroll = a3;
}

- (ContinuousReadingViewControllerDelegate)delegate
{
  return (ContinuousReadingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setOuterScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_outerScrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_currentWebView);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_previousItemPreviewView, 0);
  objc_storeStrong((id *)&self->_bannerTheme, 0);
}

@end
