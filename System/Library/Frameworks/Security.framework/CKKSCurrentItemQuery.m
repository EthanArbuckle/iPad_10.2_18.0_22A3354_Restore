@implementation CKKSCurrentItemQuery

- (CKKSCurrentItemQuery)initWithIdentifier:(id)a3 accessGroup:(id)a4 zoneID:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKKSCurrentItemQuery *v12;
  CKKSCurrentItemQuery *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKSCurrentItemQuery;
  v12 = -[CKKSCurrentItemQuery init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_accessGroup, a4);
    objc_storeStrong((id *)&v13->_zoneID, a5);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKKSCurrentItemQuery identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[CKKSCurrentItemQuery accessGroup](self, "accessGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accessGroup"));

  -[CKKSCurrentItemQuery zoneID](self, "zoneID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("zoneID"));

}

- (CKKSCurrentItemQuery)initWithCoder:(id)a3
{
  id v4;
  CKKSCurrentItemQuery *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *accessGroup;
  uint64_t v10;
  NSString *zoneID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKKSCurrentItemQuery;
  v5 = -[CKKSCurrentItemQuery init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessGroup"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneID"));
    v10 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v10;

  }
  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccessGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
