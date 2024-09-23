@implementation MCDomainsCacheEntry

+ (id)normalizedPatternString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("http://"), 8))
  {
    v4 = 8;
    if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("https://"), 8))
      goto LABEL_6;
  }
  else
  {
    v4 = 7;
  }
  objc_msgSend(v3, "substringFromIndex:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v3 = (id)v5;
LABEL_6:
  if (!objc_msgSend(v3, "rangeOfString:options:", CFSTR("www."), 8))
  {
    objc_msgSend(v3, "substringFromIndex:", 4);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }
  return v3;
}

- (MCDomainsCacheEntry)initWithPattern:(id)a3
{
  id v4;
  MCDomainsCacheEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSNumber *port;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *path;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCDomainsCacheEntry;
  v5 = -[MCDomainsCacheEntry init](&v21, sel_init);
  if (v5)
  {
    +[MCDomainsCacheEntry normalizedPatternString:](MCDomainsCacheEntry, "normalizedPatternString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "rangeOfString:options:", CFSTR("*."), 8))
    {
      v5->_subdomainsMatch = 1;
      objc_msgSend(v8, "substringFromIndex:", 2);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    v10 = objc_msgSend(v8, "rangeOfString:options:", CFSTR(":"), 4);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v10;
      objc_msgSend(v8, "substringFromIndex:", v10 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "substringToIndex:", v11);
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "intValue"));
      v14 = objc_claimAutoreleasedReturnValue();
      port = v5->_port;
      v5->_port = (NSNumber *)v14;

      v8 = (void *)v13;
    }
    objc_storeStrong((id *)&v5->_domain, v8);
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pathWithComponents:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      path = v5->_path;
      v5->_path = (NSString *)v18;

    }
    v4 = v6;
  }

  return v5;
}

- (BOOL)matchesURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  int v35;
  void *v36;
  char v37;
  NSObject *v38;
  uint8_t buf[4];
  MCDomainsCacheEntry *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v29 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v29, OS_LOG_TYPE_DEBUG, "Not matching URL because its host is nil.", buf, 2u);
      }
      goto LABEL_41;
    }
    v7 = v6;
    if (!objc_msgSend(v6, "rangeOfString:options:", CFSTR("www."), 8))
    {
      objc_msgSend(v7, "substringFromIndex:", 4);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    -[MCDomainsCacheEntry domain](self, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if (-[MCDomainsCacheEntry subdomainsMatch](self, "subdomainsMatch"))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[MCDomainsCacheEntry domain](self, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR(".%@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v7, "rangeOfString:options:", v13, 12);

      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_7;
    }
    else if ((v10 & 1) != 0)
    {
LABEL_7:
      -[MCDomainsCacheEntry path](self, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v5, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v16 || !objc_msgSend(v16, "length"))
        {
LABEL_13:
          v25 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v41 = self;
            v42 = 2114;
            v43 = v4;
            v26 = "%{public}@: Rejecting URL %{public}@ because path doesn't match.";
LABEL_38:
            _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_DEBUG, v26, buf, 0x16u);
            goto LABEL_39;
          }
          goto LABEL_39;
        }
        objc_msgSend(v17, "substringFromIndex:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[MCDomainsCacheEntry path](self, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if ((v20 & 1) == 0)
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          -[MCDomainsCacheEntry path](self, "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@/"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v18, "rangeOfString:options:", v23, 8);

          if (v24 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v17 = v18;
            goto LABEL_13;
          }
        }

      }
      -[MCDomainsCacheEntry port](self, "port");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v5, "port");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(v5, "scheme");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("http"));

          if ((v33 & 1) != 0)
          {
            v17 = &unk_1E4212B80;
          }
          else
          {
            objc_msgSend(v5, "scheme");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("https"));

            if (v35)
              v17 = &unk_1E4212B98;
            else
              v17 = 0;
          }
        }
        -[MCDomainsCacheEntry port](self, "port");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v17, "isEqualToNumber:", v36);

        if ((v37 & 1) == 0)
        {
          v25 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v41 = self;
            v42 = 2114;
            v43 = v4;
            v26 = "%{public}@: Rejecting URL %{public}@ because ports don't match.";
            goto LABEL_38;
          }
LABEL_39:

LABEL_40:
LABEL_41:
          v28 = 0;
LABEL_42:

          goto LABEL_43;
        }

      }
      v38 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v41 = self;
        v42 = 2114;
        v43 = v4;
        _os_log_impl(&dword_19ECC4000, v38, OS_LOG_TYPE_DEBUG, "%{public}@: Matched URL %{public}@", buf, 0x16u);
      }

      v28 = 1;
      goto LABEL_42;
    }
    v30 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      v41 = self;
      v42 = 2114;
      v43 = v4;
      _os_log_impl(&dword_19ECC4000, v30, OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting URL %{public}@ because host doesn't match.", buf, 0x16u);
    }
    goto LABEL_40;
  }
  v27 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v27, OS_LOG_TYPE_DEBUG, "Not matching URL because it's nil.", buf, 2u);
  }
  v28 = 0;
LABEL_43:

  return v28;
}

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
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v13.receiver = self;
  v13.super_class = (Class)MCDomainsCacheEntry;
  -[MCDomainsCacheEntry description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCDomainsCacheEntry domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCDomainsCacheEntry domain](self, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Domain: %@\n"), v7);

  }
  if (-[MCDomainsCacheEntry subdomainsMatch](self, "subdomainsMatch"))
    objc_msgSend(v5, "appendFormat:", CFSTR("Subdomain match: yes"));
  -[MCDomainsCacheEntry path](self, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCDomainsCacheEntry path](self, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Path: %@\n"), v9);

  }
  -[MCDomainsCacheEntry port](self, "port");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCDomainsCacheEntry port](self, "port");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Port: %@\n"), v11);

  }
  return v5;
}

- (BOOL)subdomainsMatch
{
  return self->_subdomainsMatch;
}

- (void)setSubdomainsMatch:(BOOL)a3
{
  self->_subdomainsMatch = a3;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_storeStrong((id *)&self->_port, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
