@implementation GCProductInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)detailedProductCategory
{
  NSString *detailedProductCategory;

  detailedProductCategory = self->_detailedProductCategory;
  if (detailedProductCategory)
    return detailedProductCategory;
  -[GCProductInformation productCategory](self, "productCategory");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (GCProductInformation)initWithIdentifier:(id)a3
{
  id v4;
  GCProductInformation *v5;
  uint64_t v6;
  NSObject *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCProductInformation;
  v5 = -[GCProductInformation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    identifier = v5->_identifier;
    v5->_identifier = v6;

  }
  return v5;
}

- (GCProductInformation)init
{
  void *v3;
  GCProductInformation *v4;

  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GCProductInformation initWithIdentifier:](self, "initWithIdentifier:", v3);

  return v4;
}

- (GCProductInformation)initWithCoder:(id)a3
{
  id v4;
  GCProductInformation *v5;
  void *v6;
  uint64_t v7;
  NSObject *identifier;
  uint64_t v9;
  NSString *productCategory;
  uint64_t v11;
  NSString *detailedProductCategory;
  uint64_t v13;
  NSString *vendorName;
  uint64_t v15;
  NSNumber *attachedToDevice;
  uint64_t v17;
  NSString *anonymizedIdentifier;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSDictionary *miscellaneous;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GCProductInformation;
  v5 = -[GCProductInformation init](&v25, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailedProductCategory"));
    v11 = objc_claimAutoreleasedReturnValue();
    detailedProductCategory = v5->_detailedProductCategory;
    v5->_detailedProductCategory = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorName"));
    v13 = objc_claimAutoreleasedReturnValue();
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachedToDevice"));
    v15 = objc_claimAutoreleasedReturnValue();
    attachedToDevice = v5->_attachedToDevice;
    v5->_attachedToDevice = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anonymizedIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    anonymizedIdentifier = v5->_anonymizedIdentifier;
    v5->_anonymizedIdentifier = (NSString *)v17;

    v19 = objc_opt_class();
    v20 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("miscellaneous"));
    v22 = objc_claimAutoreleasedReturnValue();
    miscellaneous = v5->_miscellaneous;
    v5->_miscellaneous = (NSDictionary *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[GCProductInformation isAttachedToDevice](self, "isAttachedToDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("attachedToDevice"));

  -[GCProductInformation vendorName](self, "vendorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("vendorName"));

  -[GCProductInformation productCategory](self, "productCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("productCategory"));

  -[GCProductInformation detailedProductCategory](self, "detailedProductCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("detailedProductCategory"));

  -[GCProductInformation identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("identifier"));

  -[GCProductInformation anonymizedIdentifier](self, "anonymizedIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("anonymizedIdentifier"));

  -[GCProductInformation miscellaneous](self, "miscellaneous");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("miscellaneous"));

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

- (void)setDetailedProductCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)anonymizedIdentifier
{
  return self->_anonymizedIdentifier;
}

- (void)setAnonymizedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)isAttachedToDevice
{
  return self->_attachedToDevice;
}

- (void)setAttachedToDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)miscellaneous
{
  return self->_miscellaneous;
}

- (void)setMiscellaneous:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscellaneous, 0);
  objc_storeStrong((id *)&self->_attachedToDevice, 0);
  objc_storeStrong((id *)&self->_anonymizedIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_detailedProductCategory, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
