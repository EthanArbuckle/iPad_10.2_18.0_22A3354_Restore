@implementation BrowserRootViewController

- (double)horizontalMarginForCatalogViewInPopover
{
  void *v3;
  double result;
  CGRect v5;

  -[BrowserRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");

  -[ViewWithCustomNextResponder bounds](self->_contentContainerView, "bounds");
  CGRectGetWidth(v5);
  _SFRoundFloatToPixels();
  return result;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  objc_super v39;
  CGRect v40;

  v39.receiver = self;
  v39.super_class = (Class)BrowserRootViewController;
  -[BrowserRootViewController viewWillLayoutSubviews](&v39, sel_viewWillLayoutSubviews);
  -[BrowserRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  CGRectGetWidth(v40);
  v4 = _SFSizeClassForWidth();
  -[BrowserRootViewController traitOverrides](self, "traitOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHorizontalSizeClass:", v4);

  -[BrowserRootViewController _frameForContentContainerView](self, "_frameForContentContainerView");
  -[ViewWithCustomNextResponder setFrame:](self->_contentContainerView, "setFrame:");
  -[ViewWithCustomNextResponder bounds](self->_contentContainerView, "bounds");
  -[SFOrderedContainerView setFrame:](self->_documentAndTopBarsContainerView, "setFrame:");
  -[BrowserRootViewController _layOutTabView](self, "_layOutTabView");
  -[BrowserRootViewController layOutTopBars](self, "layOutTopBars");
  -[BrowserRootViewController _layOutScrollToTopView](self, "_layOutScrollToTopView");
  -[BrowserRootViewController _updateToolbarPlacementIfNeeded](self, "_updateToolbarPlacementIfNeeded");
  -[BrowserRootViewController _layOutBottomToolbar](self, "_layOutBottomToolbar");
  -[BrowserRootViewController _layOutSidebar](self, "_layOutSidebar");
  -[BrowserRootViewController _layOutSidebarContentDimmingView](self, "_layOutSidebarContentDimmingView");
  -[BrowserRootViewController _layOutWebpageStatusBarView](self, "_layOutWebpageStatusBarView");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserViewControllerDidLayOutSubviews:", self);
  v37 = *(float64x2_t *)&self->_obscuredInsets.bottom;
  v38 = *(float64x2_t *)&self->_obscuredInsets.top;
  v35 = *(float64x2_t *)&self->_maximumObscuredInsets.bottom;
  v36 = *(float64x2_t *)&self->_maximumObscuredInsets.top;
  -[BrowserRootViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[BrowserRootViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", v16, 0, v9, v11, v13, v15);
  self->_maximumObscuredInsets.top = v17;
  self->_maximumObscuredInsets.left = v18;
  self->_maximumObscuredInsets.bottom = v19;
  self->_maximumObscuredInsets.right = v20;

  -[BrowserRootViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[BrowserRootViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserRootViewController obscuredInsetsForRect:inCoordinateSpace:](self, "obscuredInsetsForRect:inCoordinateSpace:", v30, v23, v25, v27, v29);
  self->_obscuredInsets.top = v31;
  self->_obscuredInsets.left = v32;
  self->_obscuredInsets.bottom = v33;
  self->_obscuredInsets.right = v34;

  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_maximumObscuredInsets.top, v36), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_maximumObscuredInsets.bottom, v35))), 0xFuLL))) & 1) == 0&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "browserViewControllerDidChangeMaximumObscuredInsets:", self);
  }
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_obscuredInsets.top, v38), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_obscuredInsets.bottom, v37))), 0xFuLL))) & 1) == 0&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "browserViewControllerDidChangeBarInsets:", self);
  }
  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
    -[BrowserRootViewController _setNeedsUpdateOfMultitaskingDragExclusionRects](self, "_setNeedsUpdateOfMultitaskingDragExclusionRects");
  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  -[SFStepperContainer setFrame:](self->_stepperContainer, "setFrame:");

}

- (int64_t)toolbarPlacement
{
  -[BrowserRootViewController _updateToolbarPlacementIfNeeded](self, "_updateToolbarPlacementIfNeeded");
  return self->_toolbarPlacement;
}

- (void)_layOutTabView
{
  ViewWithCustomNextResponder *contentContainerView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
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
  id WeakRetained;
  void *v31;
  void *v32;
  TabSwitcherViewController *tabSwitcherViewController;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  TabSwitcherViewController *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  id v63;

  contentContainerView = self->_contentContainerView;
  -[BrowserRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[BrowserRootViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ViewWithCustomNextResponder convertRect:fromView:](contentContainerView, "convertRect:fromView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 8, self->_contentContainerView, v15, v17, v19, v21);
  v23 = v15 + v22;
  v25 = v17 + v24;
  v27 = v19 - (v22 + v26);
  v29 = v21 - (v24 + v28);
  if (SFTabGroupSwitcherEnabled())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabCollectionViewProvider");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "tabViewContainerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", v23, v25, v27, v29);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
    objc_msgSend(WeakRetained, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v23, v25, v27, v29);
  }

  tabSwitcherViewController = self->_tabSwitcherViewController;
  if (tabSwitcherViewController)
  {
    -[TabSwitcherViewController view](tabSwitcherViewController, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFrame:", v23, v25, v27, v29);

    -[BrowserRootViewController view](self, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    -[BrowserRootViewController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", v44, 1, v37, v39, v41, v43);
    -[TabSwitcherViewController setBrowserContentInsets:](self->_tabSwitcherViewController, "setBrowserContentInsets:");

    v45 = self->_tabSwitcherViewController;
    -[ViewWithCustomNextResponder bounds](self->_contentContainerView, "bounds");
    v47 = v46;
    v49 = v48;
    -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
    -[BrowserRootViewController obscuredInsetsForRect:inCoordinateSpace:](self, "obscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;
    -[TabSwitcherViewController delegate](self->_tabSwitcherViewController, "delegate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "tabCollectionViewItemHeaderHeightIncludedInSnapshot:", self->_tabSwitcherViewController);
    v60 = v51 + v59;

    -[TabSwitcherViewController setBorrowedContentSize:obscuredInsets:](v45, "setBorrowedContentSize:obscuredInsets:", v47, v49, v60, v53, v55, v57);
    -[BrowserRootViewController capsuleCollectionViewLayout](self, "capsuleCollectionViewLayout");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "capsuleFrame");
      -[TabSwitcherViewController setCapsuleReferenceFrame:](self->_tabSwitcherViewController, "setCapsuleReferenceFrame:");

      -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
      v63 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "pageWidth");
      -[TabSwitcherViewController setLinkedPanGesturePageWidth:](self->_tabSwitcherViewController, "setLinkedPanGesturePageWidth:");

    }
    else
    {
      -[TabSwitcherViewController setCapsuleReferenceFrame:](self->_tabSwitcherViewController, "setCapsuleReferenceFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      -[TabSwitcherViewController setLinkedPanGesturePageWidth:](self->_tabSwitcherViewController, "setLinkedPanGesturePageWidth:", 0.0);
    }
  }
}

- (void)_layOutWebpageStatusBarView
{
  _SFWebView *webView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double Width;
  double MinY;
  double MinX;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  webView = self->_webView;
  -[_SFWebView frame](webView, "frame");
  -[_SFWebView convertRect:toView:](webView, "convertRect:toView:", self->_documentAndTopBarsContainerView);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SFOrderedContainerView frame](self->_documentAndTopBarsContainerView, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  MinX = CGRectGetMinX(v23);
  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  Width = CGRectGetWidth(v25);
  v26.origin.x = v13;
  v26.origin.y = v15;
  v26.size.width = v17;
  v26.size.height = v19;
  -[SFWebpageStatusBarView setFrame:](self->_statusBarView, "setFrame:", MinX, MinY, Width, CGRectGetHeight(v26));
}

- (void)_layOutSidebar
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[BrowserRootViewController _frameForSidebarWhenShowing:](self, "_frameForSidebarWhenShowing:", self->_showingSidebar);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SidebarViewController view](self->_sidebarViewController, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)_layOutSidebarContentDimmingView
{
  SidebarContentDimmingView *sidebarContentDimmingView;

  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  -[SidebarContentDimmingView setFrame:](self->_sidebarContentDimmingView, "setFrame:");
  sidebarContentDimmingView = self->_sidebarContentDimmingView;
  -[BrowserRootViewController _sidebarDimmedContentFrameIncludingSidebarOnlyIfEmbedded:](self, "_sidebarDimmedContentFrameIncludingSidebarOnlyIfEmbedded:", 0);
  -[SidebarContentDimmingView setDimmedContentFrame:](sidebarContentDimmingView, "setDimmedContentFrame:");
  -[SidebarContentDimmingView setTransparent:](self->_sidebarContentDimmingView, "setTransparent:", -[BrowserRootViewController _shouldShowSidebarContentDimmingView](self, "_shouldShowSidebarContentDimmingView") ^ 1);
}

- (CGRect)_sidebarDimmedContentFrameIncludingSidebarOnlyIfEmbedded:(BOOL)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  if (a3)
    v4 = 8;
  else
    v4 = 4;
  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", v4, self->_documentAndTopBarsContainerView);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[BrowserRootViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaInsets");
  v15 = v6 - v14;

  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  v17 = v8 + v16;
  v19 = v15 + v18;
  v21 = v20 - (v8 + v12);
  v23 = v22 - (v10 + v15);
  result.size.height = v23;
  result.size.width = v21;
  result.origin.y = v19;
  result.origin.x = v17;
  return result;
}

- (BOOL)_shouldShowSidebarContentDimmingView
{
  return self->_showingSidebar && self->_sidebarStyle == 1;
}

- (void)_layOutScrollToTopView
{
  double v3;
  double v4;
  void *v5;
  id WeakRetained;
  CGRect v7;

  if (self->_scrollToTopView)
  {
    v3 = 5.0;
    if (-[_SFDynamicBarAnimator state](self->_dynamicBarAnimator, "state") != 1)
    {
      -[ScrollToTopView defaultHeight](self->_scrollToTopView, "defaultHeight");
      v3 = v4;
    }
    -[BrowserRootViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    -[ScrollToTopView setFrame:](self->_scrollToTopView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v7), v3);

    WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
    -[ScrollToTopView setHidden:](self->_scrollToTopView, "setHidden:", objc_msgSend(WeakRetained, "presentationState") != 0);

  }
}

- (void)_layOutBottomToolbar
{
  if (self->_bottomToolbar)
  {
    -[BrowserRootViewController _frameForBottomToolbarForceHidden:](self, "_frameForBottomToolbarForceHidden:", 0);
    -[BrowserToolbar setFrame:](self->_bottomToolbar, "setFrame:");
    -[BrowserToolbar setNeedsLayout](self->_bottomToolbar, "setNeedsLayout");
  }
}

- (CGRect)_frameForSidebarWhenShowing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  BrowserToolbar *bottomToolbar;
  SFOrderedContainerView *documentAndTopBarsContainerView;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MaxY;
  double v20;
  double Height;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  uint64_t v27;
  double v28;
  double v29;
  double Width;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  v3 = a3;
  -[BrowserRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;

  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  v8 = v7 + CGRectGetHeight(v35);
  if (self->_toolbarPlacement == 1)
  {
    bottomToolbar = self->_bottomToolbar;
    if (bottomToolbar)
    {
      documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
      -[BrowserToolbar bounds](bottomToolbar, "bounds");
      -[SFOrderedContainerView convertRect:fromView:](documentAndTopBarsContainerView, "convertRect:fromView:", self->_bottomToolbar);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
      MaxY = CGRectGetMaxY(v36);
      v37.origin.x = v12;
      v37.origin.y = v14;
      v37.size.width = v16;
      v37.size.height = v18;
      v20 = MaxY - CGRectGetMinY(v37);
      if (v20 >= 0.0)
      {
        v38.origin.x = v12;
        v38.origin.y = v14;
        v38.size.width = v16;
        v38.size.height = v18;
        Height = CGRectGetHeight(v38);
        -[SFOrderedContainerView safeAreaInsets](self->_documentAndTopBarsContainerView, "safeAreaInsets");
        if (v20 <= Height + v22)
          v8 = v8 - v20;
      }
    }
  }
  v23 = -v7;
  -[SidebarViewController separatorWidth](self->_sidebarViewController, "separatorWidth");
  v25 = v24;
  if (-[SFOrderedContainerView _sf_usesLeftToRightLayout](self->_documentAndTopBarsContainerView, "_sf_usesLeftToRightLayout"))
  {
    v26 = 0.0;
    if (!v3)
    {
      v27 = 0x4074000000000000;
      v28 = v23;
      v29 = v8;
      v26 = -CGRectGetWidth(*(CGRect *)&v26) - v25;
    }
  }
  else
  {
    -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
    Width = CGRectGetWidth(v39);
    v31 = Width;
    if (v3)
    {
      v40.size.width = 320.0;
      v40.origin.x = 0.0;
      v40.origin.y = v23;
      v40.size.height = v8;
      v26 = v31 - CGRectGetWidth(v40);
    }
    else
    {
      v26 = v25 + Width;
    }
  }
  v32 = 320.0;
  v33 = v23;
  v34 = v8;
  result.size.height = v34;
  result.size.width = v32;
  result.origin.y = v33;
  result.origin.x = v26;
  return result;
}

- (CGRect)_frameForContentContainerView
{
  _BOOL4 v3;
  void *v4;
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
  CGRect result;

  v3 = -[BrowserRootViewController insetsContentContainerFromStatusBar](self, "insetsContentContainerFromStatusBar");
  -[BrowserRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v8 = v7;
  v10 = v9;
  if (v3)
  {
    objc_msgSend(v4, "safeAreaInsets");
    v12 = v11;
    v10 = v10 - v11;
    v13 = 0.0;
  }
  else
  {
    v13 = v5;
    v12 = v6;
  }

  v14 = v13;
  v15 = v12;
  v16 = v8;
  v17 = v10;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BookmarksBarView)bookmarksBar
{
  return self->_bookmarksBar;
}

- (void)updateOrderedSubviewsForOrderedContainerView:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  uint64_t v10;
  id v11;
  SFStepperContainer *stepperContainer;
  SFWebpageStatusBarView *statusBarView;
  SFThemeColorEffectView *statusBarBackdrop;
  ScrollToTopView *scrollToTopView;
  SFLockedPrivateBrowsingView *lockedPrivateBrowsingView;
  uint64_t v17;
  SFThemeColorEffectView *topBackdrop;
  uint64_t v19;
  void *v20;
  SFThemeColorEffectView *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  UnifiedBar *unifiedBar;
  BarContainerView *topAuxiliaryBarsContainerView;
  TabHoverPreview *tabHoverPreview;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  ViewWithCustomNextResponder *contentContainerView;
  id v38;
  SFStepperContainer *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id WeakRetained;
  SFThemeColorEffectView *v45;
  id v46;
  UnifiedBar *v47;
  NavigationBar *navigationBar;
  BarContainerView *v49;
  TabBarDropExpansionView *tabBarDropExpansionView;
  TabHoverPreview *v51;
  id v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BrowserRootViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    contentContainerView = self->_contentContainerView;
    v11 = (id)-[CapsuleNavigationBarViewController view](self->_capsuleViewController, "view");
    stepperContainer = self->_stepperContainer;
    statusBarView = self->_statusBarView;
    statusBarBackdrop = self->_statusBarBackdrop;
    scrollToTopView = self->_scrollToTopView;
    v38 = v11;
    v39 = stepperContainer;
    lockedPrivateBrowsingView = self->_lockedPrivateBrowsingView;
    v40 = (uint64_t)statusBarView;
    v41 = (uint64_t)statusBarBackdrop;
    v42 = scrollToTopView;
    v43 = (uint64_t)lockedPrivateBrowsingView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_clipperView);

    objc_msgSend(v4, "updateOrderedSubviews:count:", &contentContainerView, 8);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_browserController);
    -[BrowserRootViewController capsuleCollectionViewLayout](self, "capsuleCollectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = WBSIsEqual();

    v9 = -[BrowserRootViewController isUsingBottomCapsule](self, "isUsingBottomCapsule");
    -[BrowserRootViewController _continuousReadingViewController](self, "_continuousReadingViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    contentContainerView = (ViewWithCustomNextResponder *)(id)objc_msgSend(v35, "view");
    v38 = (id)-[SFScreenTimeOverlayViewController view](self->_screenTimeOverlayViewController, "view");
    objc_msgSend(v6, "bannerController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (SFStepperContainer *)(id)objc_msgSend(v34, "tabGroupBanner");
    if (v9)
    {
      v10 = 0;
    }
    else
    {
      -[SFToastViewController view](self->_currentlyPresentedToastViewController, "view");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v40 = v10;
    v33 = (void *)v10;
    if (v8)
    {
      -[CatalogViewController view](self->_catalogViewController, "view");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    topBackdrop = self->_topBackdrop;
    v41 = v17;
    v42 = topBackdrop;
    v32 = (void *)v17;
    if (v9)
    {
      -[SFToastViewController view](self->_currentlyPresentedToastViewController, "view");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    v43 = v19;
    v31 = (void *)v19;
    if ((v8 & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      -[CatalogViewController view](self->_catalogViewController, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = self->_statusBarBackdrop;
    WeakRetained = v20;
    v45 = v21;
    v36 = v6;
    objc_msgSend(v6, "tabController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activeTabDocument");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sfScribbleControllerIfLoaded");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v24, "overlay");
    unifiedBar = self->_unifiedBar;
    v46 = v25;
    v47 = unifiedBar;
    topAuxiliaryBarsContainerView = self->_topAuxiliaryBarsContainerView;
    navigationBar = self->_navigationBar;
    v49 = topAuxiliaryBarsContainerView;
    tabHoverPreview = self->_tabHoverPreview;
    tabBarDropExpansionView = self->_tabBarDropExpansionView;
    v51 = tabHoverPreview;
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (id)objc_msgSend(v29, "lockdownStatusBar");
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (id)objc_msgSend(v30, "minimizedProgressView");

    if ((v8 & 1) == 0)
    if (v9)

    if (v8)
    if (!v9)

    objc_msgSend(v4, "updateOrderedSubviews:count:", &contentContainerView, 17);
  }

}

- (void)updateViewsAfterContentContainerViewBoundsChange
{
  double v3;
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
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  -[ViewWithCustomNextResponder bounds](self->_contentContainerView, "bounds");
  -[BrowserRootViewController contentContainerViewFrameForBrowserSize:](self, "contentContainerViewFrameForBrowserSize:", v3, v4);
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", self->_contentContainerView, *MEMORY[0x1E0C9D538], v10);
  v12 = v9 + v11;
  v14 = v10 + v13;
  v16 = v6 - (v11 + v15);
  v18 = v8 - (v13 + v17);
  -[BrowserRootViewController _activeTabDocumentView](self, "_activeTabDocumentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[BrowserRootViewController updateWebViewSizeAttributes](self, "updateWebViewSizeAttributes");
  -[BrowserRootViewController layOutCatalogView](self, "layOutCatalogView");
  -[BrowserRootViewController _continuousReadingViewController](self, "_continuousReadingViewController");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateContinuousPreviewViewSizeAttributes");

}

- (id)_continuousReadingViewController
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "continuousReadingViewControllerForBrowserViewController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)layOutCatalogView
{
  id v3;

  -[CatalogViewController view](self->_catalogViewController, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BrowserRootViewController _frameForCatalogView](self, "_frameForCatalogView");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v3, "bounds");
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 27, v3);
  -[CatalogViewController setObscuredInsets:](self->_catalogViewController, "setObscuredInsets:");

}

- (CGRect)_frameForCatalogView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat Height;
  id WeakRetained;
  int v15;
  double Width;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  -[ViewWithCustomNextResponder frame](self->_contentContainerView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BrowserRootViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  Height = v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v15 = objc_msgSend(WeakRetained, "_shouldUseNarrowLayout");

  if (v15)
  {
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    Width = CGRectGetWidth(v24);
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    Height = CGRectGetHeight(v25);
    v17 = 0.0;
  }
  else
  {
    v18 = 0.0;
    if (-[CatalogViewController usesPopoverStyleForFavorites](self->_catalogViewController, "usesPopoverStyleForFavorites"))
    {
      -[BrowserRootViewController horizontalMarginForCatalogViewInPopover](self, "horizontalMarginForCatalogViewInPopover");
      v18 = v19;
    }
    v17 = v18 * 0.5;
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    Width = CGRectGetWidth(v26) - v18;
  }
  v20 = v17;
  v21 = 0.0;
  v22 = Width;
  v23 = Height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)_activeTabDocumentView
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_layOutTopBackdrop
{
  double Width;
  double v4;
  void *v5;
  double v6;
  _BOOL4 v7;
  SFThemeColorEffectView *statusBarBackdrop;
  SFThemeColorEffectView *v9;
  SFThemeColorEffectView *v10;
  SFThemeColorEffectView *v11;
  id WeakRetained;
  id v13;
  SFOrderedContainerView *v14;
  void *v15;
  SFOrderedContainerView *documentAndTopBarsContainerView;
  SFThemeColorEffectView *v17;
  SFOrderedContainerView *v18;
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
  id v29;
  CGRect v30;
  CGRect v31;

  -[BrowserRootViewController view](self, "view");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_topSeparator, "setHidden:", -[BrowserRootViewController isUsingBottomCapsule](self, "isUsingBottomCapsule"));
  objc_msgSend(v29, "bounds");
  Width = CGRectGetWidth(v30);
  v4 = 0.0;
  if (-[BrowserRootViewController _showsTopBackdrop](self, "_showsTopBackdrop"))
  {
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "obscuredInsets");
    v4 = v6;

  }
  -[SFThemeColorEffectView setFrame:](self->_topBackdrop, "setFrame:", 0.0, 0.0, Width, v4);
  v7 = -[BrowserRootViewController _interfaceFillsScreen](self, "_interfaceFillsScreen");
  statusBarBackdrop = self->_statusBarBackdrop;
  if (v7)
  {
    if (!statusBarBackdrop)
    {
      v9 = (SFThemeColorEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EE50]), "initWithEffect:", 0);
      v10 = self->_statusBarBackdrop;
      self->_statusBarBackdrop = v9;

      -[BrowserRootViewController _applyStatusBarBackdropTheme](self, "_applyStatusBarBackdropTheme");
    }
  }
  else if (statusBarBackdrop)
  {
    -[SFThemeColorEffectView removeFromSuperview](statusBarBackdrop, "removeFromSuperview");
    v11 = self->_statusBarBackdrop;
    self->_statusBarBackdrop = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  -[SFThemeColorEffectView setAlpha:](self->_statusBarBackdrop, "setAlpha:", (double)(objc_msgSend(WeakRetained, "isShowingFavorites") ^ 1));

  v13 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if (objc_msgSend(v13, "presentationState"))
  {
    v14 = self->_documentAndTopBarsContainerView;
  }
  else
  {
    -[BrowserRootViewController capsuleCollectionViewLayout](self, "capsuleCollectionViewLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    documentAndTopBarsContainerView = (SFOrderedContainerView *)v29;
    if (!v15)
      documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
    v14 = documentAndTopBarsContainerView;

  }
  v17 = self->_statusBarBackdrop;
  if (v17)
  {
    -[SFThemeColorEffectView superview](v17, "superview");
    v18 = (SFOrderedContainerView *)objc_claimAutoreleasedReturnValue();

    if (v18 != v14)
      -[SFOrderedContainerView addSubview:](v14, "addSubview:", self->_statusBarBackdrop);
  }
  -[SFOrderedContainerView bounds](v14, "bounds");
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 8, v14);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v29, "bounds");
  v27 = CGRectGetWidth(v31);
  objc_msgSend(v29, "safeAreaInsets");
  -[SFThemeColorEffectView setFrame:](self->_statusBarBackdrop, "setFrame:", v22 + 0.0, v20 + 0.0, v27 - (v22 + v26), v28 - (v20 + v24));

}

- (BOOL)isUsingBottomCapsule
{
  void *v2;
  void *v3;
  BOOL v4;

  -[BrowserRootViewController capsuleCollectionViewLayout](self, "capsuleCollectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue") == 1;
  else
    v4 = 0;

  return v4;
}

- (void)layOutTopBars
{
  void *v3;
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
  void *v14;
  double v15;
  double v16;
  NavigationBar *navigationBar;
  void *v18;
  double v19;
  double v20;
  double Height;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double MaxY;
  _BOOL8 v33;
  void *v34;
  double v35;
  double v36;
  double MinX;
  CGFloat v38;
  double v39;
  double Width;
  double v41;
  long double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  CGFloat v47;
  double v48;
  double v49;
  _BOOL8 showingTabBar;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  BookmarksBarView *bookmarksBar;
  BarContainerView *v56;
  BarContainerView *topAuxiliaryBarsContainerView;
  void *v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double MinY;
  void *v69;
  double v70;
  double __x;
  double v72;
  CGFloat v73;
  CGFloat rect;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  -[BrowserRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserRootViewController navigationBarFrameInCoordinateSpace:](self, "navigationBarFrameInCoordinateSpace:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[BrowserRootViewController navigationBarDesiredHeight](self, "navigationBarDesiredHeight");
  v13 = v12;
  -[BrowserRootViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaInsets");
  v16 = v15;

  navigationBar = self->_navigationBar;
  __x = v13;
  if (navigationBar)
  {
    -[_SFNavigationBar setMaximumHeight:](navigationBar, "setMaximumHeight:", v13);
    -[NavigationBar setFrame:](self->_navigationBar, "setFrame:", v5, v7, v9, v11);
    -[_SFNavigationBar setContentUnderStatusBarHeight:](self->_navigationBar, "setContentUnderStatusBarHeight:", v16);
    if (self->_scrollToTopView)
    {
      -[BrowserRootViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BrowserRootViewController navigationBarFrameInCoordinateSpace:](self, "navigationBarFrameInCoordinateSpace:", v18);
      -[NavigationBar setHidden:](self->_navigationBar, "setHidden:", CGRectGetMaxY(v75) <= 0.0);

    }
    else
    {
      -[NavigationBar setHidden:](self->_navigationBar, "setHidden:", 0);
    }
    -[_SFNavigationBar defaultHeight](self->_navigationBar, "defaultHeight");
    v19 = v20;
  }
  else
  {
    v19 = 0.0;
  }
  rect = v9;
  if (self->_unifiedBar)
  {
    if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
    {
      Height = v11;
      v22 = v7;
    }
    else
    {
      -[BrowserRootViewController _frameForNavigationBar](self, "_frameForNavigationBar");
      v24 = v23;
      v26 = v25;
      v27 = v5;
      v29 = v28;
      v72 = v16;
      v31 = v30;
      v76.origin.x = v27;
      v76.origin.y = v7;
      v76.size.width = rect;
      v76.size.height = v11;
      MaxY = CGRectGetMaxY(v76);
      v77.origin.x = v24;
      v77.origin.y = v26;
      v77.size.width = v29;
      v77.size.height = v31;
      v22 = MaxY - CGRectGetHeight(v77);
      v78.origin.x = v24;
      v78.origin.y = v26;
      v78.size.width = v29;
      v5 = v27;
      v78.size.height = v31;
      v16 = v72;
      v9 = rect;
      Height = CGRectGetHeight(v78);
    }
    -[UnifiedBar setFrame:](self->_unifiedBar, "setFrame:", v5, v22, v9, Height);
    -[SFUnifiedBar setContentUnderStatusBarHeight:](self->_unifiedBar, "setContentUnderStatusBarHeight:", v16);
    v33 = -[BrowserRootViewController _shouldHideUnifiedBar](self, "_shouldHideUnifiedBar");
    if (v33 || !self->_scrollToTopView)
    {
      -[UnifiedBar setHidden:](self->_unifiedBar, "setHidden:", v33);
    }
    else
    {
      -[BrowserRootViewController view](self, "view", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[BrowserRootViewController navigationBarFrameInCoordinateSpace:](self, "navigationBarFrameInCoordinateSpace:", v34);
      -[UnifiedBar setHidden:](self->_unifiedBar, "setHidden:", CGRectGetMaxY(v79) <= 0.0);

    }
    -[BrowserRootViewController _topAuxiliaryBarsHeight](self, "_topAuxiliaryBarsHeight");
    -[SFUnifiedBar setExtendedBottomHeight:](self->_unifiedBar, "setExtendedBottomHeight:");
    -[SFUnifiedBar expandedHeight](self->_unifiedBar, "expandedHeight");
    v19 = v35;
  }
  v80.origin.x = v5;
  v80.origin.y = v7;
  v80.size.width = v9;
  v80.size.height = v11;
  v36 = fmax(CGRectGetHeight(v80) - v19, 0.0);
  v81.origin.x = v5;
  v81.origin.y = v7;
  v81.size.width = v9;
  v81.size.height = v11;
  MinX = CGRectGetMinX(v81);
  v82.origin.x = v5;
  v82.origin.y = v7;
  v82.size.width = v9;
  v82.size.height = v11;
  v38 = v5;
  v39 = CGRectGetMaxY(v82) - v36;
  v83.origin.x = v38;
  v83.origin.y = v7;
  v83.size.width = v9;
  v83.size.height = v11;
  Width = CGRectGetWidth(v83);
  -[BarContainerView setFrame:](self->_topAuxiliaryBarsContainerView, "setFrame:", MinX, v39, Width, v36);
  v73 = v38;
  v84.origin.x = v38;
  v84.origin.y = v7;
  v84.size.width = v9;
  v84.size.height = v11;
  -[BarContainerView setClipsToBounds:](self->_topAuxiliaryBarsContainerView, "setClipsToBounds:", CGRectGetHeight(v84) < __x);
  -[_SFNavigationBar _controlsAlpha](self->_navigationBar, "_controlsAlpha");
  v42 = v41;
  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
  {
    -[SFUnifiedBar squishTransformFactor](self->_unifiedBar, "squishTransformFactor");
    SFBarContentAlphaForSquishTransformFactor();
    v42 = v43;
  }
  if (self->_tabBar)
  {
    v70 = v11;
    if (self->_showingTabBar)
    {
      +[TabBar defaultHeight](TabBar, "defaultHeight");
      v45 = v44;
    }
    else
    {
      v45 = 0.0;
    }
    v85.origin.x = MinX;
    v85.origin.y = v39;
    v85.size.width = Width;
    v85.size.height = v36;
    -[UIView setFrame:](self->_tabBarClipperView, "setFrame:", *MEMORY[0x1E0C9D648], CGRectGetHeight(v85) - (v45 + 3.0), Width, v45 + 3.0);
    -[TabBar superview](self->_tabBar, "superview");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bounds");
    v47 = CGRectGetMaxY(v86) - v45;
    v87.origin.x = MinX;
    v87.origin.y = v39;
    v87.size.width = Width;
    v87.size.height = v36;
    v48 = CGRectGetWidth(v87);
    +[TabBar defaultHeight](TabBar, "defaultHeight");
    -[TabBar setFrame:](self->_tabBar, "setFrame:", 0.0, v47, v48, v49);

    -[TabBar setAlpha:](self->_tabBar, "setAlpha:", (double)v42);
    v11 = v70;
  }
  -[BrowserRootViewController _layOutTopBanners](self, "_layOutTopBanners");
  if (self->_tabBar)
    showingTabBar = self->_showingTabBar;
  else
    showingTabBar = 1;
  -[TabBarDropExpansionView setHidden:](self->_tabBarDropExpansionView, "setHidden:", showingTabBar);
  v88.origin.x = MinX;
  v88.origin.y = v39;
  v88.size.width = Width;
  v88.size.height = v36;
  v51 = CGRectGetMaxY(v88);
  v89.origin.x = v73;
  v89.origin.y = v7;
  v89.size.width = rect;
  v52 = v11;
  v89.size.height = v11;
  v53 = CGRectGetWidth(v89);
  +[TabBar defaultHeight](TabBar, "defaultHeight");
  -[TabBarDropExpansionView setFrame:](self->_tabBarDropExpansionView, "setFrame:", 0.0, v51, v53, v54);
  bookmarksBar = self->_bookmarksBar;
  if (bookmarksBar)
  {
    -[BookmarksBarView superview](bookmarksBar, "superview");
    v56 = (BarContainerView *)objc_claimAutoreleasedReturnValue();
    topAuxiliaryBarsContainerView = self->_topAuxiliaryBarsContainerView;

    if (v56 == topAuxiliaryBarsContainerView)
    {
      if (self->_tabBar && self->_showingTabBar)
      {
        -[BookmarksBarView superview](self->_bookmarksBar, "superview");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabBar bounds](self->_tabBar, "bounds");
        objc_msgSend(v58, "convertRect:fromView:", self->_tabBar);
        v60 = v59;
        v62 = v61;
        v63 = v7;
        v65 = v64;
        v67 = v66;

        v90.origin.x = v60;
        v90.origin.y = v62;
        v90.size.width = v65;
        v7 = v63;
        v90.size.height = v67;
        MinY = CGRectGetMinY(v90);
      }
      else
      {
        -[BookmarksBarView superview](self->_bookmarksBar, "superview");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "bounds");
        MinY = CGRectGetMaxY(v91);

      }
      v92.origin.x = v73;
      v92.origin.y = v7;
      v92.size.width = rect;
      v92.size.height = v52;
      -[BookmarksBarView setFrame:](self->_bookmarksBar, "setFrame:", 0.0, MinY + -23.0 + -3.0, CGRectGetWidth(v92), 23.0);
      -[BookmarksBarView setAlpha:](self->_bookmarksBar, "setAlpha:", (double)pow(v42, 5.0));
    }
  }
}

- (double)navigationBarDesiredHeight
{
  UnifiedBar *unifiedBar;
  double v4;
  double v5;
  double v6;

  unifiedBar = self->_unifiedBar;
  if (unifiedBar)
    -[SFUnifiedBar expandedHeight](unifiedBar, "expandedHeight");
  else
    -[_SFNavigationBar defaultHeight](self->_navigationBar, "defaultHeight");
  v5 = v4;
  -[BrowserRootViewController _topAuxiliaryBarsHeight](self, "_topAuxiliaryBarsHeight");
  return v5 + v6;
}

- (double)_topAuxiliaryBarsHeight
{
  BookmarksBarView *bookmarksBar;
  BarContainerView *v4;
  BOOL v5;
  double v6;
  double v7;

  bookmarksBar = self->_bookmarksBar;
  if (bookmarksBar)
  {
    -[BookmarksBarView superview](bookmarksBar, "superview");
    v4 = (BarContainerView *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == self->_topAuxiliaryBarsContainerView;

    if (v5)
      v6 = 23.0;
    else
      v6 = 0.0;
  }
  else
  {
    v6 = 0.0;
  }
  if (self->_showingTabBar && self->_tabBar)
  {
    +[TabBar defaultHeight](TabBar, "defaultHeight");
    return v6 + v7;
  }
  return v6;
}

- (void)_updateTopBarStylesAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[5];

  if (self->_updatingTopBarStyles)
    return;
  v3 = a3;
  self->_updatingTopBarStyles = 1;
  v5 = objc_alloc_init(MEMORY[0x1E0D89D00]);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __57__BrowserRootViewController__updateTopBarStylesAnimated___block_invoke;
  v59[3] = &unk_1E9CF1900;
  v59[4] = self;
  objc_msgSend(v5, "setHandler:", v59);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeTabDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateThemeColorAndUnderPageBackground:", -[BrowserRootViewController _navigationBarIsExpandedOnTop](self, "_navigationBarIsExpandedOnTop") ^ 1);

  objc_msgSend(MEMORY[0x1E0D4EF20], "themeWithBarTintStyle:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFNavigationBar setTheme:](self->_navigationBar, "setTheme:", v9);
  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTheme:", v9);
  if (self->_topBackdropUsesPlainTheme && objc_msgSend(v10, "layoutStyle") == 2)
    v11 = 0;
  else
    v11 = objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari") ^ 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForKey:", *MEMORY[0x1E0D4F118]);

  v58 = 0;
  v55 = v3;
  if (!v13 && v11)
  {
    if (objc_msgSend(v10, "layoutStyle") == 2)
    {
      objc_msgSend(WeakRetained, "tabController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "activeTabDocument");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "themeColor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[_SFWebView underPageBackgroundColor](self->_webView, "underPageBackgroundColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFWebView setUnderPageBackgroundColor:](self->_webView, "setUnderPageBackgroundColor:", 0);
      -[_SFWebView underPageBackgroundColor](self->_webView, "underPageBackgroundColor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if ((WBSIsEqual() & 1) == 0)
        -[_SFWebView setUnderPageBackgroundColor:](self->_webView, "setUnderPageBackgroundColor:", v14);
    }

  }
  objc_msgSend(MEMORY[0x1E0D4EEB8], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"), v58, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Safari.BackgroundColorBackdrop.%p"), self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackdropGroupName:", v17);

  v56 = v16;
  objc_msgSend(v10, "setMinimizedTheme:", v16);
  v57 = v9;
  if (-[BrowserRootViewController _showsTopBackdrop](self, "_showsTopBackdrop"))
  {
    if (-[BrowserRootViewController _shouldShowThemeColorInTopBar](self, "_shouldShowThemeColorInTopBar")
      && !self->_topBackdropUsesPlainTheme)
    {
      objc_msgSend(WeakRetained, "tabController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "activeTabDocument");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "themeColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D4EEB8], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"), v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_topBackdropUsesPlainTheme)
    {
      -[BrowserRootViewController _plainTopBackdropGroupName](self, "_plainTopBackdropGroupName");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = WBSIsEqual();
      v23 = CFSTR("Theme");
      if (v22)
        v23 = CFSTR("Background");
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Safari.Top%@ColorBackdrop.%p"), v23, self);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v20;
    objc_msgSend(v19, "setBackdropGroupName:", v20);

    if (-[BrowserRootViewController _navigationBarIsExpandedOnTop](self, "_navigationBarIsExpandedOnTop"))
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setOverrideBackdropEffect:", v25);

    }
    v26 = objc_msgSend(v19, "userInterfaceStyle");
    if (v26 != -[SFUnifiedBarTheme userInterfaceStyle](self->_topBackdropTheme, "userInterfaceStyle"))
      -[BrowserRootViewController setNeedsPreferredStatusBarUpdateAfterCommitAnimated:](self, "setNeedsPreferredStatusBarUpdateAfterCommitAnimated:", v3);
    -[BrowserRootViewController _setTopBackdropTheme:animated:](self, "_setTopBackdropTheme:animated:", v19, v3);
    objc_msgSend(v10, "obscuredInsets");
    v28 = v27;
    -[SFThemeColorEffectView frame](self->_topBackdrop, "frame");
    if (v28 != v29)
      -[BrowserRootViewController _layOutTopBackdrop](self, "_layOutTopBackdrop");

    v9 = v57;
  }
  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
  {
    v30 = -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle");
    if (-[BrowserRootViewController _shouldShowThemeColorInTopBar](self, "_shouldShowThemeColorInTopBar"))
    {
      objc_msgSend(WeakRetained, "tabController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "activeTabDocument");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "themeColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v33 = 0;
    }
    v34 = objc_msgSend(WeakRetained, "overrideBarTintStyleForUnifiedBar");
    v54 = WeakRetained;
    if (v34)
    {
      v35 = v34;
      if ((_SFIsDarkTintStyle() & 1) != 0)
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x1E0DC3510];
      if (_SFIsDarkTintStyle())
        v39 = 17;
      else
        v39 = 12;
      objc_msgSend(v38, "effectWithStyle:", v39);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D8AD30], "shouldIgnoreThemeColorForContrastWithActiveTab:privateBrowsingEnabled:", v33, _SFIsPrivateTintStyle()))
      {

        if (_SFIsPrivateTintStyle())
        {
          v35 = _SFDarkTintStyleForStyle();
          v33 = 0;
          v36 = 0;
          v37 = 0;
          goto LABEL_47;
        }
        v33 = 0;
      }
      v36 = 0;
      v37 = 0;
      v35 = v30;
    }
LABEL_47:
    objc_msgSend(MEMORY[0x1E0D4EEB8], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", v35, v33, v36);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_SFIsDarkTintStyle() & 1) != 0 || -[TabBarManager displayMode](self->_tabBarManager, "displayMode") != 2)
    {
      objc_msgSend(v42, "setAppliesDarkeningOverlay:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setAppliesDarkeningOverlay:", objc_msgSend(v43, "showRectangularTabsInSeparateBar") ^ 1);

    }
    _SFBackdropGroupNameForOwner();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setBackdropGroupName:", v44);

    objc_msgSend(v42, "setOverrideBackdropEffect:", v37);
    v45 = objc_msgSend(v42, "userInterfaceStyle");
    -[SFUnifiedBar barTheme](self->_unifiedBar, "barTheme");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "userInterfaceStyle");

    if (v45 != v47)
      -[BrowserRootViewController setNeedsPreferredStatusBarUpdateAfterCommitAnimated:](self, "setNeedsPreferredStatusBarUpdateAfterCommitAnimated:", v55);
    -[SFUnifiedBar setBarTheme:animated:](self->_unifiedBar, "setBarTheme:animated:", v42, v55);
    -[BrowserRootViewController _applyStatusBarBackdropTheme](self, "_applyStatusBarBackdropTheme");

    WeakRetained = v54;
    v9 = v57;
  }
  -[BrowserRootViewController _updateBannerTheme](self, "_updateBannerTheme");
  if (self->_tabBar)
    -[TabBar setTintStyle:](self->_tabBar, "setTintStyle:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"));
  if (self->_bookmarksBar)
  {
    -[_SFNavigationBar effectiveTheme](self->_navigationBar, "effectiveTheme");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "textColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
    {
      -[SFUnifiedBar barTheme](self->_unifiedBar, "barTheme");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "titleTheme");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "primaryTextColor");
      v52 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "themeColor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[BookmarksBarView setThemeColor:](self->_bookmarksBar, "setThemeColor:", v53);

      v49 = (void *)v52;
    }
    -[BookmarksBarView setTintColor:](self->_bookmarksBar, "setTintColor:", v49);

  }
  -[BrowserRootViewController _updateRefreshControlStyle](self, "_updateRefreshControlStyle");

}

- (BOOL)_showsTopBackdrop
{
  void *v2;
  BOOL v3;

  -[BrowserRootViewController capsuleCollectionViewLayout](self, "capsuleCollectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_navigationBarIsExpandedOnTop
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = v2 && objc_msgSend(v2, "layoutStyle") == 2 && objc_msgSend(v3, "selectedItemState") != 1;

  return v4;
}

- (void)_updateBannerTheme
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *bannerTheme;
  SFBannerTheme *v8;
  SFBannerTheme *v9;
  SFBannerTheme *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (!-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar")
    && !-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
  {
    objc_msgSend(MEMORY[0x1E0D4EBC8], "themeWithBarTintStyle:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"));
    v10 = (SFBannerTheme *)objc_claimAutoreleasedReturnValue();
    bannerTheme = self->_bannerTheme;
    self->_bannerTheme = v10;
LABEL_9:

    goto LABEL_10;
  }
  v4 = -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle");
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTabDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "themeColor");
  bannerTheme = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar")
    && objc_msgSend(MEMORY[0x1E0D8AD30], "shouldIgnoreThemeColorForContrastWithActiveTab:privateBrowsingEnabled:", bannerTheme, _SFIsPrivateTintStyle()))
  {

    bannerTheme = 0;
  }
  objc_msgSend(MEMORY[0x1E0D4EBC8], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", v4, bannerTheme, 0);
  v8 = (SFBannerTheme *)objc_claimAutoreleasedReturnValue();
  v9 = self->_bannerTheme;
  self->_bannerTheme = v8;

  if (bannerTheme)
    goto LABEL_9;
LABEL_10:
  _SFBackdropGroupNameForOwner();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBannerTheme setBackdropGroupName:](self->_bannerTheme, "setBackdropGroupName:", v11);

  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
  {
    -[SFUnifiedBar barTheme](self->_unifiedBar, "barTheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBannerTheme setAppliesDarkeningOverlay:](self->_bannerTheme, "setAppliesDarkeningOverlay:", objc_msgSend(v12, "appliesDarkeningOverlay"));
    objc_msgSend(v12, "overrideBackdropEffect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBannerTheme setOverrideBackdropEffect:](self->_bannerTheme, "setOverrideBackdropEffect:", v13);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[BrowserRootViewController managedTopBanners](self, "managedTopBanners", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        -[BrowserRootViewController _updateThemeForBanner:animated:](self, "_updateThemeForBanner:animated:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), 1);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

  v19 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "browserViewController:didUpdateBannerTheme:", self, self->_bannerTheme);

}

- (BOOL)insetsContentContainerFromStatusBar
{
  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
    return 0;
  else
    return !-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar");
}

- (BOOL)usingUnifiedBar
{
  return self->_toolbarPlacement == 0;
}

- (SFScrollIndicatorInsets)scrollIndicatorInsetsForTabDocumentView:(SEL)a3
{
  double v6;
  double v7;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  SFScrollIndicatorInsets *result;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;

  -[_SFWebView bounds](self->_webView, "bounds", a4);
  -[BrowserRootViewController obscuredInsetsForRect:inCoordinateSpace:](self, "obscuredInsetsForRect:inCoordinateSpace:", self->_webView);
  v7 = v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserViewController:adjustedTopObscuredInsetForBanners:", self, v7);

  -[BrowserRootViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserRootViewController keyboardInsetInCoordinateSpace:](self, "keyboardInsetInCoordinateSpace:", v9);

  -[BrowserRootViewController _baseInsetsForVerticalScrollIndicator](self, "_baseInsetsForVerticalScrollIndicator");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[BrowserRootViewController _baseInsetsForHorizontalScrollIndicator](self, "_baseInsetsForHorizontalScrollIndicator");
  v19 = v18;
  v21 = v20;
  v58 = v22;
  v24 = v23;
  if (objc_msgSend(MEMORY[0x1E0DC3C28], "_sf_baseVerticalScrollIndicatorInsetsExtendFullHeight:", v11, v13, v15, v17)&& objc_msgSend(MEMORY[0x1E0DC3C28], "_sf_baseHorizontalScrollIndicatorInsetsExtendFullWidth:", v19, v21, v58, v24))
  {
    -[BrowserRootViewController _webViewSafeAreaInsets](self, "_webViewSafeAreaInsets");
    result = (SFScrollIndicatorInsets *)UIEdgeInsetsMax();
    retstr->var0.top = v26;
    retstr->var0.left = v27;
    retstr->var0.bottom = v28;
    retstr->var0.right = v29;
    retstr->var1.top = v26;
    retstr->var1.left = v27;
    retstr->var1.bottom = v28;
    retstr->var1.right = v29;
  }
  else
  {
    UIEdgeInsetsMax();
    v31 = v30;
    v33 = v32;
    v57 = v34;
    v36 = v35;
    -[BrowserRootViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bounds");
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    -[BrowserRootViewController view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 2, v46, v39, v41, v43, v45);
    v48 = v47;

    v49 = fmax(v48, v58);
    -[BrowserRootViewController view](self, "view");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "safeAreaInsets");
    v52 = v51;

    if (v49 >= v52)
      UIEdgeInsetsReplace();
    result = (SFScrollIndicatorInsets *)UIEdgeInsetsMax();
    retstr->var0.top = v53;
    retstr->var0.left = v54;
    retstr->var0.bottom = v55;
    retstr->var0.right = v56;
    retstr->var1.top = v31;
    retstr->var1.left = v33;
    retstr->var1.bottom = v57;
    retstr->var1.right = v36;
  }
  return result;
}

- (UIEdgeInsets)obscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 27, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)_layOutTopBanners
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[14];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[3];
  CGFloat MaxY;
  _QWORD v32[3];
  double v33;
  _QWORD v34[10];
  CGRect v35;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserViewControllerAdditionalContentHeightForBanners:", self);
  v5 = v4;

  -[UIScrollView bounds](self->_scrollView, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v14, "bannerController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "indexOfFirstBannerSeparableFromStatusBar");

  -[BrowserRootViewController managedTopBanners](self, "managedTopBanners");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __46__BrowserRootViewController__layOutTopBanners__block_invoke;
  v34[3] = &unk_1E9CF4928;
  v34[4] = self;
  v34[5] = v16;
  v34[6] = v7;
  v34[7] = v9;
  v34[8] = v11;
  v34[9] = v13;
  objc_msgSend(v17, "enumerateObjectsWithOptions:usingBlock:", 2, v34);

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0.0;
  -[BrowserRootViewController _totalAdditionalContentHeightForBanners](self, "_totalAdditionalContentHeightForBanners");
  v33 = -v19;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  MaxY = 0.0;
  -[BrowserRootViewController navigationBarFrameInCoordinateSpace:](self, "navigationBarFrameInCoordinateSpace:", self->_scrollView);
  MaxY = CGRectGetMaxY(v35);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  -[BrowserRootViewController managedTopBanners](self, "managedTopBanners");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __46__BrowserRootViewController__layOutTopBanners__block_invoke_121;
  v23[3] = &unk_1E9CF4950;
  v23[8] = v7;
  v23[9] = v9;
  v23[10] = v11;
  v23[11] = v13;
  v23[12] = v16;
  v23[4] = self;
  v23[5] = v32;
  v23[13] = v5;
  v23[6] = v30;
  v23[7] = &v24;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v23);

  v21 = (void *)v25[5];
  if (v21)
    v22 = objc_msgSend(v21, "shouldUsePlainTheme");
  else
    v22 = 0;
  -[BrowserRootViewController _setTopBackdropUsesPlainTheme:](self, "_setTopBackdropUsesPlainTheme:", v22);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

- (id)managedTopBanners
{
  id WeakRetained;
  void *v4;
  BrowserRootViewController *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "bannerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (BrowserRootViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    objc_msgSend(WeakRetained, "bannerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topBanners");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (double)_totalAdditionalContentHeightForBanners
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  id WeakRetained;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGRect v19;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BrowserRootViewController managedTopBanners](self, "managedTopBanners", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "bounds");
        v7 = v7 + CGRectGetHeight(v19);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserViewControllerAdditionalContentHeightForBanners:", self);
  v11 = v10;

  return v7 + v11;
}

- (void)_setTopBackdropUsesPlainTheme:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  if (self->_topBackdropUsesPlainTheme != a3)
  {
    self->_topBackdropUsesPlainTheme = a3;
    -[SFThemeColorEffectView snapshotViewAfterScreenUpdates:](self->_topBackdrop, "snapshotViewAfterScreenUpdates:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFThemeColorEffectView addSubview:](self->_topBackdrop, "addSubview:", v4);
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__BrowserRootViewController__setTopBackdropUsesPlainTheme___block_invoke;
    v13[3] = &unk_1E9CF1900;
    v14 = v4;
    v8 = v6;
    v9 = 3221225472;
    v10 = __59__BrowserRootViewController__setTopBackdropUsesPlainTheme___block_invoke_2;
    v11 = &unk_1E9CF16A0;
    v12 = v14;
    v7 = v14;
    objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 50331648, v13, &v8, 0.2, 0.0);
    -[BrowserRootViewController _updateTopBarStylesAnimated:](self, "_updateTopBarStylesAnimated:", 0, v8, v9, v10, v11);

  }
}

- (void)updateWebViewSizeAttributes
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double MinY;
  double MinX;
  double MaxY;
  double MaxX;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  double bottom;
  void *v46;
  void *v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat recta;
  id rect;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  if (-[_SFWebView _isInFullscreen](self->_webView, "_isInFullscreen"))
  {
    -[_SFWebView setHitTestInsets:](self->_webView, "setHitTestInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  }
  else
  {
    -[BrowserRootViewController contentFrameInPageView](self, "contentFrameInPageView");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[BrowserRootViewController contentContainerView](self, "contentContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    -[BrowserRootViewController contentContainerViewFrameForBrowserSize:](self, "contentContainerViewFrameForBrowserSize:", v12, v13);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView, v15, v17, v19, v21);
    v49 = v4;
    recta = v15 + v22;
    v48 = v17 + v23;
    v25 = v19 - (v22 + v24);
    v27 = v21 - (v23 + v26);
    v52.origin.x = v4;
    v52.origin.y = v6;
    v52.size.width = v8;
    v52.size.height = v10;
    MinY = CGRectGetMinY(v52);
    v53.origin.x = recta;
    v53.origin.y = v48;
    v53.size.width = v25;
    v53.size.height = v27;
    self->_contentInsetForContentFrame.top = MinY - CGRectGetMinY(v53);
    v54.origin.x = v4;
    v54.origin.y = v6;
    v54.size.width = v8;
    v54.size.height = v10;
    MinX = CGRectGetMinX(v54);
    v55.origin.x = recta;
    v55.origin.y = v48;
    v55.size.width = v25;
    v55.size.height = v27;
    self->_contentInsetForContentFrame.left = MinX - CGRectGetMinX(v55);
    v56.origin.x = recta;
    v56.origin.y = v48;
    v56.size.width = v25;
    v56.size.height = v27;
    MaxY = CGRectGetMaxY(v56);
    v57.origin.x = v49;
    v57.origin.y = v6;
    v57.size.width = v8;
    v57.size.height = v10;
    self->_contentInsetForContentFrame.bottom = MaxY - CGRectGetMaxY(v57);
    v58.origin.x = recta;
    v58.origin.y = v48;
    v58.size.width = v25;
    v58.size.height = v27;
    MaxX = CGRectGetMaxX(v58);
    v59.origin.x = v49;
    v59.origin.y = v6;
    v59.size.width = v8;
    v59.size.height = v10;
    self->_contentInsetForContentFrame.right = MaxX - CGRectGetMaxX(v59);
    -[BrowserRootViewController _totalAdditionalContentHeightForBanners](self, "_totalAdditionalContentHeightForBanners");
    self->_contentInsetForContentFrame.top = v32 + self->_contentInsetForContentFrame.top;
    _SFRoundEdgeInsetsToPixels();
    self->_contentInsetForContentFrame.top = v33;
    self->_contentInsetForContentFrame.left = v34;
    self->_contentInsetForContentFrame.bottom = v35;
    self->_contentInsetForContentFrame.right = v36;
    -[BrowserRootViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "_sf_isFullScreenWidth");

    rect = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(rect, "tabController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activeTabDocument");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = objc_msgSend(rect, "isShowingInOneThirdMode");
    objc_msgSend(v40, "reloadOptionsController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTryUsingMobileIfPossible:", v41);

    -[BrowserRootViewController _updateBottomBarHeightAboveKeyboard](self, "_updateBottomBarHeightAboveKeyboard");
    -[_SFWebView _setAllowsViewportShrinkToFit:](self->_webView, "_setAllowsViewportShrinkToFit:", v38 ^ 1u);
    -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
    -[BrowserRootViewController minimumObscuredInsetsForRect:inCoordinateSpace:](self, "minimumObscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView);
    v44 = v43;
    bottom = 0.0;
    if (v44 <= 0.0)
      bottom = self->_contentInsetForContentFrame.bottom;
    -[_SFWebView setHitTestInsets:](self->_webView, "setHitTestInsets:", 0.0, 0.0, bottom, 0.0);
    objc_msgSend(rect, "scene");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebView _setInterfaceOrientationOverride:](self->_webView, "_setInterfaceOrientationOverride:", objc_msgSend(v46, "interfaceOrientation"));

    objc_msgSend(v40, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setWebViewGeometryNeedsUpdate");

  }
}

- (ViewWithCustomNextResponder)contentContainerView
{
  -[BrowserRootViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_contentContainerView;
}

- (CGRect)contentContainerViewFrameForBrowserSize:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.height;
  width = a3.width;
  if (-[BrowserRootViewController insetsContentContainerFromStatusBar](self, "insetsContentContainerFromStatusBar"))
  {
    -[BrowserRootViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeAreaInsets");
    v8 = v7;

    v9 = -v8;
    height = height + v8;
  }
  else
  {
    v9 = 0.0;
  }
  v10 = 0.0;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (id)childViewControllerForStatusBarStyle
{
  void *v3;
  char v4;
  id WeakRetained;
  uint64_t v6;
  CatalogViewController *catalogViewController;
  CatalogViewController *v8;
  id v10;
  void *v11;
  void *v12;
  CatalogViewController *v13;

  if ((_SFDeviceIsPad() & 1) != 0)
    goto LABEL_7;
  -[BrowserRootViewController capsuleCollectionViewLayout](self, "capsuleCollectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = WBSIsEqual();

  if ((v4 & 1) != 0)
    goto LABEL_7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  v6 = objc_msgSend(WeakRetained, "presentationState");

  if (v6 != 3)
  {
    if (!v6)
    {
      if (self->_willDismissCatalogViewController)
        catalogViewController = 0;
      else
        catalogViewController = self->_catalogViewController;
      v8 = catalogViewController;
      return v8;
    }
LABEL_7:
    v8 = 0;
    return v8;
  }
  v10 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v10, "tabController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeTabDocument");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isShowingSystemStartPage"))
    v13 = self->_catalogViewController;
  else
    v13 = 0;
  v8 = v13;

  return v8;
}

- (NSNumber)capsuleCollectionViewLayout
{
  void *v2;
  void *v3;
  void *v4;

  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "layoutStyle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (UIEdgeInsets)minimumObscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  UIEdgeInsets result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[BrowserRootViewController _loweredBarMinimumObscuredInsets](self, "_loweredBarMinimumObscuredInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v49 = x;
  if (!-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar") || v15 == 0.0)
  {
    v31 = 0.0;
    if (!-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
    {
      -[SFOrderedContainerView safeAreaInsets](self->_documentAndTopBarsContainerView, "safeAreaInsets");
      v31 = v32;
    }
    -[BrowserRootViewController navigationBarSquishedHeight](self, "navigationBarSquishedHeight");
    -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v9, 0.0, v31 + v33);
  }
  else
  {
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v9, v13 + v19, v11 + v20, v21 - (v13 + v17), v22 - (v11 + v15));
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v48 = v11;
    v30 = v29;
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    CGRectGetMaxY(v50);
    v51.origin.x = v24;
    v51.origin.y = v26;
    v51.size.width = v28;
    v51.size.height = v30;
    CGRectGetMaxY(v51);
    -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v9, 0.0, v48);

  }
  if (-[BrowserRootViewController _interfaceFillsScreen](self, "_interfaceFillsScreen"))
  {
    -[BrowserRootViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "safeAreaInsets");
    -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v9, 0.0, v35);

  }
  v52.origin.x = v49;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  CGRectGetMinY(v52);
  -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", v9, v49, y, width, height);
  UIEdgeInsetsAdd();
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  v44 = v37;
  v45 = v39;
  v46 = v41;
  v47 = v43;
  result.right = v47;
  result.bottom = v46;
  result.left = v45;
  result.top = v44;
  return result;
}

- (UIEdgeInsets)maximumObscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4 ignoreBarsMinimized:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MaxY;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  UIEdgeInsets result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  if (-[BrowserRootViewController isInteractivelyMinimizingBars](self, "isInteractivelyMinimizingBars"))
  {
    -[BrowserRootViewController obscuredInsetsForRect:inCoordinateSpace:](self, "obscuredInsetsForRect:inCoordinateSpace:", v11, x, y, width, height);
LABEL_6:
    v16 = v12;
    v17 = v13;
    v18 = v14;
    v19 = v15;
    goto LABEL_16;
  }
  if (!a5 && self->_keepBarsMinimized)
  {
    -[BrowserRootViewController minimumObscuredInsetsForRect:inCoordinateSpace:](self, "minimumObscuredInsetsForRect:inCoordinateSpace:", v11, x, y, width, height);
    goto LABEL_6;
  }
  if (self->_toolbarPlacement == 1)
  {
    -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
    if (!CGRectIsEmpty(v40))
    {
      -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
      MaxY = CGRectGetMaxY(v41);
      -[BrowserRootViewController maximumHeightObscuredByBottomToolbar](self, "maximumHeightObscuredByBottomToolbar");
      -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v11, 0.0, MaxY - v21);
      v23 = v22;
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = height;
      fmax(CGRectGetMaxY(v42) - v23, 0.0);
    }
  }
  if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
  {
    -[BrowserRootViewController _loweredBarMaximumObscuredInsets](self, "_loweredBarMaximumObscuredInsets");
    v25 = v24;
  }
  else
  {
    -[BrowserRootViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safeAreaInsets");
    v28 = v27;
    -[BrowserRootViewController navigationBarDesiredHeight](self, "navigationBarDesiredHeight");
    v25 = v28 + v29;

  }
  -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v11, 0.0, v25);
  if (-[BrowserRootViewController _interfaceFillsScreen](self, "_interfaceFillsScreen"))
  {
    -[BrowserRootViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "safeAreaInsets");
    -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v11, 0.0, v31);

  }
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  CGRectGetMinY(v43);
  -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", v11, x, y, width, height);
  UIEdgeInsetsAdd();
  v16 = v32;
  v17 = v33;
  v19 = v34;
  v18 = fmax(v35, 0.0);
LABEL_16:

  v36 = v16;
  v37 = v17;
  v38 = v18;
  v39 = v19;
  result.right = v39;
  result.bottom = v38;
  result.left = v37;
  result.top = v36;
  return result;
}

- (UIEdgeInsets)obscuredInsetsWithComponents:(unint64_t)a3 forRect:(CGRect)a4 inCoordinateSpace:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char v9;
  id v11;
  double MaxY;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat recta;
  CGFloat rect;
  CGFloat v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  UIEdgeInsets result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v11 = a5;
  if ((v9 & 1) != 0)
  {
    -[BrowserRootViewController navigationBarFrameInCoordinateSpace:](self, "navigationBarFrameInCoordinateSpace:", v11);
    MaxY = CGRectGetMaxY(v55);
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    fmax(MaxY - CGRectGetMinY(v56), 0.0);
    if (-[BrowserRootViewController _interfaceFillsScreen](self, "_interfaceFillsScreen"))
    {
      -[BrowserRootViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safeAreaInsets");
      -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v11, 0.0, v14);

    }
  }
  if ((v9 & 2) != 0 && self->_toolbarPlacement == 1)
  {
    -[BrowserRootViewController bottomToolbarFrameInCoordinateSpace:includeKeyboard:](self, "bottomToolbarFrameInCoordinateSpace:includeKeyboard:", v11, 0);
    v15 = height;
    v17 = v16;
    recta = v19;
    v54 = v18;
    v21 = v20;
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = v15;
    CGRectGetMaxY(v57);
    v58.origin.x = v17;
    height = v15;
    v58.size.width = recta;
    v58.origin.y = v54;
    v58.size.height = v21;
    CGRectGetMinY(v58);
  }
  if (self->_showingSidebar && ((v9 & 4) != 0 || (v9 & 0xC) == 8 && !self->_sidebarStyle))
  {
    v22 = width;
    v23 = x;
    rect = height;
    -[BrowserRootViewController _viewForConvertingToCoordinateSpace:](self, "_viewForConvertingToCoordinateSpace:", v11, *(_QWORD *)&v22, *(_QWORD *)&y);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[BrowserRootViewController _frameForSidebarWhenShowing:](self, "_frameForSidebarWhenShowing:", self->_showingSidebar);
    objc_msgSend(v24, "convertRect:toCoordinateSpace:", v11);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    -[BrowserRootViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = objc_msgSend(v33, "_sf_usesLeftToRightLayout");

    if ((_DWORD)v24)
    {
      v59.origin.x = v26;
      v59.origin.y = v28;
      v59.size.width = v30;
      v59.size.height = v32;
      CGRectGetMaxX(v59);
      v34 = v23;
      v36 = v50;
      v35 = v51;
      v37 = rect;
    }
    else
    {
      v60.origin.x = v23;
      v60.size.width = v50;
      v60.origin.y = v51;
      v60.size.height = rect;
      CGRectGetMaxX(v60);
      v34 = v26;
      v35 = v28;
      v36 = v30;
      v37 = v32;
    }
    CGRectGetMinX(*(CGRect *)&v34);
  }
  _SFRoundEdgeInsetsToPixels();
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  v46 = v39;
  v47 = v41;
  v48 = v43;
  v49 = v45;
  result.right = v49;
  result.bottom = v48;
  result.left = v47;
  result.top = v46;
  return result;
}

- (UIEdgeInsets)sidebarObscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 8, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (BOOL)_interfaceFillsScreen
{
  BrowserRootViewController *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "browserViewControllerInterfaceFillsScreen:", v2);

  return (char)v2;
}

- (CGPoint)_convertDocumentCoordinateSpacePoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[BrowserRootViewController _viewForConvertingToCoordinateSpace:](self, "_viewForConvertingToCoordinateSpace:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)_convertDocumentCoordinateSpaceRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[BrowserRootViewController _viewForConvertingToCoordinateSpace:](self, "_viewForConvertingToCoordinateSpace:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v9, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)_viewForConvertingToCoordinateSpace:(id)a3
{
  id v4;
  SFOrderedContainerView **p_documentAndTopBarsContainerView;
  id v6;
  id *p_contentContainerView;
  id v8;
  id v9;

  v4 = a3;
  p_documentAndTopBarsContainerView = &self->_documentAndTopBarsContainerView;
  -[SFOrderedContainerView superview](self->_documentAndTopBarsContainerView, "superview");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  p_contentContainerView = (id *)&self->_contentContainerView;
  v8 = *p_contentContainerView;

  if (v6 != v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v4, "isDescendantOfView:", *p_documentAndTopBarsContainerView))
        p_contentContainerView = (id *)p_documentAndTopBarsContainerView;
    }
  }
  v9 = *p_contentContainerView;

  return v9;
}

- (CGRect)bottomToolbarFrameInCoordinateSpace:(id)a3 includeKeyboard:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  CapsuleNavigationBarViewController *capsuleViewController;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  unint64_t v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  CGFloat v30;
  double Width;
  double v32;
  BrowserRootViewController *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v7 = -[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar");
  capsuleViewController = self->_capsuleViewController;
  if (v7)
  {
    -[CapsuleNavigationBarViewController capsuleCollectionView](capsuleViewController, "capsuleCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    if (v4)
      -[BrowserRootViewController _loweredBarObscuredInsets](self, "_loweredBarObscuredInsets");
    else
      -[BrowserRootViewController _loweredBarObscuredInsetsIgnoringKeyboard](self, "_loweredBarObscuredInsetsIgnoringKeyboard");
    v29 = v18;
    v56.origin.x = v11;
    v56.origin.y = v13;
    v56.size.width = v15;
    v56.size.height = v17;
    v30 = CGRectGetHeight(v56) - v29;
    v57.origin.x = v11;
    v57.origin.y = v13;
    v57.size.width = v15;
    v57.size.height = v17;
    Width = CGRectGetWidth(v57);
    v32 = 0.0;
    v33 = self;
    v34 = v30;
    v35 = v29;
    goto LABEL_16;
  }
  if (!capsuleViewController)
  {
LABEL_17:
    -[BrowserRootViewController _frameForBottomToolbarForceHidden:](self, "_frameForBottomToolbarForceHidden:", 0);
    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v6);
    v41 = v48;
    v43 = v49;
    v45 = v50;
    v47 = v51;
    goto LABEL_18;
  }
  -[CapsuleNavigationBarViewController capsuleCollectionView](capsuleViewController, "capsuleCollectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "selectedItemState");
  if (v19 < 2)
  {
    objc_msgSend(v9, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    if (v4)
      objc_msgSend(v9, "obscuredInsets");
    else
      objc_msgSend(v9, "obscuredInsetsIgnoringKeyboard");
    v39 = v28;
    v58.origin.x = v21;
    v58.origin.y = v23;
    v58.size.width = v25;
    v58.size.height = v27;
    v37 = CGRectGetHeight(v58) - v39;
    objc_msgSend(v9, "bounds");
    Width = CGRectGetWidth(v59);
    v32 = 0.0;
    goto LABEL_15;
  }
  if (v19 != 2)
  {

    goto LABEL_17;
  }
  objc_msgSend(v9, "capsuleFrame");
  v37 = v36;
  v39 = v38;
LABEL_15:
  v33 = self;
  v34 = v37;
  v35 = v39;
LABEL_16:
  -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](v33, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v6, v32, v34, Width, v35);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;

LABEL_18:
  v52 = v41;
  v53 = v43;
  v54 = v45;
  v55 = v47;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (CGRect)navigationBarFrameInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double Width;
  double v12;
  double v13;
  double v14;
  double v15;
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
  CGRect v29;
  CGRect v30;
  CGRect result;

  v4 = a3;
  if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
  {
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "minimizationStyle") == 1)
    {
      objc_msgSend(v5, "obscuredInsetsForState:", 0);
      v7 = v6;
      objc_msgSend(v5, "obscuredInsets");
      v9 = v8 - v7;
      -[BrowserRootViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      Width = CGRectGetWidth(v29);
    }
    else
    {
      -[BrowserRootViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      Width = CGRectGetWidth(v30);
      objc_msgSend(v5, "obscuredInsets");
      v7 = v20;
      v9 = 0.0;
    }
    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v4, 0.0, v9, Width, v7);
    v13 = v21;
    v15 = v22;
    v17 = v23;
    v19 = v24;

  }
  else
  {
    -[BrowserRootViewController _frameForNavigationBar](self, "_frameForNavigationBar");
    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v4);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }

  v25 = v13;
  v26 = v15;
  v27 = v17;
  v28 = v19;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)usingLoweredBar
{
  return self->_toolbarPlacement == 1;
}

- (CapsuleNavigationBarViewController)capsuleViewController
{
  return self->_capsuleViewController;
}

- (BOOL)keepBarsMinimized
{
  return self->_keepBarsMinimized;
}

- (UIEdgeInsets)_loweredBarObscuredInsetsIgnoringKeyboard
{
  void *v2;
  double v3;
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
  UIEdgeInsets result;

  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "obscuredInsetsIgnoringKeyboard");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)maximumHeightObscuredByBottomToolbar
{
  double result;
  double v3;

  result = 0.0;
  if (self->_toolbarPlacement == 1)
  {
    -[BrowserRootViewController _loweredBarMaximumObscuredInsets](self, "_loweredBarMaximumObscuredInsets", 0.0);
    return v3;
  }
  return result;
}

- (UIEdgeInsets)_loweredBarMaximumObscuredInsets
{
  void *v2;
  double v3;
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
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "obscuredInsetsForState:ignoringKeyboard:", 0, 1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "obscuredInsetsForState:ignoringKeyboard:", 1, 1);
  if (v4 + v8 <= v11 + v13)
  {
    v4 = v11;
    v6 = v12;
    v8 = v13;
    v10 = v14;
  }

  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (BOOL)isInteractivelyMinimizingBars
{
  uint64_t v2;

  v2 = -[UIPanGestureRecognizer state](self->_hideNavigationBarGestureRecognizer, "state");
  return v2 > 0 && v2 != 5;
}

- (UIEdgeInsets)_loweredBarMinimumObscuredInsets
{
  void *v2;
  double v3;
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
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "obscuredInsetsForState:ignoringKeyboard:", 0, 1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "obscuredInsetsForState:ignoringKeyboard:", 1, 1);
  if (v4 + v8 >= v11 + v13)
  {
    v4 = v11;
    v6 = v12;
    v8 = v13;
    v10 = v14;
  }

  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGRect)contentFrameInPageView
{
  double v3;
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
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", self->_documentAndTopBarsContainerView, 0);
  -[BrowserRootViewController webViewEffectiveSafeAreaInsets](self, "webViewEffectiveSafeAreaInsets");
  UIEdgeInsetsMax();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  v12 = v6 + v11;
  v14 = v4 + v13;
  v16 = v15 - (v6 + v10);
  v18 = v17 - (v4 + v8);
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v12;
  return result;
}

- (CGSize)_webViewMinimumLayoutSizeWithBarVisibilitiesIgnored:(BOOL)a3
{
  _BOOL8 v3;
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
  CGSize result;

  v3 = a3;
  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", self->_documentAndTopBarsContainerView, v3);
  -[BrowserRootViewController _totalAdditionalContentHeightForBanners](self, "_totalAdditionalContentHeightForBanners");
  -[BrowserRootViewController webViewEffectiveSafeAreaInsets](self, "webViewEffectiveSafeAreaInsets");
  UIEdgeInsetsMax();
  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView);
  UIEdgeInsetsMax();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  v14 = v13 - (v8 + v12);
  v16 = v15 - (v6 + v10);
  result.height = v16;
  result.width = v14;
  return result;
}

- (void)_updateBottomBarHeightAboveKeyboard
{
  void *v3;
  id v4;

  -[BrowserRootViewController capsuleCollectionViewLayout](self, "capsuleCollectionViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "integerValue") == 1)
  {
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "minimizedCapsuleHeightAboveKeyboard");
    -[_SFWebView setBottomBarHeightAboveKeyboard:](self->_webView, "setBottomBarHeightAboveKeyboard:");

  }
  else
  {
    -[_SFWebView setBottomBarHeightAboveKeyboard:](self->_webView, "setBottomBarHeightAboveKeyboard:", 0.0);
  }

}

- (UIEdgeInsets)obscuredScrollViewInsetsConsideringTargetState:(BOOL)a3 insetsDueToSafeArea:(UIEdgeInsets *)a4
{
  int64_t toolbarPlacement;
  uint64_t v8;
  uint64_t v9;
  _SFWebView *webView;
  double v11;
  double v12;
  double v13;
  double v14;
  id WeakRetained;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
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
  double v30;
  double v31;
  UIEdgeInsets result;

  toolbarPlacement = self->_toolbarPlacement;
  v8 = -[_SFDynamicBarAnimator targetState](self->_dynamicBarAnimator, "targetState");
  if (toolbarPlacement == 1 || !a3)
  {
    -[_SFWebView bounds](self->_webView, "bounds");
    -[BrowserRootViewController obscuredInsetsForRect:inCoordinateSpace:](self, "obscuredInsetsForRect:inCoordinateSpace:", self->_webView);
  }
  else
  {
    v9 = v8;
    -[_SFWebView bounds](self->_webView, "bounds");
    webView = self->_webView;
    if (v9)
      -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", webView, 0);
    else
      -[BrowserRootViewController minimumObscuredInsetsForRect:inCoordinateSpace:](self, "minimumObscuredInsetsForRect:inCoordinateSpace:", webView);
  }
  v13 = v11;
  v14 = v12;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserViewController:adjustedTopObscuredInsetForBanners:", self, v13);
  objc_msgSend(WeakRetained, "browserViewController:adjustedBottomObscuredInset:", self, v14);
  if (a4)
  {
    -[BrowserRootViewController _webViewSafeAreaInsets](self, "_webViewSafeAreaInsets");
    UIEdgeInsetsMax();
    UIEdgeInsetsSubtract();
    a4->top = v16;
    a4->left = v17;
    a4->bottom = v18;
    a4->right = v19;
  }
  -[BrowserRootViewController webViewEffectiveSafeAreaInsets](self, "webViewEffectiveSafeAreaInsets");
  UIEdgeInsetsMax();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.right = v31;
  result.bottom = v30;
  result.left = v29;
  result.top = v28;
  return result;
}

- (UIEdgeInsets)webViewEffectiveSafeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  if ((-[_SFWebView _safeAreaShouldAffectObscuredInsets](self->_webView, "_safeAreaShouldAffectObscuredInsets") & 1) != 0)
  {
    -[BrowserRootViewController _webViewSafeAreaInsets](self, "_webViewSafeAreaInsets");
    v6 = 0.0;
  }
  else
  {
    v3 = *MEMORY[0x1E0DC49E8];
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  result.right = v5;
  result.bottom = v6;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)_webViewSafeAreaInsets
{
  void *v2;
  double v3;
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
  UIEdgeInsets result;

  -[BrowserRootViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)keyboardInsetInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double MaxY;
  double v28;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = a3;
  -[BrowserRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v10 = CGRectGetHeight(v30) - self->_bottomBarKeyboardOffset;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v5, 0.0, v10, CGRectGetWidth(v31), self->_bottomBarKeyboardOffset);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v4, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v32.origin.x = v20;
  v32.origin.y = v22;
  v32.size.width = v24;
  v32.size.height = v26;
  MaxY = CGRectGetMaxY(v32);
  v33.origin.x = v12;
  v33.origin.y = v14;
  v33.size.width = v16;
  v33.size.height = v18;
  v28 = fmax(MaxY - CGRectGetMinY(v33), 0.0);

  return v28;
}

- (BOOL)_shouldShowThemeColorInTopBar
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  if ((objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
    {
      if (_SFDeviceIsPad())
      {
        if (objc_msgSend(WeakRetained, "isShowingFavorites"))
          v3 = objc_msgSend(WeakRetained, "usesNarrowLayout") ^ 1;
        else
          LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CapsuleNavigationBarViewController selectedItemNavigationBar](self->_capsuleViewController, "selectedItemNavigationBar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
        v8 = v6 == 0;
      else
        v8 = 1;
      LOBYTE(v3) = !v8 && ((objc_msgSend(v6, "isMinimized") & 1) != 0 || objc_msgSend(v5, "layoutStyle") != 2);

    }
  }
  return v3;
}

- (UIEdgeInsets)_baseInsetsForVerticalScrollIndicator
{
  UIEdgeInsets *p_verticalScrollIndicatorBaseInsets;
  double top;
  double left;
  double bottom;
  double right;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  UIEdgeInsets result;

  p_verticalScrollIndicatorBaseInsets = &self->_verticalScrollIndicatorBaseInsets;
  top = self->_verticalScrollIndicatorBaseInsets.top;
  left = self->_verticalScrollIndicatorBaseInsets.left;
  bottom = self->_verticalScrollIndicatorBaseInsets.bottom;
  right = self->_verticalScrollIndicatorBaseInsets.right;
  if (left == 1.79769313e308 && top == 1.79769313e308 && right == 1.79769313e308 && bottom == 1.79769313e308)
  {
    v10 = (void *)MEMORY[0x1E0DC3C28];
    -[BrowserRootViewController view](self, "view", top);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_sf_baseInsetsForVerticalScrollIndicatorInScrollViewContainerView:", v11);
    p_verticalScrollIndicatorBaseInsets->top = v12;
    p_verticalScrollIndicatorBaseInsets->left = v13;
    p_verticalScrollIndicatorBaseInsets->bottom = v14;
    p_verticalScrollIndicatorBaseInsets->right = v15;

    top = p_verticalScrollIndicatorBaseInsets->top;
    left = p_verticalScrollIndicatorBaseInsets->left;
    bottom = p_verticalScrollIndicatorBaseInsets->bottom;
    right = p_verticalScrollIndicatorBaseInsets->right;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)_baseInsetsForHorizontalScrollIndicator
{
  UIEdgeInsets *p_horizontalScrollIndicatorBaseInsets;
  double top;
  double left;
  double bottom;
  double right;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  UIEdgeInsets result;

  p_horizontalScrollIndicatorBaseInsets = &self->_horizontalScrollIndicatorBaseInsets;
  top = self->_horizontalScrollIndicatorBaseInsets.top;
  left = self->_horizontalScrollIndicatorBaseInsets.left;
  bottom = self->_horizontalScrollIndicatorBaseInsets.bottom;
  right = self->_horizontalScrollIndicatorBaseInsets.right;
  if (left == 1.79769313e308 && top == 1.79769313e308 && right == 1.79769313e308 && bottom == 1.79769313e308)
  {
    v10 = (void *)MEMORY[0x1E0DC3C28];
    -[BrowserRootViewController view](self, "view", top);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_sf_baseInsetsForHorizontalScrollIndicatorInScrollViewContainerView:", v11);
    p_horizontalScrollIndicatorBaseInsets->top = v12;
    p_horizontalScrollIndicatorBaseInsets->left = v13;
    p_horizontalScrollIndicatorBaseInsets->bottom = v14;
    p_horizontalScrollIndicatorBaseInsets->right = v15;

    top = p_horizontalScrollIndicatorBaseInsets->top;
    left = p_horizontalScrollIndicatorBaseInsets->left;
    bottom = p_horizontalScrollIndicatorBaseInsets->bottom;
    right = p_horizontalScrollIndicatorBaseInsets->right;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)viewDidLayoutSubviews
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BrowserRootViewController;
  -[BrowserRootViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  -[BrowserRootViewController _layOutTopBackdrop](self, "_layOutTopBackdrop");
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ensureContentOffsetWithinContentInsets");

}

- (void)_setTopBackdropTheme:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  _QWORD v9[5];

  v4 = a4;
  v7 = a3;
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isEqual:", self->_topBackdropTheme) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_topBackdropTheme, a3);
    if (v4)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __59__BrowserRootViewController__setTopBackdropTheme_animated___block_invoke;
      v9[3] = &unk_1E9CF1900;
      v9[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331650, v9, 0);
    }
    else
    {
      -[BrowserRootViewController _applyTopBackdropTheme](self, "_applyTopBackdropTheme");
      -[BrowserRootViewController _applyStatusBarBackdropTheme](self, "_applyStatusBarBackdropTheme");
    }
  }

}

uint64_t __57__BrowserRootViewController__updateTopBarStylesAnimated___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1280) = 0;
  return result;
}

- (UnifiedBar)unifiedBar
{
  return self->_unifiedBar;
}

- (void)updateUnifiedBarChromelessScrollDistance
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;

  if (self->_unifiedBar)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    if (objc_msgSend(WeakRetained, "isShowingFavorites")
      && (objc_msgSend(WeakRetained, "favoritesAreShowingInPopover") & 1) == 0)
    {
      -[CatalogViewController chromelessScrollDistance](self->_catalogViewController, "chromelessScrollDistance");
      v7 = v8;
    }
    else
    {
      objc_msgSend(WeakRetained, "tabController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "activeTabDocument");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scrollDistance");
      v7 = v6;

    }
    -[SFUnifiedBar setChromelessScrollDistance:](self->_unifiedBar, "setChromelessScrollDistance:", v7);

  }
}

- (void)updateTabViewPinchRecognizer
{
  void *v2;
  void *v4;
  int v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"))
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPrivateBrowsingLocked") ^ 1;

  }
  else
  {
    v5 = 1;
  }
  -[_SFWebView scrollView](self->_webView, "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoomScale");
  v8 = v7;
  -[_SFWebView scrollView](self->_webView, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minimumZoomScale");
  v11 = v8 / v10;

  if (v11 >= 1.0001)
  {
    v6 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
    if (objc_msgSend(v6, "presentationState") == 1)
    {

    }
    else
    {
      v12 = (void *)objc_msgSend(v6, "presentationState");

      if (v12 != (void *)2 && (objc_msgSend(WeakRetained, "favoritesAreEmbedded") & 1) == 0)
        goto LABEL_11;
    }
  }
  objc_msgSend(WeakRetained, "activeLibraryType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  if (v13)
  {

    if (v11 < 1.0001)
    {
LABEL_12:
      v14 = 0;
      v15 = 0;
      goto LABEL_13;
    }
LABEL_11:

    goto LABEL_12;
  }
  -[BrowserRootViewController capsuleViewController](self, "capsuleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5 & ~objc_msgSend(v2, "capsuleIsFocused");

  if (v11 >= 1.0001)
  {

    if ((v15 & 1) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
  if ((_DWORD)v15)
  {
LABEL_20:
    objc_msgSend(WeakRetained, "tabCollectionViewProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tabOverview");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v2, "allowsInteractivePresentation");
    v14 = 1;
    goto LABEL_13;
  }
  v14 = 0;
LABEL_13:
  objc_msgSend(WeakRetained, "tabViewPinchRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", v15);

  if ((_DWORD)v14)
  {

  }
  -[TabSwitcherViewController pinchGestureRecognizer](self->_tabSwitcherViewController, "pinchGestureRecognizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", v14);

}

- (CatalogViewController)catalogViewController
{
  return self->_catalogViewController;
}

- (TabBarManager)tabBarManager
{
  return self->_tabBarManager;
}

- (CGSize)webViewMinimumUnobscuredLayoutSize
{
  double v2;
  double v3;
  CGSize result;

  -[BrowserRootViewController _webViewMinimumLayoutSizeWithBarVisibilitiesIgnored:](self, "_webViewMinimumLayoutSizeWithBarVisibilitiesIgnored:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)webViewMinimumLayoutSize
{
  double v2;
  double v3;
  CGSize result;

  -[BrowserRootViewController _webViewMinimumLayoutSizeWithBarVisibilitiesIgnored:](self, "_webViewMinimumLayoutSizeWithBarVisibilitiesIgnored:", 0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)webViewMaximumUnobscuredLayoutSize
{
  double v3;
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
  double v16;
  double v17;
  CGSize result;

  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BrowserRootViewController minimumObscuredInsetsForRect:inCoordinateSpace:](self, "minimumObscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView);
  -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView, v4, v6, v8, v10);
  UIEdgeInsetsReplace();
  -[BrowserRootViewController _webViewMinimumEffectiveSafeAreaInsets](self, "_webViewMinimumEffectiveSafeAreaInsets");
  UIEdgeInsetsMax();
  v13 = v8 - (v11 + v12);
  v16 = v10 - (v14 + v15);
  v17 = v13;
  result.height = v16;
  result.width = v17;
  return result;
}

- (unint64_t)tabDocumentView:(id)a3 contentOffsetAdjustmentEdgeWithPreviousContentInset:(UIEdgeInsets)a4
{
  double top;
  id v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  top = a4.top;
  v6 = a3;
  if (-[UIScrollView isDragging](self->_scrollView, "isDragging"))
  {
    v7 = 0;
  }
  else if (-[CapsuleNavigationBarViewController performingWebViewTapTransition](self->_capsuleViewController, "performingWebViewTapTransition"))
  {
    objc_msgSend(v6, "scrollDistance");
    v7 = v8 < 0.0;
  }
  else if (-[CapsuleNavigationBarViewController transitioningToNormalStateForKeyboardDismissal](self->_capsuleViewController, "transitioningToNormalStateForKeyboardDismissal"))
  {
    v7 = 4;
  }
  else
  {
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_msgSend(v6, "isShowingReader") & 1) != 0)
        objc_msgSend(v6, "readerWebView");
      else
        objc_msgSend(v6, "webView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v11, "isTracking") & 1) != 0 || (objc_msgSend(v11, "contentOffset"), v12 != -top))
      {
        if (objc_msgSend(v9, "isTransitioningToNormalStateForTapInBottomRegion"))
          v7 = 4;
        else
          v7 = 0;
      }
      else
      {
        v7 = 1;
      }

    }
    else
    {
      v7 = -[_SFNavigationBar isSendingBarMetricsChangeNotification](self->_navigationBar, "isSendingBarMetricsChangeNotification")|| self->_togglingTabBar;
    }

  }
  return v7;
}

- (BOOL)shouldFreezeWebViewUpdatesForTabDocumentView:(id)a3
{
  BrowserRootViewController *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "browserViewControllerShouldFreezeWebViewUpdatesForSizeTransition:", v3);

  return (char)v3;
}

- (UIEdgeInsets)scrollViewContentInsetAdjustmentsForTabDocumentView:(id)a3
{
  CGFloat top;
  CGFloat left;
  CGFloat right;
  double bottom;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  top = self->_contentInsetForContentFrame.top;
  left = self->_contentInsetForContentFrame.left;
  bottom = self->_contentInsetForContentFrame.bottom;
  right = self->_contentInsetForContentFrame.right;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserViewController:adjustedBottomContentInset:", self, bottom);
  v10 = v9;

  if (self->_toolbarPlacement == 1 && !self->_keepBarsMinimized)
  {
    -[BrowserRootViewController _bottomBarOffset](self, "_bottomBarOffset");
    v10 = v10 - v11;
  }
  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 16, self->_documentAndTopBarsContainerView);
  v13 = fmax(v10, 0.0) - v12;
  v14 = top;
  v15 = left;
  v16 = right;
  result.right = v16;
  result.bottom = v13;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)obscuredScrollViewInsetsForTabDocumentView:(id)a3 unobscuredSafeAreaInsets:(UIEdgeInsets *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[BrowserRootViewController obscuredScrollViewInsetsConsideringTargetState:insetsDueToSafeArea:](self, "obscuredScrollViewInsetsConsideringTargetState:insetsDueToSafeArea:", 0, a4);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)minimumEffectiveDeviceWidthForTabDocumentView:(id)a3
{
  return 0.0;
}

- (BOOL)inElementFullscreenForTabDocumentView:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "inElementFullscreen");
  return (char)v3;
}

- (UIEdgeInsets)_webViewMinimumEffectiveSafeAreaInsets
{
  void *v3;
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
  UIEdgeInsets result;

  if ((-[_SFWebView _safeAreaShouldAffectObscuredInsets](self->_webView, "_safeAreaShouldAffectObscuredInsets") & 1) != 0)
  {
    -[BrowserRootViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;

    v10 = 0.0;
  }
  else
  {
    v5 = *MEMORY[0x1E0DC49E8];
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.right = v13;
  result.bottom = v10;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)_bottomBarOffset
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  -[BrowserRootViewController maximumHeightObscuredByBottomToolbar](self, "maximumHeightObscuredByBottomToolbar");
  v4 = v3;
  -[BrowserRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[BrowserRootViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 2, v14, v7, v9, v11, v13);
  v16 = v4 - v15;

  return v16;
}

- (BOOL)isShowingTabBar
{
  return self->_showingTabBar;
}

- (void)_updateToolbarPlacementIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize *p_sizeForToolbarPlacement;
  id WeakRetained;
  uint64_t v11;

  -[BrowserRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  p_sizeForToolbarPlacement = &self->_sizeForToolbarPlacement;
  if (self->_sizeForToolbarPlacement.width != v5 || self->_sizeForToolbarPlacement.height != v7)
  {
    p_sizeForToolbarPlacement->width = v5;
    self->_sizeForToolbarPlacement.height = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_msgSend(WeakRetained, "browserViewController:toolbarPlacementForViewSize:", self, p_sizeForToolbarPlacement->width, self->_sizeForToolbarPlacement.height);

    -[BrowserRootViewController _setToolbarPlacement:](self, "_setToolbarPlacement:", v11);
  }
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return 4;
}

- (int64_t)preferredCenterStatusBarStyle
{
  return 4;
}

- (id)tabOverview:(id)a3 topBarThemeForItem:(id)a4
{
  BrowserController **p_browserController;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  p_browserController = &self->_browserController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tabWithUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isShowingSystemStartPage")
    && -[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v10, "topBarThemeForTabOverviewShowingThemeColor:", -[BrowserRootViewController _shouldShowThemeColorInTopBar](self, "_shouldShowThemeColorInTopBar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  if (!a4)
  {
    self->_verticalScrollIndicatorBaseInsets = *(UIEdgeInsets *)invalidScrollViewInsets;
    self->_horizontalScrollIndicatorBaseInsets = *(UIEdgeInsets *)invalidScrollViewInsets;
  }
}

- (void)_updateRefreshControlStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[BrowserRootViewController refreshControl](self, "refreshControl");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_SFWebView underPageBackgroundColor](self->_webView, "underPageBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "sf_isDarkColor"))
      v4 = 2;
    else
      v4 = 1;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setLocalOverrideTraitCollection:", v5);

  }
}

- (UIRefreshControl)refreshControl
{
  return -[UIScrollView refreshControl](self->_scrollView, "refreshControl");
}

- (void)setNeedsScrollToTopView:(BOOL)a3
{
  ScrollToTopView *v4;
  uint64_t v5;
  ScrollToTopView *v6;
  ScrollToTopView *scrollToTopView;
  void *v8;
  ScrollToTopView *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (self->_needsScrollToTopView != a3)
  {
    self->_needsScrollToTopView = a3;
    if (a3)
    {
      objc_initWeak(&location, self);
      v4 = [ScrollToTopView alloc];
      v5 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __53__BrowserRootViewController_setNeedsScrollToTopView___block_invoke;
      v13[3] = &unk_1E9CF4888;
      objc_copyWeak(&v14, &location);
      v6 = -[ScrollToTopView initWithTargetBlock:](v4, "initWithTargetBlock:", v13);
      scrollToTopView = self->_scrollToTopView;
      self->_scrollToTopView = v6;

      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __53__BrowserRootViewController_setNeedsScrollToTopView___block_invoke_2;
      v11[3] = &unk_1E9CF25A0;
      objc_copyWeak(&v12, &location);
      -[ScrollToTopView setShowBarsBlock:](self->_scrollToTopView, "setShowBarsBlock:", v11);
      -[BrowserRootViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_scrollToTopView);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      -[ScrollToTopView removeFromSuperview](self->_scrollToTopView, "removeFromSuperview");
      v9 = self->_scrollToTopView;
      self->_scrollToTopView = 0;

    }
    -[BrowserRootViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
}

- (SFBarAnimating)currentBarAnimator
{
  void *v3;
  _SFDynamicBarAnimator *v4;

  -[BrowserRootViewController capsuleCollectionViewLayout](self, "capsuleCollectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v4 = (_SFDynamicBarAnimator *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_dynamicBarAnimator;
  }
  return v4;
}

- (_SFDynamicBarAnimator)dynamicBarAnimator
{
  return self->_dynamicBarAnimator;
}

- (int64_t)bookmarksPresentationStyle
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  int64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  -[BrowserRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = objc_msgSend(WeakRetained, "bookmarksPresentationStyleForViewOfSize:", v5, v6);

  return v7;
}

- (int64_t)preferredLeadingStatusBarStyle
{
  if (!self->_showingSidebar)
    return 4;
  -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle");
  if (_SFIsDarkTintStyle())
    return 1;
  else
    return 2;
}

void __81__BrowserRootViewController_setNeedsPreferredStatusBarUpdateAfterCommitAnimated___block_invoke(uint64_t a1)
{
  char v1;
  _QWORD v2[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1184) = 0;
  v1 = *(_BYTE *)(a1 + 40);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __81__BrowserRootViewController_setNeedsPreferredStatusBarUpdateAfterCommitAnimated___block_invoke_2;
  v2[3] = &unk_1E9CF1900;
  v2[4] = *(_QWORD *)(a1 + 32);
  +[UIView safari_animate:withDuration:animations:](0.25, MEMORY[0x1E0DC3F10], v1, v2);
}

uint64_t __81__BrowserRootViewController_setNeedsPreferredStatusBarUpdateAfterCommitAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)loadView
{
  id v3;
  void *v4;
  UIViewController *v5;
  UIViewController *contentContainerViewController;
  ViewWithCustomNextResponder *v7;
  ViewWithCustomNextResponder *contentContainerView;
  UIViewController *v9;
  UIViewController *documentAndTopBarsContainerViewController;
  id v11;
  SFOrderedContainerView *v12;
  SFOrderedContainerView *documentAndTopBarsContainerView;
  UIPanGestureRecognizer *v14;
  UIPanGestureRecognizer *hideNavigationBarGestureRecognizer;
  BarContainerView *v16;
  BarContainerView *topAuxiliaryBarsContainerView;
  void *v18;
  TabBarDropExpansionView *v19;
  TabBarDropExpansionView *tabBarDropExpansionView;
  SFTouchDownGestureRecognizer *v21;
  SFTouchDownGestureRecognizer *touchDownGestureRecognizer;
  SFTouchUpGestureRecognizer *v23;
  SFTouchUpGestureRecognizer *touchUpGestureRecognizer;
  _SFDynamicBarAnimator *v25;
  _SFDynamicBarAnimator *dynamicBarAnimator;
  id WeakRetained;
  id v28;

  v3 = objc_alloc(MEMORY[0x1E0D4ECF0]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v28 = (id)objc_msgSend(v3, "initWithFrame:");

  -[BrowserRootViewController setView:](self, "setView:", v28);
  objc_msgSend(v28, "setDelegate:", self);
  objc_msgSend(v28, "setClipsToBounds:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v28, "_addBoundingPathChangeObserver:", self);
  v5 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0DC3F20]);
  contentContainerViewController = self->_contentContainerViewController;
  self->_contentContainerViewController = v5;

  v7 = objc_alloc_init(ViewWithCustomNextResponder);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v7;

  -[UIViewController setView:](self->_contentContainerViewController, "setView:", self->_contentContainerView);
  -[ViewWithCustomNextResponder setClipsToBounds:](self->_contentContainerView, "setClipsToBounds:", 0);
  -[BrowserRootViewController addChildViewController:](self, "addChildViewController:", self->_contentContainerViewController);
  objc_msgSend(v28, "addSubview:", self->_contentContainerView);
  -[UIViewController didMoveToParentViewController:](self->_contentContainerViewController, "didMoveToParentViewController:", self);
  v9 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0DC3F20]);
  documentAndTopBarsContainerViewController = self->_documentAndTopBarsContainerViewController;
  self->_documentAndTopBarsContainerViewController = v9;

  v11 = objc_alloc(MEMORY[0x1E0D4ECF0]);
  -[ViewWithCustomNextResponder bounds](self->_contentContainerView, "bounds");
  v12 = (SFOrderedContainerView *)objc_msgSend(v11, "initWithFrame:");
  documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
  self->_documentAndTopBarsContainerView = v12;

  -[SFOrderedContainerView setDelegate:](self->_documentAndTopBarsContainerView, "setDelegate:", self);
  -[UIViewController setView:](self->_documentAndTopBarsContainerViewController, "setView:", self->_documentAndTopBarsContainerView);
  -[UIViewController addChildViewController:](self->_contentContainerViewController, "addChildViewController:", self->_documentAndTopBarsContainerViewController);
  -[ViewWithCustomNextResponder addSubview:](self->_contentContainerView, "addSubview:", self->_documentAndTopBarsContainerView);
  -[UIViewController didMoveToParentViewController:](self->_documentAndTopBarsContainerViewController, "didMoveToParentViewController:", self->_contentContainerViewController);
  v14 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__hideNavigationBarGestureRecognized_);
  hideNavigationBarGestureRecognizer = self->_hideNavigationBarGestureRecognizer;
  self->_hideNavigationBarGestureRecognizer = v14;

  -[UIPanGestureRecognizer _setCanPanHorizontally:](self->_hideNavigationBarGestureRecognizer, "_setCanPanHorizontally:", 0);
  -[UIPanGestureRecognizer setDelegate:](self->_hideNavigationBarGestureRecognizer, "setDelegate:", self);
  objc_msgSend(v28, "addGestureRecognizer:", self->_hideNavigationBarGestureRecognizer);
  v16 = objc_alloc_init(BarContainerView);
  topAuxiliaryBarsContainerView = self->_topAuxiliaryBarsContainerView;
  self->_topAuxiliaryBarsContainerView = v16;

  -[BarContainerView layer](self->_topAuxiliaryBarsContainerView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowsGroupOpacity:", 0);
  objc_msgSend(v18, "setAllowsGroupBlending:", 0);
  -[SFOrderedContainerView addSubview:](self->_documentAndTopBarsContainerView, "addSubview:", self->_topAuxiliaryBarsContainerView);
  v19 = objc_alloc_init(TabBarDropExpansionView);
  tabBarDropExpansionView = self->_tabBarDropExpansionView;
  self->_tabBarDropExpansionView = v19;

  -[TabBarDropExpansionView setDelegate:](self->_tabBarDropExpansionView, "setDelegate:", self);
  -[SFOrderedContainerView addSubview:](self->_documentAndTopBarsContainerView, "addSubview:", self->_tabBarDropExpansionView);
  v21 = (SFTouchDownGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EE60]), "initWithTarget:action:", self, sel__receivedTouchDown_);
  touchDownGestureRecognizer = self->_touchDownGestureRecognizer;
  self->_touchDownGestureRecognizer = v21;

  -[SFTouchDownGestureRecognizer setDelegate:](self->_touchDownGestureRecognizer, "setDelegate:", self);
  -[SFOrderedContainerView addGestureRecognizer:](self->_documentAndTopBarsContainerView, "addGestureRecognizer:", self->_touchDownGestureRecognizer);
  v23 = (SFTouchUpGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EE68]), "initWithTarget:action:", self, sel__receivedTouchUp_);
  touchUpGestureRecognizer = self->_touchUpGestureRecognizer;
  self->_touchUpGestureRecognizer = v23;

  -[SFTouchUpGestureRecognizer setDelegate:](self->_touchUpGestureRecognizer, "setDelegate:", self);
  -[SFOrderedContainerView addGestureRecognizer:](self->_documentAndTopBarsContainerView, "addGestureRecognizer:", self->_touchUpGestureRecognizer);
  v25 = (_SFDynamicBarAnimator *)objc_alloc_init(MEMORY[0x1E0CD56B0]);
  dynamicBarAnimator = self->_dynamicBarAnimator;
  self->_dynamicBarAnimator = v25;

  -[BrowserRootViewController _updateToolbarPlacementIfNeeded](self, "_updateToolbarPlacementIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "updateDynamicBarGeometry");

  -[BrowserRootViewController _setUpFloatingSidebarButton](self, "_setUpFloatingSidebarButton");
  -[BrowserRootViewController _setUpTabGroupButton](self, "_setUpTabGroupButton");
  self->_pullToRefreshIsEnabled = 1;
  -[BrowserRootViewController _setUpWebpageStatusBarIfNeeded](self, "_setUpWebpageStatusBarIfNeeded");

}

- (void)addChildViewController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BrowserRootViewController;
  v4 = a3;
  -[BrowserRootViewController addChildViewController:](&v5, sel_addChildViewController_, v4);
  objc_msgSend(v4, "_setIgnoresWrapperViewForContentOverlayInsets:", self->_documentSafeAreaInsetsFrozen, v5.receiver, v5.super_class);

}

- (void)updateUsesLockdownStatusBar
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v3 = objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari");
  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
    -[TabBarManager setShowingLockdownStatusBar:](self->_tabBarManager, "setShowingLockdownStatusBar:", v3);
  if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
  {
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowingLockdownStatusBar:", v3);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTabDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBarItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabBarManager lockdownStatusBar](self->_tabBarManager, "lockdownStatusBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNavigationBarItem:", v7);

}

- (void)updateSuppressesStandaloneTabBar
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  _BOOL4 v14;
  BOOL v15;

  if (!self->_unifiedBar
    || !self->_sizeTransitionCount
    || -[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
  {
    objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "showRectangularTabsInSeparateBar");

    if ((v4 & 1) != 0)
    {
      v5 = 1;
LABEL_19:
      -[TabBarManager setSuppressesStandaloneTabBar:](self->_tabBarManager, "setSuppressesStandaloneTabBar:", v5);
      return;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", *MEMORY[0x1E0D4F6C0]);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    if ((objc_msgSend(MEMORY[0x1E0CD56B8], "isTabBarAvailableForScreenSize:", v9, v11) & 1) != 0)
    {
      v13 = fmin(v10, v12) <= 414.0;
      v14 = v10 <= v12 && v13;

      if (v7)
        v15 = !v14;
      else
        v15 = 0;
      if (v15)
      {
        v5 = 0;
        goto LABEL_19;
      }
    }
    else
    {

    }
    v5 = _SFDeviceIsPad() ^ 1;
    goto LABEL_19;
  }
}

- (void)_setUpTabGroupButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *sidebarTrailingButton;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  UIBarButtonItem *v13;
  UIBarButtonItem *sidebarTrailingButtonItem;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTabGroupButtonEnabled")
    && objc_msgSend(v3, "isCustomTabGroupsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "background");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    objc_msgSend(v4, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v4, 0);
    v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
    sidebarTrailingButton = self->_sidebarTrailingButton;
    self->_sidebarTrailingButton = v7;

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.on.square"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](self->_sidebarTrailingButton, "setImage:forState:", v9, 0);
    -[UIButton addTarget:action:forControlEvents:](self->_sidebarTrailingButton, "addTarget:action:forControlEvents:", self, sel__sidebarTrailingButtonWasTapped, 64);
    -[UIButton _touchInsets](self->_sidebarButtonEmbeddedInSidebar, "_touchInsets");
    -[UIButton _setTouchInsets:](self->_sidebarTrailingButton, "_setTouchInsets:");
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_sidebarTrailingButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setShowsMenuAsPrimaryAction:](self->_sidebarTrailingButton, "setShowsMenuAsPrimaryAction:", 1);
    -[UIButton setAccessibilityIdentifier:](self->_sidebarTrailingButton, "setAccessibilityIdentifier:", CFSTR("NewTabGroupButton"));
    -[UIButton sf_configureLargeContentViewerForBarItem:](self->_sidebarTrailingButton, "sf_configureLargeContentViewerForBarItem:", 2);
    -[UIButton setLargeContentImage:](self->_sidebarTrailingButton, "setLargeContentImage:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__BrowserRootViewController__setUpTabGroupButton__block_invoke;
    v15[3] = &unk_1E9CF49A0;
    objc_copyWeak(&v17, &location);
    v12 = v11;
    v16 = v12;
    -[UIButton _setMenuProvider:](self->_sidebarTrailingButton, "_setMenuProvider:", v15);
    v13 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_sidebarTrailingButton);
    sidebarTrailingButtonItem = self->_sidebarTrailingButtonItem;
    self->_sidebarTrailingButtonItem = v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

- (void)_setUpFloatingSidebarButton
{
  id WeakRetained;
  UIButton *v4;
  UIButton *sidebarButtonEmbeddedInSidebar;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *sidebarButtonItem;
  void *v13;
  UIButton *v14;
  UIButton *floatingSidebarButton;
  id v16;

  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isFloatingSidebarButtonEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "makeSidebarButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    sidebarButtonEmbeddedInSidebar = self->_sidebarButtonEmbeddedInSidebar;
    self->_sidebarButtonEmbeddedInSidebar = v4;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_sidebarButtonEmbeddedInSidebar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC39D0], "sf_bookmarkMenu");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setMenu:](self->_sidebarButtonEmbeddedInSidebar, "setMenu:", v6);

    -[UIButton intrinsicContentSize](self->_sidebarButtonEmbeddedInSidebar, "intrinsicContentSize");
    v8 = fmax(44.0 - v7, 0.0) * -0.5;
    v10 = fmax(44.0 - v9, 0.0) * -0.5;
    -[UIButton _setTouchInsets:](self->_sidebarButtonEmbeddedInSidebar, "_setTouchInsets:", v8, v10, v8, v10);
    v11 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_sidebarButtonEmbeddedInSidebar);
    sidebarButtonItem = self->_sidebarButtonItem;
    self->_sidebarButtonItem = v11;

    _SFAccessibilityIdentifierForBarItem();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityIdentifier:](self->_sidebarButtonItem, "setAccessibilityIdentifier:", v13);

    objc_msgSend(WeakRetained, "makeSidebarButton");
    v14 = (UIButton *)objc_claimAutoreleasedReturnValue();
    floatingSidebarButton = self->_floatingSidebarButton;
    self->_floatingSidebarButton = v14;

    -[UIButton setHidden:](self->_floatingSidebarButton, "setHidden:", 1);
    -[UIButton sf_applyContentSizeCategoryLimitsForToolbarButton](self->_floatingSidebarButton, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    -[ViewWithCustomNextResponder addSubview:](self->_contentContainerView, "addSubview:", self->_floatingSidebarButton);

  }
}

- (id)createToolbarForCapsuleNavigationBarViewController:(id)a3
{
  BrowserToolbar *v4;
  id WeakRetained;

  v4 = -[BrowserToolbar initWithPlacement:hideBackground:]([BrowserToolbar alloc], "initWithPlacement:hideBackground:", 1, 1);
  -[BrowserToolbar setDelegate:](v4, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserViewController:didCreateToolbar:", self, v4);

  return v4;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 showingSidebar;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  unint64_t v18;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "_sf_usesLeftToRightLayout");
  showingSidebar = self->_showingSidebar;
  v9 = objc_msgSend(v6, "canGoBack");
  v10 = objc_msgSend(v6, "canGoForward");
  if (self->_showingSidebar)
  {
    -[SidebarViewController contentViewController](self->_sidebarViewController, "contentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "preferredScreenEdgesDeferringSystemGestures");

  }
  else
  {
    v12 = 0;
  }
  v13 = 8;
  if (v7)
    v14 = 2;
  else
    v14 = 8;
  if (!v7)
    v13 = 2;
  if (v9)
    v15 = v14;
  else
    v15 = 0;
  if (v10)
    v16 = v13;
  else
    v16 = 0;
  v17 = v16 | v15;
  if (!showingSidebar)
    v13 = 10;
  v18 = v12 | v17 & v13;

  return v18;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v6 = -[BrowserRootViewController isViewLoaded](self, "isViewLoaded");
    v5 = obj;
    if (v6)
    {
      self->_sizeForToolbarPlacement = (CGSize)*MEMORY[0x1E0C9D820];
      -[BrowserRootViewController _updateToolbarPlacementIfNeeded](self, "_updateToolbarPlacementIfNeeded");
      v5 = obj;
    }
  }

}

- (BOOL)safari_wantsTransparentApplicationBackground
{
  id WeakRetained;
  BOOL v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if (SFTabGroupSwitcherEnabled() || SFEnhancedTabOverviewEnabled())
  {
    v3 = objc_msgSend(WeakRetained, "presentationState") != 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 != 0;

  }
  return v3;
}

- (void)_setToolbarPlacement:(int64_t)a3
{
  int64_t toolbarPlacement;
  void *v6;
  id WeakRetained;

  toolbarPlacement = self->_toolbarPlacement;
  if (self->_bottomToolbar)
  {
    if (toolbarPlacement != a3)
    {
LABEL_8:
      self->_toolbarPlacement = a3;
      -[BrowserRootViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNeedsLayout");

      -[BrowserRootViewController _updateToolbarForToolbarPlacementAllowingRemoval:](self, "_updateToolbarForToolbarPlacementAllowingRemoval:", !self->_isPerformingSizeTransition);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "browserViewControllerDidChangeToolbarPlacement:", self);

    }
  }
  else if (toolbarPlacement != a3
         || !self->_capsuleViewController && !-[_SFNavigationBar hasToolbar](self->_navigationBar, "hasToolbar"))
  {
    goto LABEL_8;
  }
}

- (void)_updateToolbarForToolbarPlacementAllowingRemoval:(BOOL)a3
{
  _BOOL4 v3;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *showBarsFromBottomBarRecognizer;
  CapsuleNavigationBarViewController *capsuleViewController;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  CapsuleNavigationBarViewController *v12;
  SFThemeColorEffectView *topBackdrop;
  BrowserToolbar *bottomToolbar;
  BOOL v15;
  BrowserToolbar *v16;
  UITapGestureRecognizer *v17;

  v3 = a3;
  -[BrowserRootViewController _updateTopBarAllowingRemoval:](self, "_updateTopBarAllowingRemoval:");
  if (self->_toolbarPlacement == 1)
  {
    -[BrowserRootViewController _createBottomToolbarIfNeeded](self, "_createBottomToolbarIfNeeded");
    if (!self->_showBarsFromBottomBarRecognizer)
    {
      v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__showBarsFromBottomBarTap_);
      showBarsFromBottomBarRecognizer = self->_showBarsFromBottomBarRecognizer;
      self->_showBarsFromBottomBarRecognizer = v5;

      -[UITapGestureRecognizer setDelegate:](self->_showBarsFromBottomBarRecognizer, "setDelegate:", self);
      -[SFOrderedContainerView addGestureRecognizer:](self->_documentAndTopBarsContainerView, "addGestureRecognizer:", self->_showBarsFromBottomBarRecognizer);
    }
  }
  else
  {
    -[_SFNavigationBar setHasToolbar:](self->_navigationBar, "setHasToolbar:", 1);
    capsuleViewController = self->_capsuleViewController;
    if (capsuleViewController)
      v8 = !v3;
    else
      v8 = 1;
    if (!v8)
    {
      -[CapsuleNavigationBarViewController willMoveToParentViewController:](capsuleViewController, "willMoveToParentViewController:", 0);
      -[CapsuleNavigationBarViewController view](self->_capsuleViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

      -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "minimizedProgressView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      -[CapsuleNavigationBarViewController removeFromParentViewController](self->_capsuleViewController, "removeFromParentViewController");
      v12 = self->_capsuleViewController;
      self->_capsuleViewController = 0;

      -[SFThemeColorEffectView removeFromSuperview](self->_topBackdrop, "removeFromSuperview");
      topBackdrop = self->_topBackdrop;
      self->_topBackdrop = 0;

      -[BrowserRootViewController _linkTabOverviewToCapsuleView](self, "_linkTabOverviewToCapsuleView");
    }
    bottomToolbar = self->_bottomToolbar;
    if (bottomToolbar)
      v15 = !v3;
    else
      v15 = 1;
    if (!v15)
    {
      -[BrowserToolbar removeFromSuperview](bottomToolbar, "removeFromSuperview");
      v16 = self->_bottomToolbar;
      self->_bottomToolbar = 0;

    }
    if (self->_showBarsFromBottomBarRecognizer)
    {
      -[SFOrderedContainerView removeGestureRecognizer:](self->_documentAndTopBarsContainerView, "removeGestureRecognizer:");
      v17 = self->_showBarsFromBottomBarRecognizer;
      self->_showBarsFromBottomBarRecognizer = 0;

    }
  }
  -[BrowserRootViewController updateUsesLockdownStatusBar](self, "updateUsesLockdownStatusBar");
  -[CatalogViewController updateStartPageTopSpacing](self->_catalogViewController, "updateStartPageTopSpacing");
}

- (void)_createBottomToolbarIfNeeded
{
  CapsuleNavigationBarViewController *v3;
  CapsuleNavigationBarViewController *capsuleViewController;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  SFThemeColorEffectView *v29;
  SFThemeColorEffectView *topBackdrop;
  id v31;
  void *v32;
  double Height;
  double v34;
  double v35;
  void *v36;
  double Width;
  double v38;
  UIView *v39;
  UIView *topSeparator;
  void *v41;
  void *v42;
  id WeakRetained;
  CGRect v44;
  CGRect v45;

  if (!self->_bottomToolbar && !self->_capsuleViewController)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    v3 = objc_alloc_init(CapsuleNavigationBarViewController);
    capsuleViewController = self->_capsuleViewController;
    self->_capsuleViewController = v3;

    -[CapsuleNavigationBarViewController setNextResponder:parentFocusEnvironment:](self->_capsuleViewController, "setNextResponder:parentFocusEnvironment:", WeakRetained, WeakRetained);
    -[CapsuleNavigationBarViewController setDelegate:](self->_capsuleViewController, "setDelegate:", self);
    -[CapsuleNavigationBarViewController view](self->_capsuleViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("CapsuleViewController"));

    v6 = self->_lockedPrivateBrowsingView != 0;
    -[CapsuleNavigationBarViewController view](self->_capsuleViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v6);

    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4EF20], "themeWithBarTintStyle:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTheme:", v9);

    objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayoutStyle:", objc_msgSend(v10, "preferredCapsuleLayoutStyle"));

    objc_msgSend(WeakRetained, "tabController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activeTabDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinimizationStyle:", objc_msgSend(v12, "isShowingReader"));

    -[CapsuleNavigationBarViewController setLinkedPageView:](self->_capsuleViewController, "setLinkedPageView:", self->_tabSwitcherViewController);
    v13 = -[TabSwitcherViewController tabOverviewIsVisible](self->_tabSwitcherViewController, "tabOverviewIsVisible");
    LODWORD(v11) = v13;
    objc_msgSend(v8, "setShouldDismissContent:", v13);
    objc_msgSend(v8, "setUserInteractionEnabled:", v11 ^ 1);
    objc_msgSend(v8, "addGestureObserver:", self);
    objc_msgSend(WeakRetained, "tabController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CapsuleNavigationBarViewController setTabController:](self->_capsuleViewController, "setTabController:", v14);

    -[BrowserRootViewController addChildViewController:](self, "addChildViewController:", self->_capsuleViewController);
    -[BrowserRootViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[CapsuleNavigationBarViewController view](self->_capsuleViewController, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    -[CapsuleNavigationBarViewController view](self->_capsuleViewController, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAutoresizingMask:", 18);

    -[CapsuleNavigationBarViewController view](self->_capsuleViewController, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v26);

    -[CapsuleNavigationBarViewController didMoveToParentViewController:](self->_capsuleViewController, "didMoveToParentViewController:", self);
    if (self->_keepBarsMinimized)
      -[CapsuleNavigationBarViewController transitionToState:animated:completionHandler:](self->_capsuleViewController, "transitionToState:animated:completionHandler:", 1, 0, 0);
    v27 = objc_alloc(MEMORY[0x1E0D4EE50]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (SFThemeColorEffectView *)objc_msgSend(v27, "initWithEffect:", v28);
    topBackdrop = self->_topBackdrop;
    self->_topBackdrop = v29;

    -[SFThemeColorEffectView setThemeColorVisibility:](self->_topBackdrop, "setThemeColorVisibility:", 1.0);
    -[SFOrderedContainerView addSubview:](self->_documentAndTopBarsContainerView, "addSubview:", self->_topBackdrop);
    v31 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[SFThemeColorEffectView contentView](self->_topBackdrop, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    Height = CGRectGetHeight(v44);
    _SFOnePixel();
    v35 = Height - v34;
    -[SFThemeColorEffectView contentView](self->_topBackdrop, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    Width = CGRectGetWidth(v45);
    _SFOnePixel();
    v39 = (UIView *)objc_msgSend(v31, "initWithFrame:", 0.0, v35, Width, v38);
    topSeparator = self->_topSeparator;
    self->_topSeparator = v39;

    -[UIView setAutoresizingMask:](self->_topSeparator, "setAutoresizingMask:", 10);
    -[BrowserRootViewController _updateCapsuleTopSeparatorColor](self, "_updateCapsuleTopSeparatorColor");
    -[SFThemeColorEffectView contentView](self->_topBackdrop, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addSubview:", self->_topSeparator);

    -[BrowserRootViewController _applyTopBackdropTheme](self, "_applyTopBackdropTheme");
    -[BrowserRootViewController _applyStatusBarBackdropTheme](self, "_applyStatusBarBackdropTheme");
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CatalogViewController setStartPageScrollObserver:](self->_catalogViewController, "setStartPageScrollObserver:", v42);

    -[BrowserRootViewController _linkTabOverviewToCapsuleView](self, "_linkTabOverviewToCapsuleView");
  }
}

- (void)_applyStatusBarBackdropTheme
{
  id v3;

  if (self->_topBackdrop)
  {
    -[SFThemeColorEffectView setTheme:](self->_statusBarBackdrop, "setTheme:", self->_topBackdropTheme);
  }
  else
  {
    -[SFUnifiedBar barTheme](self->_unifiedBar, "barTheme");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SFThemeColorEffectView setTheme:](self->_statusBarBackdrop, "setTheme:", v3);

  }
}

- (void)_applyTopBackdropTheme
{
  SFUnifiedBarTheme *topBackdropTheme;

  topBackdropTheme = self->_topBackdropTheme;
  if (topBackdropTheme)
  {
    -[SFThemeColorEffectView setOverrideUserInterfaceStyle:](self->_topBackdrop, "setOverrideUserInterfaceStyle:", -[SFUnifiedBarTheme userInterfaceStyle](topBackdropTheme, "userInterfaceStyle"));
    -[SFThemeColorEffectView setTheme:](self->_topBackdrop, "setTheme:", self->_topBackdropTheme);
  }
}

- (void)_updateCapsuleTopSeparatorColor
{
  id v3;

  if (self->_usesFaintTopSeparator)
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_secondaryBarHairlineOutlineColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineShadowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_topSeparator, "setBackgroundColor:", v3);

}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  int64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;

  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "selectionGestureAxis") != 1;
  else
    v5 = 1;
  v6 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if (objc_msgSend(v6, "presentationState") != 1 && objc_msgSend(v6, "presentationState") != 2)
    v5 = 0;

  if (v5)
    goto LABEL_8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeTabDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isShowingSystemStartPage"))
  {

  }
  else
  {
    v11 = -[BrowserRootViewController _shouldShowThemeColorInTopBar](self, "_shouldShowThemeColorInTopBar");

    if (!v11)
      goto LABEL_8;
  }
  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
  {
    -[SFUnifiedBar barTheme](self->_unifiedBar, "barTheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userInterfaceStyle");
    v7 = SFContrastingStatusBarStyleForInterfaceStyle();

    goto LABEL_16;
  }
  if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
  {
    -[SFUnifiedBarTheme userInterfaceStyle](self->_topBackdropTheme, "userInterfaceStyle");
    v7 = SFContrastingStatusBarStyleForInterfaceStyle();
    goto LABEL_16;
  }
LABEL_8:
  v7 = 0;
LABEL_16:

  return v7;
}

- (UIView)documentAndTopBarsContainerView
{
  return (UIView *)self->_documentAndTopBarsContainerView;
}

- (void)setCatalogViewController:(id)a3
{
  CatalogViewController *v5;
  CatalogViewController **p_catalogViewController;
  CatalogViewController *catalogViewController;
  void *v8;
  CatalogViewController *v9;

  v5 = (CatalogViewController *)a3;
  p_catalogViewController = &self->_catalogViewController;
  catalogViewController = self->_catalogViewController;
  if (catalogViewController != v5)
  {
    v9 = v5;
    if (catalogViewController)
    {
      -[CatalogViewController setStartPageScrollObserver:](catalogViewController, "setStartPageScrollObserver:", 0);
      -[CatalogViewController willMoveToParentViewController:](*p_catalogViewController, "willMoveToParentViewController:", 0);
      -[CatalogViewController removeFromParentViewController](*p_catalogViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_catalogViewController, a3);
    self->_willDismissCatalogViewController = 0;
    if (*p_catalogViewController)
    {
      -[UIViewController addChildViewController:](self->_documentAndTopBarsContainerViewController, "addChildViewController:");
      -[CatalogViewController didMoveToParentViewController:](*p_catalogViewController, "didMoveToParentViewController:", self->_documentAndTopBarsContainerViewController);
      -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CatalogViewController setStartPageScrollObserver:](*p_catalogViewController, "setStartPageScrollObserver:", v8);

      -[CatalogViewController reloadNavigationItemAnimated:](*p_catalogViewController, "reloadNavigationItemAnimated:", 0);
    }
    -[BrowserRootViewController setNeedsPreferredStatusBarUpdateAfterCommitAnimated:](self, "setNeedsPreferredStatusBarUpdateAfterCommitAnimated:", objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"));
    v5 = v9;
  }

}

- (void)setNeedsPreferredStatusBarUpdateAfterCommitAnimated:(BOOL)a3
{
  void *v3;
  _QWORD v4[5];
  BOOL v5;

  if (!self->_statusBarStyleUpdateQueued)
  {
    self->_statusBarStyleUpdateQueued = 1;
    v3 = (void *)*MEMORY[0x1E0DC4730];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __81__BrowserRootViewController_setNeedsPreferredStatusBarUpdateAfterCommitAnimated___block_invoke;
    v4[3] = &unk_1E9CF1EE8;
    v4[4] = self;
    v5 = a3;
    objc_msgSend(v3, "_performBlockAfterCATransactionCommits:", v4);
  }
}

- (void)setUsesFaintTopSeparator:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  if (self->_usesFaintTopSeparator != a3)
  {
    v3 = a3;
    self->_usesFaintTopSeparator = a3;
    -[BrowserRootViewController navigationBar](self, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUsesFaintSeparator:", v3);

    -[BrowserRootViewController tabBarManager](self, "tabBarManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unifiedBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUsesFaintSeparator:", v3);

    -[BrowserRootViewController _updateCapsuleTopSeparatorColor](self, "_updateCapsuleTopSeparatorColor");
  }
}

- (NavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)updateThemeColorIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar")
    || -[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
  {
    -[BrowserRootViewController _updateTopBarStylesAnimated:](self, "_updateTopBarStylesAnimated:", v3);
  }
}

- (void)updateUnifiedBarVisibility
{
  id v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  -[UnifiedBar setHidden:](self->_unifiedBar, "setHidden:", -[BrowserRootViewController _shouldHideUnifiedBar](self, "_shouldHideUnifiedBar"));
  -[BrowserRootViewController _setShowingFloatingSidebarButton:](self, "_setShowingFloatingSidebarButton:", 0);
  v3 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if (objc_msgSend(v3, "presentationState") == 1)
  {

LABEL_5:
    goto LABEL_6;
  }
  v4 = objc_msgSend(v3, "presentationState");

  if (v4 != 2)
  {
    -[BrowserRootViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");
    objc_msgSend(v3, "layoutIfNeeded");
    goto LABEL_5;
  }
LABEL_6:
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0);
  objc_msgSend(WeakRetained, "updateTabViewPinchRecognizer");
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateLocalTabGroupTitle");

}

- (BOOL)_shouldHideUnifiedBar
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShowingLibraryDocument");

  return v4;
}

void __40__BrowserRootViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1640));
  objc_msgSend(WeakRetained, "siriLinkCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "createNewBookmarkInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v4);

  objc_msgSend(v3, "createReadingListItemInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v5);

  objc_msgSend(v3, "openBookmarkInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v6);

  objc_msgSend(v3, "openBookmarkInTabInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v7);

  objc_msgSend(v3, "openReadingListItemInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v8);

  objc_msgSend(v3, "changeReaderModeInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v9);

  objc_msgSend(v3, "createNewTabInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v10);

  objc_msgSend(v3, "createNewTabInteractionForAssistantIntent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v11);

  objc_msgSend(v3, "openTabInteraction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v12);

  objc_msgSend(v3, "closeTabInteraction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v13);

  objc_msgSend(v3, "createNewPrivateTabInteraction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v14);

  objc_msgSend(v3, "createNewTabGroupInteraction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v15);

  objc_msgSend(v3, "openTabGroupInteraction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v16);

  objc_msgSend(v3, "closeViewInteraction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v17);

  objc_msgSend(v3, "openViewInteraction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v18);

  objc_msgSend(v3, "webSearchInteraction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v19);

  objc_msgSend(v3, "navigateContinuousReadingListInteraction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v20);

  objc_msgSend(v3, "openClearHistoryInteraction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v21);

  objc_msgSend(v3, "listenToPageSiriReaderInteraction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v22);

  objc_msgSend(v3, "loadURLInTabInteraction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v23);

  objc_msgSend(v3, "searchTabsInteraction");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v24);

  objc_msgSend(v3, "findOnPageInteraction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v25);

  objc_msgSend(v3, "searchWebAssistantIntentInteraction");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v26);

  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1680);
  if (v27)
  {
    (*(void (**)(void))(v27 + 16))();
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(void **)(v28 + 1680);
    *(_QWORD *)(v28 + 1680) = 0;

  }
  v30 = objc_alloc_init(MEMORY[0x1E0D4F6D0]);
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(void **)(v31 + 1688);
  *(_QWORD *)(v31 + 1688) = v30;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1688), "setObserver:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1688), "startObserving");

}

- (void)webSearchTipDidBecomeUnavailable
{
  -[BrowserRootViewController _dismissWebSearchTipPopoverIfNeeded](self, "_dismissWebSearchTipPopoverIfNeeded");
  -[CatalogViewController dismissWebSearchTipIfNeeded](self->_catalogViewController, "dismissWebSearchTipIfNeeded");
}

- (void)_dismissWebSearchTipPopoverIfNeeded
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[UIViewController presentingViewController](self->_webSearchTipViewController, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0DC3F20];
    v5[1] = 3221225472;
    v5[2] = __64__BrowserRootViewController__dismissWebSearchTipPopoverIfNeeded__block_invoke;
    v5[3] = &unk_1E9CF1900;
    v4 = v2;
    v5[0] = MEMORY[0x1E0C809B0];
    v6 = v2;
    objc_msgSend(v3, "_performWithoutDeferringTransitions:", v5);

    v2 = v4;
  }

}

- (BOOL)capsuleNavigationBarViewController:(id)a3 shouldUnminimizeOnScrollForScrollView:(id)a4
{
  if (self->_keepBarsMinimized)
    return 0;
  else
    return !-[BrowserRootViewController _isShowingFindOnPage](self, "_isShowingFindOnPage", a3, a4);
}

- (BOOL)_isShowingFindOnPage
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShowingFindOnPage");

  return v5;
}

void __70__BrowserRootViewController_dismissViewControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1640));
  if ((objc_msgSend(WeakRetained, "isFavoritesFieldFocused") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      objc_msgSend(WeakRetained, "updateFirstResponderOrFocus");
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BrowserRootViewController;
  -[BrowserRootViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[BrowserRootViewController _updateTopBarStyles](self, "_updateTopBarStyles");
  +[LaunchStateController sharedController](LaunchStateController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__BrowserRootViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_1E9CF1900;
  v5[4] = self;
  objc_msgSend(v3, "doAfterUIBecomesActive:", v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0DC4FA8], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__updateTopBarStyles, *MEMORY[0x1E0D8B5C8], 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BrowserRootViewController;
  -[BrowserRootViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  self->_canBecomeFirstResponder = 1;
  -[BrowserRootViewController updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier");
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ((objc_msgSend(WeakRetained, "isFavoritesFieldFocused") & 1) == 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
    if (objc_msgSend(v5, "presentationState") == 1)
    {

    }
    else
    {
      v6 = objc_msgSend(v5, "presentationState");

      if (v6 != 2)
        objc_msgSend(WeakRetained, "updateFirstResponderOrFocus");
    }
  }
  +[LaunchStateController sharedController](LaunchStateController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationUIDidBecomeActive");

}

- (BOOL)becomeFirstResponder
{
  id WeakRetained;
  BOOL v4;
  objc_super v6;

  if (!-[BrowserRootViewController canBecomeFirstResponder](self, "canBecomeFirstResponder"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ((objc_msgSend(WeakRetained, "becomeFirstResponder") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BrowserRootViewController;
    v4 = -[BrowserRootViewController becomeFirstResponder](&v6, sel_becomeFirstResponder);
  }

  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  id WeakRetained;
  void *v4;
  BOOL v5;

  if (!self->_canBecomeFirstResponder)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (objc_msgSend(WeakRetained, "canBecomeFirstResponder"))
  {
    -[BrowserRootViewController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateAccessibilityIdentifier
{
  void *v2;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  char v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v19[0] = CFSTR("UUID");
  objc_msgSend(WeakRetained, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E9CFDBB0;
  if (v6)
    v8 = (const __CFString *)v6;
  v20[0] = v8;
  v19[1] = CFSTR("View");
  v9 = objc_msgSend(WeakRetained, "usesNarrowLayout");
  v10 = CFSTR("Regular");
  if (v9)
    v10 = CFSTR("Narrow");
  if (self->_keepBarsMinimized)
    v11 = CFSTR("true");
  else
    v11 = CFSTR("false");
  v20[1] = v10;
  v20[2] = v11;
  v19[2] = CFSTR("BarsKeptMinimized");
  v19[3] = CFSTR("SupportsTabBar");
  v12 = objc_msgSend(WeakRetained, "usesTabBar");
  if ((v12 & 1) != 0)
  {
    v13 = CFSTR("true");
  }
  else
  {
    -[TabBarManager standaloneTabBar](self->_tabBarManager, "standaloneTabBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v13 = CFSTR("true");
    else
      v13 = CFSTR("false");
  }
  v20[3] = v13;
  v19[4] = CFSTR("UsingLoweredBar");
  if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
    v14 = CFSTR("true");
  else
    v14 = CFSTR("false");
  v20[4] = v14;
  v19[5] = CFSTR("UsingUnifiedBar");
  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
    v15 = CFSTR("true");
  else
    v15 = CFSTR("false");
  v20[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserRootViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", v17);

  if ((v12 & 1) == 0)
}

- (UnifiedField)unifiedField
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CapsuleNavigationBarViewController unifiedField](self->_capsuleViewController, "unifiedField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BrowserRootViewController topBar](self, "topBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textField");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UnifiedField *)v5;
}

- (_SFNavigationBarCommon)topBar
{
  void *unifiedBar;

  unifiedBar = self->_unifiedBar;
  if (!unifiedBar)
    unifiedBar = self->_navigationBar;
  return (_SFNavigationBarCommon *)unifiedBar;
}

- (void)setWebView:(id)a3
{
  _SFWebView *v5;
  _SFWebView *webView;
  _SFWebView *v7;
  void *v8;
  UIScrollView *v9;
  UIScrollView *scrollView;
  _SFWebView *v11;

  v5 = (_SFWebView *)a3;
  webView = self->_webView;
  v11 = v5;
  if (webView != v5)
  {
    v7 = webView;
    -[_SFWebView scrollView](v7, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRefreshControl:", 0);

    objc_storeStrong((id *)&self->_webView, a3);
    -[_SFWebView scrollView](v11, "scrollView");
    v9 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
    scrollView = self->_scrollView;
    self->_scrollView = v9;

    -[BrowserRootViewController _setUpRefreshControlIfNeeded](self, "_setUpRefreshControlIfNeeded");
  }

}

- (void)_setUpRefreshControlIfNeeded
{
  void *v3;
  id v4;

  -[BrowserRootViewController refreshControl](self, "refreshControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!self->_pullToRefreshIsEnabled)
      return;
    v4 = objc_alloc_init(MEMORY[0x1E0DC3BA8]);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__refreshControlFired_, 4096);
    -[UIScrollView setRefreshControl:](self->_scrollView, "setRefreshControl:", v4);
    -[BrowserRootViewController _updateRefreshControlStyle](self, "_updateRefreshControlStyle");
    v3 = v4;
  }

}

- (void)updateViewForTabDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[BrowserRootViewController _continuousReadingViewController](self, "_continuousReadingViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addSubview:", v6);
}

- (void)setTabThumbnailCollectionView:(id)a3
{
  id WeakRetained;
  id v5;
  UIViewController *contentContainerViewController;
  id v7;
  ViewWithCustomNextResponder *contentContainerView;
  void *v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if (WeakRetained != obj)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = WeakRetained;
      objc_msgSend(v5, "willMoveToParentViewController:", 0);
      objc_msgSend(v5, "removeFromParentViewController");

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      contentContainerViewController = self->_contentContainerViewController;
      v7 = obj;
      -[UIViewController addChildViewController:](contentContainerViewController, "addChildViewController:", v7);
      objc_msgSend(v7, "didMoveToParentViewController:", self->_contentContainerViewController);

    }
    -[CapsuleNavigationBarViewController willTransitionFromTabView:toTabView:](self->_capsuleViewController, "willTransitionFromTabView:toTabView:", WeakRetained, obj);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(obj, "setThemeProvider:", self);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      contentContainerView = self->_contentContainerView;
      objc_msgSend(obj, "pinchPresentationGestureRecognizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ViewWithCustomNextResponder addGestureRecognizer:](contentContainerView, "addGestureRecognizer:", v9);

    }
    objc_storeWeak((id *)&self->_tabThumbnailCollectionView, obj);
    -[BrowserRootViewController _linkTabOverviewToCapsuleView](self, "_linkTabOverviewToCapsuleView");
    -[BrowserRootViewController _layOutTabView](self, "_layOutTabView");
  }

}

- (void)capsuleNavigationBarViewController:(id)a3 didCreateNavigationBar:(id)a4
{
  BrowserController **p_browserController;
  id v5;
  void *v6;
  CapsuleNavigationBarRegistration *v7;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "barManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CapsuleNavigationBarRegistration initWithBar:barManager:]([CapsuleNavigationBarRegistration alloc], "initWithBar:barManager:", v5, v6);
  objc_msgSend(v6, "registerBar:withToken:", v5, v7);
  objc_msgSend(v5, "setDelegate:", WeakRetained);

}

- (TabBar)tabBar
{
  return self->_tabBar;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  objc_super v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[5];
  id v18;

  v4 = a3;
  v6 = a4;
  v7 = _Block_copy(v6);
  -[BrowserRootViewController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = MEMORY[0x1E0C809B0];
  if ((isKindOfClass & 1) != 0)
  {
    v11 = -[CatalogViewController usesPopoverStyleForFavorites](self->_catalogViewController, "usesPopoverStyleForFavorites");

    if (v11)
    {
      aBlock[0] = v10;
      aBlock[1] = 3221225472;
      aBlock[2] = __70__BrowserRootViewController_dismissViewControllerAnimated_completion___block_invoke;
      aBlock[3] = &unk_1E9CF26B8;
      aBlock[4] = self;
      v18 = v6;
      v12 = _Block_copy(aBlock);

      v7 = v12;
    }
  }
  else
  {

  }
  v15[1] = 3221225472;
  v15[2] = __70__BrowserRootViewController_dismissViewControllerAnimated_completion___block_invoke_2;
  v15[3] = &unk_1E9CF2D98;
  v15[4] = self;
  v16 = v7;
  v14.receiver = self;
  v14.super_class = (Class)BrowserRootViewController;
  v15[0] = v10;
  v13 = v7;
  -[BrowserRootViewController dismissViewControllerAnimated:completion:](&v14, sel_dismissViewControllerAnimated_completion_, v4, v15);

}

- (void)_setShowingFloatingSidebarButton:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  double v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  id v11;
  void *v12;
  _BOOL8 v13;
  uint64_t IsPad;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  v5 = !a3;
  -[UIButton setHidden:](self->_floatingSidebarButton, "setHidden:", v5);
  -[UIView setHidden:](self->_sidebarButtonEmbeddedInUnifiedBar, "setHidden:", v3);
  v6 = (double)v5;
  -[UIButton setAlpha:](self->_sidebarButtonEmbeddedInSidebar, "setAlpha:", (double)v5);
  -[UIButton setEnabled:](self->_sidebarButtonEmbeddedInSidebar, "setEnabled:", v5);
  v7 = self->_showingSidebar && self->_sidebarStyle == 0;
  v8 = v3 | v7;
  -[CatalogViewController sidebarButton](self->_catalogViewController, "sidebarButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  objc_msgSend(WeakRetained, "toolbar");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setBarButton:hidden:", 4, v8);
  v11 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v11, "sidebarUIProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isShowingSidebar"))
    v13 = objc_msgSend(v12, "sidebarStyle") == 1;
  else
    v13 = 1;
  objc_msgSend(v17, "setShouldReserveSpaceForSidebarButton:", v13);
  if (v7)
    IsPad = 0;
  else
    IsPad = _SFDeviceIsPad();
  -[TabSwitcherViewController setShowsSidebarToggle:](self->_tabSwitcherViewController, "setShowsSidebarToggle:", IsPad);
  -[TabSwitcherViewController sidebarToggleBarButtonItem](self->_tabSwitcherViewController, "sidebarToggleBarButtonItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", v6);

}

- (BOOL)isShowingSidebar
{
  return self->_showingSidebar;
}

- (void)setTabBar:(id)a3
{
  TabBar *v5;
  TabBar **p_tabBar;
  void *v7;
  TabBar *v8;
  UIView *tabBarClipperView;
  UIView *v10;
  UIView *v11;
  UIView *v12;
  TabBar *v13;

  v5 = (TabBar *)a3;
  p_tabBar = &self->_tabBar;
  if (self->_tabBar != v5)
  {
    v13 = v5;
    -[BrowserRootViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    if (*p_tabBar)
    {
      -[BarContainerView unregisterBarView:](self->_topAuxiliaryBarsContainerView, "unregisterBarView:");
      v8 = *p_tabBar;
    }
    else
    {
      v8 = 0;
    }
    -[TabBar removeFromSuperview](v8, "removeFromSuperview");
    objc_storeStrong((id *)&self->_tabBar, a3);
    tabBarClipperView = self->_tabBarClipperView;
    if (*p_tabBar)
    {
      if (!tabBarClipperView)
      {
        v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v12 = self->_tabBarClipperView;
        self->_tabBarClipperView = v11;

        -[UIView setClipsToBounds:](self->_tabBarClipperView, "setClipsToBounds:", 1);
        -[BarContainerView addSubview:](self->_topAuxiliaryBarsContainerView, "addSubview:", self->_tabBarClipperView);
      }
      -[BarContainerView registerBarView:](self->_topAuxiliaryBarsContainerView, "registerBarView:");
      -[UIView addSubview:](self->_tabBarClipperView, "addSubview:", *p_tabBar);
      -[BrowserRootViewController updateTabHoverPreview](self, "updateTabHoverPreview");
      -[BrowserRootViewController _updateTopBarStyles](self, "_updateTopBarStyles");
    }
    else
    {
      -[UIView removeFromSuperview](tabBarClipperView, "removeFromSuperview");
      v10 = self->_tabBarClipperView;
      self->_tabBarClipperView = 0;

    }
    v5 = v13;
  }

}

- (void)updateTabHoverPreview
{
  TabBar *tabBar;
  TabBar *v4;
  TabBar *v5;
  TabBar *v6;
  TabHoverPreview *tabHoverPreview;
  TabHoverPreview *v8;
  TabHoverPreview *v9;
  UnifiedBar *unifiedBar;
  double v11;
  TabBar *v12;

  tabBar = self->_tabBar;
  if (tabBar)
  {
    v4 = tabBar;
  }
  else
  {
    -[TabBarManager effectiveTabBar](self->_tabBarManager, "effectiveTabBar");
    v4 = (TabBar *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v4;
  -[TabHoverPreview tabBar](self->_tabHoverPreview, "tabBar");
  v5 = (TabBar *)objc_claimAutoreleasedReturnValue();

  v6 = v12;
  if (v5 != v12)
  {
    -[TabHoverPreview removeFromSuperview](self->_tabHoverPreview, "removeFromSuperview");
    tabHoverPreview = self->_tabHoverPreview;
    self->_tabHoverPreview = 0;

    v6 = v12;
    if (v12)
    {
      v8 = -[TabHoverPreview initWithTabBar:]([TabHoverPreview alloc], "initWithTabBar:", v12);
      v9 = self->_tabHoverPreview;
      self->_tabHoverPreview = v8;

      -[TabHoverPreview setTranslatesAutoresizingMaskIntoConstraints:](self->_tabHoverPreview, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TabHoverPreview setInsetsPreviewFromTabBarEdge:](self->_tabHoverPreview, "setInsetsPreviewFromTabBarEdge:", v12 == self->_tabBar);
      unifiedBar = self->_unifiedBar;
      if (unifiedBar)
      {
        -[UnifiedBar layoutMargins](unifiedBar, "layoutMargins");
        -[TabHoverPreview setTopInset:](self->_tabHoverPreview, "setTopInset:", v11);
      }
      -[SFOrderedContainerView addSubview:](self->_documentAndTopBarsContainerView, "addSubview:", self->_tabHoverPreview);
      v6 = v12;
    }
  }

}

- (BrowserRootViewController)initWithBrowserController:(id)a3
{
  id v4;
  BrowserRootViewController *v5;
  BrowserRootViewController *v6;
  uint64_t v7;
  UIApplication *app;
  TabBarManager *v9;
  TabBarManager *tabBarManager;
  BrowserRootViewController *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BrowserRootViewController;
  v5 = -[BrowserRootViewController init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserController, v4);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = objc_claimAutoreleasedReturnValue();
    app = v6->_app;
    v6->_app = (UIApplication *)v7;

    *(_OWORD *)&v6->_horizontalScrollIndicatorBaseInsets.top = *(_OWORD *)invalidScrollViewInsets;
    *(_OWORD *)&v6->_horizontalScrollIndicatorBaseInsets.bottom = *(_OWORD *)&invalidScrollViewInsets[16];
    *(_OWORD *)&v6->_verticalScrollIndicatorBaseInsets.top = *(_OWORD *)invalidScrollViewInsets;
    *(_OWORD *)&v6->_verticalScrollIndicatorBaseInsets.bottom = *(_OWORD *)&invalidScrollViewInsets[16];
    v9 = objc_alloc_init(TabBarManager);
    tabBarManager = v6->_tabBarManager;
    v6->_tabBarManager = v9;

    -[BrowserRootViewController updateSuppressesStandaloneTabBar](v6, "updateSuppressesStandaloneTabBar");
    -[BrowserRootViewController _registerLayoutStateUpdateHandler](v6, "_registerLayoutStateUpdateHandler");
    -[BrowserRootViewController _logCurrentLayoutState](v6, "_logCurrentLayoutState");
    v11 = v6;
  }

  return v6;
}

- (void)_updateTopBarAllowingRemoval:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  id v6;
  UnifiedBar *v7;
  UnifiedBar *unifiedBar;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *sidebarButtonEmbeddedInUnifiedBar;
  UnifiedBar *v15;
  NavigationBar *navigationBar;
  NavigationBar *v17;
  NavigationBar *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _SFDynamicBarAnimator *dynamicBarAnimator;
  void *v24;
  _QWORD v25[5];
  NavigationBar *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v3 = a3;
  v28[1] = *MEMORY[0x1E0C80C00];
  if (-[BrowserRootViewController isViewLoaded](self, "isViewLoaded"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
    {
      if (!self->_unifiedBar)
      {
        v7 = objc_alloc_init(UnifiedBar);
        unifiedBar = self->_unifiedBar;
        self->_unifiedBar = v7;

        -[UnifiedBar setDelegate:](self->_unifiedBar, "setDelegate:", WeakRetained);
        v27 = CFSTR("isStandaloneBar");
        v9 = objc_msgSend(WeakRetained, "tabBarDisplayMode");
        v10 = CFSTR("false");
        if (v9 == 2)
          v10 = CFSTR("true");
        v28[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        WBSMakeAccessibilityIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UnifiedBar setAccessibilityIdentifier:](self->_unifiedBar, "setAccessibilityIdentifier:", v12);

        -[TabBarManager setUnifiedBar:](self->_tabBarManager, "setUnifiedBar:", self->_unifiedBar);
        -[TabBarManager setDisplayMode:](self->_tabBarManager, "setDisplayMode:", objc_msgSend(WeakRetained, "tabBarDisplayMode"));
        -[SFOrderedContainerView addSubview:](self->_documentAndTopBarsContainerView, "addSubview:", self->_unifiedBar);
        objc_msgSend(v6, "browserViewController:didCreateUnifiedBar:", self, self->_unifiedBar);
        -[UnifiedBar viewForBarItem:](self->_unifiedBar, "viewForBarItem:", 3);
        v13 = (UIView *)objc_claimAutoreleasedReturnValue();
        sidebarButtonEmbeddedInUnifiedBar = self->_sidebarButtonEmbeddedInUnifiedBar;
        self->_sidebarButtonEmbeddedInUnifiedBar = v13;

LABEL_10:
        if (!v3)
        {
LABEL_15:
          -[BrowserRootViewController topBar](self, "topBar");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)MEMORY[0x1E0CD5650];
            dynamicBarAnimator = self->_dynamicBarAnimator;
            -[BrowserRootViewController view](self, "view");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "attachToBar:withAnimator:inContainerView:", v21, dynamicBarAnimator, v24);

          }
          -[BrowserRootViewController _updateTopBarStyles](self, "_updateTopBarStyles");

          goto LABEL_18;
        }
        -[NavigationBar removeFromSuperview](self->_navigationBar, "removeFromSuperview");
        navigationBar = self->_navigationBar;
        self->_navigationBar = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      if (v3)
      {
        -[TabBarManager setDisplayMode:](self->_tabBarManager, "setDisplayMode:", 0);
        -[TabBarManager setUnifiedBar:](self->_tabBarManager, "setUnifiedBar:", 0);
        -[UnifiedBar removeFromSuperview](self->_unifiedBar, "removeFromSuperview");
        v15 = self->_unifiedBar;
        self->_unifiedBar = 0;

      }
      if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
        goto LABEL_10;
      if (!self->_navigationBar)
      {
        v17 = -[_SFNavigationBar initWithFrame:]([NavigationBar alloc], "initWithFrame:", 0.0, 0.0, 0.0, 44.0);
        v18 = self->_navigationBar;
        self->_navigationBar = v17;

        -[_SFNavigationBar setDelegate:](self->_navigationBar, "setDelegate:", WeakRetained);
        _SFBackdropGroupNameForOwner();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFNavigationBar setBackdropGroupName:](self->_navigationBar, "setBackdropGroupName:", v19);

        -[SFOrderedContainerView addSubview:](self->_documentAndTopBarsContainerView, "addSubview:", self->_navigationBar);
        objc_msgSend(v6, "browserViewController:didCreateNavigationBar:", self, self->_navigationBar);
        -[CatalogViewController setNavigationBar:](self->_catalogViewController, "setNavigationBar:", self->_navigationBar);
        v20 = (void *)MEMORY[0x1E0DC3F10];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __58__BrowserRootViewController__updateTopBarAllowingRemoval___block_invoke;
        v25[3] = &unk_1E9CF1830;
        v25[4] = self;
        v26 = (NavigationBar *)WeakRetained;
        objc_msgSend(v20, "performWithoutAnimation:", v25);
        navigationBar = v26;
        goto LABEL_14;
      }
    }
LABEL_18:

  }
}

- (void)_registerLayoutStateUpdateHandler
{
  void *v3;
  WBSDiagnosticStateCollector *v4;
  WBSDiagnosticStateCollector *stateCollector;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0D89BD8];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__BrowserRootViewController__registerLayoutStateUpdateHandler__block_invoke;
  v6[3] = &unk_1E9CF48D8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "registeredStateCollectorWithLogLabel:payloadProvider:", CFSTR("MobileSafari Layout State"), v6);
  v4 = (WBSDiagnosticStateCollector *)objc_claimAutoreleasedReturnValue();
  stateCollector = self->_stateCollector;
  self->_stateCollector = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_logCurrentLayoutState
{
  int IsPad;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  IsPad = _SFDeviceIsPad();
  v3 = WBS_LOG_CHANNEL_PREFIXLayout();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (IsPad)
  {
    if (!v4)
      return;
    v5 = v3;
    stringForCurrentTabBarLayoutPreference();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    v7 = "Current Tab Bar Layout: %{public}@";
  }
  else
  {
    if (!v4)
      return;
    v5 = v3;
    stringForCurrentCapsuleLayoutPreference();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    v7 = "Current Capsule Layout: %{public}@";
  }
  _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 0xCu);

}

- (BOOL)isShowingPrivateBrowsingExplanationSheet
{
  id WeakRetained;
  void *v3;
  void *v4;
  BOOL v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_privateBrowsingExplanationSheet);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isShowingDefaultBrowserSheet
{
  id WeakRetained;
  void *v3;
  void *v4;
  BOOL v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultBrowserSheet);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)setConfiguration:(id)a3
{
  _SFBrowserConfiguration *v5;
  _SFBrowserConfiguration *configuration;
  char v7;
  _SFBrowserConfiguration *v8;

  v5 = (_SFBrowserConfiguration *)a3;
  configuration = self->_configuration;
  if (configuration != v5)
  {
    v8 = v5;
    v7 = -[_SFBrowserConfiguration isEqual:](configuration, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      -[BrowserRootViewController _updateTopBarStyles](self, "_updateTopBarStyles");
      v5 = v8;
    }
  }

}

- (void)_updateTopBarStyles
{
  -[BrowserRootViewController _updateTopBarStylesAnimated:](self, "_updateTopBarStylesAnimated:", 0);
}

- (void)setSidebarUIProxyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sidebarUIProxyDelegate, a3);
}

- (SFScreenTimeOverlayViewController)screenTimeOverlayViewController
{
  return self->_screenTimeOverlayViewController;
}

- (void)_setUpWebpageStatusBarIfNeeded
{
  id v3;
  void *v4;
  SFWebpageStatusBarView *v5;
  SFWebpageStatusBarView *statusBarView;
  UIHoverGestureRecognizer *v7;
  UIHoverGestureRecognizer *statusBarHoverGestureRecognizer;
  id v9;

  if (-[BrowserRootViewController _usesWebpageStatusBar](self, "_usesWebpageStatusBar"))
  {
    if (!self->_statusBarView)
    {
      -[BrowserRootViewController view](self, "view");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v3 = objc_alloc(MEMORY[0x1E0D4EF18]);
      -[BrowserRootViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v5 = (SFWebpageStatusBarView *)objc_msgSend(v3, "initWithFrame:");
      statusBarView = self->_statusBarView;
      self->_statusBarView = v5;

      objc_msgSend(v9, "addSubview:", self->_statusBarView);
      v7 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", self, sel__statusBarHover_);
      statusBarHoverGestureRecognizer = self->_statusBarHoverGestureRecognizer;
      self->_statusBarHoverGestureRecognizer = v7;

      -[SFOrderedContainerView addGestureRecognizer:](self->_documentAndTopBarsContainerView, "addGestureRecognizer:", self->_statusBarHoverGestureRecognizer);
      objc_msgSend(v9, "setNeedsLayout");

    }
  }
}

- (BOOL)_usesWebpageStatusBar
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  _BOOL4 v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ((objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled") & 1) != 0)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPrivateBrowsingLocked");

    if ((v5 & 1) != 0)
      goto LABEL_8;
  }
  else
  {

  }
  if (!objc_msgSend(MEMORY[0x1E0D4EC80], "supportsWebpageStatusBar"))
  {
LABEL_8:
    LOBYTE(v7) = 0;
    return v7;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLForKey:", *MEMORY[0x1E0D4F1F0]))
    v7 = !-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar");
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  id v2;
  BOOL v3;

  if (!self->_barStateAllowsHidingHomeIndicator)
    return 0;
  v2 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  v3 = objc_msgSend(v2, "presentationState") != 1 && objc_msgSend(v2, "presentationState") != 2;

  return v3;
}

- (void)dynamicBarAnimatorOutputsDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  _BOOL8 v6;

  if (!-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar", a3))
  {
    v4 = -[_SFDynamicBarAnimator targetState](self->_dynamicBarAnimator, "targetState");
    -[_SFNavigationBar setUnifiedFieldShowsProgressView:](self->_navigationBar, "setUnifiedFieldShowsProgressView:", v4 != 0);
    -[BrowserRootViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    -[BrowserRootViewController _setAvoidanceInsetsNeedsUpdate](self, "_setAvoidanceInsetsNeedsUpdate");
    if (v4)
      v6 = 0;
    else
      v6 = -[BrowserRootViewController _interfaceFillsScreen](self, "_interfaceFillsScreen");
    -[BrowserRootViewController setBarStateAllowsHidingHomeIndicator:](self, "setBarStateAllowsHidingHomeIndicator:", v6);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BrowserRootViewController;
  v4 = a3;
  -[BrowserRootViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserViewController:traitCollectionDidChange:", self, v4, v8.receiver, v8.super_class);

  -[BrowserRootViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v7)
    -[BrowserRootViewController safari_updateApplicationBackgroundStyle](self, "safari_updateApplicationBackgroundStyle");
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("showingSidebar")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___BrowserRootViewController;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BrowserRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_removeBoundingPathChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BrowserRootViewController;
  -[BrowserRootViewController dealloc](&v4, sel_dealloc);
}

- (void)didReceiveMemoryWarning
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D7CA3000, a2, OS_LOG_TYPE_ERROR, "Sidebar is unparented, but is still in the view hierarchy with parent view %{public}@, removing the sidebar from the view hierarchy before discarding.", (uint8_t *)&v2, 0xCu);
}

- (void)setBookmarksBar:(id)a3
{
  BookmarksBarView *v5;
  BookmarksBarView **p_bookmarksBar;
  void *v7;
  void *v8;
  char v9;
  BookmarksBarView *v10;
  id WeakRetained;
  BookmarksBarView *v12;

  v5 = (BookmarksBarView *)a3;
  p_bookmarksBar = &self->_bookmarksBar;
  if (self->_bookmarksBar != v5)
  {
    v12 = v5;
    -[BrowserRootViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "showRectangularTabsInSeparateBar");

    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_bookmarksBar, a3);
      -[TabBarManager setBookmarksBar:](self->_tabBarManager, "setBookmarksBar:", v12);
      -[BrowserRootViewController _updateTopBarStyles](self, "_updateTopBarStyles");
LABEL_9:
      v5 = v12;
      goto LABEL_10;
    }
    if (*p_bookmarksBar)
    {
      -[BarContainerView unregisterBarView:](self->_topAuxiliaryBarsContainerView, "unregisterBarView:");
      v10 = *p_bookmarksBar;
    }
    else
    {
      v10 = 0;
    }
    -[BookmarksBarView removeFromSuperview](v10, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bookmarksBar, a3);
    v5 = v12;
    if (*p_bookmarksBar)
    {
      -[BarContainerView registerBarView:](self->_topAuxiliaryBarsContainerView, "registerBarView:");
      -[BarContainerView addSubview:](self->_topAuxiliaryBarsContainerView, "addSubview:", *p_bookmarksBar);
      -[BrowserRootViewController _updateTopBarStyles](self, "_updateTopBarStyles");
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "updateDynamicBarGeometry");

      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)_linkTabOverviewToCapsuleView
{
  CapsuleNavigationBarViewController *capsuleViewController;
  id v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    capsuleViewController = self->_capsuleViewController;
    v4 = WeakRetained;
    -[CapsuleNavigationBarViewController capsuleCollectionView](capsuleViewController, "capsuleCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCapsuleCollectionView:", v5);

  }
}

- (void)setShowingTabBar:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  if (self->_showingTabBar != a3)
  {
    self->_showingTabBar = a3;
    v4 = !a3;
    -[TabBarManager standaloneTabBar](self->_tabBarManager, "standaloneTabBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentHidden:", v4);

    -[UnifiedBar setNeedsLayout](self->_unifiedBar, "setNeedsLayout");
    -[BrowserRootViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)willToggleTabBar
{
  self->_togglingTabBar = 1;
}

- (void)didToggleTabBar
{
  self->_togglingTabBar = 0;
}

- (_SFBarCommon)primaryBar
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  int *v7;
  id v8;

  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
  {
    v3 = 1552;
LABEL_10:
    v8 = *(id *)((char *)&self->super.super.super.isa + v3);
    return (_SFBarCommon *)v8;
  }
  -[BrowserRootViewController _updateToolbarPlacementIfNeeded](self, "_updateToolbarPlacementIfNeeded");
  if (!-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
  {
    if (self->_toolbarPlacement)
      v7 = &OBJC_IVAR___BrowserRootViewController__bottomToolbar;
    else
      v7 = &OBJC_IVAR___BrowserRootViewController__navigationBar;
    v3 = *v7;
    goto LABEL_10;
  }
  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[CapsuleNavigationBarViewController selectedItemNavigationBar](self->_capsuleViewController, "selectedItemNavigationBar");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  return (_SFBarCommon *)v8;
}

- (_SFNavigationBarCommon)primaryNavigationBar
{
  id v3;
  void *unifiedBar;

  if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
  {
    -[CapsuleNavigationBarViewController selectedItemNavigationBar](self->_capsuleViewController, "selectedItemNavigationBar");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unifiedBar = self->_unifiedBar;
    if (!unifiedBar)
      unifiedBar = self->_navigationBar;
    v3 = unifiedBar;
  }
  return (_SFNavigationBarCommon *)v3;
}

- (NSArray)bars
{
  void *v3;
  NavigationBar **p_navigationBar;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BrowserToolbar *bottomToolbar;
  uint64_t v11;
  NavigationBar *navigationBar;
  _QWORD v13[2];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
  {
    v14[0] = self->_unifiedBar;
    v3 = (void *)MEMORY[0x1E0C99D20];
    p_navigationBar = (NavigationBar **)v14;
  }
  else
  {
    if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CapsuleNavigationBarViewController selectedItemNavigationBar](self->_capsuleViewController, "selectedItemNavigationBar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_addObjectUnlessNil:", v6);

      -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toolbar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_addObjectUnlessNil:", v8);

      return (NSArray *)v5;
    }
    if (self->_toolbarPlacement == 1)
    {
      bottomToolbar = self->_bottomToolbar;
      v13[0] = self->_navigationBar;
      v13[1] = bottomToolbar;
      v3 = (void *)MEMORY[0x1E0C99D20];
      p_navigationBar = (NavigationBar **)v13;
      v11 = 2;
      goto LABEL_9;
    }
    navigationBar = self->_navigationBar;
    v3 = (void *)MEMORY[0x1E0C99D20];
    p_navigationBar = &navigationBar;
  }
  v11 = 1;
LABEL_9:
  objc_msgSend(v3, "arrayWithObjects:count:", p_navigationBar, v11);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __59__BrowserRootViewController__setTopBackdropTheme_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_applyTopBackdropTheme");
  return objc_msgSend(*(id *)(a1 + 32), "_applyStatusBarBackdropTheme");
}

uint64_t __59__BrowserRootViewController__setTopBackdropUsesPlainTheme___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __59__BrowserRootViewController__setTopBackdropUsesPlainTheme___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setShowingSidebar:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  SidebarViewController *v10;
  SidebarViewController *sidebarViewController;
  void *v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  _QWORD block[5];
  id v40;
  id v41;
  BOOL v42;
  _QWORD v43[4];
  NSObject *v44;
  _QWORD v45[5];
  BOOL v46;
  _QWORD v47[5];
  NSObject *v48;
  _QWORD v49[5];
  BOOL v50;
  _QWORD v51[6];

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_showingSidebar == v4)
  {
    if (v6)
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
  else
  {
    -[BrowserRootViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

    -[BrowserRootViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("showingSidebar"));
    self->_showingSidebar = v4;
    -[BrowserRootViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("showingSidebar"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "browserViewController:didChangeShowingSidebar:", self, self->_showingSidebar);
    -[BrowserRootViewController _updateSidebarStyle](self, "_updateSidebarStyle");
    if (!self->_sidebarViewController && self->_showingSidebar)
    {
      v10 = objc_alloc_init(SidebarViewController);
      sidebarViewController = self->_sidebarViewController;
      self->_sidebarViewController = v10;

      -[SidebarViewController view](self->_sidebarViewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "_sf_usesLeftToRightLayout");

      -[BrowserRootViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safeAreaInsets");
      v16 = v15;
      v18 = v17;
      v20 = v19;

      if (v13)
        v21 = v18;
      else
        v21 = 0.0;
      if (v13)
        v22 = 0.0;
      else
        v22 = v20;
      -[SidebarViewController setAdditionalSafeAreaInsets:](self->_sidebarViewController, "setAdditionalSafeAreaInsets:", v16, v21, 0.0, v22);
      v23 = objc_loadWeakRetained((id *)&self->_sidebarUIProxyDelegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "sidebarContentViewControllerForSidebarUIProxy:", self);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SidebarViewController setContentViewController:](self->_sidebarViewController, "setContentViewController:", v24);

      }
    }
    v25 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke;
    v51[3] = &unk_1E9CF1900;
    v51[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v51);
    -[BrowserRootViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures](self, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
    -[CatalogViewController view](self->_catalogViewController, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutIfNeeded");

    -[BrowserRootViewController _layOutFloatingSidebarButtonForSidebarShowing:](self, "_layOutFloatingSidebarButtonForSidebarShowing:", !v4);
    if (self->_sidebarStyle == 1)
      -[UnifiedBar layoutIfNeeded](self->_unifiedBar, "layoutIfNeeded");
    v27 = dispatch_group_create();
    ++self->_sidebarControllerActiveAnimationCount;
    v28 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
    -[BrowserRootViewController setNeedsPreferredStatusBarUpdateAfterCommitAnimated:](self, "setNeedsPreferredStatusBarUpdateAfterCommitAnimated:", v28);
    -[BrowserRootViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setNeedsLayout");

    -[SidebarViewController view](self->_sidebarViewController, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = WeakRetained;
    if (self->_sizeTransitionCount)
    {
      v31 = 0;
    }
    else
    {
      -[_SFWebView window](self->_webView, "window");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v32 != 0;

    }
    dispatch_group_enter(v27);
    v33 = (void *)MEMORY[0x1E0DC3F10];
    v49[0] = v25;
    v49[1] = 3221225472;
    v49[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_2;
    v49[3] = &unk_1E9CF1EE8;
    v49[4] = self;
    v50 = v31;
    v47[0] = v25;
    v47[1] = 3221225472;
    v47[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_4;
    v47[3] = &unk_1E9CF4650;
    v47[4] = self;
    v34 = v27;
    v48 = v34;
    objc_msgSend(v33, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", v28, 4, v49, v47);
    dispatch_group_enter(v34);
    v35 = (void *)MEMORY[0x1E0DC3F10];
    v44 = v34;
    v45[0] = v25;
    v45[1] = 3221225472;
    v45[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_5;
    v45[3] = &unk_1E9CF1EE8;
    v45[4] = self;
    v46 = v4;
    v43[0] = v25;
    v43[1] = 3221225472;
    v43[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_6;
    v43[3] = &unk_1E9CF16A0;
    v36 = v34;
    objc_msgSend(v35, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", v28, 6, v45, v43);
    block[0] = v25;
    block[1] = 3221225472;
    block[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_7;
    block[3] = &unk_1E9CF4860;
    v42 = v31;
    block[4] = self;
    v40 = v30;
    v41 = v7;
    v37 = v30;
    dispatch_group_notify(v36, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareToShowSidebarViewControllerIfNeeded");
}

uint64_t __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1664), "beginAnimatedSizeTransition");
  v2 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = (void *)v2[202];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_3;
    v6[3] = &unk_1E9CF1900;
    v6[4] = v2;
    objc_msgSend(v3, "_beginAnimatedResizeWithUpdates:", v6);
  }
  else
  {
    objc_msgSend(v2, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

  }
  return +[Application postTestNotificationName:object:](Application, "postTestNotificationName:object:", CFSTR("SidebarWillPresentNotification"), *(_QWORD *)(a1 + 32));
}

void __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1648), "ignorePreviousLayoutSize");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

void __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1664), "endAnimatedSizeTransition");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layOutFloatingSidebarButtonForSidebarShowing:", *(unsigned __int8 *)(a1 + 40));
}

void __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_7(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336);
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1616), "_endAnimatedResize");
  objc_msgSend(*(id *)(a1 + 32), "_destroySidebarContentDimmingViewIfNeeded");
  +[Application postTestNotificationName:object:](Application, "postTestNotificationName:object:", CFSTR("SidebarDidPresentNotification"), *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[167])
  {
    objc_msgSend(v2, "_setShowingFloatingSidebarButton:", 0);
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v3 + 1336) && !*(_BYTE *)(v3 + 1408))
    {
      objc_msgSend(*(id *)(v3 + 1432), "willMoveToParentViewController:", 0);
      objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1432), "removeFromParentViewController");
    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (UIBarButtonItem)leadingSidebarButtonItem
{
  void *v3;

  if (-[BrowserRootViewController sidebarStyle](self, "sidebarStyle"))
  {
    v3 = 0;
  }
  else
  {
    -[BrowserRootViewController sidebarButtonItem](self, "sidebarButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIBarButtonItem *)v3;
}

id __53__BrowserRootViewController_setNeedsScrollToTopView___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __53__BrowserRootViewController_setNeedsScrollToTopView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "dynamicBarAnimator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "state");

    WeakRetained = v5;
    if (!v3)
    {
      objc_msgSend(v5, "browserController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "showBars");

      WeakRetained = v5;
    }
  }

}

- (void)_prepareToShowSidebarViewControllerIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  ViewWithCustomNextResponder *contentContainerView;
  id v7;

  if (self->_showingSidebar)
  {
    -[SidebarViewController parentViewController](self->_sidebarViewController, "parentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[SidebarViewController view](self->_sidebarViewController, "view");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[UIViewController addChildViewController:](self->_contentContainerViewController, "addChildViewController:", self->_sidebarViewController);
      +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isFloatingSidebarButtonEnabled");

      contentContainerView = self->_contentContainerView;
      if (v5)
        -[ViewWithCustomNextResponder insertSubview:belowSubview:](contentContainerView, "insertSubview:belowSubview:", v7, self->_floatingSidebarButton);
      else
        -[ViewWithCustomNextResponder addSubview:](contentContainerView, "addSubview:", v7);
      -[SidebarViewController didMoveToParentViewController:](self->_sidebarViewController, "didMoveToParentViewController:", self->_contentContainerViewController);
      -[BrowserRootViewController _frameForSidebarWhenShowing:](self, "_frameForSidebarWhenShowing:", 0);
      objc_msgSend(v7, "setFrame:");
      objc_msgSend(v7, "layoutIfNeeded");
      -[SidebarContentDimmingView setPassthroughView:](self->_sidebarContentDimmingView, "setPassthroughView:", v7);

    }
  }
}

- (void)setDocumentSafeAreaInsetsFrozen:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_documentSafeAreaInsetsFrozen != a3)
  {
    v3 = a3;
    self->_documentSafeAreaInsetsFrozen = a3;
    -[SFOrderedContainerView _setSafeAreaInsetsFrozen:](self->_documentAndTopBarsContainerView, "_setSafeAreaInsetsFrozen:");
    setSafeAreaInsetsFrozenRecursively(self, v3);
  }
}

- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)BrowserRootViewController;
  v5 = a3;
  -[BrowserRootViewController removeChildViewController:notifyDidMove:](&v6, sel_removeChildViewController_notifyDidMove_, v5, v4);
  objc_msgSend(v5, "_setIgnoresWrapperViewForContentOverlayInsets:", 0, v6.receiver, v6.super_class);

}

- (id)_multitaskingDragExclusionRects
{
  id v3;
  uint64_t v4;
  void *v5;
  UnifiedBar *unifiedBar;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void (**v28)(_QWORD, double, double, double, double);
  void *v29;
  TabBar *tabBar;
  double x;
  double y;
  double width;
  double height;
  id WeakRetained;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, CGFloat, CGFloat, CGFloat, CGFloat);
  void *v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  CGFloat *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[4];
  _QWORD v48[2];
  CGRect v49;

  v48[1] = *MEMORY[0x1E0C80C00];
  if (!-[_SFDynamicBarAnimator state](self->_dynamicBarAnimator, "state"))
    goto LABEL_5;
  v3 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if (objc_msgSend(v3, "presentationState") == 1)
  {

LABEL_5:
    v5 = (void *)MEMORY[0x1E0C9AA60];
    return v5;
  }
  v4 = objc_msgSend(v3, "presentationState");

  if (v4 == 2)
    goto LABEL_5;
  if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar"))
  {
    unifiedBar = self->_unifiedBar;
    -[UnifiedBar bounds](unifiedBar, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[BrowserRootViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UnifiedBar convertRect:toView:](unifiedBar, "convertRect:toView:", v16, v9, v11, v13, v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v47[0] = v18;
    v47[1] = v20;
    v47[2] = v22;
    v47[3] = v24;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v47, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v44 = (CGFloat *)&v43;
    v45 = 0x2020000000;
    v46 = 0;
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __60__BrowserRootViewController__multitaskingDragExclusionRects__block_invoke;
    v40 = &unk_1E9CF48B0;
    v42 = &v43;
    v27 = v26;
    v41 = v27;
    v28 = (void (**)(_QWORD, double, double, double, double))_Block_copy(&v37);
    -[BrowserRootViewController view](self, "view", v37, v38, v39, v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    tabBar = self->_tabBar;
    if (tabBar && self->_showingTabBar)
    {
      -[TabBar bounds](self->_tabBar, "bounds");
      -[TabBar convertRect:toView:](tabBar, "convertRect:toView:", v29);
      x = v49.origin.x;
      y = v49.origin.y;
      width = v49.size.width;
      height = v49.size.height;
      v44[3] = CGRectGetMinY(v49);
      v28[2](v28, x, y, width, height);
    }
    -[_SFNavigationBar urlOutlineFrameRelativeToView:](self->_navigationBar, "urlOutlineFrameRelativeToView:", v29);
    ((void (*)(void (**)(_QWORD, double, double, double, double)))v28[2])(v28);
    if (!self->_toolbarPlacement
      && (!-[_SFNavigationBar isExpanded](self->_navigationBar, "isExpanded")
       || !-[_SFNavigationBar usesNarrowLayout](self->_navigationBar, "usesNarrowLayout")))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "barManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "frameForBarItem:inCoordinateSpace:", 3, v29);
      ((void (*)(void (**)(_QWORD, double, double, double, double)))v28[2])(v28);
      objc_msgSend(v36, "frameForBarItem:inCoordinateSpace:", 7, v29);
      ((void (*)(void (**)(_QWORD, double, double, double, double)))v28[2])(v28);

    }
    v5 = (void *)objc_msgSend(v27, "copy");

    _Block_object_dispose(&v43, 8);
  }
  return v5;
}

void __60__BrowserRootViewController__multitaskingDragExclusionRects__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGFloat MaxY;
  double v11;
  void *v12;
  id v13;
  CGRect v14;

  MaxY = CGRectGetMaxY(*(CGRect *)&a2);
  v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (MaxY < v11)
  {
    v14.origin.x = a2;
    v14.origin.y = a3;
    v14.size.width = a4;
    v14.size.height = a5;
    a5 = v11 - CGRectGetMinY(v14);
  }
  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a2, a3, a4, a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

- (UIEdgeInsets)_avoidanceInsets
{
  void *v3;
  double *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat MaxY;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  UIEdgeInsets result;

  -[BrowserRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double *)MEMORY[0x1E0DC49E8];
  -[BrowserRootViewController topBar](self, "topBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[BrowserRootViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v15, v8, v10, v12, v14);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v53.origin.x = v17;
    v53.origin.y = v19;
    v53.size.width = v21;
    v53.size.height = v23;
    MaxY = CGRectGetMaxY(v53);
  }
  else
  {
    MaxY = *v4;
  }
  v25 = v4[1];
  v26 = v4[3];
  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "obscuredInsetsForState:", 0);
  v29 = v28;

  -[BrowserToolbar superview](self->_bottomToolbar, "superview");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[BrowserToolbar frame](self->_bottomToolbar, "frame");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    -[BrowserToolbar superview](self->_bottomToolbar, "superview");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:fromView:", v39, v32, v34, v36, v38);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;

    objc_msgSend(v3, "bounds");
    v48 = CGRectGetMaxY(v54);
    v55.origin.x = v41;
    v55.origin.y = v43;
    v55.size.width = v45;
    v55.size.height = v47;
    v29 = fmax(v48 - CGRectGetMinY(v55), 0.0);
  }

  v49 = MaxY;
  v50 = v25;
  v51 = v29;
  v52 = v26;
  result.right = v52;
  result.bottom = v51;
  result.left = v50;
  result.top = v49;
  return result;
}

- (void)_updateAllowsHidingHomeIndicatorMinimized:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  _BOOL8 v8;

  v3 = a3;
  if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
  {
    -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "layoutStyle");

    v8 = v6 == 2 && v3 && -[BrowserRootViewController _interfaceFillsScreen](self, "_interfaceFillsScreen");
    -[BrowserRootViewController setBarStateAllowsHidingHomeIndicator:](self, "setBarStateAllowsHidingHomeIndicator:", v8);
  }
}

- (void)setBarStateAllowsHidingHomeIndicator:(BOOL)a3
{
  if (self->_barStateAllowsHidingHomeIndicator != a3)
  {
    self->_barStateAllowsHidingHomeIndicator = a3;
    -[BrowserRootViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  }
}

- (void)_updateThemeForBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SFBannerTheme *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "shouldUsePlainTheme"))
  {
    objc_msgSend(MEMORY[0x1E0D4EBC8], "themeWithBarTintStyle:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"));
    v6 = (SFBannerTheme *)objc_claimAutoreleasedReturnValue();
    -[BrowserRootViewController _plainTopBackdropGroupName](self, "_plainTopBackdropGroupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBannerTheme setBackdropGroupName:](v6, "setBackdropGroupName:", v7);

  }
  else
  {
    v6 = self->_bannerTheme;
  }
  objc_msgSend(v8, "setTheme:animated:", v6, v4);

}

- (id)_plainTopBackdropGroupName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Safari.PlainTopBackdrop.%p"), self);
}

- (UIEdgeInsets)_loweredBarObscuredInsets
{
  void *v2;
  double v3;
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
  UIEdgeInsets result;

  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "obscuredInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

id __62__BrowserRootViewController__registerLayoutStateUpdateHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (_SFDeviceIsPad())
    {
      stringForCurrentTabBarLayoutPreference();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("Tab Bar Layout");
    }
    else
    {
      stringForCurrentCapsuleLayoutPreference();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("Capsule Layout");
    }
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

    v5 = (void *)objc_msgSend(v2, "copy");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)showDefaultBrowserSheet
{
  void *v3;
  void *v4;
  id v5;
  SFDefaultBrowserViewController *v6;
  SFDefaultBrowserViewController *defaultBrowserViewController;
  _QWORD v8[5];
  _QWORD v9[5];

  if (!-[BrowserRootViewController isShowingDefaultBrowserSheet](self, "isShowingDefaultBrowserSheet"))
  {
    -[BrowserRootViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0CD55D0]);
      v8[4] = self;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __52__BrowserRootViewController_showDefaultBrowserSheet__block_invoke;
      v9[3] = &unk_1E9CF16A0;
      v9[4] = self;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __52__BrowserRootViewController_showDefaultBrowserSheet__block_invoke_2;
      v8[3] = &unk_1E9CF4900;
      v6 = (SFDefaultBrowserViewController *)objc_msgSend(v5, "initWithViewDidBecomeReady:completion:", v9, v8);
      defaultBrowserViewController = self->_defaultBrowserViewController;
      self->_defaultBrowserViewController = v6;

    }
  }
}

uint64_t __52__BrowserRootViewController_showDefaultBrowserSheet__block_invoke(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "_showWelcomeBrowsingExplanationSheet");
  else
    return objc_msgSend(v2, "dismissDefaultBrowserSheet");
}

uint64_t __52__BrowserRootViewController_showDefaultBrowserSheet__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dismissDefaultBrowserSheetForOtherWindows");
  if (a2 == 1)
    return objc_msgSend(*(id *)(a1 + 32), "dismissDefaultBrowserSheet");
  return result;
}

- (void)dismissDefaultBrowserSheetForOtherWindows
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BrowserRootViewController *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "browserWindowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "browserControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "rootViewController");
        v11 = (BrowserRootViewController *)objc_claimAutoreleasedReturnValue();

        if (v11 != self)
        {
          objc_msgSend(v10, "rootViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dismissDefaultBrowserSheet");

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)dismissDefaultBrowserSheet
{
  UINavigationController **p_defaultBrowserSheet;
  id WeakRetained;
  SFDefaultBrowserViewController *defaultBrowserViewController;

  p_defaultBrowserSheet = &self->_defaultBrowserSheet;
  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultBrowserSheet);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_storeWeak((id *)p_defaultBrowserSheet, 0);
  defaultBrowserViewController = self->_defaultBrowserViewController;
  self->_defaultBrowserViewController = 0;

}

- (void)showLockedPrivateBrowsingView
{
  TabSwitcherViewController *v3;
  void *v4;
  SFLockedPrivateBrowsingView *v5;
  SFLockedPrivateBrowsingView *v6;
  SFLockedPrivateBrowsingView *lockedPrivateBrowsingView;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  if (!-[BrowserRootViewController isShowingLockedPrivateBrowsingView](self, "isShowingLockedPrivateBrowsingView"))
  {
    if (SFEnhancedTabOverviewEnabled())
    {
      v3 = self->_tabSwitcherViewController;
      if (-[TabSwitcherViewController presentationState](v3, "presentationState") == 1)
      {

      }
      else
      {
        v11 = -[TabSwitcherViewController presentationState](v3, "presentationState");

        if (v11 != 2)
          -[TabSwitcherViewController setDismissesOnUnlock:](self->_tabSwitcherViewController, "setDismissesOnUnlock:", 1);
      }
      -[TabSwitcherViewController presentAnimated:](self->_tabSwitcherViewController, "presentAnimated:", 0);
    }
    else
    {
      -[BrowserRootViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = [SFLockedPrivateBrowsingView alloc];
      objc_msgSend(v4, "bounds");
      v6 = -[SFLockedPrivateBrowsingView initWithFrame:](v5, "initWithFrame:");
      lockedPrivateBrowsingView = self->_lockedPrivateBrowsingView;
      self->_lockedPrivateBrowsingView = v6;

      -[SFLockedPrivateBrowsingView setAutoresizingMask:](self->_lockedPrivateBrowsingView, "setAutoresizingMask:", 18);
      objc_msgSend(v4, "addSubview:", self->_lockedPrivateBrowsingView);
      -[ViewWithCustomNextResponder setHidden:](self->_contentContainerView, "setHidden:", 1);
      -[CapsuleNavigationBarViewController view](self->_capsuleViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 1);

      objc_initWeak(&location, self);
      v9 = (void *)MEMORY[0x1E0DC3428];
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __58__BrowserRootViewController_showLockedPrivateBrowsingView__block_invoke;
      v15 = &unk_1E9CF2C28;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v9, "actionWithHandler:", &v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFLockedPrivateBrowsingView setUnlockAction:](self->_lockedPrivateBrowsingView, "setUnlockAction:", v10, v12, v13, v14, v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);

    }
  }
}

void __58__BrowserRootViewController_showLockedPrivateBrowsingView__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 205);
    objc_msgSend(v2, "authenticateToUnlockPrivateBrowsing");

    WeakRetained = v3;
  }

}

- (void)hideLockedPrivateBrowsingView
{
  int v3;
  void *v4;
  TabSwitcherViewController *tabSwitcherViewController;
  void *v6;
  SFLockedPrivateBrowsingView *lockedPrivateBrowsingView;
  void *WeakRetained;

  if (-[BrowserRootViewController isShowingLockedPrivateBrowsingView](self, "isShowingLockedPrivateBrowsingView"))
  {
    if (SFEnhancedTabOverviewEnabled())
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      if (-[TabSwitcherViewController dismissesOnUnlock](self->_tabSwitcherViewController, "dismissesOnUnlock"))
      {
        v3 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");
        v4 = WeakRetained;
        if (!v3)
        {
LABEL_9:

          return;
        }
        tabSwitcherViewController = self->_tabSwitcherViewController;
        objc_msgSend(WeakRetained, "scene");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabSwitcherViewController dismissForUnlockingAnimated:](tabSwitcherViewController, "dismissForUnlockingAnimated:", (unint64_t)objc_msgSend(v6, "activationState") < 2);

      }
    }
    else
    {
      -[SFLockedPrivateBrowsingView removeFromSuperview](self->_lockedPrivateBrowsingView, "removeFromSuperview");
      lockedPrivateBrowsingView = self->_lockedPrivateBrowsingView;
      self->_lockedPrivateBrowsingView = 0;

      -[ViewWithCustomNextResponder setHidden:](self->_contentContainerView, "setHidden:", 0);
      -[CapsuleNavigationBarViewController view](self->_capsuleViewController, "view");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setHidden:", 0);
    }
    v4 = WeakRetained;
    goto LABEL_9;
  }
}

- (BOOL)isShowingLockedPrivateBrowsingView
{
  void *WeakRetained;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  SFLockedPrivateBrowsingView *lockedPrivateBrowsingView;

  if ((SFTabGroupSwitcherEnabled() & 1) == 0 && !SFEnhancedTabOverviewEnabled())
    goto LABEL_7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabCollectionViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabThumbnailCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "presentationState") == 1)
  {

    v6 = 1;
LABEL_9:

    return v6;
  }
  v7 = objc_msgSend(v5, "presentationState");

  if (v7 != 2)
  {
LABEL_7:
    lockedPrivateBrowsingView = self->_lockedPrivateBrowsingView;
    if (!lockedPrivateBrowsingView)
      return 0;
    -[SFLockedPrivateBrowsingView superview](lockedPrivateBrowsingView, "superview");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v6 = WeakRetained != 0;
    goto LABEL_9;
  }
  return 1;
}

- (void)showWhatsNewInPrivateBrowsingSheet
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[BrowserRootViewController isShowingPrivateBrowsingExplanationSheet](self, "isShowingPrivateBrowsingExplanationSheet"))
  {
    -[BrowserRootViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setInteger:forKey:", 1, *MEMORY[0x1E0D8B2C0]);

      -[BrowserRootViewController _makeWhatsNewInPrivateBrowsingViewController](self, "_makeWhatsNewInPrivateBrowsingViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[BrowserRootViewController _showPrivateBrowsingExplanationSheetWithViewController:](self, "_showPrivateBrowsingExplanationSheetWithViewController:", v6);

    }
  }
}

- (id)_makeWhatsNewInPrivateBrowsingViewController
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)getOBWelcomeControllerClass());
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithTitle:detailText:icon:", v3, 0, 0);

  v5 = (void *)MEMORY[0x1E0D8AB18];
  objc_msgSend(MEMORY[0x1E0D8AB10], "defaultConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemsForConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "message");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "image");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addBulletedListItemWithTitle:description:image:tintColor:", v14, v15, v16, v17);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  objc_msgSend(getOBBoldTrayButtonClass(), "boldButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTarget:action:", self, sel__pushTurnOnLockedPrivateBrowsingPromptIfNeeded);
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:forState:", v19, 0);

  objc_msgSend(v4, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v18);

  return v4;
}

- (void)showTurnOnLockedPrivateBrowsingSheet
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[BrowserRootViewController isShowingPrivateBrowsingExplanationSheet](self, "isShowingPrivateBrowsingExplanationSheet"))
  {
    -[BrowserRootViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBool:forKey:", 1, *MEMORY[0x1E0D8AFE0]);

      -[BrowserRootViewController _makeTurnOnLockedPrivateBrowsingViewController](self, "_makeTurnOnLockedPrivateBrowsingViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[BrowserRootViewController _showPrivateBrowsingExplanationSheetWithViewController:](self, "_showPrivateBrowsingExplanationSheetWithViewController:", v6);

    }
  }
}

- (void)_pushTurnOnLockedPrivateBrowsingPromptIfNeeded
{
  id WeakRetained;
  char v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = objc_msgSend(WeakRetained, "shouldShowTurnOnLockedPrivateBrowsingSheet");

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", 1, *MEMORY[0x1E0D8AFE0]);

    v7 = objc_loadWeakRetained((id *)&self->_privateBrowsingExplanationSheet);
    -[BrowserRootViewController _makeTurnOnLockedPrivateBrowsingViewController](self, "_makeTurnOnLockedPrivateBrowsingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, 1);

  }
  else
  {
    -[BrowserRootViewController _dismissPrivateBrowsingExplanationSheet](self, "_dismissPrivateBrowsingExplanationSheet");
  }
}

- (id)_makeTurnOnLockedPrivateBrowsingViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v3 = (void *)MEMORY[0x1E0D8AB18];
  objc_msgSend(MEMORY[0x1E0D8AB10], "defaultConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockedPrivateBrowsingPromptForConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc((Class)getOBWelcomeControllerClass());
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithTitle:detailText:icon:", v7, v8, v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v11);

  objc_msgSend(getOBBoldTrayButtonClass(), "boldButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__turnOnLockedPrivateBrowsingFromSheet, 0x2000);
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v14, 0);

  objc_msgSend(v10, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addButton:", v13);

  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v16 = (void *)getOBLinkTrayButtonClass_softClass;
  v27 = getOBLinkTrayButtonClass_softClass;
  if (!getOBLinkTrayButtonClass_softClass)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __getOBLinkTrayButtonClass_block_invoke;
    v23[3] = &unk_1E9CF1780;
    v23[4] = &v24;
    __getOBLinkTrayButtonClass_block_invoke((uint64_t)v23);
    v16 = (void *)v25[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v17, "linkButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__dismissPrivateBrowsingExplanationSheet, 0x2000);
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:forState:", v19, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTintColor:", v20);

  objc_msgSend(v10, "buttonTray");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addButton:", v18);

  return v10;
}

- (void)_turnOnLockedPrivateBrowsingFromSheet
{
  void *v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id location;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", 1, *MEMORY[0x1E0D8B2C8]);

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_privateBrowsingExplanationSheet);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__BrowserRootViewController__turnOnLockedPrivateBrowsingFromSheet__block_invoke;
  v5[3] = &unk_1E9CF25A0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__BrowserRootViewController__turnOnLockedPrivateBrowsingFromSheet__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 205);
    objc_msgSend(v2, "authenticateToUnlockPrivateBrowsing");

    WeakRetained = v3;
  }

}

- (void)_dismissPrivateBrowsingExplanationSheet
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_privateBrowsingExplanationSheet);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_showWelcomeBrowsingExplanationSheet
{
  id obj;

  if (self->_defaultBrowserViewController)
  {
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_defaultBrowserViewController);
    objc_msgSend(obj, "setModalPresentationStyle:", 1);
    objc_msgSend(obj, "setNavigationBarHidden:", 1);
    objc_msgSend(obj, "setModalInPresentation:", 1);
    -[BrowserRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", obj, 1, 0);
    objc_msgSend(obj, "setDelegate:", self->_defaultBrowserViewController);
    objc_storeWeak((id *)&self->_defaultBrowserSheet, obj);

  }
}

- (void)_showPrivateBrowsingExplanationSheetWithViewController:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = (objc_class *)MEMORY[0x1E0DC3A40];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  objc_msgSend(v6, "setNavigationBarHidden:", 1);
  objc_msgSend(v6, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(v6, "sheetPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__BrowserRootViewController__showPrivateBrowsingExplanationSheetWithViewController___block_invoke;
  v8[3] = &unk_1E9CF1900;
  v8[4] = self;
  -[BrowserRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, v8);
  objc_storeWeak((id *)&self->_privateBrowsingExplanationSheet, v6);

}

void __84__BrowserRootViewController__showPrivateBrowsingExplanationSheetWithViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1640));
  objc_msgSend(WeakRetained, "resetWhatsNewInPrivateBrowsingStartPageModule");

}

void __46__BrowserRootViewController__layOutTopBanners__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  int *v6;
  double Width;
  double v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMargins");
  objc_msgSend(v9, "setLayoutMargins:");

  v6 = &OBJC_IVAR___BrowserRootViewController__scrollView;
  if (*(_QWORD *)(a1 + 40) > a3)
    v6 = &OBJC_IVAR___BrowserRootViewController__documentAndTopBarsContainerView;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + *v6), "addSubview:", v9);
  Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  objc_msgSend(v9, "sizeThatFits:", Width, 0.0);
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, Width, v8);

}

void __46__BrowserRootViewController__layOutTopBanners__block_invoke_121(uint64_t a1, void *a2, unint64_t a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double MinX;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  float v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  float v33;
  void *v34;
  void *v35;
  double MaxY;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  id v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v45 = a2;
  objc_msgSend(v45, "bounds");
  v7 = v6;
  v9 = v8;
  MinX = CGRectGetMinX(*(CGRect *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1624), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v13 = v11 + v12;
  v16 = v14 + v15;
  if (*(_QWORD *)(a1 + 96) == a3)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 104)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
  v17 = MinX + v11;
  v18 = v7 - v13;
  v19 = v9 - v16;
  v20 = objc_msgSend(v45, "isPinnedToTop");
  v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v20)
  {
    objc_msgSend(v45, "pinnedOffset");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v24 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1624), "contentOffset");
      v26 = v25;
      objc_msgSend(v45, "pinnedOffset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v21 = fmax(v23, v24 - fmax(v26 - v28, 0.0));

      v29 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1624), "contentOffset");
      v31 = v30;
      objc_msgSend(v45, "pinnedOffset");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      objc_msgSend(v29, "numberWithDouble:", fmin(v31, v33));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setPinnedOffset:", v34);

    }
  }
  else if (v21 >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
         || *(double *)(a1 + 104) != 0.0 && *(_QWORD *)(a1 + 96) <= a3)
  {
    v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  objc_msgSend(v45, "superview");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "convertRect:fromView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1624), v17, v21, v18, v19);
  objc_msgSend(v45, "setFrame:");

  v46.origin.x = v17;
  v46.origin.y = v21;
  v46.size.width = v18;
  v46.size.height = v19;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = fmax(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24), CGRectGetMaxY(v46));
  v47.origin.x = v17;
  v47.origin.y = v21;
  v47.size.width = v18;
  v47.size.height = v19;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetHeight(v47)
                                                               + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 24);
  v48.origin.x = v17;
  v48.origin.y = v21;
  v48.size.width = v18;
  v48.size.height = v19;
  MaxY = CGRectGetMaxY(v48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1624), "contentOffset");
  v38 = v37;
  objc_msgSend(*(id *)(a1 + 32), "_loweredBarMinimumObscuredInsets");
  v40 = v39;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1624), "safeAreaInsets");
  if (MaxY > v38 + fmax(v40, v41))
  {
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v44 = *(_QWORD *)(v42 + 40);
    v43 = (id *)(v42 + 40);
    if (!v44)
      objc_storeStrong(v43, a2);
  }

}

- (CGRect)_convertRect:(CGRect)a3 fromViewInDocumentContainer:(id)a4 toCoordinateSpace:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  SFOrderedContainerView *documentAndTopBarsContainerView;
  id v13;
  ViewWithCustomNextResponder *v14;
  ViewWithCustomNextResponder *contentContainerView;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
  v13 = a4;
  -[SFOrderedContainerView superview](documentAndTopBarsContainerView, "superview");
  v14 = (ViewWithCustomNextResponder *)objc_claimAutoreleasedReturnValue();
  contentContainerView = self->_contentContainerView;

  if (v14 == contentContainerView)
  {
    objc_msgSend(v13, "convertRect:toCoordinateSpace:", v11, x, y, width, height);
    v25 = v32;
    v27 = v33;
    v29 = v34;
    v31 = v35;

  }
  else
  {
    objc_msgSend(v13, "convertRect:toView:", self->_documentAndTopBarsContainerView, x, y, width, height);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v11, v17, v19, v21, v23);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
  }

  v36 = v25;
  v37 = v27;
  v38 = v29;
  v39 = v31;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (double)navigationBarSquishedHeight
{
  BOOL v3;
  double result;

  v3 = -[BrowserRootViewController _interfaceFillsScreen](self, "_interfaceFillsScreen");
  result = 0.0;
  if (!v3)
  {
    if (-[BrowserRootViewController usingUnifiedBar](self, "usingUnifiedBar", 0.0))
    {
      -[SFUnifiedBar squishedHeight](self->_unifiedBar, "squishedHeight");
    }
    else if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
    {
      -[BrowserRootViewController _loweredBarMinimumObscuredInsets](self, "_loweredBarMinimumObscuredInsets");
    }
    else
    {
      -[_SFNavigationBar minimumHeight](self->_navigationBar, "minimumHeight");
    }
  }
  return result;
}

- (CGRect)_frameForNavigationBar
{
  CGFloat MaxX;
  double v4;
  double v5;
  double v6;
  double Width;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  if (-[BrowserRootViewController _shouldHideUnifiedBar](self, "_shouldHideUnifiedBar"))
  {
    MaxX = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
    Width = CGRectGetWidth(v24);
    v4 = 0.0;
    MaxX = 0.0;
    v8 = 0.0;
    if (self->_showingSidebar && !self->_sidebarStyle)
    {
      -[BrowserRootViewController _frameForSidebarWhenShowing:](self, "_frameForSidebarWhenShowing:", 1);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      if (-[SFOrderedContainerView _sf_usesLeftToRightLayout](self->_documentAndTopBarsContainerView, "_sf_usesLeftToRightLayout"))
      {
        v25.origin.x = v10;
        v25.origin.y = v12;
        v25.size.width = v14;
        v25.size.height = v16;
        MaxX = CGRectGetMaxX(v25);
      }
      v26.origin.x = v10;
      v26.origin.y = v12;
      v26.size.width = v14;
      v26.size.height = v16;
      v8 = CGRectGetWidth(v26);
    }
    -[_SFDynamicBarAnimator topBarHeight](self->_dynamicBarAnimator, "topBarHeight");
    v6 = v17;
    if (!-[BrowserRootViewController insetsContentContainerFromStatusBar](self, "insetsContentContainerFromStatusBar"))
    {
      -[BrowserRootViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safeAreaInsets");
      v4 = v19;

    }
    if (-[BrowserRootViewController usingLoweredBar](self, "usingLoweredBar"))
      v4 = -v6;
    if (-[BrowserRootViewController _interfaceFillsScreen](self, "_interfaceFillsScreen"))
    {
      -[BrowserRootViewController navigationBarDesiredHeight](self, "navigationBarDesiredHeight");
      v4 = v4 + v6 - v20;
      v6 = v20;
    }
    v5 = Width - v8;
  }
  v21 = MaxX;
  v22 = v4;
  v23 = v6;
  result.size.height = v23;
  result.size.width = v5;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

uint64_t __58__BrowserRootViewController__updateTopBarAllowingRemoval___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1528), "setUsesNarrowLayout:", objc_msgSend(*(id *)(a1 + 40), "usesNarrowLayout"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1528), "setExpanded:completionHandler:", objc_msgSend(*(id *)(a1 + 40), "favoritesFieldShouldBeExpanded"), 0);
}

- (CGRect)_frameForBottomToolbarForceHidden:(BOOL)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double Height;
  CGFloat Width;
  id WeakRetained;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  -[ViewWithCustomNextResponder bounds](self->_contentContainerView, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_SFToolbar sizeThatFits:](self->_bottomToolbar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v14 = v13;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  Height = CGRectGetHeight(v25);
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  Width = CGRectGetWidth(v26);
  if (self->_toolbarPlacement == 1 && !a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v18 = objc_msgSend(WeakRetained, "browserViewControllerShouldTemporarilyHideBottomToolbar:", self);

    if ((v18 & 1) == 0)
    {
      -[BrowserRootViewController _sf_bottomUnsafeAreaFrameForToolbar](self, "_sf_bottomUnsafeAreaFrameForToolbar");
      v19 = CGRectGetHeight(v27);
      -[_SFDynamicBarAnimator bottomBarOffset](self->_dynamicBarAnimator, "bottomBarOffset");
      Height = Height - (v14 + v19 - v20);
      if (-[BrowserRootViewController _shouldPositionBottomToolbarAboveKeyboard](self, "_shouldPositionBottomToolbarAboveKeyboard"))
      {
        Height = Height - fmax(self->_bottomBarKeyboardOffset - v19, 0.0);
      }
    }
  }
  v21 = 0.0;
  v22 = Height;
  v23 = Width;
  v24 = v14;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)_shouldPositionBottomToolbarAboveKeyboard
{
  void *v2;
  char v3;

  -[BrowserRootViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_sf_isFullScreenWidth") ^ 1;

  return v3;
}

- (void)updateCapsuleLayoutStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredCapsuleLayoutStyle");
  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutStyle:", v4);

  -[CatalogViewController reloadNavigationItemAnimated:](self->_catalogViewController, "reloadNavigationItemAnimated:", 0);
  -[BrowserRootViewController _updateTopBarStyles](self, "_updateTopBarStyles");
  -[SFOrderedContainerView window](self->_documentAndTopBarsContainerView, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[BrowserRootViewController updateOrderedSubviewsForOrderedContainerView:](self, "updateOrderedSubviewsForOrderedContainerView:", self->_documentAndTopBarsContainerView);
  -[BrowserRootViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)_layOutFloatingSidebarButtonForSidebarShowing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  UIButton *sidebarButtonEmbeddedInSidebar;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MinY;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  CGRect rect;
  void *v44;
  BrowserRootViewController *v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v3 = a3;
  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFloatingSidebarButtonEnabled");

  if (v6)
  {
    v7 = -[_SFDynamicBarAnimator state](self->_dynamicBarAnimator, "state") == 1
       ? -[_SFDynamicBarAnimator isTrackingDrag](self->_dynamicBarAnimator, "isTrackingDrag") ^ 1
       : 0;
    v8 = self->_sidebarStyle ? 0 : v7;
    -[BrowserRootViewController _setShowingFloatingSidebarButton:](self, "_setShowingFloatingSidebarButton:", v8);
    if ((_DWORD)v8 == 1)
    {
      *(_QWORD *)&rect.origin.y = MEMORY[0x1E0C809B0];
      *(_QWORD *)&rect.size.width = 3221225472;
      *(_QWORD *)&rect.size.height = __75__BrowserRootViewController__layOutFloatingSidebarButtonForSidebarShowing___block_invoke;
      v44 = &unk_1E9CF4978;
      v45 = self;
      v9 = _Block_copy(&rect.origin.y);
      WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
      if (v3)
      {
        sidebarButtonEmbeddedInSidebar = self->_sidebarButtonEmbeddedInSidebar;
        -[UIButton bounds](sidebarButtonEmbeddedInSidebar, "bounds");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        -[SidebarViewController view](self->_sidebarViewController, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton convertRect:toView:](sidebarButtonEmbeddedInSidebar, "convertRect:toView:", v20, v13, v15, v17, v19);
        rect.origin.x = v21;
        v23 = v22;
        v25 = v24;
        v27 = v26;

        -[BrowserRootViewController _frameForSidebarWhenShowing:](self, "_frameForSidebarWhenShowing:", 1);
        x = v46.origin.x;
        y = v46.origin.y;
        width = v46.size.width;
        height = v46.size.height;
        MinX = CGRectGetMinX(v46);
        v47.origin.x = x;
        v47.origin.y = y;
        v47.size.width = width;
        v47.size.height = height;
        MinY = CGRectGetMinY(v47);
        v48.origin.x = rect.origin.x;
        v48.origin.y = v23;
        v48.size.width = v25;
        v48.size.height = v27;
        v49 = CGRectOffset(v48, MinX, MinY);
        -[UIButton setFrame:](self->_floatingSidebarButton, "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
        -[UIButton setTintColor:](self->_floatingSidebarButton, "setTintColor:", 0);
LABEL_24:
        -[UIButton layoutIfNeeded](self->_floatingSidebarButton, "layoutIfNeeded", *(_QWORD *)&rect.origin.x);

        return;
      }
      if (SFEnhancedTabOverviewEnabled())
      {
        v34 = WeakRetained;
        if (objc_msgSend(v34, "presentationState") == 1)
        {

          goto LABEL_15;
        }
        v35 = objc_msgSend(v34, "presentationState");

        if (v35 == 2)
        {
LABEL_15:
          -[TabSwitcherViewController sidebarToggleBarButtonItem](self->_tabSwitcherViewController, "sidebarToggleBarButtonItem");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "view");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v37, "subviews");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "firstObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v39, "_imageView");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(void *, void *))v9 + 2))(v9, v40);

          }
          else
          {
            (*((void (**)(void *, void *))v9 + 2))(v9, v37);
          }
          goto LABEL_22;
        }
      }
      v41 = WeakRetained;
      if (objc_msgSend(v41, "presentationState") == 1)
      {

      }
      else
      {
        v42 = objc_msgSend(v41, "presentationState");

        if (v42 != 2)
        {
          if (!-[BrowserRootViewController _shouldHideUnifiedBar](self, "_shouldHideUnifiedBar"))
          {
            (*((void (**)(void *, UIView *))v9 + 2))(v9, self->_sidebarButtonEmbeddedInUnifiedBar);
            goto LABEL_24;
          }
          -[CatalogViewController sidebarButton](self->_catalogViewController, "sidebarButton");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, void *))v9 + 2))(v9, v37);
          goto LABEL_23;
        }
      }
      objc_msgSend(v41, "toolbar");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "rectForBarButton:", 4);
      objc_msgSend(v37, "convertRect:toView:", self->_contentContainerView);
      -[UIButton setFrame:](self->_floatingSidebarButton, "setFrame:");
      objc_msgSend(v37, "resolvedTintColorForBarButton:", 4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](self->_floatingSidebarButton, "setTintColor:", v39);
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
  }
}

void __75__BrowserRootViewController__layOutFloatingSidebarButtonForSidebarShowing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "convertRect:toView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1600), "setFrame:");
  objc_msgSend(v3, "tintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resolvedColorWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1600), "setTintColor:", v5);

}

- (void)_statusBarHover:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL8 v8;

  objc_msgSend(a3, "locationInView:", self->_statusBarView);
  v5 = v4;
  v7 = v6;
  -[SFWebpageStatusBarView setHoverPoint:](self->_statusBarView, "setHoverPoint:");
  v8 = v7 == *(double *)(MEMORY[0x1E0C9D538] + 8) && v5 == *MEMORY[0x1E0C9D538];
  -[SFWebpageStatusBarView setSuppressShowingStatusBar:](self->_statusBarView, "setSuppressShowingStatusBar:", v8);
}

- (void)updateUsesWebpageStatusBar
{
  SFWebpageStatusBarView *statusBarView;
  UIHoverGestureRecognizer *statusBarHoverGestureRecognizer;

  if (-[BrowserRootViewController _usesWebpageStatusBar](self, "_usesWebpageStatusBar"))
  {
    -[BrowserRootViewController _setUpWebpageStatusBarIfNeeded](self, "_setUpWebpageStatusBarIfNeeded");
  }
  else
  {
    -[SFWebpageStatusBarView removeFromSuperview](self->_statusBarView, "removeFromSuperview");
    statusBarView = self->_statusBarView;
    self->_statusBarView = 0;

    if (self->_statusBarHoverGestureRecognizer)
    {
      -[SFOrderedContainerView removeGestureRecognizer:](self->_documentAndTopBarsContainerView, "removeGestureRecognizer:");
      statusBarHoverGestureRecognizer = self->_statusBarHoverGestureRecognizer;
      self->_statusBarHoverGestureRecognizer = 0;

    }
  }
}

id __49__BrowserRootViewController__setUpTabGroupButton__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_loadWeakRetained(WeakRetained + 205);
    objc_msgSend(v3, "reportIOSToolbarButtonUsage:withLayout:", 6, objc_msgSend(v4, "analyticsLayoutProvenance"));

    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTabGroupMenu");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_sidebarTrailingButtonWasTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "sidebarTrailingButtonWasTapped");

}

- (void)_updateSidebarStyle
{
  id WeakRetained;
  void *v4;
  char v5;
  int64_t sidebarStyle;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _QWORD v11[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (self->_showingSidebar)
  {
    v10 = WeakRetained;
    v5 = objc_opt_respondsToSelector();
    v4 = v10;
    if ((v5 & 1) != 0)
    {
      sidebarStyle = self->_sidebarStyle;
      -[BrowserRootViewController view](self, "view", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "frame");
      self->_sidebarStyle = objc_msgSend(v10, "browserViewController:sidebarStyleForViewSize:", self, v8, v9);

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __48__BrowserRootViewController__updateSidebarStyle__block_invoke;
      v11[3] = &unk_1E9CF1900;
      v11[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11);
      if (sidebarStyle != self->_sidebarStyle)
      {
        -[BrowserRootViewController _setShowingFloatingSidebarButton:](self, "_setShowingFloatingSidebarButton:", 0);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "browserViewController:didChangeSidebarStyle:", self, self->_sidebarStyle);
      }
      v4 = v10;
    }
  }

}

uint64_t __48__BrowserRootViewController__updateSidebarStyle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createSidebarContentDimmingViewIfNeeded");
}

- (void)_createSidebarContentDimmingViewIfNeeded
{
  SidebarContentDimmingView *v3;
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
  SidebarContentDimmingView *v16;
  SidebarContentDimmingView *sidebarContentDimmingView;
  void *v18;

  if (!self->_sidebarContentDimmingView)
  {
    if (-[BrowserRootViewController _shouldShowSidebarContentDimmingView](self, "_shouldShowSidebarContentDimmingView"))
    {
      v3 = [SidebarContentDimmingView alloc];
      -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      -[BrowserRootViewController _sidebarDimmedContentFrameIncludingSidebarOnlyIfEmbedded:](self, "_sidebarDimmedContentFrameIncludingSidebarOnlyIfEmbedded:", 1);
      v16 = -[SidebarContentDimmingView initWithFrame:dimmedContentFrame:](v3, "initWithFrame:dimmedContentFrame:", v5, v7, v9, v11, v12, v13, v14, v15);
      sidebarContentDimmingView = self->_sidebarContentDimmingView;
      self->_sidebarContentDimmingView = v16;

      -[SidebarContentDimmingView setTransparent:](self->_sidebarContentDimmingView, "setTransparent:", 1);
      -[SidebarViewController view](self->_sidebarViewController, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SidebarContentDimmingView setPassthroughView:](self->_sidebarContentDimmingView, "setPassthroughView:", v18);

      -[SidebarContentDimmingView setDelegate:](self->_sidebarContentDimmingView, "setDelegate:", self);
      -[ViewWithCustomNextResponder insertSubview:aboveSubview:](self->_contentContainerView, "insertSubview:aboveSubview:", self->_sidebarContentDimmingView, self->_documentAndTopBarsContainerView);
    }
  }
}

- (void)_destroySidebarContentDimmingViewIfNeeded
{
  SidebarContentDimmingView *sidebarContentDimmingView;

  if (self->_sidebarContentDimmingView)
  {
    if (!-[BrowserRootViewController _shouldShowSidebarContentDimmingView](self, "_shouldShowSidebarContentDimmingView"))
    {
      -[SidebarContentDimmingView removeFromSuperview](self->_sidebarContentDimmingView, "removeFromSuperview");
      sidebarContentDimmingView = self->_sidebarContentDimmingView;
      self->_sidebarContentDimmingView = 0;

    }
  }
}

- (SFThemeColorEffectView)topBackdrop
{
  return self->_topBackdrop;
}

- (void)_transitionFromBanner:(id)a3 toBanner:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  double v27;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  id v35;
  double v36;
  double v37;
  _QWORD v38[4];
  id v39;
  BrowserRootViewController *v40;
  id v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[BrowserRootViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

  v11 = objc_msgSend(v9, "separableFromStatusBar");
  v12 = &OBJC_IVAR___BrowserRootViewController__documentAndTopBarsContainerView;
  if (v11)
    v12 = &OBJC_IVAR___BrowserRootViewController__scrollView;
  v13 = *(id *)((char *)&self->super.super.super.isa + *v12);
  if (v9)
  {
    -[BrowserRootViewController _updateThemeForBanner:animated:](self, "_updateThemeForBanner:animated:", v9, 0);
    objc_msgSend(v9, "setShowsTopSeparator:", 0);
    -[BrowserRootViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutMargins");
    objc_msgSend(v9, "setLayoutMargins:");

    objc_msgSend(v13, "addSubview:", v9);
  }
  -[SFOrderedContainerView bounds](self->_documentAndTopBarsContainerView, "bounds");
  objc_msgSend(v9, "sizeThatFits:", CGRectGetWidth(v49), 0.0);
  v16 = v15;
  objc_msgSend(v13, "bounds");
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, CGRectGetWidth(v50), v16);
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v18 = v17;
  v20 = v19;
  if (v9 && (objc_msgSend(v9, "isInitiallyBehindNavigationBar") & 1) == 0)
  {
    -[BrowserRootViewController navigationBarFrameInCoordinateSpace:](self, "navigationBarFrameInCoordinateSpace:", self->_documentAndTopBarsContainerView);
    v21 = -CGRectGetMaxY(v51);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[BrowserRootViewController managedTopBanners](self, "managedTopBanners");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "bounds");
          v21 = v21 - CGRectGetHeight(v52);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v24);
    }

    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    if (v27 - v21 <= v16 && v27 - v21 > 0.0)
      v20 = v21;
  }
  if (a5)
  {
    v29 = (void *)MEMORY[0x1E0DC3F10];
    v30 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke;
    v38[3] = &unk_1E9CF2B48;
    v39 = v9;
    v40 = self;
    v42 = v16;
    v41 = v13;
    objc_msgSend(v29, "performWithoutAnimation:", v38);
    v31 = (void *)MEMORY[0x1E0DC3F10];
    v34[0] = v30;
    v34[1] = 3221225472;
    v34[2] = __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke_2;
    v34[3] = &unk_1E9CF49C8;
    v34[4] = self;
    v36 = v18;
    v37 = v20;
    v35 = v8;
    v32[0] = v30;
    v32[1] = 3221225472;
    v32[2] = __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke_3;
    v32[3] = &unk_1E9CF16A0;
    v33 = v35;
    objc_msgSend(v31, "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v34, v32);

  }
  else
  {
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v18, v20);
    objc_msgSend(v8, "removeFromSuperview");
  }

}

uint64_t __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  CGRect v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1624);
  objc_msgSend(v2, "contentOffset");
  v4 = v3 - *(double *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1216), "bounds");
  objc_msgSend(v2, "convertRect:toView:", *(_QWORD *)(a1 + 48), 0.0, v4, CGRectGetWidth(v6), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGFloat v3;
  double Width;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1624), "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v3 = -CGRectGetHeight(v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "bounds");
  Width = CGRectGetWidth(v7);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", 0.0, v3, Width, CGRectGetHeight(v8));
}

uint64_t __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)bannerController:(id)a3 didSetAppBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  if (a4 != a5)
    -[BrowserRootViewController _transitionFromBanner:toBanner:animated:](self, "_transitionFromBanner:toBanner:animated:", a5, a4, a6);
}

- (void)bannerController:(id)a3 didSetCrashBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  if (a4 != a5)
  {
    v6 = a6;
    v9 = a5;
    v13 = a4;
    objc_msgSend(v13, "setPinnedToTop:", 1);
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    objc_msgSend(v10, "numberWithDouble:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPinnedOffset:", v12);

    -[BrowserRootViewController _transitionFromBanner:toBanner:animated:](self, "_transitionFromBanner:toBanner:animated:", v9, v13, v6);
  }
}

- (void)bannerController:(id)a3 didSetWebExtensionBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void (**v10)(_QWORD);
  CapsuleNavigationBarViewController *capsuleViewController;
  uint64_t v12;
  _QWORD aBlock[5];

  v6 = a6;
  v9 = a4;
  if (v9 != a5)
  {
    objc_msgSend(a5, "removeFromSuperview");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__BrowserRootViewController_bannerController_didSetWebExtensionBanner_previousBanner_animated___block_invoke;
    aBlock[3] = &unk_1E9CF1900;
    aBlock[4] = self;
    v10 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (v9)
    {
      -[BrowserRootViewController _updateThemeForBanner:animated:](self, "_updateThemeForBanner:animated:", v9, v6);
      capsuleViewController = self->_capsuleViewController;
      if (capsuleViewController)
        v12 = -[CapsuleNavigationBarViewController capsuleIsFocused](capsuleViewController, "capsuleIsFocused");
      else
        v12 = 0;
      objc_msgSend(v9, "setHidden:", v12);
      objc_msgSend(v9, "setPinnedToTop:", 1);
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v9);
    }
    v10[2](v10);

  }
}

void __95__BrowserRootViewController_bannerController_didSetWebExtensionBanner_previousBanner_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (void)bannerController:(id)a3 didSetRemotelyEnabledExtensionBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  CapsuleNavigationBarViewController *capsuleViewController;
  uint64_t v13;
  _QWORD aBlock[5];

  v6 = a6;
  v9 = a4;
  if (v9 != a5)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __107__BrowserRootViewController_bannerController_didSetRemotelyEnabledExtensionBanner_previousBanner_animated___block_invoke;
    aBlock[3] = &unk_1E9CF1900;
    aBlock[4] = self;
    v10 = a5;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v10, "removeFromSuperview");

    if (v9)
    {
      -[BrowserRootViewController _updateThemeForBanner:animated:](self, "_updateThemeForBanner:animated:", v9, v6);
      capsuleViewController = self->_capsuleViewController;
      if (capsuleViewController)
        v13 = -[CapsuleNavigationBarViewController capsuleIsFocused](capsuleViewController, "capsuleIsFocused");
      else
        v13 = 0;
      objc_msgSend(v9, "setHidden:", v13);
      objc_msgSend(v9, "setPinnedToTop:", 1);
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v9);
    }
    v11[2](v11);

  }
}

void __107__BrowserRootViewController_bannerController_didSetRemotelyEnabledExtensionBanner_previousBanner_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (void)bannerController:(id)a3 didSetWebExtensionPermissionGrantedBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  CapsuleNavigationBarViewController *capsuleViewController;
  uint64_t v13;
  _QWORD aBlock[5];

  v6 = a6;
  v9 = a4;
  if (v9 != a5)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __112__BrowserRootViewController_bannerController_didSetWebExtensionPermissionGrantedBanner_previousBanner_animated___block_invoke;
    aBlock[3] = &unk_1E9CF1900;
    aBlock[4] = self;
    v10 = a5;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v10, "removeFromSuperview");

    if (v9)
    {
      -[BrowserRootViewController _updateThemeForBanner:animated:](self, "_updateThemeForBanner:animated:", v9, v6);
      capsuleViewController = self->_capsuleViewController;
      if (capsuleViewController)
        v13 = -[CapsuleNavigationBarViewController capsuleIsFocused](capsuleViewController, "capsuleIsFocused");
      else
        v13 = 0;
      objc_msgSend(v9, "setHidden:", v13);
      objc_msgSend(v9, "setPinnedToTop:", 1);
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v9);
    }
    v11[2](v11);

  }
}

void __112__BrowserRootViewController_bannerController_didSetWebExtensionPermissionGrantedBanner_previousBanner_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (void)bannerController:(id)a3 didSetPrivateBrowsingPrivacyProtectionsBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  if (a4 != a5)
  {
    v6 = a6;
    v9 = a5;
    v13 = a4;
    objc_msgSend(v13, "setPinnedToTop:", 1);
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    objc_msgSend(v10, "numberWithDouble:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPinnedOffset:", v12);

    -[BrowserRootViewController _transitionFromBanner:toBanner:animated:](self, "_transitionFromBanner:toBanner:animated:", v9, v13, v6);
  }
}

- (void)bannerController:(id)a3 didSetTabGroupBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  if (a4 != a5)
    -[BrowserRootViewController _transitionFromBanner:toBanner:animated:](self, "_transitionFromBanner:toBanner:animated:", a5, a4, a6);
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  int v4;
  int v5;
  BOOL v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  ViewWithCustomNextResponder *contentContainerView;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v4 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled", a3);
  v5 = v4;
  if (self->_capsuleViewController)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __54__BrowserRootViewController__keyboardWillChangeFrame___block_invoke;
    v31[3] = &unk_1E9CF1900;
    v31[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v31);
  }
  -[BrowserRootViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyboardSceneDelegate");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v29 == v8)
    objc_msgSend(v29, "visibleFrameInView:", 0);
  else
    objc_msgSend(v29, "visibleInputViewFrameInView:", 0);
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  contentContainerView = self->_contentContainerView;
  -[ViewWithCustomNextResponder window](contentContainerView, "window", v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "screen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "coordinateSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ViewWithCustomNextResponder convertRect:fromCoordinateSpace:](contentContainerView, "convertRect:fromCoordinateSpace:", v20, v13, v14, v15, v16);
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[ViewWithCustomNextResponder bounds](self->_contentContainerView, "bounds");
  v34.origin.x = 0.0;
  v34.origin.y = v22;
  v34.size.width = v24;
  v34.size.height = v26;
  v33 = CGRectIntersection(v32, v34);
  self->_bottomBarKeyboardOffset = CGRectGetHeight(v33);
  if (!self->_capsuleViewController)
  {
    -[BrowserRootViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setNeedsLayout");

    if (v5)
    {
      -[BrowserRootViewController view](self, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "layoutIfNeeded");

    }
  }

}

void __54__BrowserRootViewController__keyboardWillChangeFrame___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)addToastViewController:(id)a3
{
  SFToastViewController *v4;
  SFToastViewController *currentlyPresentedToastViewController;
  SFOrderedContainerView *documentAndTopBarsContainerView;
  void *v7;
  SFToastViewController *v8;

  v4 = (SFToastViewController *)a3;
  -[BrowserRootViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[UIViewController addChildViewController:](self->_documentAndTopBarsContainerViewController, "addChildViewController:", v4);
  currentlyPresentedToastViewController = self->_currentlyPresentedToastViewController;
  self->_currentlyPresentedToastViewController = v4;
  v8 = v4;

  documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
  -[SFToastViewController view](v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFOrderedContainerView addSubview:](documentAndTopBarsContainerView, "addSubview:", v7);

  -[SFToastViewController didMoveToParentViewController:](v8, "didMoveToParentViewController:", self->_documentAndTopBarsContainerViewController);
}

- (void)removeToastViewController:(id)a3
{
  id v4;
  void *v5;
  SFToastViewController *currentlyPresentedToastViewController;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[UIViewController removeChildViewController:](self->_documentAndTopBarsContainerViewController, "removeChildViewController:", v4);
  currentlyPresentedToastViewController = self->_currentlyPresentedToastViewController;
  self->_currentlyPresentedToastViewController = 0;

}

- (double)offsetForDynamicBarAnimator
{
  UIPanGestureRecognizer *hideNavigationBarGestureRecognizer;
  void *v4;
  double v5;
  double v6;
  double v7;

  if (-[UIPanGestureRecognizer state](self->_hideNavigationBarGestureRecognizer, "state") == 2)
  {
    hideNavigationBarGestureRecognizer = self->_hideNavigationBarGestureRecognizer;
    -[BrowserRootViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer translationInView:](hideNavigationBarGestureRecognizer, "translationInView:", v4);
    v6 = -v5;

  }
  else
  {
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    return v7;
  }
  return v6;
}

- (void)_hideNavigationBarGestureRecognized:(id)a3
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  id v13;

  v13 = a3;
  -[BrowserRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "translationInView:", v4);
  v6 = v5;

  v7 = objc_msgSend(v13, "state");
  if ((unint64_t)(v7 - 3) >= 3)
  {
    v11 = -v6;
    if (v7 == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "updateDynamicBarGeometry");

      -[_SFDynamicBarAnimator updateDraggingWithOffset:](self->_dynamicBarAnimator, "updateDraggingWithOffset:", v11);
    }
    else if (v7 == 1)
    {
      -[_SFWebView _beginInteractiveObscuredInsetsChange](self->_webView, "_beginInteractiveObscuredInsetsChange");
      -[_SFDynamicBarAnimator beginDraggingWithOffset:](self->_dynamicBarAnimator, "beginDraggingWithOffset:", v11);
    }
  }
  else
  {
    -[_SFWebView _endInteractiveObscuredInsetsChange](self->_webView, "_endInteractiveObscuredInsetsChange");
    -[BrowserRootViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "velocityInView:", v8);
    v10 = v9;

    -[_SFDynamicBarAnimator endDraggingWithTargetOffset:velocity:](self->_dynamicBarAnimator, "endDraggingWithTargetOffset:velocity:", (double)(v10 / log(*MEMORY[0x1E0DC5368]) - v6), v10 * -1000.0);
    if (!-[_SFDynamicBarAnimator targetState](self->_dynamicBarAnimator, "targetState"))
      self->_keepBarsMinimized = 1;
  }

}

- (void)_showBarsFromBottomBarTap:(id)a3
{
  id v3;

  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedItemState:animated:", 0, 1);

}

- (void)_receivedTouchDown:(id)a3
{
  id v4;
  SFStepperContainer *stepperContainer;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  _QWORD v14[5];
  CGPoint v15;
  CGRect v16;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    stepperContainer = self->_stepperContainer;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__BrowserRootViewController__receivedTouchDown___block_invoke;
    v14[3] = &unk_1E9CF1900;
    v14[4] = self;
    -[SFStepperContainer hideStepperWithCompletion:](stepperContainer, "hideStepperWithCompletion:", v14);
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeTabDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isBlank");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v4, "locationInView:", self->_documentAndTopBarsContainerView);
      v11 = v10;
      v13 = v12;
      -[BrowserRootViewController navigationBarFrameInCoordinateSpace:](self, "navigationBarFrameInCoordinateSpace:", self->_documentAndTopBarsContainerView);
      v15.x = v11;
      v15.y = v13;
      if (!CGRectContainsPoint(v16, v15))
      {
        -[SFWebpageStatusBarView setSuppressShowingStatusBar:](self->_statusBarView, "setSuppressShowingStatusBar:", 1);
        -[SFWebpageStatusBarView clearStatus](self->_statusBarView, "clearStatus");
        objc_msgSend(WeakRetained, "setOverridesUndoManagerForClosedTabs:", 0);
      }
    }

  }
}

void __48__BrowserRootViewController__receivedTouchDown___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 968);
  *(_QWORD *)(v2 + 968) = 0;

}

- (void)_receivedTouchUp:(id)a3
{
  id WeakRetained;

  if (objc_msgSend(a3, "state") == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "unhideCapsuleFromPageMenuIfNeeded");

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIPanGestureRecognizer *v6;
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = a4;
  if ((UIPanGestureRecognizer *)self->_showBarsFromBottomBarRecognizer == v6)
  {
    if (self->_keepBarsMinimized
      || (-[CatalogViewController view](self->_catalogViewController, "view"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "window"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          v12))
    {
      v10 = 0;
    }
    else
    {
      -[ViewWithCustomNextResponder bounds](self->_contentContainerView, "bounds");
      v17 = v16;
      objc_msgSend(v7, "locationInView:", self->_contentContainerView);
      v19 = v17 - v18;
      -[BrowserRootViewController maximumHeightObscuredByBottomToolbar](self, "maximumHeightObscuredByBottomToolbar");
      v10 = v19 < v20;
    }
  }
  else
  {
    -[BrowserRootViewController topBar](self, "topBar");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (self->_hideNavigationBarGestureRecognizer == v6)
    {
      if (v8)
      {
        objc_msgSend(v7, "locationInView:", v8);
        v14 = v13;
        objc_msgSend(v9, "bounds");
        v10 = v14 < CGRectGetMaxY(v21);
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 1;
    }

  }
  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  double v7;
  double v8;
  id WeakRetained;
  void *v10;
  void *v11;

  if (self->_hideNavigationBarGestureRecognizer == a3)
  {
    v5 = a3;
    -[BrowserRootViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "translationInView:", v6);
    v8 = v7;

    if (v8 <= 0.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "tabController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activeTabDocument");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "canHideToolbar"))
        v3 = !-[BrowserRootViewController _interfaceFillsScreen](self, "_interfaceFillsScreen");
      else
        LOBYTE(v3) = 0;

    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_touchDownGestureRecognizer == a3 || self->_touchUpGestureRecognizer == a3;
}

- (void)setPullToRefreshIsEnabled:(BOOL)a3
{
  self->_pullToRefreshIsEnabled = a3;
  -[BrowserRootViewController _updateRefreshControl](self, "_updateRefreshControl");
}

- (void)_updateRefreshControl
{
  if (self->_pullToRefreshIsEnabled)
    -[BrowserRootViewController _setUpRefreshControlIfNeeded](self, "_setUpRefreshControlIfNeeded");
  else
    -[UIScrollView setRefreshControl:](self->_scrollView, "setRefreshControl:", 0);
}

- (void)stopRefreshing
{
  id v2;

  -[BrowserRootViewController refreshControl](self, "refreshControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isRefreshing"))
    objc_msgSend(v2, "endRefreshing");

}

- (void)_refreshControlFired:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeTabDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadUserInitiated");

  v8 = dispatch_time(0, 2500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__BrowserRootViewController__refreshControlFired___block_invoke;
  block[3] = &unk_1E9CF1900;
  v11 = v4;
  v9 = v4;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);

}

uint64_t __50__BrowserRootViewController__refreshControlFired___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isRefreshing");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "endRefreshing");
  return result;
}

- (void)sidebarDimmingViewDismiss:(id)a3
{
  -[BrowserRootViewController setShowingSidebar:completion:](self, "setShowingSidebar:completion:", 0, 0);
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_webView);
  -[BrowserRootViewController unifiedField](self, "unifiedField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_catalogViewController);
  -[TabBarManager inlineTabBar](self->_tabBarManager, "inlineTabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);

  -[TabBarManager standaloneTabBar](self->_tabBarManager, "standaloneTabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v6);

  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_sidebarViewController);
  return v3;
}

- (void)_prepareBarsForTransitionFromPreviousToolbarPlacement:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__BrowserRootViewController__prepareBarsForTransitionFromPreviousToolbarPlacement___block_invoke;
  v3[3] = &unk_1E9CF2538;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

uint64_t __83__BrowserRootViewController__prepareBarsForTransitionFromPreviousToolbarPlacement___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  if (*(_QWORD *)(a1 + 40) != 1)
    goto LABEL_5;
  result = objc_msgSend(*(id *)(a1 + 32), "usingUnifiedBar");
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1320) = 1;
    objc_msgSend(*(id *)(a1 + 32), "layOutTopBars");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1552), "layoutIfNeeded");
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1552), "setAlpha:", 0.0);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1320) = 0;
    return result;
  }
  if (*(_QWORD *)(a1 + 40) != 1)
  {
LABEL_5:
    result = objc_msgSend(*(id *)(a1 + 32), "usingLoweredBar");
    if ((_DWORD)result)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1568), "beginHidingCapsuleAnimated:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1568), "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "layoutIfNeeded");

      objc_msgSend(*(id *)(a1 + 32), "_layOutTopBackdrop");
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1568), "endHidingCapsuleAnimated:", 0);
    }
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _BOOL8 v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[7];
  _QWORD v17[9];
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)BrowserRootViewController;
  v7 = a4;
  -[BrowserRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = self->_toolbarPlacement != 0;
  ++self->_sizeTransitionCount;
  self->_isPerformingSizeTransition = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[BrowserRootViewController _setToolbarPlacement:](self, "_setToolbarPlacement:", objc_msgSend(WeakRetained, "browserViewController:toolbarPlacementForViewSize:", self, width, height));

  -[BrowserRootViewController _updateToolbarForToolbarPlacementAllowingRemoval:](self, "_updateToolbarForToolbarPlacementAllowingRemoval:", 0);
  -[BrowserRootViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  v15 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v15, "rootViewControllerViewWillTransitionToSize:", width, height);

  -[BrowserRootViewController _prepareBarsForTransitionFromPreviousToolbarPlacement:](self, "_prepareBarsForTransitionFromPreviousToolbarPlacement:", v8);
  -[BrowserRootViewController _dismissWebSearchTipPopoverIfNeeded](self, "_dismissWebSearchTipPopoverIfNeeded");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__BrowserRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_1E9CF49F0;
  v17[4] = self;
  *(double *)&v17[5] = width;
  *(double *)&v17[6] = height;
  v17[7] = v12;
  v17[8] = v14;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__BrowserRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v16[3] = &unk_1E9CF4A18;
  v16[4] = self;
  v16[5] = v12;
  v16[6] = v14;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v17, v16);

}

void __80__BrowserRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "usingLoweredBar");
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1552);
  if (v5)
  {
    objc_msgSend(v6, "setAlpha:", 0.0);
  }
  else
  {
    objc_msgSend(v6, "setAlpha:", 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1568), "beginHidingCapsuleAnimated:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1640));
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1656));
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;

  v14 = *(double *)(a1 + 40);
  v15 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v11, v13, v14, v15);

  objc_msgSend(*(id *)(a1 + 32), "_setShowingFloatingSidebarButton:", 0);
  objc_msgSend(WeakRetained, "updateTabGroupButtonsVisibility");
  objc_msgSend(WeakRetained, "rootViewControllerViewTransitionFromSize:includingSidebar:animated:", 1, objc_msgSend(v4, "isAnimated"), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 1648);
  v18 = objc_msgSend(v4, "isAnimated");

  objc_msgSend(v17, "reloadNavigationItemAnimated:", v18);
  objc_msgSend(*(id *)(a1 + 32), "_updateSidebarStyle");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1328), "setTransparent:", objc_msgSend(*(id *)(a1 + 32), "_shouldShowSidebarContentDimmingView") ^ 1);
  objc_msgSend(v8, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v8, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotificationName:object:", CFSTR("BrowserRootViewControllerDidTransitionSizeNotification"), *(_QWORD *)(a1 + 32));

}

void __80__BrowserRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 1640);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(*(id *)(a1 + 32), "_updateToolbarForToolbarPlacementAllowingRemoval:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_destroySidebarContentDimmingViewIfNeeded");
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176);
  objc_msgSend(*(id *)(a1 + 32), "updateSuppressesStandaloneTabBar");
  v5 = objc_msgSend(v4, "isAnimated");

  objc_msgSend(WeakRetained, "rootViewControllerViewDidTransitionFromSize:animated:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1415) = 0;
  objc_msgSend(WeakRetained, "updatePopoverPositionAfterSizeTransition");
  objc_msgSend(*(id *)(a1 + 32), "_setAvoidanceInsetsNeedsUpdate");
  v6 = *(id **)(a1 + 32);
  objc_msgSend(v6[196], "capsuleCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_updateAllowsHidingHomeIndicatorMinimized:", objc_msgSend(v7, "selectedItemIsMinimized"));

  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateOfHomeIndicatorAutoHidden");
  objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityIdentifier");
  objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdateOfMultitaskingDragExclusionRects");
  objc_msgSend(*(id *)(a1 + 32), "_updateTopBarStyles");
  objc_msgSend(*(id *)(a1 + 32), "updateUsesWebpageStatusBar");

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BrowserRootViewController *v17;
  id v18;
  BOOL v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BrowserRootViewController presentViewController:animated:completion:].cold.1(v8, v11);
  }
  v12 = _Block_copy(v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v8, "modalPresentationStyle"))
    objc_msgSend(v8, "setModalPresentationStyle:", 5);
  if (!-[CatalogViewController popoverIsShowing](self->_catalogViewController, "popoverIsShowing"))
    goto LABEL_11;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v13 = (void *)getSKStoreProductViewControllerClass_softClass;
  v24 = getSKStoreProductViewControllerClass_softClass;
  if (!getSKStoreProductViewControllerClass_softClass)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __getSKStoreProductViewControllerClass_block_invoke;
    v20[3] = &unk_1E9CF1780;
    v20[4] = &v21;
    __getSKStoreProductViewControllerClass_block_invoke((uint64_t)v20);
    v13 = (void *)v22[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v21, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__BrowserRootViewController_presentViewController_animated_completion___block_invoke;
    v15[3] = &unk_1E9CF4860;
    v16 = v8;
    v17 = self;
    v19 = v6;
    v18 = v12;
    -[BrowserRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v15);

  }
  else
  {
LABEL_11:
    -[BrowserRootViewController _sf_presentViewControllerOnTopOfPresentedViewController:animated:completion:](self, "_sf_presentViewControllerOnTopOfPresentedViewController:animated:completion:", v8, v6, v12);
  }

}

id __71__BrowserRootViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v2 = (id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1640));
    objc_msgSend(WeakRetained, "cancelFavorites");

  }
  objc_msgSend(*v2, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__BrowserRootViewController_presentViewController_animated_completion___block_invoke_cold_1(v2, a1, v5);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(unsigned __int8 *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  v10.receiver = *(id *)(a1 + 40);
  v10.super_class = (Class)BrowserRootViewController;
  return objc_msgSendSuper2(&v10, sel_presentViewController_animated_completion_, v6, v7, v8);
}

uint64_t __70__BrowserRootViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1648), "displayPopover");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)capsuleNavigationController:(id)a3 obscuredInsetsDidChangeWithCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  -[BrowserRootViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

  -[BrowserRootViewController _activeTabDocumentView](self, "_activeTabDocumentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginInteractiveGeometryChanges");
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__BrowserRootViewController_capsuleNavigationController_obscuredInsetsDidChangeWithCoordinator___block_invoke;
  v15[3] = &unk_1E9CF4A40;
  v15[4] = self;
  v16 = v6;
  v11 = v6;
  objc_msgSend(v7, "addAnimations:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __96__BrowserRootViewController_capsuleNavigationController_obscuredInsetsDidChangeWithCoordinator___block_invoke_2;
  v13[3] = &unk_1E9CF1900;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v7, "addCompletion:", v13);

}

void __96__BrowserRootViewController_capsuleNavigationController_obscuredInsetsDidChangeWithCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _BYTE *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_layOutTopBackdrop");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1464));
  objc_msgSend(WeakRetained, "browserViewControllerDidChangeBarInsets:", *(_QWORD *)(a1 + 32));

  v3 = *(_BYTE **)(a1 + 32);
  if (v3[1412])
  {
    objc_msgSend(*(id *)(a1 + 40), "capsuleCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "selectedItemIsMinimized");

    v3 = *(_BYTE **)(a1 + 32);
    if ((v5 & 1) == 0)
    {
      v3[1412] = 0;
      v3 = *(_BYTE **)(a1 + 32);
    }
  }
  objc_msgSend(v3, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

uint64_t __96__BrowserRootViewController_capsuleNavigationController_obscuredInsetsDidChangeWithCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endInteractiveGeometryChanges");
}

- (void)capsuleNavigationBarViewControllerDidChangeCapsuleFocus:(id)a3 options:(int64_t)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD aBlock[4];
  id v16;
  id v17;
  BrowserRootViewController *v18;
  int64_t v19;
  BOOL v20;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__BrowserRootViewController_capsuleNavigationBarViewControllerDidChangeCapsuleFocus_options___block_invoke;
  aBlock[3] = &unk_1E9CF4A68;
  v8 = v6;
  v16 = v8;
  v9 = WeakRetained;
  v18 = self;
  v19 = a4;
  v20 = (a4 & 2) == 0;
  v17 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v9, "updateTabViewPinchRecognizer");
  objc_msgSend(v9, "tabController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeTabDocument");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isShowingSystemStartPage");

  if (v13)
  {
    v10[2](v10);
    if ((a4 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v10);
    if ((a4 & 1) != 0)
      goto LABEL_7;
  }
  if (objc_msgSend(v9, "isFavoritesFieldFocused"))
  {
    objc_msgSend(v8, "unifiedField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CatalogViewController setTextField:](self->_catalogViewController, "setTextField:", v14);
    objc_msgSend(v14, "becomeFirstResponder");

  }
LABEL_7:

}

uint64_t __93__BrowserRootViewController_capsuleNavigationBarViewControllerDidChangeCapsuleFocus_options___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "capsuleIsFocused");
  v3 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "setFavoritesFieldFocused:forVoiceSearch:animated:completionHandler:", 1, *(_DWORD *)(a1 + 56) & 1, *(unsigned __int8 *)(a1 + 64), 0);
  objc_msgSend(v3, "cancelFavoritesAnimated:", *(unsigned __int8 *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1648), "setTextField:", 0);
}

- (void)capsuleNavigationBarViewController:(id)a3 selectedItemWillChangeToState:(int64_t)a4 options:(int64_t)a5 coordinator:(id)a6
{
  id v9;
  id v10;
  int v11;
  id WeakRetained;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  char v17;
  UIViewController *v18;
  UIViewController *webSearchTipViewController;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(id *);
  void *v25;
  id v26;
  id v27;
  id v28;
  id location;
  _QWORD v30[5];
  _QWORD v31[5];

  v9 = a3;
  v10 = a6;
  -[BrowserRootViewController _updateAllowsHidingHomeIndicatorMinimized:](self, "_updateAllowsHidingHomeIndicatorMinimized:", a4 == 1);
  v11 = objc_msgSend(v9, "capsuleIsFocused");
  if (a4 != 2)
  {
    if (v11)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "tabController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "activeTabDocument");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isShowingSystemStartPage");

      if ((v15 & 1) == 0)
      {
        v16 = MEMORY[0x1E0C809B0];
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke;
        v31[3] = &unk_1E9CF2CF8;
        v31[4] = self;
        objc_msgSend(v10, "addAnimations:", v31);
        v30[0] = v16;
        v30[1] = 3221225472;
        v30[2] = __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_2;
        v30[3] = &unk_1E9CF1900;
        v30[4] = self;
        objc_msgSend(v10, "addCompletion:", v30);
      }
    }
  }
  if (-[SFTipsCoordinator webSearchTipAvailable](self->_tipsCoordinator, "webSearchTipAvailable"))
  {
    v17 = objc_msgSend(v9, "capsuleIsFocused");
    if (a4 == 2 && (v17 & 1) == 0)
    {
      if (-[BrowserRootViewController isUsingBottomCapsule](self, "isUsingBottomCapsule"))
      {
        -[SFTipsCoordinator webSearchTipViewController](self->_tipsCoordinator, "webSearchTipViewController");
        v18 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        webSearchTipViewController = self->_webSearchTipViewController;
        self->_webSearchTipViewController = v18;

        -[UIViewController popoverPresentationController](self->_webSearchTipViewController, "popoverPresentationController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_setIgnoresKeyboardNotifications:", 1);
        objc_msgSend(v20, "setPermittedArrowDirections:", 2);
        objc_initWeak(&location, self);
        v22 = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_3;
        v25 = &unk_1E9CF4A90;
        objc_copyWeak(&v28, &location);
        v26 = v9;
        v21 = v20;
        v27 = v21;
        objc_msgSend(v10, "addCompletion:", &v22);

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);

      }
      goto LABEL_11;
    }
  }
  if (a4 == 2)
LABEL_11:
    -[TabSwitcherViewController detachCapsuleForActiveTab](self->_tabSwitcherViewController, "detachCapsuleForActiveTab", v22, v23, v24, v25);
  -[BrowserRootViewController _updateBottomBarHeightAboveKeyboard](self, "_updateBottomBarHeightAboveKeyboard");

}

uint64_t __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1281) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

uint64_t __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1281) = 0;
  return result;
}

void __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_3(id *a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "capsuleCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewForItemAtIndex:", objc_msgSend(v3, "selectedItemIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1[5], "setSourceItem:", v4);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", WeakRetained[175], 1, 0);
    }
    else
    {
      v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_3_cold_1(v5);
    }

  }
}

- (BOOL)capsuleNavigationBarViewControllerAllowsMinimizationGesture:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v38;
  void *v39;
  CGRect v40;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ((objc_msgSend(WeakRetained, "isShowingAppInfoOverlay") & 1) != 0
    || -[BrowserRootViewController _isShowingFindOnPage](self, "_isShowingFindOnPage"))
  {
LABEL_6:
    LOBYTE(v8) = 0;
    goto LABEL_7;
  }
  -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
  v7 = v6;
  -[_SFWebView _initialScaleFactor](self->_webView, "_initialScaleFactor");
  LOBYTE(v8) = 0;
  v10 = v7 / v9;
  if (v7 / v9 != 0.0)
  {
    objc_msgSend(v4, "capsuleCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "capsuleCollectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "obscuredInsetsForState:", objc_msgSend(v12, "selectedItemState"));
    v14 = v13;
    v16 = v15;

    objc_msgSend(v4, "capsuleCollectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "obscuredInsetsForState:", 1);
    v19 = v18;
    v21 = v20;

    v22 = v14 + v16 - v19 - v21;
    -[UIScrollView contentInset](self->_scrollView, "contentInset");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    v32 = round(v31 / v10) - v22;
    -[UIScrollView frame](self->_scrollView, "frame");
    v40.origin.x = v26 + v33;
    v40.origin.y = v24 + v34;
    v40.size.width = v35 - (v26 + v30);
    v40.size.height = v36 - (v24 + v28);
    if (v32 > round(CGRectGetHeight(v40)) && !self->_keepBarsMinimized)
    {
      objc_msgSend(WeakRetained, "tabController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "activeTabDocument");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v39, "isBlank") ^ 1;

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (void)capsuleNavigationBarViewControllerWillHideKeyboard:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!-[BrowserRootViewController _isTrackingDropSession](self, "_isTrackingDropSession")
    && !-[CatalogViewController completionDetailIsPresented](self->_catalogViewController, "completionDetailIsPresented")&& !-[BrowserRootViewController _isShowingFindOnPage](self, "_isShowingFindOnPage")&& (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) == 0&& !self->_isPerformingSizeTransition)
  {
    -[BrowserRootViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_isKeyWindowScene");

    if (v7)
    {
      if ((objc_msgSend(v13, "focusingForScribble") & 1) == 0)
      {
        -[BrowserRootViewController unifiedField](self, "unifiedField");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "voiceSearchState");

        if (v9 != 1
          && !-[CatalogViewController isShowingUniversalSearchPrivacyDetails](self->_catalogViewController, "isShowingUniversalSearchPrivacyDetails"))
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
          if ((objc_msgSend(WeakRetained, "isSuspendedOrSuspending") & 1) == 0)
          {
            objc_msgSend(WeakRetained, "rootViewController");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "presentedViewController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(WeakRetained, "setShouldKeepKeyboardFocused:", objc_msgSend(WeakRetained, "usesNarrowLayout") ^ 1);
                objc_msgSend(WeakRetained, "cancelFavorites");
                objc_msgSend(WeakRetained, "setShouldKeepKeyboardFocused:", 0);
              }
            }

          }
        }
      }
    }
  }

}

- (void)capsuleNavigationBarViewControllerDidTapVoiceSearch:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "toggleVoiceSearch");

}

- (BOOL)_isTrackingDropSession
{
  void *v2;
  void *v3;
  char v4;

  -[CatalogViewController startPageController](self->_catalogViewController, "startPageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTrackingDropSession");

  return v4;
}

- (void)capsuleCollectionViewDidUpdateMinimizationGesture:(id)a3
{
  id WeakRetained;

  -[BrowserRootViewController _layOutTopBackdrop](self, "_layOutTopBackdrop", a3);
  -[BrowserRootViewController layOutTopBars](self, "layOutTopBars");
  -[BrowserRootViewController updateWebViewSizeAttributes](self, "updateWebViewSizeAttributes");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserViewControllerDidChangeBarInsets:", self);

}

- (void)capsuleCollectionView:(id)a3 selectionGestureDidChangeFromAxis:(unint64_t)a4
{
  -[BrowserRootViewController setNeedsPreferredStatusBarUpdateAfterCommitAnimated:](self, "setNeedsPreferredStatusBarUpdateAfterCommitAnimated:", 1, a4);
}

- (void)tabCollectionViewWillPresent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_tabSwitcherViewController == a3)
    -[BrowserRootViewController _tabSwitcherVisibilityDidChange:](self, "_tabSwitcherVisibilityDidChange:", 1);
  else
    -[BrowserRootViewController _installTabView](self, "_installTabView");
  -[BrowserRootViewController safari_updateApplicationBackgroundStyle](self, "safari_updateApplicationBackgroundStyle");
  -[BrowserRootViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  -[BrowserRootViewController setNeedsPreferredStatusBarUpdateAfterCommitAnimated:](self, "setNeedsPreferredStatusBarUpdateAfterCommitAnimated:", 1);
  -[BrowserRootViewController _setNeedsUpdateOfMultitaskingDragExclusionRects](self, "_setNeedsUpdateOfMultitaskingDragExclusionRects");
  -[BrowserRootViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_rootSheetPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setShouldScaleDownBehindDescendantSheets:", 0);

}

- (void)tabCollectionViewWillDismiss:(id)a3
{
  void *v4;

  -[BrowserRootViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[BrowserRootViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  -[BrowserRootViewController setNeedsPreferredStatusBarUpdateAfterCommitAnimated:](self, "setNeedsPreferredStatusBarUpdateAfterCommitAnimated:", 1);
}

- (void)tabCollectionViewDidCancelDismissal:(id)a3
{
  void *v4;

  -[BrowserRootViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[BrowserRootViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  -[BrowserRootViewController setNeedsPreferredStatusBarUpdateAfterCommitAnimated:](self, "setNeedsPreferredStatusBarUpdateAfterCommitAnimated:", 1);
}

- (void)tabCollectionViewDidDismiss:(id)a3
{
  SFOrderedContainerView *documentAndTopBarsContainerView;
  TabSwitcherViewController *v5;
  void *v6;
  TabSwitcherViewController *tabSwitcherViewController;
  void *v8;
  void *v9;
  double v10;
  dispatch_time_t v11;
  _QWORD block[5];

  documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
  v5 = (TabSwitcherViewController *)a3;
  -[SFOrderedContainerView setHidden:](documentAndTopBarsContainerView, "setHidden:", 0);
  -[BrowserRootViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 1);
  tabSwitcherViewController = self->_tabSwitcherViewController;

  if (tabSwitcherViewController == v5)
    -[BrowserRootViewController _tabSwitcherVisibilityDidChange:](self, "_tabSwitcherVisibilityDidChange:", 0);
  else
    -[BrowserRootViewController _uninstallTabView](self, "_uninstallTabView");
  -[BrowserRootViewController _setNeedsUpdateOfMultitaskingDragExclusionRects](self, "_setNeedsUpdateOfMultitaskingDragExclusionRects");
  objc_msgSend(v6, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_rootSheetPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setShouldScaleDownBehindDescendantSheets:", 1);

  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationDuration");
    v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__BrowserRootViewController_tabCollectionViewDidDismiss___block_invoke;
    block[3] = &unk_1E9CF1900;
    block[4] = self;
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[BrowserRootViewController safari_updateApplicationBackgroundStyle](self, "safari_updateApplicationBackgroundStyle");
  }

}

uint64_t __57__BrowserRootViewController_tabCollectionViewDidDismiss___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_updateApplicationBackgroundStyle");
}

- (void)_installTabView
{
  void *v3;
  ViewWithCustomNextResponder *contentContainerView;
  id v5;
  void *v6;
  void *v7;
  SFOrderedContainerView *documentAndTopBarsContainerView;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  -[BrowserRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  contentContainerView = self->_contentContainerView;
  if (SFTabGroupSwitcherEnabled())
  {
    v5 = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(v5, "tabCollectionViewProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabViewContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[ViewWithCustomNextResponder insertSubview:belowSubview:](contentContainerView, "insertSubview:belowSubview:", v7, self->_documentAndTopBarsContainerView);

  -[BrowserRootViewController _layOutTabView](self, "_layOutTabView");
  documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
  objc_msgSend(WeakRetained, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(documentAndTopBarsContainerView) = -[SFOrderedContainerView isDescendantOfView:](documentAndTopBarsContainerView, "isDescendantOfView:", v9);

  if ((documentAndTopBarsContainerView & 1) == 0)
    -[SFOrderedContainerView setHidden:](self->_documentAndTopBarsContainerView, "setHidden:", 1);

}

- (void)_uninstallTabView
{
  void *v3;
  void *v4;
  id WeakRetained;

  if (SFTabGroupSwitcherEnabled())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabCollectionViewProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tabViewContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");
  }

}

- (UIViewController)hostViewControllerForOverlay
{
  return self->_documentAndTopBarsContainerViewController;
}

- (void)tabBarDropExpansionView:(id)a3 didBeginTrackingDropSession:(id)a4
{
  BrowserController **p_browserController;
  id v5;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "beginTrackingDropSessionForTabBarVisibility:", v5);

}

- (void)tabBarDropExpansionView:(id)a3 didEndTrackingDropSession:(id)a4
{
  BrowserController **p_browserController;
  id v5;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "endTrackingDropSessionForTabBarVisibility:", v5);

}

- (void)displayHostedScreenTimeView
{
  UIViewController *v3;
  UIViewController *documentAndTopBarsContainerViewController;
  SFOrderedContainerView *v5;
  void *v6;
  SFOrderedContainerView *documentAndTopBarsContainerView;
  id v8;

  -[SFScreenTimeOverlayViewController parentViewController](self->_screenTimeOverlayViewController, "parentViewController");
  v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  documentAndTopBarsContainerViewController = self->_documentAndTopBarsContainerViewController;

  if (v3 == documentAndTopBarsContainerViewController)
  {
    documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
    -[SFScreenTimeOverlayViewController view](self->_screenTimeOverlayViewController, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SFOrderedContainerView addSubview:](documentAndTopBarsContainerView, "addSubview:", v8);

  }
  else
  {
    -[UIViewController addChildViewController:](self->_documentAndTopBarsContainerViewController, "addChildViewController:", self->_screenTimeOverlayViewController);
    v5 = self->_documentAndTopBarsContainerView;
    -[SFScreenTimeOverlayViewController view](self->_screenTimeOverlayViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOrderedContainerView addSubview:](v5, "addSubview:", v6);

    -[SFScreenTimeOverlayViewController didMoveToParentViewController:](self->_screenTimeOverlayViewController, "didMoveToParentViewController:", self->_documentAndTopBarsContainerViewController);
  }
}

- (BOOL)_isShowingEmbeddedSidebar
{
  return self->_showingSidebar && self->_sidebarStyle == 0;
}

- (id)snapshotContentProviderForTab:(id)a3
{
  id v4;
  void *v5;
  WebViewSnapshotContentProvider *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;

  v4 = a3;
  v5 = v4;
  if (self->_isPerformingSizeTransition
    || ((objc_msgSend(v4, "isHibernated") & 1) != 0 || (objc_msgSend(v5, "contentIsReadyForSnapshot") & 1) == 0)
    && !objc_msgSend(v5, "isBlank"))
  {
    v6 = 0;
  }
  else
  {
    -[BrowserRootViewController screenTimeOverlayViewController](self, "screenTimeOverlayViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "shouldObscureForDigitalHealth") && v7)
    {
      v6 = v7;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      -[BrowserRootViewController catalogViewController](self, "catalogViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isShowingSystemStartPage")
        && (objc_msgSend(v5, "isPreparingForNewUserActivity") & 1) == 0)
      {
        if (!objc_msgSend(WeakRetained, "favoritesAreEmbedded"))
          goto LABEL_23;
        objc_msgSend(v5, "tabGroupTab");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "tabGroupUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "tabController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "activeTabGroupUUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = WBSIsEqual();

        if (v31)
          v6 = v9;
        else
LABEL_23:
          v6 = 0;
      }
      else
      {
        objc_msgSend(v5, "frontWebView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if ((objc_msgSend(v5, "isActive") & 1) == 0)
          {
            objc_msgSend(WeakRetained, "tabController");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "activeTabDocument");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "webView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "bounds");
            objc_msgSend(v10, "setBounds:");

          }
          objc_msgSend(v10, "bounds");
          -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", v10, 0);
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v21 = v20;
          objc_msgSend(v10, "bounds");
          v6 = -[WebViewSnapshotContentProvider initWithWebView:contentFrame:]([WebViewSnapshotContentProvider alloc], "initWithWebView:contentFrame:", v10, v17 + v22, v15 + v23, v24 - (v17 + v21), v25 - (v15 + v19));
        }
        else
        {
          v6 = 0;
        }

      }
    }

  }
  return v6;
}

- (CGSize)contentSizeForSnapshotGenerator:(id)a3
{
  void *v4;
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
  double v18;
  CGSize result;

  -[BrowserRootViewController documentAndTopBarsContainerView](self, "documentAndTopBarsContainerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", v4, 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "bounds");
  v14 = v13 - (v8 + v12);
  v16 = v15 - (v6 + v10);

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (double)topBarsHeightForSnapshotGenerator:(id)a3
{
  double MinY;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGRect v10;
  CGRect v11;

  -[BrowserRootViewController contentFrameInPageView](self, "contentFrameInPageView", a3);
  MinY = CGRectGetMinY(v10);
  -[BrowserRootViewController contentContainerView](self, "contentContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[BrowserRootViewController contentContainerViewFrameForBrowserSize:](self, "contentContainerViewFrameForBrowserSize:", v6, v7);
  v8 = MinY - CGRectGetMinY(v11);

  return v8;
}

uint64_t __64__BrowserRootViewController__dismissWebSearchTipPopoverIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id WeakRetained;
  id v5;
  int v6;
  id v7;

  objc_msgSend(a3, "presentedViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_privateBrowsingExplanationSheet);
  if (v7 == WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_browserController);
    v6 = objc_msgSend(v5, "shouldShowTurnOnLockedPrivateBrowsingSheet");

    if (!v6)
      return;
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBool:forKey:", 1, *MEMORY[0x1E0D8AFE0]);
  }
  else
  {

  }
}

- (BOOL)browserToolbarShouldHitTestAsOpaque:(id)a3
{
  return -[TabSwitcherViewController presentationState](self->_tabSwitcherViewController, "presentationState", a3) != 0;
}

- (id)setUpTabSwitcherViewController
{
  TabSwitcherViewController *v3;
  id WeakRetained;
  void *v5;
  TabSwitcherViewController *v6;
  TabSwitcherViewController *tabSwitcherViewController;
  ViewWithCustomNextResponder *contentContainerView;
  void *v9;
  ViewWithCustomNextResponder *v10;
  void *v11;
  void *v12;

  v3 = [TabSwitcherViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TabSwitcherViewController initWithTabController:](v3, "initWithTabController:", v5);
  tabSwitcherViewController = self->_tabSwitcherViewController;
  self->_tabSwitcherViewController = v6;

  -[TabSwitcherViewController setContainer:](self->_tabSwitcherViewController, "setContainer:", self);
  -[CapsuleNavigationBarViewController setLinkedPageView:](self->_capsuleViewController, "setLinkedPageView:", self->_tabSwitcherViewController);
  contentContainerView = self->_contentContainerView;
  -[TabSwitcherViewController pinchGestureRecognizer](self->_tabSwitcherViewController, "pinchGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ViewWithCustomNextResponder addGestureRecognizer:](contentContainerView, "addGestureRecognizer:", v9);

  v10 = self->_contentContainerView;
  -[TabSwitcherViewController panGestureRecognizerForTrackingPinchTranslationVelocity](self->_tabSwitcherViewController, "panGestureRecognizerForTrackingPinchTranslationVelocity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ViewWithCustomNextResponder addGestureRecognizer:](v10, "addGestureRecognizer:", v11);

  -[BrowserRootViewController _layOutTabView](self, "_layOutTabView");
  -[TabSwitcherViewController view](self->_tabSwitcherViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutIfNeeded");

  return self->_tabSwitcherViewController;
}

- (void)tearDownTabSwitcherViewController
{
  ViewWithCustomNextResponder *contentContainerView;
  void *v4;
  ViewWithCustomNextResponder *v5;
  void *v6;
  TabSwitcherViewController *tabSwitcherViewController;

  -[BrowserRootViewController _uninstallTabSwitcherViewController](self, "_uninstallTabSwitcherViewController");
  contentContainerView = self->_contentContainerView;
  -[TabSwitcherViewController pinchGestureRecognizer](self->_tabSwitcherViewController, "pinchGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ViewWithCustomNextResponder removeGestureRecognizer:](contentContainerView, "removeGestureRecognizer:", v4);

  v5 = self->_contentContainerView;
  -[TabSwitcherViewController panGestureRecognizerForTrackingPinchTranslationVelocity](self->_tabSwitcherViewController, "panGestureRecognizerForTrackingPinchTranslationVelocity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ViewWithCustomNextResponder removeGestureRecognizer:](v5, "removeGestureRecognizer:", v6);

  tabSwitcherViewController = self->_tabSwitcherViewController;
  self->_tabSwitcherViewController = 0;

}

- (void)_installTabSwitcherViewController
{
  _QWORD v3[5];

  -[UIViewController addChildViewController:](self->_contentContainerViewController, "addChildViewController:", self->_tabSwitcherViewController);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__BrowserRootViewController__installTabSwitcherViewController__block_invoke;
  v3[3] = &unk_1E9CF1900;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "safari_performWithoutRetargetingAnimations:", v3);
  -[TabSwitcherViewController didMoveToParentViewController:](self->_tabSwitcherViewController, "didMoveToParentViewController:", self->_contentContainerViewController);
}

void __62__BrowserRootViewController__installTabSwitcherViewController__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1008);
  objc_msgSend(*(id *)(v2 + 1664), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertSubview:belowSubview:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1216));

}

- (void)_uninstallTabSwitcherViewController
{
  void *v3;

  -[TabSwitcherViewController willMoveToParentViewController:](self->_tabSwitcherViewController, "willMoveToParentViewController:", 0);
  -[TabSwitcherViewController view](self->_tabSwitcherViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[TabSwitcherViewController removeFromParentViewController](self->_tabSwitcherViewController, "removeFromParentViewController");
}

- (void)_tabSwitcherVisibilityDidChange:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[SFOrderedContainerView setHidden:](self->_documentAndTopBarsContainerView, "setHidden:");
  if (v3)
    -[BrowserRootViewController _installTabSwitcherViewController](self, "_installTabSwitcherViewController");
  else
    -[BrowserRootViewController _uninstallTabSwitcherViewController](self, "_uninstallTabSwitcherViewController");
}

- (id)borrowCapsuleViewForTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;

  v4 = a3;
  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || objc_msgSend(v5, "selectedItemState")
    || objc_msgSend(v6, "layoutStyle") == 1 && !objc_msgSend(v6, "selectionGestureState")
    || (v9 = -[CapsuleNavigationBarViewController collectionViewIndexOfTab:](self->_capsuleViewController, "collectionViewIndexOfTab:", v4), v9 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "detachViewForItemAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0D4EBE0]);
      objc_msgSend(v6, "capsuleFrame");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[BrowserRootViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      -[BrowserRootViewController capsuleCollectionViewLayout](self, "capsuleCollectionViewLayout");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v11, "initWithView:capsuleReferenceFrame:referenceBounds:shouldClipView:", v10, WBSIsEqual(), v13, v15, v17, v19, v22, v24, v26, v28);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)relinquishBorrowedCapsuleView:(id)a3
{
  CapsuleNavigationBarViewController *capsuleViewController;
  id v4;
  id v5;

  capsuleViewController = self->_capsuleViewController;
  v4 = a3;
  -[CapsuleNavigationBarViewController capsuleCollectionView](capsuleViewController, "capsuleCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reattachView:", v4);

}

- (void)tabOverviewVisibilityDidChange:(BOOL)a3
{
  _BOOL8 v3;
  double v4;
  id v5;

  v3 = a3;
  -[CapsuleNavigationBarViewController capsuleCollectionView](self->_capsuleViewController, "capsuleCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3 ^ 1);
  v4 = 0.1;
  if (v3)
    v4 = 0.0;
  objc_msgSend(v5, "setShouldDismissContent:withDelay:", v3, v4);

}

- (void)toggleSidebar
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "toggleBookmarksPresentation");

}

- (id)showTabGroupPicker:(id)a3
{
  BrowserController **p_browserController;
  id v4;
  id WeakRetained;
  void *v6;

  p_browserController = &self->_browserController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "showTabGroupPicker:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)takeOwnershipOfStepperContainer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (!self->_stepperContainer)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_stepperContainer, a3);
    -[BrowserRootViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v6, "convertRect:fromView:", v8);
    objc_msgSend(v8, "setFrame:");

    -[BrowserRootViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    v5 = v8;
  }

}

- (SidebarUIProxyDelegate)sidebarUIProxyDelegate
{
  return (SidebarUIProxyDelegate *)objc_loadWeakRetained((id *)&self->_sidebarUIProxyDelegate);
}

- (SidebarViewController)sidebarViewController
{
  return self->_sidebarViewController;
}

- (int64_t)sidebarStyle
{
  return self->_sidebarStyle;
}

- (void)setScreenTimeOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeOverlayViewController, a3);
}

- (_SFBrowserConfiguration)configuration
{
  return self->_configuration;
}

- (BrowserRootViewControllerDelegate)delegate
{
  return (BrowserRootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIViewController)contentContainerViewController
{
  return self->_contentContainerViewController;
}

- (UIViewController)documentAndTopBarsContainerViewController
{
  return self->_documentAndTopBarsContainerViewController;
}

- (UIView)tabBarClipperView
{
  return self->_tabBarClipperView;
}

- (UIView)clipperView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_clipperView);
}

- (void)setClipperView:(id)a3
{
  objc_storeWeak((id *)&self->_clipperView, a3);
}

- (BOOL)barStateAllowsHidingHomeIndicator
{
  return self->_barStateAllowsHidingHomeIndicator;
}

- (BrowserToolbar)bottomToolbar
{
  return self->_bottomToolbar;
}

- (TabHoverPreview)tabHoverPreview
{
  return self->_tabHoverPreview;
}

- (SFBannerTheme)bannerTheme
{
  return self->_bannerTheme;
}

- (BOOL)pullToRefreshIsEnabled
{
  return self->_pullToRefreshIsEnabled;
}

- (UIBarButtonItem)sidebarButtonItem
{
  return self->_sidebarButtonItem;
}

- (UIBarButtonItem)sidebarTrailingButtonItem
{
  return self->_sidebarTrailingButtonItem;
}

- (UIButton)floatingSidebarButton
{
  return self->_floatingSidebarButton;
}

- (UIButton)sidebarButtonEmbeddedInSidebar
{
  return self->_sidebarButtonEmbeddedInSidebar;
}

- (SidebarContentDimmingView)sidebarContentDimmingView
{
  return self->_sidebarContentDimmingView;
}

- (void)setKeepBarsMinimized:(BOOL)a3
{
  self->_keepBarsMinimized = a3;
}

- (BOOL)isTogglingTabBar
{
  return self->_togglingTabBar;
}

- (void)setTogglingTabBar:(BOOL)a3
{
  self->_togglingTabBar = a3;
}

- (BOOL)usesFaintTopSeparator
{
  return self->_usesFaintTopSeparator;
}

- (BOOL)isPerformingSizeTransition
{
  return self->_isPerformingSizeTransition;
}

- (_SFWebView)webView
{
  return self->_webView;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (BOOL)documentSafeAreaInsetsFrozen
{
  return self->_documentSafeAreaInsetsFrozen;
}

- (BOOL)needsScrollToTopView
{
  return self->_needsScrollToTopView;
}

- (SFLockedPrivateBrowsingView)lockedPrivateBrowsingView
{
  return self->_lockedPrivateBrowsingView;
}

- (BrowserController)browserController
{
  return (BrowserController *)objc_loadWeakRetained((id *)&self->_browserController);
}

- (TabThumbnailCollectionView)tabThumbnailCollectionView
{
  return (TabThumbnailCollectionView *)objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
}

- (TabSwitcherViewController)tabSwitcherViewController
{
  return self->_tabSwitcherViewController;
}

- (SFWebpageStatusBarView)statusBarView
{
  return self->_statusBarView;
}

- (id)intentInteractionCompletion
{
  return self->_intentInteractionCompletion;
}

- (void)setIntentInteractionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1680);
}

- (SFTipsCoordinator)tipsCoordinator
{
  return self->_tipsCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipsCoordinator, 0);
  objc_storeStrong(&self->_intentInteractionCompletion, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_tabSwitcherViewController, 0);
  objc_destroyWeak((id *)&self->_tabThumbnailCollectionView);
  objc_storeStrong((id *)&self->_catalogViewController, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_lockedPrivateBrowsingView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_sidebarButtonEmbeddedInSidebar, 0);
  objc_storeStrong((id *)&self->_floatingSidebarButton, 0);
  objc_storeStrong((id *)&self->_sidebarTrailingButtonItem, 0);
  objc_storeStrong((id *)&self->_sidebarButtonItem, 0);
  objc_storeStrong((id *)&self->_bannerTheme, 0);
  objc_storeStrong((id *)&self->_capsuleViewController, 0);
  objc_storeStrong((id *)&self->_tabBarManager, 0);
  objc_storeStrong((id *)&self->_unifiedBar, 0);
  objc_storeStrong((id *)&self->_tabHoverPreview, 0);
  objc_storeStrong((id *)&self->_tabBar, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_dynamicBarAnimator, 0);
  objc_storeStrong((id *)&self->_bottomToolbar, 0);
  objc_storeStrong((id *)&self->_bookmarksBar, 0);
  objc_destroyWeak((id *)&self->_clipperView);
  objc_storeStrong((id *)&self->_tabBarClipperView, 0);
  objc_storeStrong((id *)&self->_documentAndTopBarsContainerViewController, 0);
  objc_storeStrong((id *)&self->_contentContainerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_screenTimeOverlayViewController, 0);
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_destroyWeak((id *)&self->_sidebarUIProxyDelegate);
  objc_storeStrong((id *)&self->_webSearchTipViewController, 0);
  objc_storeStrong((id *)&self->_defaultBrowserViewController, 0);
  objc_destroyWeak((id *)&self->_defaultBrowserSheet);
  objc_destroyWeak((id *)&self->_privateBrowsingExplanationSheet);
  objc_storeStrong((id *)&self->_currentlyPresentedToastViewController, 0);
  objc_storeStrong((id *)&self->_statusBarHoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_sidebarButtonEmbeddedInUnifiedBar, 0);
  objc_storeStrong((id *)&self->_sidebarTrailingButton, 0);
  objc_storeStrong((id *)&self->_sidebarContentDimmingView, 0);
  objc_storeStrong((id *)&self->_hideNavigationBarGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_showBarsFromBottomBarRecognizer, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_topBackdropTheme, 0);
  objc_storeStrong((id *)&self->_topBackdrop, 0);
  objc_storeStrong((id *)&self->_touchDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarBackdrop, 0);
  objc_storeStrong((id *)&self->_stateCollector, 0);
  objc_storeStrong((id *)&self->_documentAndTopBarsContainerView, 0);
  objc_storeStrong((id *)&self->_scrollToTopView, 0);
  objc_storeStrong((id *)&self->_topAuxiliaryBarsContainerView, 0);
  objc_storeStrong((id *)&self->_tabBarDropExpansionView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_touchUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_stepperContainer, 0);
}

- (void)presentViewController:(void *)a1 animated:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10[14];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  v11 = v5;
  v12 = v7;
  v13 = v8;
  OUTLINED_FUNCTION_2_2(&dword_1D7CA3000, v3, v9, "Trying to present %{public}@ from %{public}@ (pre-dismiss) when it is already presented by: %{public}@", v10);

  OUTLINED_FUNCTION_0_3();
}

void __71__BrowserRootViewController_presentViewController_animated_completion___block_invoke_cold_1(id *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[14];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  v12 = v6;
  v13 = v8;
  v14 = v9;
  OUTLINED_FUNCTION_2_2(&dword_1D7CA3000, v4, v10, "Trying to present %{public}@ from %{public}@ (post-dismiss) when it is already presented by: %{public}@", v11);

  OUTLINED_FUNCTION_0_3();
}

void __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_3_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_FAULT, "Failed to obtain source view for Web Search Tip Popover", v1, 2u);
}

@end
