@implementation GEOConfigStorageSQLiteBase

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  __CFString *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  v9 = (__CFString *)a3;
  v10 = a4;
  v11 = objc_msgSend(v10, "length");
  if (!v9
    || !v11
    || (_countrySpecificKeyPathComponents(v10, v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        -[GEOConfigStorageSQLiteBase _instanceSpecificGetKeyPath:](self, "_instanceSpecificGetKeyPath:", v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    if (v9)
      v14 = v9;
    else
      v14 = CFSTR("/");
    -[GEOConfigStorageSQLiteBase _instanceSpecificGetKey:](self, "_instanceSpecificGetKey:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a6 && v13)
    *a6 = self->_source;

  return v13;
}

- (id)initWithSource:(void *)a3 persister:
{
  id v6;
  id *v7;
  objc_super v9;

  v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)GEOConfigStorageSQLiteBase;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

- (void)_instanceSpecificSetValue:(id)a3 forKey:(id)a4
{
  -[GEOConfigStorageSQLiteBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (id)_instanceSpecificGetKey:(id)a3
{
  -[GEOConfigStorageSQLiteBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)_instanceSpecificGetKeyPath:(id)a3
{
  -[GEOConfigStorageSQLiteBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persister, 0);
}

@end
