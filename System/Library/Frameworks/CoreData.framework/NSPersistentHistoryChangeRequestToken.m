@implementation NSPersistentHistoryChangeRequestToken

- (id)initForRequest:(id)a3
{
  NSPersistentHistoryChangeRequestToken *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSPersistentHistoryChangeRequestToken;
  v4 = -[NSPersistentHistoryChangeRequestToken init](&v6, sel_init);
  if (v4)
  {
    v4->_fetchData = (NSData *)objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "encodeForXPC");
    v4->_token = (NSDictionary *)(id)objc_msgSend((id)objc_msgSend(a3, "token"), "storeTokens");
    v4->_date = (NSDate *)(id)objc_msgSend(a3, "date");
    v4->_resultType = objc_msgSend(a3, "resultType");
    v4->_delete = objc_msgSend(a3, "isDelete");
    v4->_transactionFromToken = objc_msgSend(a3, "isFetchTransactionForToken");
    v4->_fetchLimit = objc_msgSend(a3, "fetchLimit");
    v4->_fetchOffset = objc_msgSend(a3, "fetchOffset");
    v4->_fetchBatchSize = objc_msgSend(a3, "fetchBatchSize");
    v4->_percentageOfDB = objc_msgSend(a3, "percentageOfDB");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_fetchData = 0;
  self->_token = 0;

  self->_date = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentHistoryChangeRequestToken;
  -[NSPersistentHistoryChangeRequestToken dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersistentHistoryChangeRequestToken)initWithCoder:(id)a3
{
  NSPersistentHistoryChangeRequestToken *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NSPersistentHistoryChangeRequestToken;
  v4 = -[NSPersistentHistoryChangeRequestToken init](&v13, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v4->_fetchData = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), CFSTR("fetch"));
    v4->_token = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v9, CFSTR("token"));
    v4->_date = (NSDate *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v4->_resultType = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("resultType"));
    v4->_delete = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("delete"));
    v4->_transactionFromToken = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("transactionFromToken"));
    v4->_fetchLimit = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("fetchLimit"));
    v4->_fetchOffset = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("fetchOffset"));
    v4->_fetchBatchSize = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("fetchBatchSize"));
    v4->_percentageOfDB = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("percentageOfDB"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_fetchData, CFSTR("fetch"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_token, CFSTR("token"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_resultType, CFSTR("resultType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_delete, CFSTR("delete"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_transactionFromToken, CFSTR("transactionFromToken"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_fetchLimit, CFSTR("fetchLimit"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_fetchOffset, CFSTR("fetchOffset"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_fetchBatchSize, CFSTR("fetchBatchSize"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_percentageOfDB, CFSTR("percentageOfDB"));
}

- (NSData)fetchData
{
  return self->_fetchData;
}

- (NSDictionary)token
{
  return self->_token;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (BOOL)delete
{
  return self->_delete;
}

- (BOOL)transactionFromToken
{
  return self->_transactionFromToken;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (unint64_t)fetchOffset
{
  return self->_fetchOffset;
}

- (unint64_t)fetchBatchSize
{
  return self->_fetchBatchSize;
}

- (unint64_t)percentageOfDB
{
  return self->_percentageOfDB;
}

@end
