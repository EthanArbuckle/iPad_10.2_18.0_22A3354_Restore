@implementation CLSPublicEventCategory

- (CLSPublicEventCategory)initWithCategory:(id)a3
{
  id v5;
  CLSPublicEventCategory *v6;
  CLSPublicEventCategory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSPublicEventCategory;
  v6 = -[CLSPublicEventCategory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_category, a3);

  return v7;
}

- (unint64_t)levelForLocalizedSubcategory:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CLSPublicEventCategory localizedSubcategories](self, "localizedSubcategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (CLSPublicEventCategory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CLSPublicEventCategory *v6;
  uint64_t v7;
  NSString *localizedName;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *localizedSubcategories;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CLSPublicEventCategory initWithCategory:](self, "initWithCategory:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
    v7 = objc_claimAutoreleasedReturnValue();
    localizedName = v6->_localizedName;
    v6->_localizedName = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("localizedSubcategories"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedSubcategories = v6->_localizedSubcategories;
    v6->_localizedSubcategories = (NSArray *)v12;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *category;
  id v5;

  category = self->_category;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedName, CFSTR("localizedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedSubcategories, CFSTR("localizedSubcategories"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CLSPublicEventCategory;
  -[CLSPublicEventCategory description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ category: %@, localizedName: %@, subcategory: %@"), v4, self->_category, self->_localizedName, self->_localizedSubcategories);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (NSArray)localizedSubcategories
{
  return self->_localizedSubcategories;
}

- (void)setLocalizedSubcategories:(id)a3
{
  objc_storeStrong((id *)&self->_localizedSubcategories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubcategories, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)musicConcerts
{
  return (NSString *)(id)*MEMORY[0x1E0D26B68];
}

+ (NSString)nightLife
{
  return (NSString *)(id)*MEMORY[0x1E0D26B70];
}

+ (NSString)theater
{
  return (NSString *)(id)*MEMORY[0x1E0D26B80];
}

+ (NSString)dance
{
  return (NSString *)(id)*MEMORY[0x1E0D26B48];
}

+ (NSString)festivalsAndFairs
{
  return (NSString *)(id)*MEMORY[0x1E0D26B60];
}

+ (NSString)artsAndMuseums
{
  return (NSString *)(id)*MEMORY[0x1E0D26B30];
}

+ (NSString)sports
{
  return (NSString *)(id)*MEMORY[0x1E0D26B78];
}

+ (NSString)businessAndTechnology
{
  return (NSString *)(id)*MEMORY[0x1E0D26B38];
}

+ (NSString)community
{
  return (NSString *)(id)*MEMORY[0x1E0D26B40];
}

+ (NSString)educational
{
  return (NSString *)(id)*MEMORY[0x1E0D26B50];
}

+ (NSString)familyEvents
{
  return (NSString *)(id)*MEMORY[0x1E0D26B58];
}

+ (NSString)tours
{
  return (NSString *)(id)*MEMORY[0x1E0D26B88];
}

+ (NSString)appleEvents
{
  return (NSString *)(id)*MEMORY[0x1E0D26B28];
}

@end
