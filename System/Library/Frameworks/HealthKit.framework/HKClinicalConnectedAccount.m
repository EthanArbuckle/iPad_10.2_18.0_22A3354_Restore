@implementation HKClinicalConnectedAccount

- (HKClinicalConnectedAccount)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalConnectedAccount)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 brand:(id)a6 needsRelogin:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKClinicalConnectedAccount *v16;
  uint64_t v17;
  NSUUID *identifier;
  uint64_t v19;
  NSString *title;
  uint64_t v21;
  NSString *subtitle;
  uint64_t v23;
  HKClinicalBrand *brand;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HKClinicalConnectedAccount;
  v16 = -[HKClinicalConnectedAccount init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSUUID *)v17;

    v19 = objc_msgSend(v13, "copy");
    title = v16->_title;
    v16->_title = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    subtitle = v16->_subtitle;
    v16->_subtitle = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    brand = v16->_brand;
    v16->_brand = (HKClinicalBrand *)v23;

    v16->_needsRelogin = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  NSUUID *v3;
  void *v4;
  HKClinicalConnectedAccount *v6;
  HKClinicalConnectedAccount *v7;
  HKClinicalConnectedAccount *v8;
  NSUUID *identifier;
  NSUUID *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  NSString *title;
  NSString *v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  NSString *subtitle;
  uint64_t v22;
  BOOL v23;
  NSString *v24;
  uint64_t v25;
  NSString *v26;
  HKClinicalBrand *brand;
  HKClinicalBrand *v28;
  uint64_t v29;
  uint64_t v30;
  HKClinicalBrand *v31;
  _BOOL4 needsRelogin;
  NSString *v33;
  void *v35;
  HKClinicalBrand *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSUUID *v42;
  NSString *v43;
  void *v44;

  v6 = (HKClinicalConnectedAccount *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_42:

      goto LABEL_43;
    }
    identifier = self->_identifier;
    -[HKClinicalConnectedAccount identifier](v8, "identifier");
    v10 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    if (identifier != v10)
    {
      -[HKClinicalConnectedAccount identifier](v8, "identifier");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v13 = 0;
        goto LABEL_41;
      }
      v4 = (void *)v11;
      v3 = self->_identifier;
      -[HKClinicalConnectedAccount identifier](v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSUUID isEqual:](v3, "isEqual:", v12))
      {
        v13 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v44 = v12;
    }
    title = self->_title;
    -[HKClinicalConnectedAccount title](v8, "title");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (title != v15)
    {
      -[HKClinicalConnectedAccount title](v8, "title");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v13 = 0;
LABEL_38:
        v12 = v44;
        goto LABEL_39;
      }
      v17 = (void *)v16;
      v18 = self->_title;
      -[HKClinicalConnectedAccount title](v8, "title");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v18;
      v3 = (NSUUID *)v19;
      if (!-[NSString isEqualToString:](v20, "isEqualToString:", v19))
      {

        v13 = 0;
        goto LABEL_45;
      }
      v40 = v17;
    }
    subtitle = self->_subtitle;
    -[HKClinicalConnectedAccount subtitle](v8, "subtitle");
    v22 = objc_claimAutoreleasedReturnValue();
    v43 = subtitle;
    v23 = subtitle == (NSString *)v22;
    v24 = (NSString *)v22;
    if (v23)
    {
      v41 = v4;
      v42 = v3;
    }
    else
    {
      -[HKClinicalConnectedAccount subtitle](v8, "subtitle");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        v13 = 0;
        goto LABEL_33;
      }
      v39 = (void *)v25;
      v42 = v3;
      v26 = self->_subtitle;
      -[HKClinicalConnectedAccount subtitle](v8, "subtitle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v26, "isEqualToString:"))
      {
        v13 = 0;
        v3 = v42;
LABEL_36:

        if (title != v15)
        {

          goto LABEL_38;
        }

LABEL_45:
        v12 = v44;
        if (identifier == v10)
          goto LABEL_41;
        goto LABEL_40;
      }
      v41 = v4;
    }
    brand = self->_brand;
    -[HKClinicalConnectedAccount brand](v8, "brand");
    v28 = (HKClinicalBrand *)objc_claimAutoreleasedReturnValue();
    if (brand != v28)
    {
      -[HKClinicalConnectedAccount brand](v8, "brand");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
      {

        v13 = 0;
        v3 = v42;
        v33 = v43;
LABEL_31:
        v4 = v41;
        if (v33 != v24)
        {

        }
        goto LABEL_33;
      }
      v36 = self->_brand;
      v37 = (void *)v29;
      -[HKClinicalConnectedAccount brand](v8, "brand");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v36;
      v35 = (void *)v30;
      if (!-[HKClinicalBrand isEqual:](v31, "isEqual:"))
      {
        v13 = 0;
LABEL_28:
        v3 = v42;

        v33 = v43;
        goto LABEL_31;
      }
    }
    needsRelogin = self->_needsRelogin;
    v13 = needsRelogin == -[HKClinicalConnectedAccount needsRelogin](v8, "needsRelogin");
    if (brand != v28)
      goto LABEL_28;

    v3 = v42;
    v4 = v41;
    if (v43 != v24)
      goto LABEL_36;
LABEL_33:

    v23 = title == v15;
    v12 = v44;
    if (!v23)
    {

    }
LABEL_39:

    if (identifier != v10)
      goto LABEL_40;
LABEL_41:

    goto LABEL_42;
  }
  v13 = 1;
LABEL_43:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_title, "hash") ^ v3;
  v5 = -[NSString hash](self->_subtitle, "hash");
  return v4 ^ v5 ^ -[HKClinicalBrand hash](self->_brand, "hash") ^ self->_needsRelogin;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_brand, CFSTR("brand"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsRelogin, CFSTR("needsRelogin"));

}

- (HKClinicalConnectedAccount)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKClinicalConnectedAccount *v9;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("title"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("needsRelogin")) & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brand"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKClinicalConnectedAccount initWithIdentifier:title:subtitle:brand:needsRelogin:](self, "initWithIdentifier:title:subtitle:brand:needsRelogin:", v5, v6, v7, v8, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsRelogin")));

    v9 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v5);
    v9 = 0;
  }

  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (HKClinicalBrand)brand
{
  return self->_brand;
}

- (BOOL)needsRelogin
{
  return self->_needsRelogin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
