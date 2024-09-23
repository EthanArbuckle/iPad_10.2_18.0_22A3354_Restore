@implementation CNEmailAddressUtilities

+ (id)safeUserVisibleEmailAddress:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("@"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
  }
  else
  {
    v6 = v4 + 1;
    objc_msgSend(v3, "substringFromIndex:", v4 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_lp_userVisibleHost");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(v3, "substringToIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", v8);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

+ (BOOL)isStringEmailAddress:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CNEmailAddressUtilities_isStringEmailAddress___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isStringEmailAddress__cn_once_token_1 != -1)
    dispatch_once(&isStringEmailAddress__cn_once_token_1, block);
  if (isStringEmailAddress__cn_once_object_1)
  {
    v5 = (id)isStringEmailAddress__cn_once_object_1;
    v6 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 4, 0, objc_msgSend(v4, "length"));

    v7 = v6 == 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __48__CNEmailAddressUtilities_isStringEmailAddress___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeEmailRegex");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isStringEmailAddress__cn_once_object_1;
  isStringEmailAddress__cn_once_object_1 = v1;

}

+ (id)makeEmailRegex
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;

  v6 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}+$"), 1, &v6);
  v3 = v6;
  if (!v2)
  {
    +[CNLogging sdkBreakageLog](CNLogging, "sdkBreakageLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[CNEmailAddressUtilities makeEmailRegex].cold.1((uint64_t)v3, v4);

  }
  return v2;
}

+ (id)expandAliasedDomainsInAddress:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id obj;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v3))
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend((id)objc_opt_class(), "aliasedDomains");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      v8 = MEMORY[0x1E0C809B0];
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
          v19[0] = v8;
          v19[1] = 3221225472;
          v19[2] = __57__CNEmailAddressUtilities_expandAliasedDomainsInAddress___block_invoke;
          v19[3] = &unk_1E29BC280;
          v11 = v3;
          v20 = v11;
          objc_msgSend(v10, "_cn_firstObjectPassingTest:", v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = v12;
            objc_msgSend(v11, "substringWithRange:", 0, objc_msgSend(v11, "length") - objc_msgSend(v12, "length"));
            v17[0] = v8;
            v17[1] = 3221225472;
            v17[2] = __57__CNEmailAddressUtilities_expandAliasedDomainsInAddress___block_invoke_2;
            v17[3] = &unk_1E29BC2A8;
            v18 = (id)objc_claimAutoreleasedReturnValue();
            v14 = v18;
            objc_msgSend(v10, "_cn_map:", v17);
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v6)
          continue;
        break;
      }
    }

    v25 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v4;
}

uint64_t __57__CNEmailAddressUtilities_expandAliasedDomainsInAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cn_hasSuffix:", a2);
}

uint64_t __57__CNEmailAddressUtilities_expandAliasedDomainsInAddress___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", a2);
}

+ (id)aliasedDomains
{
  return &unk_1E29F00A0;
}

+ (void)makeEmailRegex
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18F80C000, a2, OS_LOG_TYPE_ERROR, "Error creating email address regex: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
