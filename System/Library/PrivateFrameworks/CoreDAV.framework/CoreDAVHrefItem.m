@implementation CoreDAVHrefItem

- (CoreDAVHrefItem)init
{
  CoreDAVHrefItem *result;

  result = -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("href"));
  if (result)
    result->_writeStyle = 0;
  return result;
}

- (CoreDAVHrefItem)initWithURL:(id)a3
{
  id v4;
  CoreDAVHrefItem *v5;
  void *v6;

  v4 = a3;
  v5 = -[CoreDAVHrefItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem setPayloadAsString:](v5, "setPayloadAsString:", v6);

  }
  return v5;
}

- (CoreDAVHrefItem)initWithURL:(id)a3 baseURL:(id)a4
{
  id v7;
  CoreDAVHrefItem *v8;
  CoreDAVHrefItem *v9;

  v7 = a4;
  v8 = -[CoreDAVHrefItem initWithURL:](self, "initWithURL:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_baseURL, a4);

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v9.receiver = self;
  v9.super_class = (Class)CoreDAVHrefItem;
  -[CoreDAVItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVHrefItem payloadAsOriginalURL](self, "payloadAsOriginalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Payload as original URL: [%@]"), v5);

  -[CoreDAVHrefItem payloadAsFullURL](self, "payloadAsFullURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Payload as full URL: [%@]"), v6);

  -[CoreDAVHrefItem baseURL](self, "baseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Base URL: [%@]"), v7);

  return v3;
}

- (void)write:(id)a3
{
  id v4;
  int writeStyle;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  writeStyle = self->_writeStyle;
  v11 = v4;
  if (writeStyle == 1)
  {
    -[CoreDAVHrefItem payloadAsFullURL](self, "payloadAsFullURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CDVURLWithUser:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem nameSpace](self, "nameSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v8, v9, v10, 0);

  }
  else
  {
    if (writeStyle != 2)
    {
      -[CoreDAVItem name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVItem nameSpace](self, "nameSpace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVItem payloadAsString](self, "payloadAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v6, v7, v8, 0);
      goto LABEL_7;
    }
    -[CoreDAVItem name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem nameSpace](self, "nameSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVHrefItem payloadAsFullURL](self, "payloadAsFullURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CDVRawPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v6, v7, v9, 0);
  }

LABEL_7:
}

- (id)payloadAsFullURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;

  -[CoreDAVItem payloadAsString](self, "payloadAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !objc_msgSend(v5, "length"))
  {
    v9 = 0;
    goto LABEL_10;
  }
  v6 = (void *)MEMORY[0x24BDBCF48];
  -[CoreDAVHrefItem baseURL](self, "baseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:relativeToURL:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("http")))
    {
      objc_msgSend(v9, "user");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "length"))
      {
        -[CoreDAVHrefItem baseURL](self, "baseURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "user");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v9, "host");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (!v15)
            goto LABEL_15;
          -[CoreDAVHrefItem baseURL](self, "baseURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "user");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "CDVURLWithUser:", v11);
          v12 = v9;
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {

        }
      }

    }
LABEL_15:
    objc_msgSend(v9, "scheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("http"));

    if (v18)
    {
      objc_msgSend(v9, "CDVRawPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "rangeOfString:", CFSTR("@")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v9, "host");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          objc_msgSend(v9, "host");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length");

          if (v23)
          {
            objc_msgSend(v19, "CDVStringByAddingPercentEscapesForHREF");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "CDVURLWithPath:", v24);
            v25 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v25;
          }
        }
      }

    }
  }
LABEL_10:

  return v9;
}

- (id)payloadAsOriginalURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[CoreDAVItem payloadAsString](self, "payloadAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (int)writeStyle
{
  return self->_writeStyle;
}

- (void)setWriteStyle:(int)a3
{
  self->_writeStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
