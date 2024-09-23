@implementation SWAttributionView

+ (void)presentTranscriptForAttributionIdentifier:(id)a3 attachmentGUID:(id)a4 presentingViewController:(id)a5
{
  objc_msgSend(MEMORY[0x1E0DA8828], "presentTranscriptForAttributionIdentifier:attachmentGUID:presentingViewController:", a3, a4, a5);
}

- (SWAttributionView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SWAttributionView;
  return -[SWAttributionView init](&v3, sel_init);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SWAttributionView;
  -[SWAttributionView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[SWAttributionView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[SWAttributionView _sendFeedbackForCurrentDisplayContext](self, "_sendFeedbackForCurrentDisplayContext");
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;
  _QWORD v54[6];
  _QWORD v55[5];

  v55[3] = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)SWAttributionView;
  -[SWAttributionView updateConstraints](&v53, sel_updateConstraints);
  -[SWAttributionView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[SWAttributionView constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

    -[SWAttributionView setConstraints:](self, "setConstraints:", 0);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWAttributionView slAttributionView](self, "slAttributionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SWAttributionView preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
    v10 = v9;
    -[SWAttributionView slAttributionView](self, "slAttributionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 <= 0.0)
    {
      objc_msgSend(v11, "topAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAttributionView topAnchor](self, "topAnchor");
      v46 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:", v46);
      v47 = objc_claimAutoreleasedReturnValue();
      v54[0] = v47;
      -[SWAttributionView slAttributionView](self, "slAttributionView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "bottomAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAttributionView bottomAnchor](self, "bottomAnchor");
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:", v42);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v52;
      -[SWAttributionView slAttributionView](self, "slAttributionView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAttributionView leadingAnchor](self, "leadingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v54[2] = v49;
      -[SWAttributionView slAttributionView](self, "slAttributionView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "trailingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAttributionView trailingAnchor](self, "trailingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v40);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v54[3] = v38;
      -[SWAttributionView slAttributionView](self, "slAttributionView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "widthAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAttributionView widthAnchor](self, "widthAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v54[4] = v24;
      -[SWAttributionView slAttributionView](self, "slAttributionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "heightAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAttributionView heightAnchor](self, "heightAnchor");
      v27 = v12;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v54[5] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 6);
      v30 = v7;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObjectsFromArray:", v31);

      v7 = v30;
      v18 = (void *)v42;

      v16 = v44;
      v12 = v27;
      v14 = (void *)v46;

      v22 = v39;
      v17 = v45;

      v13 = v48;
      v15 = (void *)v47;

    }
    else
    {
      objc_msgSend(v11, "widthAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAttributionView preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
      objc_msgSend(v13, "constraintEqualToConstant:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v14;
      -[SWAttributionView widthAnchor](self, "widthAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAttributionView slAttributionView](self, "slAttributionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "widthAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v18;
      -[SWAttributionView heightAnchor](self, "heightAnchor");
      v19 = objc_claimAutoreleasedReturnValue();
      -[SWAttributionView slAttributionView](self, "slAttributionView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "heightAnchor");
      v20 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)v19;
      v21 = (void *)v19;
      v22 = (void *)v20;
      objc_msgSend(v21, "constraintEqualToAnchor:", v20);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v55[2] = v50;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:");
    }

  }
  -[SWAttributionView setConstraints:](self, "setConstraints:", v7);
  -[SWAttributionView constraints](self, "constraints");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33)
  {
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[SWAttributionView constraints](self, "constraints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v35);

  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SWAttributionView frame](self, "frame");
  v4 = v3;
  -[SWAttributionView slAttributionView](self, "slAttributionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;

  v8 = v4;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setHighlight:(SWHighlight *)highlight
{
  SWHighlight *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SWHighlight *v13;

  v5 = highlight;
  if (self->_highlight != v5)
  {
    v13 = v5;
    -[SWAttributionView slAttributionView](self, "slAttributionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SWAttributionView slAttributionView](self, "slAttributionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

      -[SWAttributionView setSlAttributionView:](self, "setSlAttributionView:", 0);
    }
    objc_storeStrong((id *)&self->_highlight, highlight);
    v5 = v13;
    if (v13)
    {
      v8 = objc_alloc(MEMORY[0x1E0DA8828]);
      -[SWHighlight slHighlight](v13, "slHighlight");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithHighlight:", v9);
      -[SWAttributionView setSlAttributionView:](self, "setSlAttributionView:", v10);

      -[SWAttributionView slAttributionView](self, "slAttributionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[SWAttributionView slAttributionView](self, "slAttributionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAttributionView addSubview:](self, "addSubview:", v12);

      -[SWAttributionView _updateSLAttributionViewAlignment](self, "_updateSLAttributionViewAlignment");
      -[SWAttributionView _updateSLAttributionViewBackgroundStyle](self, "_updateSLAttributionViewBackgroundStyle");
      -[SWAttributionView _updateSLAttributionViewSupplementalMenu](self, "_updateSLAttributionViewSupplementalMenu");
      -[SWAttributionView _updateSLAttributionViewHideMenuItemTitle](self, "_updateSLAttributionViewHideMenuItemTitle");
      -[SWAttributionView _updateSLAttributionViewEnablesMarquee](self, "_updateSLAttributionViewEnablesMarquee");
      -[SWAttributionView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      v5 = v13;
    }
  }

}

- (void)setDisplayContext:(SWAttributionViewDisplayContext)displayContext
{
  void *v4;

  if (self->_displayContext != displayContext)
  {
    self->_displayContext = displayContext;
    -[SWAttributionView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[SWAttributionView _sendFeedbackForCurrentDisplayContext](self, "_sendFeedbackForCurrentDisplayContext");
  }
}

- (void)setHorizontalAlignment:(SWAttributionViewHorizontalAlignment)horizontalAlignment
{
  self->_horizontalAlignment = horizontalAlignment;
  -[SWAttributionView _updateSLAttributionViewAlignment](self, "_updateSLAttributionViewAlignment");
}

- (void)_updateSLAttributionViewAlignment
{
  SWAttributionViewHorizontalAlignment v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = -[SWAttributionView horizontalAlignment](self, "horizontalAlignment");
  v4 = 1;
  if (v3 != SWAttributionViewHorizontalAlignmentCenter)
    v4 = -1;
  if (v3 == SWAttributionViewHorizontalAlignmentTrailing)
    v5 = 2;
  else
    v5 = v4;
  -[SWAttributionView slAttributionView](self, "slAttributionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateAlignment:", v5);

}

- (void)setBackgroundStyle:(SWAttributionViewBackgroundStyle)backgroundStyle
{
  self->_backgroundStyle = backgroundStyle;
  -[SWAttributionView _updateSLAttributionViewBackgroundStyle](self, "_updateSLAttributionViewBackgroundStyle");
}

- (void)_updateSLAttributionViewBackgroundStyle
{
  SWAttributionViewBackgroundStyle v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = -[SWAttributionView backgroundStyle](self, "backgroundStyle");
  if (v3 == SWAttributionViewBackgroundStyleColor)
    v4 = 0;
  else
    v4 = -1;
  if (v3 == SWAttributionViewBackgroundStyleMaterial)
    v5 = 1;
  else
    v5 = v4;
  -[SWAttributionView slAttributionView](self, "slAttributionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateBackgroundStyle:", v5);

}

- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth
{
  if ((SL_CGFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    -[SWAttributionView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", preferredMaxLayoutWidth == 0.0);
    self->_preferredMaxLayoutWidth = preferredMaxLayoutWidth;
    -[SWAttributionView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (UIMenu)highlightMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  UIMenu *highlightMenu;
  UIMenu *v11;
  UIMenu *v12;
  UIMenu *v13;

  -[SWAttributionView slAttributionView](self, "slAttributionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextMenuItems");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  -[UIMenu children](self->_highlightMenu, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToArray:", v7);

  highlightMenu = self->_highlightMenu;
  if (!highlightMenu || (v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v7);
    v11 = (UIMenu *)objc_claimAutoreleasedReturnValue();
    v12 = self->_highlightMenu;
    self->_highlightMenu = v11;

    highlightMenu = self->_highlightMenu;
  }
  v13 = highlightMenu;

  return v13;
}

- (void)setSupplementalMenu:(UIMenu *)supplementalMenu
{
  UIMenu *v5;
  UIMenu *v6;

  v5 = supplementalMenu;
  if (self->_supplementalMenu != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_supplementalMenu, supplementalMenu);
    -[SWAttributionView _updateSLAttributionViewSupplementalMenu](self, "_updateSLAttributionViewSupplementalMenu");
    v5 = v6;
  }

}

- (void)_updateSLAttributionViewSupplementalMenu
{
  void *v3;
  id v4;

  -[SWAttributionView supplementalMenu](self, "supplementalMenu");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SWAttributionView slAttributionView](self, "slAttributionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSupplementalMenu:", v4);

}

- (void)setMenuTitleForHideAction:(NSString *)menuTitleForHideAction
{
  NSString *v5;

  v5 = menuTitleForHideAction;
  if (!-[NSString isEqualToString:](self->_menuTitleForHideAction, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_menuTitleForHideAction, menuTitleForHideAction);
    -[SWAttributionView _updateSLAttributionViewHideMenuItemTitle](self, "_updateSLAttributionViewHideMenuItemTitle");
  }

}

- (void)_updateSLAttributionViewHideMenuItemTitle
{
  void *v3;
  id v4;

  -[SWAttributionView menuTitleForHideAction](self, "menuTitleForHideAction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SWAttributionView slAttributionView](self, "slAttributionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHideMenuItemTitle:", v4);

}

- (id)closeButton
{
  void *v2;
  void *v3;

  -[SWAttributionView slAttributionView](self, "slAttributionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)useBannerLayout
{
  id v2;

  -[SWAttributionView slAttributionView](self, "slAttributionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "useBannerLayout");

}

- (void)setBlurEffectGroupName:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", self->_blurEffectGroupName) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_blurEffectGroupName, a3);
    -[SWAttributionView blurEffectGroupName](self, "blurEffectGroupName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWAttributionView slAttributionView](self, "slAttributionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBlurEffectGroupName:", v5);

  }
}

- (void)_sendFeedbackForCurrentDisplayContext
{
  void *v3;
  id v4;

  if (-[SWAttributionView displayContext](self, "displayContext") == SWAttributionViewDisplayContextDetail)
  {
    -[SWAttributionView highlight](self, "highlight");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "slHighlight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SLSendPortraitFeedbackTypeUserInteractedWithHighlight();
  }
  else
  {
    -[SWAttributionView highlight](self, "highlight");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "slHighlight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SLSendPortraitFeedbackTypeDisplayedHighlight();
  }

}

- (NSString)blurEffectGroupName
{
  return self->_blurEffectGroupName;
}

- (SWHighlight)highlight
{
  return self->_highlight;
}

- (SWAttributionViewDisplayContext)displayContext
{
  return self->_displayContext;
}

- (SWAttributionViewHorizontalAlignment)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (SWAttributionViewBackgroundStyle)backgroundStyle
{
  return self->_backgroundStyle;
}

- (CGFloat)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (NSString)menuTitleForHideAction
{
  return self->_menuTitleForHideAction;
}

- (UIMenu)supplementalMenu
{
  return self->_supplementalMenu;
}

- (BOOL)enablesMarquee
{
  return self->_enablesMarquee;
}

- (SLAttributionView)slAttributionView
{
  return self->_slAttributionView;
}

- (void)setSlAttributionView:(id)a3
{
  objc_storeStrong((id *)&self->_slAttributionView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_slAttributionView, 0);
  objc_storeStrong((id *)&self->_supplementalMenu, 0);
  objc_storeStrong((id *)&self->_menuTitleForHideAction, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_blurEffectGroupName, 0);
  objc_storeStrong((id *)&self->_highlightMenu, 0);
}

@end
