@implementation FSEntityIdentifier

- (FSEntityIdentifier)initWithUUID:(id)a3
{
  id v5;
  FSEntityIdentifier *v6;
  FSEntityIdentifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FSEntityIdentifier;
  v6 = -[FSEntityIdentifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uuid, a3);

  return v7;
}

- (FSEntityIdentifier)init
{
  void *v3;
  FSEntityIdentifier *v4;

  +[FSEntityIdentifier defaultInstanceUUID](FSEntityIdentifier, "defaultInstanceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FSEntityIdentifier initWithUUID:](self, "initWithUUID:", v3);

  return v4;
}

- (FSEntityIdentifier)initWithCopiedUUID:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  FSEntityIdentifier *v9;
  id *p_isa;
  FSEntityIdentifier *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "length") == 4 || objc_msgSend(v8, "length") == 8)
  {
    v13.receiver = self;
    v13.super_class = (Class)FSEntityIdentifier;
    v9 = -[FSEntityIdentifier init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_uuid, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (FSEntityIdentifier)initWithUUID:(id)a3 data:(id)a4
{
  id v6;
  void *v7;
  FSEntityIdentifier *v8;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v8 = -[FSEntityIdentifier initWithCopiedUUID:data:](self, "initWithCopiedUUID:data:", v6, v7);

  return v8;
}

- (FSEntityIdentifier)initWithUUID:(id)a3 byteQualifier:(const char *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  FSEntityIdentifier *v9;

  v6 = (objc_class *)MEMORY[0x24BDBCE50];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBytes:length:", a4, 4);
  v9 = -[FSEntityIdentifier initWithCopiedUUID:data:](self, "initWithCopiedUUID:data:", v7, v8);

  return v9;
}

- (FSEntityIdentifier)initWithUUID:(id)a3 longByteQualifier:(const char *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  FSEntityIdentifier *v10;

  v6 = (objc_class *)MEMORY[0x24BDBCE50];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBytes:length:", a4, 8);
  v9 = (void *)objc_msgSend(v7, "copy");

  v10 = -[FSEntityIdentifier initWithUUID:data:](self, "initWithUUID:data:", v9, v8);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSUUID *uuid;
  NSData *qualifier;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  uuid = self->_uuid;
  qualifier = self->_qualifier;
  v8 = v5;
  v9 = (void *)-[NSUUID copyWithZone:](uuid, "copyWithZone:", a3);
  if (qualifier)
  {
    v10 = -[NSData copyWithZone:](self->_qualifier, "copyWithZone:", a3);
    v11 = (void *)objc_msgSend(v8, "initWithCopiedUUID:data:", v9, v10);

    v8 = (id)v10;
  }
  else
  {
    v11 = (void *)objc_msgSend(v8, "initWithUUID:", v9);
  }

  return v11;
}

+ (id)identifier
{
  return objc_alloc_init((Class)a1);
}

+ (id)identifierWithUUID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:", v4);

  return v5;
}

+ (id)identifierWithUUID:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:data:", v7, v6);

  return v8;
}

+ (id)identifierWithUUID:(id)a3 byteQualifier:(const char *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:byteQualifier:", v6, a4);

  return v7;
}

+ (id)identifierWithUUID:(id)a3 longByteQualifier:(const char *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:longByteQualifier:", v6, a4);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSData *qualifier;
  char v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    qualifier = self->_qualifier;
    if (!qualifier || v5[2] && -[NSData isEqual:](qualifier, "isEqual:"))
      v7 = -[NSUUID isEqual:](self->_uuid, "isEqual:", v5[1]);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSData *qualifier;
  uint64_t v4;

  qualifier = self->_qualifier;
  if (qualifier)
    v4 = 997 * -[NSData hash](qualifier, "hash");
  else
    v4 = 0;
  return -[NSUUID hash](self->_uuid, "hash") + v4;
}

- (id)description
{
  NSData *qualifier;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  qualifier = self->_qualifier;
  if (qualifier)
  {
    v4 = 2 * -[NSData length](qualifier, "length");
    -[NSData debugDescription](self->_qualifier, "debugDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringWithRange:", 1, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDD17C8];
    -[NSUUID description](self->_uuid, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSUUID description](self->_uuid, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *qualifier;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("FSEntityID.uuid"));
  qualifier = self->_qualifier;
  if (qualifier)
    objc_msgSend(v5, "encodeObject:forKey:", qualifier, CFSTR("FSEntityID.qual"));

}

- (FSEntityIdentifier)initWithCoder:(id)a3
{
  id v4;
  FSEntityIdentifier *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSData *qualifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSEntityIdentifier;
  v5 = -[FSEntityIdentifier init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSEntityID.uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSEntityID.qual"));
    v8 = objc_claimAutoreleasedReturnValue();
    qualifier = v5->_qualifier;
    v5->_qualifier = (NSData *)v8;

  }
  return v5;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)qualifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQualifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (FSEntityIdentifier)initWithBytes:(const char *)a3 length:(int)a4
{
  void *v5;
  FSEntityIdentifier *v6;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a4 == 16)
  {
    v8 = *(_OWORD *)a3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v8);
    self = -[FSEntityIdentifier initWithUUID:](self, "initWithUUID:", v5, v8);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSData)uuidData
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0;
  v3[1] = 0;
  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", v3);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v3, 16);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultInstanceUUID
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &defaultUUIDBytes);
}

@end
