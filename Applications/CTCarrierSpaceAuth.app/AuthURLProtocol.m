@implementation AuthURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
    LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("carrierspaceauth"));

  }
  return (char)v4;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AuthURLProtocol;
  return objc_msgSendSuper2(&v5, "requestIsCacheEquivalent:toRequest:", a3, a4);
}

- (void)startLoading
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v3 = sub_1000036C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuthURLProtocol request](self, "request"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loading URL: %@", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AuthURLProtocol request](self, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  v18 = 0;
  objc_msgSend(v7, "openSensitiveURL:withOptions:error:", v9, v10, &v18);
  v11 = v18;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AuthURLProtocol client](self, "client"));
  v13 = sub_1000036C4();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to open URL, error: %@", buf, 0xCu);
    }

    objc_msgSend(v12, "URLProtocol:didFailWithError:", self, v11);
  }
  else
  {
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AuthURLProtocol request](self, "request"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URL"));
      *(_DWORD *)buf = 138412290;
      v20 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Successfully loaded URL: %@", buf, 0xCu);

    }
    objc_msgSend(v12, "URLProtocolDidFinishLoading:", self);
  }

}

@end
