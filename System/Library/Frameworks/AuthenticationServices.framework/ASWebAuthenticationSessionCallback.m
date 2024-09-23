@implementation ASWebAuthenticationSessionCallback

+ (id)callbackWithCustomScheme:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCustomScheme:host:path:downloadMIMEType:", v4, 0, 0, 0);

  return v5;
}

+ (id)callbackWithHTTPSHost:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCustomScheme:host:path:downloadMIMEType:", 0, v7, v6, 0);

  return v8;
}

+ (id)callbackWithDownloadMIMEType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCustomScheme:host:path:downloadMIMEType:", 0, 0, 0, v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithCustomScheme:(id)a3 host:(id)a4 path:(id)a5 downloadMIMEType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ASWebAuthenticationSessionCallback *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSString *host;
  uint64_t v19;
  NSString *path;
  uint64_t v21;
  NSString *downloadMIMEType;
  uint64_t v23;
  NSString *customScheme;
  ASWebAuthenticationSessionCallback *v25;
  id v27;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)ASWebAuthenticationSessionCallback;
  v14 = -[ASWebAuthenticationSessionCallback init](&v28, sel_init);
  if (v14)
  {
    if (v11)
    {
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unexpectedly found nil path when using HTTPS callback."), 0);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v27);
      }
      if ((objc_msgSend(v12, "hasPrefix:", CFSTR("/")) & 1) == 0)
      {
        objc_msgSend(CFSTR("/"), "stringByAppendingString:", v12);
        v15 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v15;
      }
      objc_msgSend(v12, "safari_stringByDeletingTrailingSlash");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v11, "copy");
      host = v14->_host;
      v14->_host = (NSString *)v17;

      v19 = objc_msgSend(v16, "copy");
      path = v14->_path;
      v14->_path = (NSString *)v19;

      v14->_callbackType = 1;
      v12 = v16;
    }
    else if (v13)
    {
      v21 = objc_msgSend(v13, "copy");
      downloadMIMEType = v14->_downloadMIMEType;
      v14->_downloadMIMEType = (NSString *)v21;

      v14->_callbackType = 2;
    }
    else
    {
      v23 = objc_msgSend(v10, "copy");
      customScheme = v14->_customScheme;
      v14->_customScheme = (NSString *)v23;

      v14->_callbackType = 0;
    }
    v25 = v14;
  }

  return v14;
}

- (ASWebAuthenticationSessionCallback)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ASWebAuthenticationSessionCallback *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("host"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadMIMEType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ASWebAuthenticationSessionCallback _initWithCustomScheme:host:path:downloadMIMEType:](self, "_initWithCustomScheme:host:path:downloadMIMEType:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *customScheme;
  id v5;

  customScheme = self->_customScheme;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", customScheme, CFSTR("scheme"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_host, CFSTR("host"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_path, CFSTR("path"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloadMIMEType, CFSTR("downloadMIMEType"));

}

- (id)description
{
  unint64_t callbackType;
  uint64_t v4;

  callbackType = self->_callbackType;
  switch(callbackType)
  {
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Download { mimeType: %@ }"), self->_downloadMIMEType, v4);
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Callback { URL: https://%@%@ }"), self->_host, self->_path);
      goto LABEL_7;
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Callback { scheme: %@ }"), self->_customScheme, v4);
LABEL_7:
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      break;
  }
  return (id)(id)a2;
}

- (BOOL)matchesURL:(id)a3
{
  id v4;
  void *v5;
  unint64_t callbackType;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  callbackType = self->_callbackType;
  if (callbackType == 1)
  {
    if (objc_msgSend(v4, "safari_isHTTPFamilyURL"))
    {
      objc_msgSend(v5, "host");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "caseInsensitiveCompare:", self->_host);

      if (!v10)
      {
        objc_msgSend(v5, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safari_stringByDeletingTrailingSlash");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v7, "caseInsensitiveCompare:", self->_path) == 0;
        goto LABEL_9;
      }
    }
  }
  else if (!callbackType && (objc_msgSend(v4, "safari_isHTTPFamilyURL") & 1) == 0)
  {
    objc_msgSend(v5, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "safari_isCaseInsensitiveEqualToString:", self->_customScheme);
LABEL_9:

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)callbackType
{
  return self->_callbackType;
}

- (void)setCallbackType:(unint64_t)a3
{
  self->_callbackType = a3;
}

- (NSString)customScheme
{
  return self->_customScheme;
}

- (NSString)host
{
  return self->_host;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)downloadMIMEType
{
  return self->_downloadMIMEType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadMIMEType, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_customScheme, 0);
}

@end
