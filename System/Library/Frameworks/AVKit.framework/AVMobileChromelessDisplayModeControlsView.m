@implementation AVMobileChromelessDisplayModeControlsView

- (AVMobileChromelessDisplayModeControlsView)initWithStyleSheet:(id)a3
{
  id v5;
  AVMobileChromelessDisplayModeControlsView *v6;
  AVMobileChromelessDisplayModeControlsView *v7;
  uint64_t v8;
  NSMapTable *viewToIdentifierMap;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessDisplayModeControlsView;
  v6 = -[AVView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    v7->_includesPictureInPictureControl = 0;
    v7->_includesFullscreenControl = 1;
    v7->_includesRoutePickerControl = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 517, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    viewToIdentifierMap = v7->_viewToIdentifierMap;
    v7->_viewToIdentifierMap = (NSMapTable *)v8;

    -[AVView setIgnoresTouches:](v7, "setIgnoresTouches:", 1);
  }

  return v7;
}

- (AVButton)fullScreenButton
{
  AVButton *fullScreenButton;
  AVButton *v4;
  AVButton *v5;
  AVButton *v6;
  void *v7;
  void *v8;

  fullScreenButton = self->_fullScreenButton;
  if (!fullScreenButton)
  {
    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Fullscreen Button"), 1);
    v4 = (AVButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fullScreenButton;
    self->_fullScreenButton = v4;

    -[AVButton addTarget:action:forControlEvents:](self->_fullScreenButton, "addTarget:action:forControlEvents:", self, sel_fullScreenButtonWasPressed, 64);
    -[AVButton setImageName:](self->_fullScreenButton, "setImageName:", CFSTR("xmark"));
    v6 = self->_fullScreenButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setTintColor:](v6, "setTintColor:", v7);

    -[AVButton setAutoresizingMask:](self->_fullScreenButton, "setAutoresizingMask:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4B60], *MEMORY[0x1E0DC1440]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setInlineFont:](self->_fullScreenButton, "setInlineFont:", v8);
    -[NSMapTable setObject:forKey:](self->_viewToIdentifierMap, "setObject:forKey:", CFSTR("AVFullScreenControl"), self->_fullScreenButton);

    fullScreenButton = self->_fullScreenButton;
  }
  return fullScreenButton;
}

- (AVButton)pictureInPictureButton
{
  AVButton *pictureInPictureButton;
  AVButton *v4;
  AVButton *v5;
  AVButton *v6;
  void *v7;
  void *v8;

  pictureInPictureButton = self->_pictureInPictureButton;
  if (!pictureInPictureButton)
  {
    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("PIP Button"), 1);
    v4 = (AVButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_pictureInPictureButton;
    self->_pictureInPictureButton = v4;

    -[AVButton addTarget:action:forControlEvents:](self->_pictureInPictureButton, "addTarget:action:forControlEvents:", self, sel_pictureInPictureControlWasPressed, 64);
    -[AVButton setImageName:](self->_pictureInPictureButton, "setImageName:", CFSTR("pip.enter"));
    v6 = self->_pictureInPictureButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setTintColor:](v6, "setTintColor:", v7);

    -[AVButton setAutoresizingMask:](self->_pictureInPictureButton, "setAutoresizingMask:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4B60], *MEMORY[0x1E0DC1440]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setInlineFont:](self->_pictureInPictureButton, "setInlineFont:", v8);
    -[NSMapTable setObject:forKey:](self->_viewToIdentifierMap, "setObject:forKey:", CFSTR("AVPictureInPictureControl"), self->_pictureInPictureButton);

    pictureInPictureButton = self->_pictureInPictureButton;
  }
  return pictureInPictureButton;
}

- (AVRoutePickerView)routePickerButton
{
  AVRoutePickerView *routePickerButton;
  AVRoutePickerView *v4;
  AVRoutePickerView *v5;
  AVRoutePickerView *v6;
  void *v7;

  routePickerButton = self->_routePickerButton;
  if (!routePickerButton)
  {
    v4 = objc_alloc_init(AVRoutePickerView);
    v5 = self->_routePickerButton;
    self->_routePickerButton = v4;

    -[AVRoutePickerView setAutoresizingMask:](self->_routePickerButton, "setAutoresizingMask:", 0);
    -[AVRoutePickerView setPrioritizesVideoDevices:](self->_routePickerButton, "setPrioritizesVideoDevices:", 1);
    v6 = self->_routePickerButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVRoutePickerView setTintColor:](v6, "setTintColor:", v7);

    -[NSMapTable setObject:forKey:](self->_viewToIdentifierMap, "setObject:forKey:", CFSTR("AVRoutePickerControl"), self->_routePickerButton);
    routePickerButton = self->_routePickerButton;
  }
  return routePickerButton;
}

- (AVRoutePickerView)routePickerView
{
  void *v3;

  if (-[AVMobileChromelessDisplayModeControlsView includesRoutePickerControl](self, "includesRoutePickerControl"))
  {
    -[AVMobileChromelessDisplayModeControlsView routePickerButton](self, "routePickerButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (AVRoutePickerView *)v3;
}

- (AVMobileChromelessContainerView)containerView
{
  AVMobileChromelessContainerView *containerView;
  AVMobileChromelessContainerView *v4;
  AVMobileChromelessContainerView *v5;

  containerView = self->_containerView;
  if (!containerView)
  {
    v4 = objc_alloc_init(AVMobileChromelessContainerView);
    v5 = self->_containerView;
    self->_containerView = v4;

    -[AVMobileChromelessContainerView setSpacing:](self->_containerView, "setSpacing:", 26.0);
    -[AVMobileChromelessContainerView setDelegate:](self->_containerView, "setDelegate:", self);
    -[AVMobileChromelessContainerView setAutoresizingMask:](self->_containerView, "setAutoresizingMask:", 0);
    -[AVMobileChromelessDisplayModeControlsView addSubview:](self, "addSubview:", self->_containerView);
    containerView = self->_containerView;
  }
  return containerView;
}

- (void)setCustomActions:(id)a3
{
  NSArray *v4;
  NSArray *customActions;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->_customActions) & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v6, 1);
    customActions = self->_customActions;
    self->_customActions = v4;

    -[AVMobileChromelessDisplayModeControlsView _updateItemViewsIfNeeded](self);
  }

}

- (void)setStyleSheet:(id)a3
{
  AVMobileChromelessControlsStyleSheet *v5;
  AVMobileChromelessControlsStyleSheet *v6;

  v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  if (self->_styleSheet != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_styleSheet, a3);
    -[AVMobileChromelessDisplayModeControlsView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setFullscreenIcon:(unint64_t)a3
{
  if (self->_fullscreenIcon != a3)
  {
    self->_fullscreenIcon = a3;
    -[AVMobileChromelessDisplayModeControlsView _updateFullscreenControlIcon](self);
  }
}

- (void)setIncludesFullscreenControl:(BOOL)a3
{
  if (self->_includesFullscreenControl != a3)
  {
    self->_includesFullscreenControl = a3;
    -[AVMobileChromelessDisplayModeControlsView _updateItemViewsIfNeeded](self);
  }
}

- (void)setIncludesPictureInPictureControl:(BOOL)a3
{
  if (self->_includesPictureInPictureControl != a3)
  {
    self->_includesPictureInPictureControl = a3;
    -[AVMobileChromelessDisplayModeControlsView _updateItemViewsIfNeeded](self);
  }
}

- (void)setIncludesRoutePickerControl:(BOOL)a3
{
  if (self->_includesRoutePickerControl != a3)
  {
    self->_includesRoutePickerControl = a3;
    -[AVMobileChromelessDisplayModeControlsView _updateItemViewsIfNeeded](self);
  }
}

- (void)setRoutingConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVMobileChromelessDisplayModeControlsView routePickerButton](self, "routePickerButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRoutingConfiguration:", v4);

}

- (void)setDelegate:(id)a3
{
  AVMobileChromelessDisplayModeControlsViewDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  -[AVMobileChromelessDisplayModeControlsView routePickerButton](self, "routePickerButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

}

- (void)didMoveToWindow
{
  -[AVMobileChromelessDisplayModeControlsView _updateFullscreenControlIcon](self);
  -[AVMobileChromelessDisplayModeControlsView _updateItemViewsIfNeeded](self);
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

  -[AVMobileChromelessDisplayModeControlsView containerView](self, "containerView");
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

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AVMobileChromelessDisplayModeControlsView containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessDisplayModeControlsView;
  -[AVView layoutSubviews](&v8, sel_layoutSubviews);
  -[AVMobileChromelessDisplayModeControlsView containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromelessDisplayModeControlsView bounds](self, "bounds");
  objc_msgSend(v3, "avkit_setFrame:inLayoutDirection:", -[AVMobileChromelessDisplayModeControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), v4, v5, v6, v7);

}

- (void)pictureInPictureControlWasPressed
{
  void *v3;
  char v4;
  id v5;

  -[AVMobileChromelessDisplayModeControlsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVMobileChromelessDisplayModeControlsView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayModeControlsViewPictureInPictureButtonWasPressed:", self);

  }
}

- (void)fullScreenButtonWasPressed
{
  void *v3;
  char v4;
  id v5;

  -[AVMobileChromelessDisplayModeControlsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVMobileChromelessDisplayModeControlsView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayModeControlsViewFullscreenButtonWasPressed:", self);

  }
}

- (void)containerView:(id)a3 layoutWithHiddenViews:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        -[NSMapTable objectForKey:](self->_viewToIdentifierMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__AVMobileChromelessDisplayModeControlsView_containerView_layoutWithHiddenViews___block_invoke;
  v14[3] = &unk_1E5BB3D20;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

- (id)menuForMenuButton:(id)a3
{
  void *v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMapTable objectForKey:](self->_viewToIdentifierMap, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_customActions;
  v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToString:", v10);

        if (v11)
        {
          objc_msgSend(v9, "contextMenu");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)menuButtonWillShowMenu:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AVMobileChromelessDisplayModeControlsView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVMobileChromelessDisplayModeControlsView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayModeControlsViewWillPresentContextMenu:", self);

  }
}

- (void)menuButtonDidHideMenu:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AVMobileChromelessDisplayModeControlsView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVMobileChromelessDisplayModeControlsView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayModeControlsViewDidDismissContextMenu:", self);

  }
}

- (void)setRoutePickerButton:(id)a3
{
  objc_storeStrong((id *)&self->_routePickerButton, a3);
}

- (NSArray)customActions
{
  return self->_customActions;
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (unint64_t)fullscreenIcon
{
  return self->_fullscreenIcon;
}

- (BOOL)includesPictureInPictureControl
{
  return self->_includesPictureInPictureControl;
}

- (BOOL)includesFullscreenControl
{
  return self->_includesFullscreenControl;
}

- (BOOL)includesRoutePickerControl
{
  return self->_includesRoutePickerControl;
}

- (AVRoutingConfiguration)routingConfiguration
{
  return self->_routingConfiguration;
}

- (AVMobileChromelessDisplayModeControlsViewDelegate)delegate
{
  return (AVMobileChromelessDisplayModeControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routingConfiguration, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_routePickerButton, 0);
  objc_storeStrong((id *)&self->_pictureInPictureButton, 0);
  objc_storeStrong((id *)&self->_fullScreenButton, 0);
  objc_storeStrong((id *)&self->_viewToIdentifierMap, 0);
}

void __81__AVMobileChromelessDisplayModeControlsView_containerView_layoutWithHiddenViews___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayModeControlsView:layoutWithHiddenIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (_QWORD)_updateFullscreenControlIcon
{
  void *v1;
  uint64_t v2;
  __CFString **v3;
  __CFString **v4;
  void *v5;
  void *v6;

  if (result)
  {
    v1 = result;
    v2 = result[66];
    if (v2)
    {
      if (v2 != 1)
        return (_QWORD *)objc_msgSend(v1, "setNeedsLayout");
      v3 = AVMobileAccessibilityIdentifierFullScreenButton;
      v4 = &AVMobileImageNameEnterFullScreen;
    }
    else
    {
      v3 = AVMobileAccessibilityIdentifierCloseButton;
      v4 = AVMobileImageNameDone;
    }
    objc_msgSend(result, "fullScreenButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageName:", *v4);

    objc_msgSend(v1, "fullScreenButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", *v3);

    return (_QWORD *)objc_msgSend(v1, "setNeedsLayout");
  }
  return result;
}

- (void)_updateItemViewsIfNeeded
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v1, "includesFullscreenControl"))
      {
        objc_msgSend(v1, "fullScreenButton");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v3);

      }
      if (objc_msgSend(v1, "includesPictureInPictureControl"))
      {
        objc_msgSend(v1, "pictureInPictureButton");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v4);

      }
      if (objc_msgSend(v1, "includesRoutePickerControl"))
      {
        objc_msgSend(v1, "routePickerButton");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v5);

      }
      objc_msgSend(v1, "customActions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v1, "customActions");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v40;
          v10 = *MEMORY[0x1E0DC4B60];
          v11 = *MEMORY[0x1E0DC1440];
          v12 = 0x1E0DC1000uLL;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v40 != v9)
                objc_enumerationMutation(obj);
              v14 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(v14, "contextMenu");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "accessibilityIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "accessibilityLabel");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                +[AVMenuButton buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:](AVMenuButton, "buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:", v16, v17, 1);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v14, "contextMenu");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setMenu:", v19);

                objc_msgSend(v18, "setShowsMenuAsPrimaryAction:", 1);
                objc_msgSend(v18, "setAppliesTransformToImageViewWhenHighlighted:", 1);
                objc_msgSend(v18, "setDelegate:", v1);
              }
              else
              {
                +[AVButton buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:", v16, v17, 1);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v18, "addAction:forControlEvents:", v14, 64);
                objc_msgSend(v18, "setShowsMenuAsPrimaryAction:", 0);
              }
              objc_msgSend(v18, "setAutoresizingMask:", 0);
              objc_msgSend(*(id *)(v12 + 848), "avkit_nonScalingFontWithTextStyle:weight:", v10, v11);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setInlineFont:", v20);
              objc_msgSend(v14, "tintColor");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(v18, "setTintColor:", v21);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
                v38 = v20;
                v22 = v8;
                v23 = v10;
                v24 = v9;
                v25 = v1;
                v26 = v12;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setTintColor:", v27);

                v12 = v26;
                v1 = v25;
                v9 = v24;
                v10 = v23;
                v8 = v22;
                v20 = v38;
              }

              objc_msgSend(v14, "image");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(v14, "image");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setImage:forState:", v29, 0);
              }
              else
              {
                objc_msgSend(v14, "title");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setTitle:forState:", v29, 0);
              }

              objc_msgSend(v14, "accessibilityLabel");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setAccessibilityLabel:", v30);

              objc_msgSend(v14, "accessibilityHint");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setAccessibilityHint:", v31);

              if (v18)
              {
                objc_msgSend(v37, "addObject:", v18);
                v32 = (void *)v1[58];
                objc_msgSend(v14, "identifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "setObject:forKey:", v33, v18);

              }
            }
            v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          }
          while (v8);
        }

      }
      objc_msgSend(v1, "containerView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setItemViews:", v37);

      objc_msgSend(v1, "invalidateIntrinsicContentSize");
      objc_msgSend(v1, "superview");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v1);

    }
  }
}

@end
