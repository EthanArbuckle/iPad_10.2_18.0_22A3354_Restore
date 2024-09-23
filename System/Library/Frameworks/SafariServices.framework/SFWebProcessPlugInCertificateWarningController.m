@implementation SFWebProcessPlugInCertificateWarningController

- (void)_setUpCertificateWarningPagePresenterInterface
{
  _WKRemoteObjectInterface *v3;
  _WKRemoteObjectInterface *certificateWarningPagePresenterInterface;
  void *v5;
  void *v6;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE77BC00);
  v3 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  certificateWarningPagePresenterInterface = self->_certificateWarningPagePresenterInterface;
  self->_certificateWarningPagePresenterInterface = v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  objc_msgSend(WeakRetained, "browserContextController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_remoteObjectRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerExportedObject:interface:", self, self->_certificateWarningPagePresenterInterface);

}

- (SFWebProcessPlugInCertificateWarningController)initWithPageController:(id)a3
{
  id v4;
  SFWebProcessPlugInCertificateWarningController *v5;
  SFWebProcessPlugInCertificateWarningController *v6;
  SFWebProcessPlugInCertificateWarningController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFWebProcessPlugInCertificateWarningController;
  v5 = -[SFWebProcessPlugInCertificateWarningController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pageController, v4);
    -[SFWebProcessPlugInCertificateWarningController _setUpCertificateWarningPagePresenterInterface](v6, "_setUpCertificateWarningPagePresenterInterface");
    v7 = v6;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SFWebProcessPlugInCertificateWarningController _clearCertificateWarningPagePresenterInterface](self, "_clearCertificateWarningPagePresenterInterface");
  v3.receiver = self;
  v3.super_class = (Class)SFWebProcessPlugInCertificateWarningController;
  -[SFWebProcessPlugInCertificateWarningController dealloc](&v3, sel_dealloc);
}

- (void)_clearCertificateWarningPagePresenterInterface
{
  id WeakRetained;
  void *v4;
  _WKRemoteObjectInterface *certificateWarningPagePresenterInterface;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  objc_msgSend(WeakRetained, "browserContextController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_remoteObjectRegistry");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unregisterExportedObject:interface:", self, self->_certificateWarningPagePresenterInterface);
  certificateWarningPagePresenterInterface = self->_certificateWarningPagePresenterInterface;
  self->_certificateWarningPagePresenterInterface = 0;

}

- (void)injectCertificateWarningBindingsForFrame:(id)a3 inScriptWorld:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFCertificateWarningJSController *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isFileURL") && self->_warningPageContext)
  {
    objc_msgSend(v13, "jsContextForWorld:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "globalObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CBE108];
    v11 = -[SFCertificateWarningJSController initWithCertificateWarningController:]([SFCertificateWarningJSController alloc], "initWithCertificateWarningController:", self);
    objc_msgSend(v10, "valueWithObject:inContext:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setValue:forProperty:", v12, CFSTR("CertificateWarningController"));
  }

}

- (void)certificateWarningPageLoaded
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
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
  id v28;
  WBSCertificateWarningPageContext *warningPageContext;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[7];

  v36[6] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  objc_msgSend(WeakRetained, "browserContextController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEF628], "normalWorld");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsContextForWorld:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "globalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", CFSTR("CertificateWarning"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "isUndefined") & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CBE108];
    -[WBSCertificateWarningPageContext failingURL](self->_warningPageContext, "failingURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueWithObject:inContext:", v13, v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CBE108];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WBSCertificateWarningPageContext warningCategory](self->_warningPageContext, "warningCategory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueWithObject:inContext:", v15, v7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CBE108];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WBSCertificateWarningPageContext canGoBack](self->_warningPageContext, "canGoBack"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueWithObject:inContext:", v17, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CBE108];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WBSCertificateWarningPageContext numberOfDaysInvalid](self->_warningPageContext, "numberOfDaysInvalid"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueWithObject:inContext:", v20, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CBE108];
    -[WBSCertificateWarningPageContext expiredCerticateDescription](self->_warningPageContext, "expiredCerticateDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "valueWithObject:inContext:", v23, v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0CBE108];
    -[WBSCertificateWarningPageContext clockSkew](self->_warningPageContext, "clockSkew");
    objc_msgSend(v25, "valueWithDouble:inContext:", v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v34;
    v36[1] = v33;
    v36[2] = v18;
    v36[3] = v21;
    v36[4] = v24;
    v36[5] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v10, "invokeMethod:withArguments:", CFSTR("updateUI"), v27);

    warningPageContext = self->_warningPageContext;
    self->_warningPageContext = 0;

    if (objc_msgSend(MEMORY[0x1E0C99DC8], "_sf_isRTL"))
    {
      objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", CFSTR("rtl"), v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (id)objc_msgSend(v10, "invokeMethod:withArguments:", CFSTR("setTextDirection"), v31);

    }
  }

}

- (id)_certificateWarningPageHandlerProxy
{
  WBSCertificateWarningPageHandler *certificateWarningPageHandlerProxy;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  WBSCertificateWarningPageHandler *v8;
  WBSCertificateWarningPageHandler *v9;

  certificateWarningPageHandlerProxy = self->_certificateWarningPageHandlerProxy;
  if (!certificateWarningPageHandlerProxy)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
    objc_msgSend(WeakRetained, "browserContextController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_remoteObjectRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE71F570);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxyWithInterface:", v7);
    v8 = (WBSCertificateWarningPageHandler *)objc_claimAutoreleasedReturnValue();
    v9 = self->_certificateWarningPageHandlerProxy;
    self->_certificateWarningPageHandlerProxy = v8;

    certificateWarningPageHandlerProxy = self->_certificateWarningPageHandlerProxy;
  }
  return certificateWarningPageHandlerProxy;
}

- (void)visitInsecureWebsite
{
  id v2;

  -[SFWebProcessPlugInCertificateWarningController _certificateWarningPageHandlerProxy](self, "_certificateWarningPageHandlerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visitInsecureWebsite");

}

- (void)visitInsecureWebsiteWithTemporaryBypass
{
  id v2;

  -[SFWebProcessPlugInCertificateWarningController _certificateWarningPageHandlerProxy](self, "_certificateWarningPageHandlerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visitInsecureWebsiteWithTemporaryBypass");

}

- (void)showCertificateInformation
{
  id v2;

  -[SFWebProcessPlugInCertificateWarningController _certificateWarningPageHandlerProxy](self, "_certificateWarningPageHandlerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showCertificateInformation");

}

- (void)openClockSettings
{
  id v2;

  -[SFWebProcessPlugInCertificateWarningController _certificateWarningPageHandlerProxy](self, "_certificateWarningPageHandlerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openClockSettings");

}

- (void)goBackSelected
{
  id v2;

  -[SFWebProcessPlugInCertificateWarningController _certificateWarningPageHandlerProxy](self, "_certificateWarningPageHandlerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "goBackButtonClicked");

}

- (void)visitWebsiteWithoutPrivateRelay
{
  id v2;

  -[SFWebProcessPlugInCertificateWarningController _certificateWarningPageHandlerProxy](self, "_certificateWarningPageHandlerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visitWebsiteWithoutPrivateRelay");

}

- (void)prepareCertificateWarningPage:(id)a3
{
  objc_storeStrong((id *)&self->_warningPageContext, a3);
}

- (WBSCertificateWarningPageContext)warningPageContext
{
  return self->_warningPageContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningPageContext, 0);
  objc_storeStrong((id *)&self->_certificateWarningPageHandlerProxy, 0);
  objc_storeStrong((id *)&self->_certificateWarningPagePresenterInterface, 0);
  objc_destroyWeak((id *)&self->_pageController);
}

@end
