@implementation _CDEventIndexerContext

- (_CDEventIndexerContext)init
{
  _CDEventIndexerContext *v2;
  uint64_t v3;
  NSDate *indexDate;
  uint64_t v5;
  OS_os_transaction *transaction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CDEventIndexerContext;
  v2 = -[_CDEventIndexerContext init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    indexDate = v2->_indexDate;
    v2->_indexDate = (NSDate *)v3;

    v5 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v5;

  }
  return v2;
}

- (uint64_t)isBookmarkValid
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;

  v1 = a1;
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
      v2 = *(_QWORD *)(v2 + 32);
    if (*(_QWORD *)(a1 + 16) == v2)
    {
      v3 = *(id *)(a1 + 8);
      v4 = v3;
      if (v3)
        v5 = (void *)*((_QWORD *)v3 + 3);
      else
        v5 = 0;
      v6 = v5;
      v7 = *(id *)(v1 + 40);
      if (objc_msgSend(v6, "compare:", v7) == 1)
      {
        v1 = 0;
      }
      else
      {
        v8 = *(_QWORD **)(v1 + 8);
        if (v8)
          v9 = (void *)v8[2];
        else
          v9 = 0;
        v10 = *(_QWORD *)(v1 + 40);
        v11 = v9;
        v12 = v8;
        v1 = objc_msgSend(v11, "compare:", v10) != 1;

      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)isBookmarkValidInRecoverableThreshold
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  double v14;

  v1 = a1;
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
      v2 = *(_QWORD *)(v2 + 32);
    if (*(_QWORD *)(a1 + 16) == v2)
    {
      v3 = *(id *)(a1 + 8);
      v4 = v3;
      if (v3)
        v5 = (void *)*((_QWORD *)v3 + 3);
      else
        v5 = 0;
      v6 = v5;
      v7 = *(id *)(v1 + 40);
      objc_msgSend(v6, "timeIntervalSinceDate:", v7);
      if (v8 >= 86400.0)
      {
        v1 = 0;
      }
      else
      {
        v9 = *(_QWORD **)(v1 + 8);
        if (v9)
          v10 = (void *)v9[2];
        else
          v10 = 0;
        v11 = *(_QWORD *)(v1 + 40);
        v12 = v10;
        v13 = v9;
        objc_msgSend(v12, "timeIntervalSinceDate:", v11);
        v1 = v14 < 86400.0;

      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  _CDEventIndexerBookmark *v5;
  _CDEventIndexerBookmark *v6;
  NSDate *latestTombstoneDate;
  NSDate *v8;
  NSDate *indexDate;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _CDEventIndexerBookmark *v15;
  _CDEventIndexerBookmark *v16;
  NSDate *latestCreationDate;
  NSDate *v18;
  NSDate *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSDate *v27;
  _CDEventIndexerBookmark *bookmark;
  void *v29;

  if ((-[_CDEventIndexerContext isBookmarkValid]((uint64_t)self) & 1) != 0)
  {
    v3 = CFSTR("valid");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("invalid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v5 = self->_bookmark;
      v6 = v5;
      if (v5)
        latestTombstoneDate = v5->_latestTombstoneDate;
      else
        latestTombstoneDate = 0;
      v8 = latestTombstoneDate;
      indexDate = self->_indexDate;
    }
    else
    {
      v8 = 0;
      v6 = 0;
      indexDate = 0;
    }
    -[NSDate timeIntervalSinceDate:](v8, "timeIntervalSinceDate:", indexDate);
    v11 = v10;

    if (v11 > 0.0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("(latest tombstone date is past index date by %@ seconds)"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);

    }
    if (self)
    {
      v15 = self->_bookmark;
      v16 = v15;
      if (v15)
        latestCreationDate = v15->_latestCreationDate;
      else
        latestCreationDate = 0;
      v18 = latestCreationDate;
      v19 = self->_indexDate;
    }
    else
    {
      v18 = 0;
      v16 = 0;
      v19 = 0;
    }
    -[NSDate timeIntervalSinceDate:](v18, "timeIntervalSinceDate:", v19);
    v21 = v20;

    if (v21 > 0.0)
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("(latest creation date is past index date by %@ seconds)"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v24);

    }
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v25 = (void *)MEMORY[0x1E0CB3940];
  v26 = objc_opt_class();
  if (self)
  {
    v27 = self->_indexDate;
    bookmark = self->_bookmark;
  }
  else
  {
    v27 = 0;
    bookmark = 0;
  }
  objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@ %p> indexDate: %@, bookmark: %@, validity: %@"), v26, self, v27, bookmark, v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_indexDate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

@end
