@implementation FCArticleContent

- (FCANFContent)anfContent
{
  return self->_anfContent;
}

- (FCArticleContent)initWithContext:(id)a3 articleRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  FCWebContent *v13;
  void *v14;
  void *v15;
  void *v16;
  FCWebContent *v17;
  FCArticleContent *v18;
  void *v19;
  void *v20;
  FCANFContent *v21;
  void *v22;
  FCANFContent *v23;
  NSObject *v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "base");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "contentType");
  if (v10 == 2)
  {
    objc_msgSend(v6, "assetManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateFlintDocumentAssetHandleWithAssetManager:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = [FCANFContent alloc];
    objc_msgSend(v7, "flintFontResourceIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[FCANFContent initWithIdentifier:mainDocumentAssetHandle:fontResourceIDs:](v21, "initWithIdentifier:mainDocumentAssetHandle:fontResourceIDs:", v9, v20, v22);

    v18 = -[FCArticleContent initWithArticleID:anfContent:](self, "initWithArticleID:anfContent:", v9, v23);
  }
  else if (v10 == 1)
  {
    objc_msgSend(v6, "assetManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateWebExcerptAssetHandleWithAssetManager:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [FCWebContent alloc];
    v14 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v7, "contentURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FCWebContent initWithArticleID:sourceURL:excerptAssetHandle:](v13, "initWithArticleID:sourceURL:excerptAssetHandle:", v9, v16, v12);
    v18 = -[FCArticleContent initWithArticleID:webContent:](self, "initWithArticleID:webContent:", v9, v17);

  }
  else
  {
    v24 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      v26 = 138543362;
      v27 = v9;
      _os_log_error_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_ERROR, "Failed to create content for article ID: %{public}@", (uint8_t *)&v26, 0xCu);
    }

    v18 = 0;
  }

  return v18;
}

- (FCArticleContent)initWithArticleID:(id)a3 anfContent:(id)a4
{
  id v7;
  FCArticleContent *v8;
  FCArticleContent *v9;

  v7 = a4;
  v8 = -[FCArticleContent initWithArticleID:contentType:](self, "initWithArticleID:contentType:", a3, 2);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_anfContent, a4);

  return v9;
}

- (FCArticleContent)initWithArticleID:(id)a3 contentType:(unint64_t)a4
{
  id v6;
  FCArticleContent *v7;
  FCArticleContent *v8;
  uint64_t v9;
  NSString *articleID;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCArticleContent initWithArticleID:contentType:]";
    v16 = 2080;
    v17 = "FCArticleContent.m";
    v18 = 1024;
    v19 = 71;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v13.receiver = self;
  v13.super_class = (Class)FCArticleContent;
  v7 = -[FCArticleContent init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v9 = objc_msgSend(v6, "copy");
      articleID = v8->_articleID;
      v8->_articleID = (NSString *)v9;

      v8->_contentType = a4;
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anfContent, 0);
  objc_storeStrong((id *)&self->_webContent, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

- (FCArticleContent)initWithArticleID:(id)a3 webContent:(id)a4
{
  id v7;
  FCArticleContent *v8;
  FCArticleContent *v9;

  v7 = a4;
  v8 = -[FCArticleContent initWithArticleID:contentType:](self, "initWithArticleID:contentType:", a3, 1);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_webContent, a4);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    -[FCArticleContent articleID](self, "articleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "articleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v7 = 0;
    v6 = 0;
  }

  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCArticleContent articleID](self, "articleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (FCWebContent)webContent
{
  return self->_webContent;
}

- (void)setWebContent:(id)a3
{
  objc_storeStrong((id *)&self->_webContent, a3);
}

- (void)setAnfContent:(id)a3
{
  objc_storeStrong((id *)&self->_anfContent, a3);
}

@end
