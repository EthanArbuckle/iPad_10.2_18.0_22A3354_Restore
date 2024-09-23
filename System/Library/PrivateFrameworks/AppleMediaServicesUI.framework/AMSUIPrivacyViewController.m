@implementation AMSUIPrivacyViewController

+ (id)privacyControllerWithIdentifier:(id)a3 acknowledgementHandler:(id)a4
{
  id v6;
  Class (__cdecl *v7)();
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AMSUIPrivacyIconViewController *v13;
  void *v14;
  AMSUIPrivacyIconViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v6 = a4;
  if (a3)
  {
    v7 = (Class (__cdecl *)())getOBBundleClass;
    v8 = a3;
    -[objc_class bundleWithIdentifier:](v7(), "bundleWithIdentifier:", v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "privacyFlow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedButtonCaption");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [AMSUIPrivacyIconViewController alloc];
    objc_msgSend(v9, "buttonIcon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AMSUIPrivacyIconViewController initWithImage:](v13, "initWithImage:", v14);
    objc_msgSend(v12, "_setHeaderContentViewController:", v15);

    v16 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AMSUILocalizedStringFromBundle(CFSTR("PRIVACY_VIEW_CONTROLLER_CONTINUE"), 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __85__AMSUIPrivacyViewController_privacyControllerWithIdentifier_acknowledgementHandler___block_invoke;
    v32[3] = &unk_24CB50868;
    v20 = v6;
    v21 = v6;
    v33 = v21;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    AMSUILocalizedStringFromBundle(CFSTR("PRIVACY_VIEW_CONTROLLER_LEARN_MORE"), 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v19;
    v30[1] = 3221225472;
    v30[2] = __85__AMSUIPrivacyViewController_privacyControllerWithIdentifier_acknowledgementHandler___block_invoke_2;
    v30[3] = &unk_24CB50868;
    v26 = v21;
    v6 = v20;
    v31 = v26;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addAction:", v22);
    objc_msgSend(v12, "addAction:", v27);
    objc_msgSend(v12, "setPreferredAction:", v22);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __85__AMSUIPrivacyViewController_privacyControllerWithIdentifier_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __85__AMSUIPrivacyViewController_privacyControllerWithIdentifier_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

@end
