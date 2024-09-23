@implementation NSExtensionItem(AKExtensionItem)

+ (id)extensionItemWithAppleIDAuthenticationContext:()AKExtensionItem
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB35E8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "ak_setContext:", v4);

  return v5;
}

- (void)ak_setContext:()AKExtensionItem
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("AKExtensionItemContext"));

  }
  else
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("AKExtensionItemContext"));
  }
  objc_msgSend(a1, "setUserInfo:", v5);

}

- (id)ak_context
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("AKExtensionItemContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
