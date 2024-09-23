@implementation ICHandwritingDebugWindow

- (ICHandwritingDebugWindow)initWithDelegate:(id)a3
{
  id v4;
  ICHandwritingDebugWindow *v5;
  ICHandwritingDebugViewController *v6;
  ICHandwritingDebugViewController *handwritingDebugViewController;
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
  void *v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  CGAffineTransform v35;
  CGAffineTransform v36;
  objc_super v37;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "preferredFrame");
  v37.receiver = self;
  v37.super_class = (Class)ICHandwritingDebugWindow;
  v5 = -[ICHandwritingDebugWindow initWithFrame:](&v37, sel_initWithFrame_);
  if (v5)
  {
    v6 = -[ICHandwritingDebugViewController initWithDelegate:]([ICHandwritingDebugViewController alloc], "initWithDelegate:", v4);
    handwritingDebugViewController = v5->_handwritingDebugViewController;
    v5->_handwritingDebugViewController = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHandwritingDebugViewController view](v5->_handwritingDebugViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5->_handwritingDebugViewController);
    -[ICHandwritingDebugWindow setRootViewController:](v5, "setRootViewController:", v10);
    -[ICHandwritingDebugWindow rootViewController](v5, "rootViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 8.0);

    -[ICHandwritingDebugWindow rootViewController](v5, "rootViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMasksToBounds:", 1);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 48.0, 48.0);
    -[ICHandwritingDebugWindow setResizeTriangle:](v5, "setResizeTriangle:", v17);

    CGAffineTransformMakeRotation(&v36, 0.785398163);
    -[ICHandwritingDebugWindow resizeTriangle](v5, "resizeTriangle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v36;
    objc_msgSend(v18, "setTransform:", &v35);

    objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHandwritingDebugWindow resizeTriangle](v5, "resizeTriangle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v19);

    -[ICHandwritingDebugWindow resizeTriangle](v5, "resizeTriangle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setZPosition:", 1000.0);

    -[ICHandwritingDebugWindow rootViewController](v5, "rootViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHandwritingDebugWindow resizeTriangle](v5, "resizeTriangle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v25);

    -[ICHandwritingDebugWindow layer](v5, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCornerRadius:", 8.0);

    -[ICHandwritingDebugWindow layer](v5, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 1050253722;
    objc_msgSend(v27, "setShadowOpacity:", v28);

    -[ICHandwritingDebugWindow layer](v5, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setShadowRadius:", 16.0);

    -[ICHandwritingDebugWindow layer](v5, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setShadowOffset:", 0.0, 4.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = objc_msgSend(v31, "CGColor");
    -[ICHandwritingDebugWindow layer](v5, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setShadowColor:", v32);

  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICHandwritingDebugWindow;
  -[ICHandwritingDebugWindow layoutSubviews](&v3, sel_layoutSubviews);
  -[ICHandwritingDebugWindow updateResizeTriangleFrame](self, "updateResizeTriangleFrame");
}

- (void)updateResizeTriangleFrame
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[ICHandwritingDebugWindow rootViewController](self, "rootViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[ICHandwritingDebugWindow rootViewController](self, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  -[ICHandwritingDebugWindow resizeTriangle](self, "resizeTriangle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCenter:", v5, v9);

}

- (ICHandwritingDebugDelegate)delegate
{
  void *v2;
  void *v3;

  -[ICHandwritingDebugWindow handwritingDebugViewController](self, "handwritingDebugViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICHandwritingDebugDelegate *)v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICHandwritingDebugWindow;
  v6 = a3;
  -[ICHandwritingDebugWindow touchesBegan:withEvent:](&v17, sel_touchesBegan_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v17.receiver, v17.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHandwritingDebugWindow navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isDescendantOfView:", v10);

  if (v11)
  {
    -[ICHandwritingDebugWindow setDraggingWindow:](self, "setDraggingWindow:", 1);
  }
  else
  {
    objc_msgSend(v7, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHandwritingDebugWindow resizeTriangle](self, "resizeTriangle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isDescendantOfView:", v13);

    if (v14)
      -[ICHandwritingDebugWindow setResizingWindow:](self, "setResizingWindow:", 1);
  }
  -[ICHandwritingDebugWindow navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v16);
  -[ICHandwritingDebugWindow setInitialTouchLocation:](self, "setInitialTouchLocation:");

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
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
  double v25;
  double v26;
  double v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)ICHandwritingDebugWindow;
  v6 = a3;
  -[ICHandwritingDebugWindow touchesMoved:withEvent:](&v28, sel_touchesMoved_withEvent_, v6, a4);
  -[ICHandwritingDebugWindow navigationController](self, "navigationController", v28.receiver, v28.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "locationInView:", v8);
  v11 = v10;
  v13 = v12;

  -[ICHandwritingDebugWindow initialTouchLocation](self, "initialTouchLocation");
  v15 = v11 - v14;
  -[ICHandwritingDebugWindow initialTouchLocation](self, "initialTouchLocation");
  v17 = v13 - v16;
  if (-[ICHandwritingDebugWindow isDraggingWindow](self, "isDraggingWindow"))
  {
    -[ICHandwritingDebugWindow center](self, "center");
    -[ICHandwritingDebugWindow setCenter:](self, "setCenter:", v15 + v18, v17 + v19);
  }
  else if (-[ICHandwritingDebugWindow isResizingWindow](self, "isResizingWindow"))
  {
    -[ICHandwritingDebugWindow frame](self, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v15 + v24;
    v27 = v17 + v26;
    -[ICHandwritingDebugWindow setInitialTouchLocation:](self, "setInitialTouchLocation:", v11, v13);
    -[ICHandwritingDebugWindow setFrame:](self, "setFrame:", v21, v23, v25, v27);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICHandwritingDebugWindow;
  -[ICHandwritingDebugWindow touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  -[ICHandwritingDebugWindow setDraggingWindow:](self, "setDraggingWindow:", 0);
  -[ICHandwritingDebugWindow setResizingWindow:](self, "setResizingWindow:", 0);
  v5 = (void *)objc_opt_class();
  -[ICHandwritingDebugWindow frame](self, "frame");
  objc_msgSend(v5, "savePreferredFrame:");
}

- (void)refresh
{
  id v2;

  -[ICHandwritingDebugWindow handwritingDebugViewController](self, "handwritingDebugViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refresh");

}

+ (CGRect)preferredFrame
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  CGRect result;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HandwritingWindowWidth"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_1E5C71E08;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("HandwritingWindowHeight"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &unk_1E5C71E20;
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("HandwritingWindowX"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v14, "numberWithDouble:", v17 - v18 + -24.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("HandwritingWindowY"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v21, "numberWithDouble:", v24 - v25 + -44.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v13, "doubleValue");
  v27 = v26;
  objc_msgSend(v20, "doubleValue");
  v29 = v28;
  objc_msgSend(v6, "doubleValue");
  v31 = v30;
  objc_msgSend(v11, "doubleValue");
  v33 = v32;

  v34 = v27;
  v35 = v29;
  v36 = v31;
  v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

+ (void)savePreferredFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDouble:forKey:", CFSTR("HandwritingWindowX"), x);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDouble:forKey:", CFSTR("HandwritingWindowY"), y);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDouble:forKey:", CFSTR("HandwritingWindowWidth"), width);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDouble:forKey:", CFSTR("HandwritingWindowHeight"), height);

}

- (BOOL)isDraggingWindow
{
  return self->_draggingWindow;
}

- (void)setDraggingWindow:(BOOL)a3
{
  self->_draggingWindow = a3;
}

- (BOOL)isResizingWindow
{
  return self->_resizingWindow;
}

- (void)setResizingWindow:(BOOL)a3
{
  self->_resizingWindow = a3;
}

- (CGPoint)initialTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialTouchLocation.x;
  y = self->_initialTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialTouchLocation:(CGPoint)a3
{
  self->_initialTouchLocation = a3;
}

- (UIView)resizeTriangle
{
  return self->_resizeTriangle;
}

- (void)setResizeTriangle:(id)a3
{
  objc_storeStrong((id *)&self->_resizeTriangle, a3);
}

- (ICHandwritingDebugViewController)handwritingDebugViewController
{
  return self->_handwritingDebugViewController;
}

- (void)setHandwritingDebugViewController:(id)a3
{
  objc_storeStrong((id *)&self->_handwritingDebugViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handwritingDebugViewController, 0);
  objc_storeStrong((id *)&self->_resizeTriangle, 0);
}

@end
