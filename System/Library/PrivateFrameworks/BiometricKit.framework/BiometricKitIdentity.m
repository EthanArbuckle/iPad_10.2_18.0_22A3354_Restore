@implementation BiometricKitIdentity

+ (id)biometricKitIdentity
{
  return objc_alloc_init(BiometricKitIdentity);
}

- (BiometricKitIdentity)init
{
  BiometricKitIdentity *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BiometricKitIdentity;
  result = -[BiometricKitIdentity init](&v3, sel_init);
  if (result)
    result->_userID = -1;
  return result;
}

- (BiometricKitIdentity)initWithCoder:(id)a3
{
  id v4;
  BiometricKitIdentity *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSUUID *uuid;
  int v10;
  void *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSDate *creationTime;
  void *v16;
  uint64_t v17;
  BiometricKitAccessory *accessory;
  uint64_t v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BiometricKitIdentity;
  v5 = -[BiometricKitIdentity init](&v21, sel_init);
  if (v5)
  {
    v20 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("BKIdentityUUID"), &v20);
    if (v20 == 16)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v7);
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v8;

    }
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("BKIdentityUserID")))
      v10 = objc_msgSend(v6, "decodeInt32ForKey:", CFSTR("BKIdentityUserID"));
    else
      v10 = 501;
    v5->_userID = v10;
    v5->_type = objc_msgSend(v6, "decodeIntForKey:", CFSTR("BKIdentityType"));
    v5->_attribute = objc_msgSend(v6, "decodeIntForKey:", CFSTR("BKIdentityAttribute"));
    v5->_entity = objc_msgSend(v6, "decodeIntForKey:", CFSTR("BKIdentityEntityNumber"));
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BKIdentityName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v12;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BKIdentityCreationTime"));
    v14 = objc_claimAutoreleasedReturnValue();
    creationTime = v5->_creationTime;
    v5->_creationTime = (NSDate *)v14;

    v5->_matchCount = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("BKIdentityMatchCount"));
    v5->_matchCountContinuous = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("BKIdentityMatchCountContinuous"));
    v5->_updateCount = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("BKIdentityUpdateCount"));
    v5->_flags = objc_msgSend(v6, "decodeInt32ForKey:", CFSTR("BKIdentityFlags"));
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BKIdentityAccessory"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    accessory = v5->_accessory;
    v5->_accessory = (BiometricKitAccessory *)v17;

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
  objc_msgSend(v5, "encodeInt32:forKey:", self->_userID, CFSTR("BKIdentityUserID"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", v6, 16, CFSTR("BKIdentityUUID"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_type, CFSTR("BKIdentityType"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_attribute, CFSTR("BKIdentityAttribute"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_entity, CFSTR("BKIdentityEntityNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("BKIdentityName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationTime, CFSTR("BKIdentityCreationTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_matchCount, CFSTR("BKIdentityMatchCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_matchCountContinuous, CFSTR("BKIdentityMatchCountContinuous"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_updateCount, CFSTR("BKIdentityUpdateCount"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_flags, CFSTR("BKIdentityFlags"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessory, CFSTR("BKIdentityAccessory"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BiometricKitIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(BiometricKitIdentity);
  -[BiometricKitIdentity uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[BiometricKitIdentity setUuid:](v4, "setUuid:", v6);

  -[BiometricKitIdentity setUserID:](v4, "setUserID:", -[BiometricKitIdentity userID](self, "userID"));
  -[BiometricKitIdentity setType:](v4, "setType:", -[BiometricKitIdentity type](self, "type"));
  -[BiometricKitIdentity setAttribute:](v4, "setAttribute:", -[BiometricKitIdentity attribute](self, "attribute"));
  -[BiometricKitIdentity setEntity:](v4, "setEntity:", -[BiometricKitIdentity entity](self, "entity"));
  -[BiometricKitIdentity name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitIdentity setName:](v4, "setName:", v7);

  -[BiometricKitIdentity creationTime](self, "creationTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[BiometricKitIdentity setCreationTime:](v4, "setCreationTime:", v9);

  -[BiometricKitIdentity setMatchCount:](v4, "setMatchCount:", -[BiometricKitIdentity matchCount](self, "matchCount"));
  -[BiometricKitIdentity setMatchCountContinuous:](v4, "setMatchCountContinuous:", -[BiometricKitIdentity matchCountContinuous](self, "matchCountContinuous"));
  -[BiometricKitIdentity setUpdateCount:](v4, "setUpdateCount:", -[BiometricKitIdentity updateCount](self, "updateCount"));
  -[BiometricKitIdentity setFlags:](v4, "setFlags:", -[BiometricKitIdentity flags](self, "flags"));
  -[BiometricKitIdentity accessory](self, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[BiometricKitIdentity setAccessory:](v4, "setAccessory:", v11);

  return v4;
}

- (BOOL)isEqualToIdentity:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_type == *((_DWORD *)v4 + 3) && self->_userID == *((_DWORD *)v4 + 2))
    v6 = -[NSUUID isEqual:](self->_uuid, "isEqual:", *((_QWORD *)v4 + 4));
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BiometricKitIdentity *v4;
  BOOL v5;

  v4 = (BiometricKitIdentity *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BiometricKitIdentity isEqualToIdentity:](self, "isEqualToIdentity:", v4);
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
  uint64_t userID;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  userID = self->_userID;
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p:(userID:%u, uuid:%@, accessory:%@, flags:0x%x)>"), v5, self, userID, v7, self->_accessory, self->_flags);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unsigned)userID
{
  return self->_userID;
}

- (void)setUserID:(unsigned int)a3
{
  self->_userID = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(int)a3
{
  self->_attribute = a3;
}

- (int)entity
{
  return self->_entity;
}

- (void)setEntity:(int)a3
{
  self->_entity = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(id)a3
{
  objc_storeStrong((id *)&self->_creationTime, a3);
}

- (int64_t)matchCount
{
  return self->_matchCount;
}

- (void)setMatchCount:(int64_t)a3
{
  self->_matchCount = a3;
}

- (int64_t)matchCountContinuous
{
  return self->_matchCountContinuous;
}

- (void)setMatchCountContinuous:(int64_t)a3
{
  self->_matchCountContinuous = a3;
}

- (int64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(int64_t)a3
{
  self->_updateCount = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (BiometricKitAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_creationTime, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
