@implementation AKHighlightColorEditorController

- (void)releaseOutlets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKHighlightColorEditorController;
  -[AKAnnotationPopoverViewController releaseOutlets](&v7, sel_releaseOutlets);
  -[AKHighlightColorEditorController setCalloutBar:](self, "setCalloutBar:", 0);
  -[AKHighlightColorEditorController setColorControls:](self, "setColorControls:", 0);
  -[AKHighlightColorEditorController addNoteButton](self, "addNoteButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[AKHighlightColorEditorController setAddNoteButton:](self, "setAddNoteButton:", 0);
  -[AKHighlightColorEditorController deleteButton](self, "deleteButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[AKHighlightColorEditorController setDeleteButton:](self, "setDeleteButton:", 0);
  -[AKHighlightColorEditorController rightArrowButton](self, "rightArrowButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[AKHighlightColorEditorController setRightArrowButton:](self, "setRightArrowButton:", 0);
  -[AKHighlightColorEditorController shareButton](self, "shareButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[AKHighlightColorEditorController setShareButton:](self, "setShareButton:", 0);
  -[AKHighlightColorEditorController setAlertController:](self, "setAlertController:", 0);
}

- (void)loadView
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 435.0, 55.0);
  -[AKHighlightColorEditorController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  AKCalloutBar *v3;
  void *v4;
  AKCalloutBar *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  AKFingerPotView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  AKFingerPotView *v16;
  void *v17;
  void *v18;
  void *v19;
  AKFingerPotView *v20;
  void *v21;
  void *v22;
  void *v23;
  UIButton *v24;
  UIButton *mAddNoteButton;
  UIButton *v26;
  void *v27;
  void *v28;
  void *v29;
  UIButton *v30;
  UIButton *mShareButton;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  void *v44;
  void *v45;
  double v46;
  double Width;
  double Height;
  void *v49;
  void *v50;
  int v51;
  objc_super v52;
  CGRect v53;
  CGRect v54;

  v52.receiver = self;
  v52.super_class = (Class)AKHighlightColorEditorController;
  -[AKAnnotationPopoverViewController viewDidLoad](&v52, sel_viewDidLoad);
  v3 = [AKCalloutBar alloc];
  -[AKHighlightColorEditorController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[AKCalloutBar initWithFrame:](v3, "initWithFrame:");

  -[AKCalloutBar setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[AKAnnotationPopoverViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AKAnnotationPopoverViewController annotation](self, "annotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v7, "editorController:isRightArrowEnabledForAnnotation:", self, v8);

  }
  else
  {
    v51 = 1;
  }
  if (-[AKHighlightColorEditorController p_shouldShowCompactMenu](self, "p_shouldShowCompactMenu"))
  {
    -[AKAnnotationPopoverViewController annotationTheme](self, "annotationTheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AKHighlightColorEditorController p_buttonTagForTheme:](self, "p_buttonTagForTheme:", v9);

    v11 = [AKFingerPotView alloc];
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v16 = -[AKFingerPotView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x24BDBF090], v13, v14, v15);
    -[AKHighlightColorEditorController p_paletteImageForTag:pageTheme:](self, "p_paletteImageForTag:pageTheme:", v10, -[AKHighlightColorEditorController pageTheme](self, "pageTheme"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFingerPotView setImage:forState:](v16, "setImage:forState:", v17, 0);

    -[AKFingerPotView addTarget:action:forControlEvents:](v16, "addTarget:action:forControlEvents:", self, sel_showColorControlsMenu_, 64);
    -[AKFingerPotView setFrame:](v16, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    +[AKController akBundle](AKController, "akBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Selection_Menu_Colors"), CFSTR("Colors…"), CFSTR("AKHighlightColorEditorController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFingerPotView setAccessibilityLabel:](v16, "setAccessibilityLabel:", v19);

  }
  else
  {
    -[AKHighlightColorEditorController colorControls](self, "colorControls");
    v16 = (AKFingerPotView *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  objc_msgSend(v6, "addObject:", v16);
  v20 = -[AKFingerPotView initWithFrame:]([AKFingerPotView alloc], "initWithFrame:", v12, v13, v14, v15);
  objc_msgSend(MEMORY[0x24BDF6AC8], "akImageNamed:", CFSTR("ib_text_pop_icon_trash"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFingerPotView setImage:forState:](v20, "setImage:forState:", v21, 0);

  -[AKFingerPotView addTarget:action:forControlEvents:](v20, "addTarget:action:forControlEvents:", self, sel_handleDeleteButtonTap_, 64);
  -[AKFingerPotView setFrame:](v20, "setFrame:", 0.0, 0.0, 40.0, 38.0);
  +[AKController akBundle](AKController, "akBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Selection_Menu_Delete_Highlight"), CFSTR("Remove Highlight"), CFSTR("AKHighlightColorEditorController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFingerPotView setAccessibilityLabel:](v20, "setAccessibilityLabel:", v23);

  -[AKHighlightColorEditorController setDeleteButton:](self, "setDeleteButton:", v20);
  objc_msgSend(v6, "addObject:", v20);
  +[AKCalloutButton buttonWithType:](AKCalloutButton, "buttonWithType:", 0);
  v24 = (UIButton *)objc_claimAutoreleasedReturnValue();
  mAddNoteButton = self->mAddNoteButton;
  self->mAddNoteButton = v24;

  v26 = self->mAddNoteButton;
  -[AKHighlightColorEditorController p_noteGlyphForTag:pageTheme:](self, "p_noteGlyphForTag:pageTheme:", 1, -[AKHighlightColorEditorController pageTheme](self, "pageTheme"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](v26, "setImage:forState:", v27, 0);

  -[UIButton addTarget:action:forControlEvents:](self->mAddNoteButton, "addTarget:action:forControlEvents:", self, sel_handleAddNoteButton_, 64);
  -[UIButton setFrame:](self->mAddNoteButton, "setFrame:", 0.0, 0.0, 40.0, 38.0);
  +[AKController akBundle](AKController, "akBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Selection_Menu_Annotate"), CFSTR("Note"), CFSTR("AKHighlightColorEditorController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setAccessibilityLabel:](self->mAddNoteButton, "setAccessibilityLabel:", v29);

  objc_msgSend(v6, "addObject:", self->mAddNoteButton);
  if (-[AKHighlightColorEditorController p_shouldShowShareButton](self, "p_shouldShowShareButton"))
  {
    +[AKCalloutButton buttonWithType:](AKCalloutButton, "buttonWithType:", 0);
    v30 = (UIButton *)objc_claimAutoreleasedReturnValue();
    mShareButton = self->mShareButton;
    self->mShareButton = v30;

    objc_msgSend(MEMORY[0x24BDF6AC8], "akImageNamed:", CFSTR("ib_text_pop_icon_actions"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](self->mShareButton, "setImage:forState:", v32, 0);
    -[UIButton addTarget:action:forControlEvents:](self->mShareButton, "addTarget:action:forControlEvents:", self, sel_handleShareButton_, 64);
    -[UIButton setFrame:](self->mShareButton, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    +[AKController akBundle](AKController, "akBundle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Selection_Menu_Share"), CFSTR("Share"), CFSTR("AKHighlightColorEditorController"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](self->mShareButton, "setAccessibilityLabel:", v34);

    objc_msgSend(v6, "addObject:", self->mShareButton);
  }
  if (v51)
  {
    +[AKCalloutButton buttonWithType:](AKCalloutButton, "buttonWithType:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "akImageNamed:", CFSTR("ib_text_pop_icon_more"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setImage:forState:", v36, 0);

    objc_msgSend(v35, "addTarget:action:forControlEvents:", self, sel_handleRightArrowButton_, 64);
    objc_msgSend(v35, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    +[AKController akBundle](AKController, "akBundle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Selection_Menu_More"), CFSTR("More"), CFSTR("AKHighlightColorEditorController"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAccessibilityLabel:", v38);

    -[AKHighlightColorEditorController setRightArrowButton:](self, "setRightArrowButton:", v35);
    objc_msgSend(v6, "addObject:", v35);

  }
  -[AKCalloutBar setControls:](v5, "setControls:", v6);
  -[AKCalloutBar sizeThatFitsControls:](v5, "sizeThatFitsControls:", v6);
  v40 = v39;
  v42 = v41;
  if (-[AKHighlightColorEditorController p_shouldShowCompactMenu](self, "p_shouldShowCompactMenu"))
  {
    v43 = objc_alloc(MEMORY[0x24BDBCE30]);
    -[AKHighlightColorEditorController colorControls](self, "colorControls");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v43, "initWithObjects:", v44, 0);

    -[AKCalloutBar sizeThatFitsControls:](v5, "sizeThatFitsControls:", v45);
    if (v40 < v46)
      v40 = v46;

  }
  -[AKCalloutBar setFrame:](v5, "setFrame:", 0.0, 0.0, v40, v42);
  -[AKCalloutBar frame](v5, "frame");
  Width = CGRectGetWidth(v53);
  -[AKCalloutBar frame](v5, "frame");
  Height = CGRectGetHeight(v54);
  -[AKHighlightColorEditorController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", 0.0, 0.0, Width, Height);

  -[AKHighlightColorEditorController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addSubview:", v5);

  -[AKHighlightColorEditorController setCalloutBar:](self, "setCalloutBar:", v5);
  -[AKHighlightColorEditorController p_updateAppearance](self, "p_updateAppearance");

}

- (BOOL)p_shouldShowShareButton
{
  void *v3;
  void *v4;
  char v5;

  -[AKAnnotationPopoverViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AKAnnotationPopoverViewController annotation](self, "annotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "editorController:isSharingEnabledForAnnotation:", self, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)p_shouldShowCompactMenu
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 1;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithHorizontalSizeClass:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsTraitsInCollection:", v6);

  if ((v7 & 1) == 0)
    v5 = -[AKHighlightColorEditorController p_shouldShowShareButton](self, "p_shouldShowShareButton");

  return v5;
}

- (UIView)colorControls
{
  UIView *mColorControls;
  UIView *v4;
  UIView *v5;
  void *v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t i;
  uint64_t v17;
  AKFingerPotView *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  mColorControls = self->mColorControls;
  if (!mColorControls)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    v5 = self->mColorControls;
    self->mColorControls = v4;

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Yellow"), CFSTR("Green"), CFSTR("Blue"), CFSTR("Pink"), CFSTR("Purple"), CFSTR("Underline"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    if (-[AKHighlightColorEditorController p_shouldShowCompactMenu](self, "p_shouldShowCompactMenu"))
      v7 = 0.0;
    else
      v7 = 2.0;
    v24 = 0uLL;
    v25 = 0uLL;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      v12 = *MEMORY[0x24BDBF090];
      v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v17 = objc_msgSend(v8, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i)) + 1;
          v18 = -[AKFingerPotView initWithFrame:]([AKFingerPotView alloc], "initWithFrame:", v12, v13, v14, v15);
          -[AKHighlightColorEditorController p_colorControlImageForTag:pageTheme:](self, "p_colorControlImageForTag:pageTheme:", v17, -[AKHighlightColorEditorController pageTheme](self, "pageTheme"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKFingerPotView setMenuImage:](v18, "setMenuImage:", v19);

          -[AKHighlightColorEditorController localizedAccessibilityStringForStyle:](self, "localizedAccessibilityStringForStyle:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKFingerPotView setAccessibilityLabel:](v18, "setAccessibilityLabel:", v20);

          -[AKFingerPotView addTarget:action:forControlEvents:](v18, "addTarget:action:forControlEvents:", self, sel_useColorOf_, 64);
          -[AKFingerPotView setFrame:](v18, "setFrame:", v7, 0.0, 38.0, 38.0);
          -[AKFingerPotView setTag:](v18, "setTag:", v17);
          -[UIView addSubview:](self->mColorControls, "addSubview:", v18);
          v7 = v7 + 42.0;

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    -[UIView setFrame:](self->mColorControls, "setFrame:", 0.0, 0.0, v7 + -5.0, 38.0);
    mColorControls = self->mColorControls;
  }
  return mColorControls;
}

- (int64_t)p_buttonTagForTheme:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = 2;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = 4;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v4 = 5;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v4 = 6;
            else
              v4 = 0;
          }
        }
      }
    }
  }

  return v4;
}

- (void)p_updateAppearance
{
  void *v3;
  int64_t v4;
  uint64_t i;
  void *v6;
  UIButton *mAddNoteButton;
  void *v8;
  _BOOL8 v9;
  id v10;

  if (-[AKHighlightColorEditorController isViewLoaded](self, "isViewLoaded"))
  {
    -[AKAnnotationPopoverViewController annotationTheme](self, "annotationTheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[AKHighlightColorEditorController p_buttonTagForTheme:](self, "p_buttonTagForTheme:", v3);

    for (i = 1; i != 7; ++i)
    {
      -[UIView viewWithTag:](self->mColorControls, "viewWithTag:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSelected:", v4 == i);

    }
    mAddNoteButton = self->mAddNoteButton;
    -[AKHighlightColorEditorController p_noteGlyphForTag:pageTheme:](self, "p_noteGlyphForTag:pageTheme:", v4, -[AKHighlightColorEditorController pageTheme](self, "pageTheme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](mAddNoteButton, "setImage:forState:", v8, 0);

    v9 = self->super.mPosition == 1;
    -[AKHighlightColorEditorController calloutBar](self, "calloutBar");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUp:", v9);

  }
}

- (BOOL)canPresentInPosition:(int)a3
{
  return a3 == 0;
}

- (void)willShow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKHighlightColorEditorController;
  -[AKAnnotationPopoverViewController willShow](&v4, sel_willShow);
  -[AKHighlightColorEditorController calloutBar](self, "calloutBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBlurDisabled:", 1);

}

- (void)didShow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKHighlightColorEditorController;
  -[AKAnnotationPopoverViewController didShow](&v4, sel_didShow);
  -[AKHighlightColorEditorController calloutBar](self, "calloutBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBlurDisabled:", 0);

}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MidX;
  void *v20;
  objc_super v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)AKHighlightColorEditorController;
  v9 = a4;
  -[AKAnnotationPopoverViewController presentFromRect:view:](&v21, sel_presentFromRect_view_, v9, x, y, width, height);
  -[AKHighlightColorEditorController calloutBar](self, "calloutBar", v21.receiver, v21.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v22.origin.x = v12;
  v22.origin.y = v14;
  v22.size.width = v16;
  v22.size.height = v18;
  MidX = CGRectGetMidX(v22);
  -[AKHighlightColorEditorController calloutBar](self, "calloutBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setArrowX:", MidX);

}

- (void)setPosition:(int)a3
{
  self->super.mPosition = a3;
  -[AKHighlightColorEditorController p_updateAppearance](self, "p_updateAppearance");
}

- (id)localizedAccessibilityStringForStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  switch(a3)
  {
    case 1:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Highlight_Style_Yellow");
      v6 = CFSTR("Yellow");
      goto LABEL_9;
    case 2:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Highlight_Style_Green");
      v6 = CFSTR("Green");
      goto LABEL_9;
    case 3:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Highlight_Style_Blue");
      v6 = CFSTR("Blue");
      goto LABEL_9;
    case 4:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Highlight_Style_Pink");
      v6 = CFSTR("Pink");
      goto LABEL_9;
    case 5:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Highlight_Style_Purple");
      v6 = CFSTR("Purple");
      goto LABEL_9;
    case 6:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Highlight_Style_Underline");
      v6 = CFSTR("Underline");
LABEL_9:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v6, CFSTR("AKHighlightColorEditorController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

- (id)p_themeForStyle:(int64_t)a3 pageTheme:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  switch(a3)
  {
    case 1:
      +[AKAnnotationTheme yellowTheme:](AKAnnotationTheme, "yellowTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[AKAnnotationTheme greenTheme:](AKAnnotationTheme, "greenTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[AKAnnotationTheme blueTheme:](AKAnnotationTheme, "blueTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[AKAnnotationTheme pinkTheme:](AKAnnotationTheme, "pinkTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[AKAnnotationTheme purpleTheme:](AKAnnotationTheme, "purpleTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[AKAnnotationTheme underlineTheme:](AKAnnotationTheme, "underlineTheme:", *(_QWORD *)&a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (void)p_setStyle:(int64_t)a3 forAnnotation:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  -[AKAnnotationPopoverViewController annotationTheme](self, "annotationTheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pageTheme");

  -[AKHighlightColorEditorController p_themeForStyle:pageTheme:](self, "p_themeForStyle:pageTheme:", a3, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationPopoverViewController setAnnotationTheme:](self, "setAnnotationTheme:", v10);
  -[AKAnnotationPopoverViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "editorController:setTheme:forAnnotation:", self, v10, v6);

}

- (void)p_removeAnnotation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAnnotationPopoverViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editorController:deleteAnnotation:", self, v4);

}

- (void)p_postDeleteConfirmation
{
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
  _QWORD v14[5];

  +[AKController akBundle](AKController, "akBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Delete_Highlight_Title"), CFSTR("Delete Highlight"), CFSTR("AKHighlightColorEditorController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKController akBundle](AKController, "akBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Delete_Highlight_Message"), CFSTR("The associated note will also be deleted."), CFSTR("AKHighlightColorEditorController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKController akBundle](AKController, "akBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Delete_Highlight_Cancel"), CFSTR("Cancel"), CFSTR("AKHighlightColorEditorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKController akBundle](AKController, "akBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Delete_Highlight_Delete"), CFSTR("Delete"), CFSTR("AKHighlightColorEditorController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightColorEditorController setAlertController:](self, "setAlertController:", v11);
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v8, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v12);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_22902B22C;
  v14[3] = &unk_24F1A7DD8;
  v14[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v10, 2, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v13);

  -[AKHighlightColorEditorController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[AKHighlightColorEditorController alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  -[AKHighlightColorEditorController setAlertController:](self, "setAlertController:", 0);
  v6.receiver = self;
  v6.super_class = (Class)AKHighlightColorEditorController;
  -[AKAnnotationPopoverViewController setDelegate:](&v6, sel_setDelegate_, v4);

}

- (void)useColorOf:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "tag");
  -[AKAnnotationPopoverViewController annotation](self, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightColorEditorController p_setStyle:forAnnotation:](self, "p_setStyle:forAnnotation:", v4, v5);

  -[AKHighlightColorEditorController p_updateAppearance](self, "p_updateAppearance");
}

- (void)showColorControlsMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[AKHighlightColorEditorController colorControls](self, "colorControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "initWithObjects:", v5, 0);

  -[AKHighlightColorEditorController calloutBar](self, "calloutBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setControls:", v7);

}

- (void)handleAddNoteButton:(id)a3
{
  void *v4;
  id v5;

  -[AKAnnotationPopoverViewController hide](self, "hide", a3);
  -[AKAnnotationPopoverViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationPopoverViewController annotation](self, "annotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editorController:editNote:", self, v4);

}

- (void)handleShareButton:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[AKAnnotationPopoverViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AKAnnotationPopoverViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAnnotationPopoverViewController annotation](self, "annotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editorController:shareAnnotation:", self, v7);

  }
  -[AKAnnotationPopoverViewController hide](self, "hide");
}

- (void)handleDeleteButtonTap:(id)a3
{
  void *v4;

  -[AKAnnotationPopoverViewController annotation](self, "annotation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightColorEditorController p_removeAnnotation:](self, "p_removeAnnotation:", v4);

  -[AKAnnotationPopoverViewController hide](self, "hide");
}

- (void)handleRightArrowButton:(id)a3
{
  void *v4;
  id v5;

  -[AKAnnotationPopoverViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationPopoverViewController hide](self, "hide");
  -[AKAnnotationPopoverViewController annotation](self, "annotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editorController:showEditMenuForAnnotation:", self, v4);

}

- (id)p_colorForTag:(int64_t)a3 pageTheme:(int)a4
{
  void *v6;
  void *v7;
  void *v9;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22902B690;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  if (qword_255A270F8 != -1)
    dispatch_once(&qword_255A270F8, block);
  v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        v7 = (void *)qword_255A270D8;
        goto LABEL_12;
      case 1:
        v7 = (void *)qword_255A270E0;
        goto LABEL_12;
      case 2:
        v7 = (void *)qword_255A270E8;
        goto LABEL_12;
      case 3:
        v7 = (void *)qword_255A270F0;
        goto LABEL_12;
      case 4:
        v7 = (void *)qword_255A270D0;
LABEL_12:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        return v6;
      default:
        return 0;
    }
  }
  return v6;
}

- (void)p_drawColorControlCircleWithFrame:(CGRect)a3 color:(id)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  CGContext *CurrentContext;
  void *v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v9 = CGRectGetWidth(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v10 = CGRectGetHeight(v15);
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(v8, "setStroke");
  objc_msgSend(v8, "setFill");

  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", x, y, v11, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stroke");
  objc_msgSend(v13, "fill");

  CGContextRestoreGState(CurrentContext);
}

- (id)p_colorControlImageForColor:(id)a3 withForegroundImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CGSize v10;

  v6 = a4;
  v7 = a3;
  v10.width = 38.0;
  v10.height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  -[AKHighlightColorEditorController p_drawColorControlCircleWithFrame:color:](self, "p_drawColorControlCircleWithFrame:color:", v7, 6.0, 6.0, 26.0, 26.0);

  objc_msgSend(v6, "drawAtPoint:", 6.0, 6.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v8;
}

- (id)p_colorControlImageForColor:(id)a3
{
  return -[AKHighlightColorEditorController p_colorControlImageForColor:withForegroundImage:](self, "p_colorControlImageForColor:withForegroundImage:", a3, 0);
}

- (id)p_underlineForegroundImageForPageTheme:(int)a3
{
  const __CFString *v3;

  if (a3 == 3)
    v3 = CFSTR("ib_text_pop_icon_highlight_underline_night");
  else
    v3 = CFSTR("ib_text_pop_icon_highlight_underline");
  return (id)objc_msgSend(MEMORY[0x24BDF6AC8], "akImageNamed:", v3);
}

- (id)p_colorControlUnderlineImageForPageTheme:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  -[AKHighlightColorEditorController p_colorForTag:pageTheme:](self, "p_colorForTag:pageTheme:", 6, *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightColorEditorController p_underlineForegroundImageForPageTheme:](self, "p_underlineForegroundImageForPageTheme:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightColorEditorController p_colorControlImageForColor:withForegroundImage:](self, "p_colorControlImageForColor:withForegroundImage:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)p_colorControlImageForTag:(int64_t)a3 pageTheme:(int)a4
{
  void *v6;
  void *v7;
  void *v9;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22902BCFC;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  if (qword_255A27128 != -1)
    dispatch_once(&qword_255A27128, block);
  v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        v7 = (void *)qword_255A27108;
        goto LABEL_12;
      case 1:
        v7 = (void *)qword_255A27110;
        goto LABEL_12;
      case 2:
        v7 = (void *)qword_255A27118;
        goto LABEL_12;
      case 3:
        v7 = (void *)qword_255A27120;
        goto LABEL_12;
      case 4:
        v7 = (void *)qword_255A27100;
LABEL_12:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        return v6;
      default:
        return 0;
    }
  }
  return v6;
}

- (void)p_drawCrescentWithCircleRect:(CGRect)a3 color:(id)a4 leftShift:(double)a5 addRadius:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  id v12;
  CGContext *CurrentContext;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double MaxX;
  double v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  void *v25;
  double MidY;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v28 = CGRectGetMidX(v31) - a5;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MidY = CGRectGetMidY(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v27 = a6;
  v29 = height;
  v30 = CGRectGetHeight(v33) * 0.5 + a6;
  v34.origin.x = x - a5;
  v34.origin.y = y;
  v14 = y;
  v34.size.width = width;
  v15 = width;
  v34.size.height = height;
  v35 = CGRectInset(v34, -a6, -a6);
  v16 = v35.origin.x;
  v17 = v35.origin.y;
  v18 = v35.size.height;
  MaxX = CGRectGetMaxX(v35);
  v36.origin.x = x;
  v36.origin.y = v14;
  v36.size.width = v15;
  v36.size.height = height;
  v20 = CGRectGetMaxX(v36);
  if (MaxX < v20)
    MaxX = v20;
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v28, MidY, v30, -1.57079633, 1.57079633, *(_QWORD *)&MidY);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37.origin.x = v16;
  v37.origin.y = v17;
  v37.size.width = MaxX;
  v37.size.height = v18;
  v22 = CGRectGetMaxX(v37) + v27;
  v38.origin.x = v16;
  v38.origin.y = v17;
  v38.size.width = MaxX;
  v38.size.height = v18;
  objc_msgSend(v21, "addLineToPoint:", v22, CGRectGetMaxY(v38));
  v39.origin.x = v16;
  v39.origin.y = v17;
  v39.size.width = MaxX;
  v39.size.height = v18;
  v23 = CGRectGetMaxX(v39) + v27;
  v40.origin.x = v16;
  v40.origin.y = v17;
  v40.size.width = MaxX;
  v40.size.height = v18;
  objc_msgSend(v21, "addLineToPoint:", v23, CGRectGetMinY(v40));
  v41.origin.x = v16;
  v41.origin.y = v17;
  v41.size.width = MaxX;
  v41.size.height = v18;
  v24 = v30 + CGRectGetMinX(v41);
  v42.origin.x = v16;
  v42.origin.y = v17;
  v42.size.width = MaxX;
  v42.size.height = v18;
  objc_msgSend(v21, "addLineToPoint:", v24, CGRectGetMinY(v42));
  objc_msgSend(v21, "closePath");
  objc_msgSend(v21, "addClip");
  objc_msgSend(v12, "setStroke");
  objc_msgSend(v12, "setFill");

  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", x, v14, v15, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stroke");
  objc_msgSend(v25, "fill");

  CGContextRestoreGState(CurrentContext);
}

- (id)p_paletteImageWithFrontColor:(id)a3 middleColor:(id)a4 backColor:(id)a5 frontForegroundImage:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGSize v21;

  v10 = (void *)MEMORY[0x24BDF6D38];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "scale");
    v17 = v16;

    if (v17 <= 1.0)
      v18 = 2.0;
    else
      v18 = 1.5;
  }
  else
  {

    v18 = 2.0;
  }
  v21.width = 40.0;
  v21.height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
  -[AKHighlightColorEditorController p_drawCrescentWithCircleRect:color:leftShift:addRadius:](self, "p_drawCrescentWithCircleRect:color:leftShift:addRadius:", v12, 11.5, 5.0, 27.0, 27.0, 5.0, v18);

  -[AKHighlightColorEditorController p_drawCrescentWithCircleRect:color:leftShift:addRadius:](self, "p_drawCrescentWithCircleRect:color:leftShift:addRadius:", v13, 6.5, 5.0, 27.0, 27.0, 5.0, v18);
  -[AKHighlightColorEditorController p_drawColorControlCircleWithFrame:color:](self, "p_drawColorControlCircleWithFrame:color:", v14, 1.5, 5.0, 27.0, 27.0);

  objc_msgSend(v11, "drawInRect:", 1.5, 5.0, 27.0, 27.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v19;
}

- (id)p_buildPaletteImageForFrontTag:(int64_t)a3 middleTag:(int64_t)a4 backTag:(int64_t)a5 pageTheme:(int)a6
{
  uint64_t v6;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = *(_QWORD *)&a6;
  -[AKHighlightColorEditorController p_colorForTag:pageTheme:](self, "p_colorForTag:pageTheme:", a3, *(_QWORD *)&a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightColorEditorController p_colorForTag:pageTheme:](self, "p_colorForTag:pageTheme:", a4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightColorEditorController p_colorForTag:pageTheme:](self, "p_colorForTag:pageTheme:", a5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 6)
  {
    -[AKHighlightColorEditorController p_underlineForegroundImageForPageTheme:](self, "p_underlineForegroundImageForPageTheme:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  -[AKHighlightColorEditorController p_paletteImageWithFrontColor:middleColor:backColor:frontForegroundImage:](self, "p_paletteImageWithFrontColor:middleColor:backColor:frontForegroundImage:", v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)p_paletteImageForTag:(int64_t)a3 pageTheme:(int)a4
{
  void *v6;
  void *v7;
  void *v9;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22902C640;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  if (qword_255A27158 != -1)
    dispatch_once(&qword_255A27158, block);
  v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        v7 = (void *)qword_255A27138;
        goto LABEL_12;
      case 1:
        v7 = (void *)qword_255A27140;
        goto LABEL_12;
      case 2:
        v7 = (void *)qword_255A27148;
        goto LABEL_12;
      case 3:
        v7 = (void *)qword_255A27150;
        goto LABEL_12;
      case 4:
        v7 = (void *)qword_255A27130;
LABEL_12:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        return v6;
      default:
        return 0;
    }
  }
  return v6;
}

- (id)p_monochromaticImageFromImage:(id)a3 withColor:(id)a4
{
  id v5;
  id v6;
  CGContext *CurrentContext;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  CGImage *v14;
  void *v15;
  CGSize v17;
  CGRect v18;
  CGRect v19;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "size");
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v6, "size");
  v9 = v8;
  objc_msgSend(v6, "size");
  v11 = v10;
  objc_msgSend(v6, "size");
  CGContextTranslateCTM(CurrentContext, 0.0, v12);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v13 = objc_retainAutorelease(v6);
  v14 = (CGImage *)objc_msgSend(v13, "CGImage");

  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v9;
  v18.size.height = v11;
  CGContextClipToMask(CurrentContext, v18, v14);
  objc_msgSend(v5, "setFill");

  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v9;
  v19.size.height = v11;
  CGContextFillRect(CurrentContext, v19);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v15;
}

- (id)p_noteGlyphForTag:(int64_t)a3 pageTheme:(int)a4
{
  void *v6;
  void *v7;
  void *v9;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22902CB58;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  if (qword_255A27188 != -1)
    dispatch_once(&qword_255A27188, block);
  v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        v7 = (void *)qword_255A27168;
        goto LABEL_12;
      case 1:
        v7 = (void *)qword_255A27170;
        goto LABEL_12;
      case 2:
        v7 = (void *)qword_255A27178;
        goto LABEL_12;
      case 3:
        v7 = (void *)qword_255A27180;
        goto LABEL_12;
      case 4:
        v7 = (void *)qword_255A27160;
LABEL_12:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        return v6;
      default:
        return 0;
    }
  }
  return v6;
}

- (AKCalloutBar)calloutBar
{
  return self->mCalloutBar;
}

- (void)setCalloutBar:(id)a3
{
  objc_storeStrong((id *)&self->mCalloutBar, a3);
}

- (void)setColorControls:(id)a3
{
  objc_storeStrong((id *)&self->mColorControls, a3);
}

- (UIButton)addNoteButton
{
  return self->mAddNoteButton;
}

- (void)setAddNoteButton:(id)a3
{
  objc_storeStrong((id *)&self->mAddNoteButton, a3);
}

- (UIButton)deleteButton
{
  return self->mDeleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->mDeleteButton, a3);
}

- (UIButton)rightArrowButton
{
  return self->mRightArrowButton;
}

- (void)setRightArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->mRightArrowButton, a3);
}

- (UIButton)shareButton
{
  return self->mShareButton;
}

- (void)setShareButton:(id)a3
{
  objc_storeStrong((id *)&self->mShareButton, a3);
}

- (int)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int)a3
{
  self->_pageTheme = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->mShareButton, 0);
  objc_storeStrong((id *)&self->mRightArrowButton, 0);
  objc_storeStrong((id *)&self->mDeleteButton, 0);
  objc_storeStrong((id *)&self->mAddNoteButton, 0);
  objc_storeStrong((id *)&self->mColorControls, 0);
  objc_storeStrong((id *)&self->mCalloutBar, 0);
}

@end
