@implementation CDPUIAuthenticationHelper

+ (void)_authWithContext:(id)a3 completion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BE0ACC0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "authenticateWithContext:completion:", v7, v6);

}

+ (id)_authContextForContext:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BE0ACB8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDSID:", v7);

  objc_msgSend(v4, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAltDSID:", v8);

  objc_msgSend(v4, "appleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsername:", v9);

  objc_msgSend(v4, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_setPassword:", v10);
  return v5;
}

+ (void)proxAuthenticationForContext:(id)a3 viewController:(id)a4 withCompletion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BE1A4A0];
  v10 = a5;
  if (objc_msgSend(v9, "isCDPRepairWithProximityBasedPiggybackingEnabled"))
  {
    objc_msgSend(a1, "_authContextForContext:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0AE28]), "initWithContext:", v11);
    objc_msgSend(v12, "setAuthenticationType:", 0);
    objc_msgSend(v12, "setIsUsernameEditable:", 0);
    objc_msgSend(v12, "setServiceType:", 1);
    objc_msgSend(v12, "setSupportsPiggybacking:", 1);
    objc_msgSend(v12, "setPiggybackingForTrustedDevice:", 1);
    objc_msgSend(v12, "setPresentingViewController:", v8);
    objc_msgSend(a1, "_authWithContext:completion:", v12, v10);

    v10 = v12;
  }
  else
  {
    _CDPStateError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v11);
  }

}

@end
