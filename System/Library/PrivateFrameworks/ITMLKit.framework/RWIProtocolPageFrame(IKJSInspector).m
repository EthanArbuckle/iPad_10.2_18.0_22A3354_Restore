@implementation RWIProtocolPageFrame(IKJSInspector)

+ (uint64_t)ik_globalFrame
{
  return objc_msgSend(MEMORY[0x1E0DD9698], "safe_initWithIdentifier:loaderId:url:securityOrigin:mimeType:", CFSTR("Inspector"), CFSTR("Inspector"), CFSTR("Application"), CFSTR("Inspector"), CFSTR("text/xml"));
}

+ (id)ik_pageFrameFromDOMDocument:()IKJSInspector
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "documentElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_templateName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E9F50578;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v3, "_requestLoader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (__CFString *)v10;
  else
    v12 = CFSTR("Page");
  v13 = v12;

  v14 = (void *)MEMORY[0x1E0DD9698];
  objc_msgSend(v3, "documentURI");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = v15;
  else
    v16 = v8;
  objc_msgSend(v14, "safe_initWithIdentifier:loaderId:url:securityOrigin:mimeType:", CFSTR("Page"), v13, v16, CFSTR("Inspector"), CFSTR("text/xml"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setName:", v8);
  return v17;
}

- (uint64_t)ik_resourceTreeWithResources:()IKJSInspector
{
  return objc_msgSend(MEMORY[0x1E0DD96A8], "safe_initWithFrame:resources:", a1, a3);
}

@end
