@implementation FCWebContent

- (FCWebContent)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCWebContent init]";
    v9 = 2080;
    v10 = "FCWebContent.m";
    v11 = 1024;
    v12 = 27;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCWebContent init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCWebContent)initWithArticleID:(id)a3 sourceURL:(id)a4 excerptAssetHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCWebContent *v11;
  uint64_t v12;
  NSString *articleID;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCWebContent;
  v11 = -[FCWebContent init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    articleID = v11->_articleID;
    v11->_articleID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_sourceURL, a4);
    objc_storeStrong((id *)&v11->_excerptAssetHandle, a5);
  }

  return v11;
}

- (FCAssetHandle)excerptAssetHandle
{
  return self->_excerptAssetHandle;
}

- (void)setExcerptAssetHandle:(id)a3
{
  objc_storeStrong((id *)&self->_excerptAssetHandle, a3);
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_excerptAssetHandle, 0);
}

@end
