@implementation IMDSqlQuery

- (IMDSqlQuery)initWithTableName:(id)a3
{
  IMDSqlQuery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDSqlQuery;
  v4 = -[IMDSqlQuery init](&v6, sel_init);
  if (v4)
    v4->_tableName = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

+ (id)databaseQuery:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTableName:", a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDSqlQuery;
  -[IMDSqlQuery dealloc](&v3, sel_dealloc);
}

- (id)createQueryString
{
  uint64_t v2;
  void (*v3)(uint64_t);
  NSObject *v4;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failure in %s at %s:%d. %@"), "-[IMDSqlQuery createQueryString]", IMFileLocationTrimFileName(), 40, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Use one of the subclasses")), 0x1ABC78EBDLL, 0, "-[IMDSqlQuery createQueryString]", "-[IMDSqlQuery createQueryString]");
  v3 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
  if (v3)
  {
    v3(v2);
  }
  else if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v2;
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  return 0;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)where
{
  return self->_where;
}

- (void)setWhere:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

@end
