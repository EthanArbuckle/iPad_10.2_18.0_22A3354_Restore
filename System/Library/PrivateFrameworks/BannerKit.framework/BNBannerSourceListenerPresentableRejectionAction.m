@implementation BNBannerSourceListenerPresentableRejectionAction

- (BNBannerSourceListenerPresentableRejectionAction)initWithReason:(id)a3
{
  id v5;
  id v6;
  BNBannerSourceListenerPresentableRejectionAction *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListenerPresentableRejectionAction.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[reason length] > 0"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v6, "setObject:forSetting:", v5, 1);

  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerPresentableRejectionAction;
  v7 = -[BNBannerSourceListenerPresentableRejectionAction initWithInfo:responder:](&v10, sel_initWithInfo_responder_, v6, 0);

  return v7;
}

- (NSString)rejectionReason
{
  void *v2;
  void *v3;

  -[BNBannerSourceListenerPresentableRejectionAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_expectsResponse
{
  return 0;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("rejectionReason");
  else
    return 0;
}

@end
