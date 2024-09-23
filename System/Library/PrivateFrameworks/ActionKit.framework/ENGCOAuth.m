@implementation ENGCOAuth

- (ENGCOAuth)initWithConsumerKey:(id)a3 consumerSecret:(id)a4 accessToken:(id)a5 tokenSecret:(id)a6
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  ENGCOAuth *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (__CFString *)a6;
  v27.receiver = self;
  v27.super_class = (Class)ENGCOAuth;
  v14 = -[ENGCOAuth init](&v27, sel_init);
  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BDBCE70]);
    v16 = (void *)objc_msgSend(v10, "copy");
    +[ENGCOAuth nonce](ENGCOAuth, "nonce");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENGCOAuth timeStamp](ENGCOAuth, "timeStamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v12, "copy");
    v20 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", v16, CFSTR("oauth_consumer_key"), v17, CFSTR("oauth_nonce"), v18, CFSTR("oauth_timestamp"), CFSTR("1.0"), CFSTR("oauth_version"), CFSTR("HMAC-SHA1"), CFSTR("oauth_signature_method"), v19, CFSTR("oauth_token"), 0);
    -[ENGCOAuth setOAuthParameters:](v14, "setOAuthParameters:", v20);

    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "pcen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v23 = v13;
    else
      v23 = &stru_24F8BBA48;
    -[__CFString pcen](v23, "pcen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@&%@"), v22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENGCOAuth setSignatureSecret:](v14, "setSignatureSecret:", v25);

  }
  return v14;
}

- (id)request
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDB7458];
  -[ENGCOAuth URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithURL:cachePolicy:timeoutInterval:", v4, 1, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (GCOAuthUserAgent)
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", GCOAuthUserAgent, CFSTR("User-Agent"));
  -[ENGCOAuth authorizationHeader](self, "authorizationHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v6, CFSTR("Authorization"));

  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Accept-Encoding"));
  -[ENGCOAuth HTTPMethod](self, "HTTPMethod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPMethod:", v7);

  objc_msgSend(v5, "setHTTPShouldHandleCookies:", GCOAuthUseHTTPSCookieStorage);
  return v5;
}

- (id)authorizationHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENGCOAuth OAuthParameters](self, "OAuthParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[ENGCOAuth signature](self, "signature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("oauth_signature"));

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __32__ENGCOAuth_authorizationHeader__block_invoke;
  v11[3] = &unk_24F8B6280;
  v12 = v3;
  v7 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("OAuth "), "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)signature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  CCHmacContext v12;
  _BYTE macOut[20];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[ENGCOAuth signatureBase](self, "signatureBase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENGCOAuth signatureSecret](self, "signatureSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v12, 0, sizeof(v12));
  v7 = objc_retainAutorelease(v6);
  CCHmacInit(&v12, 0, (const void *)objc_msgSend(v7, "bytes", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0),
    objc_msgSend(v7, "length"));
  v8 = objc_retainAutorelease(v4);
  CCHmacUpdate(&v12, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
  CCHmacFinal(&v12, macOut);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", macOut, 20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)signatureBase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  ENGCOAuth *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENGCOAuth OAuthParameters](self, "OAuthParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  v39 = self;
  -[ENGCOAuth requestParameters](self, "requestParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v3;
  objc_msgSend(v3, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v40, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v14, "pcen");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pcen");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@=%@"), v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "addObject:", v19);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v11);
  }

  v38 = v6;
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("&"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENGCOAuth URL](v39, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v21, "scheme");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lowercaseString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "host");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lowercaseString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "path");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@://%@%@"), v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x24BDBCE30];
  -[ENGCOAuth HTTPMethod](v39, "HTTPMethod");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pcen");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28;
  objc_msgSend(v28, "pcen");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pcen");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "arrayWithObjects:", v31, v33, v34, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "componentsJoinedByString:", CFSTR("&"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (NSDictionary)requestParameters
{
  return self->__parameters;
}

- (void)setRequestParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)HTTPMethod
{
  return self->__method;
}

- (void)setHTTPMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)URL
{
  return self->__url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)signatureSecret
{
  return self->_signatureSecret;
}

- (void)setSignatureSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)OAuthParameters
{
  return self->_OAuthParameters;
}

- (void)setOAuthParameters:(id)a3
{
  objc_storeStrong((id *)&self->_OAuthParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OAuthParameters, 0);
  objc_storeStrong((id *)&self->_signatureSecret, 0);
  objc_storeStrong((id *)&self->__url, 0);
  objc_storeStrong((id *)&self->__method, 0);
  objc_storeStrong((id *)&self->__parameters, 0);
}

void __32__ENGCOAuth_authorizationHeader__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(a2, "pcen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pcen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=\"%@\"), v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
}

+ (void)setUserAgent:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)GCOAuthUserAgent;
  GCOAuthUserAgent = v3;

}

+ (void)setTimeStampOffset:(int64_t)a3
{
  GCOAuthTimeStampOffset = a3;
}

+ (void)setHTTPShouldHandleCookies:(BOOL)a3
{
  GCOAuthUseHTTPSCookieStorage = a3;
}

+ (id)nonce
{
  const __CFUUID *v2;
  __CFString *v3;

  v2 = CFUUIDCreate(0);
  v3 = (__CFString *)CFUUIDCreateString(0, v2);
  CFRelease(v2);
  return v3;
}

+ (id)timeStamp
{
  tm *v2;
  time_t v4;

  v4 = 0;
  time(&v4);
  v2 = gmtime(&v4);
  mktime(v2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), GCOAuthTimeStampOffset + v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)queryStringFromParameters:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__ENGCOAuth_queryStringFromParameters___block_invoke;
  v9[3] = &unk_24F8B6280;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("&"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)URLRequestForPath:(id)a3 GETParameters:(id)a4 host:(id)a5 consumerKey:(id)a6 consumerSecret:(id)a7 accessToken:(id)a8 tokenSecret:(id)a9
{
  return (id)objc_msgSend(a1, "URLRequestForPath:GETParameters:scheme:host:consumerKey:consumerSecret:accessToken:tokenSecret:", a3, a4, CFSTR("http"), a5, a6, a7, a8, a9);
}

+ (id)URLRequestForPath:(id)a3 GETParameters:(id)a4 scheme:(id)a5 host:(id)a6 consumerKey:(id)a7 consumerSecret:(id)a8 accessToken:(id)a9 tokenSecret:(id)a10
{
  void *v10;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ENGCOAuth *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;

  v10 = 0;
  if (a3 && a6)
  {
    v17 = a10;
    v18 = a9;
    v19 = a8;
    v20 = a7;
    v21 = a6;
    v22 = a5;
    v23 = a4;
    v24 = a3;
    v25 = -[ENGCOAuth initWithConsumerKey:consumerSecret:accessToken:tokenSecret:]([ENGCOAuth alloc], "initWithConsumerKey:consumerSecret:accessToken:tokenSecret:", v20, v19, v18, v17);

    -[ENGCOAuth setHTTPMethod:](v25, "setHTTPMethod:", CFSTR("GET"));
    -[ENGCOAuth setRequestParameters:](v25, "setRequestParameters:", v23);

    objc_msgSend(v24, "stringByAddingPercentEscapesUsingEncoding:", 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@%@"), v22, v21, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[ENGCOAuth requestParameters](v25, "requestParameters");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29)
    {
      -[ENGCOAuth requestParameters](v25, "requestParameters");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[ENGCOAuth queryStringFromParameters:](ENGCOAuth, "queryStringFromParameters:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@?%@"), v27, v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v32;
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENGCOAuth setURL:](v25, "setURL:", v33);

    -[ENGCOAuth request](v25, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)URLRequestForPath:(id)a3 POSTParameters:(id)a4 host:(id)a5 consumerKey:(id)a6 consumerSecret:(id)a7 accessToken:(id)a8 tokenSecret:(id)a9
{
  void *v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ENGCOAuth *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v9 = 0;
  if (a3 && a5)
  {
    v16 = a9;
    v17 = a8;
    v18 = a7;
    v19 = a6;
    v20 = a5;
    v21 = a4;
    v22 = a3;
    v23 = -[ENGCOAuth initWithConsumerKey:consumerSecret:accessToken:tokenSecret:]([ENGCOAuth alloc], "initWithConsumerKey:consumerSecret:accessToken:tokenSecret:", v19, v18, v17, v16);

    -[ENGCOAuth setHTTPMethod:](v23, "setHTTPMethod:", CFSTR("POST"));
    -[ENGCOAuth setRequestParameters:](v23, "setRequestParameters:", v21);

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithScheme:host:path:", CFSTR("https"), v20, v22);
    -[ENGCOAuth setURL:](v23, "setURL:", v24);
    -[ENGCOAuth request](v23, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENGCOAuth requestParameters](v23, "requestParameters");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      -[ENGCOAuth requestParameters](v23, "requestParameters");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[ENGCOAuth queryStringFromParameters:](ENGCOAuth, "queryStringFromParameters:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "dataUsingEncoding:", 4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v29, "length"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHTTPBody:", v29);
      objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));
      objc_msgSend(v9, "setValue:forHTTPHeaderField:", v30, CFSTR("Content-Length"));

    }
  }
  return v9;
}

void __39__ENGCOAuth_queryStringFromParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(a2, "pcen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pcen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
}

@end
