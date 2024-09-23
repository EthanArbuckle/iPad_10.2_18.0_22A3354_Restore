@implementation HMAccessoryCategory

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMAccessoryCategory categoryType](self, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)categoryType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessoryCategory)initWithType:(id)a3 name:(id)a4
{
  __CFString *v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  HMAccessoryCategory *v10;
  HMAccessoryCategory *v11;
  objc_super v13;

  v6 = (__CFString *)a3;
  v7 = a4;
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("8C1F6C9C-18D3-4C74-BA43-9380B6ACF64")))v8 = CFSTR("830C0952-7CD8-44FB-B0C0-DA4EDB0F32A9");
  else
    v8 = v6;
  v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)HMAccessoryCategory;
  v10 = -[HMAccessoryCategory init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_categoryType, v8);
    objc_storeStrong((id *)&v11->_name, a4);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryCategory *v4;
  HMAccessoryCategory *v5;
  HMAccessoryCategory *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMAccessoryCategory *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMAccessoryCategory categoryType](self, "categoryType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryCategory categoryType](v6, "categoryType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[HMAccessoryCategory name](self, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAccessoryCategory name](v6, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_categoryType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMAccessoryCategory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessoryCategory *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.accessoryCategoryType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.accessoryCategoryName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMAccessoryCategory initWithType:name:](self, "initWithType:name:", v5, v6);
  return v7;
}

- (HMAccessoryCategory)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)uniqueIdentifier
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HMAccessoryCategory categoryType](self, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  return v5;
}

- (NSString)localizedDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMAccessoryCategory categoryType](self, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  localizationKeyForAccessoryCategoryType(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMLocalization sharedManager](HMLocalization, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLocalizedOrCustomString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)localizedDescriptionPlural
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMAccessoryCategory categoryType](self, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pluralLocalizationKeyForAccessoryCategoryType(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMLocalization sharedManager](HMLocalization, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLocalizedOrCustomString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isTelevisionAccessoryCategory
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[HMAccessoryCategory categoryType](self, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("830C0952-7CD8-44FB-B0C0-DA4EDB0F32A9")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HMAccessoryCategory categoryType](self, "categoryType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FB953A08-6CDD-44E0-B011-CFAC559A3CFB")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[HMAccessoryCategory categoryType](self, "categoryType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("B0C866C4-3E25-4F6A-8476-A8A3B579A86E"));

    }
  }

  return v4;
}

- (BOOL)isWiFiRouterAccessoryCategory
{
  void *v2;
  char v3;

  -[HMAccessoryCategory categoryType](self, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("337635B4-552A-48AD-A38D-DD2D5E826C9A"));

  return v3;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMAccessoryCategory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryCategory localizedDescription](self, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryCategory categoryType](self, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name: %@  type: %@(%@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0D27F80]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMAccessoryCategory name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryCategory categoryType](self, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ name = %@, type = %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMAccessoryCategory categoryType](self, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.accessoryCategoryType"));

  -[HMAccessoryCategory name](self, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.accessoryCategoryName"));

}

@end
