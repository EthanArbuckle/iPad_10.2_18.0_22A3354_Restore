@implementation CKNicknameIntroViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKNicknameIntroViewController;
  -[OBBaseWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNicknameIntroViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKNicknameIntroViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[CKNicknameIntroViewController nicknamePreviewView](self, "nicknamePreviewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldStopAnimation:", 0);

  -[CKNicknameIntroViewController nicknamePreviewView](self, "nicknamePreviewView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginAnimation");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKNicknameIntroViewController;
  -[CKNicknameIntroViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CKNicknameIntroViewController nicknamePreviewView](self, "nicknamePreviewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldStopAnimation:", 1);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double Width;
  double v12;
  void *v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)CKNicknameIntroViewController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[CKNicknameIntroViewController nicknamePreviewView](self, "nicknamePreviewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[CKNicknameIntroViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  Width = CGRectGetWidth(v15);
  v16.origin.y = 15.0;
  v16.origin.x = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  v12 = (Width - CGRectGetWidth(v16)) * 0.5;

  -[CKNicknameIntroViewController nicknamePreviewView](self, "nicknamePreviewView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v12, 15.0, v7, v9);

}

- (double)_contentViewHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[CKNicknameIntroViewController nicknamePreviewView](self, "nicknamePreviewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[CKNicknameIntroViewController nicknamePreviewView](self, "nicknamePreviewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5 + 15.0 + 20.0;

  return v6;
}

- (CKNicknamePreviewView)nicknamePreviewView
{
  return self->_nicknamePreviewView;
}

- (void)setNicknamePreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_nicknamePreviewView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknamePreviewView, 0);
}

@end
