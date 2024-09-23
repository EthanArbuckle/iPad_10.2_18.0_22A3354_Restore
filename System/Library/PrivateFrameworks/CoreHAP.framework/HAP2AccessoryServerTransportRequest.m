@implementation HAP2AccessoryServerTransportRequest

- (HAP2AccessoryServerTransportRequest)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)initForReadingWithEndpoint:(id)a3 data:(id)a4 encrypted:(BOOL)a5 mimeType:(id)a6
{
  return -[HAP2AccessoryServerTransportRequest initWithEndpoint:data:encrypted:mimeType:forReading:]((id *)&self->super.super.isa, a3, a4, a5, a6, 1);
}

- (id)initForWritingWithEndpoint:(id)a3 data:(id)a4 encrypted:(BOOL)a5 mimeType:(id)a6
{
  return -[HAP2AccessoryServerTransportRequest initWithEndpoint:data:encrypted:mimeType:forReading:]((id *)&self->super.super.isa, a3, a4, a5, a6, 0);
}

- (BOOL)isForWriting
{
  return !-[HAP2AccessoryServerTransportRequest isForReading](self, "isForReading");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  unint64_t identifier;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self)
    identifier = self->_identifier;
  else
    identifier = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ id=%llu>"), v5, identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  unint64_t identifier;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self)
    identifier = self->_identifier;
  else
    identifier = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p id=%llu>"), v5, self, identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HAP2AccessoryServerTransportRequestEndpoint)endpoint
{
  return self->_endpoint;
}

- (BOOL)isForReading
{
  return self->_forReading;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (id)initWithEndpoint:(void *)a3 data:(char)a4 encrypted:(void *)a5 mimeType:(char)a6 forReading:
{
  id v12;
  id v13;
  id v14;
  id *v15;
  unint64_t v16;
  objc_super v18;

  v12 = a2;
  v13 = a3;
  v14 = a5;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)HAP2AccessoryServerTransportRequest;
    v15 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 2, a2);
      *((_BYTE *)a1 + 8) = a6;
      *((_BYTE *)a1 + 9) = a4;
      objc_storeStrong(a1 + 3, a5);
      objc_storeStrong(a1 + 4, a3);
      do
        v16 = __ldaxr(&initWithEndpoint_data_encrypted_mimeType_forReading__nextIdentifier);
      while (__stlxr(v16 + 1, &initWithEndpoint_data_encrypted_mimeType_forReading__nextIdentifier));
      a1[5] = (id)v16;
    }
  }

  return a1;
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
