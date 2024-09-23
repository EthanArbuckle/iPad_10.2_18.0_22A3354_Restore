@implementation CATAddress

- (NSString)address
{
  NSUInteger v4;
  NSData *data;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  const void *v10;
  uint64_t v11;
  NSString *address;
  int v13;
  id v14;
  id v15;
  NSString *v16;
  NSString *v17;
  void *v19;

  if (!self->_address)
  {
    v4 = -[NSData length](self->_data, "length");
    data = self->_data;
    if (v4 < 0x10)
    {
      if (-[NSData length](data, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATAddress.m"), 46, CFSTR("The provided data is not long enough to be a sockaddr."));

      }
      address = self->_address;
      self->_address = (NSString *)&stru_24C1C6B98;
      goto LABEL_13;
    }
    v6 = -[NSData bytes](data, "bytes");
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = *(unsigned __int8 *)(v6 + 1);
    if (v9 == 30)
    {
      v10 = (const void *)(v6 + 8);
      v11 = 47;
    }
    else
    {
      if (v9 != 2)
      {
        v10 = 0;
        goto LABEL_12;
      }
      v10 = (const void *)(v6 + 4);
      v11 = 17;
    }
    objc_msgSend(v7, "setLength:", v11);
LABEL_12:
    v13 = *(unsigned __int8 *)(v6 + 1);
    v14 = objc_retainAutorelease(v8);
    inet_ntop(v13, v10, (char *)objc_msgSend(v14, "mutableBytes"), objc_msgSend(v14, "length"));
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    address = (NSString *)objc_retainAutorelease(v14);
    v16 = (NSString *)objc_msgSend(v15, "initWithUTF8String:", -[NSString bytes](address, "bytes"));
    v17 = self->_address;
    self->_address = v16;

LABEL_13:
  }
  return self->_address;
}

- (BOOL)isAny
{
  void *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  BOOL result;

  -[CATAddress data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  result = v4 >= 0x10
        && (-[CATAddress data](self, "data"),
            v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
            v6 = objc_msgSend(v5, "bytes"),
            v5,
            *(_BYTE *)(v6 + 1) == 2)
        && *(_DWORD *)(v6 + 4) == 0;
  return result;
}

- (BOOL)isLocalWiFi
{
  void *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  BOOL result;

  -[CATAddress data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  result = v4 >= 0x10
        && (-[CATAddress data](self, "data"),
            v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
            v6 = objc_msgSend(v5, "bytes"),
            v5,
            *(_BYTE *)(v6 + 1) == 2)
        && *(_DWORD *)(v6 + 4) == 65193;
  return result;
}

+ (id)any
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __17__CATAddress_any__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (any_onceToken != -1)
    dispatch_once(&any_onceToken, block);
  return (id)any_any;
}

void __17__CATAddress_any__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[1] = 0;
  v5[0] = 528;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithData:", v2);
  v4 = (void *)any_any;
  any_any = v3;

}

+ (id)localWiFi
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__CATAddress_localWiFi__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localWiFi_onceToken != -1)
    dispatch_once(&localWiFi_onceToken, block);
  return (id)localWiFi_localWiFi;
}

void __23__CATAddress_localWiFi__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[1] = 0;
  v5[0] = 0xFEA900000210;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithData:", v2);
  v4 = (void *)localWiFi_localWiFi;
  localWiFi_localWiFi = v3;

}

- (CATAddress)initWithString:(id)a3
{
  CATAddress *v4;
  void *v5;
  addrinfo *v7;
  addrinfo v8;

  v7 = 0;
  memset(&v8, 0, sizeof(v8));
  v8.ai_flags = 4;
  if (getaddrinfo((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0, &v8, &v7))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7->ai_addr, v7->ai_addrlen);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    freeaddrinfo(v7);
    self = -[CATAddress initWithData:](self, "initWithData:", v5);

    v4 = self;
  }

  return v4;
}

- (CATAddress)initWithData:(id)a3
{
  id v5;
  CATAddress *v6;
  uint64_t v7;
  NSData *data;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (objc_msgSend(v5, "length") && (unint64_t)objc_msgSend(v5, "length") <= 0xF)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATAddress.m"), 146, CFSTR("The provided data is not long enough to be a sockaddr."));

  }
  v11.receiver = self;
  v11.super_class = (Class)CATAddress;
  v6 = -[CATAddress init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    data = v6->_data;
    v6->_data = (NSData *)v7;

  }
  return v6;
}

- (CATAddress)init
{
  return -[CATAddress initWithData:](self, "initWithData:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;
  objc_super v12;

  if (-[CATAddress isAny](self, "isAny"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v12.receiver = self;
    v12.super_class = (Class)CATAddress;
    -[CATAddress description](&v12, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATAddress address](self, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ address: ANY %@"), v4, v5);
  }
  else
  {
    v6 = -[CATAddress isLocalWiFi](self, "isLocalWiFi");
    v7 = (void *)MEMORY[0x24BDD17C8];
    if (v6)
    {
      v11.receiver = self;
      v11.super_class = (Class)CATAddress;
      -[CATAddress description](&v11, sel_description);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATAddress address](self, "address");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ address: LOCAL WIFI %@"), v4, v5);
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)CATAddress;
      -[CATAddress description](&v10, sel_description);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATAddress address](self, "address");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ address: %@"), v4, v5);
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CATAddress data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToAddress:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  -[CATAddress data](self, "data");
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
  CATAddress *v4;
  BOOL v5;

  v4 = (CATAddress *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CATAddress isEqualToAddress:](self, "isEqualToAddress:", v4);
  }

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
