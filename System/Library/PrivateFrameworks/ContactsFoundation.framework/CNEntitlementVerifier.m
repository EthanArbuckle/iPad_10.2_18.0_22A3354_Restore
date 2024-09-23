@implementation CNEntitlementVerifier

- (BOOL)currentProcessHasArrayWithStringValue:(id)a3 forAnyEntitlement:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  SecTaskRef v10;
  SecTaskRef v11;
  BOOL v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v10)
  {
    v11 = v10;
    v12 = -[CNEntitlementVerifier secTask:hasArrayWithStringValue:forAnyEntitlement:error:](self, "secTask:hasArrayWithStringValue:forAnyEntitlement:error:", v10, v8, v9, a5);
    CFRelease(v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a5)
      *a5 = objc_retainAutorelease(v13);

    v12 = 0;
  }

  return v12;
}

- (BOOL)secTask:(__SecTask *)a3 hasArrayWithStringValue:(id)a4 forAnyEntitlement:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  __SecTask *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__CNEntitlementVerifier_secTask_hasArrayWithStringValue_forAnyEntitlement_error___block_invoke;
  v15[3] = &unk_1E29B8E88;
  v17 = &v19;
  v18 = a3;
  v11 = v9;
  v16 = v11;
  v12 = objc_msgSend(v10, "_cn_any:", v15);
  v13 = (void *)v20[5];
  if (v13)
  {
    v12 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v13);
  }

  _Block_object_dispose(&v19, 8);
  return v12;
}

uint64_t __81__CNEntitlementVerifier_secTask_hasArrayWithStringValue_forAnyEntitlement_error___block_invoke(uint64_t a1, const __CFString *a2)
{
  void *v3;
  uint64_t v4;
  __CFError *v5;
  void *v6;
  uint64_t v7;
  CFErrorRef error;

  error = 0;
  v3 = (void *)SecTaskCopyValueForEntitlement(*(SecTaskRef *)(a1 + 48), a2, &error);
  if (error)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = objc_retainAutorelease(error);
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;

    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));
  }

  return v7;
}

- (BOOL)auditToken:(id *)a3 hasArrayWithStringValue:(id)a4 forAnyEntitlement:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  __int128 v12;
  SecTaskRef v13;
  SecTaskRef v14;
  BOOL v15;
  void *v16;
  void *v17;
  audit_token_t v19;

  v10 = a4;
  v11 = a5;
  v12 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v19.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v19.val[4] = v12;
  v13 = SecTaskCreateWithAuditToken(0, &v19);
  if (v13)
  {
    v14 = v13;
    v15 = -[CNEntitlementVerifier secTask:hasArrayWithStringValue:forAnyEntitlement:error:](self, "secTask:hasArrayWithStringValue:forAnyEntitlement:error:", v13, v10, v11, a6);
    CFRelease(v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a6)
      *a6 = objc_retainAutorelease(v16);

    v15 = 0;
  }

  return v15;
}

- (BOOL)auditToken:(id *)a3 hasBooleanEntitlement:(id)a4 error:(id *)a5
{
  id v8;
  __int128 v9;
  SecTaskRef v10;
  SecTaskRef v11;
  BOOL v12;
  void *v13;
  void *v14;
  audit_token_t v16;

  v8 = a4;
  v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v16.val[4] = v9;
  v10 = SecTaskCreateWithAuditToken(0, &v16);
  if (v10)
  {
    v11 = v10;
    v12 = -[CNEntitlementVerifier secTask:hasBooleanEntitlement:error:](self, "secTask:hasBooleanEntitlement:error:", v10, v8, a5);
    CFRelease(v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a5)
      *a5 = objc_retainAutorelease(v13);

    v12 = 0;
  }

  return v12;
}

- (BOOL)currentProcessHasBooleanEntitlement:(id)a3 error:(id *)a4
{
  id v6;
  SecTaskRef v7;
  SecTaskRef v8;
  BOOL v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v7)
  {
    v8 = v7;
    v9 = -[CNEntitlementVerifier secTask:hasBooleanEntitlement:error:](self, "secTask:hasBooleanEntitlement:error:", v7, v6, a4);
    CFRelease(v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);

    v9 = 0;
  }

  return v9;
}

- (BOOL)secTask:(__SecTask *)a3 hasBooleanEntitlement:(id)a4 error:(id *)a5
{
  void *v6;
  char v7;
  CFErrorRef error;

  error = 0;
  v6 = (void *)SecTaskCopyValueForEntitlement(a3, (CFStringRef)a4, &error);
  if (a5)
    *a5 = error;
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)auditToken:(id *)a3 isFirstOrSecondPartyWithError:(id *)a4
{
  const __CFAllocator *v6;
  __int128 v7;
  SecTaskRef v8;
  SecTaskRef v9;
  BOOL v10;
  void *v11;
  void *v12;
  audit_token_t v14;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v14.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v14.val[4] = v7;
  v8 = SecTaskCreateWithAuditToken(v6, &v14);
  if (v8)
  {
    v9 = v8;
    v10 = -[CNEntitlementVerifier secTask:isFirstOrSecondPartyWithError:](self, "secTask:isFirstOrSecondPartyWithError:", v8, a4);
    CFRelease(v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);

    return 0;
  }
  return v10;
}

- (BOOL)secTask:(__SecTask *)a3 isFirstOrSecondPartyWithError:(id *)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  char v8;

  v5 = (__CFString *)SecTaskCopySigningIdentifier(a3, 0);
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a4)
      *a4 = objc_retainAutorelease(v6);

    v8 = 0;
  }
  else
  {
    v8 = -[__CFString hasPrefix:](v5, "hasPrefix:", CFSTR("com.apple."));
  }

  return v8;
}

- (id)valuesForCurrentProcessForEntitlements:(id)a3 error:(id *)a4
{
  id v6;
  SecTaskRef v7;
  SecTaskRef v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v7)
  {
    v8 = v7;
    -[CNEntitlementVerifier secTask:valuesForEntitlements:error:](self, "secTask:valuesForEntitlements:error:", v7, v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);

    v9 = 0;
  }

  return v9;
}

- (id)valuesForAuditToken:(id *)a3 forEntitlements:(id)a4 error:(id *)a5
{
  id v8;
  __int128 v9;
  SecTaskRef v10;
  SecTaskRef v11;
  void *v12;
  void *v13;
  void *v14;
  audit_token_t v16;

  v8 = a4;
  v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v16.val[4] = v9;
  v10 = SecTaskCreateWithAuditToken(0, &v16);
  if (v10)
  {
    v11 = v10;
    -[CNEntitlementVerifier secTask:valuesForEntitlements:error:](self, "secTask:valuesForEntitlements:error:", v10, v8, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a5)
      *a5 = objc_retainAutorelease(v13);

    v12 = 0;
  }

  return v12;
}

- (id)secTask:(__SecTask *)a3 valuesForEntitlements:(id)a4 error:(id *)a5
{
  const __CFArray *v7;
  const __CFArray *v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  CFErrorRef error;

  v7 = (const __CFArray *)a4;
  v8 = v7;
  if (-[__CFArray containsObject:](v7, "containsObject:", CFSTR("com.apple.private.contacts")))
  {
    -[__CFArray arrayByAddingObject:](v7, "arrayByAddingObject:", CFSTR("com.apple.private.contactsui"));
    v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  }
  error = 0;
  v9 = SecTaskCopyValuesForEntitlements(a3, v8, &error);
  v10 = v9;
  if (a5)
  {
    *a5 = error;
  }
  else if (!v9)
  {
    v10 = (CFDictionaryRef)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

- (BOOL)currentProcessIsFirstOrSecondPartyWithError:(id *)a3
{
  SecTaskRef v5;
  SecTaskRef v6;
  BOOL v7;
  void *v9;
  void *v10;

  v5 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v5)
  {
    v6 = v5;
    v7 = -[CNEntitlementVerifier secTask:isFirstOrSecondPartyWithError:](self, "secTask:isFirstOrSecondPartyWithError:", v5, a3);
    CFRelease(v6);
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a3)
      *a3 = objc_retainAutorelease(v9);

    return 0;
  }
}

- (BOOL)auditToken:(id *)a3 allowsHighPriorityWithError:(id *)a4
{
  const __CFAllocator *v6;
  __int128 v7;
  SecTaskRef v8;
  SecTaskRef v9;
  BOOL v10;
  void *v11;
  void *v12;
  audit_token_t v14;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v14.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v14.val[4] = v7;
  v8 = SecTaskCreateWithAuditToken(v6, &v14);
  if (v8)
  {
    v9 = v8;
    v10 = -[CNEntitlementVerifier secTask:allowsHighPriorityWithError:](self, "secTask:allowsHighPriorityWithError:", v8, a4);
    CFRelease(v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);

    return 0;
  }
  return v10;
}

- (BOOL)secTask:(__SecTask *)a3 allowsHighPriorityWithError:(id *)a4
{
  __CFString *v6;
  void *v7;
  id v8;
  char v9;

  v6 = (__CFString *)SecTaskCopySigningIdentifier(a3, 0);
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v6))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a4)
    {
      v8 = objc_retainAutorelease(v7);
      v9 = 0;
      *a4 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    -[CNEntitlementVerifier highPriorityBundleIdentifiers](self, "highPriorityBundleIdentifiers");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);
  }

  return v9;
}

- (id)highPriorityBundleIdentifiers
{
  if (highPriorityBundleIdentifiers_cn_once_token_1 != -1)
    dispatch_once(&highPriorityBundleIdentifiers_cn_once_token_1, &__block_literal_global_4);
  return (id)highPriorityBundleIdentifiers_cn_once_object_1;
}

void __54__CNEntitlementVerifier_highPriorityBundleIdentifiers__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.telephonyutilities.callservicesd");
  v4[1] = CFSTR("com.apple.TelephonyUtilities");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)highPriorityBundleIdentifiers_cn_once_object_1;
  highPriorityBundleIdentifiers_cn_once_object_1 = v2;

}

@end
