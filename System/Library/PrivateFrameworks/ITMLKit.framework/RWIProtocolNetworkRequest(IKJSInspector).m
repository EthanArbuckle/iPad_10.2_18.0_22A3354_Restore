@implementation RWIProtocolNetworkRequest(IKJSInspector)

+ (id)ik_networkRequestFromURLRequest:()IKJSInspector
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DD9648];
  objc_msgSend(v3, "allHTTPHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_networkHeadersFromHTTPHeaderFields:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DD9660];
  objc_msgSend(v3, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "HTTPMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safe_initWithUrl:method:headers:", v9, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "HTTPBody");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "HTTPBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithData:encoding:", v15, 4);
    objc_msgSend(v11, "setPostData:", v16);

  }
  else
  {
    objc_msgSend(v3, "HTTPBodyStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      ITMLKitGetLogObject(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        +[RWIProtocolNetworkRequest(IKJSInspector) ik_networkRequestFromURLRequest:].cold.1(v18);

    }
  }

  return v11;
}

+ (void)ik_networkRequestFromURLRequest:()IKJSInspector .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D95F2000, log, OS_LOG_TYPE_DEBUG, "Building postData for HTTPBodyStream not currently supported", v1, 2u);
}

@end
