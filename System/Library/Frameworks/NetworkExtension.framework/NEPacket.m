@implementation NEPacket

- (void)dealloc
{
  const char *v3;
  os_unfair_lock_s *Property;
  SEL v5;
  objc_super v6;

  if (self && objc_getProperty(self, a2, 48, 1))
  {
    Property = (os_unfair_lock_s *)objc_getProperty(self, v3, 48, 1);
    -[NEFilterPacketInterpose freePacket:](Property, self);
    objc_setProperty_atomic(self, v5, 0, 48);
  }
  v6.receiver = self;
  v6.super_class = (Class)NEPacket;
  -[NEPacket dealloc](&v6, sel_dealloc);
}

- (NEPacket)initWithData:(NSData *)data protocolFamily:(sa_family_t)protocolFamily
{
  return (NEPacket *)-[NEPacket initWithData:protocolFamily:metadata:]((id *)&self->super.isa, data, protocolFamily, 0);
}

- (NEPacket)initWithCoder:(id)a3
{
  id v4;
  NEPacket *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NEFlowMetaData *metadata;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEPacket;
  v5 = -[NEPacket init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_protocolFamily = objc_msgSend(v4, "decodeIntForKey:", CFSTR("protocolFamily"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v8 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NEFlowMetaData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NEPacket data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEPacket protocolFamily](self, "protocolFamily") != 0, CFSTR("protocolFamily"));
  -[NEPacket metadata](self, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("metadata"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEPacket *v4;
  void *v5;
  char v6;
  void *v7;
  id *v8;

  v4 = +[NEPacket allocWithZone:](NEPacket, "allocWithZone:", a3);
  -[NEPacket data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NEPacket protocolFamily](self, "protocolFamily");
  -[NEPacket metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NEPacket initWithData:protocolFamily:metadata:]((id *)&v4->super.isa, v5, v6, v7);

  return v8;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (sa_family_t)protocolFamily
{
  return self->_protocolFamily;
}

- (NETrafficDirection)direction
{
  return self->_direction;
}

- (NEFlowMetaData)metadata
{
  return (NEFlowMetaData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpose, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id)initWithData:(char)a3 protocolFamily:(void *)a4 metadata:
{
  id v8;
  id v9;
  id *v10;
  objc_super v12;

  v8 = a2;
  v9 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)NEPacket;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      *((_BYTE *)a1 + 8) = a3;
      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
