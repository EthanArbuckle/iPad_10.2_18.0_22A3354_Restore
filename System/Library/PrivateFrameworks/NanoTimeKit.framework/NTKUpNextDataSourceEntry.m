@implementation NTKUpNextDataSourceEntry

- (NTKUpNextDataSourceEntry)initWithDataSourceIdentifiers:(id)a3 localizedName:(id)a4 isDonation:(BOOL)a5
{
  id v9;
  id v10;
  NTKUpNextDataSourceEntry *v11;
  NTKUpNextDataSourceEntry *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKUpNextDataSourceEntry;
  v11 = -[NTKUpNextDataSourceEntry init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifiers, a3);
    objc_storeStrong((id *)&v12->_localizedName, a4);
    v12->_isDonation = a5;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NTKUpNextDataSourceEntry *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(NTKUpNextDataSourceEntry);
  if (v5)
  {
    v6 = (void *)-[NSSet copyWithZone:](self->_identifiers, "copyWithZone:", a3);
    -[NTKUpNextDataSourceEntry setIdentifiers:](v5, "setIdentifiers:", v6);

    v7 = (void *)-[NSString copyWithZone:](self->_localizedName, "copyWithZone:", a3);
    -[NTKUpNextDataSourceEntry setLocalizedName:](v5, "setLocalizedName:", v7);

    -[NTKUpNextDataSourceEntry setIsDonation:](v5, "setIsDonation:", self->_isDonation);
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextDataSourceEntry;
  -[NTKUpNextDataSourceEntry description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ - %@ - isDonation %x"), v4, self->_localizedName, self->_identifiers, self->_isDonation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (BOOL)isDonation
{
  return self->_isDonation;
}

- (void)setIsDonation:(BOOL)a3
{
  self->_isDonation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
