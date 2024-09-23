@implementation NSLocaleRegion

- (NSLocaleRegion)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("init not implemented"), CFSTR("Subclasses must implement a valid init method"));
  return -[NSLocaleRegion initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", &stru_1E9DB4A20);
}

- (NSLocaleRegion)initWithLocaleIdentifier:(id)a3
{
  id v4;
  NSLocaleRegion *v5;
  void *v6;
  void *v7;
  void *v8;
  NSLocaleRegion *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NSLocaleRegion;
  v5 = -[NSLocaleRegion init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "countryCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("XKS")))
        {
          -[NSLocaleRegion setTwoCharacterCode:](v5, "setTwoCharacterCode:", CFSTR("XK"));
          -[NSLocaleRegion setThreeCharacterCode:](v5, "setThreeCharacterCode:", CFSTR("XKK"));
        }
        else
        {
          -[NSLocaleRegion setTwoCharacterCode:](v5, "setTwoCharacterCode:", v8);
          objc_msgSend(v7, "threeCharacterRegionCode");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSLocaleRegion setThreeCharacterCode:](v5, "setThreeCharacterCode:", v10);

        }
        v9 = v5;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSLocaleRegion)initWithRegionIdentifier:(id)a3
{
  id v4;
  NSLocaleRegion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLocaleRegion *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSLocaleRegion;
  v5 = -[NSLocaleRegion init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(CFSTR("_"), "stringByAppendingString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeWithLocaleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "countryCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("XKS")))
        {
          -[NSLocaleRegion setTwoCharacterCode:](v5, "setTwoCharacterCode:", CFSTR("XK"));
          -[NSLocaleRegion setThreeCharacterCode:](v5, "setThreeCharacterCode:", CFSTR("XKK"));
        }
        else
        {
          -[NSLocaleRegion setTwoCharacterCode:](v5, "setTwoCharacterCode:", v9);
          objc_msgSend(v8, "threeCharacterRegionCode");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSLocaleRegion setThreeCharacterCode:](v5, "setThreeCharacterCode:", v11);

        }
        v10 = v5;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NSLocaleRegion twoCharacterCode](self, "twoCharacterCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  NSLocaleRegion *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (NSLocaleRegion *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSLocaleRegion twoCharacterCode](self, "twoCharacterCode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSLocaleRegion twoCharacterCode](v4, "twoCharacterCode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)twoCharacterCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTwoCharacterCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)threeCharacterCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setThreeCharacterCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threeCharacterCode, 0);
  objc_storeStrong((id *)&self->_twoCharacterCode, 0);
}

@end
