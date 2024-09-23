@implementation RatchetCoolOffViewController

- (void)loadView
{
  id v3;
  void *v4;
  _TtP10CoreAuthUI39RatchetCoolOffContentViewControllerType_ *v5;
  _TtP10CoreAuthUI39RatchetCoolOffContentViewControllerType_ *contentVC;
  void *v7;
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
  void *v28;
  void *v29;

  v3 = objc_alloc_init((Class)UIView);
  -[RatchetCoolOffViewController setView:](self, "setView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController internalInfo](self, "internalInfo"));
  v5 = (_TtP10CoreAuthUI39RatchetCoolOffContentViewControllerType_ *)objc_claimAutoreleasedReturnValue(+[RatchetCoolOffFactory makeViewControllerWith:delegate:](_TtC10CoreAuthUI21RatchetCoolOffFactory, "makeViewControllerWith:delegate:", v4, self));
  contentVC = self->_contentVC;
  self->_contentVC = v5;

  -[RatchetCoolOffContentViewControllerType willMoveToParent:](self->_contentVC, "willMoveToParent:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffContentViewControllerType view](self->_contentVC, "view"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffContentViewControllerType view](self->_contentVC, "view"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffContentViewControllerType view](self->_contentVC, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  objc_msgSend(v14, "setActive:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffContentViewControllerType view](self->_contentVC, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffContentViewControllerType view](self->_contentVC, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  objc_msgSend(v24, "setActive:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffContentViewControllerType view](self->_contentVC, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
  objc_msgSend(v29, "setActive:", 1);

  -[RatchetCoolOffContentViewControllerType didMoveToParent:](self->_contentVC, "didMoveToParent:", self);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RatchetCoolOffViewController;
  -[TransitionViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RatchetCoolOffViewController presentationController](self, "presentationController"));
  objc_msgSend(v3, "setDelegate:", self);

}

- (BOOL)isFullScreenController
{
  return 1;
}

- (BOOL)shouldPresentWithAnimation
{
  return 1;
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8;
  _TtP10CoreAuthUI39RatchetCoolOffContentViewControllerType_ *v9;
  double v10;
  _TtP10CoreAuthUI39RatchetCoolOffContentViewControllerType_ *contentVC;
  id v12;

  v12 = a4;
  v8 = a5;
  if (a3 == 19)
  {
    contentVC = self->_contentVC;
    v10 = 0.0;
    goto LABEL_5;
  }
  if (a3 == 18)
  {
    v9 = self->_contentVC;
    objc_msgSend(v12, "doubleValue");
    contentVC = v9;
LABEL_5:
    -[RatchetCoolOffContentViewControllerType setCoolOffDuration:](contentVC, "setCoolOffDuration:", v10);
  }

}

- (BOOL)processHomeButtonPressed
{
  -[TransitionViewController uiDismissed](self, "uiDismissed");
  return 1;
}

- (void)ratchetCoolOffContentDidTapOnBeginDelay:(id)a3
{
  -[TransitionViewController uiContinue](self, "uiContinue", a3);
}

- (void)ratchetCoolOffContentDidTapOnCustomCancel:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[LAErrorHelper errorWithCode:message:](LAErrorHelper, "errorWithCode:message:", -1025, CFSTR("Custom canceled by user.")));
  -[TransitionViewController uiCancelWithError:](self, "uiCancelWithError:", v4);

}

- (void)ratchetCoolOffContentDidTapOnContinue:(id)a3
{
  -[TransitionViewController uiContinue](self, "uiContinue", a3);
}

- (void)ratchetCoolOffContentDidTapOnLearnMore:(id)a3
{
  id v4;

  -[TransitionViewController uiDismissed](self, "uiDismissed", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[LACUIDTOUtilities dtoLearnMoreLinkURL](LACUIDTOUtilities, "dtoLearnMoreLinkURL"));
  -[TransitionViewController uiOpenURL:](self, "uiOpenURL:", v4);

}

- (void)presentationControllerWillDismiss:(id)a3
{
  -[TransitionViewController setAwaitingDissappear:](self, "setAwaitingDissappear:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentVC, 0);
}

@end
