@implementation IMFindMyDevice

+ (id)deviceWithFMFDevice:(id)a3
{
  id v3;
  IMFindMyDevice *v4;

  v3 = a3;
  v4 = -[IMFindMyDevice initWithFMFDevice:fmlDevice:]([IMFindMyDevice alloc], "initWithFMFDevice:fmlDevice:", v3, 0);

  return v4;
}

+ (id)deviceWithFMLDevice:(id)a3
{
  id v3;
  IMFindMyDevice *v4;

  v3 = a3;
  v4 = -[IMFindMyDevice initWithFMFDevice:fmlDevice:]([IMFindMyDevice alloc], "initWithFMFDevice:fmlDevice:", 0, v3);

  return v4;
}

- (IMFindMyDevice)initWithFMFDevice:(id)a3 fmlDevice:(id)a4
{
  id v7;
  id v8;
  IMFindMyDevice *v9;
  IMFindMyDevice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMFindMyDevice;
  v9 = -[IMFindMyDevice init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fmfDevice, a3);
    objc_storeStrong((id *)&v10->_fmlDevice, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  IMFindMyDevice *v5;
  IMFindMyDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v5 = (IMFindMyDevice *)a3;
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
      -[IMFindMyDevice fmfDevice](self, "fmfDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (-[IMFindMyDevice fmfDevice](v6, "fmfDevice"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[IMFindMyDevice fmfDevice](self, "fmfDevice");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMFindMyDevice fmfDevice](v6, "fmfDevice");
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
      -[IMFindMyDevice fmlDevice](self, "fmlDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        || (-[IMFindMyDevice fmlDevice](v6, "fmlDevice"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[IMFindMyDevice fmlDevice](self, "fmlDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMFindMyDevice fmlDevice](v6, "fmlDevice");
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

- (BOOL)isThisDevice
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  -[IMFindMyDevice fmlDevice](self, "fmlDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[IMFindMyDevice fmlDevice](self, "fmlDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v5;
    v9 = objc_msgSend(v5, "isThisDevice");

    return v9;
  }
  -[IMFindMyDevice fmfDevice](self, "fmfDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[IMFindMyDevice fmfDevice](self, "fmfDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return 0;
}

- (NSString)deviceName
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSString *v11;

  -[IMFindMyDevice fmlDevice](self, "fmlDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[IMFindMyDevice fmlDevice](self, "fmlDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v5;
    objc_msgSend(v5, "deviceName");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  -[IMFindMyDevice fmfDevice](self, "fmfDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[IMFindMyDevice fmfDevice](self, "fmfDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:
  if (v9)
    v10 = v9;
  else
    v10 = &stru_1E4725068;
  v11 = v10;

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[IMFindMyDevice fmlDevice](self, "fmlDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[IMFindMyDevice fmfDevice](self, "fmfDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (FMFDevice)fmfDevice
{
  return self->_fmfDevice;
}

- (FMLDevice)fmlDevice
{
  return self->_fmlDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmlDevice, 0);
  objc_storeStrong((id *)&self->_fmfDevice, 0);
}

@end
