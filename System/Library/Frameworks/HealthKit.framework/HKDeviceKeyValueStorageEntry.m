@implementation HKDeviceKeyValueStorageEntry

- (HKDeviceKeyValueStorageEntry)initWithDomain:(id)a3 key:(id)a4 value:(id)a5 modificationDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKDeviceKeyValueStorageEntry *v15;
  HKDeviceKeyValueStorageEntry *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKDeviceKeyValueStorageEntry;
  v15 = -[HKDeviceKeyValueStorageEntry init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_domain, a3);
    objc_storeStrong((id *)&v16->_key, a4);
    objc_storeStrong((id *)&v16->_value, a5);
    objc_storeStrong((id *)&v16->_modificationDate, a6);
  }

  return v16;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p domain:%@ key:%@ value:%@ modification date:%@"), objc_opt_class(), self, self->_domain, self->_key, self->_value, self->_modificationDate);
}

- (id)dateValue:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), self->_value, a3);
}

- (id)numberValue:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), self->_value, a3);
}

- (id)stringValue:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), self->_value, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKDeviceKeyValueStorageEntry initWithDomain:key:value:modificationDate:](+[HKDeviceKeyValueStorageEntry allocWithZone:](HKDeviceKeyValueStorageEntry, "allocWithZone:", a3), "initWithDomain:key:value:modificationDate:", self->_domain, self->_key, self->_value, self->_modificationDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("Key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domain, CFSTR("Domain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("Value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("ModificationDate"));

}

- (HKDeviceKeyValueStorageEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  HKDeviceKeyValueStorageEntry *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModificationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0 || v8 == 0)
  {
    v12 = 0;
  }
  else
  {
    self = -[HKDeviceKeyValueStorageEntry initWithDomain:key:value:modificationDate:](self, "initWithDomain:key:value:modificationDate:", v6, v5, v7, v8);
    v12 = self;
  }

  return v12;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)key
{
  return self->_key;
}

- (NSData)value
{
  return self->_value;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
