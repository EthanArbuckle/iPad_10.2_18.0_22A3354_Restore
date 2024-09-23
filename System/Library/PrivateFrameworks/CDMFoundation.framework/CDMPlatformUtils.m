@implementation CDMPlatformUtils

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_10146);
  return isInternalInstall_isInternalBuild;
}

+ (id)normalizedAssistantLocaleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CDMPlatformUtils normalizeLocaleIdentifier:](CDMPlatformUtils, "normalizeLocaleIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)normalizeLocaleIdentifier:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
}

+ (BOOL)isAppleTV
{
  return 0;
}

+ (BOOL)isHomePod
{
  return 0;
}

+ (id)prettyPrintJson:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v10;
  id v11;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 4, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed to convert json:%@"), v7);
    v8 = 0;
  }
  else
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 1, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
  }

  return v8;
}

+ (id)prettyPrintError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      objc_msgSend(v4, "localizedRecoverySuggestion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(v4, "localizedDescription");
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
    }
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedFailureReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedRecoverySuggestion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("{Description: %@, Failure Reason: %@, Recovery Suggestion: %@}"), v9, v10, v11);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("(no error)");
  }
LABEL_7:

  return v6;
}

uint64_t __37__CDMPlatformUtils_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  isInternalInstall_isInternalBuild = result;
  return result;
}

@end
