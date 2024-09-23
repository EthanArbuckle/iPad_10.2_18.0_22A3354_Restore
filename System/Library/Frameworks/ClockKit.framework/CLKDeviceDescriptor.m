@implementation CLKDeviceDescriptor

- (CLKDeviceDescriptor)initWithNRDeviceUUID:(id)a3
{
  id v5;
  CLKDeviceDescriptor *v6;
  CLKDeviceDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKDeviceDescriptor;
  v6 = -[CLKDeviceDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_nrDeviceUUID, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrDeviceUUID, 0);
}

- (CLKDeviceDescriptor)initWithNRDevice:(id)a3
{
  void *v4;
  CLKDeviceDescriptor *v5;

  objc_msgSend(a3, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CLKDeviceDescriptor initWithNRDeviceUUID:](self, "initWithNRDeviceUUID:", v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSUUID *nrDeviceUUID;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  nrDeviceUUID = self->_nrDeviceUUID;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __31__CLKDeviceDescriptor_isEqual___block_invoke;
  v10[3] = &unk_24CBF9EE8;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", nrDeviceUUID, v10);
  LOBYTE(nrDeviceUUID) = objc_msgSend(v5, "isEqual");

  return (char)nrDeviceUUID;
}

id __31__CLKDeviceDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_nrDeviceUUID, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_nrDeviceUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("nrDeviceUUID"));

  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_nrDeviceUUID, CFSTR("nrDeviceUUID"));
}

- (CLKDeviceDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CLKDeviceDescriptor *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nrDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CLKDeviceDescriptor initWithNRDeviceUUID:](self, "initWithNRDeviceUUID:", v5);
  return v6;
}

- (NSUUID)nrDeviceUUID
{
  return self->_nrDeviceUUID;
}

@end
