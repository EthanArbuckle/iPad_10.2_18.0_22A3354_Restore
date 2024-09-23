@implementation APSettingsStorageVolatile

- (APSettingsStorageVolatile)initWithDefaultValues:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  APSettingsStorageVolatile *v8;
  uint64_t v9;
  NSDictionary *defaults;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *volatileData;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APSettingsStorageVolatile;
  v8 = -[APSettingsStorageVolatile init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    defaults = v8->_defaults;
    v8->_defaults = (NSDictionary *)v9;

    v11 = objc_alloc(MEMORY[0x1E0C99E08]);
    v14 = objc_msgSend_initWithCapacity_(v11, v12, 1, v13);
    volatileData = v8->_volatileData;
    v8->_volatileData = (NSMutableDictionary *)v14;

  }
  return v8;
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_valueForKey_error_, a3, 0);
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;

  v5 = a3;
  objc_msgSend_volatileData(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v9, v10, (uint64_t)v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v16 = v12;
  }
  else
  {
    objc_msgSend_defaults(self, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastNamespacedComponent(v5, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v17, v22, (uint64_t)v21, v23);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_setValue_forKey_error_, a3, a4);
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int isEqual;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char *v27;

  v27 = (char *)a3;
  v7 = a4;
  objc_msgSend_defaults(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastNamespacedComponent(v7, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v11, v16, (uint64_t)v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  isEqual = objc_msgSend_isEqual_(v18, v19, (uint64_t)v27, v20);
  objc_msgSend_volatileData(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v27 || isEqual)
    objc_msgSend_setValue_forKey_(v25, v27, 0, (uint64_t)v7);
  else
    objc_msgSend_setObject_forKey_(v25, v27, (uint64_t)v27, (uint64_t)v7);

}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (NSMutableDictionary)volatileData
{
  return self->_volatileData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volatileData, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
