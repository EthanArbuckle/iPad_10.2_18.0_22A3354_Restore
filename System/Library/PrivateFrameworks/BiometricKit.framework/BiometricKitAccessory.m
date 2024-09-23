@implementation BiometricKitAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BiometricKitAccessory)initWithCoder:(id)a3
{
  id v4;
  BiometricKitAccessory *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSUUID *uuid;
  void *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  BiometricKitAccessoryGroup *group;
  uint64_t v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BiometricKitAccessory;
  v5 = -[BiometricKitAccessory init](&v17, sel_init);
  if (v5)
  {
    v16 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("BKAccessoryUUID"), &v16);
    if (v16 == 16)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v7);
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v8;

    }
    v5->_type = objc_msgSend(v6, "decodeInt32ForKey:", CFSTR("BKAccessoryType"));
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BKAccessoryName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v11;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BKAccessoryGroup"));
    v13 = objc_claimAutoreleasedReturnValue();
    group = v5->_group;
    v5->_group = (BiometricKitAccessoryGroup *)v13;

    v5->_flags = objc_msgSend(v6, "decodeInt32ForKey:", CFSTR("BKAccessoryFlags"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  uuid = self->_uuid;
  v5 = a3;
  -[NSUUID getUUIDBytes:](uuid, "getUUIDBytes:", v6);
  objc_msgSend(v5, "encodeInt32:forKey:", self->_type, CFSTR("BKAccessoryType"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", v6, 16, CFSTR("BKAccessoryUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("BKAccessoryName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_group, CFSTR("BKAccessoryGroup"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_flags, CFSTR("BKAccessoryFlags"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  BiometricKitAccessory *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(BiometricKitAccessory);
  -[BiometricKitAccessory uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[BiometricKitAccessory setUuid:](v4, "setUuid:", v6);

  -[BiometricKitAccessory setType:](v4, "setType:", -[BiometricKitAccessory type](self, "type"));
  -[BiometricKitAccessory name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitAccessory setName:](v4, "setName:", v7);

  -[BiometricKitAccessory group](self, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[BiometricKitAccessory setGroup:](v4, "setGroup:", v9);

  -[BiometricKitAccessory setFlags:](v4, "setFlags:", -[BiometricKitAccessory flags](self, "flags"));
  return v4;
}

- (BOOL)isEqualToAccessory:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_type == *((_DWORD *)v4 + 2))
    v6 = -[NSUUID isEqual:](self->_uuid, "isEqual:", *((_QWORD *)v4 + 2));
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BiometricKitAccessory *v4;
  BOOL v5;

  v4 = (BiometricKitAccessory *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BiometricKitAccessory isEqualToAccessory:](self, "isEqualToAccessory:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t type;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  getUUIDString(self->_uuid);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p:(type:%u, uuid:%@, flags:0x%x, group:%@)>"), v5, self, type, v7, self->_flags, self->_group);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BiometricKitAccessoryGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
