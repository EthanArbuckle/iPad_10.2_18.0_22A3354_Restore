@implementation FCArticleClassification

- (FCArticleClassification)initWithArticleID:(id)a3
{
  id v4;
  FCArticleClassification *v5;
  FCArticleClassification *v6;
  uint64_t v7;
  FCArticleClassification *articleID;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCArticleClassification initWithArticleID:]";
    v14 = 2080;
    v15 = "FCArticleClassification.m";
    v16 = 1024;
    v17 = 22;
    v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v11.receiver = self;
  v11.super_class = (Class)FCArticleClassification;
  v5 = -[FCArticleClassification init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(v4, "copy");
      articleID = (FCArticleClassification *)v6->_articleID;
      v6->_articleID = (NSString *)v7;
    }
    else
    {
      articleID = v5;
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[FCArticleClassification articleID](self, "articleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "articleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCArticleClassification articleID](self, "articleID");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleID, 0);
}

@end
