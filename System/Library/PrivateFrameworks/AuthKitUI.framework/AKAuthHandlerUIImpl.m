@implementation AKAuthHandlerUIImpl

- (id)buildReauthenticationContextFromContext:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "_updateWithValuesFromContext:", v4);
  objc_msgSend(v5, "setIsUsernameEditable:", 0);
  objc_msgSend(v5, "setShouldSkipSettingsLaunchAlert:", 1);
  objc_msgSend(v5, "setNeedsNewChildAccount:", 0);
  objc_msgSend(v5, "setAuthenticationType:", 0);
  objc_msgSend(v5, "setShouldOfferSecurityUpgrade:", 0);
  objc_msgSend(v5, "setNeedsRepair:", 0);
  objc_msgSend(v4, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v4, "presentingViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v10, "topViewController"), v11 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v11,
                                                v11))
  {
    objc_msgSend(v10, "topViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresentingViewController:", v12);

  }
  else
  {
    objc_msgSend(v5, "setPresentingViewController:", v10);
  }

  return v5;
}

@end
