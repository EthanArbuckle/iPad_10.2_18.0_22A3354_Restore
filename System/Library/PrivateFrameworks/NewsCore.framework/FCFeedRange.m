@implementation FCFeedRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottom, 0);
  objc_storeStrong((id *)&self->_top, 0);
}

+ (FCFeedRange)feedRangeWithMaxOrder:(unint64_t)a3 minOrder:(unint64_t)a4
{
  FCFeedRange *v6;
  void *v7;
  void *v8;

  v6 = objc_alloc_init(FCFeedRange);
  +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRange setTop:](v6, "setTop:", v7);

  +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRange setBottom:](v6, "setBottom:", v8);

  return v6;
}

- (double)timeInterval
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;

  -[FCFeedRange top](self, "top");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "order");
  -[FCFeedRange bottom](self, "bottom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)(v4 - objc_msgSend(v5, "order")) / 1000.0;

  return v6;
}

- (id)feedRangeByIntersectingWithRange:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
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
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "range != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCFeedRange feedRangeByIntersectingWithRange:]";
    v23 = 2080;
    v24 = "FCFeedRange.m";
    v25 = 1024;
    v26 = 175;
    v27 = 2114;
    v28 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "order");

  objc_msgSend(v4, "top");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "order");

  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  -[FCFeedRange bottom](self, "bottom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "order");

  objc_msgSend(v4, "bottom");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "order");

  if (v11 <= v13)
    v14 = v13;
  else
    v14 = v11;
  if (v14 >= v9)
    v15 = v9;
  else
    v15 = v14;
  +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FCFeedRange *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(FCFeedRange);
  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRange setTop:](v4, "setTop:", v5);

  -[FCFeedRange bottom](self, "bottom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRange setBottom:](v4, "setBottom:", v6);

  return v4;
}

+ (FCFeedRange)feedRangeWithTop:(id)a3 bottom:(id)a4
{
  id v5;
  id v6;
  FCFeedRange *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(FCFeedRange);
  -[FCFeedRange setTop:](v7, "setTop:", v6);

  -[FCFeedRange setBottom:](v7, "setBottom:", v5);
  return v7;
}

- (void)setTop:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setBottom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)intersectsRange:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "order");
  objc_msgSend(v4, "bottom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 <= objc_msgSend(v7, "order"))
  {
    v11 = 0;
  }
  else
  {
    -[FCFeedRange bottom](self, "bottom");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "order");
    objc_msgSend(v4, "top");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9 < objc_msgSend(v10, "order");

  }
  return v11;
}

- (FCFeedCursor)bottom
{
  return self->_bottom;
}

- (FCFeedCursor)top
{
  return self->_top;
}

+ (id)feedRangeFromDateRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isFromInfinity") & 1) != 0)
  {
    +[FCFeedCursor cursorForTopOfFeed](FCFeedCursor, "cursorForTopOfFeed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForDate:](FCFeedCursor, "cursorForDate:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v4, "isToInfinity") & 1) != 0)
  {
    +[FCFeedCursor cursorForBottomOfFeed](FCFeedCursor, "cursorForBottomOfFeed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForDate:](FCFeedCursor, "cursorForDate:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "feedRangeWithTop:bottom:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)feedRangeFromDate:(id)a3 toDate:(id)a4
{
  void *v5;
  void *v6;

  +[FCDateRange dateRangeWithStartDate:endDate:](FCDateRange, "dateRangeWithStartDate:endDate:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "feedRangeFromDateRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)feedRangeByMergingRange:(id)a3 withRange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v5, "top");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "order");

    objc_msgSend(v7, "top");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "order");

    if (v9 <= v11)
      v12 = v11;
    else
      v12 = v9;
    +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottom");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "order");

    objc_msgSend(v7, "bottom");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "order");

    if (v15 >= v17)
      v18 = v17;
    else
      v18 = v15;
    +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v13, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5)
      v21 = v5;
    else
      v21 = v6;
    v20 = v21;
  }

  return v20;
}

- (FCFeedRange)initWithCoder:(id)a3
{
  id v4;
  FCFeedRange *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(FCFeedRange);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("top"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRange setTop:](v5, "setTop:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bottom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCFeedRange setBottom:](v5, "setBottom:", v7);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("top"));

  -[FCFeedRange bottom](self, "bottom");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bottom"));

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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

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

  -[FCFeedRange top](self, "top");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "top");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToCursor:", v8))
  {
    -[FCFeedRange bottom](self, "bottom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottom");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToCursor:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[FCFeedRange top](self, "top");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCFeedRange bottom](self, "bottom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (FCFeedCursor)middle
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[FCFeedRange bottom](self, "bottom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "order");
  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "order");
  -[FCFeedRange bottom](self, "bottom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v4 + ((unint64_t)(v6 - objc_msgSend(v7, "order")) >> 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCFeedCursor *)v8;
}

- (BOOL)reachesTopOfFeed
{
  void *v2;
  char v3;

  -[FCFeedRange top](self, "top");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTopOfFeed");

  return v3;
}

- (BOOL)reachesBottomOfFeed
{
  void *v2;
  char v3;

  -[FCFeedRange bottom](self, "bottom");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBottomOfFeed");

  return v3;
}

- (BOOL)isEmpty
{
  void *v3;
  void *v4;
  BOOL v5;

  -[FCFeedRange top](self, "top");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRange bottom](self, "bottom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compareToCursor:", v4) != 1;

  return v5;
}

- (FCDateRange)dateRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FCFeedRange top](self, "top");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRange bottom](self, "bottom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCDateRange dateRangeWithStartDate:endDate:](FCDateRange, "dateRangeWithStartDate:endDate:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCDateRange *)v7;
}

- (_NSRange)nsRange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  -[FCFeedRange bottom](self, "bottom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "order") + 1;
  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "order");
  -[FCFeedRange bottom](self, "bottom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 - objc_msgSend(v7, "order");

  v9 = v4;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (BOOL)containsOrder:(unint64_t)a3
{
  void *v5;
  BOOL v6;
  void *v7;

  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "order") >= a3)
  {
    -[FCFeedRange bottom](self, "bottom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "order") < a3;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)containsCursor:(id)a3
{
  return -[FCFeedRange containsOrder:](self, "containsOrder:", objc_msgSend(a3, "order"));
}

- (BOOL)containsFeedRange:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v4 = a3;
  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "order");
  objc_msgSend(v4, "top");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v7, "order"))
  {
    -[FCFeedRange bottom](self, "bottom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "order");
    objc_msgSend(v4, "bottom");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10 <= objc_msgSend(v11, "order");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)intersectsOrAdjoinsRange:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v4 = a3;
  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "order");
  objc_msgSend(v4, "bottom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v7, "order"))
  {
    -[FCFeedRange bottom](self, "bottom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "order");
    objc_msgSend(v4, "top");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10 <= objc_msgSend(v11, "order");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)feedRangeByUnioningWithRange:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "range != nil");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCFeedRange feedRangeByUnioningWithRange:]";
    v22 = 2080;
    v23 = "FCFeedRange.m";
    v24 = 1024;
    v25 = 187;
    v26 = 2114;
    v27 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "order");

  objc_msgSend(v4, "top");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "order");

  if (v6 <= v8)
    v9 = v8;
  else
    v9 = v6;
  -[FCFeedRange bottom](self, "bottom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "order");

  objc_msgSend(v4, "bottom");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "order");

  if (v11 >= v13)
    v14 = v13;
  else
    v14 = v11;
  +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[FCFeedRange top](self, "top");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "order"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[FCFeedRange bottom](self, "bottom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedLongLong:", objc_msgSend(v8, "order"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
