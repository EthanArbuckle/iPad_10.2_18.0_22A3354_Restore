@implementation CCMetaContentRecord

- (CCMetaContentRecord)init
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
    CFSTR("metacontent"),
    CFSTR("instance_hash"),
    CFSTR("metacontent"),
    CFSTR("instance_hash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tableName
{
  return CFSTR("metacontent");
}

- (CCMetaContentRecord)initWithDatabaseValueRow:(id)a3
{
  id v4;
  CCMetaContentRecord *v5;
  uint64_t v6;
  NSNumber *instanceHash;
  uint64_t v8;
  NSData *metaContent;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCMetaContentRecord;
  v5 = -[CCMetaContentRecord init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "numberValueAtColumnIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    instanceHash = v5->_instanceHash;
    v5->_instanceHash = (NSNumber *)v6;

    objc_msgSend(v4, "dataValueAtColumnIndex:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    metaContent = v5->_metaContent;
    v5->_metaContent = (NSData *)v8;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCMetaContentRecord;
  -[CCMetaContentRecord description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" metaContent length: %lu, instanceHash: %@"), -[NSData length](self->_metaContent, "length"), self->_instanceHash);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  CCMetaContentRecord *v4;
  CCMetaContentRecord *v5;
  BOOL v6;

  v4 = (CCMetaContentRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCMetaContentRecord isEqualToItemRecord:](self, "isEqualToItemRecord:", v5);

  return v6;
}

- (BOOL)isEqualToItemRecord:(id)a3
{
  id v4;
  void *v5;
  NSNumber *instanceHash;
  void *v7;
  NSData *metaContent;
  void *v9;
  char v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    instanceHash = self->_instanceHash;
    objc_msgSend(v4, "instanceHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSNumber isEqual:](instanceHash, "isEqual:", v7))
    {
      metaContent = self->_metaContent;
      objc_msgSend(v5, "metaContent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSData isEqual:](metaContent, "isEqual:", v9);

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

  v3 = -[NSNumber hash](self->_instanceHash, "hash");
  return -[NSData hash](self->_metaContent, "hash") ^ v3;
}

- (NSNumber)instanceHash
{
  return self->_instanceHash;
}

- (NSData)metaContent
{
  return self->_metaContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContent, 0);
  objc_storeStrong((id *)&self->_instanceHash, 0);
}

@end
