@implementation NSString(ITMLKit)

- (id)ik_sharedInstance
{
  id v2;
  void *v3;

  if (ik_sharedInstance_onceToken != -1)
    dispatch_once(&ik_sharedInstance_onceToken, &__block_literal_global_13);
  v2 = (id)sSharedStrings;
  objc_sync_enter(v2);
  objc_msgSend((id)sSharedStrings, "objectForKeyedSubscript:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(a1, "copy");
    objc_msgSend((id)sSharedStrings, "setObject:forKeyedSubscript:", v3, v3);
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)ik_sharedInstanceForDataKeysDomain
{
  id v2;
  void *v3;

  if (ik_sharedInstanceForDataKeysDomain_onceToken != -1)
    dispatch_once(&ik_sharedInstanceForDataKeysDomain_onceToken, &__block_literal_global_1);
  v2 = (id)sSharedDataKeys;
  objc_sync_enter(v2);
  objc_msgSend((id)sSharedDataKeys, "objectForKey:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(a1, "copy");
    objc_msgSend((id)sSharedDataKeys, "setObject:forKey:", v3, v3);
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)ik_sharedInstanceForDomain:()ITMLKit
{
  void *v3;

  if (a3 == 1)
  {
    objc_msgSend(a1, "ik_sharedInstanceForDataKeysDomain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "ik_sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (uint64_t)ik_valueForBooleanAttribute:()ITMLKit
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "length") && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = -1;

  return v4;
}

- (uint64_t)ik_attributeBoolValue
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "BOOLValue");
  else
    return 0;
}

- (id)ik_stringByTrimmingControlChars
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[\\u000E-\\u001F|\\u0001-\\u0008|\\u000B|\\u000C]"), 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), &stru_1E9F50578);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
