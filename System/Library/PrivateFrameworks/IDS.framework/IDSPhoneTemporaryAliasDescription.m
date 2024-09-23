@implementation IDSPhoneTemporaryAliasDescription

- (IDSPhoneTemporaryAliasDescription)initWithURI:(id)a3 expirationDate:(id)a4 selected:(BOOL)a5
{
  id v9;
  id v10;
  IDSPhoneTemporaryAliasDescription *v11;
  IDSPhoneTemporaryAliasDescription *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSPhoneTemporaryAliasDescription;
  v11 = -[IDSPhoneTemporaryAliasDescription init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_URI, a3);
    objc_storeStrong((id *)&v12->_expirationDate, a4);
    v12->_selected = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_selected)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; URI: %@, expirationDate: %@, selected: %@>"),
               v4,
               self,
               self->_URI,
               self->_expirationDate,
               v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  IDSURI *URI;
  id v5;

  URI = self->_URI;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", URI, CFSTR("uri"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expiration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_selected, CFSTR("selected"));

}

- (IDSPhoneTemporaryAliasDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  IDSPhoneTemporaryAliasDescription *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("selected"));

  v8 = -[IDSPhoneTemporaryAliasDescription initWithURI:expirationDate:selected:](self, "initWithURI:expirationDate:selected:", v5, v6, v7);
  return v8;
}

- (IDSURI)URI
{
  return self->_URI;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_URI, 0);
}

@end
