@implementation CNAvatarCardTransitionController

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  objc_msgSend(a3, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceViewController:", v6);

  objc_msgSend(v7, "transition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReversed:", 0);

  return v8;
}

- (id)animationControllerForDismissedController:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "transition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReversed:", 1);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  id v9;
  CNAvatarCardPresentationController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CNAvatarCardPresentationController initWithPresentedViewController:presentingViewController:]([CNAvatarCardPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v9, v8);

  -[CNAvatarCardPresentationController setSourceViewController:](v10, "setSourceViewController:", v7);
  return v10;
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_62112);
  return (id)sharedController_sharedController;
}

void __52__CNAvatarCardTransitionController_sharedController__block_invoke()
{
  CNAvatarCardTransitionController *v0;
  void *v1;

  v0 = objc_alloc_init(CNAvatarCardTransitionController);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

}

@end
