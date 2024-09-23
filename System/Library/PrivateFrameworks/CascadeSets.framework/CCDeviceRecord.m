@implementation CCDeviceRecord

- (CCDeviceRecord)init
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS \"%@\" (\"%@\" integer PRIMARY KEY, \"%@\" varchar NOT NULL, \"%@\" integer);"),
    CFSTR("device"),
    CFSTR("device_row_id"),
    CFSTR("device_id"),
    CFSTR("options"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tableName
{
  return CFSTR("device");
}

- (CCDeviceRecord)initWithDatabaseValueRow:(id)a3
{
  id v4;
  CCDeviceRecord *v5;
  uint64_t v6;
  NSNumber *deviceRowId;
  uint64_t v8;
  NSString *deviceId;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CCDeviceRecord;
  v5 = -[CCDeviceRecord init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "numberValueAtColumnIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    deviceRowId = v5->_deviceRowId;
    v5->_deviceRowId = (NSNumber *)v6;

    objc_msgSend(v4, "stringValueAtColumnIndex:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    deviceId = v5->_deviceId;
    v5->_deviceId = (NSString *)v8;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_options = objc_msgSend(v10, "unsignedCharValue");

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCDeviceRecord;
  -[CCDeviceRecord description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" deviceRowId: %@, deviceId: %@ options %X"), self->_deviceRowId, self->_deviceId, self->_options);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  CCDeviceRecord *v4;
  CCDeviceRecord *v5;
  BOOL v6;

  v4 = (CCDeviceRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCDeviceRecord isEqualToItemRecord:](self, "isEqualToItemRecord:", v5);

  return v6;
}

- (BOOL)isEqualToItemRecord:(id)a3
{
  id v4;
  void *v5;
  NSNumber *deviceRowId;
  void *v7;
  NSString *deviceId;
  void *v9;
  int options;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    deviceRowId = self->_deviceRowId;
    objc_msgSend(v4, "deviceRowId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSNumber isEqual:](deviceRowId, "isEqual:", v7))
    {
      deviceId = self->_deviceId;
      objc_msgSend(v5, "deviceId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](deviceId, "isEqual:", v9))
      {
        options = self->_options;
        v11 = options == objc_msgSend(v5, "options");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSNumber hash](self->_deviceRowId, "hash");
  v4 = -[NSString hash](self->_deviceId, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_options);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (NSNumber)deviceRowId
{
  return self->_deviceRowId;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (unsigned)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_deviceRowId, 0);
}

@end
