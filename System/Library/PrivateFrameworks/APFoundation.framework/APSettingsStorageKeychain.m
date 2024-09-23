@implementation APSettingsStorageKeychain

- (APSettingsStorageKeychain)initWithDefaultValues:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  APSettingsStorageKeychain *v8;
  uint64_t v9;
  NSDictionary *defaults;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)APSettingsStorageKeychain;
  v8 = -[APSettingsStorageKeychain init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    defaults = v8->_defaults;
    v8->_defaults = (NSDictionary *)v9;

  }
  return v8;
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v23;
  id v24;
  id v26;

  v26 = 0;
  v6 = a3;
  objc_msgSend_objectForKey_error_(APKeychainServices, v7, (uint64_t)v6, (uint64_t)&v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;
  objc_msgSend_defaults(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastNamespacedComponent(v6, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v13, v18, (uint64_t)v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v21 = 1;
  else
    v21 = v8 == 0;
  if (v21 && v20 != 0)
  {
    v24 = v20;
LABEL_13:
    v23 = v24;
    goto LABEL_14;
  }
  if (!a4 || !v9)
  {
    v24 = v8;
    goto LABEL_13;
  }
  v23 = 0;
  *a4 = objc_retainAutorelease(v9);
LABEL_14:

  return v23;
}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_valueForKey_error_, a3, 0);
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  objc_msgSend_defaults(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastNamespacedComponent(v8, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v12, v17, (uint64_t)v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isEqual_(v19, v20, (uint64_t)v23, v21))
    objc_msgSend_setObject_forKey_error_(APKeychainServices, v22, 0, (uint64_t)v8, a5);
  else
    objc_msgSend_setObject_forKey_error_(APKeychainServices, v22, (uint64_t)v23, (uint64_t)v8, a5);

}

- (void)setValue:(id)a3 forKey:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_setValue_forKey_error_, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
