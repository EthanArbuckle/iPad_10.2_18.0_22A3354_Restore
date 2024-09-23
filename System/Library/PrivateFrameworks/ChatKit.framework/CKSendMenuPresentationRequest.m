@implementation CKSendMenuPresentationRequest

- (CKSendMenuPresentationRequest)initWithPresentationContext:(id)a3 sendMenuViewController:(id)a4 appCardContentViewController:(id)a5 resolvedAppCardPresentationStyle:(unint64_t)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CKSendMenuPresentationRequest *v17;
  CKSendMenuPresentationRequest *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CKSendMenuPresentationRequest;
  v17 = -[CKSendMenuPresentationRequest init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_presentationContext, a3);
    objc_storeStrong((id *)&v18->_sendMenuViewController, a4);
    objc_storeStrong((id *)&v18->_appCardContentViewController, a5);
    v18->_resolvedAppCardPresentationStyle = a6;
    -[CKSendMenuPresentationRequest setCompletionHandler:](v18, "setCompletionHandler:", v16);
  }

  return v18;
}

+ (id)requestWithPresentationContext:(id)a3 sendMenuViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPresentationContext:sendMenuViewController:appCardContentViewController:resolvedAppCardPresentationStyle:completion:", v10, v9, 0, 0, v8);

  return v11;
}

+ (id)requestWithPresentationContext:(id)a3 appCardContentViewController:(id)a4 resolvedAppCardPresentationStyle:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPresentationContext:sendMenuViewController:appCardContentViewController:resolvedAppCardPresentationStyle:completion:", v12, 0, v11, a5, v10);

  return v13;
}

- (id)newSendMenuPresentationWithPresentingViewController:(id)a3 delegate:(id)a4
{
  CKSendMenuViewController *sendMenuViewController;
  id v7;
  id v8;
  CKSendMenuPresentation *v9;
  CKSceneOverlayPresentationContext *presentationContext;
  uint64_t v11;
  void *v12;

  sendMenuViewController = self->_sendMenuViewController;
  v7 = a4;
  v8 = a3;
  v9 = [CKSendMenuPresentation alloc];
  presentationContext = self->_presentationContext;
  if (sendMenuViewController)
    v11 = -[CKSendMenuPresentation initWithOverlayPresentationContext:presentingViewController:sendMenuViewController:delegate:](v9, "initWithOverlayPresentationContext:presentingViewController:sendMenuViewController:delegate:", presentationContext, v8, self->_sendMenuViewController, v7);
  else
    v11 = -[CKSendMenuPresentation initWithOverlayPresentationContext:presentingViewController:appCardContentViewController:appCardPresentationStyle:delegate:](v9, "initWithOverlayPresentationContext:presentingViewController:appCardContentViewController:appCardPresentationStyle:delegate:", presentationContext, v8, self->_appCardContentViewController, self->_resolvedAppCardPresentationStyle, v7);
  v12 = (void *)v11;

  return v12;
}

- (void)didFinishPresentTransition
{
  void (**v2)(void);

  -[CKSendMenuPresentationRequest completionHandler](self, "completionHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (CKSceneOverlayPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (CKSendMenuViewController)sendMenuViewController
{
  return self->_sendMenuViewController;
}

- (void)setSendMenuViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sendMenuViewController, a3);
}

- (UIViewController)appCardContentViewController
{
  return self->_appCardContentViewController;
}

- (void)setAppCardContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_appCardContentViewController, a3);
}

- (unint64_t)resolvedAppCardPresentationStyle
{
  return self->_resolvedAppCardPresentationStyle;
}

- (void)setResolvedAppCardPresentationStyle:(unint64_t)a3
{
  self->_resolvedAppCardPresentationStyle = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_appCardContentViewController, 0);
  objc_storeStrong((id *)&self->_sendMenuViewController, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
}

@end
