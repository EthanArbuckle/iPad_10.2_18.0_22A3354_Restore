@implementation CLSPublicEventPerformer

- (CLSPublicEventPerformer)initWithLocalizedName:(id)a3 iTunesIdentifier:(id)a4
{
  id v7;
  id v8;
  CLSPublicEventPerformer *v9;
  CLSPublicEventPerformer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSPublicEventPerformer;
  v9 = -[CLSPublicEventPerformer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedName, a3);
    objc_storeStrong((id *)&v10->_iTunesIdentifier, a4);
  }

  return v10;
}

- (CLSPublicEventPerformer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CLSPublicEventPerformer *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iTunesIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CLSPublicEventPerformer initWithLocalizedName:iTunesIdentifier:](self, "initWithLocalizedName:iTunesIdentifier:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedName;
  id v5;

  localizedName = self->_localizedName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedName, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iTunesIdentifier, CFSTR("iTunesIdentifier"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CLSPublicEventPerformer;
  -[CLSPublicEventPerformer description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ localizedName: %@, localizedName: %@"), v4, self->_localizedName, self->_iTunesIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)iTunesIdentifier
{
  return self->_iTunesIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
