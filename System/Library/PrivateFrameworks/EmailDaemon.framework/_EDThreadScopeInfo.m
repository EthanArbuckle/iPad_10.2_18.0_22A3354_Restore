@implementation _EDThreadScopeInfo

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setLastViewedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastViewedDate, a3);
}

- (id)description
{
  id v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = -[_EDThreadScopeInfo databaseID](self, "databaseID");
  if (-[_EDThreadScopeInfo needsUpdate](self, "needsUpdate"))
    v5 = CFSTR(", needs update");
  else
    v5 = &stru_1E94A4508;
  -[_EDThreadScopeInfo lastViewedDate](self, "lastViewedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%lld%@, last viewed: %@"), v4, v5, v6);

  return v7;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (NSDate)lastViewedDate
{
  return self->_lastViewedDate;
}

- (_EDThreadScopeInfo)initWithDatabaseID:(int64_t)a3 needsUpdate:(BOOL)a4 lastViewedDate:(id)a5
{
  id v9;
  _EDThreadScopeInfo *v10;
  _EDThreadScopeInfo *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_EDThreadScopeInfo;
  v10 = -[_EDThreadScopeInfo init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_databaseID = a3;
    v10->_needsUpdate = a4;
    objc_storeStrong((id *)&v10->_lastViewedDate, a5);
  }

  return v11;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastViewedDate, 0);
}

@end
