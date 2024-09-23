@implementation FCIssueBookmark

- (FCIssueBookmark)init
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
    v8 = "-[FCIssueBookmark init]";
    v9 = 2080;
    v10 = "FCIssueBookmark.m";
    v11 = 1024;
    v12 = 23;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCIssueBookmark init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCIssueBookmark)initWithIssueType:(int64_t)a3 articleID:(id)a4 pageID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  FCIssueBookmark *v13;
  FCIssueBookmark *v14;
  uint64_t v15;
  NSString *articleID;
  uint64_t v17;
  NSString *pageID;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!a3 && !v8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueType != FCIssueTypeANF || articleID != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCIssueBookmark initWithIssueType:articleID:pageID:]";
    v23 = 2080;
    v24 = "FCIssueBookmark.m";
    v25 = 1024;
    v26 = 30;
    v27 = 2114;
    v28 = v11;
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_12;
  }
  if (a3 == 1 && !v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueType != FCIssueTypePDF || pageID != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCIssueBookmark initWithIssueType:articleID:pageID:]";
    v23 = 2080;
    v24 = "FCIssueBookmark.m";
    v25 = 1024;
    v26 = 31;
    v27 = 2114;
    v28 = v11;
    v12 = MEMORY[0x1E0C81028];
LABEL_12:
    _os_log_error_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_8:
  v20.receiver = self;
  v20.super_class = (Class)FCIssueBookmark;
  v13 = -[FCIssueBookmark init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_issueType = a3;
    v15 = objc_msgSend(v8, "copy");
    articleID = v14->_articleID;
    v14->_articleID = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    pageID = v14->_pageID;
    v14->_pageID = (NSString *)v17;

  }
  return v14;
}

+ (id)PDFBookmarkWithPageID:(id)a3
{
  id v3;
  FCIssueBookmark *v4;
  void *v6;
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
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "pageID != nil");
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCIssueBookmark PDFBookmarkWithPageID:]";
    v9 = 2080;
    v10 = "FCIssueBookmark.m";
    v11 = 1024;
    v12 = 45;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = -[FCIssueBookmark initWithIssueType:articleID:pageID:]([FCIssueBookmark alloc], "initWithIssueType:articleID:pageID:", 1, 0, v3);

  return v4;
}

+ (id)ANFBookmarkWithArticleID:(id)a3
{
  id v3;
  FCIssueBookmark *v4;
  void *v6;
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
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCIssueBookmark ANFBookmarkWithArticleID:]";
    v9 = 2080;
    v10 = "FCIssueBookmark.m";
    v11 = 1024;
    v12 = 54;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = -[FCIssueBookmark initWithIssueType:articleID:pageID:]([FCIssueBookmark alloc], "initWithIssueType:articleID:pageID:", 0, v3, 0);

  return v4;
}

- (int64_t)issueType
{
  return self->_issueType;
}

- (NSString)pageID
{
  return self->_pageID;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_pageID, 0);
}

@end
