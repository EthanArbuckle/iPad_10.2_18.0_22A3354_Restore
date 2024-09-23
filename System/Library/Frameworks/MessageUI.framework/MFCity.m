@implementation MFCity

- (MFCity)initWithCityName:(id)a3 displayName:(id)a4 timeZone:(id)a5
{
  id v9;
  id v10;
  id v11;
  MFCity *v12;
  MFCity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFCity;
  v12 = -[MFCity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cityName, a3);
    objc_storeStrong((id *)&v13->_displayName, a4);
    objc_storeStrong((id *)&v13->_timeZone, a5);
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[MFCity cityName](self, "cityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[MFCity displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[MFCity timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 33 * (33 * v4 + v6) + objc_msgSend(v7, "hash") + 35937;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  MFCity *v4;
  MFCity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (MFCity *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MFCity cityName](self, "cityName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFCity cityName](v5, "cityName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[MFCity displayName](self, "displayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFCity displayName](v5, "displayName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9))
        {
          -[MFCity timeZone](self, "timeZone");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFCity timeZone](v5, "timeZone");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToTimeZone:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)cityName
{
  return self->_cityName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_cityName, 0);
}

@end
