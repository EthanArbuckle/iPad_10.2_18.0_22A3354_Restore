@implementation _DKSyncHistory

- (_DKSyncHistory)init
{
  void *v3;
  _DKSyncHistory *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_DKSyncHistory initWithLastSyncDate:lastDaySyncCount:](self, "initWithLastSyncDate:lastDaySyncCount:", v3, 0);

  return v4;
}

- (_DKSyncHistory)initWithLastSyncDate:(id)a3 lastDaySyncCount:(unint64_t)a4
{
  id v7;
  _DKSyncHistory *v8;
  _DKSyncHistory *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DKSyncHistory;
  v8 = -[_DKSyncHistory init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lastSyncDate, a3);
    v9->_lastDaySyncCount = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](self->_lastSyncDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lastDaySyncCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: lastSyncDate=%@, lastDaySyncCount=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (unint64_t)lastDaySyncCount
{
  return self->_lastDaySyncCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
}

@end
