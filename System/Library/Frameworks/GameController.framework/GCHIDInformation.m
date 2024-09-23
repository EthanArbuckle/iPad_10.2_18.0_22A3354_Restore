@implementation GCHIDInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHIDInformation)initWithIdentifier:(id)a3
{
  id v4;
  GCHIDInformation *v5;
  uint64_t v6;
  NSObject *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCHIDInformation;
  v5 = -[GCHIDInformation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    identifier = v5->_identifier;
    v5->_identifier = v6;

  }
  return v5;
}

- (GCHIDInformation)init
{
  void *v3;
  GCHIDInformation *v4;

  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GCHIDInformation initWithIdentifier:](self, "initWithIdentifier:", v3);

  return v4;
}

- (GCHIDInformation)initWithCoder:(id)a3
{
  id v4;
  GCHIDInformation *v5;
  void *v6;
  uint64_t v7;
  NSObject *identifier;
  uint64_t v9;
  NSNumber *registryID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCHIDInformation;
  v5 = -[GCHIDInformation init](&v12, sel_init);
  if (v5)
  {
    GCIPCObjectIdentifier_Classes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registryID"));
    v9 = objc_claimAutoreleasedReturnValue();
    registryID = v5->_registryID;
    v5->_registryID = (NSNumber *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[GCHIDInformation registryID](self, "registryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("registryID"));

  -[GCHIDInformation identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)registryID
{
  return self->_registryID;
}

- (void)setRegistryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
