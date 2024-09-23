@implementation JXHTTPOperation

- (unint64_t)requestCachePolicy
{
  void *v2;
  unint64_t v3;

  -[JXURLConnectionOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cachePolicy");

  return v3;
}

- (void)setRequestCachePolicy:(unint64_t)a3
{
  id v4;

  -[JXURLConnectionOperation request](self, "request");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCachePolicy:", a3);

}

- (BOOL)requestShouldUsePipelining
{
  void *v2;
  char v3;

  -[JXURLConnectionOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "HTTPShouldUsePipelining");

  return v3;
}

- (void)setRequestShouldUsePipelining:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[JXURLConnectionOperation request](self, "request");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTPShouldUsePipelining:", v3);

}

- (NSURL)requestMainDocumentURL
{
  void *v2;
  void *v3;

  -[JXURLConnectionOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainDocumentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setRequestMainDocumentURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JXURLConnectionOperation request](self, "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMainDocumentURL:", v4);

}

- (double)requestTimeoutInterval
{
  void *v2;
  double v3;
  double v4;

  -[JXURLConnectionOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeoutInterval");
  v4 = v3;

  return v4;
}

- (void)setRequestTimeoutInterval:(double)a3
{
  id v4;

  -[JXURLConnectionOperation request](self, "request");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeoutInterval:", a3);

}

- (unint64_t)requestNetworkServiceType
{
  void *v2;
  unint64_t v3;

  -[JXURLConnectionOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkServiceType");

  return v3;
}

- (void)setRequestNetworkServiceType:(unint64_t)a3
{
  id v4;

  -[JXURLConnectionOperation request](self, "request");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNetworkServiceType:", a3);

}

- (NSURL)requestURL
{
  void *v2;
  void *v3;

  -[JXURLConnectionOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setRequestURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JXURLConnectionOperation request](self, "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURL:", v4);

}

- (NSDictionary)requestHeaders
{
  void *v2;
  void *v3;

  -[JXURLConnectionOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allHTTPHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setRequestHeaders:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JXURLConnectionOperation request](self, "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllHTTPHeaderFields:", v4);

}

- (NSString)requestMethod
{
  void *v2;
  void *v3;

  -[JXURLConnectionOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "HTTPMethod");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setRequestMethod:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JXURLConnectionOperation request](self, "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPMethod:", v4);

}

- (BOOL)requestShouldHandleCookies
{
  void *v2;
  char v3;

  -[JXURLConnectionOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "HTTPShouldHandleCookies");

  return v3;
}

- (void)setRequestShouldHandleCookies:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[JXURLConnectionOperation request](self, "request");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTPShouldHandleCookies:", v3);

}

- (void)addValue:(id)a3 forRequestHeader:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[JXURLConnectionOperation request](self, "request");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addValue:forHTTPHeaderField:", v7, v6);

}

- (void)setValue:(id)a3 forRequestHeader:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[JXURLConnectionOperation request](self, "request");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", v7, v6);

}

- (id)responseData
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v15;

  -[JXURLConnectionOperation outputStream](self, "outputStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BDBCB88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[JXHTTPOperation responseDataFilePath](self, "responseDataFilePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x24BDBCE50]);
      -[JXHTTPOperation responseDataFilePath](self, "responseDataFilePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v4 = (void *)objc_msgSend(v7, "initWithContentsOfFile:options:error:", v8, 1, &v15);
      v9 = v15;

      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPOperation+Convenience.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%@ (%d) ERROR: %@"), v11, 121, v12);

      }
    }
    else
    {
      v4 = 0;
    }
  }
  v13 = v4;

  return v13;
}

- (id)responseString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  CFStringEncoding v8;
  unint64_t v9;
  void *v10;

  -[JXHTTPOperation responseData](self, "responseData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[JXURLConnectionOperation response](self, "response");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textEncodingName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5
      || (-[JXURLConnectionOperation response](self, "response"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "textEncodingName"),
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v8 = CFStringConvertIANACharSetNameToEncoding(v7),
          v8 == -1))
    {
      v9 = 4;
    }
    else
    {
      v9 = CFStringConvertEncodingToNSStringEncoding(v8);
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)responseJSON
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;

  -[JXHTTPOperation responseData](self, "responseData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v2, 0, &v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPOperation+Convenience.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@ (%d) ERROR: %@"), v6, 155, v7);

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)responseHeaders
{
  void *v2;
  void *v3;

  -[JXURLConnectionOperation response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)responseStatusCode
{
  void *v2;
  int64_t v3;

  -[JXURLConnectionOperation response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusCode");

  return v3;
}

- (id)responseStatusString
{
  return (id)objc_msgSend(MEMORY[0x24BDB7450], "localizedStringForStatusCode:", -[JXHTTPOperation responseStatusCode](self, "responseStatusCode"));
}

- (int64_t)responseExpectedContentLength
{
  void *v2;
  int64_t v3;

  -[JXURLConnectionOperation response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "expectedContentLength");

  return v3;
}

- (id)responseExpectedFileName
{
  void *v2;
  void *v3;

  -[JXURLConnectionOperation response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestedFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)responseMIMEType
{
  void *v2;
  void *v3;

  -[JXURLConnectionOperation response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MIMEType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)responseTextEncodingName
{
  void *v2;
  void *v3;

  -[JXURLConnectionOperation response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textEncodingName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)responseURL
{
  void *v2;
  void *v3;

  -[JXURLConnectionOperation response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)JXHTTPOperation;
  -[JXURLConnectionOperation dealloc](&v2, sel_dealloc);
}

- (JXHTTPOperation)init
{
  JXHTTPOperation *v2;
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  dispatch_queue_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)JXHTTPOperation;
  v2 = -[JXURLConnectionOperation init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.%p.blocks"), v5, v2);

    v7 = objc_retainAutorelease(v6);
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), 0);
    -[JXHTTPOperation setBlockQueue:](v2, "setBlockQueue:", v8);

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "globallyUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[JXHTTPOperation setUniqueString:](v2, "setUniqueString:", v10);

    -[JXHTTPOperation setDownloadProgress:](v2, "setDownloadProgress:", &unk_24F93C708);
    -[JXHTTPOperation setUploadProgress:](v2, "setUploadProgress:", &unk_24F93C708);
    -[JXHTTPOperation setPerformsBlocksOnMainQueue:](v2, "setPerformsBlocksOnMainQueue:", 0);
    -[JXHTTPOperation setUpdatesNetworkActivityIndicator:](v2, "setUpdatesNetworkActivityIndicator:", 1);
    -[JXHTTPOperation setAuthenticationChallenge:](v2, "setAuthenticationChallenge:", 0);
    -[JXHTTPOperation setResponseDataFilePath:](v2, "setResponseDataFilePath:", 0);
    -[JXHTTPOperation setCredential:](v2, "setCredential:", 0);
    -[JXHTTPOperation setUserObject:](v2, "setUserObject:", 0);
    -[JXHTTPOperation setUseCredentialStorage:](v2, "setUseCredentialStorage:", 1);
    -[JXHTTPOperation setTrustedHosts:](v2, "setTrustedHosts:", 0);
    -[JXHTTPOperation setTrustAllHosts:](v2, "setTrustAllHosts:", 0);
    -[JXHTTPOperation setUsername:](v2, "setUsername:", 0);
    -[JXHTTPOperation setPassword:](v2, "setPassword:", 0);
    -[JXHTTPOperation setStartDate:](v2, "setStartDate:", 0);
    -[JXHTTPOperation setFinishDate:](v2, "setFinishDate:", 0);
    -[JXHTTPOperation setWillStartBlock:](v2, "setWillStartBlock:", 0);
    -[JXHTTPOperation setWillNeedNewBodyStreamBlock:](v2, "setWillNeedNewBodyStreamBlock:", 0);
    -[JXHTTPOperation setWillSendRequestForAuthenticationChallengeBlock:](v2, "setWillSendRequestForAuthenticationChallengeBlock:", 0);
    -[JXHTTPOperation setWillSendRequestRedirectBlock:](v2, "setWillSendRequestRedirectBlock:", 0);
    -[JXHTTPOperation setWillCacheResponseBlock:](v2, "setWillCacheResponseBlock:", 0);
    -[JXHTTPOperation setDidStartBlock:](v2, "setDidStartBlock:", 0);
    -[JXHTTPOperation setDidReceiveResponseBlock:](v2, "setDidReceiveResponseBlock:", 0);
    -[JXHTTPOperation setDidReceiveDataBlock:](v2, "setDidReceiveDataBlock:", 0);
    -[JXHTTPOperation setDidSendDataBlock:](v2, "setDidSendDataBlock:", 0);
    -[JXHTTPOperation setDidFinishLoadingBlock:](v2, "setDidFinishLoadingBlock:", 0);
    -[JXHTTPOperation setDidFailBlock:](v2, "setDidFailBlock:", 0);

  }
  return v2;
}

- (void)performDelegateMethod:(SEL)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;

  if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[JXHTTPOperation delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[JXHTTPOperation delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "performSelector:onThread:withObject:waitUntilDone:", a3, v8, self, 1);

    }
    -[JXHTTPOperation requestBody](self, "requestBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[JXHTTPOperation requestBody](self, "requestBody");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performSelector:onThread:withObject:waitUntilDone:", a3, v12, self, 1);

    }
    -[JXHTTPOperation blockForSelector:](self, "blockForSelector:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) == 0 && v13)
    {
      v14 = -[JXHTTPOperation performsBlocksOnMainQueue](self, "performsBlocksOnMainQueue");
      if (v14)
      {
        v15 = MEMORY[0x24BDAC9B8];
        v16 = MEMORY[0x24BDAC9B8];
      }
      else
      {
        -[JXHTTPOperation blockQueue](self, "blockQueue");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __41__JXHTTPOperation_performDelegateMethod___block_invoke;
      v18[3] = &unk_24F8BB5E0;
      v18[4] = self;
      v19 = v13;
      dispatch_async(v15, v18);
      v17 = MEMORY[0x24BDAC9B8];
      if (!v14)
        v17 = v15;

    }
  }
}

- (void)finalizeRequestBody
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  -[JXHTTPOperation requestBody](self, "requestBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JXHTTPOperation requestBody](self, "requestBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "httpInputStream");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[JXURLConnectionOperation request](self, "request");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHTTPBodyStream:", v23);

    }
    -[JXURLConnectionOperation request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "HTTPMethod");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("GET"));

    if (v9)
    {
      -[JXURLConnectionOperation request](self, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));

    }
    -[JXHTTPOperation requestBody](self, "requestBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "httpContentType");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v12, "length"))
    {

      v12 = CFSTR("application/octet-stream");
    }
    -[JXURLConnectionOperation request](self, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[JXURLConnectionOperation request](self, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forHTTPHeaderField:", v12, CFSTR("Content-Type"));

    }
    -[JXURLConnectionOperation request](self, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForHTTPHeaderField:", CFSTR("User-Agent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[JXURLConnectionOperation request](self, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValue:forHTTPHeaderField:", CFSTR("JXHTTP"), CFSTR("User-Agent"));

    }
    -[JXHTTPOperation requestBody](self, "requestBody");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "httpContentLength");

    if (v20 >= 1)
    {
      -[JXURLConnectionOperation request](self, "request");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%lld"), v20);
      objc_msgSend(v21, "setValue:forHTTPHeaderField:", v22, CFSTR("Content-Length"));

    }
  }
}

- (id)blockForSelector:(SEL)a3
{
  void *v4;

  if (sel_httpOperationWillStart_ == a3)
  {
    -[JXHTTPOperation willStartBlock](self, "willStartBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationWillNeedNewBodyStream_ == a3)
  {
    -[JXHTTPOperation willNeedNewBodyStreamBlock](self, "willNeedNewBodyStreamBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationWillSendRequestForAuthenticationChallenge_ == a3)
  {
    -[JXHTTPOperation willSendRequestForAuthenticationChallengeBlock](self, "willSendRequestForAuthenticationChallengeBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationDidStart_ == a3)
  {
    -[JXHTTPOperation didStartBlock](self, "didStartBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationDidReceiveResponse_ == a3)
  {
    -[JXHTTPOperation didReceiveResponseBlock](self, "didReceiveResponseBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationDidReceiveData_ == a3)
  {
    -[JXHTTPOperation didReceiveDataBlock](self, "didReceiveDataBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationDidSendData_ == a3)
  {
    -[JXHTTPOperation didSendDataBlock](self, "didSendDataBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationDidFinishLoading_ == a3)
  {
    -[JXHTTPOperation didFinishLoadingBlock](self, "didFinishLoadingBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (sel_httpOperationDidFail_ != a3)
      return 0;
    -[JXHTTPOperation didFailBlock](self, "didFailBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setResponseDataFilePath:(id)a3
{
  NSString *v4;
  NSString *responseDataFilePath;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) == 0
    && !-[JXOperation isExecuting](self, "isExecuting")
    && !-[JXOperation isFinished](self, "isFinished"))
  {
    v4 = (NSString *)objc_msgSend(v11, "copy");
    responseDataFilePath = self->_responseDataFilePath;
    self->_responseDataFilePath = v4;

    -[JXHTTPOperation responseDataFilePath](self, "responseDataFilePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDBCF08];
      -[JXHTTPOperation responseDataFilePath](self, "responseDataFilePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "outputStreamToFileAtPath:append:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[JXURLConnectionOperation setOutputStream:](self, "setOutputStream:", v10);

    }
  }

}

- (double)elapsedSeconds
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[JXHTTPOperation startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[JXHTTPOperation finishDate](self, "finishDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[JXHTTPOperation finishDate](self, "finishDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  }
  v7 = v5;

  -[JXHTTPOperation startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  return v10;
}

- (void)main
{
  id v3;
  objc_super v4;

  if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[JXHTTPOperation performDelegateMethod:](self, "performDelegateMethod:", sel_httpOperationWillStart_);
    -[JXHTTPOperation finalizeRequestBody](self, "finalizeRequestBody");
    v3 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    -[JXHTTPOperation setStartDate:](self, "setStartDate:", v3);

    v4.receiver = self;
    v4.super_class = (Class)JXHTTPOperation;
    -[JXURLConnectionOperation main](&v4, sel_main);
    -[JXHTTPOperation performDelegateMethod:](self, "performDelegateMethod:", sel_httpOperationDidStart_);
  }
}

- (void)willFinish
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)JXHTTPOperation;
  -[JXURLConnectionOperation willFinish](&v2, sel_willFinish);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JXHTTPOperation;
  -[JXURLConnectionOperation connection:didFailWithError:](&v6, sel_connection_didFailWithError_, a3, a4);
  if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    -[JXHTTPOperation setFinishDate:](self, "setFinishDate:", v5);

    -[JXHTTPOperation performDelegateMethod:](self, "performDelegateMethod:", sel_httpOperationDidFail_);
  }
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (-[JXHTTPOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend(v5, "sender");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelAuthenticationChallenge:", v5);

    goto LABEL_28;
  }
  -[JXHTTPOperation setAuthenticationChallenge:](self, "setAuthenticationChallenge:", v5);
  -[JXHTTPOperation performDelegateMethod:](self, "performDelegateMethod:", sel_httpOperationWillSendRequestForAuthenticationChallenge_);
  -[JXHTTPOperation credential](self, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[JXHTTPOperation authenticationChallenge](self, "authenticationChallenge");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "protectionSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authenticationMethod");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x24BDB7410];

    if (v10 == v11)
    {
      if (-[JXHTTPOperation trustAllHosts](self, "trustAllHosts"))
      {
LABEL_18:
        v22 = (void *)MEMORY[0x24BDB7480];
        -[JXHTTPOperation authenticationChallenge](self, "authenticationChallenge");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "protectionSpace");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "credentialForTrust:", objc_msgSend(v24, "serverTrust"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[JXHTTPOperation setCredential:](self, "setCredential:", v25);

      }
      else
      {
        -[JXHTTPOperation trustedHosts](self, "trustedHosts");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          -[JXHTTPOperation trustedHosts](self, "trustedHosts", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v40;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v40 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                -[JXHTTPOperation authenticationChallenge](self, "authenticationChallenge");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "protectionSpace");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "host");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v18) = objc_msgSend(v18, "isEqualToString:", v21);

                if ((v18 & 1) != 0)
                {

                  goto LABEL_18;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
              if (v15)
                continue;
              break;
            }
          }

        }
      }
    }
  }
  -[JXHTTPOperation credential](self, "credential");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    goto LABEL_20;
  -[JXHTTPOperation username](self, "username");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[JXHTTPOperation password](self, "password");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = (void *)MEMORY[0x24BDB7480];
      -[JXHTTPOperation username](self, "username");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[JXHTTPOperation password](self, "password");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "credentialWithUser:password:persistence:", v26, v36, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[JXHTTPOperation setCredential:](self, "setCredential:", v37);

LABEL_20:
    }
  }
  -[JXHTTPOperation credential](self, "credential");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[JXHTTPOperation authenticationChallenge](self, "authenticationChallenge");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sender");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[JXHTTPOperation credential](self, "credential");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[JXHTTPOperation authenticationChallenge](self, "authenticationChallenge");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "useCredential:forAuthenticationChallenge:", v30, v31);

  }
  else
  {
    -[JXHTTPOperation authenticationChallenge](self, "authenticationChallenge");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "continueWithoutCredentialForAuthenticationChallenge:", v38);

  }
LABEL_28:

}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JXHTTPOperation;
  -[JXURLConnectionOperation connection:didReceiveResponse:](&v5, sel_connection_didReceiveResponse_, a3, a4);
  if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) == 0)
    -[JXHTTPOperation performDelegateMethod:](self, "performDelegateMethod:", sel_httpOperationDidReceiveResponse_);
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)JXHTTPOperation;
  -[JXURLConnectionOperation connection:didReceiveData:](&v10, sel_connection_didReceiveData_, a3, a4);
  if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[JXURLConnectionOperation response](self, "response");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "expectedContentLength");

    if (v6 >= 1)
    {
      v7 = (void *)MEMORY[0x24BDD16E0];
      *(float *)&v8 = (float)-[JXURLConnectionOperation bytesDownloaded](self, "bytesDownloaded") / (float)v6;
      objc_msgSend(v7, "numberWithFloat:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[JXHTTPOperation setDownloadProgress:](self, "setDownloadProgress:", v9);

    }
    -[JXHTTPOperation performDelegateMethod:](self, "performDelegateMethod:", sel_httpOperationDidReceiveData_);
  }
}

- (void)connectionDidFinishLoading:(id)a3
{
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;
  float v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)JXHTTPOperation;
  -[JXURLConnectionOperation connectionDidFinishLoading:](&v11, sel_connectionDidFinishLoading_, a3);
  if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[JXHTTPOperation downloadProgress](self, "downloadProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v6 = v5;

    if (v6 != 1.0)
      -[JXHTTPOperation setDownloadProgress:](self, "setDownloadProgress:", &unk_24F93C718);
    -[JXHTTPOperation uploadProgress](self, "uploadProgress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    if (v9 != 1.0)
      -[JXHTTPOperation setUploadProgress:](self, "setUploadProgress:", &unk_24F93C718);
    v10 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    -[JXHTTPOperation setFinishDate:](self, "setFinishDate:", v10);

    -[JXHTTPOperation performDelegateMethod:](self, "performDelegateMethod:", sel_httpOperationDidFinishLoading_);
  }
}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)JXHTTPOperation;
  -[JXURLConnectionOperation connection:didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:](&v11, sel_connection_didSendBodyData_totalBytesWritten_totalBytesExpectedToWrite_, a3, a4);
  if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (a6 >= 1)
    {
      *(float *)&v9 = (float)a5 / (float)a6;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[JXHTTPOperation setUploadProgress:](self, "setUploadProgress:", v10);

    }
    -[JXHTTPOperation performDelegateMethod:](self, "performDelegateMethod:", sel_httpOperationDidSendData_);
  }
}

- (id)connection:(id)a3 needNewBodyStream:(id)a4
{
  void *v5;
  void *v6;

  if ((-[JXHTTPOperation isCancelled](self, "isCancelled", a3, a4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[JXHTTPOperation performDelegateMethod:](self, "performDelegateMethod:", sel_httpOperationWillNeedNewBodyStream_);
    -[JXHTTPOperation requestBody](self, "requestBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "httpInputStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  _QWORD block[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v7 = a4;
  if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[JXHTTPOperation delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    -[JXHTTPOperation requestBody](self, "requestBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0
      || (v12 & 1) != 0
      || (-[JXHTTPOperation willCacheResponseBlock](self, "willCacheResponseBlock"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__32025;
      v38 = __Block_byref_object_dispose__32026;
      v39 = 0;
      -[JXHTTPOperation delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[JXHTTPOperation delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "httpOperation:willCacheResponse:", self, v7);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v35[5];
        v35[5] = v17;

      }
      -[JXHTTPOperation requestBody](self, "requestBody");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        -[JXHTTPOperation requestBody](self, "requestBody");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "httpOperation:willCacheResponse:", self, v7);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v35[5];
        v35[5] = v22;

      }
      -[JXHTTPOperation willCacheResponseBlock](self, "willCacheResponseBlock");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = -[JXHTTPOperation performsBlocksOnMainQueue](self, "performsBlocksOnMainQueue");
        if (v25)
        {
          v26 = MEMORY[0x24BDAC9B8];
          v27 = MEMORY[0x24BDAC9B8];
        }
        else
        {
          -[JXHTTPOperation blockQueue](self, "blockQueue");
          v26 = objc_claimAutoreleasedReturnValue();
        }
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __48__JXHTTPOperation_connection_willCacheResponse___block_invoke;
        block[3] = &unk_24F8B9FF0;
        v33 = &v34;
        block[4] = self;
        v32 = v7;
        dispatch_sync(v26, block);
        v28 = MEMORY[0x24BDAC9B8];
        if (!v25)
          v28 = v26;

      }
      if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) != 0)
        v29 = 0;
      else
        v29 = (void *)v35[5];
      v8 = v29;
      _Block_object_dispose(&v34, 8);

    }
    else
    {
      v8 = v7;
    }
  }

  return v8;
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  JXHTTPOperation *v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v8 = a3;
  v9 = a4;
  v10 = (unint64_t)a5;
  if ((-[JXHTTPOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[JXHTTPOperation delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    -[JXHTTPOperation requestBody](self, "requestBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0
      || (v15 & 1) != 0
      || (-[JXHTTPOperation willSendRequestRedirectBlock](self, "willSendRequestRedirectBlock"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          v16))
    {
      v38 = 0;
      v39 = &v38;
      v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__32025;
      v42 = __Block_byref_object_dispose__32026;
      v43 = 0;
      if ((v13 & 1) != 0)
      {
        -[JXHTTPOperation delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "httpOperation:willSendRequest:redirectResponse:", self, v9, v10);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v39[5];
        v39[5] = v18;

      }
      if ((v15 & 1) != 0)
      {
        -[JXHTTPOperation requestBody](self, "requestBody");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "httpOperation:willSendRequest:redirectResponse:", self, v9, v10);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v39[5];
        v39[5] = v21;

      }
      -[JXHTTPOperation willSendRequestRedirectBlock](self, "willSendRequestRedirectBlock");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = -[JXHTTPOperation performsBlocksOnMainQueue](self, "performsBlocksOnMainQueue");
        if (v24)
        {
          v25 = MEMORY[0x24BDAC9B8];
          v26 = MEMORY[0x24BDAC9B8];
        }
        else
        {
          -[JXHTTPOperation blockQueue](self, "blockQueue");
          v25 = objc_claimAutoreleasedReturnValue();
        }
        v30 = MEMORY[0x24BDAC760];
        v31 = 3221225472;
        v32 = __63__JXHTTPOperation_connection_willSendRequest_redirectResponse___block_invoke;
        v33 = &unk_24F8B64A8;
        v37 = &v38;
        v34 = self;
        v35 = v9;
        v36 = (id)v10;
        dispatch_sync(v25, &v30);
        v27 = MEMORY[0x24BDAC9B8];
        if (!v24)
          v27 = v25;

      }
      if (!(v10 | v39[5]))
        -[JXOperation cancel](self, "cancel");
      if ((-[JXHTTPOperation isCancelled](self, "isCancelled", v30, v31, v32, v33, v34) & 1) != 0)
        v28 = 0;
      else
        v28 = (void *)v39[5];
      v11 = v28;
      _Block_object_dispose(&v38, 8);

    }
    else
    {
      v11 = v9;
    }
  }

  return v11;
}

- (JXHTTPOperationDelegate)delegate
{
  return (JXHTTPOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (JXHTTPRequestBody)requestBody
{
  return (JXHTTPRequestBody *)objc_getProperty(self, a2, 336, 1);
}

- (void)setRequestBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSString)uniqueString
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setUniqueString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSString)responseDataFilePath
{
  return self->_responseDataFilePath;
}

- (id)userObject
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setUserObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSURLAuthenticationChallenge)authenticationChallenge
{
  return (NSURLAuthenticationChallenge *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAuthenticationChallenge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSURLCredential)credential
{
  return (NSURLCredential *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCredential:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (BOOL)useCredentialStorage
{
  return self->_useCredentialStorage;
}

- (void)setUseCredentialStorage:(BOOL)a3
{
  self->_useCredentialStorage = a3;
}

- (BOOL)trustAllHosts
{
  return self->_trustAllHosts;
}

- (void)setTrustAllHosts:(BOOL)a3
{
  self->_trustAllHosts = a3;
}

- (NSArray)trustedHosts
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setTrustedHosts:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 384);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (void)setUsername:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 392);
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 400);
}

- (NSNumber)downloadProgress
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setDownloadProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSNumber)uploadProgress
{
  return (NSNumber *)objc_getProperty(self, a2, 416, 1);
}

- (void)setUploadProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (BOOL)updatesNetworkActivityIndicator
{
  return self->_updatesNetworkActivityIndicator;
}

- (void)setUpdatesNetworkActivityIndicator:(BOOL)a3
{
  self->_updatesNetworkActivityIndicator = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 424, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSDate)finishDate
{
  return (NSDate *)objc_getProperty(self, a2, 432, 1);
}

- (void)setFinishDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (BOOL)performsBlocksOnMainQueue
{
  return self->_performsBlocksOnMainQueue;
}

- (void)setPerformsBlocksOnMainQueue:(BOOL)a3
{
  self->_performsBlocksOnMainQueue = a3;
}

- (id)willStartBlock
{
  return objc_getProperty(self, a2, 440, 1);
}

- (void)setWillStartBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (id)willNeedNewBodyStreamBlock
{
  return objc_getProperty(self, a2, 448, 1);
}

- (void)setWillNeedNewBodyStreamBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

- (id)willSendRequestForAuthenticationChallengeBlock
{
  return objc_getProperty(self, a2, 456, 1);
}

- (void)setWillSendRequestForAuthenticationChallengeBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (id)didStartBlock
{
  return objc_getProperty(self, a2, 464, 1);
}

- (void)setDidStartBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (id)didReceiveResponseBlock
{
  return objc_getProperty(self, a2, 472, 1);
}

- (void)setDidReceiveResponseBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 472);
}

- (id)didReceiveDataBlock
{
  return objc_getProperty(self, a2, 480, 1);
}

- (void)setDidReceiveDataBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

- (id)didSendDataBlock
{
  return objc_getProperty(self, a2, 488, 1);
}

- (void)setDidSendDataBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

- (id)didFinishLoadingBlock
{
  return objc_getProperty(self, a2, 496, 1);
}

- (void)setDidFinishLoadingBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 496);
}

- (id)didFailBlock
{
  return objc_getProperty(self, a2, 504, 1);
}

- (void)setDidFailBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 504);
}

- (id)willCacheResponseBlock
{
  return objc_getProperty(self, a2, 512, 1);
}

- (void)setWillCacheResponseBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 512);
}

- (id)willSendRequestRedirectBlock
{
  return objc_getProperty(self, a2, 520, 1);
}

- (void)setWillSendRequestRedirectBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 520);
}

- (OS_dispatch_queue)blockQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 528, 1);
}

- (void)setBlockQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockQueue, 0);
  objc_storeStrong(&self->_willSendRequestRedirectBlock, 0);
  objc_storeStrong(&self->_willCacheResponseBlock, 0);
  objc_storeStrong(&self->_didFailBlock, 0);
  objc_storeStrong(&self->_didFinishLoadingBlock, 0);
  objc_storeStrong(&self->_didSendDataBlock, 0);
  objc_storeStrong(&self->_didReceiveDataBlock, 0);
  objc_storeStrong(&self->_didReceiveResponseBlock, 0);
  objc_storeStrong(&self->_didStartBlock, 0);
  objc_storeStrong(&self->_willSendRequestForAuthenticationChallengeBlock, 0);
  objc_storeStrong(&self->_willNeedNewBodyStreamBlock, 0);
  objc_storeStrong(&self->_willStartBlock, 0);
  objc_storeStrong((id *)&self->_finishDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uploadProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_trustedHosts, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_authenticationChallenge, 0);
  objc_storeStrong(&self->_userObject, 0);
  objc_storeStrong((id *)&self->_responseDataFilePath, 0);
  objc_storeStrong((id *)&self->_uniqueString, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __63__JXHTTPOperation_connection_willSendRequest_redirectResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "willSendRequestRedirectBlock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __48__JXHTTPOperation_connection_willCacheResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "willCacheResponseBlock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __41__JXHTTPOperation_performDelegateMethod___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

+ (id)withURLString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v4);

  v7 = (void *)objc_msgSend(v5, "initWithURL:", v6);
  return v7;
}

+ (id)withURLString:(id)a3 queryParameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    +[JXURLEncoding encodedDictionary:](JXURLEncoding, "encodedDictionary:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("?%@"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "withURLString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
