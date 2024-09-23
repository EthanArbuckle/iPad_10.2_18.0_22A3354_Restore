@implementation INRestaurant

- (INRestaurant)init
{
  void *v3;
  INRestaurant *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[INRestaurant initWithLocation:name:vendorIdentifier:restaurantIdentifier:](self, "initWithLocation:name:vendorIdentifier:restaurantIdentifier:", v3, &stru_1E2295770, &stru_1E2295770, &stru_1E2295770);

  return v4;
}

- (INRestaurant)initWithLocation:(CLLocation *)location name:(NSString *)name vendorIdentifier:(NSString *)vendorIdentifier restaurantIdentifier:(NSString *)restaurantIdentifier
{
  CLLocation *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  INRestaurant *v14;
  uint64_t v15;
  CLLocation *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  NSString *v22;
  objc_super v24;

  v10 = location;
  v11 = name;
  v12 = vendorIdentifier;
  v13 = restaurantIdentifier;
  v24.receiver = self;
  v24.super_class = (Class)INRestaurant;
  v14 = -[INRestaurant init](&v24, sel_init);
  if (v14)
  {
    v15 = -[CLLocation copy](v10, "copy");
    v16 = v14->_location;
    v14->_location = (CLLocation *)v15;

    v17 = -[NSString copy](v11, "copy");
    v18 = v14->_name;
    v14->_name = (NSString *)v17;

    v19 = -[NSString copy](v12, "copy");
    v20 = v14->_vendorIdentifier;
    v14->_vendorIdentifier = (NSString *)v19;

    v21 = -[NSString copy](v13, "copy");
    v22 = v14->_restaurantIdentifier;
    v14->_restaurantIdentifier = (NSString *)v21;

  }
  return v14;
}

- (INRestaurant)initWithCoder:(id)a3
{
  id v4;
  INRestaurant *v5;
  uint64_t v6;
  CLLocation *location;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *vendorIdentifier;
  uint64_t v12;
  NSString *restaurantIdentifier;
  INRestaurant *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[INRestaurant init](self, "init");
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v15 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v17 = 136315394;
    v18 = "-[INRestaurant initWithCoder:]";
    v19 = 2080;
    v20 = "_location";
LABEL_16:
    _os_log_error_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_ERROR, "%s Null value for %s", (uint8_t *)&v17, 0x16u);
    goto LABEL_17;
  }
  location = v5->_location;
  v5->_location = (CLLocation *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v15 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v17 = 136315394;
    v18 = "-[INRestaurant initWithCoder:]";
    v19 = 2080;
    v20 = "_name";
    goto LABEL_16;
  }
  name = v5->_name;
  v5->_name = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorIdentifier"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v15 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v17 = 136315394;
    v18 = "-[INRestaurant initWithCoder:]";
    v19 = 2080;
    v20 = "_vendorIdentifier";
    goto LABEL_16;
  }
  vendorIdentifier = v5->_vendorIdentifier;
  v5->_vendorIdentifier = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restaurantIdentifier"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v15 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[INRestaurant initWithCoder:]";
      v19 = 2080;
      v20 = "_restaurantIdentifier";
      goto LABEL_16;
    }
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  restaurantIdentifier = v5->_restaurantIdentifier;
  v5->_restaurantIdentifier = (NSString *)v12;

LABEL_7:
  v14 = v5;
LABEL_18:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  CLLocation *location;
  id v5;

  location = self->_location;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorIdentifier, CFSTR("vendorIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_restaurantIdentifier, CFSTR("restaurantIdentifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  INRestaurant *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[INRestaurant init](+[INRestaurant allocWithZone:](INRestaurant, "allocWithZone:", a3), "init");
  -[INRestaurant location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurant setLocation:](v4, "setLocation:", v5);

  -[INRestaurant name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurant setName:](v4, "setName:", v6);

  -[INRestaurant vendorIdentifier](self, "vendorIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurant setVendorIdentifier:](v4, "setVendorIdentifier:", v7);

  -[INRestaurant restaurantIdentifier](self, "restaurantIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurant setRestaurantIdentifier:](v4, "setRestaurantIdentifier:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  INRestaurant *v4;
  INRestaurant *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (INRestaurant *)a3;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[INRestaurant location](v5, "location");
      v6 = objc_claimAutoreleasedReturnValue();
      -[INRestaurant location](self, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[INRestaurant location:equalToLocation:](self, "location:equalToLocation:", v6, v7);

      -[INRestaurant name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[INRestaurant name](v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v9, "isEqualToString:", v10);

      -[INRestaurant vendorIdentifier](v5, "vendorIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[INRestaurant vendorIdentifier](self, "vendorIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      -[INRestaurant restaurantIdentifier](v5, "restaurantIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[INRestaurant restaurantIdentifier](self, "restaurantIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v14, "isEqualToString:", v15);

      v16 = v8 & v6 & v13 & v5;
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (BOOL)location:(id)a3 equalToLocation:(id)a4
{
  double v4;

  objc_msgSend(a3, "distanceFromLocation:", a4);
  return v4 < 5.0;
}

- (NSString)description
{
  return (NSString *)-[INRestaurant descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INRestaurant;
  -[INRestaurant description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurant _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  CLLocation *location;
  void *v4;
  NSString *name;
  void *v6;
  NSString *vendorIdentifier;
  void *v8;
  NSString *restaurantIdentifier;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("location");
  location = self->_location;
  v4 = location;
  if (!location)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("name");
  name = self->_name;
  v6 = name;
  if (!name)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("vendorIdentifier");
  vendorIdentifier = self->_vendorIdentifier;
  v8 = vendorIdentifier;
  if (!vendorIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v8;
  v13[3] = CFSTR("restaurantIdentifier");
  restaurantIdentifier = self->_restaurantIdentifier;
  v10 = restaurantIdentifier;
  if (!restaurantIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (restaurantIdentifier)
  {
    if (vendorIdentifier)
      goto LABEL_11;
  }
  else
  {

    if (vendorIdentifier)
    {
LABEL_11:
      if (name)
        goto LABEL_12;
LABEL_16:

      if (location)
        return v11;
LABEL_17:

      return v11;
    }
  }

  if (!name)
    goto LABEL_16;
LABEL_12:
  if (!location)
    goto LABEL_17;
  return v11;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(CLLocation *)location
{
  objc_setProperty_nonatomic_copy(self, a2, location, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 16);
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(NSString *)vendorIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, vendorIdentifier, 24);
}

- (NSString)restaurantIdentifier
{
  return self->_restaurantIdentifier;
}

- (void)setRestaurantIdentifier:(NSString *)restaurantIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, restaurantIdentifier, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restaurantIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
