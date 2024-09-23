@implementation IMFindMyLocation

+ (id)locationWithFMFLocation:(id)a3 fmlLocation:(id)a4
{
  id v5;
  id v6;
  IMFindMyLocation *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[IMFindMyLocation initWithFMFLocation:fmlLocation:]([IMFindMyLocation alloc], "initWithFMFLocation:fmlLocation:", v6, v5);

  return v7;
}

+ (id)locationWithFMFLocation:(id)a3
{
  id v3;
  IMFindMyLocation *v4;

  v3 = a3;
  v4 = -[IMFindMyLocation initWithFMFLocation:fmlLocation:]([IMFindMyLocation alloc], "initWithFMFLocation:fmlLocation:", v3, 0);

  return v4;
}

+ (id)locationWithFMLLocation:(id)a3
{
  id v3;
  IMFindMyLocation *v4;

  v3 = a3;
  v4 = -[IMFindMyLocation initWithFMFLocation:fmlLocation:]([IMFindMyLocation alloc], "initWithFMFLocation:fmlLocation:", 0, v3);

  return v4;
}

- (IMFindMyLocation)initWithFMFLocation:(id)a3 fmlLocation:(id)a4
{
  id v7;
  id v8;
  IMFindMyLocation *v9;
  IMFindMyLocation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMFindMyLocation;
  v9 = -[IMFindMyLocation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fmfLocation, a3);
    objc_storeStrong((id *)&v10->_fmlLocation, a4);
  }

  return v10;
}

- (NSString)shortAddress
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;

  -[IMFindMyLocation fmlLocation](self, "fmlLocation");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[IMFindMyLocation fmlLocation](self, "fmlLocation"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    -[IMFindMyLocation fmlLocation](self, "fmlLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coarseAddressLabel");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IMFindMyLocation fmfLocation](self, "fmfLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
    {
      v11 = 0;
      return (NSString *)v11;
    }
    -[IMFindMyLocation fmfLocation](self, "fmfLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortAddress");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v8;

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  IMFindMyLocation *v5;
  IMFindMyLocation *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v5 = (IMFindMyLocation *)a3;
  if (v5 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[IMFindMyLocation fmfLocation](self, "fmfLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (-[IMFindMyLocation fmfLocation](v6, "fmfLocation"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[IMFindMyLocation fmfLocation](self, "fmfLocation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMFindMyLocation fmfLocation](v6, "fmfLocation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v7)
        {

          if (v10)
            goto LABEL_7;
        }
        else
        {

          if ((v10 & 1) != 0)
            goto LABEL_7;
        }
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_7:
      -[IMFindMyLocation fmlLocation](self, "fmlLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        || (-[IMFindMyLocation fmlLocation](v6, "fmlLocation"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[IMFindMyLocation fmlLocation](self, "fmlLocation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMFindMyLocation fmlLocation](v6, "fmlLocation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (v11)
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        v14 = 1;
      }

      goto LABEL_17;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[IMFindMyLocation fmfLocation](self, "fmfLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[IMFindMyLocation fmlLocation](self, "fmlLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (FMFLocation)fmfLocation
{
  return self->_fmfLocation;
}

- (FMLLocation)fmlLocation
{
  return self->_fmlLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmlLocation, 0);
  objc_storeStrong((id *)&self->_fmfLocation, 0);
}

@end
