@implementation AKAppleIDAuthenticationController(TrustedContacts)

- (void)aaui_authenticateAccount:()TrustedContacts forceInteraction:presentingViewController:completion:
{
  id v10;
  id v11;

  v10 = a6;
  objc_msgSend(a1, "_authContextForAccount:forceInteraction:presentingViewController:", a3, a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "authenticateWithContext:completion:", v11, v10);

}

- (void)aaui_custodianAuthForAccount:()TrustedContacts presentingViewController:completion:
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a1, "_authContextForAccount:forceInteraction:verifyCredentialReason:presentingViewController:", a3, 1, 2, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "authenticateWithContext:completion:", v9, v8);

}

- (void)aaui_beneficiaryAuthForAccount:()TrustedContacts presentingViewController:completion:
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a1, "_authContextForAccount:forceInteraction:verifyCredentialReason:presentingViewController:", a3, 1, 1, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "authenticateWithContext:completion:", v9, v8);

}

- (void)aaui_beneficiaryViewAccessKeyForAccount:()TrustedContacts presentingViewController:completion:
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a1, "_authContextForAccount:forceInteraction:verifyCredentialReason:presentingViewController:", a3, 1, 4, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "authenticateWithContext:completion:", v9, v8);

}

- (id)_authContextForAccount:()TrustedContacts forceInteraction:presentingViewController:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (objc_class *)MEMORY[0x1E0D002F8];
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v9, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUsername:", v11);

  objc_msgSend(v9, "aa_altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAltDSID:", v12);
  objc_msgSend(v10, "setIsUsernameEditable:", 0);
  objc_msgSend(v10, "setServiceType:", 1);
  objc_msgSend(v10, "setPresentingViewController:", v8);

  if (a4)
    objc_msgSend(v10, "setAuthenticationType:", 2);
  return v10;
}

- (id)_authContextForAccount:()TrustedContacts forceInteraction:verifyCredentialReason:presentingViewController:
{
  void *v7;

  objc_msgSend(a1, "_authContextForAccount:forceInteraction:presentingViewController:", a3, a4, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVerifyCredentialReason:", a5);
  return v7;
}

@end
