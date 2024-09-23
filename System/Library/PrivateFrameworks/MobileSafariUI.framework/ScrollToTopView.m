@implementation ScrollToTopView

- (ScrollToTopView)initWithTargetBlock:(id)a3
{
  id v4;
  ScrollToTopView *v5;
  void *v6;
  id targetBlock;
  ScrollToTopView *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ScrollToTopView;
  v5 = -[ScrollToTopView init](&v10, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    targetBlock = v5->_targetBlock;
    v5->_targetBlock = v6;

    v8 = v5;
  }

  return v5;
}

- (ScrollToTopView)initWithFrame:(CGRect)a3
{
  ScrollToTopView *v3;
  void *v4;
  ScrollToTopView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ScrollToTopView;
  v3 = -[ScrollToTopView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel__tappedScrollToTopView_);
    -[ScrollToTopView addGestureRecognizer:](v3, "addGestureRecognizer:", v4);

    v5 = v3;
  }

  return v3;
}

- (void)_tappedScrollToTopView:(id)a3
{
  void *v4;
  char v5;

  -[ScrollToTopView _targetScrollView](self, "_targetScrollView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_scrollToTopIfPossible:", 1);

  if ((v5 & 1) == 0)
    -[ScrollToTopView _showBars](self, "_showBars");
}

- (id)_targetScrollView
{
  void (**targetBlock)(_QWORD, _QWORD);

  targetBlock = (void (**)(_QWORD, _QWORD))self->_targetBlock;
  if (targetBlock)
  {
    ((void (**)(_QWORD, SEL))targetBlock)[2](targetBlock, a2);
    targetBlock = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return targetBlock;
}

- (void)_showBars
{
  void (**showBarsBlock)(void);

  showBarsBlock = (void (**)(void))self->_showBarsBlock;
  if (showBarsBlock)
    showBarsBlock[2]();
}

- (double)defaultHeight
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[ScrollToTopView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "statusBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultStatusBarHeightInOrientation:", objc_msgSend(v3, "interfaceOrientation"));
  v6 = v5;

  return fmax(v6, 20.0);
}

- (id)targetBlock
{
  return self->_targetBlock;
}

- (void)setTargetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (id)showBarsBlock
{
  return self->_showBarsBlock;
}

- (void)setShowBarsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_showBarsBlock, 0);
  objc_storeStrong(&self->_targetBlock, 0);
}

@end
