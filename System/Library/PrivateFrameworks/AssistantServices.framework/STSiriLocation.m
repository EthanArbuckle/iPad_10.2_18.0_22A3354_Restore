@implementation STSiriLocation

- (STSiriLocation)initWithCoder:(id)a3
{
  id v4;
  STSiriLocation *v5;
  uint64_t v6;
  NSURL *addressBookID;
  uint64_t v8;
  NSString *addressLabel;
  uint64_t v10;
  NSString *contactName;
  uint64_t v12;
  NSData *geoResult;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSiriLocation;
  v5 = -[STSiriLocation init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSTSiriLocationAddressBookIDKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    addressBookID = v5->_addressBookID;
    v5->_addressBookID = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSTSiriLocationAddressLabelKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    addressLabel = v5->_addressLabel;
    v5->_addressLabel = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSTSiriLocationContactNameKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    contactName = v5->_contactName;
    v5->_contactName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSTSiriLocationGeoResultKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    geoResult = v5->_geoResult;
    v5->_geoResult = (NSData *)v12;

    v5->_resultType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSTSiriLocationResultTypeKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *addressBookID;
  id v5;

  addressBookID = self->_addressBookID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", addressBookID, CFSTR("kSTSiriLocationAddressBookIDKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addressLabel, CFSTR("kSTSiriLocationAddressLabelKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactName, CFSTR("kSTSiriLocationContactNameKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geoResult, CFSTR("kSTSiriLocationGeoResultKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_resultType, CFSTR("kSTSiriLocationResultTypeKey"));

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STSiriLocation resultType](self, "resultType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](self->_geoResult, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type: %@, data length: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_addressBookID)
    objc_msgSend(v6, "appendFormat:", CFSTR("\\ %@"), self->_addressBookID);
  if (self->_addressLabel)
    objc_msgSend(v6, "appendFormat:", CFSTR("\\ %@"), self->_addressLabel);
  if (self->_contactName)
    objc_msgSend(v6, "appendFormat:", CFSTR("\\ %@"), self->_contactName);
  return (NSString *)v6;
}

- (NSURL)addressBookID
{
  return self->_addressBookID;
}

- (void)setAddressBookID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)addressLabel
{
  return self->_addressLabel;
}

- (void)setAddressLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)contactName
{
  return self->_contactName;
}

- (void)setContactName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)geoResult
{
  return self->_geoResult;
}

- (void)setGeoResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoResult, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_addressBookID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
