@implementation HKSignedClinicalDataIssuer

- (HKSignedClinicalDataIssuer)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKSignedClinicalDataIssuer)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 wellKnownURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKSignedClinicalDataIssuer *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSString *subtitle;
  uint64_t v21;
  NSURL *wellKnownURL;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKSignedClinicalDataIssuer;
  v14 = -[HKSignedClinicalDataIssuer init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    subtitle = v14->_subtitle;
    v14->_subtitle = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    wellKnownURL = v14->_wellKnownURL;
    v14->_wellKnownURL = (NSURL *)v21;

  }
  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_title, "hash") ^ v3;
  v5 = -[NSString hash](self->_subtitle, "hash");
  return v4 ^ v5 ^ -[NSURL hash](self->_wellKnownURL, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKSignedClinicalDataIssuer *v6;
  HKSignedClinicalDataIssuer *v7;
  HKSignedClinicalDataIssuer *v8;
  NSString *identifier;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  char v14;
  NSString *title;
  NSString *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  NSString *subtitle;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  NSString *v25;
  void *v26;
  NSURL *wellKnownURL;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSURL *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *v40;
  void *v41;
  NSString *v42;
  void *v43;

  v6 = (HKSignedClinicalDataIssuer *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    identifier = self->_identifier;
    -[HKSignedClinicalDataIssuer identifier](v8, "identifier");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (identifier != v10)
    {
      -[HKSignedClinicalDataIssuer identifier](v8, "identifier");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      v12 = self->_identifier;
      -[HKSignedClinicalDataIssuer identifier](v8, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v12, "isEqualToString:", v13))
      {
        v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    title = self->_title;
    -[HKSignedClinicalDataIssuer title](v8, "title");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (title == v16)
    {
      v42 = title;
    }
    else
    {
      -[HKSignedClinicalDataIssuer title](v8, "title");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = title;
      v19 = self->_title;
      -[HKSignedClinicalDataIssuer title](v8, "title");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v19, "isEqualToString:", v4))
      {

        v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    subtitle = self->_subtitle;
    -[HKSignedClinicalDataIssuer subtitle](v8, "subtitle");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    v41 = v4;
    if (subtitle == v21)
    {
      v39 = v3;
      v40 = subtitle;
    }
    else
    {
      -[HKSignedClinicalDataIssuer subtitle](v8, "subtitle");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:

        }
LABEL_36:

LABEL_37:
        v13 = v43;
        if (identifier != v10)
          goto LABEL_38;
LABEL_39:

        goto LABEL_40;
      }
      v40 = subtitle;
      v37 = (void *)v22;
      v23 = self->_subtitle;
      -[HKSignedClinicalDataIssuer subtitle](v8, "subtitle");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = (void *)v24;
      if (!-[NSString isEqualToString:](v25, "isEqualToString:", v24))
      {

        v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    wellKnownURL = self->_wellKnownURL;
    -[HKSignedClinicalDataIssuer wellKnownURL](v8, "wellKnownURL", v35);
    v28 = objc_claimAutoreleasedReturnValue();
    v14 = wellKnownURL == (NSURL *)v28;
    if (wellKnownURL == (NSURL *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[HKSignedClinicalDataIssuer wellKnownURL](v8, "wellKnownURL");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_wellKnownURL;
        -[HKSignedClinicalDataIssuer wellKnownURL](v8, "wellKnownURL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSURL isEqual:](v32, "isEqual:", v33);

        if (v40 == v21)
        {

LABEL_44:
          v3 = v39;
          if (v42 == v16)
            goto LABEL_36;
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }

    }
    if (v40 == v21)
      goto LABEL_42;

    v3 = v39;
    goto LABEL_33;
  }
  v14 = 1;
LABEL_41:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("Title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("Subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wellKnownURL, CFSTR("WellKnownURL"));

}

- (HKSignedClinicalDataIssuer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKSignedClinicalDataIssuer *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Subtitle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WellKnownURL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[HKSignedClinicalDataIssuer initWithIdentifier:title:subtitle:wellKnownURL:](self, "initWithIdentifier:title:subtitle:wellKnownURL:", v5, v6, v7, v8);

      v9 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v9 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }

  return v9;
}

- (NSString)identifier
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

- (NSURL)wellKnownURL
{
  return self->_wellKnownURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wellKnownURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
