@implementation NAIdentity

- (BOOL)isObject:(id)a3 equalToObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  uint64_t v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        -[NAIdentity characteristics](self, "characteristics");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v23;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              if ((objc_msgSend(v14, "role") & 2) != 0)
              {
                objc_msgSend(v14, "retrievalBlock");
                v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "comparisonBlock");
                v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, id))v15)[2](v15, v6);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *))v15)[2](v15, v8);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = ((uint64_t (**)(_QWORD, void *, void *))v16)[2](v16, v17, v18);

                if (v19)
                {
                  v9 = 0;
                  goto LABEL_18;
                }
              }
            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v11)
              continue;
            break;
          }
        }
        v9 = 1;
LABEL_18:

      }
      else
      {
        v9 = 0;
      }
    }
  }

  return v9;
}

- (unint64_t)hashOfObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  uint64_t (**v14)(_QWORD, _QWORD);
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NAIdentity characteristics](self, "characteristics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = 17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v11, "role") & 1) != 0)
        {
          objc_msgSend(v11, "retrievalBlock");
          v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v12)[2](v12, v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v11, "hashBlock");
            v14 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v15 = ((uint64_t (**)(_QWORD, void *))v14)[2](v14, v13);

            v9 = v15 - v9 + 32 * v9;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 17;
  }

  return v9;
}

- (NSArray)characteristics
{
  return self->_characteristics;
}

- (NAIdentity)initWithCharacteristics:(id)a3
{
  id v4;
  NAIdentity *v5;
  NAIdentity *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NAIdentity;
  v5 = -[NAIdentity init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NAIdentity setCharacteristics:](v5, "setCharacteristics:", v4);

  return v6;
}

- (void)setCharacteristics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NAIdentity *v4;
  void *v5;
  NAIdentity *v6;

  v4 = +[NAIdentity allocWithZone:](NAIdentity, "allocWithZone:", a3);
  -[NAIdentity characteristics](self, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NAIdentity initWithCharacteristics:](v4, "initWithCharacteristics:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

+ (id)na_identity
{
  if (na_identity_onceToken_0 != -1)
    dispatch_once(&na_identity_onceToken_0, &__block_literal_global_94);
  return (id)na_identity_identity_0;
}

void __25__NAIdentity_na_identity__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[NAIdentityBuilder builder](NAIdentityBuilder, "builder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_97);
  objc_msgSend(v3, "build");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)na_identity_identity_0;
  na_identity_identity_0 = v1;

}

uint64_t __25__NAIdentity_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristics");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristics, 0);
}

@end
