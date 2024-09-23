@implementation CATEndPoint

- (CATEndPoint)init
{
  void *v3;
  CATEndPoint *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CATEndPoint initWithData:](self, "initWithData:", v3);

  return v4;
}

- (CATEndPoint)initWithData:(id)a3
{
  id v5;
  CATEndPoint *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  NSData *data;
  CATAddress *v12;
  void *v13;
  uint64_t v14;
  CATAddress *address;
  void *v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CATEndPoint;
  v6 = -[CATEndPoint init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") && (unint64_t)objc_msgSend(v7, "length") <= 0xF)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("CATEndPoint.m"), 35, CFSTR("The provided data is not long enough to be a sockaddr."));

    }
    if (objc_msgSend(v7, "length"))
    {
      v8 = objc_msgSend(objc_retainAutorelease(v7), "mutableBytes");
      v9 = *(unsigned __int8 *)(v8 + 1);
      if (v9 == 30 || v9 == 2)
      {
        v6->_port = bswap32(*(unsigned __int16 *)(v8 + 2)) >> 16;
        *(_WORD *)(v8 + 2) = 0;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    data = v6->_data;
    v6->_data = (NSData *)v10;

    v12 = [CATAddress alloc];
    v13 = (void *)objc_msgSend(v7, "copy");
    v14 = -[CATAddress initWithData:](v12, "initWithData:", v13);
    address = v6->_address;
    v6->_address = (CATAddress *)v14;

  }
  return v6;
}

- (CATEndPoint)initWithAddress:(id)a3 port:(unsigned int)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  CATEndPoint *v11;
  void *v13;

  objc_msgSend(a3, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (objc_msgSend(v8, "length") && (unint64_t)objc_msgSend(v8, "length") <= 0xF)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATEndPoint.m"), 60, CFSTR("The provided data is not long enough to be a sockaddr."));

  }
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
    v10 = *(unsigned __int8 *)(v9 + 1);
    if (v10 == 30 || v10 == 2)
      *(_WORD *)(v9 + 2) = bswap32(a4) >> 16;
  }
  v11 = -[CATEndPoint initWithData:](self, "initWithData:", v8);

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)CATEndPoint;
  -[CATEndPoint description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATEndPoint address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ address: %@ port: %d"), v4, v6, -[CATEndPoint port](self, "port"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CATEndPoint data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToEndPoint:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  -[CATEndPoint data](self, "data");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v5 | v6)
    v7 = objc_msgSend((id)v5, "isEqual:", v6);
  else
    v7 = 1;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CATEndPoint *v4;
  BOOL v5;

  v4 = (CATEndPoint *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CATEndPoint isEqualToEndPoint:](self, "isEqualToEndPoint:", v4);
  }

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (CATAddress)address
{
  return self->_address;
}

- (unsigned)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
