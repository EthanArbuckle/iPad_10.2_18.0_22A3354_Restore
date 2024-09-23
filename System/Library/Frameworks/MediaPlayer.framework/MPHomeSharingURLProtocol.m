@implementation MPHomeSharingURLProtocol

- (void)startLoading
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
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
  unsigned int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  MPHomeSharingURLProtocol *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v39 = MEMORY[0x19403A624](self, a2);
  v37 = self;
  -[NSURLProtocol request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v47 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingURLProtocol] Starting loading for %{public}@", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v4, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v4;
  objc_msgSend(v4, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceCharactersInRange:withString:", 0, objc_msgSend(v9, "length"), CFSTR("http"));

  v40 = v8;
  objc_msgSend(v8, "appendString:", CFSTR("&daap-no-disconnect=1"));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  +[MPMediaLibrary mediaLibraries](MPMediaLibrary, "mediaLibraries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v11)
  {
LABEL_13:

LABEL_22:
    -[NSURLProtocol client](v37, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HomeSharingURLProtocolErrorDomain"), -1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLProtocol:didFailWithError:", v37, v25);
    v23 = v38;
    v22 = (void *)v39;
    goto LABEL_23;
  }
  v12 = v11;
  v13 = *(_QWORD *)v42;
LABEL_5:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v42 != v13)
      objc_enumerationMutation(v10);
    objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v14), "libraryDataProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    objc_msgSend(v15, "homeSharingLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "baseURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v40, "hasPrefix:", v18);

    if ((v19 & 1) != 0)
      break;

LABEL_11:
    if (v12 == ++v14)
    {
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v12)
        goto LABEL_5;
      goto LABEL_13;
    }
  }

  if (!v16)
    goto LABEL_22;
  objc_msgSend(v16, "homeSharingGroupID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  v23 = v38;
  v22 = (void *)v39;
  if (v21)
  {
    objc_msgSend(v16, "homeSharingGroupID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "appendFormat:", CFSTR("&hsgid=%@"), v24);

  }
  objc_msgSend(v40, "appendString:", CFSTR("&hs-mobile-device-client=1"));
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v40);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39E8]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v38, CFSTR("text/plain"), 0, 0);
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLProtocol request](v37, "request");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "allHTTPHeaderFields");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");

  objc_msgSend(v16, "securityInfoForURL:", v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v30, "setObject:forKey:", v31, CFSTR("Client-Daap-Validation"));
  v32 = (void *)MEMORY[0x1E0CB3940];
  do
  {
    v33 = __ldxr(&startLoading___requestID);
    v34 = v33 + 1;
  }
  while (__stxr(v34, &startLoading___requestID));
  objc_msgSend(v32, "stringWithFormat:", CFSTR("%u"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v35, CFSTR("Client-Daap-Request-Id"));

  objc_msgSend(v27, "setAllHTTPHeaderFields:", v30);
  -[NSURLProtocol client](v37, "client");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "URLProtocol:wasRedirectedToRequest:redirectResponse:", v37, v27, v26);
  objc_msgSend(v36, "URLProtocolDidFinishLoading:", v37);

LABEL_23:
  objc_autoreleasePoolPop(v22);
}

+ (void)initialize
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    objc_msgSend(MEMORY[0x1E0CB39D0], "registerClass:", a1);
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x19403A624]();
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("home-sharing"));

  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

@end
