@implementation CTPhoneBookEntry

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", isHidden=%d"), -[CTPhoneBookEntry isHidden](self, "isHidden"));
  -[CTPhoneBookEntry name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", name=%@"), v4);

  -[CTPhoneBookEntry number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", number=%@"), v5);

  -[CTPhoneBookEntry altNumber](self, "altNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", altNumber=%@"), v6);

  -[CTPhoneBookEntry altText](self, "altText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", altText=%@"), v7);

  -[CTPhoneBookEntry email](self, "email");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", email=%@"), v8);

  -[CTPhoneBookEntry group](self, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", group=%@"), v9);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsHidden:", -[CTPhoneBookEntry isHidden](self, "isHidden"));
  -[CTPhoneBookEntry name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[CTPhoneBookEntry number](self, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumber:", v6);

  -[CTPhoneBookEntry altNumber](self, "altNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAltNumber:", v7);

  -[CTPhoneBookEntry altText](self, "altText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAltText:", v8);

  -[CTPhoneBookEntry email](self, "email");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEmail:", v9);

  -[CTPhoneBookEntry group](self, "group");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroup:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTPhoneBookEntry isHidden](self, "isHidden"), CFSTR("isHidden"));
  -[CTPhoneBookEntry name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[CTPhoneBookEntry number](self, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("number"));

  -[CTPhoneBookEntry altNumber](self, "altNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("altNumber"));

  -[CTPhoneBookEntry altText](self, "altText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("altText"));

  -[CTPhoneBookEntry email](self, "email");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("email"));

  -[CTPhoneBookEntry group](self, "group");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("group"));

}

- (CTPhoneBookEntry)initWithCoder:(id)a3
{
  id v4;
  CTPhoneBookEntry *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *number;
  uint64_t v10;
  NSString *altNumber;
  uint64_t v12;
  NSString *altText;
  uint64_t v14;
  NSString *email;
  uint64_t v16;
  NSString *group;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTPhoneBookEntry;
  v5 = -[CTPhoneBookEntry init](&v19, sel_init);
  if (v5)
  {
    v5->_isHidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHidden"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("number"));
    v8 = objc_claimAutoreleasedReturnValue();
    number = v5->_number;
    v5->_number = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    altNumber = v5->_altNumber;
    v5->_altNumber = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altText"));
    v12 = objc_claimAutoreleasedReturnValue();
    altText = v5->_altText;
    v5->_altText = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("email"));
    v14 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("group"));
    v16 = objc_claimAutoreleasedReturnValue();
    group = v5->_group;
    v5->_group = (NSString *)v16;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (NSString)altNumber
{
  return self->_altNumber;
}

- (void)setAltNumber:(id)a3
{
  objc_storeStrong((id *)&self->_altNumber, a3);
}

- (NSString)altText
{
  return self->_altText;
}

- (void)setAltText:(id)a3
{
  objc_storeStrong((id *)&self->_altText, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_altText, 0);
  objc_storeStrong((id *)&self->_altNumber, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
