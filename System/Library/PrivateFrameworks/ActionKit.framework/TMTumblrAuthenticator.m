@implementation TMTumblrAuthenticator

- (void)authenticate:(id)a3 urlBlock:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD aBlock[5];
  id v25;
  id v26;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[TMTumblrAuthenticator setThreeLeggedOAuthTokenSecret:](self, "setThreeLeggedOAuthTokenSecret:", 0);
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://tumblr-authorize"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  TMURLEncode(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("https://www.tumblr.com/oauth/request_token?oauth_callback=%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  mutableRequestWithURLString((uint64_t)v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setNonAppInitiated:", 1);
  v16 = (void *)objc_opt_class();
  -[TMTumblrAuthenticator OAuthConsumerKey](self, "OAuthConsumerKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMTumblrAuthenticator OAuthConsumerSecret](self, "OAuthConsumerSecret");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "signRequest:withParameters:consumerKey:consumerSecret:token:tokenSecret:", v15, 0, v17, v18, 0, 0);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__TMTumblrAuthenticator_authenticate_urlBlock_callback___block_invoke;
  aBlock[3] = &unk_24F8B49E8;
  aBlock[4] = self;
  v25 = v9;
  v26 = v8;
  v19 = v8;
  v20 = v9;
  v21 = _Block_copy(aBlock);
  v22 = (void *)MEMORY[0x24BDB7478];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sendAsynchronousRequest:queue:completionHandler:", v15, v23, v21);

}

- (BOOL)handleOpenURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v29;
  void *v31;
  BOOL v32;
  _QWORD v33[5];
  void (**v34)(_QWORD);
  _QWORD aBlock[5];
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("tumblr-authorize"));

  if (v6)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__TMTumblrAuthenticator_handleOpenURL___block_invoke;
    aBlock[3] = &unk_24F8BB638;
    aBlock[4] = self;
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v4, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    type metadata for some(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = v11 != 0;

    if (v11)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("oauth_token"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("oauth_verifier");
      objc_msgSend(v9, "objectForKeyedSubscript:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      mutableRequestWithURLString((uint64_t)CFSTR("https://www.tumblr.com/oauth/access_token"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setNonAppInitiated:", 1);
      objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
      TMDictionaryToQueryString(v14);
      v16 = v7;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dataUsingEncoding:", 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHTTPBody:", v18);

      v19 = objc_opt_class();
      -[TMTumblrAuthenticator OAuthConsumerKey](self, "OAuthConsumerKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TMTumblrAuthenticator OAuthConsumerSecret](self, "OAuthConsumerSecret");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TMTumblrAuthenticator threeLeggedOAuthTokenSecret](self, "threeLeggedOAuthTokenSecret");
      v32 = v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)v19;
      v7 = v16;
      objc_msgSend(v23, "signRequest:withParameters:consumerKey:consumerSecret:token:tokenSecret:", v15, v14, v20, v21, v31, v22);

      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __39__TMTumblrAuthenticator_handleOpenURL___block_invoke_2;
      v33[3] = &unk_24F8B4A10;
      v33[4] = self;
      v34 = v16;
      v24 = _Block_copy(v33);
      v25 = (void *)MEMORY[0x24BDB7478];
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sendAsynchronousRequest:queue:completionHandler:", v15, v26, v24);

      v12 = v32;
    }
    else
    {
      -[TMTumblrAuthenticator threeLeggedOAuthCallback](self, "threeLeggedOAuthCallback");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[TMTumblrAuthenticator threeLeggedOAuthCallback](self, "threeLeggedOAuthCallback");
        v28 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Permission denied by user"), 0, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v28)[2](v28, 0, 0, v29);

      }
      v7[2](v7);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)xAuth:(id)a3 password:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *, void *);
  void *v26;
  id v27;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v28[0] = CFSTR("x_auth_username");
  v28[1] = CFSTR("x_auth_password");
  v29[0] = a3;
  v29[1] = a4;
  v29[2] = CFSTR("client_auth");
  v28[2] = CFSTR("x_auth_mode");
  v28[3] = CFSTR("api_key");
  v9 = a4;
  v10 = a3;
  -[TMTumblrAuthenticator OAuthConsumerKey](self, "OAuthConsumerKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  mutableRequestWithURLString((uint64_t)CFSTR("https://www.tumblr.com/oauth/access_token"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setNonAppInitiated:", 1);
  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  TMDictionaryToQueryString(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataUsingEncoding:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPBody:", v15);

  v16 = (void *)objc_opt_class();
  -[TMTumblrAuthenticator OAuthConsumerKey](self, "OAuthConsumerKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMTumblrAuthenticator OAuthConsumerSecret](self, "OAuthConsumerSecret");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "signRequest:withParameters:consumerKey:consumerSecret:token:tokenSecret:", v13, v12, v17, v18, 0, 0);

  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __49__TMTumblrAuthenticator_xAuth_password_callback___block_invoke;
  v26 = &unk_24F8B4A38;
  v27 = v8;
  v19 = v8;
  v20 = _Block_copy(&v23);
  v21 = (void *)MEMORY[0x24BDB7478];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue", v23, v24, v25, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendAsynchronousRequest:queue:completionHandler:", v13, v22, v20);

}

- (NSString)OAuthConsumerKey
{
  return self->_OAuthConsumerKey;
}

- (void)setOAuthConsumerKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)OAuthConsumerSecret
{
  return self->_OAuthConsumerSecret;
}

- (void)setOAuthConsumerSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)threeLeggedOAuthCallback
{
  return self->_threeLeggedOAuthCallback;
}

- (void)setThreeLeggedOAuthCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)threeLeggedOAuthTokenSecret
{
  return self->_threeLeggedOAuthTokenSecret;
}

- (void)setThreeLeggedOAuthTokenSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threeLeggedOAuthTokenSecret, 0);
  objc_storeStrong(&self->_threeLeggedOAuthCallback, 0);
  objc_storeStrong((id *)&self->_OAuthConsumerSecret, 0);
  objc_storeStrong((id *)&self->_OAuthConsumerKey, 0);
}

void __49__TMTumblrAuthenticator_xAuth_password_callback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v9 + 16))(v9, 0, 0, v8);
  }
  else
  {
    v10 = objc_msgSend(v18, "statusCode");
    if (v10 == 200)
    {
      formEncodedDataToDictionary(v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("oauth_token"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("oauth_token_secret"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *, _QWORD))(v13 + 16))(v13, v14, v15, 0);

      }
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 32);
      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Authentication request failed"), v10, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v16 + 16))(v16, 0, 0, v17);

      }
    }
  }

}

uint64_t __39__TMTumblrAuthenticator_handleOpenURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setThreeLeggedOAuthTokenSecret:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setThreeLeggedOAuthCallback:", 0);
}

void __39__TMTumblrAuthenticator_handleOpenURL___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "threeLeggedOAuthCallback");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "threeLeggedOAuthCallback");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, id))v10)[2](v10, 0, 0, v8);
LABEL_9:

    }
  }
  else
  {
    v11 = objc_msgSend(v16, "statusCode");
    objc_msgSend(*(id *)(a1 + 32), "threeLeggedOAuthCallback");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (v11 == 200)
      {
        formEncodedDataToDictionary(v7);
        v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "threeLeggedOAuthCallback");
        v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("oauth_token"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("oauth_token_secret"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *, _QWORD))v13)[2](v13, v14, v15, 0);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "threeLeggedOAuthCallback");
        v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Authentication request failed"), v11, 0);
        v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v10[2](v10, 0, 0, v13);
      }

      goto LABEL_9;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __56__TMTumblrAuthenticator_authenticate_urlBlock_callback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v9 + 16))(v9, 0, 0, v8);
  }
  else
  {
    v10 = objc_msgSend(v20, "statusCode");
    v11 = *(_QWORD *)(a1 + 40);
    if (v10 == 200)
    {
      objc_msgSend(*(id *)(a1 + 32), "setThreeLeggedOAuthCallback:", *(_QWORD *)(a1 + 40));
      formEncodedDataToDictionary(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("oauth_token_secret"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setThreeLeggedOAuthTokenSecret:", v13);

      v14 = (void *)MEMORY[0x24BDBCF48];
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("oauth_token"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("https://www.tumblr.com/oauth/authorize?oauth_token=%@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Authentication request failed"), v10, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v11 + 16))(v11, 0, 0, v19);

    }
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_predicate != -1)
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_22460);
  return (id)sharedInstance_instance;
}

+ (void)signRequest:(id)a3 withParameters:(id)a4 consumerKey:(id)a5 consumerSecret:(id)a6 token:(id)a7 tokenSecret:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  +[TMSDKUserAgent userAgentHeaderString](TMSDKUserAgent, "userAgentHeaderString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forHTTPHeaderField:", v19, CFSTR("User-Agent"));

  objc_msgSend(v18, "URL");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "HTTPMethod");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "globallyUniqueString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[TMOAuth headerForURL:method:postParameters:nonce:consumerKey:consumerSecret:token:tokenSecret:](TMOAuth, "headerForURL:method:postParameters:nonce:consumerKey:consumerSecret:token:tokenSecret:", v24, v20, v17, v22, v16, v15, v14, v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setValue:forHTTPHeaderField:", v23, CFSTR("Authorization"));
}

void __39__TMTumblrAuthenticator_sharedInstance__block_invoke()
{
  TMTumblrAuthenticator *v0;
  void *v1;

  v0 = objc_alloc_init(TMTumblrAuthenticator);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

@end
