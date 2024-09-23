@implementation SRCompactEditableUtterancePresenter

- (SRCompactEditableUtterancePresenter)initWithUserEditingDataManager:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SRCompactEditableUtterancePresenter *v9;
  SRCompactEditableUtterancePresenter *v10;
  SRCompactEditableUtteranceViewController *v11;
  void *v12;
  SRCompactEditableUtteranceViewController *v13;
  UIViewController *editableUtteranceViewController;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SRCompactEditableUtterancePresenter;
  v9 = -[SRCompactEditableUtterancePresenter init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_userUtteranceEditingDataManager, a3);
    v11 = [SRCompactEditableUtteranceViewController alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUIUserUtteranceEditingDataManaging userUtterance](v10->_userUtteranceEditingDataManager, "userUtterance"));
    v13 = -[SRCompactEditableUtteranceViewController initWithUserUtterance:delegate:dataSource:](v11, "initWithUserUtterance:delegate:dataSource:", v12, v10, v10);
    editableUtteranceViewController = v10->_editableUtteranceViewController;
    v10->_editableUtteranceViewController = &v13->super;

  }
  return v10;
}

- (void)presentUtteranceViewControllerFromViewController:(id)a3 animateAlongsideTransition:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[SRCompactEditableUtterancePresenter presentUtteranceViewControllerFromViewController:animateAlongsideTransit"
          "ion:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #compact: presentingEditableUtteranceViewController", (uint8_t *)&v12, 0xCu);
  }
  -[SRCompactEditableUtterancePresenter presentViewController:fromViewController:animateAlongsideTransition:completion:](self, "presentViewController:fromViewController:animateAlongsideTransition:completion:", self->_editableUtteranceViewController, v8, v9, v10);

}

- (void)dismissEditableUtteranceViewControllerAndShouldStartNewRequest:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  UIViewController *editableUtteranceViewController;
  id v9;
  id WeakRetained;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;

  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SRCompactEditableUtterancePresenter dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact: dismissing editableUtteranceViewController", buf, 0xCu);
  }
  self->_shouldStartNewRequest = a3;
  objc_initWeak((id *)buf, self);
  editableUtteranceViewController = self->_editableUtteranceViewController;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100066878;
  v15 = &unk_100124058;
  objc_copyWeak(&v17, (id *)buf);
  v9 = v6;
  v16 = v9;
  -[UIViewController dismissViewControllerAnimated:completion:](editableUtteranceViewController, "dismissViewControllerAnimated:completion:", 1, &v12);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController transitionCoordinator](self->_editableUtteranceViewController, "transitionCoordinator", v12, v13, v14, v15));
  objc_msgSend(WeakRetained, "willDismissEditableUtterancePresenter:transitionCoordinator:", self, v11);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  return self->_editableUtteranceViewController && self->_editableUtteranceViewControllerIsPresented;
}

- (id)attributedStringAtIndex:(int64_t)a3
{
  return -[SiriSharedUIUserUtteranceEditingDataManaging attributedStringAtIndex:](self->_userUtteranceEditingDataManager, "attributedStringAtIndex:", a3);
}

- (int64_t)numberOfAlternativeUtterances
{
  return (int64_t)-[SiriSharedUIUserUtteranceEditingDataManaging numberOfAlternativeUtterances](self->_userUtteranceEditingDataManager, "numberOfAlternativeUtterances");
}

- (void)didResignFirstResponderFromUtteranceViewController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didResignFirstResponderFromUtterancePresenter:", self);

}

- (void)editableUtteranceViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  SRCompactEditableUtterancePresenterDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "editableUtterancePresenter:requestsKeyboardWithCompletion:", self, v6);

}

- (void)willBeginEditingFromUtteranceViewController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "willBeginEditingFromUtterancePresenter:", self);

}

- (void)editableUtteranceViewController:(id)a3 alternativeSelectedAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  id v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtterancePresenter attributedStringAtIndex:](self, "attributedStringAtIndex:", a4));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUIUserUtteranceEditingDataManaging selectionResultsForAlternateTextAtIndex:](self->_userUtteranceEditingDataManager, "selectionResultsForAlternateTextAtIndex:", a4));
  LODWORD(v6) = -[SiriSharedUIUserUtteranceEditingDataManaging isEditedTextSameAsUtterance:](self->_userUtteranceEditingDataManager, "isEditedTextSameAsUtterance:", v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = v6 ^ 1;
  objc_msgSend(WeakRetained, "editableUtterancePresenter:didFinishEditingWithText:selectionResults:shouldStartNewRequest:", self, v10, v7, v9);

  -[SRCompactEditableUtterancePresenter dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:](self, "dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:", v9, 0);
}

- (void)editableUtteranceViewController:(id)a3 didFinishEditingWithText:(id)a4
{
  SiriSharedUIUserUtteranceEditingDataManaging *userUtteranceEditingDataManager;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;

  userUtteranceEditingDataManager = self->_userUtteranceEditingDataManager;
  v6 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SiriSharedUIUserUtteranceEditingDataManaging selectionResultsForEditedText:](userUtteranceEditingDataManager, "selectionResultsForEditedText:", v6));
  LODWORD(userUtteranceEditingDataManager) = -[SiriSharedUIUserUtteranceEditingDataManaging isEditedTextSameAsUtterance:](self->_userUtteranceEditingDataManager, "isEditedTextSameAsUtterance:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = userUtteranceEditingDataManager ^ 1;
  objc_msgSend(WeakRetained, "editableUtterancePresenter:didFinishEditingWithText:selectionResults:shouldStartNewRequest:", self, v6, v9, v8);

  -[SRCompactEditableUtterancePresenter dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:](self, "dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:", v8, 0);
}

- (void)editableUtteranceViewController:(id)a3 openURL:(id)a4
{
  SRCompactEditableUtterancePresenterDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "editableUtterancePresenter:openURL:", self, v6);

}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 animateAlongsideTransition:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v22, "setModalPresentationStyle:", 2);
  objc_msgSend(v22, "setModalPresentationCapturesStatusBarAppearance:", 1);
  objc_msgSend(v22, "setNeedsStatusBarAppearanceUpdate");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedViewController"));
  objc_opt_class(v22, v14);
  isKindOfClass = objc_opt_isKindOfClass(v13, v15);

  if ((isKindOfClass & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_rootSheetPresentationController"));

    -[SRCompactEditableUtterancePresenter _editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:](self, "_editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:", v19);
    objc_msgSend(v10, "presentViewController:animated:completion:", v22, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "presentationController"));
    objc_msgSend(v20, "setDelegate:", self);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "transitionCoordinator"));
    objc_msgSend(v21, "animateAlongsideTransition:completion:", v11, v12);

  }
}

- (void)_editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:(id)a3
{
  _UISheetPresentationController **p_sheetPresentationController;
  id v5;
  unsigned __int8 v6;
  id WeakRetained;
  id v8;

  self->_editableUtteranceViewControllerIsPresented = 1;
  p_sheetPresentationController = &self->_sheetPresentationController;
  v8 = a3;
  v5 = objc_storeWeak((id *)p_sheetPresentationController, v8);
  v6 = objc_msgSend(v8, "_shouldScaleDownBehindDescendantSheets");

  self->_previousShouldScaleDownBehindDescendantSheetsValue = v6;
  WeakRetained = objc_loadWeakRetained((id *)p_sheetPresentationController);
  objc_msgSend(WeakRetained, "_setShouldScaleDownBehindDescendantSheets:", 0);

}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController transitionCoordinator](self->_editableUtteranceViewController, "transitionCoordinator"));
  objc_msgSend(WeakRetained, "willDismissEditableUtterancePresenter:transitionCoordinator:", self, v4);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[SRCompactEditableUtterancePresenter _editableUtteranceViewControllerDidDismiss:](self, "_editableUtteranceViewControllerDidDismiss:", self->_editableUtteranceViewController);
}

- (void)_editableUtteranceViewControllerDidDismiss:(id)a3
{
  _UISheetPresentationController **p_sheetPresentationController;
  id WeakRetained;
  UIViewController *editableUtteranceViewController;

  p_sheetPresentationController = &self->_sheetPresentationController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sheetPresentationController);
  objc_msgSend(WeakRetained, "_setShouldScaleDownBehindDescendantSheets:", self->_previousShouldScaleDownBehindDescendantSheetsValue);

  self->_previousShouldScaleDownBehindDescendantSheetsValue = 0;
  objc_storeWeak((id *)p_sheetPresentationController, 0);
  self->_editableUtteranceViewControllerIsPresented = 0;
  editableUtteranceViewController = self->_editableUtteranceViewController;
  self->_editableUtteranceViewController = 0;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sheetPresentationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editableUtteranceViewController, 0);
  objc_storeStrong((id *)&self->_userUtteranceEditingDataManager, 0);
}

@end
