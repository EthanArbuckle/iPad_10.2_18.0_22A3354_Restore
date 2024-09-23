@implementation UnifiedBar

- (UnifiedBar)initWithFrame:(CGRect)a3
{
  UnifiedBar *v3;
  id v4;
  UnifiedBar *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UnifiedBar;
  v3 = -[SFUnifiedBar initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3FC0]);
    -[UnifiedBar addInteraction:](v3, "addInteraction:", v4);

    v5 = v3;
  }

  return v3;
}

- (void)metricsDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarMetricsDidChange:", self);

}

- (void)squishedBarTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "compressedNavigationBarWasTapped:", self);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)viewForBarItem:(int64_t)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistrationToken);
  objc_msgSend(WeakRetained, "viewForBarItem:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)unifiedTabBarMenuButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarFormatMenuButtonWasTapped:", self);

}

- (void)unifiedTabBarMenuButtonReceivedTouchDown:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarFormatMenuButtonStartedInteraction:", self);

}

- (void)unifiedTabBarMenuButtonClicked:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarReaderButtonWasTapped:", self);

}

- (void)unifiedTabBarVoiceSearchButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarVoiceSearchButtonWasTapped:", self);

}

- (void)unifiedTabBarReloadButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarReloadButtonWasTapped:", self);

}

- (void)unifiedTabBarStopButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarStopLoadingButtonWasTapped:", self);

}

- (void)unifiedTabBarReaderButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarReaderButtonWasTapped:", self);

}

- (void)unifiedTabBarTranslationButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarTranslateButtonWasTapped:", self);

}

- (void)unifiedTabBar:(id)a3 didTapMediaStateMuteButtonForItem:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarMediaStateMuteButtonWasTapped:forItem:", self, v6);

}

- (void)unifiedTabBarURLTapped:(id)a3 completionHandler:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarURLWasTapped:completionHandler:", self, v6);

}

- (void)unifiedTabBar:(id)a3 didFinishShowingAvailabilityLabelOfType:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBar:didFinishShowingAvailabilityLabelOfType:", self, a4);

}

- (void)unifiedTabBar:(id)a3 extensionButtonTapped:(id)a4 extension:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBar:extensionButtonTapped:extension:", self, v9, v7);

}

- (void)unifiedTabBar:(id)a3 multipleExtensionButtonTapped:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBar:multipleExtensionsButtonTapped:", self, v6);

}

- (void)animateSafariIconLinkFromPoint:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UnifiedBar viewForBarItem:](self, "viewForBarItem:", 3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3F10];
  _SFSafariIconLinkImage();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  objc_msgSend(v8, "_sf_animateLinkImage:withAnimation:fromPoint:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", v9, 1, v7, v14, 0, 0, x, y, v10, v11, v12, v13);

}

- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  if (a6 == 5)
  {
    -[SFUnifiedBar contentArrangement](self, "contentArrangement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "inlineContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "menuPopoverSourceView");
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UnifiedBar viewForBarItem:](self, "viewForBarItem:", a6);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v27, "bounds");
  objc_msgSend(v22, "_sf_animateLinkImage:withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", a3, 1, v19, v27, v18, v17, x, y, width, height, v23, v24, v25, v26);

}

- (id)popoverSourceInfoForBarItem:(int64_t)a3
{
  id v4;
  void *WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  if (a3 == 5)
  {
    v4 = objc_alloc(MEMORY[0x1E0D4EFA0]);
    -[SFUnifiedBar contentArrangement](self, "contentArrangement");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inlineContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "menuPopoverSourceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithView:", v7);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistrationToken);
    objc_msgSend(WeakRetained, "popoverSourceInfoForItem:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (UITextField)textField
{
  void *v2;
  void *v3;
  void *v4;

  -[SFUnifiedBar contentArrangement](self, "contentArrangement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextField *)v4;
}

- (NSArray)popoverPassthroughViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  UnifiedBar **v7;
  void *v9;
  void *v10;
  UnifiedBar *v11;
  _QWORD v12[3];
  UnifiedBar *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[SFUnifiedBar contentArrangement](self, "contentArrangement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14[0] = self;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = (UnifiedBar **)v14;
    goto LABEL_8;
  }
  v5 = objc_msgSend(v4, "role");
  switch(v5)
  {
    case 2:
      v11 = self;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v11;
      goto LABEL_8;
    case 1:
      v12[0] = v4;
      -[SFUnifiedBar leadingItemContainerView](self, "leadingItemContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v9;
      -[SFUnifiedBar trailingItemContainerView](self, "trailingItemContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 0:
      v13 = self;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v13;
LABEL_8:
      objc_msgSend(v6, "arrayWithObjects:count:", v7, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }

  return (NSArray *)v3;
}

- (CGRect)URLOutlineFrameInNavigationBarSpace
{
  void *v3;
  void *v4;
  void *v5;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[SFUnifiedBar contentArrangement](self, "contentArrangement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "searchFieldPopoverSourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[UnifiedBar convertRect:fromView:](self, "convertRect:fromView:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "searchFieldPopoverSourceInsets");
  v15 = v7 + v14;
  v17 = v9 + v16;
  v19 = v11 - (v14 + v18);
  v21 = v13 - (v16 + v20);

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)urlOutlineFrameRelativeToView:(id)a3
{
  id v4;
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
  CGRect result;

  v4 = a3;
  -[UnifiedBar URLOutlineFrameInNavigationBarSpace](self, "URLOutlineFrameInNavigationBarSpace");
  -[UnifiedBar convertRect:toView:](self, "convertRect:toView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (_SFPopoverSourceInfo)formatMenuButtonPopoverSourceInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  -[SFUnifiedBar contentArrangement](self, "contentArrangement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "menuPopoverSourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EFA0]), "initWithView:", v4);
  objc_msgSend(v5, "setPermittedArrowDirections:", 3);
  objc_msgSend(v5, "setShouldHideArrow:", 1);
  objc_msgSend(v5, "setShouldPassthroughSuperview:", 1);
  v6 = objc_msgSend(v3, "role");
  if (!v6)
  {
    v7 = 4;
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    v7 = 3;
LABEL_5:
    objc_msgSend(v5, "setProvenance:", v7);
  }

  return (_SFPopoverSourceInfo *)v5;
}

- (_SFPopoverSourceInfo)URLOutlinePopoverSourceInfo
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[SFUnifiedBar contentArrangement](self, "contentArrangement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0D4EFA0]);
  objc_msgSend(v3, "searchFieldPopoverSourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchFieldPopoverSourceInsets");
  v6 = (void *)objc_msgSend(v4, "initWithView:insets:", v5);

  return (_SFPopoverSourceInfo *)v6;
}

- (void)didCompleteBarRegistrationWithToken:(id)a3
{
  objc_storeWeak((id *)&self->_barRegistrationToken, a3);
}

- (_SFNavigationBarDelegateCommon)delegate
{
  return (_SFNavigationBarDelegateCommon *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_barRegistrationToken);
}

@end
