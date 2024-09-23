@implementation _CNCustomActionSheetPresentation

- (void)prepareForPresentationOfController:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setModalPresentationStyle:", 4);
  objc_msgSend(v4, "setTransitioningDelegate:", self);
  -[_CNCustomActionSheetPresentation setViewController:](self, "setViewController:", v4);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0DC3FE8];
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithPresentedViewController:presentingViewController:", v9, v8);

  objc_msgSend(v10, "setActionSheetDelegate:", self);
  objc_msgSend(v10, "_setShouldUseCompactPresentationControllerWhenPresentedInSheet:", 1);
  CNContactsUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDismissActionTitle:", v12);

  -[_CNCustomActionSheetPresentation sourceRect](self, "sourceRect");
  objc_msgSend(v10, "setSourceRect:");
  -[_CNCustomActionSheetPresentation sourceView](self, "sourceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSourceView:", v13);

  objc_msgSend(v10, "setPermittedArrowDirections:", -[_CNCustomActionSheetPresentation permittedArrowDirections](self, "permittedArrowDirections"));
  return v10;
}

- (void)actionSheetPresentationControllerDidDismissActionSheet:(id)a3
{
  void (**v3)(void);

  -[_CNCustomActionSheetPresentation dismissHandler](self, "dismissHandler", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
