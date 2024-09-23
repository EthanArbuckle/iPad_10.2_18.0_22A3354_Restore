@implementation DDParsecAction

+ (BOOL)isAvailable
{
  return +[DDRemoteActionViewController controllerIsAvailable](DDRemoteActionViewController, "controllerIsAvailable");
}

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Look Up"));
}

- (int)interactionType
{
  return 1;
}

- (id)createViewController
{
  DDParsecCollectionViewController *v3;
  DDParsecCollectionViewController *parsecViewController;
  DDParsecCollectionViewController *v5;

  if (self->super.super._result)
  {
    v3 = -[DDParsecCollectionViewController initWithResult:context:]([DDParsecCollectionViewController alloc], "initWithResult:context:", self->super.super._result, self->super.super._context);
    parsecViewController = self->_parsecViewController;
    self->_parsecViewController = v3;

    -[DDParsecCollectionViewController setParsecDelegate:](self->_parsecViewController, "setParsecDelegate:", self);
    -[DDParsecCollectionViewController setPreviewMode:](self->_parsecViewController, "setPreviewMode:", self->_previewMode);
    v5 = self->_parsecViewController;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)interactionDidFinishAndRequiresDismissal:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[DDAction delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionDidFinish:shouldDismiss:", self, v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecViewController, 0);
}

@end
