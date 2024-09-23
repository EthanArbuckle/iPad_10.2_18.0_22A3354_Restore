@implementation AMSUIAgeVerificationCore

+ (id)_promiseResultForCancelWithVerificationResult:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BE08348];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_msgSend(v4, "requiredType");

  if (v6 == 3)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE08008]);
    objc_msgSend(v7, "setSuccessType:", 3);
    objc_msgSend(v5, "setResult:", v7);
  }
  else
  {
    AMSError();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setError:", v7);
  }

  return v5;
}

+ (id)_messageForResult:(id)a3 withBag:(id)a4 expiration:(id)a5 dateFormatter:(id)a6 bundle:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a4;
  if (objc_msgSend(a3, "requiredType") == 3)
  {
    objc_msgSend(v12, "stringFromDate:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    AMSUILocalizedStringFromBundle(CFSTR("AGE_VERIFICATION_SOON_DIALOG_MESSAGE"), v14, v13);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "stringWithFormat:", v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)v18;
    v14 = (id)v15;
  }
  else
  {
    v20 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    AMSUILocalizedStringFromBundle(CFSTR("AGE_VERIFICATION_DIALOG_MESSAGE"), v14, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

+ (id)_titleForResult:(id)a3 withBag:(id)a4 bundle:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  __CFString *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = objc_msgSend(a3, "requiredType");
  v10 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  if (v9 == 3)
    v11 = CFSTR("AGE_VERIFICATION_SOON_DIALOG_TITLE");
  else
    v11 = CFSTR("AGE_VERIFICATION_DIALOG_TITLE");
  AMSUILocalizedStringFromBundle(v11, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_timestampOfExpiryFrom:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(objc_msgSend(v3, "longLongValue") / 1000));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
