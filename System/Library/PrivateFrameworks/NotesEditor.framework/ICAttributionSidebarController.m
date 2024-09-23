@implementation ICAttributionSidebarController

- (ICTextView)textView
{
  ICTextView *textView;
  ICTextView *v3;
  void *v4;

  textView = self->_textView;
  if (textView)
  {
    v3 = textView;
  }
  else
  {
    -[ICAttributionSidebarController textViewController](self, "textViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textView");
    v3 = (ICTextView *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setSidebarWidthDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_enabled = a3;
  -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (ICAttributionSidebarController)initWithTextView:(id)a3
{
  id v5;
  ICAttributionSidebarController *v6;
  ICAttributionSidebarController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICAttributionSidebarController;
  v6 = -[ICAttributionSidebarController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_textView, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_noteDidUpdateShare_, *MEMORY[0x1E0D64920], 0);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v7, sel_handlePanGesture_);
    -[ICAttributionSidebarController setPanGestureRecognizer:](v7, "setPanGestureRecognizer:", v9);

    -[ICAttributionSidebarController panGestureRecognizer](v7, "panGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowedScrollTypesMask:", 2);

    -[ICAttributionSidebarController panGestureRecognizer](v7, "panGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", v11);

    v12 = -[ICAttributionSidebarController isEnabled](v7, "isEnabled");
    -[ICAttributionSidebarController panGestureRecognizer](v7, "panGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", v12);

  }
  return v7;
}

- (void)hideSidebarAnimated:(BOOL)a3 contextPath:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, double, double);
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  if (-[ICAttributionSidebarController attributionSidebarVisibility](self, "attributionSidebarVisibility"))
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      -[ICAttributionSidebarController sidebarWidthDidChangeHandler](self, "sidebarWidthDidChangeHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
LABEL_8:
        -[ICAttributionSidebarController textView](self, "textView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "editorController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "note");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        -[ICAttributionSidebarController eventReporter](self, "eventReporter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "submitAttributionSideBarViewEventForNote:contextPath:startState:endState:", v12, a4, 3, 1);

        return;
      }
      -[ICAttributionSidebarController sidebarWidthDidChangeHandler](self, "sidebarWidthDidChangeHandler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v5, 0.0, 0.0);
    }
    else
    {
      -[ICAttributionSidebarController textViewController](self, "textViewController");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAttributionSidebarWidth:isGestureActive:animated:currentVelocity:", 0, v5, 0.0, 0.0);
    }

    goto LABEL_8;
  }
}

- (void)hideSidebarAnimated:(BOOL)a3
{
  -[ICAttributionSidebarController hideSidebarAnimated:contextPath:](self, "hideSidebarAnimated:contextPath:", a3, 0);
}

- (int64_t)attributionSidebarVisibility
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;

  -[ICAttributionSidebarController attributionSidebarView](self, "attributionSidebarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleContentWidth");
  v5 = v4;

  -[ICAttributionSidebarController attributionSidebarView](self, "attributionSidebarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fullContentWidth");
  v8 = v7;

  v9 = vabdd_f64(0.0, v5);
  v10 = v5 > 0.0;
  if (v5 >= v8)
    v10 = 2;
  if (v9 >= 0.00999999978)
    return v10;
  else
    return 0;
}

- (ICAttributionSidebarView)attributionSidebarView
{
  void *v3;
  void *v4;
  void *v5;

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    -[ICAttributionSidebarController textView](self, "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributionSidebarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICAttributionSidebarController textViewController](self, "textViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributionSidebarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (ICAttributionSidebarView *)v5;
}

- (ICAttributionSidebarController)init
{
  ICAttributionSidebarController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAttributionSidebarController;
  v2 = -[ICAttributionSidebarController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_noteDidUpdateShare_, *MEMORY[0x1E0D64920], 0);

  }
  return v2;
}

- (void)setTextViewController:(id)a3
{
  ICTextViewController *textViewController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  id v15;

  v15 = a3;
  textViewController = self->_textViewController;
  if (textViewController)
  {
    -[ICTextViewController textView](textViewController, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeGestureRecognizer:", v7);

    -[ICTextViewController ic_removeObserver:forKeyPath:context:](self->_textViewController, "ic_removeObserver:forKeyPath:context:", self, CFSTR("textView"), &compoundliteral_2);
  }
  objc_storeStrong((id *)&self->_textViewController, a3);
  objc_msgSend(v15, "ic_addObserver:forKeyPath:context:", self, CFSTR("textView"), &compoundliteral_2);
  -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_handlePanGesture_);
    -[ICAttributionSidebarController setPanGestureRecognizer:](self, "setPanGestureRecognizer:", v9);

    -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowedScrollTypesMask:", 2);

  }
  objc_msgSend(v15, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", v12);

  v13 = -[ICAttributionSidebarController isEnabled](self, "isEnabled");
  -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnabled:", v13);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ICAttributionSidebarController textViewController](self, "textViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, CFSTR("textView"), &compoundliteral_2);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)ICAttributionSidebarController;
  -[ICAttributionSidebarController dealloc](&v5, sel_dealloc);
}

- (ICTTTextEditFilter)filter
{
  void *v2;
  void *v3;

  -[ICAttributionSidebarController attributionSidebarView](self, "attributionSidebarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTTTextEditFilter *)v3;
}

- (void)setFilter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICAttributionSidebarController attributionSidebarView](self, "attributionSidebarView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilter:", v4);

}

- (void)setFilter:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[ICAttributionSidebarController attributionSidebarView](self, "attributionSidebarView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilter:animated:", v6, v4);

}

- (void)showSidebarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, double, double);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  if (-[ICAttributionSidebarController attributionSidebarVisibility](self, "attributionSidebarVisibility") == 2)
    return;
  -[ICAttributionSidebarController attributionSidebarView](self, "attributionSidebarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullContentWidth");
  v7 = v6;

  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    -[ICAttributionSidebarController textViewController](self, "textViewController");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributionSidebarWidth:isGestureActive:animated:currentVelocity:", 0, v3, v7, 0.0);
    goto LABEL_6;
  }
  -[ICAttributionSidebarController sidebarWidthDidChangeHandler](self, "sidebarWidthDidChangeHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICAttributionSidebarController sidebarWidthDidChangeHandler](self, "sidebarWidthDidChangeHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v3, v7, 0.0);
LABEL_6:

  }
  -[ICAttributionSidebarController textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "editorController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "note");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ICAttributionSidebarController eventReporter](self, "eventReporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startAttributionSideBarViewEventForNote:", v13);

  }
}

+ (id)keyPathsForValuesAffectingAttributionSidebarVisibility
{
  const __CFString *v2;

  if (ICInternalSettingsIsTextKit2Enabled())
    v2 = CFSTR("textView.attributionSidebarView.visibleWidth");
  else
    v2 = CFSTR("textViewController.attributionSidebarView.visibleWidth");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cancelActiveGestures
{
  void *v3;
  _BOOL8 v4;
  id v5;

  -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  v4 = -[ICAttributionSidebarController isEnabled](self, "isEnabled");
  -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)handlePanGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  int64_t v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  _BOOL4 v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  int v50;
  void *v51;
  double v52;
  void *v53;
  void (**v54)(_QWORD, _QWORD, _QWORD, double, double);
  char v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  BOOL v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  int v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  char v81;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  _BOOL4 v89;
  double v90;
  double v91;
  double v92;
  _BOOL4 v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  float v102;
  double v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void (**v107)(_QWORD, _QWORD, _QWORD, double, double);
  double v108;
  double v109;
  _QWORD block[4];
  id v111;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[ICAttributionSidebarController attributionSidebarView](self, "attributionSidebarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visibleContentWidth");
    -[ICAttributionSidebarController setAttributionSidebarGestureBaselineX:](self, "setAttributionSidebarGestureBaselineX:");

    -[ICAttributionSidebarController setAttributionSidebarGestureAcceptedDistanceX:](self, "setAttributionSidebarGestureAcceptedDistanceX:", 0.0);
    -[ICAttributionSidebarController setAttributionSidebarGestureIgnoredDistanceX:](self, "setAttributionSidebarGestureIgnoredDistanceX:", 0.0);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttributionSidebarController setAttributionSidebarGestureStartTime:](self, "setAttributionSidebarGestureStartTime:", v6);

    -[ICAttributionSidebarController setAttributionSidebarGestureHasBegunToOpen:](self, "setAttributionSidebarGestureHasBegunToOpen:", 0);
  }
  -[ICAttributionSidebarController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ic_isRTL");

  -[ICAttributionSidebarController attributionSidebarView](self, "attributionSidebarView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v9);
  v11 = v10;
  v12 = -v10;

  -[ICAttributionSidebarController textViewController](self, "textViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v14);
  v16 = v15;
  v18 = v17;

  if (v18 >= 0.0)
    v19 = v18;
  else
    v19 = -v18;
  if (v16 >= 0.0)
    v20 = v16;
  else
    v20 = -v16;
  if (v8)
    v21 = v12;
  else
    v21 = v11;
  v108 = v16;
  v109 = v21;
  if (v8)
    v22 = v16 < 0.0;
  else
    v22 = v16 > 0.0;
  v23 = -[ICAttributionSidebarController attributionSidebarVisibility](self, "attributionSidebarVisibility");
  v24 = 1.0;
  if (v23 != 1)
    v24 = 3.0;
  v25 = v19 * v24;
  -[ICAttributionSidebarController textView](self, "textView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "safeAreaInsets");
  v28 = v27;
  -[ICAttributionSidebarController textView](self, "textView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "userTitleView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frame");
  v32 = v31;
  -[ICAttributionSidebarController textView](self, "textView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "dateView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frame");
  v36 = v35;

  v37 = objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5;
  -[ICAttributionSidebarController textView](self, "textView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v38);
  v40 = v39;
  v42 = v41;

  -[ICAttributionSidebarController textView](self, "textView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "editorController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isPositionOnTodoItem:", v40, v42);

  if (v20 > v25 || v37)
  {
    -[ICAttributionSidebarController textView](self, "textView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "contentOffset");
    if (v47 >= -(v28 + v32 + v36)
      && (v22
       || -[ICAttributionSidebarController attributionSidebarVisibility](self, "attributionSidebarVisibility") > 0
       || -[ICAttributionSidebarController attributionSidebarGestureHasBegunToOpen](self, "attributionSidebarGestureHasBegunToOpen")))
    {
      if (-[ICAttributionSidebarController attributionSidebarVisibility](self, "attributionSidebarVisibility") < 1)
        v55 = v45;
      else
        v55 = 0;
      if ((v55 & 1) == 0)
      {

        goto LABEL_49;
      }
      -[ICAttributionSidebarController attributionSidebarGestureStartTime](self, "attributionSidebarGestureStartTime");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "timeIntervalSinceNow");
      v58 = v57;

      if (v58 >= 0.0)
        v59 = v58;
      else
        v59 = -v58;

      if (v59 > 0.1)
      {
LABEL_49:
        -[ICAttributionSidebarController attributionSidebarGestureIgnoredDistanceX](self, "attributionSidebarGestureIgnoredDistanceX");
        -[ICAttributionSidebarController setAttributionSidebarGestureAcceptedDistanceX:](self, "setAttributionSidebarGestureAcceptedDistanceX:", v109 - v60);
        -[ICAttributionSidebarController setAttributionSidebarGestureHasBegunToOpen:](self, "setAttributionSidebarGestureHasBegunToOpen:", 1);
        -[ICAttributionSidebarController attributionSidebarView](self, "attributionSidebarView");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "fullContentWidth");
        v63 = v62;
        objc_msgSend(v61, "previewContentWidth");
        v65 = v64;
        if (-[ICAttributionSidebarController attributionSidebarVisibility](self, "attributionSidebarVisibility"))
          v66 = 0;
        else
          v66 = v22;
        if (v66
          || -[ICAttributionSidebarController attributionSidebarVisibility](self, "attributionSidebarVisibility") == 2
          && v108 < 0.0)
        {
          v67 = (void *)MEMORY[0x1E0CB37E8];
          -[ICAttributionSidebarController textView](self, "textView");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "contentOffset");
          objc_msgSend(v67, "numberWithDouble:", v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAttributionSidebarController setAttributionSidebarGestureBaselineContentOffsetY:](self, "setAttributionSidebarGestureBaselineContentOffsetY:", v70);

        }
        -[ICAttributionSidebarController attributionSidebarGestureBaselineX](self, "attributionSidebarGestureBaselineX");
        if (!v37)
        {
          v74 = v71;
          if (objc_msgSend(v4, "state") == 2)
          {
            -[ICAttributionSidebarController attributionSidebarGestureBaselineX](self, "attributionSidebarGestureBaselineX");
            v76 = v75;
            -[ICAttributionSidebarController attributionSidebarGestureAcceptedDistanceX](self, "attributionSidebarGestureAcceptedDistanceX");
            v74 = v76 + v77;
            if (v74 > v63 || v74 < 0.0)
            {
              if (v74 <= v63)
                v74 = -((1.0 - 1.0 / (v74 / v63 * -0.55 + 1.0)) * v63);
              else
                v74 = v63 + (1.0 - 1.0 / ((v74 - v63) / v63 * 0.55 + 1.0)) * v63;
            }
          }
LABEL_81:
          -[ICAttributionSidebarController textView](self, "textView");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "editorController");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "note");
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v61, "visibleContentWidth");
          if (v86 == 0.0 && v74 > 0.0 && v85)
          {
            -[ICAttributionSidebarController eventReporter](self, "eventReporter");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "startAttributionSideBarViewEventForNote:", v85);

          }
          objc_msgSend(v61, "fullContentWidth");
          if (v74 >= v88)
          {
            objc_msgSend(v61, "visibleContentWidth");
            v91 = v90;
            objc_msgSend(v61, "fullContentWidth");
            v89 = v91 < v92;
          }
          else
          {
            v89 = 0;
          }
          if (v74 <= 0.0)
          {
            objc_msgSend(v61, "visibleContentWidth");
            v93 = v94 > 0.0;
          }
          else
          {
            v93 = 0;
          }
          if (!v89 && !v93)
          {
LABEL_100:
            v105 = objc_msgSend(v4, "state");
            if (ICInternalSettingsIsTextKit2Enabled())
            {
              -[ICAttributionSidebarController sidebarWidthDidChangeHandler](self, "sidebarWidthDidChangeHandler");
              v106 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v106)
              {
LABEL_105:

                goto LABEL_106;
              }
              -[ICAttributionSidebarController sidebarWidthDidChangeHandler](self, "sidebarWidthDidChangeHandler");
              v107 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, BOOL, BOOL, double, double))v107)[2](v107, !v37, v105 != 2, v74, v108);
            }
            else
            {
              -[ICAttributionSidebarController textViewController](self, "textViewController");
              v107 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "setAttributionSidebarWidth:isGestureActive:animated:currentVelocity:", !v37, v105 != 2, v74, v108);
            }

            goto LABEL_105;
          }
          if (v85)
          {
            if (v89)
            {
              -[ICAttributionSidebarController eventReporter](self, "eventReporter");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "submitAttributionSideBarViewEventForNote:contextPath:startState:endState:", v85, 3, 2, 3);

              -[ICAttributionSidebarController eventReporter](self, "eventReporter");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "startAttributionSideBarViewEventForNote:", v85);
            }
            else
            {
              if (!v93)
                goto LABEL_98;
              -[ICAttributionSidebarController eventReporter](self, "eventReporter");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "submitAttributionSideBarViewEventForNote:contextPath:startState:endState:", v85, 3, 3, 1);
            }

          }
LABEL_98:
          -[ICAttributionSidebarController attributionSidebarGestureBaselineContentOffsetY](self, "attributionSidebarGestureBaselineContentOffsetY");
          v97 = (void *)objc_claimAutoreleasedReturnValue();

          if (v97)
          {
            -[ICAttributionSidebarController textView](self, "textView");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "contentOffset");
            v100 = v99;
            -[ICAttributionSidebarController attributionSidebarGestureBaselineContentOffsetY](self, "attributionSidebarGestureBaselineContentOffsetY");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "floatValue");
            v103 = v102;
            -[ICAttributionSidebarController textView](self, "textView");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "setContentOffset:", v100, v103);

          }
          goto LABEL_100;
        }
        if (v20 <= 300.0)
        {
          LOBYTE(v73) = 0;
        }
        else
        {
          -[ICAttributionSidebarController textView](self, "textView");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v72, "isScrolling") ^ 1;

        }
        -[ICAttributionSidebarController attributionSidebarView](self, "attributionSidebarView");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "visibleContentWidth");
        v80 = v79;

        if (v22)
        {
          if (v80 > v65)
            v81 = 1;
          else
            v81 = v73;
          v74 = 0.0;
          if ((v81 & 1) == 0)
            goto LABEL_78;
        }
        else
        {
          if (v80 < v65)
            v82 = 1;
          else
            v82 = v73;
          v74 = 0.0;
          if ((v82 & 1) != 0)
            goto LABEL_78;
        }
        v74 = v63;
        if (v63 > 0.0)
        {
LABEL_80:
          -[ICAttributionSidebarController setAttributionSidebarGestureBaselineContentOffsetY:](self, "setAttributionSidebarGestureBaselineContentOffsetY:", 0);
          goto LABEL_81;
        }
LABEL_78:
        if (-[ICAttributionSidebarController attributionSidebarVisibility](self, "attributionSidebarVisibility") >= 1)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __51__ICAttributionSidebarController_handlePanGesture___block_invoke;
          block[3] = &unk_1EA7DD2D8;
          v111 = v61;
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
        goto LABEL_80;
      }
    }
    else
    {

    }
  }
  -[ICAttributionSidebarController attributionSidebarGestureAcceptedDistanceX](self, "attributionSidebarGestureAcceptedDistanceX");
  -[ICAttributionSidebarController setAttributionSidebarGestureIgnoredDistanceX:](self, "setAttributionSidebarGestureIgnoredDistanceX:", v109 - v48);
  if (v19 > v20 * 3.0
    && -[ICAttributionSidebarController attributionSidebarVisibility](self, "attributionSidebarVisibility") == 2)
  {
    -[ICAttributionSidebarController textView](self, "textView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isEditing");

    if (v50)
    {
      if (v19 > 80.0)
      {
        -[ICAttributionSidebarController textView](self, "textView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "resignFirstResponder");

      }
    }
  }
  if (v37 && !-[ICAttributionSidebarController attributionSidebarVisibility](self, "attributionSidebarVisibility"))
  {
    -[ICAttributionSidebarController attributionSidebarGestureAcceptedDistanceX](self, "attributionSidebarGestureAcceptedDistanceX");
    if (v52 != 0.0)
    {
      if (!ICInternalSettingsIsTextKit2Enabled())
      {
        -[ICAttributionSidebarController textViewController](self, "textViewController");
        v54 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setAttributionSidebarWidth:isGestureActive:animated:currentVelocity:", 0, 0, 0.0, v108);
        goto LABEL_65;
      }
      -[ICAttributionSidebarController sidebarWidthDidChangeHandler](self, "sidebarWidthDidChangeHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        -[ICAttributionSidebarController sidebarWidthDidChangeHandler](self, "sidebarWidthDidChangeHandler");
        v54 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
        v54[2](v54, 0, 0, 0.0, v108);
LABEL_65:

      }
    }
  }
LABEL_106:

}

uint64_t __51__ICAttributionSidebarController_handlePanGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unfocusAttributionDetails");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  if ((-[ICAttributionSidebarController ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/Editor/Attributions/ICAttributionSidebarController.m") & 1) != 0)
  {
    v13 = -[ICAttributionSidebarController ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v11, v12, v10);

    if (a6 == &compoundliteral_2
      && (v13 & 1) == 0
      && objc_msgSend(v10, "isEqualToString:", CFSTR("textView")))
    {
      -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeGestureRecognizer:", v16);

      -[ICAttributionSidebarController textViewController](self, "textViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttributionSidebarController panGestureRecognizer](self, "panGestureRecognizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addGestureRecognizer:", v19);

    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ICAttributionSidebarController;
    -[ICAttributionSidebarController observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, v12, v11, a6);

  }
}

- (void)noteDidUpdateShare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[ICAttributionSidebarController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10))
  {
    v11 = objc_msgSend(v8, "isSharedViaICloud");

    if ((v11 & 1) == 0)
      -[ICAttributionSidebarController hideSidebarAnimated:](self, "hideSidebarAnimated:", 1);
  }
  else
  {

  }
}

- (ICNAEventReporter)eventReporter
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAttributionSidebarController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICNAEventReporter *)v4;
}

- (ICTextViewController)textViewController
{
  return self->_textViewController;
}

- (id)sidebarWidthDidChangeHandler
{
  return self->_sidebarWidthDidChangeHandler;
}

- (double)attributionSidebarGestureBaselineX
{
  return self->_attributionSidebarGestureBaselineX;
}

- (void)setAttributionSidebarGestureBaselineX:(double)a3
{
  self->_attributionSidebarGestureBaselineX = a3;
}

- (NSNumber)attributionSidebarGestureBaselineContentOffsetY
{
  return self->_attributionSidebarGestureBaselineContentOffsetY;
}

- (void)setAttributionSidebarGestureBaselineContentOffsetY:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSidebarGestureBaselineContentOffsetY, a3);
}

- (double)attributionSidebarGestureAcceptedDistanceX
{
  return self->_attributionSidebarGestureAcceptedDistanceX;
}

- (void)setAttributionSidebarGestureAcceptedDistanceX:(double)a3
{
  self->_attributionSidebarGestureAcceptedDistanceX = a3;
}

- (double)attributionSidebarGestureIgnoredDistanceX
{
  return self->_attributionSidebarGestureIgnoredDistanceX;
}

- (void)setAttributionSidebarGestureIgnoredDistanceX:(double)a3
{
  self->_attributionSidebarGestureIgnoredDistanceX = a3;
}

- (BOOL)attributionSidebarGestureHasBegunToOpen
{
  return self->_attributionSidebarGestureHasBegunToOpen;
}

- (void)setAttributionSidebarGestureHasBegunToOpen:(BOOL)a3
{
  self->_attributionSidebarGestureHasBegunToOpen = a3;
}

- (NSDate)attributionSidebarGestureStartTime
{
  return self->_attributionSidebarGestureStartTime;
}

- (void)setAttributionSidebarGestureStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSidebarGestureStartTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionSidebarGestureStartTime, 0);
  objc_storeStrong((id *)&self->_attributionSidebarGestureBaselineContentOffsetY, 0);
  objc_storeStrong(&self->_sidebarWidthDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_textViewController, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
