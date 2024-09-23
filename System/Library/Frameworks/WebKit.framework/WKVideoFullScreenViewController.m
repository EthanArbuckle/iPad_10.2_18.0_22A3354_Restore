@implementation WKVideoFullScreenViewController

- (WKVideoFullScreenViewController)initWithAVPlayerViewController:(id)a3
{
  WKVideoFullScreenViewController *v4;
  WKVideoFullScreenViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKVideoFullScreenViewController;
  v4 = -[WKVideoFullScreenViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak(&v4->_avPlayerViewController.m_weakReference, a3);
    -[WKVideoFullScreenViewController setModalPresentationCapturesStatusBarAppearance:](v5, "setModalPresentationCapturesStatusBarAppearance:", 1);
    -[WKVideoFullScreenViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 5);
  }
  return v5;
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKVideoFullScreenViewController;
  -[WKVideoFullScreenViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "bounds");
  objc_msgSend((id)-[WKVideoFullScreenViewController view](self, "view"), "setFrame:", v3, v4, v5, v6);
  objc_msgSend((id)-[WKVideoFullScreenViewController view](self, "view"), "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "blackColor"));
  objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_avPlayerViewController.m_weakReference), "view"), "setAutoresizingMask:", 18);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_avPlayerViewController.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 121) = 0;
  return self;
}

@end
