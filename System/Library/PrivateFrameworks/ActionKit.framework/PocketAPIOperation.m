@implementation PocketAPIOperation

- (void)start
{
  id v3;
  NSURLConnection *v4;
  uint64_t v5;

  self->finishedLoading = 0;
  if (-[PocketAPI isLoggedIn](-[PocketAPIOperation API](self, "API"), "isLoggedIn")
    || -[NSString isEqualToString:](self->APIMethod, "isEqualToString:", CFSTR("request"))
    || -[NSString isEqualToString:](self->APIMethod, "isEqualToString:", CFSTR("authorize"))
    || -[NSString isEqualToString:](self->APIMethod, "isEqualToString:", CFSTR("oauth/authorize")))
  {
    v3 = -[PocketAPIOperation pkt_URLRequest](self, "pkt_URLRequest");
    v4 = (NSURLConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7478]), "initWithRequest:delegate:startImmediately:", v3, self, 0);
    self->connection = v4;
    v5 = objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    -[NSURLConnection scheduleInRunLoop:forMode:](v4, "scheduleInRunLoop:forMode:", v5, *MEMORY[0x24BDBCB80]);
    -[NSURLConnection start](self->connection, "start");
  }
  else
  {
    -[PocketAPIOperation connectionFinishedWithError:](self, "connectionFinishedWithError:", objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", PocketAPIErrorDomain, 401, 0));
  }
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isExecuting
{
  return !self->finishedLoading;
}

- (BOOL)isFinished
{
  return self->finishedLoading;
}

- (PocketAPIOperation)init
{
  PocketAPIOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PocketAPIOperation;
  result = -[PocketAPIOperation init](&v3, sel_init);
  if (result)
    result->domain = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->API = 0;
  self->delegate = 0;

  self->APIMethod = 0;
  self->arguments = 0;

  self->connection = 0;
  self->response = 0;

  self->data = 0;
  self->error = 0;
  v3.receiver = self;
  v3.super_class = (Class)PocketAPIOperation;
  -[PocketAPIOperation dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p https://%@/%@ %@>"), objc_opt_class(), self, -[PocketAPIOperation baseURLPath](self, "baseURLPath"), -[PocketAPIOperation APIMethod](self, "APIMethod"), -[PocketAPIOperation arguments](self, "arguments"));
}

- (NSString)baseURLPath
{
  if (-[PocketAPIOperation domain](self, "domain") == 10)
    return (NSString *)CFSTR("getpocket.com/v3/oauth");
  else
    return (NSString *)CFSTR("getpocket.com/v3");
}

- (id)responseDictionary
{
  id v3;
  id v5;

  v3 = -[NSDictionary objectForKey:](-[NSHTTPURLResponse allHeaderFields](-[PocketAPIOperation response](self, "response"), "allHeaderFields"), "objectForKey:", CFSTR("Content-Type"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("application/json")))
    return (id)-[objc_class JSONObjectWithData:options:error:](NSClassFromString(CFSTR("NSJSONSerialization")), "JSONObjectWithData:options:error:", -[PocketAPIOperation data](self, "data"), 0, 0);
  if (objc_msgSend(v3, "rangeOfString:", CFSTR("application/x-www-form-urlencode")) == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", -[PocketAPIOperation data](self, "data"), 4);
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "pkt_dictionaryByParsingURLEncodedFormString:", v5);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  NSHTTPURLResponse *v5;
  id v6;
  uint64_t v7;

  v5 = (NSHTTPURLResponse *)a4;
  self->response = v5;
  if (-[NSHTTPURLResponse statusCode](v5, "statusCode") == 200)
  {
    self->data = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 0);
  }
  else if (-[NSDictionary objectForKey:](-[NSHTTPURLResponse allHeaderFields](self->response, "allHeaderFields"), "objectForKey:", CFSTR("X-Error")))
  {
    -[NSURLConnection cancel](self->connection, "cancel");
    v6 = -[NSDictionary objectForKey:](-[NSHTTPURLResponse allHeaderFields](self->response, "allHeaderFields"), "objectForKey:", CFSTR("X-Error"));
    if (v6)
      v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x24BDD0FC8], 0);
    else
      v7 = 0;
    -[PocketAPIOperation connection:didFailWithError:](self, "connection:didFailWithError:", self->connection, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PocketSDK"), -[NSHTTPURLResponse statusCode](self->response, "statusCode"), v7));
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  -[NSMutableData appendData:](self->data, "appendData:", a4);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  -[PocketAPIOperation connectionFinishedWithError:](self, "connectionFinishedWithError:", a4);
}

- (void)connectionDidFinishLoading:(id)a3
{
  -[PocketAPIOperation connectionFinishedWithError:](self, "connectionFinishedWithError:", 0);
}

- (void)connectionFinishedWithError:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSError *error;
  NSString *v22;
  PocketAPIDelegate *v23;
  PocketAPI *v24;
  NSError *v25;
  PocketAPIDelegate *v26;
  PocketAPI *v27;
  id v28;
  id v29;
  PocketAPI *v30;
  id v31;
  id v32;
  uint64_t v33;
  PocketAPIDelegate *v34;
  PocketAPI *v35;
  id v36;
  id v37;
  uint64_t v38;
  PocketAPIDelegate *v39;
  PocketAPI *v40;

  if (-[PocketAPIOperation response](self, "response"))
    v5 = -[NSHTTPURLResponse statusCode](-[PocketAPIOperation response](self, "response"), "statusCode");
  else
    v5 = objc_msgSend(a3, "code");
  v6 = v5;
  v8 = !self->attemptedRelogin && v5 == 401;
  v9 = (int)objc_msgSend(-[NSDictionary objectForKey:](-[NSHTTPURLResponse allHeaderFields](-[PocketAPIOperation response](self, "response"), "allHeaderFields"), "objectForKey:", CFSTR("X-Error-Code")), "intValue");
  v10 = -[NSDictionary objectForKey:](-[NSHTTPURLResponse allHeaderFields](-[PocketAPIOperation response](self, "response"), "allHeaderFields"), "objectForKey:", CFSTR("X-Error"));
  if (v6 <= 499)
  {
    v11 = v10;
  }
  else
  {
    v9 = 199;
    v11 = CFSTR("There was a server error.");
  }
  if (v9)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = PocketAPIErrorDomain;
    v14 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v11, CFSTR("localizedDescription"), a3, CFSTR("HTTPError"), 0);
    v15 = v12;
    v16 = v13;
    v17 = v9;
  }
  else if (a3)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = PocketAPIErrorDomain;
    v14 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v11, CFSTR("localizedDescription"), a3, CFSTR("HTTPError"), 0);
    v15 = v18;
    v16 = v19;
    v17 = v6;
  }
  else
  {
    if (v6 != 403)
    {
      v20 = 0;
      goto LABEL_20;
    }
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = PocketAPIErrorDomain;
    v17 = 403;
    v14 = 0;
  }
  v20 = (void *)objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v14);
LABEL_20:
  self->error = (NSError *)v20;
  if (-[PocketAPIOperation delegate](self, "delegate"))
  {
    -[PocketAPIOperation delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PocketAPIDelegate pocketAPI:receivedResponse:forAPIMethod:error:](-[PocketAPIOperation delegate](self, "delegate"), "pocketAPI:receivedResponse:forAPIMethod:error:", -[PocketAPIOperation API](self, "API"), -[PocketAPIOperation responseDictionary](self, "responseDictionary"), -[PocketAPIOperation APIMethod](self, "APIMethod"), a3);
  }
  if (v8)
  {
    -[PocketAPI loginWithDelegate:](-[PocketAPIOperation API](self, "API"), "loginWithDelegate:", self);
    self->attemptedRelogin = 1;
    return;
  }
  if (v6 == 403)
    -[PocketAPI logout](-[PocketAPIOperation API](self, "API"), "logout");
  error = self->error;
  v22 = -[PocketAPIOperation APIMethod](self, "APIMethod");
  if (!error)
  {
    if (-[NSString isEqualToString:](v22, "isEqualToString:", CFSTR("auth")))
    {
      v27 = -[PocketAPIOperation API](self, "API");
      v28 = -[NSDictionary objectForKey:](-[PocketAPIOperation arguments](self, "arguments"), "objectForKey:", CFSTR("username"));
      v29 = -[NSDictionary objectForKey:](-[PocketAPIOperation arguments](self, "arguments"), "objectForKey:", CFSTR("token"));
      v30 = v27;
      v31 = v28;
    }
    else
    {
      if (-[NSString isEqualToString:](-[PocketAPIOperation APIMethod](self, "APIMethod"), "isEqualToString:", CFSTR("add")))
      {
        if (-[PocketAPIOperation delegate](self, "delegate"))
        {
          -[PocketAPIOperation delegate](self, "delegate");
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v32 = -[NSDictionary objectForKey:](-[PocketAPIOperation arguments](self, "arguments"), "objectForKey:", CFSTR("url"));
            if (v32)
              v33 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v32);
            else
              v33 = 0;
            -[PocketAPIDelegate pocketAPI:savedURL:](-[PocketAPIOperation delegate](self, "delegate"), "pocketAPI:savedURL:", -[PocketAPIOperation API](self, "API"), v33);
          }
        }
        goto LABEL_62;
      }
      if (-[NSString isEqualToString:](-[PocketAPIOperation APIMethod](self, "APIMethod"), "isEqualToString:", CFSTR("request")))
      {
        -[PocketAPIDelegate pocketAPI:receivedRequestToken:](-[PocketAPIOperation delegate](self, "delegate"), "pocketAPI:receivedRequestToken:", -[PocketAPIOperation API](self, "API"), objc_msgSend(-[PocketAPIOperation responseDictionary](self, "responseDictionary"), "objectForKey:", CFSTR("code")));
        goto LABEL_62;
      }
      if (!-[NSString isEqualToString:](-[PocketAPIOperation APIMethod](self, "APIMethod"), "isEqualToString:", CFSTR("authorize"))&& !-[NSString isEqualToString:](-[PocketAPIOperation APIMethod](self, "APIMethod"), "isEqualToString:", CFSTR("oauth/authorize")))
      {
        goto LABEL_62;
      }
      v36 = -[PocketAPIOperation responseDictionary](self, "responseDictionary");
      v37 = (id)objc_msgSend(v36, "objectForKey:", CFSTR("username"));
      if ((!v37 || v37 == (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
        && objc_msgSend(-[NSDictionary objectForKey:](-[PocketAPIOperation arguments](self, "arguments"), "objectForKey:", CFSTR("grant_type")), "isEqualToString:", CFSTR("credentials")))
      {
        v37 = -[NSDictionary objectForKey:](-[PocketAPIOperation arguments](self, "arguments"), "objectForKey:", CFSTR("username"));
      }
      v38 = objc_msgSend(v36, "objectForKey:", CFSTR("access_token"));
      if (v37 == (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null") && v38 == objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
      {
        v39 = -[PocketAPIOperation delegate](self, "delegate");
        v40 = -[PocketAPIOperation API](self, "API");
        v25 = (NSError *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PocketAPI"), 404, 0);
        v26 = v39;
        v24 = v40;
        goto LABEL_33;
      }
      v30 = -[PocketAPIOperation API](self, "API");
      v31 = v37;
      v29 = (id)v38;
    }
    -[PocketAPI pkt_loggedInWithUsername:token:](v30, "pkt_loggedInWithUsername:token:", v31, v29);
    if (-[PocketAPIOperation delegate](self, "delegate"))
    {
      -[PocketAPIOperation delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[PocketAPIDelegate pocketAPILoggedIn:](-[PocketAPIOperation delegate](self, "delegate"), "pocketAPILoggedIn:", -[PocketAPIOperation API](self, "API"));
    }
    goto LABEL_62;
  }
  if (-[NSString rangeOfString:](v22, "rangeOfString:", CFSTR("auth")) == 0x7FFFFFFFFFFFFFFFLL
    && !-[NSString isEqualToString:](-[PocketAPIOperation APIMethod](self, "APIMethod"), "isEqualToString:", CFSTR("request")))
  {
    if (-[NSString isEqualToString:](-[PocketAPIOperation APIMethod](self, "APIMethod"), "isEqualToString:", CFSTR("add")))
    {
      if (-[PocketAPIOperation delegate](self, "delegate"))
      {
        -[PocketAPIOperation delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v34 = -[PocketAPIOperation delegate](self, "delegate");
          v35 = -[PocketAPIOperation API](self, "API");
          -[PocketAPIDelegate pocketAPI:failedToSaveURL:error:](v34, "pocketAPI:failedToSaveURL:error:", v35, objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", -[NSDictionary objectForKey:](-[PocketAPIOperation arguments](self, "arguments"), "objectForKey:", CFSTR("url"))), self->error);
        }
      }
    }
    goto LABEL_62;
  }
  if (-[PocketAPIOperation delegate](self, "delegate"))
  {
    -[PocketAPIOperation delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v23 = -[PocketAPIOperation delegate](self, "delegate");
      v24 = -[PocketAPIOperation API](self, "API");
      v25 = self->error;
      v26 = v23;
LABEL_33:
      -[PocketAPIDelegate pocketAPI:hadLoginError:](v26, "pocketAPI:hadLoginError:", v24, v25);
    }
  }
LABEL_62:
  -[PocketAPIOperation pkt_connectionFinishedLoading](self, "pkt_connectionFinishedLoading");
}

- (void)pocketAPILoggedIn:(id)a3
{
  -[NSOperationQueue addOperation:](-[PocketAPI operationQueue](-[PocketAPIOperation API](self, "API", a3), "operationQueue"), "addOperation:", (id)-[PocketAPIOperation copy](self, "copy"));
  -[PocketAPIOperation pkt_connectionFinishedLoading](self, "pkt_connectionFinishedLoading");
}

- (void)pocketAPI:(id)a3 hadLoginError:(id)a4
{
  -[PocketAPIOperation connectionFinishedWithError:](self, "connectionFinishedWithError:", a4);
}

- (id)pkt_requestArguments
{
  id v3;
  id v4;

  v3 = (id)-[NSDictionary mutableCopy](-[PocketAPIOperation arguments](self, "arguments"), "mutableCopy");
  if (-[PocketAPI consumerKey](-[PocketAPIOperation API](self, "API"), "consumerKey"))
    objc_msgSend(v3, "setObject:forKey:", -[PocketAPI consumerKey](-[PocketAPIOperation API](self, "API"), "consumerKey"), CFSTR("consumer_key"));
  v4 = -[PocketAPI pkt_getToken](-[PocketAPIOperation API](self, "API"), "pkt_getToken");
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("access_token"));
  return v3;
}

- (id)pkt_URLRequest
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;
  Class v15;
  uint64_t v16;
  id v17;
  const __CFString *v18;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@/%@"), -[PocketAPIOperation baseURLPath](self, "baseURLPath"), -[PocketAPIOperation APIMethod](self, "APIMethod"));
  v4 = -[PocketAPIOperation pkt_requestArguments](self, "pkt_requestArguments");
  if (!-[PocketAPIOperation HTTPMethod](self, "HTTPMethod") && objc_msgSend(v4, "count"))
  {
    v20 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = v4;
    obj = (id)objc_msgSend(v4, "allKeys");
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(obj);
          objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), +[PocketAPIOperation encodeForURL:](PocketAPIOperation, "encodeForURL:", objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i)))));
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }
    if (objc_msgSend(v5, "count"))
      v3 = objc_msgSend(v20, "stringByAppendingFormat:", CFSTR("?%@"), objc_msgSend(v5, "componentsJoinedByString:", CFSTR("&")));
    else
      v3 = (uint64_t)v20;
    v4 = v6;
  }
  v11 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "initWithURL:", v11);
  objc_msgSend(v12, "_setNonAppInitiated:", 1);
  v13 = -[PocketAPIOperation HTTPMethod](self, "HTTPMethod") - 1;
  if (v13 > 2)
    v14 = CFSTR("GET");
  else
    v14 = off_24F8B5DF8[v13];
  objc_msgSend(v12, "setHTTPMethod:", v14);
  objc_msgSend(v12, "setTimeoutInterval:", 20.0);
  objc_msgSend(v12, "setCachePolicy:", 4);
  v15 = NSClassFromString(CFSTR("NSJSONSerialization"));
  if (-[PocketAPIOperation HTTPMethod](self, "HTTPMethod") && objc_msgSend(v4, "count"))
  {
    if (v15)
    {
      objc_msgSend(v12, "addValue:forHTTPHeaderField:", CFSTR("application/json; charset=UTF-8"), CFSTR("Content-Type"));
      v16 = -[objc_class dataWithJSONObject:options:error:](v15, "dataWithJSONObject:options:error:", v4, 0, 0);
    }
    else
    {
      objc_msgSend(v12, "addValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded; charset=UTF-8"),
        CFSTR("Content-Type"));
      v16 = objc_msgSend((id)objc_msgSend(v4, "pkt_URLEncodedFormString"), "dataUsingEncoding:", 4);
    }
    objc_msgSend(v12, "setHTTPBody:", v16);
  }
  v17 = -[PocketAPI pkt_userAgent](-[PocketAPIOperation API](self, "API"), "pkt_userAgent");
  if (v17)
    objc_msgSend(v12, "addValue:forHTTPHeaderField:", v17, CFSTR("User-Agent"));
  if (v15)
    v18 = CFSTR("application/json");
  else
    v18 = CFSTR("application/x-www-form-urlencoded");
  objc_msgSend(v12, "addValue:forHTTPHeaderField:", v18, CFSTR("X-Accept"));
  return v12;
}

- (void)pkt_connectionFinishedLoading
{
  -[PocketAPIOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[PocketAPIOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  self->finishedLoading = 1;
  -[PocketAPIOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  -[PocketAPIOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));

  self->delegate = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PocketAPIOperation *v4;

  v4 = -[PocketAPIOperation init](+[PocketAPIOperation allocWithZone:](PocketAPIOperation, "allocWithZone:", a3), "init");
  -[PocketAPIOperation setAPI:](v4, "setAPI:", -[PocketAPIOperation API](self, "API"));
  -[PocketAPIOperation setDelegate:](v4, "setDelegate:", -[PocketAPIOperation delegate](self, "delegate"));
  -[PocketAPIOperation setDomain:](v4, "setDomain:", -[PocketAPIOperation domain](self, "domain"));
  -[PocketAPIOperation setHTTPMethod:](v4, "setHTTPMethod:", -[PocketAPIOperation HTTPMethod](self, "HTTPMethod"));
  -[PocketAPIOperation setAPIMethod:](v4, "setAPIMethod:", -[PocketAPIOperation APIMethod](self, "APIMethod"));
  -[PocketAPIOperation setArguments:](v4, "setArguments:", -[PocketAPIOperation arguments](self, "arguments"));
  return v4;
}

- (PocketAPI)API
{
  return self->API;
}

- (void)setAPI:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (PocketAPIDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (NSError)error
{
  return self->error;
}

- (int)domain
{
  return self->domain;
}

- (void)setDomain:(int)a3
{
  self->domain = a3;
}

- (int)HTTPMethod
{
  return self->HTTPMethod;
}

- (void)setHTTPMethod:(int)a3
{
  self->HTTPMethod = a3;
}

- (NSString)APIMethod
{
  return self->APIMethod;
}

- (void)setAPIMethod:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (NSDictionary)arguments
{
  return self->arguments;
}

- (void)setArguments:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (NSURLConnection)connection
{
  return self->connection;
}

- (NSHTTPURLResponse)response
{
  return self->response;
}

- (NSMutableData)data
{
  return self->data;
}

+ (id)encodeForURL:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("!*'();:@&=+$,/?%#[]")),
                 "invertedSet"));
}

+ (id)decodeForURL:(id)a3
{
  return (id)objc_msgSend(a3, "stringByRemovingPercentEncoding");
}

+ (id)errorFromXError:(id)a3 withErrorCode:(unint64_t)a4 HTTPStatusCode:(unint64_t)a5
{
  return 0;
}

@end
