@implementation NSError

uint64_t __49__NSError_MSErrorUtilities__MSMMCSRetryAfterDate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  __CFString *v7;
  uint64_t DateFromString;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D46750]);

  if (v5)
  {
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("Retry-After"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 1;
      goto LABEL_13;
    }
    if (kMSErrorIsPrimaryKey_block_invoke_onceToken != -1)
      dispatch_once(&kMSErrorIsPrimaryKey_block_invoke_onceToken, &__block_literal_global_714);
    DateFromString = (uint64_t)CFDateFormatterCreateDateFromString(0, (CFDateFormatterRef)kMSErrorIsPrimaryKey_block_invoke_formatter, v7, 0);
    if (!DateFromString)
    {
      v9 = -[__CFString intValue](v7, "intValue");
      if (v9 < 1)
      {
LABEL_10:
        v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)v9);
      DateFromString = objc_claimAutoreleasedReturnValue();
    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = DateFromString;

    goto LABEL_10;
  }
  v12 = 1;
LABEL_14:

  return v12;
}

void __49__NSError_MSErrorUtilities__MSMMCSRetryAfterDate__block_invoke_2()
{
  __CFDateFormatter *v0;

  v0 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  kMSErrorIsPrimaryKey_block_invoke_formatter = (uint64_t)v0;
  if (v0)
    CFDateFormatterSetProperty(v0, (CFStringRef)*MEMORY[0x1E0C9AEF8], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
}

uint64_t __43__NSError_MSErrorUtilities__MSIsQuotaError__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = 1;
    if (objc_msgSend(v3, "code") == 3)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __60__NSError_MSErrorUtilities__MSContainsErrorWithDomain_code___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", a1[4]))
  {
    v5 = objc_msgSend(v3, "code");
    v6 = a1[6];

    v7 = 1;
    if (v5 == v6)
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      v7 = 0;
    }
  }
  else
  {

    v7 = 1;
  }

  return v7;
}

uint64_t __46__NSError_MSErrorUtilities__MSIsBadTokenError__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D46750]);

  if (v5)
  {
    if (objc_msgSend(v3, "code") == 14)
    {
LABEL_7:
      v8 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("MSSubscribeStorageProtocolErrorDomain"));

    if (v7 && !objc_msgSend(v3, "code"))
      goto LABEL_7;
  }
  v8 = 1;
LABEL_8:

  return v8;
}

uint64_t __42__NSError_MSErrorUtilities__MSIsAuthError__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D46750]);

  if (!v5)
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C930A8]);

    if (v8)
    {
      v9 = objc_msgSend(v3, "code");
      if (v9 == -1012 || v9 == 401 || v9 == 330)
      {
        v6 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        goto LABEL_10;
      }
    }
LABEL_9:
    v6 = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "code") != 15)
    goto LABEL_9;
  v6 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
LABEL_10:

  return v6;
}

unint64_t __38__NSError_MSErrorUtilities__MSIsFatal__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C930A8]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    if ((unint64_t)(v6 - 500) >= 0xFFFFFFFFFFFFFF9CLL)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = 0;
      *(_BYTE *)(v7 + 24) = v6 != 401;
      goto LABEL_11;
    }
LABEL_9:
    v8 = 1;
    goto LABEL_11;
  }
  objc_msgSend(v3, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D46750]);

  if (!v10)
    goto LABEL_9;
  v11 = objc_msgSend(v3, "code");
  v8 = 1;
  if (v11 <= 0x27 && ((1 << v11) & 0x8810001904) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    v8 = (0x77EFFFE6FBuLL >> v11) & 1;
  }
LABEL_11:

  return v8;
}

uint64_t __40__NSError_MSErrorUtilities__MSIsCounted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C930A8]);

  if (v5)
  {
    if (objc_msgSend(v3, "code") != 503)
    {
LABEL_7:
      v8 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D46750]);

    if (!v7 || objc_msgSend(v3, "code") != 16)
      goto LABEL_7;
  }
  v8 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
LABEL_8:

  return v8;
}

uint64_t __43__NSError_MSErrorUtilities__MSNeedsBackoff__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  unint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C930A8]);

  if (v5)
  {
    v6 = 1;
    if ((unint64_t)(objc_msgSend(v3, "code") - 600) >= 0xFFFFFFFFFFFFFF9CLL)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v6 = 0;
    }
  }
  else
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D46750]);

    if (v8)
    {
      v9 = objc_msgSend(v3, "code");
      v6 = 1;
      if (v9 <= 0x17 && ((1 << v9) & 0x810040) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        v6 = (0x7EFFBFu >> v9) & 1;
      }
    }
    else
    {
      v6 = 1;
    }
  }

  return v6;
}

uint64_t __54__NSError_MSErrorUtilities__MSIsTemporaryNetworkError__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C930A8]);

  if (!v5)
  {
    objc_msgSend(v3, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D46750]);

    if (v9)
    {
      v10 = objc_msgSend(v3, "code");
      v7 = 1;
      if (v10 > 0x26)
        goto LABEL_19;
      v11 = 1 << v10;
      v12 = 0x400000002ALL;
    }
    else
    {
      objc_msgSend(v3, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

      if (!v14)
      {
        v7 = 1;
        goto LABEL_19;
      }
      v15 = objc_msgSend(v3, "code");
      v7 = 1;
      if ((unint64_t)(v15 - 22) > 0x2B)
        goto LABEL_19;
      v11 = 1 << (v15 - 22);
      v12 = 0xCC978000401;
    }
    if ((v11 & v12) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  v6 = objc_msgSend(v3, "code");
  v7 = 1;
  if (v6 <= -1010)
  {
    if ((unint64_t)(v6 + 1206) >= 7 && v6 != -73000 && v6 != -2000)
      goto LABEL_19;
LABEL_18:
    v7 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_19;
  }
  if ((unint64_t)(v6 + 1009) <= 8 && ((1 << (v6 - 15)) & 0x179) != 0
    || (unint64_t)(v6 - 1) < 2)
  {
    goto LABEL_18;
  }
LABEL_19:

  return v7;
}

uint64_t __38__NSError_MMCSKit__MMCSRetryAfterDate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  __CFString *v7;
  uint64_t DateFromString;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D46750]);

  if (v5)
  {
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("Retry-After"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 1;
      goto LABEL_13;
    }
    if (kMMCSKitErrorDomain_block_invoke_onceToken != -1)
      dispatch_once(&kMMCSKitErrorDomain_block_invoke_onceToken, &__block_literal_global_13);
    DateFromString = (uint64_t)CFDateFormatterCreateDateFromString(0, (CFDateFormatterRef)kMMCSKitErrorDomain_block_invoke_formatter, v7, 0);
    if (!DateFromString)
    {
      v9 = -[__CFString intValue](v7, "intValue");
      if (v9 < 1)
      {
LABEL_10:
        v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)v9);
      DateFromString = objc_claimAutoreleasedReturnValue();
    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = DateFromString;

    goto LABEL_10;
  }
  v12 = 1;
LABEL_14:

  return v12;
}

void __38__NSError_MMCSKit__MMCSRetryAfterDate__block_invoke_2()
{
  __CFDateFormatter *v0;

  v0 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  kMMCSKitErrorDomain_block_invoke_formatter = (uint64_t)v0;
  if (v0)
    CFDateFormatterSetProperty(v0, (CFStringRef)*MEMORY[0x1E0C9AEF8], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
}

unint64_t __36__NSError_MMCSKit__MMCSIsFatalError__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  unint64_t v6;
  unint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D46750]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    v7 = 1;
    if (v6 <= 0x27 && ((1 << v6) & 0x8810001904) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v7 = (0x77EFFFE6FBuLL >> v6) & 1;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __44__NSError_MMCSKit__MMCSIsAuthorizationError__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D46750]);

  if (v5)
  {
    v6 = 1;
    if ((unint64_t)(objc_msgSend(v3, "code") - 15) >= 0xFFFFFFFFFFFFFFFELL)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __48__NSError_MMCSKit__MMCSIsNetworkConditionsError__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C930A8]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    v7 = 1;
    if (v6 > 0)
    {
      if ((unint64_t)(v6 - 1) >= 2)
        goto LABEL_19;
    }
    else if (((unint64_t)(v6 + 1009) > 8 || ((1 << (v6 - 15)) & 0x179) == 0)
           && v6 != -73000
           && v6 != -2000)
    {
      goto LABEL_19;
    }
LABEL_18:
    v7 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_19;
  }
  objc_msgSend(v3, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D46750]);

  if (v9)
  {
    v10 = objc_msgSend(v3, "code");
    v7 = 1;
    if (v10 > 0x26)
      goto LABEL_19;
    v11 = 1 << v10;
    v12 = 0x400000002ALL;
    goto LABEL_14;
  }
  objc_msgSend(v3, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

  if (!v14)
  {
    v7 = 1;
    goto LABEL_19;
  }
  v15 = objc_msgSend(v3, "code");
  v7 = 1;
  if ((unint64_t)(v15 - 22) <= 0x2B)
  {
    v11 = 1 << (v15 - 22);
    v12 = 0xCC978000401;
LABEL_14:
    if ((v11 & v12) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_19:

  return v7;
}

uint64_t __37__NSError_MMCSKit__MMCSIsCancelError__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D46750]);

  if (v5)
  {
    v6 = 1;
    if (objc_msgSend(v3, "code") == 4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void __57__NSError_MMCSKit__MMCSErrorWithDomain_code_description___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MMCSErrorWithDomain_code_description__MMCSKitBundle;
  MMCSErrorWithDomain_code_description__MMCSKitBundle = v0;

}

@end
