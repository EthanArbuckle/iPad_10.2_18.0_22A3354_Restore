@implementation VSPrivacyFacade

- (VSPrivacyFacade)initWithService:(id)a3 voucherLockbox:(id)a4
{
  id v6;
  id v7;
  VSPrivacyFacade *v8;
  uint64_t v9;
  NSString *service;
  NSOperationQueue *v11;
  NSOperationQueue *privateQueue;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VSPrivacyFacade;
  v8 = -[VSPrivacyFacade init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    service = v8->_service;
    v8->_service = (NSString *)v9;

    objc_storeStrong((id *)&v8->_voucherLockbox, a4);
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    privateQueue = v8->_privateQueue;
    v8->_privateQueue = v11;

    -[NSOperationQueue setName:](v8->_privateQueue, "setName:", CFSTR("VSPrivacyFacade"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_privateQueue, "setMaxConcurrentOperationCount:", 1);
  }

  return v8;
}

- (VSPrivacyFacade)initWithVoucherLockbox:(id)a3
{
  return -[VSPrivacyFacade initWithService:voucherLockbox:](self, "initWithService:voucherLockbox:", *MEMORY[0x1E0DB1150], a3);
}

- (VSPrivacyFacade)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)preflightCheckForProcessIdentifier:(int)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, uint64_t);
  NSObject *v7;
  void *v8;
  uint64_t Unique;
  const void *v10;
  const __CFArray *v11;
  const __CFArray *v12;
  CFIndex v13;
  const void **v14;
  const __CFDictionary *ValueAtIndex;
  const __CFString *Value;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFBoolean *v33;
  int v34;
  NSObject *v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v46) = 0;
    _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Will preflight for pid.", (uint8_t *)&v46, 2u);
  }

  VSBundleURLForProcessIdentifier(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    VSErrorLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[VSPrivacyFacade preflightCheckForProcessIdentifier:withCompletionHandler:].cold.1(a3, v18);

    goto LABEL_17;
  }
  Unique = _CFBundleCreateUnique();
  if (!Unique)
  {
    VSErrorLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[VSPrivacyFacade preflightCheckForProcessIdentifier:withCompletionHandler:].cold.2((uint64_t)v8, v19, v20, v21, v22, v23, v24, v25);

LABEL_17:
    v17 = 0;
    goto LABEL_35;
  }
  v10 = (const void *)Unique;
  v11 = (const __CFArray *)TCCAccessCopyInformationForBundle();
  if (v11)
  {
    v12 = v11;
    if (CFArrayGetCount(v11) < 1)
    {
LABEL_10:
      v17 = 0;
    }
    else
    {
      v13 = 0;
      v14 = (const void **)MEMORY[0x1E0DB10B8];
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v12, v13);
        Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, *v14);
        if (CFStringCompare(Value, (CFStringRef)-[VSPrivacyFacade service](self, "service"), 0) == kCFCompareEqualTo)
          break;
        if (++v13 >= CFArrayGetCount(v12))
          goto LABEL_10;
      }
      v33 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E0DB10A8]);
      if (v33)
      {
        v34 = CFBooleanGetValue(v33);
        VSDefaultLogObject();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        if (v34)
        {
          if (v36)
          {
            LOWORD(v46) = 0;
            _os_log_impl(&dword_1D2419000, v35, OS_LOG_TYPE_DEFAULT, "TCC status is granted.", (uint8_t *)&v46, 2u);
          }
          v17 = 1;
        }
        else if (v36)
        {
          LOWORD(v46) = 0;
          v17 = 2;
          _os_log_impl(&dword_1D2419000, v35, OS_LOG_TYPE_DEFAULT, "TCC status is denied.", (uint8_t *)&v46, 2u);
        }
        else
        {
          v17 = 2;
        }
      }
      else
      {
        VSErrorLogObject();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[VSPrivacyFacade preflightCheckForProcessIdentifier:withCompletionHandler:].cold.4(v35, v37, v38, v39, v40, v41, v42, v43);
        v17 = 0;
      }

    }
    CFRelease(v12);
  }
  else
  {
    VSErrorLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[VSPrivacyFacade preflightCheckForProcessIdentifier:withCompletionHandler:].cold.3((uint64_t)v10, v26, v27, v28, v29, v30, v31, v32);

    v17 = 0;
  }
  CFRelease(v10);
LABEL_35:
  VSDefaultLogObject();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138412290;
    v47 = v45;
    _os_log_impl(&dword_1D2419000, v44, OS_LOG_TYPE_DEFAULT, "Will call preflight completion handler with result %@", (uint8_t *)&v46, 0xCu);

  }
  v6[2](v6, v17);

}

- (BOOL)isAccessGrantedForAuditToken:(id *)a3
{
  -[VSPrivacyFacade service](self, "service");
  return TCCAccessCheckAuditToken() != 0;
}

- (BOOL)setAccessGranted:(BOOL)a3 forAuditToken:(id *)a4
{
  -[VSPrivacyFacade service](self, "service");
  return TCCAccessSetForAuditToken() != 0;
}

- (id)_voucherForProcess:(int)a3 providerID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  VSBundleURLForProcessIdentifier(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CA5870], "vs_applicationRecordWithBundleURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "iTunesMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v10, "storeItemIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[VSPrivacyFacade voucherLockbox](self, "voucherLockbox");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unredeemedVouchers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v23 = v11;
      v24 = v8;
      v25 = v7;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v18, "appAdamID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "isEqual:", v12) & 1) != 0)
          {
            objc_msgSend(v18, "providerID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqual:", v6);

            if (v21)
            {
              v15 = v18;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        v15 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
LABEL_15:
      v8 = v24;
      v7 = v25;
      v11 = v23;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)requestAccessForAuditToken:(id *)a3 processIdentifier:(int)a4 identityProviderDisplayName:(id)a5 providerIsSupported:(BOOL)a6 identityProviderID:(id)a7 allowUI:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL4 v9;
  _BOOL8 v11;
  uint64_t v12;
  id v15;
  id v16;
  void (**v17)(id, uint64_t, VSOptional *);
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  __int128 v22;
  VSOptional *v23;
  __int128 v24;
  VSOptional *v25;
  __int128 v26;
  __int128 v27;

  v9 = a8;
  v11 = a6;
  v12 = *(_QWORD *)&a4;
  v15 = a5;
  v16 = a7;
  v17 = (void (**)(id, uint64_t, VSOptional *))a9;
  if (!v17)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
  -[VSPrivacyFacade _voucherForProcess:providerID:](self, "_voucherForProcess:providerID:", v12, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1D2419000, v19, OS_LOG_TYPE_DEFAULT, "Found a voucher for process.", (uint8_t *)&v26, 2u);
    }

    -[VSPrivacyFacade voucherLockbox](self, "voucherLockbox");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "redeemVoucher:", v18);

    v22 = *(_OWORD *)&a3->var0[4];
    v26 = *(_OWORD *)a3->var0;
    v27 = v22;
    -[VSPrivacyFacade setAccessGranted:forAuditToken:](self, "setAccessGranted:forAuditToken:", 1, &v26);
    v23 = objc_alloc_init(VSOptional);
    v17[2](v17, 1, v23);
    goto LABEL_12;
  }
  if (v20)
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_1D2419000, v19, OS_LOG_TYPE_DEFAULT, "No voucher found for process.", (uint8_t *)&v26, 2u);
  }

  if (!v9)
  {
    VSPrivateError(-12, 0);
    v23 = (VSOptional *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v23);
    v25 = (VSOptional *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, v25);

LABEL_12:
    goto LABEL_13;
  }
  v24 = *(_OWORD *)&a3->var0[4];
  v26 = *(_OWORD *)a3->var0;
  v27 = v24;
  -[VSPrivacyFacade _promptForAccessUsingAuditToken:processIdentifier:identityProviderDisplayName:providerIsSupported:completionHandler:](self, "_promptForAccessUsingAuditToken:processIdentifier:identityProviderDisplayName:providerIsSupported:completionHandler:", &v26, v12, v15, v11, v17);
LABEL_13:

}

- (void)_promptForAccessUsingAuditToken:(id *)a3 processIdentifier:(int)a4 identityProviderDisplayName:(id)a5 providerIsSupported:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v8;
  id v10;
  VSUserNotificationOperation *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  objc_class *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  VSUserNotificationOperation *v34;
  __int128 v35;
  void *v36;
  void *v37;
  id *v38;
  void *v39;
  void *v40;
  void *v41;
  $115C4C562B26FF47E01F9F4EA65B5887 *v42;
  void *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  _QWORD v54[2];
  id v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v8 = *(_QWORD *)&a4;
  v10 = a5;
  v46 = a7;
  v11 = objc_alloc_init(VSUserNotificationOperation);
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_bundleForProcessIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__5;
  v63 = __Block_byref_object_dispose__5;
  v15 = MEMORY[0x1E0C809B0];
  v64 = 0;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke;
  v58[3] = &unk_1E939FEA0;
  v58[4] = &v59;
  objc_msgSend(v14, "conditionallyUnwrapObject:", v58);
  v42 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PRIVACY_TITLE_FORMAT"), 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v17, v60[5], v10);
  }
  else
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PRIVACY_TITLE_FORMAT_GENERIC"), 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v17, v60[5]);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSUserNotificationOperation setTitle:](v11, "setTitle:", v18);
  objc_msgSend(v12, "objectForInfoDictionaryKey:", CFSTR("NSVideoSubscriberAccountUsageDescription"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v45 = v14;
  if (v19)
  {
    v21 = v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = (void *)MEMORY[0x1E0C99DA0];
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpectedly, usageValue was %@, instead of NSString."), v24);

      }
      v25 = v21;
      if (!a6)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED_PROVIDER_MESSAGE_FORMAT"), 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v27, v60[5]);
        v28 = objc_claimAutoreleasedReturnValue();

        v25 = (id)v28;
      }
      -[VSUserNotificationOperation setMessage:](v11, "setMessage:", v25);
      objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("PRIVACY_ALLOW_ACCESS_BUTTON_TITLE"), 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSUserNotificationOperation setDefaultButtonTitle:](v11, "setDefaultButtonTitle:", v30);

      objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("PRIVACY_DENY_ACCESS_BUTTON_TITLE"), 0, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSUserNotificationOperation setAlternateButtonTitle:](v11, "setAlternateButtonTitle:", v32);

      v33 = (void *)MEMORY[0x1E0CB34C8];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2;
      v53[3] = &unk_1E939FEF0;
      v34 = v11;
      v54[0] = v34;
      v54[1] = self;
      v35 = *(_OWORD *)&v42->var0[4];
      v56 = *(_OWORD *)v42->var0;
      v57 = v35;
      v55 = v46;
      objc_msgSend(v33, "blockOperationWithBlock:", v53);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addDependency:", v34);
      -[VSPrivacyFacade privateQueue](self, "privateQueue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addOperation:", v34);
      objc_msgSend(v37, "addOperation:", v36);
      v38 = (id *)v54;

      v39 = v46;
    }
    else
    {
      VSPrivateAccessUsageDescriptionMissing();
      v39 = v46;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v15;
      v50[1] = 3221225472;
      v50[2] = __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_36;
      v50[3] = &unk_1E939F1A8;
      v52 = v46;
      v25 = v41;
      v51 = v25;
      VSPerformCompletionHandler(v50);
      v38 = &v52;

    }
  }
  else
  {
    VSPrivateAccessUsageDescriptionMissing();
    v39 = v46;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v15;
    v47[1] = 3221225472;
    v47[2] = __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_3;
    v47[3] = &unk_1E939F1A8;
    v49 = v46;
    v21 = v40;
    v48 = v21;
    VSPerformCompletionHandler(v47);

    v25 = v49;
  }

  _Block_object_dispose(&v59, 8);
}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  VSDisplayNameForBundleWithIdentifier(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  __int128 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  __int128 v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  uint8_t buf[16];
  __int128 v32;

  switch(objc_msgSend(*(id *)(a1 + 32), "response"))
  {
    case 0:
    case 3:
      VSPublicError(0, 2, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 1:
      VSDefaultLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Will grant access.", buf, 2u);
      }

      v5 = *(void **)(a1 + 40);
      v6 = *(_OWORD *)(a1 + 72);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 56);
      v32 = v6;
      if (objc_msgSend(v5, "setAccessGranted:forAuditToken:", 1, buf))
      {
        VSDefaultLogObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Did grant access.", buf, 2u);
        }
      }
      else
      {
        VSErrorLogObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_cold_1(v7, v12, v13, v14, v15, v16, v17, v18);
      }

      v2 = 0;
      v3 = 1;
      break;
    case 2:
      VSPrivateError(-11, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      VSDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Will deny access.", buf, 2u);
      }

      v9 = *(void **)(a1 + 40);
      v10 = *(_OWORD *)(a1 + 72);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 56);
      v32 = v10;
      if (objc_msgSend(v9, "setAccessGranted:forAuditToken:", 0, buf))
      {
        VSDefaultLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Did deny access.", buf, 2u);
        }
      }
      else
      {
        VSErrorLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_cold_2(v11, v19, v20, v21, v22, v23, v24, v25);
      }

      v3 = 2;
      break;
    default:
      v2 = 0;
LABEL_4:
      v3 = 0;
      break;
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_34;
  v27[3] = &unk_1E939FEC8;
  v29 = *(id *)(a1 + 48);
  v30 = v3;
  v28 = v2;
  v26 = v2;
  VSPerformCompletionHandler(v27);

}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_34(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = a1[5];
  v1 = a1[6];
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", a1[4]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_36(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (BOOL)isAccessGrantedForBundle:(__CFBundle *)a3
{
  return -[VSPrivacyFacade isAccessGrantedForBundleID:](self, "isAccessGrantedForBundleID:", CFBundleGetIdentifier(a3));
}

- (BOOL)isAccessGrantedForBundleID:(id)a3
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const void **v9;
  const __CFDictionary *ValueAtIndex;
  const __CFString *Value;
  BOOL v12;
  const __CFBoolean *v13;

  v4 = (const __CFArray *)TCCAccessCopyInformationForBundleId();
  if (!v4)
    return 0;
  v5 = v4;
  Count = CFArrayGetCount(v4);
  if (Count < 1)
  {
LABEL_6:
    v12 = 0;
  }
  else
  {
    v7 = Count;
    v8 = 0;
    v9 = (const void **)MEMORY[0x1E0DB10B8];
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
      Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, *v9);
      if (CFStringCompare(Value, (CFStringRef)-[VSPrivacyFacade service](self, "service"), 0) == kCFCompareEqualTo)
        break;
      if (v7 == ++v8)
        goto LABEL_6;
    }
    v13 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E0DB10A8]);
    v12 = CFBooleanGetValue(v13) != 0;
  }
  CFRelease(v5);
  return v12;
}

- (BOOL)setAccessGranted:(BOOL)a3 forBundle:(__CFBundle *)a4
{
  return -[VSPrivacyFacade setAccessGranted:forBundleID:](self, "setAccessGranted:forBundleID:", a3, CFBundleGetIdentifier(a4));
}

- (BOOL)setAccessGranted:(BOOL)a3 forBundleID:(id)a4
{
  id v5;
  int v6;

  v5 = a4;
  -[VSPrivacyFacade service](self, "service");
  v6 = TCCAccessSetForBundleId();

  return v6 != 0;
}

- (NSArray)knownAppBundles
{
  id v3;
  id v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const void **v10;
  const __CFDictionary *ValueAtIndex;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE value[12];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VSPrivacyFacade service](self, "service");
  v5 = (const __CFArray *)TCCAccessCopyInformation();
  if (v5)
  {
    v6 = v5;
    Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      v8 = Count;
      v9 = 0;
      v10 = (const void **)MEMORY[0x1E0DB1098];
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v9);
        *(_QWORD *)value = 0;
        if (CFDictionaryGetValueIfPresent(ValueAtIndex, *v10, (const void **)value))
        {
          CFBundleGetIdentifier(*(CFBundleRef *)value);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
        ++v9;
      }
      while (v8 != v9);
    }
    CFRelease(v6);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        VSDisplayNameForBundleWithIdentifier(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v16);
  }

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __34__VSPrivacyFacade_knownAppBundles__block_invoke;
  v35[3] = &unk_1E939FF18;
  v30 = v13;
  v36 = v30;
  objc_msgSend(v14, "sortUsingComparator:", v35);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = v14;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v3, "addObject:", v27);
        }
        else
        {
          VSErrorLogObject();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)value = 138412290;
            *(_QWORD *)&value[4] = v26;
            _os_log_fault_impl(&dword_1D2419000, v28, OS_LOG_TYPE_FAULT, "No bundle for %@", value, 0xCu);
          }

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    }
    while (v23);
  }

  return (NSArray *)v3;
}

uint64_t __34__VSPrivacyFacade_knownAppBundles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The bundleCache[bundleID1] parameter must not be nil."));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The bundleCache[bundleID2] parameter must not be nil."));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "localizedCompare:", v10);

  return v11;
}

- (BOOL)reset
{
  void *v3;

  -[VSPrivacyFacade voucherLockbox](self, "voucherLockbox");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllVouchers");

  -[VSPrivacyFacade service](self, "service");
  return TCCAccessReset() != 0;
}

- (VSPrivacyVoucherLockbox)voucherLockbox
{
  return self->_voucherLockbox;
}

- (void)setVoucherLockbox:(id)a3
{
  objc_storeStrong((id *)&self->_voucherLockbox, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_voucherLockbox, 0);
}

- (void)preflightCheckForProcessIdentifier:(int)a1 withCompletionHandler:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "No known bundle url for PID %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_0();
}

- (void)preflightCheckForProcessIdentifier:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Unable to get bundle for URL %@", a5, a6, a7, a8, 2u);
}

- (void)preflightCheckForProcessIdentifier:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "No known TCC info for bundle %@", a5, a6, a7, a8, 2u);
}

- (void)preflightCheckForProcessIdentifier:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "No TCC status for service.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "Failed to grant access.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "Failed to deny access.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
