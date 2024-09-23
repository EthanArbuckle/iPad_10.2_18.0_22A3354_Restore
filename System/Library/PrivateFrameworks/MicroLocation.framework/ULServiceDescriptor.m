@implementation ULServiceDescriptor

- (ULServiceDescriptor)initWithServiceIdentifier:(id)a3 serviceType:(unint64_t)a4 locationTypes:(id)a5
{
  id v9;
  id v10;
  ULServiceDescriptor *v11;
  ULServiceDescriptor *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ULServiceDescriptor;
  v11 = -[ULServiceDescriptor init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceIdentifier, a3);
    v12->_serviceType = a4;
    objc_storeStrong((id *)&v12->_locationTypes, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  unint64_t serviceType;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = (void *)-[NSUUID copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  serviceType = self->_serviceType;
  v8 = (void *)-[NSArray copyWithZone:](self->_locationTypes, "copyWithZone:", a3);
  v9 = (void *)objc_msgSend(v5, "initWithServiceIdentifier:serviceType:locationTypes:", v6, serviceType, v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ULServiceDescriptor)initWithCoder:(id)a3
{
  id v4;
  ULServiceDescriptor *v5;
  ULServiceDescriptor *v6;
  uint64_t v7;
  NSUUID *serviceIdentifier;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *locationTypes;
  ULServiceDescriptor *v14;
  unint64_t v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ULServiceDescriptor;
  v5 = -[ULServiceDescriptor init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceIdentifier"));
    v6 = (ULServiceDescriptor *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_self();
      v7 = objc_claimAutoreleasedReturnValue();

      serviceIdentifier = v5->_serviceIdentifier;
      v5->_serviceIdentifier = (NSUUID *)v7;

      v9 = (void *)MEMORY[0x24BDBCF20];
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("locationTypes"));
      v6 = (ULServiceDescriptor *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_opt_self();
        v12 = objc_claimAutoreleasedReturnValue();

        locationTypes = v5->_locationTypes;
        v5->_locationTypes = (NSArray *)v12;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceType"));
        v14 = (ULServiceDescriptor *)objc_claimAutoreleasedReturnValue();
        v6 = v14;
        if (v14)
        {
          v15 = -[ULServiceDescriptor unsignedIntValue](v14, "unsignedIntValue");

          v5->_serviceType = v15;
          v6 = v5;
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *locationTypes;
  id v5;
  id v6;

  locationTypes = self->_locationTypes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locationTypes, CFSTR("locationTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceIdentifier, CFSTR("serviceIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_serviceType);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("serviceType"));

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t serviceType;
  const __CFString *v8;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  serviceType = self->_serviceType;
  if (serviceType > 4)
    v8 = CFSTR("Unknown");
  else
    v8 = *(&off_2511CCEA8 + serviceType);
  objc_msgSend(v6, "appendFormat:", CFSTR(", serviceType: %@"), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR(", serviceIdentifier: %@"), self->_serviceIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", locationTypes: %@"), self->_locationTypes);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ULServiceDescriptor serviceType](self, "serviceType");
    if (v6 == objc_msgSend(v5, "serviceType"))
    {
      -[ULServiceDescriptor locationTypes](self, "locationTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locationTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {

        goto LABEL_8;
      }
      -[ULServiceDescriptor locationTypes](self, "locationTypes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locationTypes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v11)
      {
LABEL_8:
        -[ULServiceDescriptor serviceIdentifier](self, "serviceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serviceIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v13))
        {

          v9 = 1;
        }
        else
        {
          -[ULServiceDescriptor serviceIdentifier](self, "serviceIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v14 != v15;

          v9 = !v16;
        }
        goto LABEL_11;
      }
    }
    v9 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9 & 1;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSUUID hash](self->_serviceIdentifier, "hash");
  return v3 ^ -[NSArray hash](self->_locationTypes, "hash") ^ self->_serviceType ^ 0x1F;
}

- (ULServiceDescriptor)init
{
  __assert_rtn("-[ULServiceDescriptor init]", "ULConnectionTypes.m", 197, "NO");
}

+ (id)new
{
  __assert_rtn("+[ULServiceDescriptor new]", "ULConnectionTypes.m", 202, "NO");
}

- (NSUUID)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (NSArray)locationTypes
{
  return self->_locationTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationTypes, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
