@implementation _GCDeviceConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)configurationWithIdentifier:(id)a3 priority:(unint64_t)a4 deviceIdentifier:(id)a5 deviceDependencies:(id)a6 deviceBuilder:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = objc_alloc((Class)a1);
  v24[0] = CFSTR("Priority");
  +[NSNumber numberWithUnsignedInteger:](&off_1F03A9E90, "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  v24[1] = CFSTR("DeviceIdentifier");
  v18 = (void *)objc_msgSend(v14, "copyWithZone:", 0);

  v25[1] = v18;
  v24[2] = CFSTR("DeviceDependencies");
  v19 = (void *)objc_msgSend(v13, "copy");

  v25[2] = v19;
  v24[3] = CFSTR("DeviceBuilderIdentifier");
  v20 = (void *)objc_msgSend(v12, "copyWithZone:", 0);

  v25[3] = v20;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v16, "_initWithIdentifier:attributes:", v15, v21);

  return v22;
}

- (id)_initWithIdentifier:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  _GCDeviceConfiguration *v8;
  uint64_t v9;
  NSObject *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GCDeviceConfiguration;
  v8 = -[_GCDeviceConfiguration init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_attributes, a4);
  }

  return v8;
}

- (_GCDeviceConfiguration)init
{
  -[_GCDeviceConfiguration doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_GCDeviceConfiguration)initWithCoder:(id)a3
{
  id v4;
  _GCDeviceConfiguration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *identifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *attributes;
  objc_super v15;
  _QWORD v16[5];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_GCDeviceConfiguration;
  v5 = -[_GCDeviceConfiguration init](&v15, sel_init);
  if (v5)
  {
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v17, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = v8;

    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v16[4] = objc_opt_class();
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v16, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("attributes"));
    v12 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *attributes;
  id v5;

  attributes = self->_attributes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", attributes, CFSTR("attributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[_GCMutableDeviceConfiguration _initWithIdentifier:attributes:]([_GCMutableDeviceConfiguration alloc], "_initWithIdentifier:attributes:", self->_identifier, self->_attributes);
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4;
  NSObject *identifier;
  void *v6;
  NSDictionary *attributes;
  void *v8;
  BOOL v9;

  v4 = a3;
  identifier = self->_identifier;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqual:](identifier, "isEqual:", v6))
  {
    attributes = self->_attributes;
    objc_msgSend(v4, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSDictionary isEqualToDictionary:](attributes, "isEqualToDictionary:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  NSObject *identifier;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  identifier = self->_identifier;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject isEqual:](identifier, "isEqual:", v7);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = -[NSObject isEqual:](self->_identifier, "isEqual:", v4);
    else
      v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSObject hash](self->_identifier, "hash");
}

- (id)description
{
  uint64_t v3;
  NSObject *identifier;
  const __CFString *v5;

  v3 = objc_opt_class();
  identifier = self->_identifier;
  if (-[_GCDeviceConfiguration isTransient](self, "isTransient"))
    v5 = CFSTR(" (transient)");
  else
    v5 = &stru_1EA4D5008;
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ '%@'%@ priority = %llu>"), v3, identifier, v5, -[_GCDeviceConfiguration priority](self, "priority"));
}

- (id)redactedDescription
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = objc_opt_class();
  v4 = -[NSObject hash](self->_identifier, "hash");
  if (-[_GCDeviceConfiguration isTransient](self, "isTransient"))
    v5 = CFSTR(" (transient)");
  else
    v5 = &stru_1EA4D5008;
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ '#%llx'%@ priority = %llu>"), v3, v4, v5, -[_GCDeviceConfiguration priority](self, "priority"));
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p '%@'> %@"), v4, self, self->_identifier, self->_attributes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)valueForAttribute:(id)a3
{
  return -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", a3);
}

- (unint64_t)priority
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("Priority"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (BOOL)isTransient
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("Transient"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSObject)deviceIdentifier
{
  return -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("DeviceIdentifier"));
}

- (NSArray)deviceDependencies
{
  return (NSArray *)-[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("DeviceDependencies"));
}

- (NSObject)deviceBuilderIdentifier
{
  return -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("DeviceBuilderIdentifier"));
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
