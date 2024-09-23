@implementation LNEffectiveBundleIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  LNEffectiveBundleIdentifier *v4;
  LNEffectiveBundleIdentifier *v5;
  LNEffectiveBundleIdentifier *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  int64_t v14;

  v4 = (LNEffectiveBundleIdentifier *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13 = 0;
LABEL_16:

      goto LABEL_17;
    }
    -[LNEffectiveBundleIdentifier bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEffectiveBundleIdentifier bundleIdentifier](v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      if (!v9 || !v10)
      {

LABEL_14:
        v13 = 0;
        goto LABEL_15;
      }
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_14;
    }
    v14 = -[LNEffectiveBundleIdentifier type](self, "type");
    v13 = v14 == -[LNEffectiveBundleIdentifier type](v6, "type");
LABEL_15:

    goto LABEL_16;
  }
  v13 = 1;
LABEL_17:

  return v13;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[LNEffectiveBundleIdentifier type](self, "type") - 1;
  if (v4 > 2)
    v5 = CFSTR("App");
  else
    v5 = off_1E39A0B10[v4];
  -[LNEffectiveBundleIdentifier bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEffectiveBundleIdentifier url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@ at %@)"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNEffectiveBundleIdentifier type](self, "type"), CFSTR("type"));
  -[LNEffectiveBundleIdentifier bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[LNEffectiveBundleIdentifier url](self, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("url"));

}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[LNEffectiveBundleIdentifier type](self, "type");
  -[LNEffectiveBundleIdentifier bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

LNBundleMetadata *__71__LNEffectiveBundleIdentifier_StaticExtraction__bundleMetadataForURLs___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  char v6;
  NSObject *v7;
  LNBundleMetadata *v8;
  uint64_t v9;
  LNBundleMetadata *v10;
  NSObject *v11;
  LNBundleMetadata *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[__CFString path](v3, "path");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReadableFileAtPath:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "_initUniqueWithURL:", v3);
    if (v7)
    {
      v8 = [LNBundleMetadata alloc];
      v9 = *(_QWORD *)(a1 + 32);
      v18 = 0;
      v10 = -[LNBundleMetadata initWithBundle:usingEffectiveBundleIdentifier:error:](v8, "initWithBundle:usingEffectiveBundleIdentifier:error:", v7, v9, &v18);
      v11 = v18;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        getLNLogCategoryMetadata();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          -[NSObject bundleIdentifier](v7, "bundleIdentifier");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          v16 = CFSTR("<missing bundle identifier>");
          if (v14)
            v16 = (const __CFString *)v14;
          *(_DWORD *)buf = 138543618;
          v20 = v16;
          v21 = 2114;
          v22 = v3;

        }
      }

    }
    else
    {
      getLNLogCategoryMetadata();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v3;
        _os_log_impl(&dword_19A9C7000, v11, OS_LOG_TYPE_ERROR, "Unable to create bundle with URL '%{public}@'", buf, 0xCu);
      }
      v10 = 0;
    }

  }
  else
  {
    getLNLogCategoryMetadata();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v4;
      _os_log_impl(&dword_19A9C7000, v7, OS_LOG_TYPE_ERROR, "'%{public}@' is not readable or doesn't exist", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (id)bundleMetadataForURLs:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__LNEffectiveBundleIdentifier_StaticExtraction__bundleMetadataForURLs___block_invoke;
  v4[3] = &unk_1E39A0F40;
  v4[4] = self;
  objc_msgSend(a3, "if_compactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNEffectiveBundleIdentifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  LNEffectiveBundleIdentifier *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[LNEffectiveBundleIdentifier initWithType:bundleIdentifier:url:](self, "initWithType:bundleIdentifier:url:", v5, v6, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (LNEffectiveBundleIdentifier)initWithType:(int64_t)a3 bundleIdentifier:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  LNEffectiveBundleIdentifier *v10;
  LNEffectiveBundleIdentifier *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  LNEffectiveBundleIdentifier *v14;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LNEffectiveBundleIdentifier;
  v10 = -[LNEffectiveBundleIdentifier init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_url, a5);
    v14 = v11;
  }

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (LNEffectiveBundleIdentifier)initWithType:(int64_t)a3 bundleIdentifier:(id)a4
{
  return -[LNEffectiveBundleIdentifier initWithType:bundleIdentifier:url:](self, "initWithType:bundleIdentifier:url:", a3, a4, 0);
}

@end
