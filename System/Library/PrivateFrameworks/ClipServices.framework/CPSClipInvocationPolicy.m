@implementation CPSClipInvocationPolicy

- (CPSClipInvocationPolicy)initWithEligible:(BOOL)a3 reason:(int64_t)a4
{
  CPSClipInvocationPolicy *v6;
  CPSClipInvocationPolicy *v7;
  CPSClipInvocationPolicy *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CPSClipInvocationPolicy;
  v6 = -[CPSClipInvocationPolicy init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_eligible = a3;
    v6->_reason = a4;
    v8 = v6;
  }

  return v7;
}

+ (id)eligiblePolicy
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEligible:reason:", 1, 0);
}

+ (id)ineligiblePolicyWithReason:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEligible:reason:", 0, a3);
}

+ (void)requestAccountPolicyWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  void (**v17)(id, void *);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE buf[24];
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  if (CPSBypassAccountEligibilityCheck())
  {
    v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_INFO, "%{public}@ (%p): Bypassing account policy check.", buf, 0x16u);

    }
    +[CPSClipInvocationPolicy eligiblePolicy](CPSClipInvocationPolicy, "eligiblePolicy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);
  }
  else
  {
    v8 = CPSAccountPolicyOverride();
    v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        v11 = v9;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a1;
        *(_WORD *)&buf[22] = 2048;
        v24 = (void *)v8;
        _os_log_impl(&dword_20AD44000, v11, OS_LOG_TYPE_INFO, "%{public}@ (%p): Use policy override from user defaults: value = %ld ", buf, 0x20u);

      }
      +[CPSClipInvocationPolicy ineligiblePolicyWithReason:](CPSClipInvocationPolicy, "ineligiblePolicyWithReason:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7);
    }
    else
    {
      if (v10)
      {
        v12 = v9;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a1;
        _os_log_impl(&dword_20AD44000, v12, OS_LOG_TYPE_INFO, "%{public}@ (%p): Determining account policy.", buf, 0x16u);

      }
      v19 = 0;
      v20 = &v19;
      v21 = 0x2050000000;
      v13 = (void *)getMCProfileConnectionClass_softClass_0;
      v22 = getMCProfileConnectionClass_softClass_0;
      if (!getMCProfileConnectionClass_softClass_0)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getMCProfileConnectionClass_block_invoke_0;
        v24 = &unk_24C3B9278;
        v25 = &v19;
        __getMCProfileConnectionClass_block_invoke_0((uint64_t)buf);
        v13 = (void *)v20[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v19, 8);
      objc_msgSend(v14, "sharedConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isAppClipsAllowed") & 1) != 0)
      {
        v15 = objc_alloc_init(MEMORY[0x24BE044D8]);
        objc_msgSend(v15, "setLookupFamilyInfoIfNecessary:", 1);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __62__CPSClipInvocationPolicy_requestAccountPolicyWithCompletion___block_invoke;
        v16[3] = &unk_24C3BA030;
        v18 = a1;
        v17 = v4;
        objc_msgSend(v15, "statusWithCompletion:", v16);

      }
      else
      {
        +[CPSClipInvocationPolicy ineligiblePolicyWithReason:](CPSClipInvocationPolicy, "ineligiblePolicyWithReason:", 6);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v15);
      }

    }
  }

}

void __62__CPSClipInvocationPolicy_requestAccountPolicyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = v7;
    v20 = 138543874;
    v21 = v8;
    v22 = 2048;
    v23 = objc_opt_class();
    v24 = 2048;
    v25 = objc_msgSend(v5, "accountStatus");
    _os_log_impl(&dword_20AD44000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): Obtained ASDAccountStatusCode: %ld", (uint8_t *)&v20, 0x20u);

  }
  if (!v5 || v6)
  {
    v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __62__CPSClipInvocationPolicy_requestAccountPolicyWithCompletion___block_invoke_cold_1(a1, v12, v6);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 12;
  }
  else
  {
    if ((objc_msgSend(v5, "hasErrorStatus") & 1) == 0)
    {
      v10 = *(_QWORD *)(a1 + 32);
      +[CPSClipInvocationPolicy eligiblePolicy](CPSClipInvocationPolicy, "eligiblePolicy");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (objc_msgSend(v5, "hasResponseFlag:", 1))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 1;
    }
    else if (objc_msgSend(v5, "hasResponseFlag:", 32))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 4;
    }
    else if (objc_msgSend(v5, "hasResponseFlag:", 16))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 9;
    }
    else if (objc_msgSend(v5, "hasResponseFlag:", 64))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 10;
    }
    else if (objc_msgSend(v5, "hasResponseFlag:", 4))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 11;
    }
    else if (objc_msgSend(v5, "hasResponseFlag:", 256))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 3;
    }
    else if (objc_msgSend(v5, "hasResponseFlag:", 128))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 2;
    }
    else
    {
      v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *(_QWORD *)(a1 + 40);
        v17 = v15;
        v18 = objc_opt_class();
        v19 = objc_msgSend(v5, "accountStatus");
        v20 = 138543874;
        v21 = v16;
        v22 = 2048;
        v23 = v18;
        v24 = 2048;
        v25 = v19;
        _os_log_impl(&dword_20AD44000, v17, OS_LOG_TYPE_INFO, "%{public}@ (%p): Unhandled ASDAccountStatusCode encountered while determining account policy. Account status: %ld", (uint8_t *)&v20, 0x20u);

      }
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 15;
    }
  }
  +[CPSClipInvocationPolicy ineligiblePolicyWithReason:](CPSClipInvocationPolicy, "ineligiblePolicyWithReason:", v11);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v14 = (void *)v13;
  (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v13);

}

+ (id)invocationPolicyWithAMSDict:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v16 = 138543618;
    v17 = objc_opt_class();
    v18 = 2048;
    v19 = (uint64_t)a1;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_INFO, "%{public}@ (%p): Determining clip policy.", (uint8_t *)&v16, 0x16u);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04530]), "initWithDictionary:", v4);

  v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = objc_opt_class();
    v11 = objc_msgSend(v7, "responseCode");
    v16 = 138543874;
    v17 = (uint64_t)a1;
    v18 = 2048;
    v19 = v10;
    v20 = 2048;
    v21 = v11;
    _os_log_impl(&dword_20AD44000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): Obtained ASDClipRestrictionsTask response code: %ld", (uint8_t *)&v16, 0x20u);

  }
  if (CPSAMSRestrictionsCodeOverride() != 14)
  {
    if ((objc_msgSend(v7, "hasErrorStatus") & 1) == 0)
    {
      +[CPSClipInvocationPolicy eligiblePolicy](CPSClipInvocationPolicy, "eligiblePolicy");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v7, "hasResponseFlag:", 1))
    {
      v12 = 9;
      goto LABEL_7;
    }
    if (objc_msgSend(v7, "hasResponseFlag:", 2))
    {
      v12 = 5;
      goto LABEL_7;
    }
    if (!objc_msgSend(v7, "hasResponseFlag:", 4))
    {
      v12 = 15;
      goto LABEL_7;
    }
  }
  v12 = 14;
LABEL_7:
  +[CPSClipInvocationPolicy ineligiblePolicyWithReason:](CPSClipInvocationPolicy, "ineligiblePolicyWithReason:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v14 = (void *)v13;

  return v14;
}

- (NSString)localizedTitle
{
  unint64_t v2;
  void *v3;

  v2 = self->_reason - 1;
  if (v2 > 4)
  {
    v3 = 0;
  }
  else
  {
    _CPSLocalizedString(off_24C3BA068[v2], &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)localizedMessageForClipMetadata:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  switch(self->_reason)
  {
    case 1:
      v5 = CFSTR("To use this app clip, you need to sign in with your Apple Account first.");
      goto LABEL_15;
    case 2:
      v5 = CFSTR("Before you can proceed, you must read and accept the new Terms and Conditions in the App Store.");
      goto LABEL_15;
    case 3:
      v5 = CFSTR("View and correct the problem in your Billing Info. If you cancel you may not be able to buy until this billing issue has been resolved.");
      goto LABEL_15;
    case 4:
      v5 = CFSTR("To ask permission to buy the app for this app clip, open the App Store");
      goto LABEL_15;
    case 5:
      v5 = CFSTR("To use this app clip, you first need to verify your age in the App Store");
      goto LABEL_15;
    case 6:
      v5 = CFSTR("Due to restrictions set for this device, app clips cannot be used");
      goto LABEL_15;
    case 7:
      v5 = CFSTR("App clips are not available with a managed Apple Account");
      goto LABEL_15;
    case 8:
      v5 = CFSTR("This app clip is not currently available in your country or region");
      goto LABEL_15;
    case 9:
      v5 = CFSTR("Due to restrictions set for this device, this app clip cannot be used");
      goto LABEL_15;
    case 0xALL:
      v5 = CFSTR("App clips are not available in your region");
      goto LABEL_15;
    case 0xBLL:
      v5 = CFSTR("App clips are not available with a restricted Apple Account");
      goto LABEL_15;
    case 0xCLL:
    case 0xDLL:
    case 0xFLL:
      v5 = CFSTR("App Clip Unavailable");
LABEL_15:
      _CPSLocalizedString(v5, &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xELL:
      v8 = (void *)MEMORY[0x24BDD17C8];
      _CPSLocalizedString(CFSTR("This app clip requires iOS %@ or later"), &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clipMinimumOSVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (BOOL)isRecoverable
{
  return (self->_reason > 0xFuLL) | (0x3Eu >> self->_reason) & 1;
}

- (BOOL)isIneligibleDueToContentRestriction
{
  return (self->_reason > 0xFuLL) | (0x240u >> self->_reason) & 1;
}

- (BOOL)canShowHeroImage
{
  return (self->_reason & 0xFFFFFFFFFFFFFFFDLL) != 8;
}

- (CPSClipInvocationPolicy)initWithCoder:(id)a3
{
  id v4;
  CPSClipInvocationPolicy *v5;
  CPSClipInvocationPolicy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSClipInvocationPolicy;
  v5 = -[CPSClipInvocationPolicy init](&v8, sel_init);
  if (v5)
  {
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CPSClipInvocationPolicyKeyReason"));
    v5->_eligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CPSClipInvocationPolicyKeyEligible"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t reason;
  id v5;

  reason = self->_reason;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", reason, CFSTR("CPSClipInvocationPolicyKeyReason"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_eligible, CFSTR("CPSClipInvocationPolicyKeyEligible"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Eligible: %d Recoverable: %d Reason: %ld"), -[CPSClipInvocationPolicy isEligible](self, "isEligible"), -[CPSClipInvocationPolicy isRecoverable](self, "isRecoverable"), self->_reason);
}

- (BOOL)isEligible
{
  return self->_eligible;
}

- (int64_t)reason
{
  return self->_reason;
}

void __62__CPSClipInvocationPolicy_requestAccountPolicyWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  v6 = objc_opt_class();
  objc_msgSend(a3, "cps_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v4;
  v10 = 2048;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_20AD44000, v5, OS_LOG_TYPE_ERROR, "%{public}@ (%p): Error determining account policy: %@", (uint8_t *)&v8, 0x20u);

}

@end
