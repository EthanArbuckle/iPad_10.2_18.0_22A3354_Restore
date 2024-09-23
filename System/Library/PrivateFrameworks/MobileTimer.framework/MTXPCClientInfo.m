@implementation MTXPCClientInfo

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTXPCClientInfo connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTXPCClientInfo processName](self, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MTXPCClientInfo processID](self, "processID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTXPCClientInfo connectedDate](self, "connectedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTXPCClientInfo connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p ProcessName: %@ ProcessID: %@ Connected: %@ Connection: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (int)processID
{
  void *v2;
  int v3;

  -[MTXPCClientInfo connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MTXPCClientInfo *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MTXPCClientInfo *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MTXPCClientInfo connection](self, "connection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTXPCClientInfo connection](v4, "connection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)processName
{
  void *v2;
  void *v3;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  proc_name(-[MTXPCClientInfo processID](self, "processID", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0),
    &v5,
    0x100u);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSDate)connectedDate
{
  return self->_connectedDate;
}

+ (id)clientInfoForConnection:(id)a3 clientLink:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConnection:clientLink:", v6, v5);

  return v7;
}

- (MTXPCClientInfo)initWithConnection:(id)a3 clientLink:(id)a4
{
  id v7;
  id v8;
  MTXPCClientInfo *v9;
  MTXPCClientInfo *v10;
  uint64_t v11;
  NSDate *connectedDate;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTXPCClientInfo;
  v9 = -[MTXPCClientInfo init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong(&v10->_clientLink, a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    connectedDate = v10->_connectedDate;
    v10->_connectedDate = (NSDate *)v11;

  }
  return v10;
}

- (id)sourceIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MTXPCClientInfo processName](self, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%d"), v4, -[MTXPCClientInfo processID](self, "processID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)donatesIntent
{
  return 1;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (id)clientLink
{
  return self->_clientLink;
}

- (void)setClientLink:(id)a3
{
  objc_storeStrong(&self->_clientLink, a3);
}

- (void)setConnectedDate:(id)a3
{
  objc_storeStrong((id *)&self->_connectedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedDate, 0);
  objc_storeStrong(&self->_clientLink, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
