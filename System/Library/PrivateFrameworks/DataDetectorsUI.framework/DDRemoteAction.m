@implementation DDRemoteAction

- (id)createViewController
{
  void *v3;
  DDRemoteActionManagerViewController *v4;

  objc_msgSend((id)objc_opt_class(), "viewControllerProviderClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[DDRemoteActionManagerViewController initWithAction:]([DDRemoteActionManagerViewController alloc], "initWithAction:", self);
  else
    v4 = 0;
  return v4;
}

- (void)setPreviewMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DDRemoteAction;
  -[DDPreviewAction setPreviewMode:](&v6, sel_setPreviewMode_);
  -[DDPreviewAction viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviewMode:", v3);

}

+ (id)viewControllerProviderClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DDRemoteAction.m"), 68, CFSTR("This method should never be called in the class DDRemoteAction. This method should be overriden."));

  return 0;
}

- (id)previewActions
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDRemoteAction.m"), 73, CFSTR("This method should never be called in the class DDRemoteAction. This method should be overriden."));

  return 0;
}

@end
