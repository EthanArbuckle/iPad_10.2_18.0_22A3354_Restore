@implementation LACUIAuthenticatorServiceConfiguration(LACustomPasswordControllerConfiguration)

- (id)initWithCustomPasswordConfiguration:()LACustomPasswordControllerConfiguration context:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  objc_msgSend(a4, "externalizedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(a1, "initWithContext:requirement:", v7, 3);

  objc_msgSend(v6, "cancelButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCancelButtonTitle:", v9);

  objc_msgSend(v8, "setPasscodeLength:", objc_msgSend(v6, "passwordType"));
  objc_msgSend(v6, "prompt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrompt:", v10);

  objc_msgSend(v6, "verifyPrompt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVerifyPrompt:", v11);

  v12 = objc_msgSend(v6, "mode");
  if (v12 <= 1)
    objc_msgSend(v8, "setMode:", v12);
  objc_msgSend(v6, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "rawValue");

  if (!v14)
  {
    v15 = 0;
    goto LABEL_7;
  }
  if (v14 == 1)
  {
    v15 = 1;
LABEL_7:
    objc_msgSend(v8, "setStyle:", v14);
    objc_msgSend(v8, "setHeaderHidden:", v15);
  }

  return v8;
}

@end
