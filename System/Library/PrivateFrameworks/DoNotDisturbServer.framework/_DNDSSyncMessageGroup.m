@implementation _DNDSSyncMessageGroup

- (_DNDSSyncMessageGroup)initWithServiceType:(unint64_t)a3 protocolVersion:(unint64_t)a4 store:(id)a5
{
  id v8;
  _DNDSSyncMessageGroup *v9;
  _DNDSSyncMessageGroup *v10;
  uint64_t v11;
  DNDSMutableModeAssertionStore *store;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_DNDSSyncMessageGroup;
  v9 = -[_DNDSSyncMessageGroup init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_protocolVersion = a4;
    v9->_serviceType = a3;
    v11 = objc_msgSend(v8, "copy");
    store = v10->_store;
    v10->_store = (DNDSMutableModeAssertionStore *)v11;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _DNDSSyncMessageGroup *v8;
  _DNDSSyncMessageGroup *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;

  v8 = (_DNDSSyncMessageGroup *)a3;
  if (self == v8)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      -[_DNDSSyncMessageGroup store](self, "store");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DNDSSyncMessageGroup store](v9, "store");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
        goto LABEL_10;
      -[_DNDSSyncMessageGroup store](self, "store");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
      v3 = (void *)v12;
      -[_DNDSSyncMessageGroup store](v9, "store");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v14 = 0;
        goto LABEL_17;
      }
      v4 = (void *)v13;
      -[_DNDSSyncMessageGroup store](self, "store");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DNDSSyncMessageGroup store](v9, "store");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
LABEL_10:
        v15 = -[_DNDSSyncMessageGroup protocolVersion](self, "protocolVersion");
        if (v15 == -[_DNDSSyncMessageGroup protocolVersion](v9, "protocolVersion"))
        {
          v16 = -[_DNDSSyncMessageGroup serviceType](self, "serviceType");
          v14 = v16 == -[_DNDSSyncMessageGroup serviceType](v9, "serviceType");
        }
        else
        {
          v14 = 0;
        }
        if (v10 == v11)
          goto LABEL_18;
      }
      else
      {
        v14 = 0;
      }

LABEL_17:
      goto LABEL_18;
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
  unint64_t v5;
  unint64_t v6;

  -[_DNDSSyncMessageGroup store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[_DNDSSyncMessageGroup protocolVersion](self, "protocolVersion");
  v6 = v5 ^ -[_DNDSSyncMessageGroup serviceType](self, "serviceType") ^ v4;

  return v6;
}

- (DNDSMutableModeAssertionStore)store
{
  return self->_store;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
