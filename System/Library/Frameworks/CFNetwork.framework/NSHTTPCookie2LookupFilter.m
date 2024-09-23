@implementation NSHTTPCookie2LookupFilter

- (NSHTTPCookie2LookupFilter)initWithCookie:(id)a3
{
  id v4;
  NSHTTPCookie2LookupFilter *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *domain;
  uint64_t v10;
  NSString *path;
  uint64_t v12;
  NSString *value;
  uint64_t v14;
  NSString *partition;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NSHTTPCookie2LookupFilter;
  v5 = -[NSHTTPCookie2LookupFilter init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "domain");
    v8 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v8;

    objc_msgSend(v4, "path");
    v10 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v10;

    objc_msgSend(v4, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v12;

    objc_msgSend(v4, "partition");
    v14 = objc_claimAutoreleasedReturnValue();
    partition = v5->_partition;
    v5->_partition = (NSString *)v14;

    v5->_secure = objc_msgSend(v4, "secure");
    v5->_httpOnly = objc_msgSend(v4, "httpOnly");
    v5->_sameSite = objc_msgSend(v4, "sameSite");
  }

  return v5;
}

- (int64_t)_flags
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;

  -[NSHTTPCookie2LookupFilter name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  -[NSHTTPCookie2LookupFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (2 * v4) | 4;
  else
    v6 = 2 * v4;
  -[NSHTTPCookie2LookupFilter domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v6 |= 8uLL;
  -[NSHTTPCookie2LookupFilter path](self, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v6 | 0x10;
  else
    v9 = v6;
  if (-[NSHTTPCookie2LookupFilter sameSite](self, "sameSite"))
    v10 = v9 | 0x20;
  else
    v10 = v9;
  -[NSHTTPCookie2LookupFilter partition](self, "partition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v10 |= 0x40uLL;
  -[NSHTTPCookie2LookupFilter newerThanCreationDate](self, "newerThanCreationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v10 |= 0x80uLL;
  -[NSHTTPCookie2LookupFilter newerThanExpirationDate](self, "newerThanExpirationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v10 |= 0x100uLL;
  -[NSHTTPCookie2LookupFilter newerThanLastAccess](self, "newerThanLastAccess");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v10 |= 0x200uLL;
  -[NSHTTPCookie2LookupFilter olderThanCreationDate](self, "olderThanCreationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v10 |= 0x400uLL;
  -[NSHTTPCookie2LookupFilter olderThanExpirationDate](self, "olderThanExpirationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v10 |= 0x800uLL;
  -[NSHTTPCookie2LookupFilter olderThanLastAccess](self, "olderThanLastAccess");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = v10 | 0x1000;
  else
    v18 = v10;
  if (-[NSHTTPCookie2LookupFilter secure](self, "secure"))
    v18 |= 0x2000uLL;
  if (-[NSHTTPCookie2LookupFilter httpOnly](self, "httpOnly"))
    v18 |= 0x4000uLL;
  if (-[NSHTTPCookie2LookupFilter ignoreHostOnlyFlag](self, "ignoreHostOnlyFlag"))
    return v18 | 0x8000;
  else
    return v18;
}

- (void)setPath:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *path;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  self->_path = v5;

}

- (void)setDomain:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *domain;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    v5 = v4;
    v6 = v5;
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR(".")) & 1) == 0)
    {
      objc_msgSend(CFSTR("."), "stringByAppendingString:", v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    if (objc_msgSend(v6, "hasSuffix:", CFSTR(".")))
    {
      objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    domain = self->_domain;
    self->_domain = v11;

    v4 = v13;
  }

}

- (BOOL)matchCookie:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFURL *v36;
  const __CFURL *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;

  v4 = a3;
  -[NSHTTPCookie2LookupFilter domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!-[NSHTTPCookie2LookupFilter ignoreHostOnlyFlag](self, "ignoreHostOnlyFlag")
      && (objc_msgSend(v4, "hostOnly") & 1) != 0
      || (-[NSHTTPCookie2LookupFilter domain](self, "domain"),
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v7 = +[NSHTTPCookieStorageUtils looksLikeIPAddress:]((uint64_t)NSHTTPCookieStorageUtils, v6),
          v6,
          v7))
    {
      objc_msgSend(v4, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSHTTPCookie2LookupFilter domain](self, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "caseInsensitiveCompare:", v9);

      if (v10)
        goto LABEL_19;
    }
    else
    {
      -[NSHTTPCookie2LookupFilter domain](self, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "hasSuffix:", v12);

      if ((v13 & 1) == 0)
        goto LABEL_19;
    }
  }
  -[NSHTTPCookie2LookupFilter path](self, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_48;
  -[NSHTTPCookie2LookupFilter path](self, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if ((v17 & 1) != 0)
    goto LABEL_48;
  objc_msgSend(v4, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("/"));

  if ((v19 & 1) != 0)
    goto LABEL_48;
  objc_msgSend(v4, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v4, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingString:", CFSTR("/"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSHTTPCookie2LookupFilter path](self, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hasPrefix:", v21);

  if ((v24 & 1) != 0)
  {
LABEL_48:
    -[NSHTTPCookie2LookupFilter name](self, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
      goto LABEL_17;
    -[NSHTTPCookie2LookupFilter name](self, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqualToString:", v27);

    if ((v28 & 1) != 0)
    {
LABEL_17:
      objc_msgSend(v4, "partition");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v29, "isEqualToString:", CFSTR("none")) & 1) != 0)
      {
        v30 = 0;
      }
      else
      {
        objc_msgSend(v4, "partition");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[NSHTTPCookie2LookupFilter partition](self, "partition");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "isEqualToString:", &stru_1E1500C68) & 1) != 0)
      {
        v33 = 0;
      }
      else
      {
        -[NSHTTPCookie2LookupFilter partition](self, "partition");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (v30 && v33 != v30 && (objc_msgSend(v33, "isEqualToString:", v30) & 1) == 0)
        goto LABEL_42;
      -[NSHTTPCookie2LookupFilter siteForCookies](self, "siteForCookies");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_34;
      v35 = objc_msgSend(v4, "sameSite");
      if (v35 == 1)
      {
        if (-[NSHTTPCookie2LookupFilter isSafe](self, "isSafe")
          && -[NSHTTPCookie2LookupFilter isTopLevelNavigation](self, "isTopLevelNavigation"))
        {
          goto LABEL_34;
        }
      }
      else if (v35 != 2)
      {
LABEL_34:
        if ((-[NSHTTPCookie2LookupFilter ignoreSecureFlag](self, "ignoreSecureFlag")
           || -[NSHTTPCookie2LookupFilter secure](self, "secure")
           || (objc_msgSend(v4, "secure") & 1) == 0)
          && (-[NSHTTPCookie2LookupFilter ignoreHTTPOnlyCookie](self, "ignoreHTTPOnlyCookie")
           || !-[NSHTTPCookie2LookupFilter httpOnly](self, "httpOnly")
           || objc_msgSend(v4, "httpOnly")))
        {
          -[NSHTTPCookie2LookupFilter newerThanExpirationDate](self, "newerThanExpirationDate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            objc_msgSend(v4, "expirationDate");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSHTTPCookie2LookupFilter newerThanExpirationDate](self, "newerThanExpirationDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v40 < v41;

            v31 = !v42;
          }
          else
          {
            v31 = 1;
          }
          goto LABEL_44;
        }
LABEL_42:
        v31 = 0;
LABEL_44:

        goto LABEL_45;
      }
      -[NSHTTPCookie2LookupFilter inURL](self, "inURL");
      v36 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      -[NSHTTPCookie2LookupFilter siteForCookies](self, "siteForCookies");
      v37 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v38 = +[NSHTTPCookieStorageUtils isURLInMainDocumentDomain:withMainDocumentURL:ignoringTLD:]((uint64_t)NSHTTPCookieStorageUtils, v36, v37, 0);

      if ((v38 & 1) == 0)
        goto LABEL_42;
      goto LABEL_34;
    }
  }
LABEL_19:
  v31 = 0;
LABEL_45:

  return v31 & 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setPartition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)sameSite
{
  return self->_sameSite;
}

- (void)setSameSite:(int64_t)a3
{
  self->_sameSite = a3;
}

- (NSDate)newerThanCreationDate
{
  return self->_newerThanCreationDate;
}

- (void)setNewerThanCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)newerThanExpirationDate
{
  return self->_newerThanExpirationDate;
}

- (void)setNewerThanExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)newerThanLastAccess
{
  return self->_newerThanLastAccess;
}

- (void)setNewerThanLastAccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)olderThanCreationDate
{
  return self->_olderThanCreationDate;
}

- (void)setOlderThanCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)olderThanExpirationDate
{
  return self->_olderThanExpirationDate;
}

- (void)setOlderThanExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)olderThanLastAccess
{
  return self->_olderThanLastAccess;
}

- (void)setOlderThanLastAccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)secure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (BOOL)httpOnly
{
  return self->_httpOnly;
}

- (void)setHttpOnly:(BOOL)a3
{
  self->_httpOnly = a3;
}

- (BOOL)ignoreHostOnlyFlag
{
  return self->_ignoreHostOnlyFlag;
}

- (void)setIgnoreHostOnlyFlag:(BOOL)a3
{
  self->_ignoreHostOnlyFlag = a3;
}

- (BOOL)ignoreHTTPOnlyCookie
{
  return self->_ignoreHTTPOnlyCookie;
}

- (void)setIgnoreHTTPOnlyCookie:(BOOL)a3
{
  self->_ignoreHTTPOnlyCookie = a3;
}

- (BOOL)ignoreSecureFlag
{
  return self->_ignoreSecureFlag;
}

- (void)setIgnoreSecureFlag:(BOOL)a3
{
  self->_ignoreSecureFlag = a3;
}

- (NSURL)inURL
{
  return self->_inURL;
}

- (void)setInURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSURL)mainDocumentURL
{
  return self->_mainDocumentURL;
}

- (void)setMainDocumentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSURL)siteForCookies
{
  return self->_siteForCookies;
}

- (void)setSiteForCookies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isTopLevelNavigation
{
  return self->_isTopLevelNavigation;
}

- (void)setIsTopLevelNavigation:(BOOL)a3
{
  self->_isTopLevelNavigation = a3;
}

- (BOOL)isSafe
{
  return self->_isSafe;
}

- (void)setIsSafe:(BOOL)a3
{
  self->_isSafe = a3;
}

- (unint64_t)acceptPolicy
{
  return self->_acceptPolicy;
}

- (void)setAcceptPolicy:(unint64_t)a3
{
  self->_acceptPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siteForCookies, 0);
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_inURL, 0);
  objc_storeStrong((id *)&self->_olderThanLastAccess, 0);
  objc_storeStrong((id *)&self->_olderThanExpirationDate, 0);
  objc_storeStrong((id *)&self->_olderThanCreationDate, 0);
  objc_storeStrong((id *)&self->_newerThanLastAccess, 0);
  objc_storeStrong((id *)&self->_newerThanExpirationDate, 0);
  objc_storeStrong((id *)&self->_newerThanCreationDate, 0);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
