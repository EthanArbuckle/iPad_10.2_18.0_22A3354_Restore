@implementation SUUITestDataURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x2426A2860]();
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", CFSTR("x-apple-storeui-test-data"));
  objc_autoreleasePoolPop(v4);

  return (char)v5;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (void)startLoading
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t (*v21)(uint64_t, const void *, _QWORD);
  uint64_t v22;
  const void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t (*v27)(const void *, uint64_t);
  __CFString *v28;
  void *v29;
  void *v30;

  v3 = (void *)MEMORY[0x2426A2860](self, a2);
  -[NSURLProtocol request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resourceSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourcePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v9);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = v9;
  }
  else
  {
    SUUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resourcePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v12);
    if (!v15)
    {
      -[NSURLProtocol client](self, "client");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 0, 0);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLProtocol:didFailWithError:", self, v28);
      goto LABEL_13;
    }
    v11 = (void *)v15;
  }
  objc_msgSend(v6, "pathExtension");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (const void *)v16;
    v18 = (void *)SUUIMobileCoreServicesFramework();
    v19 = *(_QWORD *)SUUIWeakLinkedSymbolForString("kUTTagClassFilenameExtension", v18);
    v20 = (void *)SUUIMobileCoreServicesFramework();
    v21 = (uint64_t (*)(uint64_t, const void *, _QWORD))SUUIWeakLinkedSymbolForString("UTTypeCreatePreferredIdentifierForTag", v20);
    if (v21 && (v22 = v21(v19, v17, 0)) != 0)
    {
      v23 = (const void *)v22;
      v24 = (void *)SUUIMobileCoreServicesFramework();
      v25 = *(_QWORD *)SUUIWeakLinkedSymbolForString("kUTTagClassMIMEType", v24);
      v26 = (void *)SUUIMobileCoreServicesFramework();
      v27 = (uint64_t (*)(const void *, uint64_t))SUUIWeakLinkedSymbolForString("UTTypeCopyPreferredTagWithClass", v26);
      if (v27)
        v28 = (__CFString *)v27(v23, v25);
      else
        v28 = 0;
      CFRelease(v23);
      CFRelease(v17);
      if (v28)
        goto LABEL_12;
    }
    else
    {
      CFRelease(v17);
    }
  }
  v28 = CFSTR("text/xml+itml");
LABEL_12:
  -[NSURLProtocol client](self, "client");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB74A8]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v5, v28, objc_msgSend(v11, "length"), 0);
  objc_msgSend(v29, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v30, 2);
  objc_msgSend(v29, "URLProtocol:didLoadData:", self, v11);
  objc_msgSend(v29, "URLProtocolDidFinishLoading:", self);

LABEL_13:
  objc_autoreleasePoolPop(v3);
}

@end
