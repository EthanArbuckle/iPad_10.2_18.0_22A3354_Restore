@implementation AKAnnotationPopoverViewController

- (AKAnnotationPopoverViewController)init
{
  AKAnnotationPopoverViewController *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAnnotationPopoverViewController;
  result = -[AKAnnotationPopoverViewController init](&v4, sel_init);
  if (result)
  {
    v3 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    result->_presentationRect.origin = (CGPoint)*MEMORY[0x24BDBF070];
    result->_presentationRect.size = v3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[AKAnnotationPopoverViewController releaseOutlets](self, "releaseOutlets");
  v3.receiver = self;
  v3.super_class = (Class)AKAnnotationPopoverViewController;
  -[AKAnnotationPopoverViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAnnotationPopoverViewController;
  -[AKAnnotationPopoverViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[AKAnnotationPopoverViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  -[AKAnnotationPopoverViewController releaseOutlets](self, "releaseOutlets");
  v3.receiver = self;
  v3.super_class = (Class)AKAnnotationPopoverViewController;
  -[AKAnnotationPopoverViewController didReceiveMemoryWarning](&v3, sel_didReceiveMemoryWarning);
}

- (BOOL)canPresentInPosition:(int)a3
{
  return a3 == 0;
}

- (CGRect)p_containerFrameForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
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
  double v18;
  CGRect v19;
  CGRect result;

  v4 = a3;
  -[AKAnnotationPopoverViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithVerticalSizeClass:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsTraitsInCollection:", v6);

  if (v7)
    v8 = 12.0;
  else
    v8 = 44.0;
  objc_msgSend(v4, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  result = CGRectInset(v19, 20.0, 20.0);
  v17 = v8 + result.origin.y;
  v18 = result.size.height - v8;
  result.size.height = v18;
  result.origin.y = v17;
  return result;
}

- (int)willPresentInPosition:(CGRect)a3 view:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MinY;
  CGFloat v24;
  int v25;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[AKAnnotationPopoverViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v29 = v12;
  v30 = v11;
  v27 = v14;
  v28 = v13;

  -[AKAnnotationPopoverViewController p_containerFrameForView:](self, "p_containerFrameForView:", v9);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  MinY = CGRectGetMinY(v31);
  v32.origin.y = v29;
  v32.origin.x = v30;
  v32.size.height = v27;
  v32.size.width = v28;
  v24 = MinY + CGRectGetHeight(v32) + 2.0;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  CGRectGetMinX(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  CGRectGetWidth(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  if (CGRectGetMinY(v35) >= v24)
    return 0;
  v25 = 1;
  if (!-[AKAnnotationPopoverViewController canPresentInPosition:](self, "canPresentInPosition:", 1))
    return 0;
  return v25;
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v21;
  double MaxY;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double MaxX;
  double v51;
  double MinX;
  CGFloat rect;
  _QWORD v55[5];
  _QWORD v56[5];
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v5 = a4;
  -[AKAnnotationPopoverViewController setPresentationView:](self, "setPresentationView:", v5);
  -[AKAnnotationPopoverViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[AKAnnotationPopoverViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  rect = v12;
  v15 = v14;

  -[AKAnnotationPopoverViewController p_containerFrameForView:](self, "p_containerFrameForView:", v5);
  x = v57.origin.x;
  y = v57.origin.y;
  width = v57.size.width;
  height = v57.size.height;
  MinX = CGRectGetMinX(v57);
  v58.origin.x = v9;
  v58.origin.y = v11;
  v58.size.width = v13;
  v58.size.height = v15;
  v51 = CGRectGetWidth(v58);
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  MaxX = CGRectGetMaxX(v59);
  v60.origin.x = v9;
  v60.origin.y = v11;
  v60.size.width = v13;
  v60.size.height = v15;
  v49 = CGRectGetWidth(v60);
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  MinY = CGRectGetMinY(v61);
  v46 = v9;
  v62.origin.x = v9;
  v62.origin.y = v11;
  v62.size.width = rect;
  v62.size.height = v15;
  v21 = MinY + CGRectGetHeight(v62) + 2.0;
  v63.origin.x = x;
  v63.origin.y = y;
  v44 = width;
  v45 = height;
  v63.size.width = width;
  v63.size.height = height;
  MaxY = CGRectGetMaxY(v63);
  v48 = CGRectGetMinX(a3);
  v47 = CGRectGetWidth(a3);
  v23 = CGRectGetMinY(a3);
  if (v23 < v21 && -[AKAnnotationPopoverViewController canPresentInPosition:](self, "canPresentInPosition:", 1))
  {
    -[AKAnnotationPopoverViewController setPosition:](self, "setPosition:", 1);
    v23 = CGRectGetMaxY(a3);
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = v44;
    v64.size.height = height;
    v21 = CGRectGetMinY(v64) + 2.0;
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = v44;
    v65.size.height = height;
    v24 = CGRectGetMaxY(v65);
    v66.origin.y = v11;
    v66.origin.x = v46;
    v66.size.width = rect;
    v66.size.height = v15;
    MaxY = v24 - CGRectGetHeight(v66);
  }
  else
  {
    -[AKAnnotationPopoverViewController setPosition:](self, "setPosition:", 0, *(_QWORD *)&v44, *(_QWORD *)&height);
  }
  v25 = v48 + v47 * 0.5;
  v26 = MaxX - (v49 * 0.5 + 2.0);
  if (v25 <= v26)
    v26 = v48 + v47 * 0.5;
  if (v25 >= MinX + v51 * 0.5 + 2.0)
    v27 = v26;
  else
    v27 = MinX + v51 * 0.5 + 2.0;
  if (v23 <= MaxY + -2.0)
    v28 = v23;
  else
    v28 = MaxY + -2.0;
  if (v23 >= v21)
    v29 = v28;
  else
    v29 = v21;
  -[AKAnnotationPopoverViewController setPresentationRect:](self, "setPresentationRect:", v27 + -1.0, v29 + -1.0, 2.0, 2.0, *(_QWORD *)&v44, *(_QWORD *)&v45);
  v30 = -[AKAnnotationPopoverViewController position](self, "position");
  -[AKAnnotationPopoverViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  v34 = 0.0;
  if (v30 != 1)
    v34 = 1.0;
  objc_msgSend(v32, "setAnchorPoint:", 0.5, v34);

  -[AKAnnotationPopoverViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setCenter:", v27, v29);

  -[AKAnnotationPopoverViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "frame");
  v68 = CGRectIntegral(v67);
  v37 = v68.origin.x;
  v38 = v68.origin.y;
  v39 = v68.size.width;
  v40 = v68.size.height;
  -[AKAnnotationPopoverViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFrame:", v37, v38, v39, v40);

  -[AKAnnotationPopoverViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v42);

  -[AKAnnotationPopoverViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setUserInteractionEnabled:", 0);

  -[AKAnnotationPopoverViewController willShow](self, "willShow");
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = sub_229058D50;
  v56[3] = &unk_24F1A7328;
  v56[4] = self;
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = sub_229058D84;
  v55[3] = &unk_24F1A7608;
  v55[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v56, v55, 0.15);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGPoint v20;
  CGRect v21;

  v4 = a3;
  -[AKAnnotationPopoverViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[AKAnnotationPopoverViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v14);
  v16 = v15;
  v18 = v17;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  v20.x = v16;
  v20.y = v18;
  LOBYTE(v4) = !CGRectContainsPoint(v21, v20);

  return (char)v4;
}

- (void)willShow
{
  id v3;

  -[AKAnnotationPopoverViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "willShowAnnotationEditor:", self);

}

- (void)didShow
{
  void *v3;
  AKTouchOutsideViewGestureRecognizer *v4;
  void *v5;
  AKTouchOutsideViewGestureRecognizer *v6;
  AKTouchOutsideViewGestureRecognizer *mHideOnTouchGestureRecognizer;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id mObserver;
  void *v15;
  int v16;
  _QWORD v17[5];

  -[AKAnnotationPopoverViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->mHideOnTouchGestureRecognizer)
  {
    v4 = [AKTouchOutsideViewGestureRecognizer alloc];
    -[AKAnnotationPopoverViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AKTouchOutsideViewGestureRecognizer initWithTarget:action:watchView:](v4, "initWithTarget:action:watchView:", self, sel_hide, v5);
    mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;
    self->mHideOnTouchGestureRecognizer = v6;

    -[AKAnnotationPopoverViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addGestureRecognizer:", self->mHideOnTouchGestureRecognizer);

  }
  if (!self->mObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = qword_255A25C00;
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_229059084;
    v17[3] = &unk_24F1A82B8;
    v17[4] = self;
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v11, 0, v12, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    mObserver = self->mObserver;
    self->mObserver = v13;

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didShowAnnotationEditor:", self);
  objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isMenuVisible");

  if (v16)
    -[AKAnnotationPopoverViewController hide](self, "hide");

}

- (void)willHide
{
  uint64_t v3;
  AKTouchOutsideViewGestureRecognizer *mHideOnTouchGestureRecognizer;
  void *v5;
  AKTouchOutsideViewGestureRecognizer *v6;
  void *v7;
  id mObserver;
  id v9;

  -[AKAnnotationPopoverViewController delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;
  v9 = (id)v3;
  if (mHideOnTouchGestureRecognizer)
  {
    -[AKTouchOutsideViewGestureRecognizer view](mHideOnTouchGestureRecognizer, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", self->mHideOnTouchGestureRecognizer);

    v6 = self->mHideOnTouchGestureRecognizer;
    self->mHideOnTouchGestureRecognizer = 0;

    v3 = (uint64_t)v9;
  }
  if (self->mObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self->mObserver, qword_255A25C00, 0);

    mObserver = self->mObserver;
    self->mObserver = 0;

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "willHideAnnotationEditor:", self);

}

- (void)didHide
{
  AKAnnotationPopoverViewController *v3;
  id v4;
  id v5;

  -[AKAnnotationPopoverViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didHideAnnotationEditor:", v3);
  -[AKAnnotationPopoverViewController setPresentationRect:](v3, "setPresentationRect:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  -[AKAnnotationPopoverViewController setPresentationView:](v3, "setPresentationView:", 0);
  v4 = (id)objc_opt_self();

}

- (void)hide
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (self->mHideOnTouchGestureRecognizer)
  {
    -[AKAnnotationPopoverViewController willHide](self, "willHide");
    -[AKAnnotationPopoverViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInteractionEnabled:", 0);

    v4[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_2290592C8;
    v5[3] = &unk_24F1A7328;
    v5[4] = self;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = sub_2290592FC;
    v4[3] = &unk_24F1A7608;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v5, v4, 0.15);
    -[AKAnnotationPopoverViewController didHide](self, "didHide");
  }
}

- (AKAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->mAnnotation, a3);
}

- (AKPageController)annotationPageController
{
  return self->mAnnotationPageController;
}

- (void)setAnnotationPageController:(id)a3
{
  objc_storeStrong((id *)&self->mAnnotationPageController, a3);
}

- (AKAnnotationTheme)annotationTheme
{
  return self->mAnnotationTheme;
}

- (void)setAnnotationTheme:(id)a3
{
  objc_storeStrong((id *)&self->mAnnotationTheme, a3);
}

- (int)position
{
  return self->mPosition;
}

- (void)setPosition:(int)a3
{
  self->mPosition = a3;
}

- (CGRect)presentationRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentationRect.origin.x;
  y = self->_presentationRect.origin.y;
  width = self->_presentationRect.size.width;
  height = self->_presentationRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
  self->_presentationRect = a3;
}

- (UIView)presentationView
{
  return self->_presentationView;
}

- (void)setPresentationView:(id)a3
{
  objc_storeStrong((id *)&self->_presentationView, a3);
}

- (BOOL)editsOnLaunch
{
  return self->_editsOnLaunch;
}

- (void)setEditsOnLaunch:(BOOL)a3
{
  self->_editsOnLaunch = a3;
}

- (AKAnnotationEditorDelegate)delegate
{
  return (AKAnnotationEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_storeStrong(&self->mObserver, 0);
  objc_storeStrong((id *)&self->mAnnotationTheme, 0);
  objc_storeStrong((id *)&self->mAnnotationPageController, 0);
  objc_storeStrong((id *)&self->mAnnotation, 0);
  objc_storeStrong((id *)&self->mHideOnTouchGestureRecognizer, 0);
}

@end
