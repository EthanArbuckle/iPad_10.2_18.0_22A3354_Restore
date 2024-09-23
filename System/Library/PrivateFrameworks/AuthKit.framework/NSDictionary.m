@implementation NSDictionary

void __47__NSDictionary_AuthKit___ak_truncateTokenDict___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_ak_shortenServiceIdentifier:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_ak_truncateTokenString:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;

    goto LABEL_6;
  }
  objc_opt_class();
  v8 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "ak_redactedCopy");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v6);

}

__CFString *__40__NSDictionary_AuthKit__ak_redactedCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  int v18;

  v5 = a2;
  v6 = a3;
  +[AKAppleIDAuthenticationController sensitiveAuthenticationKeys](AKAppleIDAuthenticationController, "sensitiveAuthenticationKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (!v8)
  {
    +[AKAppleIDAuthenticationController sensitiveTokenKeys](AKAppleIDAuthenticationController, "sensitiveTokenKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v5);

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "_ak_truncateTokenString:", v6);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AKAppleIDAuthenticationController tokenDictionaryKeys](AKAppleIDAuthenticationController, "tokenDictionaryKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", v5);

      if (v18)
      {
        objc_msgSend(*(id *)(a1 + 32), "_ak_truncateTokenDict:", v6);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = (__CFString *)v6;
      }
    }
LABEL_15:
    v12 = v15;
    goto LABEL_16;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("AKPassword")))
  {
    v16 = CFSTR("(******)");
    if (!v6)
      v16 = CFSTR("(null)");
    v15 = v16;
    goto LABEL_15;
  }
  v9 = v6;
  if ((unint64_t)objc_msgSend(v9, "length") < 5)
  {
    v12 = CFSTR("(******)");
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v9, "length") - 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("(...%@)"), v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_16:

  return v12;
}

@end
