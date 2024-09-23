@implementation ICTextViewController

- (ICTextViewController)initWithViewControllerManager:(id)a3 editorViewController:(id)a4 note:(id)a5 initialContainerWidth:(double)a6 scrollState:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ICTextViewController *v16;
  ICTextController *v17;
  ICTextController *textController;
  uint64_t v19;
  NSMutableSet *enabledSubviews;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  ICTextView *textView;
  void *v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  ICTextBackgroundView *v38;
  ICTextBackgroundView *backgroundView;
  void *v40;
  char v41;
  ICAttributionSidebarView *v42;
  ICAttributionSidebarView *attributionSidebarView;
  id v45;
  objc_super v46;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v46.receiver = self;
  v46.super_class = (Class)ICTextViewController;
  v16 = -[ICTextViewController initWithNibName:bundle:](&v46, sel_initWithNibName_bundle_, 0, 0);
  if (v16)
  {
    v45 = v14;
    v17 = (ICTextController *)objc_alloc_init(MEMORY[0x1E0D64DB0]);
    textController = v16->_textController;
    v16->_textController = v17;

    objc_storeWeak((id *)&v16->_viewControllerManager, v12);
    objc_storeStrong((id *)&v16->_note, a5);
    v16->_initialContainerWidth = a6;
    objc_storeStrong((id *)&v16->_initialScrollState, a7);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    enabledSubviews = v16->_enabledSubviews;
    v16->_enabledSubviews = (NSMutableSet *)v19;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v16, sel_splitViewControllerWillBeginAnimatedTransitionToStateRequest_, CFSTR("ICSplitViewControllerWillBeginAnimatedTransitionToStateRequest"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v16, sel_splitViewControllerDidEndAnimatedTransitionToStateRequest_, CFSTR("ICSplitViewControllerDidEndAnimatedTransitionToStateRequest"), 0);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_opt_class();
    -[ICTextViewController textController](v16, "textController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewController note](v16, "note");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewController initialContainerWidth](v16, "initialContainerWidth");
    v28 = v27;
    -[ICTextViewController transitionScrollState](v16, "transitionScrollState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:", v25, 0, v26, 0, v29, v30, v28);
    v31 = objc_claimAutoreleasedReturnValue();
    textView = v16->_textView;
    v16->_textView = (ICTextView *)v31;

    -[ICTextView setTranslatesAutoresizingMaskIntoConstraints:](v16->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICTextView setClipsToBounds:](v16->_textView, "setClipsToBounds:", 0);
    -[ICTextView layoutManager](v16->_textView, "layoutManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDelegate:", v16);

    -[ICBaseTextView setEditorController:](v16->_textView, "setEditorController:", v13);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "timeIntervalSinceDate:", v23);
    v36 = v35;

    v37 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[ICTextViewController initWithViewControllerManager:editorViewController:note:initialContainerWidth:scrollState:].cold.1(v16, v37, v36);

    v38 = (ICTextBackgroundView *)objc_alloc_init(MEMORY[0x1E0D64DA0]);
    backgroundView = v16->_backgroundView;
    v16->_backgroundView = v38;

    -[ICTextBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](v16->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICBaseTextView editorController](v16->_textView, "editorController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEditingOnSystemPaper");

    if ((v41 & 1) == 0)
    {
      v42 = objc_alloc_init(ICAttributionSidebarView);
      attributionSidebarView = v16->_attributionSidebarView;
      v16->_attributionSidebarView = v42;

      -[ICAttributionSidebarView setTranslatesAutoresizingMaskIntoConstraints:](v16->_attributionSidebarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[ICAttributionSidebarView setTextView:](v16->_attributionSidebarView, "setTextView:", v16->_textView);
    }

    v14 = v45;
  }

  return v16;
}

- (void)loadView
{
  ICTextViewControllerView *v3;

  v3 = -[ICTextViewControllerView initWithTextView:]([ICTextViewControllerView alloc], "initWithTextView:", self->_textView);
  -[ICTextViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *attributionSidebarWidthConstraint;
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
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *attributionSidebarTrailingConstraint;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *textViewLeadingConstraint;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  objc_super v69;
  _QWORD v70[4];
  _QWORD v71[4];
  _QWORD v72[6];

  v72[4] = *MEMORY[0x1E0C80C00];
  v69.receiver = self;
  v69.super_class = (Class)ICTextViewController;
  -[ICTextViewController viewDidLoad](&v69, sel_viewDidLoad);
  -[ICTextViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    -[ICTextViewController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewController backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:atIndex:", v6, 0);

    -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ICTextViewController textView](self, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertSubview:atIndex:", v9, 0);

      v46 = (void *)MEMORY[0x1E0CB3718];
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "widthAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "fullContentWidth");
      v65 = v10;
      objc_msgSend(v10, "constraintEqualToConstant:");
      v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      attributionSidebarWidthConstraint = self->_attributionSidebarWidthConstraint;
      self->_attributionSidebarWidthConstraint = v11;

      v72[0] = v11;
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController backgroundView](self, "backgroundView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "topAnchor");
      v59 = v13;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v72[1] = v53;
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController textView](self, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "leadingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v14;
      objc_msgSend(v14, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v72[2] = v17;
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController backgroundView](self, "backgroundView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bottomAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v72[3] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "activateConstraints:", v23);

LABEL_6:
    }
  }
  else
  {
    -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[ICTextViewController textView](self, "textView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "insertSubview:atIndex:", v26, 0);

      v47 = (void *)MEMORY[0x1E0CB3718];
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController textView](self, "textView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "topAnchor");
      v65 = v27;
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v59;
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "heightAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController textView](self, "textView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "heightAnchor");
      v55 = v28;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v49;
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trailingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v18);
      v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      attributionSidebarTrailingConstraint = self->_attributionSidebarTrailingConstraint;
      self->_attributionSidebarTrailingConstraint = v29;

      v71[2] = v29;
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "widthAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fullContentWidth");
      objc_msgSend(v20, "constraintEqualToConstant:");
      v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v32 = self->_attributionSidebarWidthConstraint;
      self->_attributionSidebarWidthConstraint = v31;

      v71[3] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "activateConstraints:", v22);
      goto LABEL_6;
    }
  }
  v54 = (void *)MEMORY[0x1E0CB3718];
  -[ICTextViewController textView](self, "textView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v62);
  v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  textViewLeadingConstraint = self->_textViewLeadingConstraint;
  self->_textViewLeadingConstraint = v33;

  v70[0] = v33;
  -[ICTextViewController textView](self, "textView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v52);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v50;
  -[ICTextViewController textView](self, "textView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "widthAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v37;
  -[ICTextViewController textView](self, "textView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "activateConstraints:", v43);

  -[ICTextViewController textView](self, "textView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFindInteractionEnabled:", 1);

}

- (void)setIgnoresTaps:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  self->_ignoresTaps = a3;
  if (a3)
  {
    v25 = 0uLL;
    v26 = 0uLL;
    v23 = 0uLL;
    v24 = 0uLL;
    -[ICTextViewController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v11, "isUserInteractionEnabled"))
          {
            -[ICTextViewController enabledSubviews](self, "enabledSubviews");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v11);

            objc_msgSend(v11, "setUserInteractionEnabled:", 0);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }
  }
  else
  {
    v21 = 0uLL;
    v22 = 0uLL;
    *((_QWORD *)&v19 + 1) = 0;
    v20 = 0uLL;
    -[ICTextViewController enabledSubviews](self, "enabledSubviews", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "setUserInteractionEnabled:", 1);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v15);
    }

    -[ICTextViewController enabledSubviews](self, "enabledSubviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");
  }

  -[ICTextViewController textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSelectable:", !v3);

}

- (void)setAttributionSidebarWidth:(double)a3 isGestureActive:(BOOL)a4 animated:(BOOL)a5 currentVelocity:(double)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void (**v27)(void *, uint64_t);
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  _QWORD v34[6];
  _QWORD aBlock[6];
  BOOL v36;

  v7 = a5;
  v8 = a4;
  -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    return;
  -[ICTextViewController textViewLeadingConstraint](self, "textViewLeadingConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constant");
  v14 = v13;

  if (v14 == a3)
  {
    -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setVisibleContentWidth:isGestureActive:", v8, a3);

    if (a3 == 0.0)
      -[ICTextViewController setIgnoresTaps:](self, "setIgnoresTaps:", 0);
    return;
  }
  -[ICTextViewController attributionSidebarOpenedDate](self, "attributionSidebarOpenedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceNow");
  v18 = v17;

  -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "visibleContentWidth");
  if (a3 == 0.0 && v20 > 0.0)
  {
    if (v18 < 0.0)
      v18 = -v18;

    if (v18 <= 2.0)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewController note](self, "note");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLastAttributionsViewedDate:", v19);

  }
LABEL_12:
  -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fullContentWidth");
  v24 = v23;

  if (v24 == a3)
  {
    -[ICTextViewController textView](self, "textView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "clampTextView");

  }
  v26 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__ICTextViewController_setAttributionSidebarWidth_isGestureActive_animated_currentVelocity___block_invoke;
  aBlock[3] = &unk_1EA7E1038;
  aBlock[4] = self;
  v36 = v24 == a3;
  *(double *)&aBlock[5] = a3;
  v27 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setVisibleContentWidth:isGestureActive:", v8, a3);

  if (v7)
  {
    v29 = 1.0;
    if (a6 > 0.0)
    {
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "visibleContentWidth");
      v29 = (a3 - v31) / a6;

    }
    v34[0] = v26;
    v34[1] = 3221225472;
    v34[2] = __92__ICTextViewController_setAttributionSidebarWidth_isGestureActive_animated_currentVelocity___block_invoke_2;
    v34[3] = &unk_1EA7DE8A8;
    v34[4] = self;
    *(double *)&v34[5] = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v34, v27, 0.3, 0.0, 0.65, v29);
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    {
      -[ICTextViewController view](self, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setNeedsLayout");
    }
    else
    {
      -[ICTextViewController textViewLeadingConstraint](self, "textViewLeadingConstraint");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setConstant:", a3);

      -[ICTextViewController attributionSidebarTrailingConstraint](self, "attributionSidebarTrailingConstraint");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setConstant:", a3);
    }

    v27[2](v27, 1);
  }

}

void __92__ICTextViewController_setAttributionSidebarWidth_isGestureActive_animated_currentVelocity___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unclampTextView");

  v3 = *(unsigned __int8 *)(a1 + 48);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAttributionSidebarOpenedDate:", v4);
  }
  else
  {
    if (*(double *)(a1 + 40) != 0.0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "attributionSidebarView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reload");
  }

  objc_msgSend(*(id *)(a1 + 32), "setIgnoresTaps:", v3 != 0);
}

void __92__ICTextViewController_setAttributionSidebarWidth_isGestureActive_animated_currentVelocity___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  id v6;

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");
  }
  else
  {
    v3 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "textViewLeadingConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstant:", v3);

    v5 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "attributionSidebarTrailingConstraint");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setConstant:", v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (ICTextView)textView
{
  void *textView;
  void *v4;
  ICTextView *v5;

  -[ICTextViewController view](self, "view");
  textView = (void *)objc_claimAutoreleasedReturnValue();
  v4 = textView;
  if (textView)
    textView = self->_textView;
  v5 = textView;

  return v5;
}

- (ICTextView)textViewIfLoaded
{
  void *textView;
  void *v4;
  ICTextView *v5;

  -[ICTextViewController viewIfLoaded](self, "viewIfLoaded");
  textView = (void *)objc_claimAutoreleasedReturnValue();
  v4 = textView;
  if (textView)
    textView = self->_textView;
  v5 = textView;

  return v5;
}

- (id)editorController
{
  void *v2;
  void *v3;

  -[ICTextViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICLayoutManager)layoutManager
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICTextViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICLayoutManager *)v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[ICTextViewController captureContentOffsetStateIfNecessary](self, "captureContentOffsetStateIfNecessary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewController setTransitionScrollState:](self, "setTransitionScrollState:", v8);
  -[ICTextViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsTransitioningToNewSize:", 1);

  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__ICTextViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_1EA7E1060;
  v15[4] = self;
  v16 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __75__ICTextViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v13[3] = &unk_1EA7E1060;
  v13[4] = self;
  v14 = v16;
  v11 = v16;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, v13);
  v12.receiver = self;
  v12.super_class = (Class)ICTextViewController;
  -[ICTextViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __75__ICTextViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyCapturedContentOffsetStateIfNecessary:", *(_QWORD *)(a1 + 40));
}

uint64_t __75__ICTextViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "applyCapturedContentOffsetStateIfNecessary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsTransitioningToNewSize:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "setTransitionScrollState:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICTextViewController;
  -[ICTextViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ICTextViewController applyInitialScrollState](self, "applyInitialScrollState");
}

- (void)applyInitialScrollState
{
  void *v3;
  void *v4;

  -[ICTextViewController initialScrollState](self, "initialScrollState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICTextViewController initialScrollState](self, "initialScrollState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewController applyCapturedContentOffsetStateIfNecessary:](self, "applyCapturedContentOffsetStateIfNecessary:", v4);

  }
  -[ICTextViewController setInitialScrollState:](self, "setInitialScrollState:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICTextViewController;
  -[ICTextViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, a3);
  -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unfocusAttributionDetails");

    -[ICTextViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editorController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributionSidebarController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hideSidebarAnimated:", 0);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ICTextViewController;
  -[ICTextViewController viewDidLayoutSubviews](&v22, sel_viewDidLayoutSubviews);
  -[ICTextViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTransitioningToNewSize");

  if (v4)
  {
    -[ICTextViewController transitionScrollState](self, "transitionScrollState");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v6 = (void *)v5;
    -[ICTextViewController applyCapturedContentOffsetStateIfNecessary:](self, "applyCapturedContentOffsetStateIfNecessary:", v5);

    goto LABEL_8;
  }
  if (!-[ICTextViewController performingInitialSetup](self, "performingInitialSetup"))
  {
    -[ICTextViewController initialScrollState](self, "initialScrollState");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[ICTextViewController textView](self, "textView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v11 = v10;

      if (v11 > 0.0)
      {
        -[ICTextViewController initialScrollState](self, "initialScrollState");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
    }
  }
LABEL_8:
  v12 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "visibleContentWidth");
    v16 = v15;
    -[ICTextViewController textViewLeadingConstraint](self, "textViewLeadingConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConstant:", v16);

  }
  else
  {

    if (!v14)
      return;
  }
  -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fullContentWidth");
  v20 = v19;
  -[ICTextViewController attributionSidebarWidthConstraint](self, "attributionSidebarWidthConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setConstant:", v20);

}

- (id)captureContentOffsetStateIfNecessary
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D643E0]);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ICTextViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICTextViewScrollState scrollStateForTextView:](ICTextViewScrollState, "scrollStateForTextView:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)applyCapturedContentOffsetStateIfNecessary:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0D643E0]);

  if (+[ICExtensionSafeAPIShims applicationState](ICExtensionSafeAPIShims, "applicationState") != 2
    && (v5 & 1) == 0)
  {
    -[ICTextViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyToTextView:", v6);

  }
}

+ (id)createTextViewUsingTextController:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4 note:(id)a5 containerWidth:(double)a6 forManualRendering:(BOOL)a7 scrollState:(id)a8 traitCollection:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v14;
  id v15;
  id v16;
  id v17;
  ICLayoutManager *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  ICTextView *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  void *v41;
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v42;
  int v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  _QWORD v48[6];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;

  v11 = a7;
  v14 = a4;
  v15 = a3;
  v16 = a5;
  v17 = a8;
  v47 = a9;
  v18 = objc_alloc_init(ICLayoutManager);
  -[ICLayoutManager setShouldManuallyRenderSeparateSubviews:](v18, "setShouldManuallyRenderSeparateSubviews:", v11);
  if (createTextViewUsingTextController_stylingTextUsingSeparateTextStorageForRendering_note_containerWidth_forManualRendering_scrollState_traitCollection__onceToken != -1)
    dispatch_once(&createTextViewUsingTextController_stylingTextUsingSeparateTextStorageForRendering_note_containerWidth_forManualRendering_scrollState_traitCollection__onceToken, &__block_literal_global_25);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLForKey:", CFSTR("UseNonContiguousLayout"));

  if (v20)
  {
    -[ICLayoutManager setAllowsNonContiguousLayout:](v18, "setAllowsNonContiguousLayout:", 1);
    v21 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[ICTextViewController createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:].cold.1(v21);

  }
  v46 = v17;
  objc_msgSend(v15, "setNote:stylingTextUsingSeparateTextStorageForRendering:withLayoutManager:traitCollection:firstVisibleCharLocation:", v16, v14, v18, v47, objc_msgSend(v17, "topLeftTextCharacterIndex"));
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64DA8]), "initWithSize:", a6, 1.79769313e308);
  objc_msgSend(v22, "setWidthTracksTextView:", 1);
  -[ICLayoutManager addTextContainer:](v18, "addTextContainer:", v22);
  v23 = -[ICTextView initWithFrame:textContainer:]([ICTextView alloc], "initWithFrame:textContainer:", v22, 0.0, 0.0, a6, 0.0);
  v24 = ICInternalSettingsDefaultToPaperKitAttachments();
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __173__ICTextViewController_createTextViewUsingTextController_stylingTextUsingSeparateTextStorageForRendering_note_containerWidth_forManualRendering_scrollState_traitCollection___block_invoke_49;
  v48[3] = &unk_1EA7E0A40;
  v48[4] = &v53;
  v48[5] = &v49;
  objc_msgSend(v16, "enumerateAttachmentsInOrderUsingBlock:", v48);
  objc_msgSend(v16, "calculateDocumentController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updateAffectingChangeCounts:", 0);
  if (objc_msgSend(v25, "hasExpressions"))
  {
    v43 = v24;
    v44 = v16;
    v45 = v15;
    v26 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[ICBaseTextView TTTextStorage](v23, "TTTextStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "attributedString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v26, "initWithAttributedString:", v28);

    v30 = objc_msgSend(v29, "ic_range");
    objc_msgSend(v25, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v29, v30, v31, 0, 1);
    -[ICBaseTextView TTTextStorage](v23, "TTTextStorage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView TTTextStorage](v23, "TTTextStorage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "ic_range");
    v36 = v35;
    v37 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v32, "replaceCharactersInRange:withAttributedString:", v34, v36, v37);

    v16 = v44;
    v15 = v45;
    v24 = v43;
  }
  if (objc_msgSend(MEMORY[0x1E0D64D30], "isEnabled")
    && (*((_BYTE *)v50 + 24) || (!*((_BYTE *)v54 + 24) ? (v38 = v24) : (v38 = 0), v38 == 1))
    && (objc_msgSend(v16, "isUnsupported") & 1) == 0)
  {
    -[ICTextView setPaperEnabled:](v23, "setPaperEnabled:", 1);
    if (*((_BYTE *)v54 + 24))
    {
      objc_msgSend(v16, "managedObjectContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        v42 = -[ICInlineDrawingUpgradeHelper initWithNote:managedObjectContext:textView:]([_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc], "initWithNote:managedObjectContext:textView:", v16, v41, v23);
        -[ICInlineDrawingUpgradeHelper upgradeAllAttachmentsInNote](v42, "upgradeAllAttachmentsInNote");

      }
    }
  }
  else
  {
    -[ICTextView setStylusDrawingEnabled:](v23, "setStylusDrawingEnabled:", 1);
  }
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    -[ICTextView ic_pkTiledView](v23, "ic_pkTiledView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setOverrideUserInterfaceStyle:", 1);

  }
  -[ICTextView _setContentScrollInset:](v23, "_setContentScrollInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  -[ICBaseLayoutManager setTextView:](v18, "setTextView:", v23);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v23;
}

void __173__ICTextViewController_createTextViewUsingTextController_stylingTextUsingSeparateTextStorageForRendering_note_containerWidth_forManualRendering_scrollState_traitCollection___block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("UseNonContiguousLayout");
  v3[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v1);

}

void __173__ICTextViewController_createTextViewUsingTextController_stylingTextUsingSeparateTextStorageForRendering_note_containerWidth_forManualRendering_scrollState_traitCollection___block_invoke_49(uint64_t a1, void *a2)
{
  _BYTE *v3;
  void *v4;
  BOOL v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "attachmentType") == 10)
  {
    v3 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v4 = v6;
  }
  else
  {
    v5 = objc_msgSend(v6, "attachmentType") == 13;
    v4 = v6;
    if (!v5)
      goto LABEL_7;
    v3 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  *v3 = 1;
LABEL_7:

}

+ (id)printFormatterForNote:(id)a3 withSize:(CGSize)a4 traitCollection:(id)a5
{
  double height;
  double width;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;

  height = a4.height;
  width = a4.width;
  v8 = (objc_class *)MEMORY[0x1E0D64DB0];
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  objc_msgSend(v11, "setDisableSingleLineA:", 1);
  v12 = objc_msgSend(v9, "userInterfaceStyle");
  objc_msgSend(v11, "setOverrideAppearanceType:", v12 == 2);
  objc_msgSend(v11, "setIsForPrint:", 1);
  +[ICTextViewController createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:](ICTextViewController, "createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:", v11, 1, v10, 1, 0, v9, width);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "ic_tintColorWithTraitCollection:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v14);

  objc_opt_class();
  objc_msgSend(v13, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "setStyler:", v11);
  objc_msgSend(v13, "setOverrideUserInterfaceStyle:", v12);
  objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resolvedColorWithTraitCollection:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "textStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "beginEditing");

  objc_msgSend(v13, "textStorage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v13, "textStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "ic_range");
  v24 = v23;
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __71__ICTextViewController_printFormatterForNote_withSize_traitCollection___block_invoke;
  v47[3] = &unk_1EA7DDF00;
  v48 = v13;
  v49 = v17;
  v42 = v17;
  v25 = v13;
  objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v20, v22, v24, 0, v47);

  objc_opt_class();
  objc_msgSend(v25, "layoutManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setIsRenderingImageForPrint:", 1);
  objc_msgSend(v25, "textStorage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0DC10F8];
  objc_msgSend(v25, "textStorage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "ic_range");
  v33 = v32;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __71__ICTextViewController_printFormatterForNote_withSize_traitCollection___block_invoke_2;
  v44[3] = &unk_1EA7E10A8;
  v45 = v27;
  v46 = v12;
  v34 = v27;
  objc_msgSend(v28, "enumerateAttribute:inRange:options:usingBlock:", v29, v31, v33, 0, v44);

  objc_msgSend(v25, "textStorage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "endEditing");

  objc_opt_class();
  objc_msgSend(v25, "layoutManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setShouldAdjustTodoButtonFramesForPrinting:", 1);

  objc_opt_class();
  objc_msgSend(v25, "layoutManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setOverrideTraitCollection:", v9);

  objc_msgSend(v25, "setFrame:", 0.0, 0.0, width, height);
  objc_msgSend(v25, "viewPrintFormatter");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setPerPageContentInsets:", 8.0, 8.0, 8.0, 8.0);
  objc_msgSend(v11, "setIsForPrint:", 0);

  return v40;
}

void __71__ICTextViewController_printFormatterForNote_withSize_traitCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0DC3658];
  v8 = a2;
  objc_msgSend(v7, "preferredDefaultFontColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], *(_QWORD *)(a1 + 40), a3, a4);

  }
}

void __71__ICTextViewController_printFormatterForNote_withSize_traitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewForTextAttachment:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOverrideUserInterfaceStyle:", *(_QWORD *)(a1 + 40));

    v4 = v6;
  }

}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return 0;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v5 = 0;
  else
    v5 = v9;
  -[ICTextViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[ICTextViewController backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v9);

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    -[ICTextViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

  }
}

- (void)splitViewControllerWillBeginAnimatedTransitionToStateRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  double v40;
  id v41;
  id v42;
  id v43;
  id *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  _QWORD block[5];
  id v55;
  _QWORD v56[5];
  id v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id location;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v47 = v4;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTextViewController splitViewControllerDidEndAnimatedTransitionToStateRequestHandler](self, "splitViewControllerDidEndAnimatedTransitionToStateRequestHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v48, "ic_viewControllerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewController ic_viewControllerManager](self, "ic_viewControllerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
      goto LABEL_30;
    objc_initWeak(&location, self);
    -[ICTextViewController layoutManager](self, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIsTransitioningToNewSize:", 1);
    -[ICTextViewController captureContentOffsetStateIfNecessary](self, "captureContentOffsetStateIfNecessary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewController setTransitionScrollState:](self, "setTransitionScrollState:", v11);
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke;
    v64[3] = &unk_1EA7E10D0;
    v44 = &v68;
    objc_copyWeak(&v68, &location);
    v43 = v11;
    v65 = v43;
    v42 = v9;
    v66 = v42;
    v12 = v10;
    v67 = v12;
    -[ICTextViewController setSplitViewControllerDidEndAnimatedTransitionToStateRequestHandler:](self, "setSplitViewControllerDidEndAnimatedTransitionToStateRequestHandler:", v64);
    objc_opt_class();
    objc_msgSend(v47, "object");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v46 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v47, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ICSplitViewControllerPredictedDetailSizeUserInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTextViewController viewControllerManager](self, "viewControllerManager");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "mainSplitViewController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v46 != v16
      || !-[ICTextViewController shouldAnimateTransitionForSplitViewController:](self, "shouldAnimateTransitionForSplitViewController:", v42, v43, &v68))
    {
      goto LABEL_28;
    }

    if (!v45)
    {
LABEL_29:

      objc_destroyWeak(v44);
      objc_destroyWeak(&location);
      goto LABEL_30;
    }
    objc_msgSend(v45, "CGSizeValue");
    v18 = v17;
    v20 = v19;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v12, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraints");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (!v22)
      goto LABEL_25;
    v51 = *(_QWORD *)v61;
LABEL_9:
    v52 = v22;
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v51)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v23);
      objc_msgSend(v24, "firstItem");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v25 != v12)
      {
        objc_msgSend(v24, "secondItem");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v3 = v12;
        if (v26 != v12)
          goto LABEL_18;
      }
      objc_msgSend(v24, "firstItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v27 != v28)
      {
        objc_msgSend(v24, "secondItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTextViewController attributionSidebarView](self, "attributionSidebarView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v30 == v31;
        if (v25 == v12)
        {

        }
        else
        {

        }
        if (!v32)
          objc_msgSend(v49, "addObject:", v24);
        goto LABEL_23;
      }

      v26 = v3;
      v33 = v12;
      if (v25 != v12)
      {
LABEL_18:

        v33 = v25;
        v3 = v26;
      }

LABEL_23:
      if (v52 == ++v23)
      {
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        if (!v22)
        {
LABEL_25:

          -[ICTextViewController setTransitionConstraints:](self, "setTransitionConstraints:", v49);
          objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v49);
          objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
          objc_msgSend(v47, "userInfo");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ICSplitViewControllerPredictedDurationUserInfo"));
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          v37 = &unk_1EA821F70;
          if (v35)
            v37 = (void *)v35;
          v16 = v37;

          v38 = (void *)MEMORY[0x1E0DC3F10];
          objc_msgSend(v16, "floatValue");
          v40 = v39;
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_66;
          v56[3] = &unk_1EA7DDCB8;
          v56[4] = self;
          v41 = v12;
          v57 = v41;
          v58 = v18;
          v59 = v20;
          objc_msgSend(v38, "transitionWithView:duration:options:animations:completion:", v41, 5242880, v56, 0, v40);
          objc_msgSend(v41, "setAlpha:", 0.0);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_2;
          block[3] = &unk_1EA7DD498;
          block[4] = self;
          v55 = v41;
          dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_28:
          goto LABEL_29;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_30:
}

uint64_t __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "applyCapturedContentOffsetStateIfNecessary:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "setTransitionScrollState:", 0);

  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 48), "textContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "glyphRangeForBoundingRect:inTextContainer:", v14, v7, v9, v11, v13);
  v17 = v16;

  v18 = objc_msgSend(*(id *)(a1 + 40), "characterRangeForGlyphRange:actualGlyphRange:", v15, v17, 0);
  v20 = v19;
  objc_msgSend(*(id *)(a1 + 40), "invalidateLayoutForCharacterRange:actualCharacterRange:", v18, v19, 0);
  objc_msgSend(*(id *)(a1 + 40), "invalidateDisplayForCharacterRange:", v18, v20);
  objc_msgSend(*(id *)(a1 + 40), "ensureLayoutForCharacterRange:", v18, v20);
  return objc_msgSend(*(id *)(a1 + 40), "updateVisibleSupplementalViews");
}

uint64_t __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_66(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  CGRect v6;
  CGRect v7;

  objc_msgSend(*(id *)(a1 + 32), "attributionSidebarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleContentWidth");
  v4 = v3;

  v6.size.width = *(CGFloat *)(a1 + 48);
  v6.size.height = *(CGFloat *)(a1 + 56);
  v6.origin.y = 0.0;
  v6.origin.x = v4;
  v7 = CGRectIntegral(v6);
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

void __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "splitViewControllerDidEndAnimatedTransitionToStateRequestHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "splitViewControllerDidEndAnimatedTransitionToStateRequestHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_3;
  v5[3] = &unk_1EA7DD2D8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "animateWithDuration:animations:", v5, 0.3);

}

uint64_t __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)splitViewControllerDidEndAnimatedTransitionToStateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  NSClassFromString(CFSTR("ICMainSplitViewController"));
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTextViewController viewControllerManager](self, "viewControllerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainSplitViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v20;
  if (v7 == v20)
  {
    -[ICTextViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsTransitioningToNewSize:", 0);
    -[ICTextViewController splitViewControllerDidEndAnimatedTransitionToStateRequestHandler](self, "splitViewControllerDidEndAnimatedTransitionToStateRequestHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ICTextViewController splitViewControllerDidEndAnimatedTransitionToStateRequestHandler](self, "splitViewControllerDidEndAnimatedTransitionToStateRequestHandler");
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v11[2]();

      -[ICTextViewController setSplitViewControllerDidEndAnimatedTransitionToStateRequestHandler:](self, "setSplitViewControllerDidEndAnimatedTransitionToStateRequestHandler:", 0);
    }
    -[ICTextViewController transitionScrollState](self, "transitionScrollState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewController applyCapturedContentOffsetStateIfNecessary:](self, "applyCapturedContentOffsetStateIfNecessary:", v12);

    -[ICTextViewController setTransitionScrollState:](self, "setTransitionScrollState:", 0);
    objc_msgSend(v9, "window");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = objc_msgSend(v9, "translatesAutoresizingMaskIntoConstraints");

      if (v15)
      {
        objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v9, "superview");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTextViewController transitionConstraints](self, "transitionConstraints");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addConstraints:", v17);

        v18 = (void *)MEMORY[0x1E0CB3718];
        -[ICTextViewController transitionConstraints](self, "transitionConstraints");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "activateConstraints:", v19);

        -[ICTextViewController setTransitionConstraints:](self, "setTransitionConstraints:", 0);
      }
    }

    v8 = v20;
  }

}

- (BOOL)shouldAnimateTransitionForSplitViewController:(id)a3
{
  return objc_msgSend(a3, "displayMode") != 3;
}

- (void)layoutManagerDidInvalidateLayout:(id)a3
{
  id v3;

  -[ICTextViewController layoutManager](self, "layoutManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearLayoutEnsuredBounds");

}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[ICTextViewController layoutManager](self, "layoutManager", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateVisibleSupplementalViews");

  objc_opt_class();
  -[ICTextViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v12, "ic_visibleRange");
  objc_msgSend(v12, "updateStyleLayersInRange:", v8, v9);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("ICTextViewLayoutDidChangeNotification"), v11);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (ICTextController)textController
{
  return self->_textController;
}

- (void)setTextController:(id)a3
{
  objc_storeStrong((id *)&self->_textController, a3);
}

- (BOOL)performingInitialSetup
{
  return self->_performingInitialSetup;
}

- (void)setPerformingInitialSetup:(BOOL)a3
{
  self->_performingInitialSetup = a3;
}

- (ICAttributionSidebarView)attributionSidebarView
{
  return self->_attributionSidebarView;
}

- (void)setAttributionSidebarView:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSidebarView, a3);
}

- (NSLayoutConstraint)textViewLeadingConstraint
{
  return self->_textViewLeadingConstraint;
}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_loadWeakRetained((id *)&self->_viewControllerManager);
}

- (BOOL)ignoresTaps
{
  return self->_ignoresTaps;
}

- (ICTextBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (double)initialContainerWidth
{
  return self->_initialContainerWidth;
}

- (void)setInitialContainerWidth:(double)a3
{
  self->_initialContainerWidth = a3;
}

- (id)splitViewControllerDidEndAnimatedTransitionToStateRequestHandler
{
  return self->_splitViewControllerDidEndAnimatedTransitionToStateRequestHandler;
}

- (void)setSplitViewControllerDidEndAnimatedTransitionToStateRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (ICTextViewScrollState)transitionScrollState
{
  return self->_transitionScrollState;
}

- (void)setTransitionScrollState:(id)a3
{
  objc_storeStrong((id *)&self->_transitionScrollState, a3);
}

- (ICTextViewScrollState)initialScrollState
{
  return self->_initialScrollState;
}

- (void)setInitialScrollState:(id)a3
{
  objc_storeStrong((id *)&self->_initialScrollState, a3);
}

- (NSArray)transitionConstraints
{
  return self->_transitionConstraints;
}

- (void)setTransitionConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_transitionConstraints, a3);
}

- (NSMutableSet)enabledSubviews
{
  return self->_enabledSubviews;
}

- (void)setEnabledSubviews:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSubviews, a3);
}

- (NSLayoutConstraint)attributionSidebarWidthConstraint
{
  return self->_attributionSidebarWidthConstraint;
}

- (void)setAttributionSidebarWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSidebarWidthConstraint, a3);
}

- (NSLayoutConstraint)attributionSidebarTrailingConstraint
{
  return self->_attributionSidebarTrailingConstraint;
}

- (NSDate)attributionSidebarOpenedDate
{
  return self->_attributionSidebarOpenedDate;
}

- (void)setAttributionSidebarOpenedDate:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSidebarOpenedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionSidebarOpenedDate, 0);
  objc_storeStrong((id *)&self->_attributionSidebarTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_attributionSidebarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_enabledSubviews, 0);
  objc_storeStrong((id *)&self->_transitionConstraints, 0);
  objc_storeStrong((id *)&self->_initialScrollState, 0);
  objc_storeStrong((id *)&self->_transitionScrollState, 0);
  objc_storeStrong(&self->_splitViewControllerDidEndAnimatedTransitionToStateRequestHandler, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_attributionSidebarView, 0);
  objc_storeStrong((id *)&self->_textController, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

- (void)initWithViewControllerManager:(double)a3 editorViewController:note:initialContainerWidth:scrollState:.cold.1(void *a1, NSObject *a2, double a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2048;
  v10 = (unint64_t)(a3 * 1000.0);
  _os_log_debug_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_DEBUG, "TextView for note %@ loaded in: %ld ms", (uint8_t *)&v7, 0x16u);

}

+ (void)createTextViewUsingTextController:(os_log_t)log stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_DEBUG, "Using non-contiguous layout for text view", v1, 2u);
}

@end
