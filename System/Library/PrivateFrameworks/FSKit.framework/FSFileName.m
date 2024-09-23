@implementation FSFileName

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  data = self->_data;
  v5 = v7;
  if (data)
  {
    objc_msgSend(v7, "encodeObject:forKey:", data, CFSTR("FSFileNameData"));
    v5 = v7;
  }

}

- (FSFileName)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FSFileName *v6;
  id v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSFileNameData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[FSFileName initWithData:](self, "initWithData:", v5);
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (FSFileName)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return -[FSFileName initWithBytes:length:](self, "initWithBytes:length:", v5, v6);
}

- (FSFileName)initWithString:(id)a3
{
  return -[FSFileName initWithCString:](self, "initWithCString:", objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (FSFileName)initWithBytes:(const char *)a3 length:(unint64_t)a4
{
  const char *v4;
  FSFileName *v6;
  uint64_t v7;
  NSData *data;
  objc_super v10;

  v4 = a3;
  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)FSFileName;
    v6 = -[FSFileName init](&v10, sel_init);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v4, strnlen(v4, a4));
      v7 = objc_claimAutoreleasedReturnValue();
      data = v6->_data;
      v6->_data = (NSData *)v7;

    }
    self = v6;
    v4 = (const char *)self;
  }

  return (FSFileName *)v4;
}

- (FSFileName)initWithCString:(const char *)a3
{
  const char *v3;
  FSFileName *v4;
  uint64_t v5;
  NSData *data;
  objc_super v8;

  v3 = a3;
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)FSFileName;
    v4 = -[FSFileName init](&v8, sel_init);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v3, strlen(v3));
      v5 = objc_claimAutoreleasedReturnValue();
      data = v4->_data;
      v4->_data = (NSData *)v5;

    }
    self = v4;
    v3 = (const char *)self;
  }

  return (FSFileName *)v3;
}

+ (id)nameWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  return v5;
}

+ (id)nameWithCString:(const char *)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, strlen(a3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)nameWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v4);

  return v5;
}

+ (id)nameWithBytes:(const char *)a3 length:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBytes:length:", a3, a4);
}

- (NSString)string
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_data, 4);
}

- (NSData)data
{
  return self->_data;
}

- (NSString)debugDescription
{
  void *v3;
  __CFString *v4;

  -[FSFileName string](self, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FSFileName string](self, "string");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_250C33628;
  }
  return (NSString *)v4;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_data, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithData:", self->_data);
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
