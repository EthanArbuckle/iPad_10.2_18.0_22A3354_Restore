@implementation IMFindMyHandle

+ (id)handleWithFMFHandle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "identifier"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    +[IMFindMyHandle handleWithIdentifier:](IMFindMyHandle, "handleWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)handleWithFMLHandle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "identifier"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    +[IMFindMyHandle handleWithIdentifier:](IMFindMyHandle, "handleWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)handleWithIdentifier:(id)a3
{
  id v3;
  IMFindMyHandle *v4;

  v3 = a3;
  v4 = -[IMFindMyHandle initWithIdentifier:]([IMFindMyHandle alloc], "initWithIdentifier:", v3);

  return v4;
}

- (IMFindMyHandle)initWithIdentifier:(id)a3
{
  id v5;
  IMFindMyHandle *v6;
  IMFindMyHandle *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  FMLHandle *fmlHandle;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IMFindMyHandle;
  v6 = -[IMFindMyHandle init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFindMyLocateSessionEnabled");

    if (v9)
    {
      v10 = MEMORY[0x1A858292C](CFSTR("FMLHandle"), CFSTR("FindMyLocateObjCWrapper"));
      if (v10)
      {
        v11 = (void *)v10;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "handleWithIdentifier:", v5);
          v12 = objc_claimAutoreleasedReturnValue();
          fmlHandle = v7->_fmlHandle;
          v7->_fmlHandle = (FMLHandle *)v12;
LABEL_9:

        }
      }
    }
    else
    {
      v14 = MEMORY[0x1A858292C](CFSTR("FMFHandle"), CFSTR("FMF"));
      if (v14)
      {
        v15 = (void *)v14;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v15, "handleWithId:", v5);
          v16 = objc_claimAutoreleasedReturnValue();
          fmlHandle = v7->_fmfHandle;
          v7->_fmfHandle = (FMFHandle *)v16;
          goto LABEL_9;
        }
      }
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  IMFindMyHandle *v5;
  IMFindMyHandle *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = (IMFindMyHandle *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[IMFindMyHandle identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (-[IMFindMyHandle identifier](v6, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[IMFindMyHandle identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMFindMyHandle identifier](v6, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if (v7)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v10 = 1;
      }

      goto LABEL_11;
    }
    v10 = 0;
  }
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[IMFindMyHandle fmfHandle](self, "fmfHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[IMFindMyHandle fmlHandle](self, "fmlHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IMFindMyHandle identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [%@]>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (FMFHandle)fmfHandle
{
  return self->_fmfHandle;
}

- (FMLHandle)fmlHandle
{
  return self->_fmlHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmlHandle, 0);
  objc_storeStrong((id *)&self->_fmfHandle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
