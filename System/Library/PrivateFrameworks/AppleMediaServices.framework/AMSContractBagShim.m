@implementation AMSContractBagShim

- (AMSContractBagShim)initWithBagContract:(id)a3
{
  id v5;
  AMSContractBagShim *v6;
  AMSContractBagShim *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSContractBagShim;
  v6 = -[AMSContractBagShim init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bagContract, a3);

  return v7;
}

- (NSDate)expirationDate
{
  return 0;
}

- (BOOL)isExpired
{
  return 0;
}

- (BOOL)isLoaded
{
  return 1;
}

- (NSString)profile
{
  return (NSString *)CFSTR("AMSContractBagShim");
}

- (NSString)profileVersion
{
  return (NSString *)CFSTR("1");
}

- (id)arrayForKey:(id)a3
{
  return -[AMSContractBagShim _bagValueForBagKey:bagValueType:](self, "_bagValueForBagKey:bagValueType:", a3, 0);
}

- (id)BOOLForKey:(id)a3
{
  return -[AMSContractBagShim _bagValueForBagKey:bagValueType:](self, "_bagValueForBagKey:bagValueType:", a3, 1);
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  AMSError(205, CFSTR("Not Supported"), CFSTR("AMSContractBagShim doesn't support creating a snapshot."), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

- (id)doubleForKey:(id)a3
{
  return -[AMSContractBagShim _bagValueForBagKey:bagValueType:](self, "_bagValueForBagKey:bagValueType:", a3, 2);
}

- (id)integerForKey:(id)a3
{
  return -[AMSContractBagShim _bagValueForBagKey:bagValueType:](self, "_bagValueForBagKey:bagValueType:", a3, 3);
}

- (id)stringForKey:(id)a3
{
  return -[AMSContractBagShim _bagValueForBagKey:bagValueType:](self, "_bagValueForBagKey:bagValueType:", a3, 4);
}

- (id)URLForKey:(id)a3
{
  return -[AMSContractBagShim _bagValueForBagKey:bagValueType:](self, "_bagValueForBagKey:bagValueType:", a3, 5);
}

- (id)dictionaryForKey:(id)a3
{
  return -[AMSContractBagShim _bagValueForBagKey:bagValueType:](self, "_bagValueForBagKey:bagValueType:", a3, 6);
}

- (id)_bagValueForBagKey:(id)a3 bagValueType:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  SEL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SEL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AMSContractBagShim bagContract](self, "bagContract");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AMSContractBagShim bagContract](self, "bagContract");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  v9 = NSSelectorFromString(CFSTR("mescalContract"));
  -[AMSContractBagShim bagContract](self, "bagContract");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (void *)objc_opt_class();
    -[AMSContractBagShim bagContract](self, "bagContract");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_callSelector:onBagContract:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v6, "addObject:", v13);
  }
  else
  {

    v13 = 0;
  }
  v14 = NSSelectorFromString(CFSTR("metricsContract"));
  -[AMSContractBagShim bagContract](self, "bagContract");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = (void *)objc_opt_class();
    -[AMSContractBagShim bagContract](self, "bagContract");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_callSelector:onBagContract:", v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(v6, "addObject:", v18);
  }
  else
  {

    v18 = 0;
  }
  v19 = -[AMSContractBagShim _selectorForBagKey:](self, "_selectorForBagKey:", v5);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = v6;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v21)
  {
    v22 = v21;
    v29 = v18;
    v30 = v13;
    v23 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (!v19 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          if (!objc_msgSend(v5, "isEqualToString:", 0x1E254CD60, v29, v30, (_QWORD)v31))
            continue;
          v19 = NSSelectorFromString(CFSTR("metricsUrl"));
          if (!v19 || (objc_opt_respondsToSelector() & 1) == 0)
            continue;
        }
        objc_msgSend((id)objc_opt_class(), "_callSelector:onBagContract:", v19, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          goto LABEL_26;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v22)
        continue;
      break;
    }
    v27 = 0;
LABEL_26:
    v18 = v29;
    v13 = v30;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)_callSelector:(SEL)a3 onBagContract:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  ((void (*)(id, SEL))objc_msgSend(v5, "methodForSelector:", a3))(v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SEL)_selectorForBagKey:(id)a3
{
  id v3;
  __CFString *v4;
  const char *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", 0x1E254C840) & 1) != 0)
  {
    v4 = CFSTR("appleMusicDeviceOfferDeepLink");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254C860) & 1) != 0)
  {
    v4 = CFSTR("iCloudDeviceOfferDeepLink");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("family-info")) & 1) != 0)
  {
    v4 = CFSTR("familyInfoURL");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254D320) & 1) != 0)
  {
    v4 = CFSTR("personalizedLookupURL");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254D340) & 1) != 0)
  {
    v4 = CFSTR("unpersonalizedLookupURL");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sign-sap-setup-cert")) & 1) != 0)
  {
    v4 = CFSTR("mescalCertificateURL");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254CCA0) & 1) != 0)
  {
    v4 = CFSTR("mescalPrimingURL");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sign-sap-setup")) & 1) != 0)
  {
    v4 = CFSTR("mescalSetupURL");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254CCE0) & 1) != 0)
  {
    v4 = CFSTR("mescalSignedActions");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254CD00) & 1) != 0)
  {
    v4 = CFSTR("mescalSignSapRequests");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254CD20) & 1) != 0)
  {
    v4 = CFSTR("mescalSignSapResponses");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254BA80) & 1) != 0)
  {
    v4 = CFSTR("metricsDictionary");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254CD60) & 1) != 0)
  {
    v4 = CFSTR("metricsURL");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254C460) & 1) != 0)
  {
    v4 = CFSTR("apsEnabledPatterns");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254C480) & 1) != 0)
  {
    v4 = CFSTR("apsSamplingPercent");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254C4A0) & 1) != 0)
  {
    v4 = CFSTR("apsAllowedProductTypes");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254D240) & 1) != 0)
  {
    v4 = CFSTR("guidRegexes");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254D280) & 1) != 0)
  {
    v4 = CFSTR("guidSchemes");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("storefront-header-suffix")) & 1) != 0)
  {
    v4 = CFSTR("storefrontSuffix");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254D360) & 1) != 0)
  {
    v4 = CFSTR("TLSSamplingPercentage");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254D380) & 1) != 0)
  {
    v4 = CFSTR("TLSSamplingSessionDuration");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254D3A0) & 1) != 0)
  {
    v4 = CFSTR("TFOSamplingPercentage");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254D3C0) & 1) != 0)
  {
    v4 = CFSTR("TFOSamplingSessionDuration");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", 0x1E254D420) & 1) != 0)
  {
    v4 = CFSTR("schemesThatOverrideTrustedDomains");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", 0x1E254D400))
    {
      v5 = 0;
      goto LABEL_52;
    }
    v4 = CFSTR("trustedDomains");
  }
  v5 = NSSelectorFromString(&v4->isa);
LABEL_52:

  return v5;
}

- (NSObject)bagContract
{
  return self->_bagContract;
}

- (void)setBagContract:(id)a3
{
  objc_storeStrong((id *)&self->_bagContract, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagContract, 0);
}

@end
