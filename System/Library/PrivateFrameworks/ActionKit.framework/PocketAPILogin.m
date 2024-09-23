@implementation PocketAPILogin

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[PocketAPILogin requestToken](self, "requestToken"), CFSTR("requestToken"));
  objc_msgSend(a3, "encodeObject:forKey:", -[PocketAPILogin accessToken](self, "accessToken"), CFSTR("accessToken"));
  objc_msgSend(a3, "encodeObject:forKey:", -[PocketAPILogin uuid](self, "uuid"), CFSTR("uuid"));
}

- (PocketAPILogin)initWithCoder:(id)a3
{
  PocketAPILogin *v4;

  v4 = -[PocketAPILogin init](self, "init");
  if (v4)
  {
    v4->requestToken = (NSString *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("requestToken"));
    v4->accessToken = (NSString *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("accessToken"));
    v4->uuid = (NSString *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("uuid"));
  }
  return v4;
}

- (void)_setRequestToken:(id)a3
{
  NSString *v5;

  -[PocketAPILogin willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("requestToken"));
  v5 = self->requestToken;
  self->requestToken = (NSString *)objc_msgSend(a3, "copy");
  -[PocketAPILogin didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("requestToken"));
}

- (void)_setReverseAuth:(BOOL)a3
{
  self->reverseAuth = a3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->operationQueue, "waitUntilAllOperationsAreFinished");

  self->operationQueue = 0;
  self->requestToken = 0;

  self->accessToken = 0;
  self->API = 0;

  self->delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)PocketAPILogin;
  -[PocketAPILogin dealloc](&v3, sel_dealloc);
}

- (PocketAPILogin)init
{
  PocketAPILogin *v2;
  const __CFUUID *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PocketAPILogin;
  v2 = -[PocketAPILogin init](&v5, sel_init);
  if (v2)
  {
    v2->operationQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v2->API = (PocketAPI *)+[PocketAPI sharedAPI](PocketAPI, "sharedAPI");
    v3 = CFUUIDCreate(0);
    v2->uuid = (NSString *)CFUUIDCreateString(0, v3);
    CFRelease(v3);
  }
  return v2;
}

- (PocketAPILogin)initWithAPI:(id)a3 delegate:(id)a4
{
  PocketAPILogin *v6;
  id v7;

  v6 = -[PocketAPILogin init](self, "init");
  if (v6)
  {
    v7 = a3;

    v6->API = (PocketAPI *)a3;
    v6->delegate = (PocketAPIDelegate *)a4;
  }
  return v6;
}

- (id)redirectURL
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:authorizationFinished"), -[PocketAPI URLScheme](-[PocketAPILogin API](self, "API"), "URLScheme")));
}

- (void)fetchRequestToken
{
  uint64_t v3;
  PocketAPIOperation *v4;

  -[PocketAPILogin loginDidStart](self, "loginDidStart");
  v4 = objc_alloc_init(PocketAPIOperation);
  -[PocketAPIOperation setAPI:](v4, "setAPI:", self->API);
  -[PocketAPIOperation setDelegate:](v4, "setDelegate:", self);
  -[PocketAPIOperation setDomain:](v4, "setDomain:", 10);
  -[PocketAPIOperation setHTTPMethod:](v4, "setHTTPMethod:", 1);
  -[PocketAPIOperation setAPIMethod:](v4, "setAPIMethod:", CFSTR("request"));
  v3 = objc_msgSend(-[PocketAPILogin redirectURL](self, "redirectURL"), "absoluteString");
  -[PocketAPIOperation setArguments:](v4, "setArguments:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", -[PocketAPILogin uuid](self, "uuid"), CFSTR("state"), v3, CFSTR("redirect_uri"), 0));
  -[NSOperationQueue addOperation:](self->operationQueue, "addOperation:", v4);

}

- (void)convertRequestTokenToAccessToken
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  PocketAPIOperation *v9;

  v9 = objc_alloc_init(PocketAPIOperation);
  -[PocketAPIOperation setAPI:](v9, "setAPI:", self->API);
  -[PocketAPIOperation setDelegate:](v9, "setDelegate:", self);
  -[PocketAPIOperation setDomain:](v9, "setDomain:", 10);
  -[PocketAPIOperation setHTTPMethod:](v9, "setHTTPMethod:", 1);
  -[PocketAPIOperation setAPIMethod:](v9, "setAPIMethod:", CFSTR("authorize"));
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages"), "objectAtIndex:", 0);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone"), "secondsFromGMT") / 60;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = -[PocketAPILogin requestToken](self, "requestToken");
  -[PocketAPIOperation setArguments:](v9, "setArguments:", objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("code"), v3, CFSTR("locale"), v5, CFSTR("country"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i"), v6), CFSTR("timezone"), 0));
  -[NSOperationQueue addOperation:](self->operationQueue, "addOperation:", v9);

}

- (void)pocketAPI:(id)a3 receivedRequestToken:(id)a4
{
  id v6;
  PocketAPIDelegate *delegate;
  uint64_t v8;
  _QWORD v9[7];

  -[PocketAPILogin _setRequestToken:](self, "_setRequestToken:", a4);
  v6 = +[PocketAPIOperation encodeForURL:](PocketAPIOperation, "encodeForURL:", objc_msgSend(-[PocketAPILogin redirectURL](self, "redirectURL"), "absoluteString"));
  delegate = self->delegate;
  v8 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pocket-oauth-v1:///authorize?request_token=%@&redirect_uri=%@"), self->requestToken, v6));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__PocketAPILogin_pocketAPI_receivedRequestToken___block_invoke;
  v9[3] = &unk_24F8B8B80;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = v6;
  -[PocketAPIDelegate pocketAPI:requestedOpenURL:completionHandler:](delegate, "pocketAPI:requestedOpenURL:completionHandler:", a3, v8, v9);
}

- (void)pocketAPILoggedIn:(id)a3
{
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
    -[PocketAPIDelegate pocketAPILoggedIn:](self->delegate, "pocketAPILoggedIn:", -[PocketAPILogin API](self, "API"));
  -[PocketAPILogin loginDidFinish:](self, "loginDidFinish:", 1);

  self->delegate = 0;
}

- (void)pocketAPI:(id)a3 hadLoginError:(id)a4
{
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
    -[PocketAPIDelegate pocketAPI:hadLoginError:](self->delegate, "pocketAPI:hadLoginError:", a3, a4);
  -[PocketAPILogin loginDidFinish:](self, "loginDidFinish:", 0, a4);

  self->delegate = 0;
}

- (void)loginDidStart
{
  void *v3;

  if (!self->didStart)
  {
    self->didStart = 1;
    if (self->delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[PocketAPIDelegate pocketAPIDidStartLogin:](self->delegate, "pocketAPIDidStartLogin:", -[PocketAPILogin API](self, "API"));
    }
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "postNotificationName:object:", PocketAPILoginStartedNotification, 0);
  }
}

- (void)loginDidFinish:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  uint64_t v9;

  if (!self->didFinish)
  {
    v3 = a3;
    self->didFinish = 1;
    if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[PocketAPIDelegate pocketAPIDidFinishLogin:](self->delegate, "pocketAPIDidFinishLogin:", -[PocketAPILogin API](self, "API"));
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "postNotificationName:object:", PocketAPILoginFinishedNotification, 0);
    if (self->reverseAuth)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = +[PocketAPI pocketAppURLScheme](PocketAPI, "pocketAppURLScheme");
      if (v3)
        v8 = CFSTR("success");
      else
        v8 = CFSTR("failed");
      v9 = objc_msgSend(v6, "stringWithFormat:", CFSTR("%@://reverse/%@/%i"), v7, v8, -[PocketAPI appID](-[PocketAPILogin API](self, "API"), "appID"));
      -[PocketAPIDelegate pocketAPI:requestedOpenURL:completionHandler:](self->delegate, "pocketAPI:requestedOpenURL:completionHandler:", -[PocketAPILogin API](self, "API"), objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9), 0);
    }
  }
}

- (PocketAPI)API
{
  return self->API;
}

- (NSString)uuid
{
  return self->uuid;
}

- (NSString)requestToken
{
  return self->requestToken;
}

- (NSString)accessToken
{
  return self->accessToken;
}

_QWORD *__49__PocketAPILogin_pocketAPI_receivedRequestToken___block_invoke(_QWORD *result, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  __int128 v8;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    v3 = result[4];
    v4 = result[5];
    v5 = *(void **)(v3 + 48);
    v6 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://getpocket.com/auth/authorize?request_token=%@&redirect_uri=%@"), *(_QWORD *)(v3 + 24), result[6]));
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __49__PocketAPILogin_pocketAPI_receivedRequestToken___block_invoke_2;
    v7[3] = &unk_24F8B1CC0;
    v8 = *((_OWORD *)v2 + 2);
    return (_QWORD *)objc_msgSend(v5, "pocketAPI:requestedOpenURL:completionHandler:", v4, v6, v7);
  }
  return result;
}

uint64_t __49__PocketAPILogin_pocketAPI_receivedRequestToken___block_invoke_2(uint64_t result, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) == 0)
  {
    v2 = *(void **)(result + 32);
    v3 = *(_QWORD *)(result + 40);
    v4 = *MEMORY[0x24BDD0B88];
    v5 = *MEMORY[0x24BDD0FC8];
    v6[0] = CFSTR("Failed to open the Pocket authentication URL.");
    return objc_msgSend(v2, "pocketAPI:hadLoginError:", v3, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v4, 3328, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
