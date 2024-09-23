@implementation IMDaemonQuery

- (NSDate)startDate
{
  return self->_startDate;
}

- (IMDaemonQuery)initWithID:(id)a3 key:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMDaemonQuery *v11;
  uint64_t v12;
  NSString *ID;
  uint64_t v14;
  NSString *key;
  uint64_t v16;
  id completionHandler;
  uint64_t v18;
  NSDate *startDate;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)IMDaemonQuery;
  v11 = -[IMDaemonQuery init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    ID = v11->_ID;
    v11->_ID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    key = v11->_key;
    v11->_key = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = (id)v16;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = objc_claimAutoreleasedReturnValue();
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v18;

  }
  return v11;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMDaemonQuery ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDaemonQuery key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDaemonQuery startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDaemonQuery completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("YES");
  if (!v7)
    v8 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ID: %@ key: %@ startDate: %@ completionHandler: %@"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSString)key
{
  return self->_key;
}

@end
