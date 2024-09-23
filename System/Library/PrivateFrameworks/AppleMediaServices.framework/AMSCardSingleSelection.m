@implementation AMSCardSingleSelection

- (AMSCardSingleSelection)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4
{
  id v6;
  id v7;
  AMSCardSingleSelection *v8;
  AMSCardSingleSelection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSCardSingleSelection;
  v8 = -[AMSCardSingleSelection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AMSCardSingleSelection setPassTypeIdentifier:](v8, "setPassTypeIdentifier:", v6);
    -[AMSCardSingleSelection setPassSerialNumber:](v9, "setPassSerialNumber:", v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  AMSCardSingleSelection *v4;
  AMSCardSingleSelection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (AMSCardSingleSelection *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (self == v4)
  {
    v10 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AMSCardSingleSelection passTypeIdentifier](self, "passTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSCardSingleSelection passTypeIdentifier](v5, "passTypeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[AMSCardSingleSelection passSerialNumber](self, "passSerialNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSCardSingleSelection passSerialNumber](v5, "passSerialNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
LABEL_6:
    v10 = 0;
  }
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AMSCardSingleSelection passTypeIdentifier](self, "passTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AMSCardSingleSelection passSerialNumber](self, "passSerialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (AMSCardSingleSelection)initWithCoder:(id)a3
{
  id v4;
  AMSCardSingleSelection *v5;
  uint64_t v6;
  NSString *passTypeIdentifier;
  uint64_t v8;
  NSString *passSerialNumber;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSCardSingleSelection;
  v5 = -[AMSCardSingleSelection init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passSerialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AMSCardSingleSelection passTypeIdentifier](self, "passTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("passTypeIdentifier"));

  -[AMSCardSingleSelection passSerialNumber](self, "passSerialNumber");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("passSerialNumber"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end
