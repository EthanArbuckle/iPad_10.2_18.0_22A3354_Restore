@implementation DMFProvisioningProfile

- (DMFProvisioningProfile)initWithUUID:(id)a3 name:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  DMFProvisioningProfile *v11;
  uint64_t v12;
  NSString *UUID;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSDate *expirationDate;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DMFProvisioningProfile;
  v11 = -[DMFProvisioningProfile init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    UUID = v11->_UUID;
    v11->_UUID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    expirationDate = v11->_expirationDate;
    v11->_expirationDate = (NSDate *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[DMFProvisioningProfile UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProvisioningProfile name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProvisioningProfile expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithUUID:name:expirationDate:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFProvisioningProfile)initWithCoder:(id)a3
{
  id v4;
  DMFProvisioningProfile *v5;
  void *v6;
  uint64_t v7;
  NSString *UUID;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSDate *expirationDate;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFProvisioningProfile;
  v5 = -[DMFProvisioningProfile init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("UUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("expirationDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DMFProvisioningProfile UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UUID"));

  -[DMFProvisioningProfile name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[DMFProvisioningProfile expirationDate](self, "expirationDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("expirationDate"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[DMFProvisioningProfile UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DMFProvisioningProfile name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DMFProvisioningProfile expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  DMFProvisioningProfile *v4;
  DMFProvisioningProfile *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v4 = (DMFProvisioningProfile *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DMFProvisioningProfile UUID](self, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFProvisioningProfile UUID](v5, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
      {
        v18 = 0;
      }
      else
      {
        -[DMFProvisioningProfile name](self, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMFProvisioningProfile name](v5, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        v14 = v12;
        if (v13 | v14
          && (v15 = objc_msgSend((id)v13, "isEqual:", v14), (id)v14, (id)v13, !v15))
        {
          v18 = 0;
        }
        else
        {
          -[DMFProvisioningProfile expirationDate](self, "expirationDate");
          v16 = objc_claimAutoreleasedReturnValue();
          -[DMFProvisioningProfile expirationDate](v5, "expirationDate");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v16 | v17)
            v18 = objc_msgSend((id)v16, "isEqual:", v17);
          else
            v18 = 1;

        }
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProvisioningProfile name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[DMFProvisioningProfile name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\tName            : “%@”\n"), v6);

  }
  -[DMFProvisioningProfile UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[DMFProvisioningProfile UUID](self, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\tUUID            : %@\n"), v9);

  }
  -[DMFProvisioningProfile expirationDate](self, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DMFProvisioningProfile expirationDate](self, "expirationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\tExpiration Date : %@\n"), v11);

  }
  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
