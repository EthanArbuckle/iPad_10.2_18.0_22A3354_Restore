@implementation _GCRacingWheelProductInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCRacingWheelProductInformation)initWithIdentifier:(id)a3
{
  id v4;
  _GCRacingWheelProductInformation *v5;
  uint64_t v6;
  NSObject *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCRacingWheelProductInformation;
  v5 = -[_GCRacingWheelProductInformation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    identifier = v5->_identifier;
    v5->_identifier = v6;

  }
  return v5;
}

- (_GCRacingWheelProductInformation)init
{
  void *v3;
  _GCRacingWheelProductInformation *v4;

  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_GCRacingWheelProductInformation initWithIdentifier:](self, "initWithIdentifier:", v3);

  return v4;
}

- (_GCRacingWheelProductInformation)initWithCoder:(id)a3
{
  id v4;
  _GCRacingWheelProductInformation *v5;
  void *v6;
  uint64_t v7;
  NSObject *identifier;
  uint64_t v9;
  NSString *productCategory;
  uint64_t v11;
  NSString *vendorName;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GCRacingWheelProductInformation;
  v5 = -[_GCRacingWheelProductInformation init](&v14, sel_init);
  if (v5)
  {
    GCIPCObjectIdentifier_Classes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productCategory"));
    v9 = objc_claimAutoreleasedReturnValue();
    productCategory = v5->_productCategory;
    v5->_productCategory = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorName"));
    v11 = objc_claimAutoreleasedReturnValue();
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v11;

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
  -[_GCRacingWheelProductInformation vendorName](self, "vendorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("vendorName"));

  -[_GCRacingWheelProductInformation productCategory](self, "productCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("productCategory"));

  -[_GCRacingWheelProductInformation identifier](self, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("identifier"));

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)productCategory
{
  return self->_productCategory;
}

- (void)setProductCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
