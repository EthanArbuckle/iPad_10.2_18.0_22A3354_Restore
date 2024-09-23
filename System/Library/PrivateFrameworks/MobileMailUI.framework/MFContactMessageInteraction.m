@implementation MFContactMessageInteraction

- (MFContactMessageInteraction)init
{
  MFContactMessageInteraction *v2;
  MFContactMessageInteraction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFContactMessageInteraction;
  v2 = -[MFContactMessageInteraction init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MFContactMessageInteraction addNotificationObservers](v2, "addNotificationObservers");
  return v3;
}

- (void)addNotificationObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleTrustDidChange, *MEMORY[0x1E0D4D480], 0);

}

- (MFSecureMIMEPersonHeaderView)headerView
{
  id v3;
  void *v4;

  if (-[MFContactMessageInteraction shouldShowContactHeader](self, "shouldShowContactHeader"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CC6900]);
    v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[MFContactMessageInteraction _configureSecureMIMEPersonHeaderView:](self, "_configureSecureMIMEPersonHeaderView:", v4);
  }
  else
  {
    v4 = 0;
  }
  return (MFSecureMIMEPersonHeaderView *)v4;
}

- (UIViewController)presentingViewController
{
  void *v3;
  void *v4;

  -[MFContactMessageInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "presentingViewControllerForMessageInteraction:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (UIViewController *)v4;
}

- (BOOL)shouldShowContactHeader
{
  MFContactMessageInteraction *v2;
  void *v3;
  char v4;
  void *v5;

  v2 = self;
  -[MFContactMessageInteraction securityInformation](self, "securityInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSigned");

  -[MFContactMessageInteraction securityInformation](v2, "securityInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "isEncrypted");

  return v4 | v2;
}

- (void)updateWithSecurityInformation:(id)a3
{
  id v4;

  v4 = a3;
  -[MFContactMessageInteraction setSecurityInformation:](self, "setSecurityInformation:");
  -[MFContactMessageInteraction _updateHeaderView](self, "_updateHeaderView");

}

- (void)_configureSecureMIMEPersonHeaderView:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char **v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  char v46;
  int v47;
  void *v48;
  void *v49;
  id v50;

  v50 = a3;
  if (-[MFContactMessageInteraction shouldShowContactHeader](self, "shouldShowContactHeader"))
  {
    -[MFContactMessageInteraction securityInformation](self, "securityInformation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "smimeError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isSigned");
    v7 = objc_msgSend(v4, "isEncrypted");
    if (!v5)
    {
      v11 = v7;
      if (v6)
      {
        objc_msgSend(v4, "signers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v11;
        objc_msgSend(v12, "firstObject");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          v14 = objc_alloc(MEMORY[0x1E0D4D548]);
          objc_msgSend(v48, "signingCertificateTrustInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithTrustInformation:", v15);

          v45 = v16;
          if ((objc_msgSend(v16, "action") | 2) == 2)
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("UNTRUSTED_SIGNATURE"), &stru_1E9A04480, CFSTR("Main"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = (void *)MEMORY[0x1E0CB3940];
            MFLookupLocalizedString();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "signingCertificateTrustInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "sender");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", v20, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v46 = 1;
          }
          else
          {
            v18 = 0;
            v23 = 0;
            v46 = 0;
          }
          if (objc_msgSend(v48, "hasSeparateSigningAndEncryptionCertificates"))
          {
            objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("VIEW_SIGNING_CERTIFICATE"), &stru_1E9A04480, CFSTR("Main"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setTitle:forState:", v30, 0);

            objc_msgSend(v28, "addTarget:action:forControlEvents:", self, sel__viewSigningCertificateButtonTapped_, 64);
            objc_msgSend(v13, "addObject:", v28);
            objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("VIEW_ENCRYPTION_CERTIFICATE"), &stru_1E9A04480, CFSTR("Main"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setTitle:forState:", v33, 0);

            objc_msgSend(v31, "addTarget:action:forControlEvents:", self, sel__viewEncryptionCertificateButtonTapped_, 64);
            objc_msgSend(v13, "addObject:", v31);

          }
          else
          {
            objc_msgSend(v48, "encryptionCertificateTrustInfo");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = &selRef__viewEncryptionCertificateButtonTapped_;
            if (!v34)
              v35 = &selRef__viewSigningCertificateButtonTapped_;
            v36 = *v35;

            objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("VIEW_CERTIFICATE"), &stru_1E9A04480, CFSTR("Main"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setTitle:forState:", v38, 0);

            objc_msgSend(v28, "addTarget:action:forControlEvents:", self, v36, 64);
            objc_msgSend(v13, "addObject:", v28);
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SIGNATURE_ERROR"), &stru_1E9A04480, CFSTR("Main"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          MFLookupLocalizedString();
          v46 = 1;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (v47)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("ENCRYPTED"), &stru_1E9A04480, CFSTR("Main"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v25 = 0;
        }
        if ((v46 & 1) != 0)
        {
          v24 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("SIGNED"), &stru_1E9A04480, CFSTR("Main"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if (v47)
            v43 = CFSTR("SIGNED_AND_ENCRYPTED_DESCRIPTION");
          else
            v43 = CFSTR("SIGNED_DESCRIPTION");
          objc_msgSend(v41, "localizedStringForKey:value:table:", v43, &stru_1E9A04480, CFSTR("Main"));
          v44 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v44;
        }

      }
      else if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("ENCRYPTED"), &stru_1E9A04480, CFSTR("Main"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("ENCRYPTED_DESCRIPTION"), &stru_1E9A04480, CFSTR("Main"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v18 = 0;
        v13 = 0;

      }
      else
      {
        v24 = 0;
        v25 = 0;
        v18 = 0;
        v23 = 0;
        v13 = 0;
      }
      goto LABEL_35;
    }
    v8 = objc_msgSend(v5, "code");
    if (v8 == 1035)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DECRYPTION_ERROR"), &stru_1E9A04480, CFSTR("Main"));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8 != 1036)
      {
        v18 = 0;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SIGNATURE_ERROR"), &stru_1E9A04480, CFSTR("Main"));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v10;

LABEL_13:
    v24 = 0;
    objc_msgSend(v5, "localizedDescription");
    v25 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
LABEL_35:
    objc_msgSend(v50, "setSignedLabelText:", v24);
    objc_msgSend(v50, "setSecureLabelText:", v25);
    objc_msgSend(v50, "setWarningLabelText:", v18);
    objc_msgSend(v50, "setExplanationText:", v23);
    objc_msgSend(v50, "setButtons:", v13);

  }
  objc_msgSend(v50, "invalidateIntrinsicContentSize");

}

- (void)_viewSigningCertificateButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MFContactMessageInteraction securityInformation](self, "securityInformation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signingCertificateTrustInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D548]), "initWithTrustInformation:", v8);
  -[MFContactMessageInteraction setCertificateKeychainManager:](self, "setCertificateKeychainManager:", v7);

  -[MFContactMessageInteraction _presentCertificateTrustInfo:](self, "_presentCertificateTrustInfo:", v8);
}

- (void)_viewEncryptionCertificateButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MFContactMessageInteraction securityInformation](self, "securityInformation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encryptionCertificateTrustInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D548]), "initWithTrustInformation:", v8);
  -[MFContactMessageInteraction setCertificateKeychainManager:](self, "setCertificateKeychainManager:", v7);

  -[MFContactMessageInteraction _presentCertificateTrustInfo:](self, "_presentCertificateTrustInfo:", v8);
}

- (void)_presentCertificateTrustInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "action");

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D578]), "initWithTrust:action:", objc_msgSend(v21, "trust"), v5);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CERTIFICATE"), &stru_1E9A04480, CFSTR("Main"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1E9A04480, CFSTR("Main"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 2, self, sel__certificateControllerDidFinish);
  objc_msgSend(v6, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

  -[MFContactMessageInteraction setCertificateViewController:certificateTrustInfo:](self, "setCertificateViewController:certificateTrustInfo:", v6, v21);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  -[MFContactMessageInteraction presentingViewController](self, "presentingViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentedViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v15, "presentedViewController");
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v17;
    objc_msgSend(v14, "setModalPresentationStyle:", 3);
  }
  else
  {
    objc_msgSend(v15, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topViewController");
    v20 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v20;
  }
  objc_msgSend(v18, "presentViewController:animated:completion:", v14, 1, 0);

}

- (void)setCertificateViewController:(id)a3 certificateTrustInfo:(id)a4
{
  id v7;
  CertificateViewController *v8;

  v8 = (CertificateViewController *)a3;
  v7 = a4;
  if (self->_certificateViewController != v8)
  {
    objc_storeStrong((id *)&self->_certificateViewController, a3);
    objc_storeStrong((id *)&self->_certificateTrustInfo, a4);
    -[MFContactMessageInteraction updateCertificateAction](self, "updateCertificateAction");
  }

}

- (void)_certificateControllerDidFinish
{
  CertificateViewController *certificateViewController;
  void *v4;
  CertificateViewController *v5;
  EMCertificateTrustInformation *certificateTrustInfo;

  certificateViewController = self->_certificateViewController;
  if (certificateViewController)
  {
    -[CertificateViewController presentingViewController](certificateViewController, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    v5 = self->_certificateViewController;
    self->_certificateViewController = 0;

    certificateTrustInfo = self->_certificateTrustInfo;
    self->_certificateTrustInfo = 0;

  }
}

- (void)updateCertificateAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  BOOL v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;

  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keychainStatus");

  -[MFContactMessageInteraction securityInformation](self, "securityInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "smimeError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "action");

  v9 = -[EMCertificateTrustInformation certificateType](self->_certificateTrustInfo, "certificateType");
  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canSaveCertificateToKeychain");

  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "action");
  -[MFContactMessageInteraction certificateViewController](self, "certificateViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCertUIAction:", v13);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v9 == 1)
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ENCRYPTION_CERTIFICATE_DESCRIPTION"), &stru_1E9A04480, CFSTR("Main"));
  else
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SIGNING_CERTIFICATE_DESCRIPTION"), &stru_1E9A04480, CFSTR("Main"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 1)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    -[MFContactMessageInteraction certificateViewController](self, "certificateViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_1E9A04480, CFSTR("Main"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __54__MFContactMessageInteraction_updateCertificateAction__block_invoke;
    v35[3] = &unk_1E9A02B00;
    v21 = &v36;
    objc_copyWeak(&v36, &location);
    objc_msgSend(v18, "setShowCertificateButton:localizedTitle:localizedDescription:destructive:handler:", 1, v20, v17, 1, v35);
  }
  else
  {
    if (v6)
      v22 = 0;
    else
      v22 = v8 == 1;
    v23 = !v22;
    if (v11)
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      if (v23)
      {
        objc_initWeak(&location, self);
        -[MFContactMessageInteraction certificateViewController](self, "certificateViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("INSTALL"), &stru_1E9A04480, CFSTR("Main"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_2;
        v33[3] = &unk_1E9A02B00;
        v21 = &v34;
        objc_copyWeak(&v34, &location);
        objc_msgSend(v18, "setShowCertificateButton:localizedTitle:localizedDescription:destructive:handler:", 1, v20, v17, 0, v33);
      }
      else
      {
        objc_initWeak(&location, self);
        -[MFContactMessageInteraction certificateViewController](self, "certificateViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("INSTALL"), &stru_1E9A04480, CFSTR("Main"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_3;
        v31[3] = &unk_1E9A02B00;
        v21 = &v32;
        objc_copyWeak(&v32, &location);
        objc_msgSend(v18, "setShowCertificateButton:localizedTitle:localizedDescription:destructive:handler:", 1, v20, v17, 0, v31);
      }
    }
    else if (v23)
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      -[MFContactMessageInteraction certificateViewController](self, "certificateViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("TRUST"), &stru_1E9A04480, CFSTR("Main"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_4;
      v29[3] = &unk_1E9A02B00;
      v21 = &v30;
      objc_copyWeak(&v30, &location);
      objc_msgSend(v18, "setShowCertificateButton:localizedTitle:localizedDescription:destructive:handler:", 1, v20, v17, 0, v29);
    }
    else
    {
      -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "hasTrustException");

      if (!v25)
      {
        -[MFContactMessageInteraction certificateViewController](self, "certificateViewController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setShowCertificateButton:localizedTitle:localizedDescription:destructive:handler:", 0, 0, 0, 0, 0);

        goto LABEL_7;
      }
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      -[MFContactMessageInteraction certificateViewController](self, "certificateViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("UNTRUST"), &stru_1E9A04480, CFSTR("Main"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_5;
      v27[3] = &unk_1E9A02B00;
      v21 = &v28;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v18, "setShowCertificateButton:localizedTitle:localizedDescription:destructive:handler:", 1, v20, v17, 1, v27);
    }
  }

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
LABEL_7:

}

void __54__MFContactMessageInteraction_updateCertificateAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performCertificateActionRemove");

}

void __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performCertificateActionTrustAndInstall");

}

void __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performCertificateActionInstall");

}

void __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performCertificateActionTrust");

}

void __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performCertificateActionUntrust");

}

- (void)performCertificateActionRemove
{
  void *v3;
  void *v4;

  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTrustException");

  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeCertificateFromKeychain");

  -[MFContactMessageInteraction updateCertificateAction](self, "updateCertificateAction");
  -[MFContactMessageInteraction refreshCertificateViewControllerStatus](self, "refreshCertificateViewControllerStatus");
}

- (void)performCertificateActionTrustAndInstall
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__MFContactMessageInteraction_performCertificateActionTrustAndInstall__block_invoke;
  v2[3] = &unk_1E9A02D88;
  v2[4] = self;
  -[MFContactMessageInteraction promptOrInstallCertificationWithBlock:](self, "promptOrInstallCertificationWithBlock:", v2);
}

uint64_t __70__MFContactMessageInteraction_performCertificateActionTrustAndInstall__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "installCertificateWithTrustException:", 1);
}

- (void)performCertificateActionInstall
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__MFContactMessageInteraction_performCertificateActionInstall__block_invoke;
  v2[3] = &unk_1E9A02D88;
  v2[4] = self;
  -[MFContactMessageInteraction promptOrInstallCertificationWithBlock:](self, "promptOrInstallCertificationWithBlock:", v2);
}

uint64_t __62__MFContactMessageInteraction_performCertificateActionInstall__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "installCertificateWithTrustException:", 0);
}

- (void)performCertificateActionTrust
{
  void *v3;

  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTrustException");

  -[MFContactMessageInteraction updateCertificateAction](self, "updateCertificateAction");
  -[MFContactMessageInteraction refreshCertificateViewControllerStatus](self, "refreshCertificateViewControllerStatus");
}

- (void)performCertificateActionUntrust
{
  void *v3;

  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTrustException");

  -[MFContactMessageInteraction updateCertificateAction](self, "updateCertificateAction");
  -[MFContactMessageInteraction refreshCertificateViewControllerStatus](self, "refreshCertificateViewControllerStatus");
}

- (void)installCertificateWithTrustException:(BOOL)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTrustException");

  }
  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveCertificateToKeychain");

  -[MFContactMessageInteraction updateCertificateAction](self, "updateCertificateAction");
  -[MFContactMessageInteraction refreshCertificateViewControllerStatus](self, "refreshCertificateViewControllerStatus");
}

- (void)_updateHeaderView
{
  void *v3;
  id v4;
  id v5;

  -[MFContactMessageInteraction headerView](self, "headerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFContactMessageInteraction _configureSecureMIMEPersonHeaderView:](self, "_configureSecureMIMEPersonHeaderView:");

  -[MFContactMessageInteraction delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MFContactMessageInteraction headerView](self, "headerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactMessageInteraction:didUpdateHeaderView:", self, v3);

  }
}

- (void)refreshCertificateViewControllerStatus
{
  void *v2;
  id v3;

  -[MFContactMessageInteraction certificateViewController](self, "certificateViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)promptOrInstallCertificationWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "keychainStatus");

  if (v5 == 2)
    -[MFContactMessageInteraction promptToReplaceCurrentCertificateWithBlock:](self, "promptToReplaceCurrentCertificateWithBlock:", v6);
  else
    v6[2]();

}

- (void)promptToReplaceCurrentCertificateWithBlock:(id)a3
{
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v23 = a3;
  -[MFContactMessageInteraction certificateKeychainManager](self, "certificateKeychainManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addressForSaving");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OVERWRITE_CERTIFICATE_DESCRIPTION_FORMAT"), &stru_1E9A04480, CFSTR("Main"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("INSTALL_CERTIFICATE"), &stru_1E9A04480, CFSTR("Main"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v11, v8, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("INSTALL"), &stru_1E9A04480, CFSTR("Main"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __74__MFContactMessageInteraction_promptToReplaceCurrentCertificateWithBlock___block_invoke;
  v24[3] = &unk_1E9A032B0;
  v16 = v23;
  v25 = v16;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A04480, CFSTR("Main"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v21);

  -[MFContactMessageInteraction certificateViewController](self, "certificateViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "presentViewController:animated:completion:", v12, 1, 0);

}

uint64_t __74__MFContactMessageInteraction_promptToReplaceCurrentCertificateWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (MFContactMessageInteractionDelegate)delegate
{
  return (MFContactMessageInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CertificateViewController)certificateViewController
{
  return self->_certificateViewController;
}

- (EMSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (void)setSecurityInformation:(id)a3
{
  objc_storeStrong((id *)&self->_securityInformation, a3);
}

- (MFCertificateTrustInformationKeychainManager)certificateKeychainManager
{
  return self->_certificateKeychainManager;
}

- (void)setCertificateKeychainManager:(id)a3
{
  objc_storeStrong((id *)&self->_certificateKeychainManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateKeychainManager, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
  objc_storeStrong((id *)&self->_certificateViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_certificateTrustInfo, 0);
}

@end
