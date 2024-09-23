@implementation FCFeedCursor

+ (id)cursorForOrder:(unint64_t)a3
{
  FCFeedCursor *v4;

  v4 = objc_alloc_init(FCFeedCursor);
  -[FCFeedCursor setOrder:](v4, "setOrder:", a3);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FCFeedCursor *v4;

  v4 = objc_alloc_init(FCFeedCursor);
  -[FCFeedCursor setOrder:](v4, "setOrder:", -[FCFeedCursor order](self, "order"));
  return v4;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

+ (id)cursorForTopOfFeed
{
  return (id)objc_msgSend(a1, "cursorForOrder:", -1);
}

+ (id)cursorForBottomOfFeed
{
  return (id)objc_msgSend(a1, "cursorForOrder:", 0);
}

+ (id)cursorForTimeIntervalBeforeNow:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_dateBySubtractingTimeInterval:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cursorForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)cursorForDate:(id)a3
{
  return (id)objc_msgSend(a1, "cursorForOrder:", objc_msgSend(a3, "fc_millisecondTimeIntervalSince1970"));
}

+ (id)cursorForCurrentDate
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cursorForDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (FCFeedCursor)initWithCoder:(id)a3
{
  id v4;
  FCFeedCursor *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(FCFeedCursor);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("order"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCFeedCursor setOrder:](v5, "setOrder:", objc_msgSend(v6, "unsignedLongLongValue"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", -[FCFeedCursor order](self, "order"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("order"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;

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

  v7 = -[FCFeedCursor order](self, "order");
  LOBYTE(v7) = v7 == objc_msgSend(v6, "order");

  return v7;
}

- (BOOL)isEqualToCursor:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[FCFeedCursor order](self, "order");
  v6 = objc_msgSend(v4, "order");

  return v5 == v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[FCFeedCursor order](self, "order"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)compareToCursor:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[FCFeedCursor order](self, "order");
  v6 = objc_msgSend(v4, "order");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (BOOL)isTopOfFeed
{
  return -[FCFeedCursor order](self, "order") == -1;
}

- (BOOL)isBottomOfFeed
{
  return -[FCFeedCursor order](self, "order") == 0;
}

- (NSDate)date
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", -[FCFeedCursor order](self, "order"));
}

- (BOOL)hasReachedCursor:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("other cursor must be non-nil"));
    v8 = 136315906;
    v9 = "-[FCFeedCursor hasReachedCursor:]";
    v10 = 2080;
    v11 = "FCFeedCursor.m";
    v12 = 1024;
    v13 = 116;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

  }
  v5 = -[FCFeedCursor compareToCursor:](self, "compareToCursor:", v4) != 1;

  return v5;
}

- (id)topmostCursor:(id)a3
{
  FCFeedCursor *v4;
  FCFeedCursor *v5;

  v4 = (FCFeedCursor *)a3;
  if (v4 && -[FCFeedCursor compareToCursor:](self, "compareToCursor:", v4) != 1)
    self = v4;
  v5 = self;

  return v5;
}

- (id)bottommostCursor:(id)a3
{
  FCFeedCursor *v4;
  FCFeedCursor *v5;

  v4 = (FCFeedCursor *)a3;
  if (v4 && -[FCFeedCursor compareToCursor:](self, "compareToCursor:", v4) == 1)
    self = v4;
  v5 = self;

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[FCFeedCursor order](self, "order"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
