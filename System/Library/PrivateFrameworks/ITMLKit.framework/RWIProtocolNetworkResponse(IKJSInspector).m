@implementation RWIProtocolNetworkResponse(IKJSInspector)

+ (id)ik_responseFromURLResponse:()IKJSInspector
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "ik_responseFromURLResponse:forRequest:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ik_responseFromURLResponse:()IKJSInspector forRequest:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  const __CFString *v19;
  void *v20;

  v5 = (void *)MEMORY[0x1E0DD9648];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "allHeaderFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ik_networkHeadersFromHTTPHeaderFields:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DD9648];
  objc_msgSend(v6, "allHTTPHeaderFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ik_networkHeadersFromHTTPHeaderFields:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DD9670];
  objc_msgSend(v7, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v7, "itunes_statusCode");
  objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", objc_msgSend(v7, "itunes_statusCode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MIMEType");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = v18;
  else
    v19 = &stru_1E9F50578;
  objc_msgSend(v13, "safe_initWithUrl:status:statusText:headers:mimeType:source:", v15, v16, v17, v9, v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v20, "setRequestHeaders:", v12);

  return v20;
}

@end
