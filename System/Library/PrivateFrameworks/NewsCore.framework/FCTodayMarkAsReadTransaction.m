@implementation FCTodayMarkAsReadTransaction

- (FCTodayMarkAsReadTransaction)init
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
    v8 = "-[FCTodayMarkAsReadTransaction init]";
    v9 = 2080;
    v10 = "FCTodayMarkAsReadTransaction.m";
    v11 = 1024;
    v12 = 27;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTodayMarkAsReadTransaction init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCTodayMarkAsReadTransaction)initWithArticleID:(id)a3 articleVersion:(int64_t)a4 readDate:(id)a5
{
  id v8;
  id v9;
  FCTodayMarkAsReadTransaction *v10;
  uint64_t v11;
  NSString *articleID;
  uint64_t v13;
  NSDate *readDate;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCTodayMarkAsReadTransaction initWithArticleID:articleVersion:readDate:]";
    v21 = 2080;
    v22 = "FCTodayMarkAsReadTransaction.m";
    v23 = 1024;
    v24 = 34;
    v25 = 2114;
    v26 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "readDate");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCTodayMarkAsReadTransaction initWithArticleID:articleVersion:readDate:]";
    v21 = 2080;
    v22 = "FCTodayMarkAsReadTransaction.m";
    v23 = 1024;
    v24 = 35;
    v25 = 2114;
    v26 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v18.receiver = self;
  v18.super_class = (Class)FCTodayMarkAsReadTransaction;
  v10 = -[FCTodayMarkAsReadTransaction init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    articleID = v10->_articleID;
    v10->_articleID = (NSString *)v11;

    v10->_articleVersion = a4;
    v13 = objc_msgSend(v9, "copy");
    readDate = v10->_readDate;
    v10->_readDate = (NSDate *)v13;

  }
  return v10;
}

- (void)performWithPrivateDataContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  objc_msgSend(v5, "readingHistory");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[FCTodayMarkAsReadTransaction articleID](self, "articleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCTodayMarkAsReadTransaction articleVersion](self, "articleVersion");
  -[FCTodayMarkAsReadTransaction readDate](self, "readDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markArticleAsReadWithArticleID:articleVersion:readDate:", v6, v7, v8);

}

- (void)performWithTodayPrivateData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "recentlyReadHistoryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRecentlyReadHistoryItems:", v5);
  }
  -[FCTodayMarkAsReadTransaction articleID](self, "articleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCTodayMarkAsReadTransaction articleVersion](self, "articleVersion");
  -[FCTodayMarkAsReadTransaction readDate](self, "readDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && (FCCheckedProtocolCast((uint64_t)&unk_1EE6AFB78, v9), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = v10;
    v12 = objc_msgSend(v10, "maxVersionRead");
    if (v12 <= v7)
      v13 = v7;
    else
      v13 = v12;
    objc_msgSend(v11, "setMaxVersionRead:", v13);
    v14 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v11, "lastVisitedAt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fc_laterDateAllowingNilWithDate:andDate:", v15, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastVisitedAt:", v16);

  }
  else
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setArticleID:", v6);
    objc_msgSend(v11, "setMaxVersionRead:", v7);
    objc_msgSend(v11, "setLastVisitedAt:", v8);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v6);
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCTodayMarkAsReadTransaction articleID](self, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("a"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[FCTodayMarkAsReadTransaction articleVersion](self, "articleVersion"), CFSTR("b"));
  -[FCTodayMarkAsReadTransaction readDate](self, "readDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("c"));

}

- (FCTodayMarkAsReadTransaction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  FCTodayMarkAsReadTransaction *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("a"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("b"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[FCTodayMarkAsReadTransaction initWithArticleID:articleVersion:readDate:](self, "initWithArticleID:articleVersion:readDate:", v5, v6, v7);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)articleVersion
{
  return self->_articleVersion;
}

- (void)setArticleVersion:(int64_t)a3
{
  self->_articleVersion = a3;
}

- (NSDate)readDate
{
  return self->_readDate;
}

- (void)setReadDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readDate, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

@end
