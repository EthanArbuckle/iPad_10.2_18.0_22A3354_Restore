@implementation FCPaywallConfiguration

- (FCPaywallConfiguration)init
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
    v8 = "-[FCPaywallConfiguration init]";
    v9 = 2080;
    v10 = "FCPaywallConfiguration.m";
    v11 = 1024;
    v12 = 40;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPaywallConfiguration init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPaywallConfiguration)initWithConfigDictionary:(id)a3
{
  id v3;
  FCPaywallTopOffsetConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v13;
  FCPaywallVisualSpecConfiguration *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  FCSubscriptionButtonConfiguration *v19;
  void *v20;
  FCPaywallConfiguration *v22;
  void *v23;
  void *v24;

  v3 = a3;
  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("subscriptionButton"), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FCSubscriptionButtonConfiguration initWithConfigDictionary:]([FCSubscriptionButtonConfiguration alloc], "initWithConfigDictionary:", v24);
  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("visualSpecification"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FCPaywallVisualSpecConfiguration initWithConfigDictionary:]([FCPaywallVisualSpecConfiguration alloc], "initWithConfigDictionary:", v23);
  v4 = -[FCPaywallTopOffsetConfiguration initWithConfigDictionary:]([FCPaywallTopOffsetConfiguration alloc], "initWithConfigDictionary:", v3);
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("paywallType"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = FCPaywallTypeForValue(v20);
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("title"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("descriptionTrial"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("descriptionNonTrial"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("learnMoreTitle"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationURLValue(v3, (uint64_t)CFSTR("learnMoreURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("offersLinkTitle"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationURLValue(v3, (uint64_t)CFSTR("offersLinkURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("offersLinkTargetType"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = FCPaywallOffersLinkTargetTypeForValue(v9);
  v11 = FCAppConfigurationBoolValue(v3, (uint64_t)CFSTR("externalOverridesEnabled"), 0);

  LOBYTE(v13) = v11;
  v22 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](self, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", v18, v17, v16, v15, v5, v6, v7, v8, v10, v13, v19, v14, v4);

  return v22;
}

- (FCPaywallConfiguration)initWithPaywallType:(unint64_t)a3 title:(id)a4 descriptionTrial:(id)a5 descriptionNonTrial:(id)a6 learnMoreTitle:(id)a7 learnMoreURL:(id)a8 offersLinkTitle:(id)a9 offersLinkURL:(id)a10 offersLinkTargetType:(unint64_t)a11 externalOverridesEnabled:(BOOL)a12 subscriptionButtonConfig:(id)a13 visualSpecConfig:(id)a14 paywallTopOffsetConfig:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  FCPaywallConfiguration *v28;
  FCPaywallConfiguration *v29;
  uint64_t v30;
  NSString *title;
  uint64_t v32;
  NSString *descriptionTrial;
  uint64_t v34;
  NSString *descriptionNonTrial;
  uint64_t v36;
  NSString *learnMoreTitle;
  uint64_t v38;
  NSURL *learnMoreURL;
  uint64_t v40;
  NSString *offersLinkTitle;
  uint64_t v42;
  NSURL *offersLinkURL;
  id v47;
  id v48;
  objc_super v49;

  v19 = a4;
  v20 = a5;
  v48 = a6;
  v21 = a7;
  v22 = a8;
  v23 = v20;
  v24 = a9;
  v25 = a10;
  v47 = a13;
  v26 = a14;
  v27 = a15;
  v49.receiver = self;
  v49.super_class = (Class)FCPaywallConfiguration;
  v28 = -[FCPaywallConfiguration init](&v49, sel_init);
  v29 = v28;
  if (v28)
  {
    v28->_paywallType = a3;
    v30 = objc_msgSend(v19, "copy");
    title = v29->_title;
    v29->_title = (NSString *)v30;

    v32 = objc_msgSend(v23, "copy");
    descriptionTrial = v29->_descriptionTrial;
    v29->_descriptionTrial = (NSString *)v32;

    v34 = objc_msgSend(v48, "copy");
    descriptionNonTrial = v29->_descriptionNonTrial;
    v29->_descriptionNonTrial = (NSString *)v34;

    v36 = objc_msgSend(v21, "copy");
    learnMoreTitle = v29->_learnMoreTitle;
    v29->_learnMoreTitle = (NSString *)v36;

    v38 = objc_msgSend(v22, "copy");
    learnMoreURL = v29->_learnMoreURL;
    v29->_learnMoreURL = (NSURL *)v38;

    v40 = objc_msgSend(v24, "copy");
    offersLinkTitle = v29->_offersLinkTitle;
    v29->_offersLinkTitle = (NSString *)v40;

    v42 = objc_msgSend(v25, "copy");
    offersLinkURL = v29->_offersLinkURL;
    v29->_offersLinkURL = (NSURL *)v42;

    v29->_offersLinkTargetType = a11;
    v29->_externalOverridesEnabled = a12;
    objc_storeStrong((id *)&v29->_subscriptionButtonConfig, a13);
    objc_storeStrong((id *)&v29->_visualSpecConfig, a14);
    objc_storeStrong((id *)&v29->_paywallTopOffsetConfig, a15);
  }

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  char v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;

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

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DE7910];
    -[FCPaywallConfiguration title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E0DE7910];
      -[FCPaywallConfiguration descriptionTrial](self, "descriptionTrial");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "descriptionTrial");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
      {
        v13 = (void *)MEMORY[0x1E0DE7910];
        -[FCPaywallConfiguration descriptionNonTrial](self, "descriptionNonTrial");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "descriptionNonTrial");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15))
        {
          v43 = v14;
          v16 = (void *)MEMORY[0x1E0DE7910];
          -[FCPaywallConfiguration learnMoreTitle](self, "learnMoreTitle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "learnMoreTitle");
          v44 = objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "nf_object:isEqualToObject:", v17))
          {
            v40 = v17;
            v18 = (void *)MEMORY[0x1E0DE7910];
            -[FCPaywallConfiguration learnMoreURL](self, "learnMoreURL");
            v19 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "learnMoreURL");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)v19;
            if (objc_msgSend(v18, "nf_object:isEqualToObject:", v19))
            {
              v20 = (void *)MEMORY[0x1E0DE7910];
              -[FCPaywallConfiguration offersLinkTitle](self, "offersLinkTitle");
              v21 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "offersLinkTitle");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)v21;
              if (objc_msgSend(v20, "nf_object:isEqualToObject:", v21))
              {
                v22 = (void *)MEMORY[0x1E0DE7910];
                -[FCPaywallConfiguration offersLinkURL](self, "offersLinkURL");
                v23 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "offersLinkURL");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = (void *)v23;
                if (objc_msgSend(v22, "nf_object:isEqualToObject:", v23)
                  && (v24 = -[FCPaywallConfiguration offersLinkTargetType](self, "offersLinkTargetType"),
                      v24 == objc_msgSend(v6, "offersLinkTargetType"))
                  && (v25 = -[FCPaywallConfiguration paywallType](self, "paywallType"),
                      v25 == objc_msgSend(v6, "paywallType"))
                  && (v26 = -[FCPaywallConfiguration externalOverridesEnabled](self, "externalOverridesEnabled"),
                      v26 == objc_msgSend(v6, "externalOverridesEnabled")))
                {
                  v30 = (void *)MEMORY[0x1E0DE7910];
                  -[FCPaywallConfiguration subscriptionButtonConfig](self, "subscriptionButtonConfig");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "subscriptionButtonConfig");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v30, "nf_object:isEqualToObject:", v31))
                  {
                    v34 = (void *)MEMORY[0x1E0DE7910];
                    -[FCPaywallConfiguration visualSpecConfig](self, "visualSpecConfig");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "visualSpecConfig");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v34, "nf_object:isEqualToObject:", v32, v33);

                  }
                  else
                  {
                    v27 = 0;
                  }
                  v17 = v40;
                  v28 = (void *)v44;

                  v14 = v43;
                }
                else
                {
                  v27 = 0;
                  v17 = v40;
                  v14 = v43;
                  v28 = (void *)v44;
                }

              }
              else
              {
                v27 = 0;
                v17 = v40;
                v14 = v43;
                v28 = (void *)v44;
              }

            }
            else
            {
              v27 = 0;
              v17 = v40;
              v14 = v43;
              v28 = (void *)v44;
            }

          }
          else
          {
            v27 = 0;
            v14 = v43;
            v28 = (void *)v44;
          }

        }
        else
        {
          v27 = 0;
        }

      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCPaywallConfiguration paywallType](self, "paywallType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v25, "hash");
  -[FCPaywallConfiguration title](self, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v24, "hash");
  -[FCPaywallConfiguration descriptionTrial](self, "descriptionTrial");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v23, "hash");
  -[FCPaywallConfiguration descriptionNonTrial](self, "descriptionNonTrial");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[FCPaywallConfiguration learnMoreTitle](self, "learnMoreTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[FCPaywallConfiguration learnMoreURL](self, "learnMoreURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[FCPaywallConfiguration offersLinkTitle](self, "offersLinkTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;
  -[FCPaywallConfiguration offersLinkURL](self, "offersLinkURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCPaywallConfiguration offersLinkTargetType](self, "offersLinkTargetType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13 ^ v15 ^ objc_msgSend(v16, "hash");
  -[FCPaywallConfiguration subscriptionButtonConfig](self, "subscriptionButtonConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  -[FCPaywallConfiguration visualSpecConfig](self, "visualSpecConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17 ^ v19 ^ objc_msgSend(v20, "hash");

  return v21;
}

+ (id)defaultArticleHardPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __76__FCPaywallConfiguration_defaultArticleHardPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8100;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8100, block);
    v7 = v11;
  }
  v8 = (id)_MergedGlobals_164;

  return v8;
}

void __76__FCPaywallConfiguration_defaultArticleHardPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  FCPaywallConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  +[FCPaywallConfiguration defaultPaywallTitle](FCPaywallConfiguration, "defaultPaywallTitle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallTopOffsetConfiguration](FCPaywallConfiguration, "defaultPaywallTopOffsetConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration](FCPaywallVisualSpecConfiguration, "defaultPaywallVisualSpecConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v5, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 1, v10, v2, v2, 0, 0, 0, 0, 0, v9, v4, v6, v3);
  v8 = (void *)_MergedGlobals_164;
  _MergedGlobals_164 = v7;

}

+ (id)defaultArticleSharedHardPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __82__FCPaywallConfiguration_defaultArticleSharedHardPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8110;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8110, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F8108;

  return v8;
}

void __82__FCPaywallConfiguration_defaultArticleSharedHardPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  FCPaywallConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  +[FCPaywallConfiguration defaultPaywallTitle](FCPaywallConfiguration, "defaultPaywallTitle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallTopOffsetConfiguration](FCPaywallConfiguration, "defaultPaywallTopOffsetConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration](FCPaywallVisualSpecConfiguration, "defaultPaywallVisualSpecConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v5, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 2, v10, v2, v2, 0, 0, 0, 0, 0, v9, v4, v6, v3);
  v8 = (void *)qword_1ED0F8108;
  qword_1ED0F8108 = v7;

}

+ (id)defaultArticleSoftPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __76__FCPaywallConfiguration_defaultArticleSoftPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8120;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8120, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F8118;

  return v8;
}

void __76__FCPaywallConfiguration_defaultArticleSoftPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultPaywallTitle](FCPaywallConfiguration, "defaultPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration](FCPaywallVisualSpecConfiguration, "defaultPaywallVisualSpecConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 3, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F8118;
  qword_1ED0F8118 = v6;

}

+ (id)defaultArticleSharedSoftPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __82__FCPaywallConfiguration_defaultArticleSharedSoftPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8130;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8130, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F8128;

  return v8;
}

void __82__FCPaywallConfiguration_defaultArticleSharedSoftPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultPaywallTitle](FCPaywallConfiguration, "defaultPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration](FCPaywallVisualSpecConfiguration, "defaultPaywallVisualSpecConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 4, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F8128;
  qword_1ED0F8128 = v6;

}

+ (id)defaultChannelSoftPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __76__FCPaywallConfiguration_defaultChannelSoftPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8140;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8140, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F8138;

  return v8;
}

void __76__FCPaywallConfiguration_defaultChannelSoftPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  FCPaywallConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  FCBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Read ${channelName} and your favorite magazines and newspapers."), &stru_1E464BC40, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration](FCPaywallVisualSpecConfiguration, "defaultPaywallVisualSpecConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v5, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 5, v10, v3, v3, 0, 0, 0, 0, 0, v9, v4, v6, 0);
  v8 = (void *)qword_1ED0F8138;
  qword_1ED0F8138 = v7;

}

+ (id)defaultMagazineFeedSoftPaywallSmallPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __93__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8150;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8150, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F8148;

  return v8;
}

void __93__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultSmallPaywallTitle](FCPaywallConfiguration, "defaultSmallPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultMagazineFeedPaywallVisualSpecConfigurationSmall](FCPaywallVisualSpecConfiguration, "defaultMagazineFeedPaywallVisualSpecConfigurationSmall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 6, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F8148;
  qword_1ED0F8148 = v6;

}

+ (id)defaultMagazineFeedSoftPaywallMediumPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __94__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallMediumPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8160;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8160, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F8158;

  return v8;
}

void __94__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallMediumPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultPaywallTitle](FCPaywallConfiguration, "defaultPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultMagazineFeedPaywallVisualSpecConfigurationMedium](FCPaywallVisualSpecConfiguration, "defaultMagazineFeedPaywallVisualSpecConfigurationMedium");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 7, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F8158;
  qword_1ED0F8158 = v6;

}

+ (id)defaultMagazineFeedSoftPaywallLargePaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __93__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8170;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8170, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F8168;

  return v8;
}

void __93__FCPaywallConfiguration_defaultMagazineFeedSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultPaywallTitle](FCPaywallConfiguration, "defaultPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultMagazineFeedPaywallVisualSpecConfigurationLarge](FCPaywallVisualSpecConfiguration, "defaultMagazineFeedPaywallVisualSpecConfigurationLarge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 8, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F8168;
  qword_1ED0F8168 = v6;

}

+ (id)defaultMagazineFeedVideoSoftPaywallSmallPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __98__FCPaywallConfiguration_defaultMagazineFeedVideoSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8180;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8180, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F8178;

  return v8;
}

void __98__FCPaywallConfiguration_defaultMagazineFeedVideoSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultSmallPaywallTitle](FCPaywallConfiguration, "defaultSmallPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultMagazineFeedPaywallVisualSpecConfigurationSmall](FCPaywallVisualSpecConfiguration, "defaultMagazineFeedPaywallVisualSpecConfigurationSmall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 9, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F8178;
  qword_1ED0F8178 = v6;

}

+ (id)defaultMagazineFeedVideoSoftPaywallLargePaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __98__FCPaywallConfiguration_defaultMagazineFeedVideoSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8190;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8190, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F8188;

  return v8;
}

void __98__FCPaywallConfiguration_defaultMagazineFeedVideoSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultPaywallTitle](FCPaywallConfiguration, "defaultPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultMagazineFeedPaywallVisualSpecConfigurationLarge](FCPaywallVisualSpecConfiguration, "defaultMagazineFeedPaywallVisualSpecConfigurationLarge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 10, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F8188;
  qword_1ED0F8188 = v6;

}

+ (id)defaultPDFHardPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __72__FCPaywallConfiguration_defaultPDFHardPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F81A0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F81A0, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F8198;

  return v8;
}

void __72__FCPaywallConfiguration_defaultPDFHardPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  FCPaywallConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  +[FCPaywallConfiguration defaultPaywallTitle](FCPaywallConfiguration, "defaultPaywallTitle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallDescription](FCPaywallConfiguration, "defaultPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallTopOffsetConfiguration](FCPaywallConfiguration, "defaultPaywallTopOffsetConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration](FCPaywallVisualSpecConfiguration, "defaultPaywallVisualSpecConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v5, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 11, v10, v2, v2, 0, 0, 0, 0, 0, v9, v4, v6, v3);
  v8 = (void *)qword_1ED0F8198;
  qword_1ED0F8198 = v7;

}

+ (id)defaultAudioArticleHardPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __81__FCPaywallConfiguration_defaultAudioArticleHardPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F81B0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F81B0, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F81A8;

  return v8;
}

void __81__FCPaywallConfiguration_defaultAudioArticleHardPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  FCPaywallConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  +[FCPaywallConfiguration defaultAudioPaywallTitle](FCPaywallConfiguration, "defaultAudioPaywallTitle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultAudioPaywallDescription](FCPaywallConfiguration, "defaultAudioPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallTopOffsetConfiguration](FCPaywallConfiguration, "defaultPaywallTopOffsetConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration](FCPaywallVisualSpecConfiguration, "defaultPaywallVisualSpecConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v5, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 1, v10, v2, v2, 0, 0, 0, 0, 0, v9, v4, v6, v3);
  v8 = (void *)qword_1ED0F81A8;
  qword_1ED0F81A8 = v7;

}

+ (id)defaultAudioArticleSharedHardPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __87__FCPaywallConfiguration_defaultAudioArticleSharedHardPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F81C0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F81C0, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F81B8;

  return v8;
}

void __87__FCPaywallConfiguration_defaultAudioArticleSharedHardPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  FCPaywallConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  +[FCPaywallConfiguration defaultAudioPaywallTitle](FCPaywallConfiguration, "defaultAudioPaywallTitle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultAudioPaywallDescription](FCPaywallConfiguration, "defaultAudioPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultPaywallTopOffsetConfiguration](FCPaywallConfiguration, "defaultPaywallTopOffsetConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration](FCPaywallVisualSpecConfiguration, "defaultPaywallVisualSpecConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v5, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 2, v10, v2, v2, 0, 0, 0, 0, 0, v9, v4, v6, v3);
  v8 = (void *)qword_1ED0F81B8;
  qword_1ED0F81B8 = v7;

}

+ (id)defaultAudioArticleSoftPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __81__FCPaywallConfiguration_defaultAudioArticleSoftPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F81D0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F81D0, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F81C8;

  return v8;
}

void __81__FCPaywallConfiguration_defaultAudioArticleSoftPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultAudioPaywallTitle](FCPaywallConfiguration, "defaultAudioPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultAudioPaywallDescription](FCPaywallConfiguration, "defaultAudioPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration](FCPaywallVisualSpecConfiguration, "defaultPaywallVisualSpecConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 3, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F81C8;
  qword_1ED0F81C8 = v6;

}

+ (id)defaultAudioArticleSharedSoftPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __87__FCPaywallConfiguration_defaultAudioArticleSharedSoftPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F81E0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F81E0, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F81D8;

  return v8;
}

void __87__FCPaywallConfiguration_defaultAudioArticleSharedSoftPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultAudioPaywallTitle](FCPaywallConfiguration, "defaultAudioPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultAudioPaywallDescription](FCPaywallConfiguration, "defaultAudioPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultPaywallVisualSpecConfiguration](FCPaywallVisualSpecConfiguration, "defaultPaywallVisualSpecConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 4, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F81D8;
  qword_1ED0F81D8 = v6;

}

+ (id)defaultAudioFeedSoftPaywallSmallPaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __90__FCPaywallConfiguration_defaultAudioFeedSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F81F0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F81F0, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F81E8;

  return v8;
}

void __90__FCPaywallConfiguration_defaultAudioFeedSoftPaywallSmallPaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultAudioPaywallTitle](FCPaywallConfiguration, "defaultAudioPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultAudioPaywallDescription](FCPaywallConfiguration, "defaultAudioPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultAudioFeedPaywallVisualSpecConfigurationSmall](FCPaywallVisualSpecConfiguration, "defaultAudioFeedPaywallVisualSpecConfigurationSmall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 12, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F81E8;
  qword_1ED0F81E8 = v6;

}

+ (id)defaultAudioFeedSoftPaywallLargePaywallWithLandingPageArticleID:(id)a3
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
  block[2] = __90__FCPaywallConfiguration_defaultAudioFeedSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke;
  block[3] = &unk_1E463AB18;
  v11 = v3;
  v4 = qword_1ED0F8200;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1ED0F8200, block);
    v7 = v11;
  }
  v8 = (id)qword_1ED0F81F8;

  return v8;
}

void __90__FCPaywallConfiguration_defaultAudioFeedSoftPaywallLargePaywallWithLandingPageArticleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FCPaywallConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[FCPaywallConfiguration defaultAudioPaywallTitle](FCPaywallConfiguration, "defaultAudioPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPaywallConfiguration defaultAudioPaywallDescription](FCPaywallConfiguration, "defaultAudioPaywallDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionButtonConfiguration defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultLandingPageTargetSubscriptionButtonWithLandingPageArticleID:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FCPaywallConfiguration alloc];
  +[FCPaywallVisualSpecConfiguration defaultAudioFeedPaywallVisualSpecConfigurationSmall](FCPaywallVisualSpecConfiguration, "defaultAudioFeedPaywallVisualSpecConfigurationSmall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[FCPaywallConfiguration initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:](v4, "initWithPaywallType:title:descriptionTrial:descriptionNonTrial:learnMoreTitle:learnMoreURL:offersLinkTitle:offersLinkURL:offersLinkTargetType:externalOverridesEnabled:subscriptionButtonConfig:visualSpecConfig:paywallTopOffsetConfig:", 12, v9, v2, v2, 0, 0, 0, 0, 0, v8, v3, v5, 0);
  v7 = (void *)qword_1ED0F81F8;
  qword_1ED0F81F8 = v6;

}

+ (id)defaultSmallPaywallTitle
{
  if (qword_1ED0F8210 != -1)
    dispatch_once(&qword_1ED0F8210, &__block_literal_global_65);
  return (id)qword_1ED0F8208;
}

void __50__FCPaywallConfiguration_defaultSmallPaywallTitle__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  FCBundle();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Get your favorite magazines and newspapers.\nAll for one price."), &stru_1E464BC40, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8208;
  qword_1ED0F8208 = v0;

}

+ (id)defaultPaywallTitle
{
  if (qword_1ED0F8220 != -1)
    dispatch_once(&qword_1ED0F8220, &__block_literal_global_76);
  return (id)qword_1ED0F8218;
}

void __45__FCPaywallConfiguration_defaultPaywallTitle__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  FCBundle();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Get your favorite magazines and newspapers. All for one price."), &stru_1E464BC40, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8218;
  qword_1ED0F8218 = v0;

}

+ (id)defaultPaywallDescription
{
  if (qword_1ED0F8230 != -1)
    dispatch_once(&qword_1ED0F8230, &__block_literal_global_79_0);
  return (id)qword_1ED0F8228;
}

void __51__FCPaywallConfiguration_defaultPaywallDescription__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  FCBundle();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("No commitment. Plan auto-renews until canceled."), &stru_1E464BC40, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8228;
  qword_1ED0F8228 = v0;

}

+ (id)defaultAudioPaywallTitle
{
  if (qword_1ED0F8240 != -1)
    dispatch_once(&qword_1ED0F8240, &__block_literal_global_82);
  return (id)qword_1ED0F8238;
}

void __50__FCPaywallConfiguration_defaultAudioPaywallTitle__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  FCBundle();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Listen to stories from top magazines and leading newspapers."), &stru_1E464BC40, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8238;
  qword_1ED0F8238 = v0;

}

+ (id)defaultAudioPaywallDescription
{
  if (qword_1ED0F8250 != -1)
    dispatch_once(&qword_1ED0F8250, &__block_literal_global_85);
  return (id)qword_1ED0F8248;
}

void __56__FCPaywallConfiguration_defaultAudioPaywallDescription__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  FCBundle();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("No commitment. Plan auto-renews until canceled."), &stru_1E464BC40, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8248;
  qword_1ED0F8248 = v0;

}

+ (id)defaultPaywallTopOffsetConfiguration
{
  if (qword_1ED0F8260 != -1)
    dispatch_once(&qword_1ED0F8260, &__block_literal_global_86_0);
  return (id)qword_1ED0F8258;
}

void __62__FCPaywallConfiguration_defaultPaywallTopOffsetConfiguration__block_invoke()
{
  FCPaywallTopOffsetConfiguration *v0;
  void *v1;

  v0 = -[FCPaywallTopOffsetConfiguration initWithCompactPortraitTopOffsetRatio:compactLandscapeTopOffsetRatio:regularPortraitTopOffsetRatio:regularLandscapeTopOffsetRatio:]([FCPaywallTopOffsetConfiguration alloc], "initWithCompactPortraitTopOffsetRatio:compactLandscapeTopOffsetRatio:regularPortraitTopOffsetRatio:regularLandscapeTopOffsetRatio:", 0.1, 0.1, 0.0, 0.3);
  v1 = (void *)qword_1ED0F8258;
  qword_1ED0F8258 = (uint64_t)v0;

}

+ (id)defaultDeferredPaywallTopOffsetConfiguration
{
  if (qword_1ED0F8270 != -1)
    dispatch_once(&qword_1ED0F8270, &__block_literal_global_87_0);
  return (id)qword_1ED0F8268;
}

void __70__FCPaywallConfiguration_defaultDeferredPaywallTopOffsetConfiguration__block_invoke()
{
  FCPaywallTopOffsetConfiguration *v0;
  void *v1;

  v0 = -[FCPaywallTopOffsetConfiguration initWithCompactPortraitTopOffsetRatio:compactLandscapeTopOffsetRatio:regularPortraitTopOffsetRatio:regularLandscapeTopOffsetRatio:]([FCPaywallTopOffsetConfiguration alloc], "initWithCompactPortraitTopOffsetRatio:compactLandscapeTopOffsetRatio:regularPortraitTopOffsetRatio:regularLandscapeTopOffsetRatio:", 0.1, 0.7, 0.2, 0.7);
  v1 = (void *)qword_1ED0F8268;
  qword_1ED0F8268 = (uint64_t)v0;

}

- (unint64_t)paywallType
{
  return self->_paywallType;
}

- (void)setPaywallType:(unint64_t)a3
{
  self->_paywallType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)descriptionTrial
{
  return self->_descriptionTrial;
}

- (void)setDescriptionTrial:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)descriptionNonTrial
{
  return self->_descriptionNonTrial;
}

- (void)setDescriptionNonTrial:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)learnMoreTitle
{
  return self->_learnMoreTitle;
}

- (void)setLearnMoreTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)offersLinkTitle
{
  return self->_offersLinkTitle;
}

- (void)setOffersLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)offersLinkURL
{
  return self->_offersLinkURL;
}

- (void)setOffersLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)offersLinkTargetType
{
  return self->_offersLinkTargetType;
}

- (void)setOffersLinkTargetType:(unint64_t)a3
{
  self->_offersLinkTargetType = a3;
}

- (BOOL)externalOverridesEnabled
{
  return self->_externalOverridesEnabled;
}

- (FCSubscriptionButtonConfiguration)subscriptionButtonConfig
{
  return self->_subscriptionButtonConfig;
}

- (void)setSubscriptionButtonConfig:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionButtonConfig, a3);
}

- (FCPaywallVisualSpecConfiguration)visualSpecConfig
{
  return self->_visualSpecConfig;
}

- (void)setVisualSpecConfig:(id)a3
{
  objc_storeStrong((id *)&self->_visualSpecConfig, a3);
}

- (FCPaywallTopOffsetConfiguration)paywallTopOffsetConfig
{
  return self->_paywallTopOffsetConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paywallTopOffsetConfig, 0);
  objc_storeStrong((id *)&self->_visualSpecConfig, 0);
  objc_storeStrong((id *)&self->_subscriptionButtonConfig, 0);
  objc_storeStrong((id *)&self->_offersLinkURL, 0);
  objc_storeStrong((id *)&self->_offersLinkTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_learnMoreTitle, 0);
  objc_storeStrong((id *)&self->_descriptionNonTrial, 0);
  objc_storeStrong((id *)&self->_descriptionTrial, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
