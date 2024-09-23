@implementation COHomeKitAccessoryMemento

- (COHomeKitAccessoryMemento)initWithHomeKitAccessory:(id)a3
{
  id v4;
  COHomeKitAccessoryMemento *v5;
  uint64_t v6;
  NSUUID *uniqueIdentifier;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *categoryType;
  void *v12;
  uint64_t v13;
  NSUUID *homeUniqueIdentifier;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *IDSIdentifier;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)COHomeKitAccessoryMemento;
  v5 = -[COHomeKitAccessoryMemento init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "categoryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    categoryType = v5->_categoryType;
    v5->_categoryType = (NSString *)v10;

    objc_msgSend(v4, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    homeUniqueIdentifier = v5->_homeUniqueIdentifier;
    v5->_homeUniqueIdentifier = (NSUUID *)v13;

    objc_msgSend(v4, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "idsIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();
    IDSIdentifier = v5->_IDSIdentifier;
    v5->_IDSIdentifier = (NSString *)v17;

  }
  return v5;
}

- (COHomeKitAccessoryMemento)initWithCoder:(id)a3
{
  id v4;
  COHomeKitAccessoryMemento *v5;
  uint64_t v6;
  NSUUID *uniqueIdentifier;
  uint64_t v8;
  NSString *categoryType;
  uint64_t v10;
  NSUUID *homeUniqueIdentifier;
  uint64_t v12;
  NSString *IDSIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)COHomeKitAccessoryMemento;
  v5 = -[COHomeKitAccessoryMemento init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryType"));
    v8 = objc_claimAutoreleasedReturnValue();
    categoryType = v5->_categoryType;
    v5->_categoryType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeUniqueIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    homeUniqueIdentifier = v5->_homeUniqueIdentifier;
    v5->_homeUniqueIdentifier = (NSUUID *)v10;

    if (!v5->_uniqueIdentifier
      || !-[NSString length](v5->_categoryType, "length")
      || !v5->_homeUniqueIdentifier
      || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsIdentifier")),
          v12 = objc_claimAutoreleasedReturnValue(),
          IDSIdentifier = v5->_IDSIdentifier,
          v5->_IDSIdentifier = (NSString *)v12,
          IDSIdentifier,
          !v5->_IDSIdentifier)
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("idsIdentifier")))
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COHomeKitAccessoryMemento uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "UTF8String");
  -[COHomeKitAccessoryMemento IDSIdentifier](self, "IDSIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[COHomeKitAccessoryMemento IDSIdentifier](self, "IDSIdentifier");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, id = %.8s, ids = %.8s>"), v5, self, v8, objc_msgSend(v10, "UTF8String"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, id = %.8s, ids = %.8s>"), v5, self, v8, "nil");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[COHomeKitAccessoryMemento uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("uniqueIdentifier"));

  -[COHomeKitAccessoryMemento categoryType](self, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("categoryType"));

  -[COHomeKitAccessoryMemento homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("homeUniqueIdentifier"));

  -[COHomeKitAccessoryMemento IDSIdentifier](self, "IDSIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("idsIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COHomeKitAccessoryMemento uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  COHomeKitAccessoryMemento *v4;
  COHomeKitAccessoryMemento *v5;
  BOOL v6;

  v4 = (COHomeKitAccessoryMemento *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[COHomeKitAccessoryMemento isEqualToHomeKitAccessoryMemento:](self, "isEqualToHomeKitAccessoryMemento:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToHomeKitAccessoryMemento:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;

  v4 = a3;
  -[COHomeKitAccessoryMemento uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[COHomeKitAccessoryMemento homeUniqueIdentifier](self, "homeUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[COHomeKitAccessoryMemento categoryType](self, "categoryType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "categoryType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[COHomeKitAccessoryMemento IDSIdentifier](self, "IDSIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "IDSIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v12)
        {
          v14 = 1;
        }
        else
        {
          -[COHomeKitAccessoryMemento IDSIdentifier](self, "IDSIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "IDSIdentifier");
          v17 = v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v16, "isEqualToString:", v13);

          v11 = v17;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)categoryType
{
  return self->_categoryType;
}

- (NSUUID)homeUniqueIdentifier
{
  return self->_homeUniqueIdentifier;
}

- (NSString)IDSIdentifier
{
  return self->_IDSIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
