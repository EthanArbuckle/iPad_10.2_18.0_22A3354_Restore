@implementation DAPartialIP

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAPartialIP)initWithAddress:(id)a3 mask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  DAPartialIP *v9;
  NSData *v10;
  NSData *address;
  NSData *v12;
  NSData *mask;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)DAPartialIP;
    self = -[DAPartialIP init](&v15, sel_init);
    if (self
      && (unint64_t)objc_msgSend(v6, "length") <= 0x10
      && (unint64_t)objc_msgSend(v8, "length") <= 0x10)
    {
      v10 = (NSData *)objc_msgSend(v6, "copy");
      address = self->_address;
      self->_address = v10;

      v12 = (NSData *)objc_msgSend(v8, "copy");
      mask = self->_mask;
      self->_mask = v12;

      self = self;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (DAPartialIP)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DAPartialIP *v7;
  DAPartialIP *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DAPartialIP;
  v7 = -[DAPartialIP init](&v17, sel_init);
  if (!v7)
  {
    if (a4)
    {
      v10 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ super init failed", v11, v12, v13, v14, v15, v16, v10);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_5;
  }
  if (!CUXPCDecodeNSData() || !CUXPCDecodeNSData())
    goto LABEL_8;
  v8 = v7;
LABEL_5:

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  NSData *address;
  NSData *v5;
  uint64_t v6;
  const char *v7;
  size_t v8;
  NSData *mask;
  NSData *v10;
  id v11;
  NSData *v12;
  uint64_t v13;
  const char *v14;
  size_t v15;
  xpc_object_t xdict;

  xdict = a3;
  address = self->_address;
  if (address)
  {
    v5 = objc_retainAutorelease(address);
    v6 = -[NSData bytes](v5, "bytes");
    if (v6)
      v7 = (const char *)v6;
    else
      v7 = "";
    v8 = -[NSData length](v5, "length");

    xpc_dictionary_set_data(xdict, "ipAd", v7, v8);
  }
  mask = self->_mask;
  if (mask)
  {
    v10 = objc_retainAutorelease(mask);
    v11 = xdict;
    v12 = v10;
    v13 = -[NSData bytes](v12, "bytes");
    if (v13)
      v14 = (const char *)v13;
    else
      v14 = "";
    v15 = -[NSData length](v12, "length");

    xpc_dictionary_set_data(v11, "ipMa", v14, v15);
  }

}

- (void)encodeWithCoder:(id)a3
{
  NSData *address;
  id v5;

  address = self->_address;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", address, CFSTR("address"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mask, CFSTR("mask"));

}

- (DAPartialIP)initWithCoder:(id)a3
{
  id v4;
  DAPartialIP *v5;
  NSData *v6;
  NSData *v7;
  NSData *v8;
  NSData *address;
  NSData *v10;
  NSData *mask;
  DAPartialIP *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DAPartialIP;
  v5 = -[DAPartialIP init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("address"));
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("mask"));
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v6 || !v7)
    {

      v12 = 0;
      goto LABEL_6;
    }
    address = v5->_address;
    v5->_address = v6;
    v10 = v6;

    mask = v5->_mask;
    v5->_mask = v8;

  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  DAPartialIP *v4;
  DAPartialIP *v5;
  NSData *address;
  void *v7;
  NSData *mask;
  void *v9;
  BOOL v10;

  v4 = (DAPartialIP *)a3;
  if (self == v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  v5 = v4;
  address = self->_address;
  -[DAPartialIP address](v5, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSData isEqualToData:](address, "isEqualToData:", v7))
  {

    goto LABEL_7;
  }
  mask = self->_mask;
  -[DAPartialIP mask](v5, "mask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mask) = -[NSData isEqualToData:](mask, "isEqualToData:", v9);

  if ((mask & 1) == 0)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
LABEL_5:
  v10 = 1;
LABEL_8:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NSData description](self->_address, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData description](self->_mask, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("addr: %@, mask: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)address
{
  return self->_address;
}

- (NSData)mask
{
  return self->_mask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
