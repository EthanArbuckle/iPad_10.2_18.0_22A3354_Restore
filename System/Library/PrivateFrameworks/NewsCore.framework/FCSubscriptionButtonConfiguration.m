@implementation FCSubscriptionButtonConfiguration

- (FCSubscriptionButtonConfiguration)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCSubscriptionButtonConfiguration init]";
    v9 = 2080;
    v10 = "FCSubscriptionButtonConfiguration.m";
    v11 = 1024;
    v12 = 35;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCSubscriptionButtonConfiguration init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCSubscriptionButtonConfiguration)initWithConfigDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  char v12;
  FCSubscriptionButtonConfiguration *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;

  v3 = a3;
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("subscriptionButtonType"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = FCSubscriptionButtonTypeWithValue(v22);
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("trialText"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("nonTrialText"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("buttonColor"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("buttonTextColor"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("targetType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = FCTargetTypeWithValue(v6);
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("postPurchaseActionType"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = FCPostPurchaseActionTypeWithValue(v8);
  FCAppConfigurationURLValue(v3, (uint64_t)CFSTR("postPurchaseURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("landingPageArticleID"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = FCAppConfigurationBoolValue(v3, (uint64_t)CFSTR("dismissLandingPagePostPurchase"), 0);

  LOBYTE(v15) = v12;
  v13 = -[FCSubscriptionButtonConfiguration initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:](self, "initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:", v19, v18, v17, v16, v5, v7, v9, v10, v11, v15);

  return v13;
}

- (FCSubscriptionButtonConfiguration)initWithSubscriptionButtonType:(unint64_t)a3 trialText:(id)a4 nonTrialText:(id)a5 buttonColor:(id)a6 buttonTextColor:(id)a7 targetType:(unint64_t)a8 postPurchaseActionType:(unint64_t)a9 postPurchaseURL:(id)a10 landingPageArticleID:(id)a11 dismissLandingPagePostPurchase:(BOOL)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FCSubscriptionButtonConfiguration *v22;
  FCSubscriptionButtonConfiguration *v23;
  uint64_t v24;
  NSString *trialText;
  uint64_t v26;
  NSString *nonTrialText;
  uint64_t v28;
  NSURL *postPurchaseURL;
  uint64_t v30;
  NSString *landingPageArticleID;
  id v34;
  objc_super v35;

  v17 = a4;
  v18 = a5;
  v34 = a6;
  v19 = a7;
  v20 = a10;
  v21 = a11;
  v35.receiver = self;
  v35.super_class = (Class)FCSubscriptionButtonConfiguration;
  v22 = -[FCSubscriptionButtonConfiguration init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_subscriptionButtonType = a3;
    v24 = objc_msgSend(v17, "copy");
    trialText = v23->_trialText;
    v23->_trialText = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    nonTrialText = v23->_nonTrialText;
    v23->_nonTrialText = (NSString *)v26;

    objc_storeStrong((id *)&v23->_buttonColor, a6);
    objc_storeStrong((id *)&v23->_buttonTextColor, a7);
    v23->_targetType = a8;
    v23->_postPurchaseActionType = a9;
    v28 = objc_msgSend(v20, "copy");
    postPurchaseURL = v23->_postPurchaseURL;
    v23->_postPurchaseURL = (NSURL *)v28;

    v30 = objc_msgSend(v21, "copy");
    landingPageArticleID = v23->_landingPageArticleID;
    v23->_landingPageArticleID = (NSString *)v30;

    v23->_dismissLandingPagePostPurchase = a12;
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  char v11;
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

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6
    && (v7 = -[FCSubscriptionButtonConfiguration subscriptionButtonType](self, "subscriptionButtonType"),
        v7 == objc_msgSend(v6, "subscriptionButtonType"))
    && (v8 = -[FCSubscriptionButtonConfiguration targetType](self, "targetType"), v8 == objc_msgSend(v6, "targetType"))
    && (v9 = -[FCSubscriptionButtonConfiguration postPurchaseActionType](self, "postPurchaseActionType"),
        v9 == objc_msgSend(v6, "postPurchaseActionType"))
    && (v10 = -[FCSubscriptionButtonConfiguration shouldDismissLandingPagePostPurchase](self, "shouldDismissLandingPagePostPurchase"), v10 == objc_msgSend(v6, "shouldDismissLandingPagePostPurchase")))
  {
    v13 = (void *)MEMORY[0x1E0DE7910];
    -[FCSubscriptionButtonConfiguration trialText](self, "trialText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trialText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15))
    {
      v16 = (void *)MEMORY[0x1E0DE7910];
      -[FCSubscriptionButtonConfiguration nonTrialText](self, "nonTrialText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nonTrialText");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "nf_object:isEqualToObject:", v17, v18))
      {
        v19 = (void *)MEMORY[0x1E0DE7910];
        -[FCSubscriptionButtonConfiguration postPurchaseURL](self, "postPurchaseURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "postPurchaseURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "nf_object:isEqualToObject:", v20, v21))
        {
          v24 = (void *)MEMORY[0x1E0DE7910];
          -[FCSubscriptionButtonConfiguration landingPageArticleID](self, "landingPageArticleID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "landingPageArticleID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v24, "nf_object:isEqualToObject:", v22, v23);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCSubscriptionButtonConfiguration subscriptionButtonType](self, "subscriptionButtonType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCSubscriptionButtonConfiguration targetType](self, "targetType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCSubscriptionButtonConfiguration postPurchaseActionType](self, "postPurchaseActionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCSubscriptionButtonConfiguration shouldDismissLandingPagePostPurchase](self, "shouldDismissLandingPagePostPurchase"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[FCSubscriptionButtonConfiguration trialText](self, "trialText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[FCSubscriptionButtonConfiguration nonTrialText](self, "nonTrialText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[FCSubscriptionButtonConfiguration postPurchaseURL](self, "postPurchaseURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[FCSubscriptionButtonConfiguration landingPageArticleID](self, "landingPageArticleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10 ^ v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

+ (id)defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__FCSubscriptionButtonConfiguration_defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F83A0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F83A0, block);
    v7 = v11;
  }
  v8 = (id)_MergedGlobals_174;

  return v8;
}

void __104__FCSubscriptionButtonConfiguration_defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  FCSubscriptionButtonConfiguration *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText](FCSubscriptionButtonConfiguration, "defaultSubscriptionButtonText");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText](FCSubscriptionButtonConfiguration, "defaultSubscriptionButtonText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [FCSubscriptionButtonConfiguration alloc];
  +[FCColor whiteColor](FCColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor blackColor](FCColor, "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 1;
  v6 = -[FCSubscriptionButtonConfiguration initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:](v3, "initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:", 0, v9, v2, v4, v5, 1, 0, 0, *(_QWORD *)(a1 + 32), v8);
  v7 = (void *)_MergedGlobals_174;
  _MergedGlobals_174 = v6;

}

+ (id)defaultOsloSheetTargetSubscriptionButton
{
  if (qword_1ED0F83B0 != -1)
    dispatch_once(&qword_1ED0F83B0, &__block_literal_global_94);
  return (id)qword_1ED0F83A8;
}

void __77__FCSubscriptionButtonConfiguration_defaultOsloSheetTargetSubscriptionButton__block_invoke()
{
  void *v0;
  FCSubscriptionButtonConfiguration *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText](FCSubscriptionButtonConfiguration, "defaultSubscriptionButtonText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText](FCSubscriptionButtonConfiguration, "defaultSubscriptionButtonText");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = [FCSubscriptionButtonConfiguration alloc];
  +[FCColor whiteColor](FCColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor blackColor](FCColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 1;
  v4 = -[FCSubscriptionButtonConfiguration initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:](v1, "initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:", 0, v7, v0, v2, v3, 2, 0, 0, 0, v6);
  v5 = (void *)qword_1ED0F83A8;
  qword_1ED0F83A8 = v4;

}

+ (id)defaultAmsSheetTargetSubscriptionButton
{
  if (qword_1ED0F83C0 != -1)
    dispatch_once(&qword_1ED0F83C0, &__block_literal_global_46_3);
  return (id)qword_1ED0F83B8;
}

void __76__FCSubscriptionButtonConfiguration_defaultAmsSheetTargetSubscriptionButton__block_invoke()
{
  void *v0;
  FCSubscriptionButtonConfiguration *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText](FCSubscriptionButtonConfiguration, "defaultSubscriptionButtonText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultSubscriptionButtonText](FCSubscriptionButtonConfiguration, "defaultSubscriptionButtonText");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = [FCSubscriptionButtonConfiguration alloc];
  +[FCColor whiteColor](FCColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor blackColor](FCColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 1;
  v4 = -[FCSubscriptionButtonConfiguration initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:](v1, "initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:", 0, v7, v0, v2, v3, 3, 0, 0, 0, v6);
  v5 = (void *)qword_1ED0F83B8;
  qword_1ED0F83B8 = v4;

}

+ (id)defaultArticleSubscriptionButtonWithLandingPageArticleID:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__FCSubscriptionButtonConfiguration_defaultArticleSubscriptionButtonWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F83D0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F83D0, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F83C8;

  return v8;
}

void __94__FCSubscriptionButtonConfiguration_defaultArticleSubscriptionButtonWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v1;
  FCSubscriptionButtonConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v1 = *(id *)(a1 + 32);
  v2 = [FCSubscriptionButtonConfiguration alloc];
  +[FCSubscriptionButtonConfiguration defaultTrialText](FCSubscriptionButtonConfiguration, "defaultTrialText");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultNonTrialText](FCSubscriptionButtonConfiguration, "defaultNonTrialText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor blackColor](FCColor, "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 1;
  v6 = -[FCSubscriptionButtonConfiguration initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:](v2, "initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:", 1, v9, v3, v4, v5, 1, 0, 0, v1, v8);
  v7 = (void *)qword_1ED0F83C8;
  qword_1ED0F83C8 = v6;

}

+ (id)defaultLandingPageSubscriptionButtonWithLandingPageArticleID:(id)a3
{
  if (qword_1ED0F83E0 != -1)
    dispatch_once(&qword_1ED0F83E0, &__block_literal_global_47_4);
  return (id)qword_1ED0F83D8;
}

void __98__FCSubscriptionButtonConfiguration_defaultLandingPageSubscriptionButtonWithLandingPageArticleID___block_invoke()
{
  FCSubscriptionButtonConfiguration *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = [FCSubscriptionButtonConfiguration alloc];
  +[FCSubscriptionButtonConfiguration defaultTrialText](FCSubscriptionButtonConfiguration, "defaultTrialText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultNonTrialText](FCSubscriptionButtonConfiguration, "defaultNonTrialText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor blackColor](FCColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 1;
  v4 = -[FCSubscriptionButtonConfiguration initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:](v0, "initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:", 2, v7, v1, v2, v3, 2, 0, 0, 0, v6);
  v5 = (void *)qword_1ED0F83D8;
  qword_1ED0F83D8 = v4;

}

+ (id)defaultIssueCoverSubscriptionButtonWithLandingPageArticleID:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__FCSubscriptionButtonConfiguration_defaultIssueCoverSubscriptionButtonWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F83F0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F83F0, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F83E8;

  return v8;
}

void __97__FCSubscriptionButtonConfiguration_defaultIssueCoverSubscriptionButtonWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  id v1;
  FCSubscriptionButtonConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v1 = *(id *)(a1 + 32);
  v2 = [FCSubscriptionButtonConfiguration alloc];
  +[FCSubscriptionButtonConfiguration defaultTrialText](FCSubscriptionButtonConfiguration, "defaultTrialText");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultNonTrialText](FCSubscriptionButtonConfiguration, "defaultNonTrialText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor blackColor](FCColor, "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 1;
  v6 = -[FCSubscriptionButtonConfiguration initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:](v2, "initWithSubscriptionButtonType:trialText:nonTrialText:buttonColor:buttonTextColor:targetType:postPurchaseActionType:postPurchaseURL:landingPageArticleID:dismissLandingPagePostPurchase:", 3, v9, v3, v4, v5, 1, 0, 0, v1, v8);
  v7 = (void *)qword_1ED0F83E8;
  qword_1ED0F83E8 = v6;

}

+ (id)defaultSubscriptionButtonText
{
  if (qword_1ED0F8400 != -1)
    dispatch_once(&qword_1ED0F8400, &__block_literal_global_48_2);
  return (id)qword_1ED0F83F8;
}

void __66__FCSubscriptionButtonConfiguration_defaultSubscriptionButtonText__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  FCBundle();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GET STARTED"), &stru_1E464BC40, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F83F8;
  qword_1ED0F83F8 = v0;

}

+ (id)defaultTrialText
{
  if (qword_1ED0F8410 != -1)
    dispatch_once(&qword_1ED0F8410, &__block_literal_global_53_0);
  return (id)qword_1ED0F8408;
}

void __53__FCSubscriptionButtonConfiguration_defaultTrialText__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  FCBundle();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TRY IT FREE"), &stru_1E464BC40, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8408;
  qword_1ED0F8408 = v0;

}

+ (id)defaultNonTrialText
{
  if (qword_1ED0F8420 != -1)
    dispatch_once(&qword_1ED0F8420, &__block_literal_global_56);
  return (id)qword_1ED0F8418;
}

void __56__FCSubscriptionButtonConfiguration_defaultNonTrialText__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  FCBundle();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("START READING"), &stru_1E464BC40, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8418;
  qword_1ED0F8418 = v0;

}

- (unint64_t)subscriptionButtonType
{
  return self->_subscriptionButtonType;
}

- (void)setSubscriptionButtonType:(unint64_t)a3
{
  self->_subscriptionButtonType = a3;
}

- (NSString)trialText
{
  return self->_trialText;
}

- (void)setTrialText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)nonTrialText
{
  return self->_nonTrialText;
}

- (void)setNonTrialText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)targetType
{
  return self->_targetType;
}

- (void)setTargetType:(unint64_t)a3
{
  self->_targetType = a3;
}

- (unint64_t)postPurchaseActionType
{
  return self->_postPurchaseActionType;
}

- (void)setPostPurchaseActionType:(unint64_t)a3
{
  self->_postPurchaseActionType = a3;
}

- (NSURL)postPurchaseURL
{
  return self->_postPurchaseURL;
}

- (void)setPostPurchaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)landingPageArticleID
{
  return self->_landingPageArticleID;
}

- (void)setLandingPageArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (FCColor)buttonColor
{
  return self->_buttonColor;
}

- (void)setButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonColor, a3);
}

- (FCColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (void)setButtonTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTextColor, a3);
}

- (BOOL)shouldDismissLandingPagePostPurchase
{
  return self->_dismissLandingPagePostPurchase;
}

- (void)setDismissLandingPagePostPurchase:(BOOL)a3
{
  self->_dismissLandingPagePostPurchase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_buttonColor, 0);
  objc_storeStrong((id *)&self->_landingPageArticleID, 0);
  objc_storeStrong((id *)&self->_postPurchaseURL, 0);
  objc_storeStrong((id *)&self->_nonTrialText, 0);
  objc_storeStrong((id *)&self->_trialText, 0);
}

@end
