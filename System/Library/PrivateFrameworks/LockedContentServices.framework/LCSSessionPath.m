@implementation LCSSessionPath

+ (id)temporarySessionPathWithType:(unint64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  LCSSessionURLBuilder *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v14;

  v4 = CFSTR("com.apple.GenericSession");
  if (a3 == 1)
    v4 = CFSTR("com.apple.SecureCapture");
  v5 = v4;
  v6 = -[LCSSessionURLBuilder initWithTypeIdentifier:]([LCSSessionURLBuilder alloc], "initWithTypeIdentifier:", v5);

  -[LCSSessionURLBuilder temporarySessionURL](v6, "temporarySessionURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    LCSLogSessionContents();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[LCSSessionPath temporarySessionPathWithType:].cold.1(v10);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v14);
  v10 = v14;

  if ((v9 & 1) == 0)
  {
    LCSLogSessionContents();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[LCSSessionPath temporarySessionPathWithType:].cold.2((uint64_t)v7, v12);

LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v11 = -[LCSSessionPath _initWithURL:type:isTemporaryPath:]([LCSSessionPath alloc], "_initWithURL:type:isTemporaryPath:", v7, a3, 1);
LABEL_12:

  return v11;
}

+ (id)finalizedSessionPathsWithType:(unint64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  LCSSessionURLBuilder *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = CFSTR("com.apple.GenericSession");
  if (a3 == 1)
    v4 = CFSTR("com.apple.SecureCapture");
  v5 = v4;
  v6 = -[LCSSessionURLBuilder initWithTypeIdentifier:]([LCSSessionURLBuilder alloc], "initWithTypeIdentifier:", v5);

  -[LCSSessionURLBuilder finalizedSessionURLsForCurrentApplication](v6, "finalizedSessionURLsForCurrentApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__LCSSessionPath_finalizedSessionPathsWithType___block_invoke;
    v10[3] = &__block_descriptor_40_e15__16__0__NSURL_8l;
    v10[4] = a3;
    objc_msgSend(v7, "bs_map:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

id __48__LCSSessionPath_finalizedSessionPathsWithType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[LCSSessionPath _initWithURL:type:isTemporaryPath:]([LCSSessionPath alloc], "_initWithURL:type:isTemporaryPath:", v3, *(_QWORD *)(a1 + 32), 0);

  return v4;
}

- (id)_initWithURL:(id)a3 type:(unint64_t)a4 isTemporaryPath:(BOOL)a5
{
  id v8;
  LCSSessionPath *v9;
  LCSSessionPath *v10;
  uint64_t v11;
  NSURL *url;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LCSSessionPath;
  v9 = -[LCSSessionPath init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_type = a4;
    v9->_isTemporaryPath = a5;
    v11 = objc_msgSend(v8, "copy");
    url = v10->_url;
    v10->_url = (NSURL *)v11;

  }
  return v10;
}

- (id)finalizeTemporarySessionPathForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LCSSessionPath url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:](LCSSessionFinalizer, "finalizeTemporarySessionAtURL:forBundleProvider:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[LCSSessionPath _initWithURL:type:isTemporaryPath:]([LCSSessionPath alloc], "_initWithURL:type:isTemporaryPath:", v6, self->_type, 0);
  else
    v7 = 0;

  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isTemporaryPath
{
  return self->_isTemporaryPath;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  BOOL *p_lock_isInvalidating;
  _BOOL4 isTemporaryPath;
  BOOL *p_lock_invalidated;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_lock_isInvalidating = &self->_lock_isInvalidating;
  if (!self->_lock_isInvalidating)
  {
    isTemporaryPath = self->_isTemporaryPath;
    p_lock_invalidated = &self->_lock_isInvalidating;
    if (!self->_isTemporaryPath)
    {
      p_lock_invalidated = &self->_lock_invalidated;
      if (self->_lock_invalidated)
        goto LABEL_7;
      *p_lock_isInvalidating = 1;
    }
    *p_lock_invalidated = 1;
    if (!-[LCSSessionPath _lock_purgeContentsIncludingDirectory:](self, "_lock_purgeContentsIncludingDirectory:", !isTemporaryPath))self->_lock_invalidated = 0;
    *p_lock_isInvalidating = 0;
  }
LABEL_7:
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_lock_purgeContentsIncludingDirectory:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSURL *url;
  char v7;
  id v8;
  BOOL v9;
  void *v10;
  NSURL *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _BYTE v44[128];
  uint64_t v45;

  v3 = a3;
  v45 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    v41 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", url, &v41);
    v8 = v41;

    if ((v7 & 1) != 0)
    {
LABEL_3:
      v9 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__0;
    v39 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_url;
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __56__LCSSessionPath__lock_purgeContentsIncludingDirectory___block_invoke;
    v34[3] = &unk_251104C80;
    v34[4] = &v35;
    objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, 0, 3, v34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = v12;
    v8 = 0;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v31;
      while (2)
      {
        v16 = 0;
        v17 = v8;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v16);
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v17;
          v20 = objc_msgSend(v19, "removeItemAtURL:error:", v18, &v29);
          v8 = v29;

          if ((v20 & 1) == 0)
          {
            LOBYTE(v14) = 0;
            goto LABEL_14;
          }
          ++v16;
          v17 = v8;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
        if (v14)
          continue;
        break;
      }
      LOBYTE(v14) = 1;
    }
LABEL_14:

    if (objc_msgSend((id)v36[5], "count"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to purge one or more contents of %@"), self->_url);
      v14 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD10D8];
      v42[0] = *MEMORY[0x24BDD0FC8];
      v42[1] = v22;
      v43[0] = v14;
      objc_msgSend((id)v36[5], "allValues");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "copy");
      v43[1] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.LCSSessionPath"), -1, v25);
      v26 = objc_claimAutoreleasedReturnValue();

      LOBYTE(v14) = 0;
      v8 = (id)v26;
    }

    _Block_object_dispose(&v35, 8);
    if ((v14 & 1) != 0)
      goto LABEL_3;
  }
  LCSLogSessionContents();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    -[LCSSessionPath _lock_purgeContentsIncludingDirectory:].cold.1((uint64_t)self, (uint64_t)v8, v27);

  v9 = 0;
LABEL_20:

  return v9;
}

uint64_t __56__LCSSessionPath__lock_purgeContentsIncludingDirectory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", a3, a2);
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LCSSessionPath)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  LCSSessionPath *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTemporaryPath"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9 || (v11 = objc_msgSend(v9, "integerValue"), v11 > 1))
      v11 = 0;
    v7 = -[LCSSessionPath _initWithURL:type:isTemporaryPath:](self, "_initWithURL:type:isTemporaryPath:", v6, v11, v8);

  }
  else
  {
    v6 = -[LCSSessionPath _initWithURL:type:isTemporaryPath:](self, "_initWithURL:type:isTemporaryPath:", 0, 0, 1);
    objc_msgSend(v6, "invalidate");
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;
  id v6;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isTemporaryPath, CFSTR("isTemporaryPath"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_type);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (LCSSessionPath)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  LCSSessionPath *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTemporaryPath"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9 || (v11 = objc_msgSend(v9, "integerValue"), v11 > 1))
      v11 = 0;
    v7 = -[LCSSessionPath _initWithURL:type:isTemporaryPath:](self, "_initWithURL:type:isTemporaryPath:", v6, v11, v8);

  }
  else
  {
    v6 = -[LCSSessionPath _initWithURL:type:isTemporaryPath:](self, "_initWithURL:type:isTemporaryPath:", 0, 0, 1);
    objc_msgSend(v6, "invalidate");
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSURL *url;
  id v5;
  id v6;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isTemporaryPath, CFSTR("isTemporaryPath"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_type);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

+ (void)temporarySessionPathWithType:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_240B1C000, log, OS_LOG_TYPE_ERROR, "Unable to resolve a temporary session path", v1, 2u);
}

+ (void)temporarySessionPathWithType:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_240B1C000, a2, OS_LOG_TYPE_ERROR, "Unable to create directory for session path: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_purgeContentsIncludingDirectory:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_240B1C000, log, OS_LOG_TYPE_ERROR, "Unable to purge contents of path %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
