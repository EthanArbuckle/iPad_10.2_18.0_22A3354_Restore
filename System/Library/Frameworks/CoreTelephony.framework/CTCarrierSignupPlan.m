@implementation CTCarrierSignupPlan

- (CTCarrierSignupPlan)initWithName:(id)a3 url:(id)a4 type:(id)a5
{
  id v8;
  id v9;
  id v10;
  CTCarrierSignupPlan *v11;
  uint64_t v12;
  NSString *name;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CTCarrierSignupPlan;
  v11 = -[CTCarrierSignupPlan init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_storeStrong((id *)&v11->_url, a4);
    objc_storeStrong((id *)&v11->_type, a5);
    v11->_option = 0;
  }

  return v11;
}

- (CTCarrierSignupPlan)initWithName:(id)a3 url:(id)a4 type:(id)a5 option:(int64_t)a6 identifiers:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CTCarrierSignupPlan *v16;
  uint64_t v17;
  NSString *name;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CTCarrierSignupPlan;
  v16 = -[CTCarrierSignupPlan init](&v20, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

    objc_storeStrong((id *)&v16->_url, a4);
    objc_storeStrong((id *)&v16->_type, a5);
    v16->_option = a6;
    objc_storeStrong((id *)&v16->_identifiers, a7);
  }

  return v16;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", name=%@"), self->_name);
  objc_msgSend(v3, "appendFormat:", CFSTR(", url=%@"), self->_url);
  objc_msgSend(v3, "appendFormat:", CFSTR(", type=%@"), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR(", option=%s"), CTPlanPurchaseOptionAsString(-[CTCarrierSignupPlan option](self, "option")));
  objc_msgSend(v3, "appendFormat:", CFSTR(", identifiers=%@"), self->_identifiers);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CTCarrierSignupPlan;
  if (-[CTPlan isEqual:](&v31, sel_isEqual_, v5))
  {
    -[CTCarrierSignupPlan name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {
      -[CTCarrierSignupPlan name](self, "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v8))
      {
        v9 = 0;
        goto LABEL_26;
      }
      v30 = v8;
    }
    -[CTCarrierSignupPlan url](self, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      -[CTCarrierSignupPlan url](self, "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqual:", v13))
      {
        v9 = 0;
LABEL_24:

LABEL_25:
        v8 = v30;
        if (v6 == v7)
        {
LABEL_27:

          goto LABEL_28;
        }
LABEL_26:

        goto LABEL_27;
      }
      v28 = v13;
      v29 = v12;
    }
    -[CTCarrierSignupPlan type](self, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 != v15)
    {
      -[CTCarrierSignupPlan type](self, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "isEqual:"))
      {
        v9 = 0;
        goto LABEL_22;
      }
      v26 = v16;
    }
    v17 = -[CTCarrierSignupPlan option](self, "option");
    if (v17 == objc_msgSend(v5, "option"))
    {
      v25 = v3;
      -[CTCarrierSignupPlan identifiers](self, "identifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifiers");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v18 == (void *)v19)
      {

        v9 = 1;
      }
      else
      {
        v24 = (void *)v19;
        -[CTCarrierSignupPlan identifiers](self, "identifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v23, "isEqual:", v20);

      }
      v21 = v14 == v15;
      v3 = v25;
    }
    else
    {
      v9 = 0;
      v21 = v14 == v15;
    }
    v16 = v26;
    if (v21)
    {
LABEL_23:

      v13 = v28;
      v12 = v29;
      if (v10 == v11)
        goto LABEL_25;
      goto LABEL_24;
    }
LABEL_22:

    goto LABEL_23;
  }
  v9 = 0;
LABEL_28:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCarrierSignupPlan)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSignupPlan *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *url;
  uint64_t v10;
  NSString *type;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *identifiers;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CTCarrierSignupPlan;
  v5 = -[CTPlan initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v8 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v10 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v10;

    v5->_option = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("option"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("planID"));
    v15 = objc_claimAutoreleasedReturnValue();
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTCarrierSignupPlan;
  v4 = a3;
  -[CTPlan encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_option, CFSTR("option"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifiers, CFSTR("planID"));

}

- (NSString)name
{
  return self->_name;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)type
{
  return self->_type;
}

- (int64_t)option
{
  return self->_option;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
