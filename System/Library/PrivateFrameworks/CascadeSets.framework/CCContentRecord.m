@implementation CCContentRecord

- (CCContentRecord)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)recordFromDatabaseValueRow:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDatabaseValueRow:", v3);

  return v4;
}

+ (id)genSQLCreateStatements
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS \"%@\" (\"%@\" integer NOT NULL, \"%@\" blob NOT NULL, PRIMARY KEY (\"%@\"));"),
    CFSTR("content"),
    CFSTR("content_hash"),
    CFSTR("content"),
    CFSTR("content_hash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tableName
{
  return CFSTR("content");
}

- (CCContentRecord)initWithDatabaseValueRow:(id)a3
{
  id v4;
  CCContentRecord *v5;
  uint64_t v6;
  NSNumber *contentHash;
  uint64_t v8;
  NSData *content;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCContentRecord;
  v5 = -[CCContentRecord init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "numberValueAtColumnIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    contentHash = v5->_contentHash;
    v5->_contentHash = (NSNumber *)v6;

    objc_msgSend(v4, "dataValueAtColumnIndex:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSData *)v8;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCContentRecord;
  -[CCContentRecord description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" contentHash: %@, content length: %lu"), self->_contentHash, -[NSData length](self->_content, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  CCContentRecord *v4;
  CCContentRecord *v5;
  BOOL v6;

  v4 = (CCContentRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCContentRecord isEqualToItemRecord:](self, "isEqualToItemRecord:", v5);

  return v6;
}

- (BOOL)isEqualToItemRecord:(id)a3
{
  id v4;
  void *v5;
  NSNumber *contentHash;
  void *v7;
  NSData *content;
  void *v9;
  char v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    contentHash = self->_contentHash;
    objc_msgSend(v4, "contentHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSNumber isEqual:](contentHash, "isEqual:", v7))
    {
      content = self->_content;
      objc_msgSend(v5, "content");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSData isEqual:](content, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSNumber hash](self->_contentHash, "hash");
  return -[NSData hash](self->_content, "hash") ^ v3;
}

- (NSNumber)contentHash
{
  return self->_contentHash;
}

- (NSData)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
}

@end
