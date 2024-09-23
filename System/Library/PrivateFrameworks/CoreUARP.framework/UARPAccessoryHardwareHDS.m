@implementation UARPAccessoryHardwareHDS

- (UARPAccessoryHardwareHDS)init
{
  -[UARPAccessoryHardwareHDS doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPAccessoryHardwareHDS)initWithUUID:(id)a3
{
  id v5;
  UARPAccessoryHardwareHDS *v6;
  UARPAccessoryHardwareHDS *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPAccessoryHardwareHDS;
  v6 = -[UARPAccessoryHardwareID initWithTransport:](&v9, sel_initWithTransport_, 7);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uuid, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  UARPAccessoryHardwareHDS *v4;
  NSUUID *uuid;
  UARPAccessoryHardwareHDS *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int64_t v11;
  uint64_t v12;
  BOOL v13;

  v4 = (UARPAccessoryHardwareHDS *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v13 = 1;
    }
    else
    {
      uuid = self->_uuid;
      v6 = v4;
      -[NSUUID UUIDString](uuid, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPAccessoryHardwareHDS uuid](v6, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v7, "isEqualToString:", v9);
      v11 = -[UARPAccessoryHardwareID transport](self, "transport");
      v12 = -[UARPAccessoryHardwareID transport](v6, "transport");

      if (v11 == v12)
        v13 = v10;
      else
        v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HDS, UUID = %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
