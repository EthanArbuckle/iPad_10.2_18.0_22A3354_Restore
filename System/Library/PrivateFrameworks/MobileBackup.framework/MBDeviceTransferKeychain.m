@implementation MBDeviceTransferKeychain

- (MBDeviceTransferKeychain)init
{
  MBDeviceTransferKeychain *v2;
  uint64_t v3;
  NSString *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBDeviceTransferKeychain;
  v2 = -[MBDeviceTransferKeychain init](&v6, sel_init);
  if (v2)
  {
    MBRandomUUID();
    v3 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v3;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBDeviceTransferKeychain)initWithCoder:(id)a3
{
  id v4;
  MBDeviceTransferKeychain *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MBDeviceTransferKeychain;
  v5 = -[MBDeviceTransferKeychain init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceTransferKeychain setUuid:](v5, "setUuid:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MBDeviceTransferKeychain uuid](self, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MBDeviceTransferKeychain uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUuid:", v6);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  const char *Name;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  -[MBDeviceTransferKeychain uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s: %p; uuid=%@>"), Name, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
