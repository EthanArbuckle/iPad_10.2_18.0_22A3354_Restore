@implementation CNUserDefaults

- (BOOL)userHasOptedOutOfPreference:(id)a3
{
  _BOOL4 v3;
  char v5;

  v5 = 0;
  v3 = !-[CNUserDefaults BOOLForKey:keyExists:](self, "BOOLForKey:keyExists:", a3, &v5);
  return v5 && v3;
}

+ (id)standardPreferences
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CNUserDefaults_standardPreferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (standardPreferences_cn_once_token_1 != -1)
    dispatch_once(&standardPreferences_cn_once_token_1, block);
  return (id)standardPreferences_cn_once_object_1;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  -[CNUserDefaults objectForKey:](self, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v9;

  v4 = a3;
  v9 = 0;
  v5 = -[CNUserDefaults primitiveIntegerValueForKey:keyExists:](self, "primitiveIntegerValueForKey:keyExists:", v4, &v9);
  if (!v9)
  {
    -[CNUserDefaults registeredDefaults](self, "registeredDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CNUserDefaults primitiveObjectForKey:](self, "primitiveObjectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CNUserDefaults registeredDefaults](self, "registeredDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v7, "copy");

  }
  return v5;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  char v9;

  v4 = a3;
  v9 = 0;
  v5 = -[CNUserDefaults primitiveBoolValueForKey:keyExists:](self, "primitiveBoolValueForKey:keyExists:", v4, &v9);
  if (!v9)
  {
    -[CNUserDefaults registeredDefaults](self, "registeredDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(v7, "BOOLValue");

  }
  return v5;
}

- (NSDictionary)registeredDefaults
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)primitiveBoolValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  return -[CNPrimitiveUserDefaults primitiveBoolValueForKey:keyExists:](self->_primitiveDefaults, "primitiveBoolValueForKey:keyExists:", a3, a4);
}

- (id)primitiveObjectForKey:(id)a3
{
  return (id)-[CNPrimitiveUserDefaults primitiveObjectForKey:](self->_primitiveDefaults, "primitiveObjectForKey:", a3);
}

- (int64_t)primitiveIntegerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  return -[CNPrimitiveUserDefaults primitiveIntegerValueForKey:keyExists:](self->_primitiveDefaults, "primitiveIntegerValueForKey:keyExists:", a3, a4);
}

void __37__CNUserDefaults_standardPreferences__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithApplicationID:", 0);
  v2 = (void *)standardPreferences_cn_once_object_1;
  standardPreferences_cn_once_object_1 = v1;

}

- (CNUserDefaults)initWithApplicationID:(id)a3
{
  id v4;
  CNCFPreferencesPrimitiveUserDefaults *v5;
  CNUserDefaults *v6;

  v4 = a3;
  v5 = -[CNCFPreferencesPrimitiveUserDefaults initWithApplicationID:]([CNCFPreferencesPrimitiveUserDefaults alloc], "initWithApplicationID:", v4);

  v6 = -[CNUserDefaults initWithPrimitiveDefaults:](self, "initWithPrimitiveDefaults:", v5);
  return v6;
}

- (CNUserDefaults)initWithPrimitiveDefaults:(id)a3
{
  id v5;
  CNUserDefaults *v6;
  CNUserDefaults *v7;
  CNUserDefaults *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUserDefaults;
  v6 = -[CNUserDefaults init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_primitiveDefaults, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)preferencesWithApplicationID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithApplicationID:", v4);

  return v5;
}

- (id)primitiveDefaults
{
  return self->_primitiveDefaults;
}

- (void)setPrimitiveObject:(id)a3 forKey:(id)a4
{
  -[CNPrimitiveUserDefaults setPrimitiveObject:forKey:](self->_primitiveDefaults, "setPrimitiveObject:forKey:", a3, a4);
}

- (void)primitiveRemoveObjectForKey:(id)a3
{
  -[CNPrimitiveUserDefaults primitiveRemoveObjectForKey:](self->_primitiveDefaults, "primitiveRemoveObjectForKey:", a3);
}

- (BOOL)synchronize
{
  return -[CNPrimitiveUserDefaults synchronize](self->_primitiveDefaults, "synchronize");
}

- (void)setupAutosync
{
  -[CNPrimitiveUserDefaults setupAutosync](self->_primitiveDefaults, "setupAutosync");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[CNUserDefaults setPrimitiveObject:forKey:](self, "setPrimitiveObject:forKey:", a3, a4);
  -[CNUserDefaults setupAutosync](self, "setupAutosync");
}

- (void)removeObjectForKey:(id)a3
{
  -[CNUserDefaults primitiveRemoveObjectForKey:](self, "primitiveRemoveObjectForKey:", a3);
  -[CNUserDefaults setupAutosync](self, "setupAutosync");
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _QWORD *v4;

  v4 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v4 = (_QWORD *)MEMORY[0x1E0C9AE40];
  -[CNUserDefaults setObject:forKey:](self, "setObject:forKey:", *v4, a4);
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNUserDefaults setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (double)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;

  v4 = a3;
  objc_opt_class();
  -[CNUserDefaults objectForKey:](self, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNUserDefaults setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (void)setRegisteredDefaults:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredDefaults, 0);
  objc_storeStrong((id *)&self->_primitiveDefaults, 0);
}

+ (id)inMemoryPreferences
{
  return objc_alloc_init(_CNInMemoryUserDefaults);
}

@end
