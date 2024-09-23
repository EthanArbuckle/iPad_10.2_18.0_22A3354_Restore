@implementation _FCActivityLifetime

- (_FCActivityLifetime)initWithLifetimeDetails:(id)a3
{
  id v5;
  _FCActivityLifetime *v6;
  _FCActivityLifetime *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FCActivityLifetime;
  v6 = -[_FCActivityLifetime init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dndLifetimeDetails, a3);

  return v7;
}

- (NSString)lifetimeIdentifier
{
  return (NSString *)-[DNDLifetimeDetails identifier](self->_dndLifetimeDetails, "identifier");
}

- (NSString)lifetimeName
{
  return (NSString *)-[DNDLifetimeDetails name](self->_dndLifetimeDetails, "name");
}

- (NSString)lifetimeMetadata
{
  return (NSString *)-[DNDLifetimeDetails metadata](self->_dndLifetimeDetails, "metadata");
}

- (unint64_t)hash
{
  return -[DNDLifetimeDetails hash](self->_dndLifetimeDetails, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _FCActivityLifetime *v4;
  char v5;

  v4 = (_FCActivityLifetime *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = BSEqualObjects();
    else
      v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[_FCActivityLifetime lifetimeIdentifier](self, "lifetimeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FCActivityLifetime lifetimeName](self, "lifetimeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FCActivityLifetime lifetimeMetadata](self, "lifetimeMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; lifetimeIdentifier: %@; lifetimeName: %@; lifetimeMetadata: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)-[DNDLifetimeDetails copy](self->_dndLifetimeDetails, "copy");
  v6 = (void *)objc_msgSend(v4, "initWithLifetimeDetails:", v5);

  return v6;
}

- (DNDLifetimeDetails)_dndLifetimeDetails
{
  return self->_dndLifetimeDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndLifetimeDetails, 0);
}

@end
