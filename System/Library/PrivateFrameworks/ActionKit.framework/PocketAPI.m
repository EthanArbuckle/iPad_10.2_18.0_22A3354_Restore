@implementation PocketAPI

- (PocketAPI)init
{
  PocketAPI *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PocketAPI;
  v2 = -[PocketAPI init](&v4, sel_init);
  if (v2)
  {
    v2->operationQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    if ((PocketAPI *)sSharedAPI != v2)
      -[PocketAPI setConsumerKey:](v2, "setConsumerKey:", objc_msgSend((id)sSharedAPI, "consumerKey"));
  }
  return v2;
}

- (void)setConsumerKey:(id)a3
{
  id v5;

  v5 = a3;

  self->consumerKey = (NSString *)a3;
  if (a3 && !self->URLScheme)
    -[PocketAPI setURLScheme:](self, "setURLScheme:", -[PocketAPI URLScheme](self, "URLScheme"));
  if (-[PocketAPI isLoggedIn](self, "isLoggedIn"))
  {
    if ((objc_msgSend(-[PocketAPI pkt_getKeychainValueForKey:](self, "pkt_getKeychainValueForKey:", CFSTR("tokenDigest")), "isEqualToString:", objc_msgSend((id)objc_opt_class(), "pkt_hashForConsumerKey:accessToken:", -[PocketAPI consumerKey](self, "consumerKey"), -[PocketAPI pkt_getToken](self, "pkt_getToken"))) & 1) == 0)
    {
      NSLog(CFSTR("*** ERROR: The access token that exists does not match the consumer key. The user has been logged out."));
      -[PocketAPI logout](self, "logout");
    }
  }
}

- (NSString)URLScheme
{
  if (self->URLScheme)
    return self->URLScheme;
  else
    return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pocketapp%lu"), -[PocketAPI appID](self, "appID"));
}

- (void)setURLScheme:(id)a3
{
  id v5;

  v5 = a3;

  self->URLScheme = (NSString *)a3;
}

- (void)setOperationQueue:(id)a3
{
  if (self->consumerKey)
    NSLog(CFSTR("ERROR: PocketAPI operationQueue is being set after the consumer key was obtained.\n\tThis is probably a sever error."), a2);

  self->operationQueue = (NSOperationQueue *)a3;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->operationQueue, "waitUntilAllOperationsAreFinished");

  self->operationQueue = 0;
  self->consumerKey = 0;

  self->URLScheme = 0;
  self->userAgent = 0;
  v3.receiver = self;
  v3.super_class = (Class)PocketAPI;
  -[PocketAPI dealloc](&v3, sel_dealloc);
}

- (BOOL)handleOpenURL:(id)a3
{
  int v5;
  void *v6;
  PocketAPILogin *currentLogin;
  uint64_t v8;
  PocketAPILogin *v9;

  v5 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", -[PocketAPI URLScheme](self, "URLScheme"));
  if (v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "pkt_dictionaryByParsingURLEncodedFormString:", objc_msgSend(a3, "query"));
    currentLogin = self->currentLogin;
    if (objc_msgSend((id)objc_msgSend(a3, "path"), "isEqualToString:", CFSTR("/reverse"))
      && objc_msgSend(v6, "objectForKey:", CFSTR("code")))
    {
      v8 = objc_msgSend(v6, "objectForKey:", CFSTR("code"));
      currentLogin = -[PocketAPILogin initWithAPI:delegate:]([PocketAPILogin alloc], "initWithAPI:delegate:", self, 0);
      -[PocketAPILogin _setRequestToken:](currentLogin, "_setRequestToken:", v8);
      -[PocketAPILogin _setReverseAuth:](currentLogin, "_setReverseAuth:", 1);
    }
    if (!currentLogin)
      currentLogin = -[PocketAPI pkt_loadCurrentLoginFromDefaults](self, "pkt_loadCurrentLoginFromDefaults");
    v9 = currentLogin;
    self->currentLogin = v9;
    -[PocketAPILogin convertRequestTokenToAccessToken](v9, "convertRequestTokenToAccessToken");
    -[PocketAPI pkt_saveCurrentLoginToDefaults](self, "pkt_saveCurrentLoginToDefaults");
  }
  return v5;
}

- (unint64_t)appID
{
  NSArray *v3;
  NSArray *v4;
  id v5;
  void *v6;

  if (-[PocketAPI consumerKey](self, "consumerKey")
    && (v3 = -[NSString componentsSeparatedByString:](-[PocketAPI consumerKey](self, "consumerKey"), "componentsSeparatedByString:", CFSTR("-"))) != 0&& (v4 = v3, -[NSArray count](v3, "count"))&& (v5 = -[NSArray objectAtIndex:](v4, "objectAtIndex:", 0)) != 0&& (v6 = v5, objc_msgSend(v5, "length")))
  {
    return objc_msgSend(v6, "integerValue");
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)isLoggedIn
{
  NSString *v3;
  id v4;
  uint64_t v5;

  v3 = -[PocketAPI username](self, "username");
  v4 = -[PocketAPI pkt_getToken](self, "pkt_getToken");
  LOBYTE(v5) = 0;
  if (v3)
  {
    if (v4)
    {
      v5 = -[NSString length](v3, "length");
      if (v5)
        LOBYTE(v5) = objc_msgSend(v4, "length") != 0;
    }
  }
  return v5;
}

- (void)loginWithDelegate:(id)a3
{
  PocketAPILogin *v5;
  PocketAPILogin *v6;

  v5 = self->currentLogin;
  v6 = -[PocketAPILogin initWithAPI:delegate:]([PocketAPILogin alloc], "initWithAPI:delegate:", self, a3);
  self->currentLogin = v6;
  -[PocketAPILogin fetchRequestToken](v6, "fetchRequestToken");
  -[PocketAPI pkt_saveCurrentLoginToDefaults](self, "pkt_saveCurrentLoginToDefaults");
}

- (void)saveURL:(id)a3 delegate:(id)a4
{
  -[NSOperationQueue addOperation:](self->operationQueue, "addOperation:", -[PocketAPI saveOperationWithURL:delegate:](self, "saveOperationWithURL:delegate:", a3, a4));
}

- (void)saveURL:(id)a3 withTitle:(id)a4 delegate:(id)a5
{
  -[NSOperationQueue addOperation:](self->operationQueue, "addOperation:", -[PocketAPI saveOperationWithURL:title:delegate:](self, "saveOperationWithURL:title:delegate:", a3, a4, a5));
}

- (void)saveURL:(id)a3 withTitle:(id)a4 tweetID:(id)a5 delegate:(id)a6
{
  -[NSOperationQueue addOperation:](self->operationQueue, "addOperation:", -[PocketAPI saveOperationWithURL:title:tweetID:delegate:](self, "saveOperationWithURL:title:tweetID:delegate:", a3, a4, a5, a6));
}

- (void)callAPIMethod:(id)a3 withHTTPMethod:(int)a4 arguments:(id)a5 delegate:(id)a6
{
  -[NSOperationQueue addOperation:](self->operationQueue, "addOperation:", -[PocketAPI methodOperationWithAPIMethod:forHTTPMethod:arguments:delegate:](self, "methodOperationWithAPIMethod:forHTTPMethod:arguments:delegate:", a3, *(_QWORD *)&a4, a5, a6));
}

- (id)saveOperationWithURL:(id)a3 title:(id)a4 tweetID:(id)a5 delegate:(id)a6
{
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;

  if (!a3 || !objc_msgSend(a3, "absoluteString"))
    return 0;
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSince1970");
  v13 = objc_msgSend(v11, "numberWithInteger:", (uint64_t)v12);
  v14 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("time"));
  objc_msgSend(v14, "setObject:forKey:", objc_msgSend(a3, "absoluteString"), CFSTR("url"));
  if (a4)
    objc_msgSend(v14, "setObject:forKey:", a4, CFSTR("title"));
  if (a5
    && (objc_msgSend(a5, "isEqualToString:", &stru_24F8BBA48) & 1) == 0
    && (objc_msgSend(a5, "isEqualToString:", CFSTR("0")) & 1) == 0)
  {
    objc_msgSend(v14, "setObject:forKey:", a5, CFSTR("ref_id"));
  }
  return -[PocketAPI methodOperationWithAPIMethod:forHTTPMethod:arguments:delegate:](self, "methodOperationWithAPIMethod:forHTTPMethod:arguments:delegate:", CFSTR("add"), 1, (id)objc_msgSend(v14, "copy"), a6);
}

- (id)saveOperationWithURL:(id)a3 title:(id)a4 delegate:(id)a5
{
  return -[PocketAPI saveOperationWithURL:title:tweetID:delegate:](self, "saveOperationWithURL:title:tweetID:delegate:", a3, a4, 0, a5);
}

- (id)saveOperationWithURL:(id)a3 delegate:(id)a4
{
  return -[PocketAPI saveOperationWithURL:title:tweetID:delegate:](self, "saveOperationWithURL:title:tweetID:delegate:", a3, 0, 0, a4);
}

- (id)methodOperationWithAPIMethod:(id)a3 forHTTPMethod:(int)a4 arguments:(id)a5 delegate:(id)a6
{
  uint64_t v8;
  PocketAPIOperation *v11;

  v8 = *(_QWORD *)&a4;
  v11 = objc_alloc_init(PocketAPIOperation);
  -[PocketAPIOperation setAPI:](v11, "setAPI:", self);
  -[PocketAPIOperation setDelegate:](v11, "setDelegate:", a6);
  -[PocketAPIOperation setAPIMethod:](v11, "setAPIMethod:", a3);
  -[PocketAPIOperation setHTTPMethod:](v11, "setHTTPMethod:", v8);
  -[PocketAPIOperation setArguments:](v11, "setArguments:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", a5));
  return v11;
}

- (void)loginWithHandler:(id)a3
{
  -[PocketAPI loginWithDelegate:](self, "loginWithDelegate:", +[PocketAPIBlockDelegate delegateWithLoginHandler:](PocketAPIBlockDelegate, "delegateWithLoginHandler:", a3));
}

- (void)saveURL:(id)a3 handler:(id)a4
{
  -[PocketAPI saveURL:delegate:](self, "saveURL:delegate:", a3, +[PocketAPIBlockDelegate delegateWithSaveHandler:](PocketAPIBlockDelegate, "delegateWithSaveHandler:", a4));
}

- (void)saveURL:(id)a3 withTitle:(id)a4 handler:(id)a5
{
  -[PocketAPI saveURL:withTitle:delegate:](self, "saveURL:withTitle:delegate:", a3, a4, +[PocketAPIBlockDelegate delegateWithSaveHandler:](PocketAPIBlockDelegate, "delegateWithSaveHandler:", a5));
}

- (void)saveURL:(id)a3 withTitle:(id)a4 tweetID:(id)a5 handler:(id)a6
{
  -[PocketAPI saveURL:withTitle:tweetID:delegate:](self, "saveURL:withTitle:tweetID:delegate:", a3, a4, a5, +[PocketAPIBlockDelegate delegateWithSaveHandler:](PocketAPIBlockDelegate, "delegateWithSaveHandler:", a6));
}

- (void)callAPIMethod:(id)a3 withHTTPMethod:(int)a4 arguments:(id)a5 handler:(id)a6
{
  -[PocketAPI callAPIMethod:withHTTPMethod:arguments:delegate:](self, "callAPIMethod:withHTTPMethod:arguments:delegate:", a3, *(_QWORD *)&a4, a5, +[PocketAPIBlockDelegate delegateWithResponseHandler:](PocketAPIBlockDelegate, "delegateWithResponseHandler:", a6));
}

- (id)saveOperationWithURL:(id)a3 handler:(id)a4
{
  return -[PocketAPI saveOperationWithURL:delegate:](self, "saveOperationWithURL:delegate:", a3, +[PocketAPIBlockDelegate delegateWithSaveHandler:](PocketAPIBlockDelegate, "delegateWithSaveHandler:", a4));
}

- (id)saveOperationWithURL:(id)a3 title:(id)a4 handler:(id)a5
{
  return -[PocketAPI saveOperationWithURL:title:delegate:](self, "saveOperationWithURL:title:delegate:", a3, a4, +[PocketAPIBlockDelegate delegateWithSaveHandler:](PocketAPIBlockDelegate, "delegateWithSaveHandler:", a5));
}

- (id)saveOperationWithURL:(id)a3 title:(id)a4 tweetID:(id)a5 handler:(id)a6
{
  return -[PocketAPI saveOperationWithURL:title:tweetID:delegate:](self, "saveOperationWithURL:title:tweetID:delegate:", a3, a4, a5, +[PocketAPIBlockDelegate delegateWithSaveHandler:](PocketAPIBlockDelegate, "delegateWithSaveHandler:", a6));
}

- (id)methodOperationWithAPIMethod:(id)a3 forHTTPMethod:(int)a4 arguments:(id)a5 handler:(id)a6
{
  return -[PocketAPI methodOperationWithAPIMethod:forHTTPMethod:arguments:delegate:](self, "methodOperationWithAPIMethod:forHTTPMethod:arguments:delegate:", a3, *(_QWORD *)&a4, a5, +[PocketAPIBlockDelegate delegateWithResponseHandler:](PocketAPIBlockDelegate, "delegateWithResponseHandler:", a6));
}

- (NSString)username
{
  return (NSString *)-[PocketAPI pkt_getKeychainValueForKey:](self, "pkt_getKeychainValueForKey:", CFSTR("username"));
}

- (id)pkt_getToken
{
  return -[PocketAPI pkt_getKeychainValueForKey:](self, "pkt_getKeychainValueForKey:", CFSTR("token"));
}

- (void)pkt_loggedInWithUsername:(id)a3 token:(id)a4
{
  -[PocketAPI willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("username"));
  -[PocketAPI willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isLoggedIn"));
  -[PocketAPI pkt_setKeychainValue:forKey:](self, "pkt_setKeychainValue:forKey:", a3, CFSTR("username"));
  -[PocketAPI pkt_setKeychainValue:forKey:](self, "pkt_setKeychainValue:forKey:", a4, CFSTR("token"));
  -[PocketAPI pkt_setKeychainValue:forKey:](self, "pkt_setKeychainValue:forKey:", objc_msgSend((id)objc_opt_class(), "pkt_hashForConsumerKey:accessToken:", -[PocketAPI consumerKey](self, "consumerKey"), a4), CFSTR("tokenDigest"));
  -[PocketAPI didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isLoggedIn"));
  -[PocketAPI didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("username"));
}

- (void)logout
{
  -[PocketAPI willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("username"));
  -[PocketAPI willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isLoggedIn"));
  -[PocketAPI pkt_setKeychainValue:forKey:](self, "pkt_setKeychainValue:forKey:", 0, CFSTR("username"));
  -[PocketAPI pkt_setKeychainValue:forKey:](self, "pkt_setKeychainValue:forKey:", 0, CFSTR("token"));
  -[PocketAPI pkt_setKeychainValue:forKey:](self, "pkt_setKeychainValue:forKey:", 0, CFSTR("tokenDigest"));
  -[PocketAPI didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isLoggedIn"));
  -[PocketAPI didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("username"));
}

- (id)pkt_loadCurrentLoginFromDefaults
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDBCF50]);
  v3 = (void *)objc_msgSend(v2, "dataForKey:", CFSTR("PocketAPICurrentLogin"));
  if (v3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
    if (v3)
    {
      objc_msgSend(v2, "removeObjectForKey:", CFSTR("PocketAPICurrentLogin"));
      objc_msgSend(v2, "synchronize");
    }
  }
  return v3;
}

- (void)pkt_saveCurrentLoginToDefaults
{
  PocketAPILogin *currentLogin;
  uint64_t v3;
  uint64_t v4;
  id v5;

  currentLogin = self->currentLogin;
  if (currentLogin)
  {
    v3 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", currentLogin, 1, 0);
    if (v3)
    {
      v4 = v3;
      v5 = objc_alloc_init(MEMORY[0x24BDBCF50]);
      objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("PocketAPICurrentLogin"));
      objc_msgSend(v5, "synchronize");

    }
  }
}

- (void)pkt_migrateAccountToAccessTokenWithUsername:(id)a3 password:(id)a4 delegate:(id)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  PocketAPIOperation *v13;

  v13 = objc_alloc_init(PocketAPIOperation);
  -[PocketAPIOperation setAPI:](v13, "setAPI:", self);
  -[PocketAPIOperation setDelegate:](v13, "setDelegate:", a5);
  -[PocketAPIOperation setDomain:](v13, "setDomain:", 10);
  -[PocketAPIOperation setHTTPMethod:](v13, "setHTTPMethod:", 1);
  -[PocketAPIOperation setAPIMethod:](v13, "setAPIMethod:", CFSTR("authorize"));
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages"), "objectAtIndex:", 0);
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone"), "secondsFromGMT");
  -[PocketAPIOperation setArguments:](v13, "setArguments:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, CFSTR("username"), a4, CFSTR("password"), CFSTR("credentials"), CFSTR("grant_type"), v9, CFSTR("locale"), v11, CFSTR("country"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i"), v12 / 60), CFSTR("timezone"), 0));
  -[NSOperationQueue addOperation:](self->operationQueue, "addOperation:", v13);

}

- (void)pkt_migrateAccountToAccessTokenWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  -[PocketAPI pkt_migrateAccountToAccessTokenWithUsername:password:delegate:](self, "pkt_migrateAccountToAccessTokenWithUsername:password:delegate:", a3, a4, +[PocketAPIBlockDelegate delegateWithLoginHandler:](PocketAPIBlockDelegate, "delegateWithLoginHandler:", a5));
}

- (id)pkt_actionDictionaryWithName:(id)a3 parameters:(id)a4
{
  void *v5;
  void *v6;
  double v7;

  if (!a3)
    return 0;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a4);
  objc_msgSend(v5, "setObject:forKey:", a3, CFSTR("action"));
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSince1970");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v6, "numberWithInteger:", (uint64_t)v7), CFSTR("time"));
  return v5;
}

- (id)pkt_userAgent
{
  id result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;

  result = self->userAgent;
  if (!result)
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "infoDictionary");
    v5 = objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleDisplayName"));
    if (!v5)
      v5 = objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBD298]);
    v6 = objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleVersion"));
    v7 = -[PocketAPI pkt_deviceName](self, "pkt_deviceName");
    v8 = -[PocketAPI pkt_deviceOSVersion](self, "pkt_deviceOSVersion");
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC1440], "currentDevice"), "systemName");
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC1440], "currentDevice"), "idiom");
    v11 = CFSTR("Mobile");
    if (v10 == 1)
      v11 = CFSTR("Tablet");
    v12 = &stru_24F8BBA48;
    if (v5)
      v13 = (const __CFString *)v5;
    else
      v13 = &stru_24F8BBA48;
    if (v6)
      v14 = (const __CFString *)v6;
    else
      v14 = &stru_24F8BBA48;
    if (v9)
      v15 = (const __CFString *)v9;
    else
      v15 = &stru_24F8BBA48;
    if (v8)
      v16 = v8;
    else
      v16 = &stru_24F8BBA48;
    if (v7)
      v12 = v7;
    result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("PocketSDK:1.0.2"), v13, v14, v15, v16, CFSTR("Apple"), v12, v11, CFSTR("App Store"), 0), "componentsJoinedByString:", CFSTR(";"));
    self->userAgent = (NSString *)result;
  }
  return result;
}

- (id)pkt_deviceName
{
  void *v2;
  void *v3;
  const __CFString *v4;
  size_t size;

  size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  v2 = malloc_type_malloc(size, 0x225F551CuLL);
  sysctlbyname("hw.machine", v2, &size, 0, 0);
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v2, 4);
  free(v2);
  v4 = CFSTR("iFPGA");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iFPGA")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone1,1")) & 1) != 0)
    {
      return CFSTR("iPhone 1G");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone1,2")) & 1) != 0)
    {
      return CFSTR("iPhone 3G");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone2")) & 1) != 0)
    {
      return CFSTR("iPhone 3GS");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone3")) & 1) != 0)
    {
      return CFSTR("iPhone 4");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone4")) & 1) != 0)
    {
      return CFSTR("iPhone 4S");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPod1")) & 1) != 0)
    {
      return CFSTR("iPod touch 1G");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPod2")) & 1) != 0)
    {
      return CFSTR("iPod touch 2G");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPod3")) & 1) != 0)
    {
      return CFSTR("iPod touch 3G");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPod4")) & 1) != 0)
    {
      return CFSTR("iPod touch 4G");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad1")) & 1) != 0)
    {
      return CFSTR("iPad 1G");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad2")) & 1) != 0)
    {
      return CFSTR("iPad 2G");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad3")) & 1) != 0)
    {
      return CFSTR("iPad 3G");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("AppleTV2")) & 1) != 0)
    {
      return CFSTR("Apple TV 2G");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone")) & 1) != 0)
    {
      return CFSTR("Unknown iPhone");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPod")) & 1) != 0)
    {
      return CFSTR("Unknown iPod touch");
    }
    else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad")) & 1) != 0)
    {
      return CFSTR("Unknown iPad");
    }
    else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("86")) & 1) != 0
           || objc_msgSend(v3, "isEqual:", CFSTR("x86_64")))
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC1440], "currentDevice"), "idiom") == 1)
        return CFSTR("iPad Simulator");
      else
        return CFSTR("iPhone Simulator");
    }
    else
    {
      return CFSTR("Unknown iOS Device");
    }
  }
  return (id)v4;
}

- (id)pkt_deviceOSVersion
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC1440], "currentDevice"), "systemVersion");
}

- (NSString)consumerKey
{
  return self->consumerKey;
}

- (NSOperationQueue)operationQueue
{
  return self->operationQueue;
}

+ (id)sharedAPI
{
  objc_sync_enter(a1);
  if (!sSharedAPI)
  {
    sSharedAPI = (uint64_t)objc_alloc((Class)a1);
    objc_msgSend((id)sSharedAPI, "init");
  }
  objc_sync_exit(a1);
  return (id)sSharedAPI;
}

+ (id)pocketAppURLScheme
{
  return CFSTR("pocket-oauth-v1");
}

+ (id)pkt_hashForConsumerKey:(id)a3 accessToken:(id)a4
{
  void *v4;
  void *v5;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), a3, a4), "dataUsingEncoding:", 4);
  CC_SHA1((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), md);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 20);
  for (i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), md[i]);
  return v5;
}

- (void)pkt_setKeychainValue:(id)a3 forKey:(id)a4
{
  -[PocketAPI pkt_setKeychainValue:forKey:serviceName:](self, "pkt_setKeychainValue:forKey:serviceName:", a3, a4, CFSTR("PocketAPI"));
}

- (id)pkt_getKeychainValueForKey:(id)a3
{
  return -[PocketAPI pkt_getKeychainValueForKey:serviceName:](self, "pkt_getKeychainValueForKey:serviceName:", a3, CFSTR("PocketAPI"));
}

- (void)pkt_setKeychainValue:(id)a3 forKey:(id)a4 serviceName:(id)a5
{
  if (a3)
    +[PocketAPIKeychainUtils storeUsername:andPassword:forServiceName:updateExisting:error:](PocketAPIKeychainUtils, "storeUsername:andPassword:forServiceName:updateExisting:error:", a4, a3, a5, 1, 0);
  else
    +[PocketAPIKeychainUtils deleteItemForUsername:andServiceName:error:](PocketAPIKeychainUtils, "deleteItemForUsername:andServiceName:error:", a4, a5, 0);
}

- (id)pkt_getKeychainValueForKey:(id)a3 serviceName:(id)a4
{
  return +[PocketAPIKeychainUtils getPasswordForUsername:andServiceName:error:](PocketAPIKeychainUtils, "getPasswordForUsername:andServiceName:error:", a3, a4, 0);
}

@end
