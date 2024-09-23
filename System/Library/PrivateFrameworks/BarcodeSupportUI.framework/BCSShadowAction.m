@implementation BCSShadowAction

- (BCSShadowAction)initWithURL:(id)a3 appLink:(id)a4 originalAction:(id)a5
{
  id v9;
  id v10;
  id v11;
  BCSShadowAction *v12;
  BCSShadowAction *v13;
  LSAppLink *appLink;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  LSApplicationProxy *applicationProxy;
  BCSShadowAction *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BCSShadowAction;
  v12 = -[BCSShadowAction init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_appLink, a4);
    objc_storeStrong((id *)&v13->_originalAction, a5);
    appLink = v13->_appLink;
    if (appLink)
    {
      -[LSAppLink targetApplicationProxy](appLink, "targetApplicationProxy");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v9, "_bcs_isHTTPFamilyURL"))
      {
        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "applicationsAvailableForOpeningURL:", v13->_url);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = objc_claimAutoreleasedReturnValue();
        applicationProxy = v13->_applicationProxy;
        v13->_applicationProxy = (LSApplicationProxy *)v18;

        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilesafari"));
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = v13->_applicationProxy;
    v13->_applicationProxy = (LSApplicationProxy *)v15;
LABEL_8:

    v20 = v13;
  }

  return v13;
}

- (NSURL)urlThatCanBeOpened
{
  return self->_url;
}

- (NSString)defaultActionTargetApplicationBundleIdentifier
{
  return (NSString *)-[LSApplicationProxy bundleIdentifier](self->_applicationProxy, "bundleIdentifier");
}

- (NSDictionary)debugDescriptionDictionary
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
}

- (NSArray)actionPickerItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE0BA50];
  -[LSApplicationProxy localizedShortName](self->_applicationProxy, "localizedShortName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__BCSShadowAction_actionPickerItems__block_invoke;
  v8[3] = &unk_250863730;
  v8[4] = self;
  objc_msgSend(v3, "actionPickerItemWithLabel:actionHandler:", v4, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

uint64_t __36__BCSShadowAction_actionPickerItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction");
}

- (void)performAction
{
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", self->_url, MEMORY[0x24BDBD1B8], 0);

}

- (NSString)localizedDefaultActionDescription
{
  return (NSString *)-[LSApplicationProxy localizedName](self->_applicationProxy, "localizedName");
}

- (NSString)localizedDefaultActionTitle
{
  return (NSString *)-[LSApplicationProxy localizedShortName](self->_applicationProxy, "localizedShortName");
}

- (BCSActionDelegate)delegate
{
  return (BCSActionDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSString)extraPreviewText
{
  return self->extraPreviewText;
}

- (NSString)localizedActionDescription
{
  return self->localizedActionDescription;
}

- (BOOL)isInvalidDataAction
{
  return self->isInvalidDataAction;
}

- (BOOL)isWiFiAction
{
  return self->isWiFiAction;
}

- (int64_t)codeType
{
  return self->codeType;
}

- (CPSClipMetadataRequest)clipMetadataRequest
{
  return self->clipMetadataRequest;
}

- (void)setClipMetadataRequest:(id)a3
{
  objc_storeStrong((id *)&self->clipMetadataRequest, a3);
}

- (BOOL)shouldRequireUserToPickTargetApp
{
  return self->shouldRequireUserToPickTargetApp;
}

- (BOOL)hasSensitiveURL
{
  return self->hasSensitiveURL;
}

- (BOOL)isAMSAction
{
  return self->isAMSAction;
}

- (BOOL)isPasskeyAction
{
  return self->isPasskeyAction;
}

- (BOOL)isPasskeyAssertionAction
{
  return self->isPasskeyAssertionAction;
}

- (BOOL)isPasskeyRegistrationAction
{
  return self->isPasskeyRegistrationAction;
}

- (BOOL)isApplePayInitiateAction
{
  return self->isApplePayInitiateAction;
}

- (BOOL)isLiveCameraOnlyAction
{
  return self->isLiveCameraOnlyAction;
}

- (BOOL)isAirplayPairingAction
{
  return self->isAirplayPairingAction;
}

- (BOOL)isContinuityCameraAction
{
  return self->isContinuityCameraAction;
}

- (NSArray)appLinks
{
  return self->appLinks;
}

- (NSURL)url
{
  return self->_url;
}

- (LSAppLink)appLink
{
  return self->_appLink;
}

- (BCSAction)originalAction
{
  return self->_originalAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAction, 0);
  objc_storeStrong((id *)&self->_appLink, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->appLinks, 0);
  objc_storeStrong((id *)&self->clipMetadataRequest, 0);
  objc_storeStrong((id *)&self->localizedActionDescription, 0);
  objc_storeStrong((id *)&self->extraPreviewText, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_applicationProxy, 0);
}

@end
