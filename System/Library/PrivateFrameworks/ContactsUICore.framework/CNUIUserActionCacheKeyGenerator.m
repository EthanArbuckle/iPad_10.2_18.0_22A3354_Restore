@implementation CNUIUserActionCacheKeyGenerator

+ (id)keyForContact:(id)a3 actionType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a1, "handlesForActionType:contact:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13B90], "Trim");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_map:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "descriptionOfActionType:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v11, "appendString:", v12);

    -[__CFString appendString:](v11, "appendString:", CFSTR("["));
    -[__CFString appendString:](v11, "appendString:", v10);
    -[__CFString appendString:](v11, "appendString:", CFSTR("]"));

  }
  else
  {
    v11 = &stru_1EA606688;
  }

  return v11;
}

+ (id)handlesForActionType:(id)a3 contact:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "propertiesForActionType:", v8);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v6, "phoneNumbers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fingerprintOfPhoneNumbers:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObjectsFromArray:", v15);
    if ((v10 & 2) == 0)
    {
LABEL_3:
      if ((v10 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v6, "emailAddresses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fingerprintOfEmailAddresses:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v17);
  if ((v10 & 4) == 0)
  {
LABEL_4:
    if ((v10 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v6, "socialProfiles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fingerprintOfSocialProfiles:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObjectsFromArray:", v21);
    if ((v10 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v6, "postalAddresses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fingerprintOfPostalAddresses:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v19);
  if ((v10 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v10 & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend(v6, "instantMessageAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fingerprintOfInstantMessageAddresses:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObjectsFromArray:", v12);
  }
LABEL_7:

  return v9;
}

+ (unint64_t)propertiesForActionType:(id)a3
{
  id v3;
  unint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend((id)*MEMORY[0x1E0C96618], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    if ((objc_msgSend((id)*MEMORY[0x1E0C96620], "isEqualToString:", v3) & 1) == 0
      && (objc_msgSend((id)*MEMORY[0x1E0C965F8], "isEqualToString:", v3) & 1) == 0
      && (objc_msgSend((id)*MEMORY[0x1E0C96658], "isEqualToString:", v3) & 1) == 0)
    {
      if ((objc_msgSend((id)*MEMORY[0x1E0C96638], "isEqualToString:", v3) & 1) != 0
        || (objc_msgSend((id)*MEMORY[0x1E0C96648], "isEqualToString:", v3) & 1) != 0)
      {
        v4 = 1;
        goto LABEL_7;
      }
      if ((objc_msgSend((id)*MEMORY[0x1E0C96630], "isEqualToString:", v3) & 1) != 0)
      {
        v4 = 3;
        goto LABEL_7;
      }
      if ((objc_msgSend((id)*MEMORY[0x1E0C96608], "isEqualToString:", v3) & 1) != 0)
      {
        v4 = 4;
        goto LABEL_7;
      }
      if ((objc_msgSend((id)*MEMORY[0x1E0C96610], "isEqualToString:", v3) & 1) == 0)
      {
        v6 = (void *)MEMORY[0x1E0C99DA0];
        v7 = *MEMORY[0x1E0C99768];
        v10 = CFSTR("action-type");
        v11[0] = v3;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("CNActionType not handled"), v8);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v9);
      }
    }
    v4 = 27;
  }
LABEL_7:

  return v4;
}

+ (id)descriptionOfActionType:(id)a3
{
  id v3;
  __CFString *v4;
  NSObject *v5;

  v3 = a3;
  if ((objc_msgSend((id)*MEMORY[0x1E0C96618], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = CFSTR("Mail");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0C96620], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = CFSTR("Message");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0C965F8], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = CFSTR("AudioCall");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0C96658], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = CFSTR("VideoCall");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0C96638], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = CFSTR("TTY");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0C96648], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = CFSTR("TTYRelay");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0C96630], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = CFSTR("Pay");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0C96608], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = CFSTR("Directions");
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0C96610], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = CFSTR("Expanse");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[CNUIUserActionCacheKeyGenerator descriptionOfActionType:].cold.1((uint64_t)v3, v5);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownActionType(%@)"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)fingerprintOfSocialProfiles:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C97338];
  v4 = a3;
  objc_msgSend(v3, "Value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C973E8], "Username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_compactMap:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_cn_distinctObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13B90], "IsNotEmpty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_filter:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)fingerprintOfInstantMessageAddresses:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C97338];
  v4 = a3;
  objc_msgSend(v3, "Value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97330], "Username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_compactMap:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_cn_distinctObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13B90], "IsNotEmpty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_filter:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)fingerprintOfPhoneNumbers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C97338];
  v4 = a3;
  objc_msgSend(v3, "Value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97398], "StringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_map:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_cn_distinctObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13B90], "IsNotEmpty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_filter:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)fingerprintOfEmailAddresses:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C97338];
  v4 = a3;
  objc_msgSend(v3, "Value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_cn_distinctObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13B90], "IsNotEmpty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_filter:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1)
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_5);
  return (id)os_log_cn_once_object_1;
}

void __41__CNUIUserActionCacheKeyGenerator_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "user-actions-cache-key-generator");
  v1 = (void *)os_log_cn_once_object_1;
  os_log_cn_once_object_1 = (uint64_t)v0;

}

+ (id)fingerprintOfPostalAddresses:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C97098];
  v21[0] = *MEMORY[0x1E0C970C8];
  v21[1] = v3;
  v4 = *MEMORY[0x1E0C970B0];
  v21[2] = *MEMORY[0x1E0C970C0];
  v21[3] = v4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v21, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97338], "Value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_map:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_cn_distinctObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __64__CNUIUserActionCacheKeyGenerator_fingerprintOfPostalAddresses___block_invoke;
  v19 = &unk_1EA6034A8;
  v20 = v7;
  v11 = v7;
  objc_msgSend(v10, "_cn_flatMap:", &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13B90], "IsNotEmpty", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_cn_filter:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __64__CNUIUserActionCacheKeyGenerator_fingerprintOfPostalAddresses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CNUIUserActionCacheKeyGenerator_fingerprintOfPostalAddresses___block_invoke_2;
  v8[3] = &unk_1EA603480;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "_cn_compactMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __64__CNUIUserActionCacheKeyGenerator_fingerprintOfPostalAddresses___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

+ (void)descriptionOfActionType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1DD140000, a2, OS_LOG_TYPE_FAULT, "Generating cache key for unknown action type: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
