@implementation CTLazuliFileTransferCapabilities

- (id)description
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliFileTransferCapabilities url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", url = %@"), v4);

  -[CTLazuliFileTransferCapabilities contentServerUploadUrl](self, "contentServerUploadUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", contentServerUploadUrl = %@"), v5);

  -[CTLazuliFileTransferCapabilities contentServerDownloadUrl](self, "contentServerDownloadUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", contentServerDownloadUrl = %@"), v6);

  -[CTLazuliFileTransferCapabilities userName](self, "userName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", userName = %@"), v7);

  -[CTLazuliFileTransferCapabilities password](self, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", password = %@"), v8);

  -[CTLazuliFileTransferCapabilities max1ToManyRecipients](self, "max1ToManyRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", max1ToManyRecipients = %@"), v9);

  -[CTLazuliFileTransferCapabilities maxTransferSize](self, "maxTransferSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", maxTransferSize = %@"), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR(", autoAccept = %d"), -[CTLazuliFileTransferCapabilities autoAccept](self, "autoAccept"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", httpFallback = %d"), -[CTLazuliFileTransferCapabilities httpFallback](self, "httpFallback"));
  -[CTLazuliFileTransferCapabilities warnSize](self, "warnSize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", warnSize = %@"), v11);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliFileTransferCapabilities:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  int v53;

  v8 = a3;
  -[CTLazuliFileTransferCapabilities url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v8, "url"), (v52 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliFileTransferCapabilities url](self, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
    {

      v10 = 0;
      goto LABEL_78;
    }
    v53 = 1;
  }
  else
  {
    v52 = 0;
    v53 = 0;
  }
  -[CTLazuliFileTransferCapabilities contentServerUploadUrl](self, "contentServerUploadUrl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v8, "contentServerUploadUrl"), (v48 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliFileTransferCapabilities contentServerUploadUrl](self, "contentServerUploadUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentServerUploadUrl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
    {

      if (v11)
      else

      v10 = 0;
      if ((v53 & 1) == 0)
        goto LABEL_78;
      goto LABEL_77;
    }
    v50 = 1;
  }
  else
  {
    v48 = 0;
    v50 = 0;
  }
  -[CTLazuliFileTransferCapabilities contentServerDownloadUrl](self, "contentServerDownloadUrl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (objc_msgSend(v8, "contentServerDownloadUrl"), (v43 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliFileTransferCapabilities contentServerDownloadUrl](self, "contentServerDownloadUrl");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentServerDownloadUrl");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v51, "isEqual:"))
    {
      v10 = 0;
LABEL_69:

      goto LABEL_70;
    }
    v45 = 1;
  }
  else
  {
    v43 = 0;
    v45 = 0;
  }
  -[CTLazuliFileTransferCapabilities userName](self, "userName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46 || (objc_msgSend(v8, "userName"), (v38 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliFileTransferCapabilities userName](self, "userName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v47, "isEqualToString:"))
    {
      v10 = 0;
LABEL_65:

      goto LABEL_66;
    }
    v40 = 1;
  }
  else
  {
    v38 = 0;
    v40 = 0;
  }
  -[CTLazuliFileTransferCapabilities password](self, "password");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 || (objc_msgSend(v8, "password"), (v33 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliFileTransferCapabilities password](self, "password");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "password");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v42, "isEqualToString:"))
    {
      v10 = 0;
LABEL_61:

      goto LABEL_62;
    }
    v36 = 1;
  }
  else
  {
    v33 = 0;
    v36 = 0;
  }
  -[CTLazuliFileTransferCapabilities max1ToManyRecipients](self, "max1ToManyRecipients");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37 || (objc_msgSend(v8, "max1ToManyRecipients"), (v28 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliFileTransferCapabilities max1ToManyRecipients](self, "max1ToManyRecipients");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v35, "longValue");
    objc_msgSend(v8, "max1ToManyRecipients");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 != objc_msgSend(v34, "longValue"))
    {
      v10 = 0;
LABEL_57:

      goto LABEL_58;
    }
    v31 = 1;
  }
  else
  {
    v28 = 0;
    v31 = 0;
  }
  -[CTLazuliFileTransferCapabilities maxTransferSize](self, "maxTransferSize");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32 || (objc_msgSend(v8, "maxTransferSize"), (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliFileTransferCapabilities maxTransferSize](self, "maxTransferSize");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v30, "longValue");
    objc_msgSend(v8, "maxTransferSize");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 != objc_msgSend(v29, "longValue"))
    {

      v15 = v32;
      if (!v32)
        v15 = v26;

      v10 = 0;
      if ((v31 & 1) != 0)
        goto LABEL_57;
      goto LABEL_58;
    }
    v27 = 1;
  }
  else
  {
    v26 = 0;
    v27 = 0;
  }
  v16 = -[CTLazuliFileTransferCapabilities autoAccept](self, "autoAccept");
  if (v16 != objc_msgSend(v8, "autoAccept")
    || (v17 = -[CTLazuliFileTransferCapabilities httpFallback](self, "httpFallback"),
        v17 != objc_msgSend(v8, "httpFallback")))
  {
    v10 = 0;
    if (!v27)
      goto LABEL_54;
    goto LABEL_53;
  }
  -[CTLazuliFileTransferCapabilities warnSize](self, "warnSize");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25 || (objc_msgSend(v8, "warnSize"), (v22 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliFileTransferCapabilities warnSize](self, "warnSize", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v24, "longValue");
    objc_msgSend(v8, "warnSize");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19 == objc_msgSend(v20, "longValue");

    v21 = (void *)v25;
    if (!v25)
      v21 = v23;
  }
  else
  {
    v21 = 0;
    v10 = 1;
  }

  if ((v27 & 1) != 0)
  {
LABEL_53:

  }
LABEL_54:
  if (!v32)

  if (v31)
    goto LABEL_57;
LABEL_58:
  if (!v37)

  if (v36)
    goto LABEL_61;
LABEL_62:
  if (!v41)

  if (v40)
    goto LABEL_65;
LABEL_66:
  if (!v46)

  if (v45)
    goto LABEL_69;
LABEL_70:
  if (!v12)

  if (v50)
  {

  }
  if (!v11)

  if (v53)
  {
LABEL_77:

  }
LABEL_78:
  if (!v9)

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliFileTransferCapabilities *v4;
  CTLazuliFileTransferCapabilities *v5;
  BOOL v6;

  v4 = (CTLazuliFileTransferCapabilities *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliFileTransferCapabilities isEqualToCTLazuliFileTransferCapabilities:](self, "isEqualToCTLazuliFileTransferCapabilities:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliFileTransferCapabilities *v4;

  v4 = +[CTLazuliFileTransferCapabilities allocWithZone:](CTLazuliFileTransferCapabilities, "allocWithZone:", a3);
  -[CTLazuliFileTransferCapabilities setUrl:](v4, "setUrl:", self->_url);
  -[CTLazuliFileTransferCapabilities setContentServerUploadUrl:](v4, "setContentServerUploadUrl:", self->_contentServerUploadUrl);
  -[CTLazuliFileTransferCapabilities setContentServerDownloadUrl:](v4, "setContentServerDownloadUrl:", self->_contentServerDownloadUrl);
  -[CTLazuliFileTransferCapabilities setUserName:](v4, "setUserName:", self->_userName);
  -[CTLazuliFileTransferCapabilities setPassword:](v4, "setPassword:", self->_password);
  -[CTLazuliFileTransferCapabilities setMax1ToManyRecipients:](v4, "setMax1ToManyRecipients:", self->_max1ToManyRecipients);
  -[CTLazuliFileTransferCapabilities setMaxTransferSize:](v4, "setMaxTransferSize:", self->_maxTransferSize);
  -[CTLazuliFileTransferCapabilities setAutoAccept:](v4, "setAutoAccept:", self->_autoAccept);
  -[CTLazuliFileTransferCapabilities setHttpFallback:](v4, "setHttpFallback:", self->_httpFallback);
  -[CTLazuliFileTransferCapabilities setWarnSize:](v4, "setWarnSize:", self->_warnSize);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("kUrlKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentServerUploadUrl, CFSTR("kContentServerUploadUrlKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentServerDownloadUrl, CFSTR("kContentServerDownloadUrlKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_userName, CFSTR("kUserNameKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_password, CFSTR("kPasswordKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_max1ToManyRecipients, CFSTR("kMax1ToManyRecipientsKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maxTransferSize, CFSTR("kMaxTransferSizeKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_autoAccept, CFSTR("kAutoAcceptKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_httpFallback, CFSTR("kHttpFallbackKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_warnSize, CFSTR("kWarnSizeKey"));

}

- (CTLazuliFileTransferCapabilities)initWithCoder:(id)a3
{
  id v4;
  CTLazuliFileTransferCapabilities *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSURL *contentServerUploadUrl;
  uint64_t v10;
  NSURL *contentServerDownloadUrl;
  uint64_t v12;
  NSString *userName;
  uint64_t v14;
  NSString *password;
  uint64_t v16;
  NSNumber *max1ToManyRecipients;
  uint64_t v18;
  NSNumber *maxTransferSize;
  uint64_t v20;
  NSNumber *warnSize;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTLazuliFileTransferCapabilities;
  v5 = -[CTLazuliFileTransferCapabilities init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUrlKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kContentServerUploadUrlKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    contentServerUploadUrl = v5->_contentServerUploadUrl;
    v5->_contentServerUploadUrl = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kContentServerDownloadUrlKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    contentServerDownloadUrl = v5->_contentServerDownloadUrl;
    v5->_contentServerDownloadUrl = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUserNameKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    userName = v5->_userName;
    v5->_userName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPasswordKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMax1ToManyRecipientsKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    max1ToManyRecipients = v5->_max1ToManyRecipients;
    v5->_max1ToManyRecipients = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMaxTransferSizeKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    maxTransferSize = v5->_maxTransferSize;
    v5->_maxTransferSize = (NSNumber *)v18;

    v5->_autoAccept = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kAutoAcceptKey"));
    v5->_httpFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kHttpFallbackKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kWarnSizeKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    warnSize = v5->_warnSize;
    v5->_warnSize = (NSNumber *)v20;

  }
  return v5;
}

- (CTLazuliFileTransferCapabilities)initWithReflection:(const void *)a3
{
  CTLazuliFileTransferCapabilities *v4;
  CTLazuliFileTransferCapabilities *v5;
  void *v6;
  void *v7;
  int v8;
  const void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  uint64_t v13;
  NSURL *url;
  char *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  NSURL *contentServerUploadUrl;
  char *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  char *v29;
  void *v30;
  uint64_t v31;
  NSURL *contentServerDownloadUrl;
  char *v33;
  uint64_t v34;
  NSString *userName;
  char *v36;
  uint64_t v37;
  NSString *password;
  uint64_t v39;
  NSNumber *max1ToManyRecipients;
  uint64_t v41;
  NSNumber *maxTransferSize;
  uint64_t v43;
  NSNumber *warnSize;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)CTLazuliFileTransferCapabilities;
  v4 = -[CTLazuliFileTransferCapabilities init](&v46, sel_init);
  v5 = v4;
  if (v4)
  {
    if (*((_BYTE *)a3 + 24))
    {
      v6 = (void *)MEMORY[0x1E0C99E98];
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = *((char *)a3 + 23);
      v9 = *(const void **)a3;
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
      if (v8 >= 0)
        v11 = a3;
      else
        v11 = v9;
      objc_msgSend(v7, "stringWithCString:encoding:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLWithString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      url = v5->_url;
      v5->_url = (NSURL *)v13;

    }
    else
    {
      v12 = v4->_url;
      v4->_url = 0;
    }

    if (*((_BYTE *)a3 + 56))
    {
      v15 = (char *)*((_QWORD *)a3 + 4);
      v16 = (void *)MEMORY[0x1E0C99E98];
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = *((char *)a3 + 55);
      v19 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
      if (v18 >= 0)
        v20 = (char *)a3 + 32;
      else
        v20 = v15;
      objc_msgSend(v17, "stringWithCString:encoding:", v20, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLWithString:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      contentServerUploadUrl = v5->_contentServerUploadUrl;
      v5->_contentServerUploadUrl = (NSURL *)v22;

    }
    else
    {
      v21 = v5->_contentServerUploadUrl;
      v5->_contentServerUploadUrl = 0;
    }

    if (*((_BYTE *)a3 + 88))
    {
      v24 = (char *)*((_QWORD *)a3 + 8);
      v25 = (void *)MEMORY[0x1E0C99E98];
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = *((char *)a3 + 87);
      v28 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
      if (v27 >= 0)
        v29 = (char *)a3 + 64;
      else
        v29 = v24;
      objc_msgSend(v26, "stringWithCString:encoding:", v29, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "URLWithString:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
      contentServerDownloadUrl = v5->_contentServerDownloadUrl;
      v5->_contentServerDownloadUrl = (NSURL *)v31;

    }
    else
    {
      v30 = v5->_contentServerDownloadUrl;
      v5->_contentServerDownloadUrl = 0;
    }

    if (*((_BYTE *)a3 + 120))
    {
      if (*((char *)a3 + 119) >= 0)
        v33 = (char *)a3 + 96;
      else
        v33 = (char *)*((_QWORD *)a3 + 12);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      userName = v5->_userName;
      v5->_userName = (NSString *)v34;
    }
    else
    {
      userName = v5->_userName;
      v5->_userName = 0;
    }

    if (*((_BYTE *)a3 + 152))
    {
      if (*((char *)a3 + 151) >= 0)
        v36 = (char *)a3 + 128;
      else
        v36 = (char *)*((_QWORD *)a3 + 16);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v36);
      v37 = objc_claimAutoreleasedReturnValue();
      password = v5->_password;
      v5->_password = (NSString *)v37;
    }
    else
    {
      password = v5->_password;
      v5->_password = 0;
    }

    if (*((_BYTE *)a3 + 168))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 20));
      v39 = objc_claimAutoreleasedReturnValue();
      max1ToManyRecipients = v5->_max1ToManyRecipients;
      v5->_max1ToManyRecipients = (NSNumber *)v39;
    }
    else
    {
      max1ToManyRecipients = v5->_max1ToManyRecipients;
      v5->_max1ToManyRecipients = 0;
    }

    if (*((_BYTE *)a3 + 184))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 22));
      v41 = objc_claimAutoreleasedReturnValue();
      maxTransferSize = v5->_maxTransferSize;
      v5->_maxTransferSize = (NSNumber *)v41;
    }
    else
    {
      maxTransferSize = v5->_maxTransferSize;
      v5->_maxTransferSize = 0;
    }

    v5->_autoAccept = *((_BYTE *)a3 + 192);
    v5->_httpFallback = *((_BYTE *)a3 + 193);
    if (*((_BYTE *)a3 + 208))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 25));
      v43 = objc_claimAutoreleasedReturnValue();
      warnSize = v5->_warnSize;
      v5->_warnSize = (NSNumber *)v43;
    }
    else
    {
      warnSize = v5->_warnSize;
      v5->_warnSize = 0;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSURL)contentServerUploadUrl
{
  return self->_contentServerUploadUrl;
}

- (void)setContentServerUploadUrl:(id)a3
{
  objc_storeStrong((id *)&self->_contentServerUploadUrl, a3);
}

- (NSURL)contentServerDownloadUrl
{
  return self->_contentServerDownloadUrl;
}

- (void)setContentServerDownloadUrl:(id)a3
{
  objc_storeStrong((id *)&self->_contentServerDownloadUrl, a3);
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
  objc_storeStrong((id *)&self->_userName, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSNumber)max1ToManyRecipients
{
  return self->_max1ToManyRecipients;
}

- (void)setMax1ToManyRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_max1ToManyRecipients, a3);
}

- (NSNumber)maxTransferSize
{
  return self->_maxTransferSize;
}

- (void)setMaxTransferSize:(id)a3
{
  objc_storeStrong((id *)&self->_maxTransferSize, a3);
}

- (BOOL)autoAccept
{
  return self->_autoAccept;
}

- (void)setAutoAccept:(BOOL)a3
{
  self->_autoAccept = a3;
}

- (BOOL)httpFallback
{
  return self->_httpFallback;
}

- (void)setHttpFallback:(BOOL)a3
{
  self->_httpFallback = a3;
}

- (NSNumber)warnSize
{
  return self->_warnSize;
}

- (void)setWarnSize:(id)a3
{
  objc_storeStrong((id *)&self->_warnSize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warnSize, 0);
  objc_storeStrong((id *)&self->_maxTransferSize, 0);
  objc_storeStrong((id *)&self->_max1ToManyRecipients, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_contentServerDownloadUrl, 0);
  objc_storeStrong((id *)&self->_contentServerUploadUrl, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
