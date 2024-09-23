@implementation ENSSKeychain

+ (id)passwordForService:(id)a3 account:(id)a4
{
  return (id)objc_msgSend(a1, "passwordForService:account:error:", a3, a4, 0);
}

+ (id)passwordForService:(id)a3 account:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  ENSSKeychainQuery *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(ENSSKeychainQuery);
  -[ENSSKeychainQuery setService:](v9, "setService:", v8);

  -[ENSSKeychainQuery setAccount:](v9, "setAccount:", v7);
  -[ENSSKeychainQuery fetch:](v9, "fetch:", a5);
  -[ENSSKeychainQuery password](v9, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)deletePasswordForService:(id)a3 account:(id)a4
{
  return objc_msgSend(a1, "deletePasswordForService:account:error:", a3, a4, 0);
}

+ (BOOL)deletePasswordForService:(id)a3 account:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  ENSSKeychainQuery *v9;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(ENSSKeychainQuery);
  -[ENSSKeychainQuery setService:](v9, "setService:", v8);

  -[ENSSKeychainQuery setAccount:](v9, "setAccount:", v7);
  LOBYTE(a5) = -[ENSSKeychainQuery deleteItem:](v9, "deleteItem:", a5);

  return (char)a5;
}

+ (BOOL)setPassword:(id)a3 forService:(id)a4 account:(id)a5
{
  return objc_msgSend(a1, "setPassword:forService:account:error:", a3, a4, a5, 0);
}

+ (BOOL)setPassword:(id)a3 forService:(id)a4 account:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  ENSSKeychainQuery *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(ENSSKeychainQuery);
  -[ENSSKeychainQuery setService:](v12, "setService:", v10);

  -[ENSSKeychainQuery setAccount:](v12, "setAccount:", v9);
  -[ENSSKeychainQuery setPassword:](v12, "setPassword:", v11);

  LOBYTE(a6) = -[ENSSKeychainQuery save:](v12, "save:", a6);
  return (char)a6;
}

+ (id)allAccounts
{
  return (id)objc_msgSend(a1, "accountsForService:", 0);
}

+ (id)accountsForService:(id)a3
{
  id v3;
  ENSSKeychainQuery *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(ENSSKeychainQuery);
  -[ENSSKeychainQuery setService:](v4, "setService:", v3);

  -[ENSSKeychainQuery fetchAll:](v4, "fetchAll:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)accessibilityType
{
  return (void *)ENSSKeychainAccessibilityType;
}

+ (void)setAccessibilityType:(void *)a3
{
  CFRetain(a3);
  if (ENSSKeychainAccessibilityType)
    CFRelease((CFTypeRef)ENSSKeychainAccessibilityType);
  ENSSKeychainAccessibilityType = (uint64_t)a3;
}

@end
