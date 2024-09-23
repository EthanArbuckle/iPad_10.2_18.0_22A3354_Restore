@implementation DNDSApplicationConfigurationRecord

- (DNDSApplicationConfigurationRecord)init
{
  return (DNDSApplicationConfigurationRecord *)-[DNDSApplicationConfigurationRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "minimumBreakthroughUrgency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedThreads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deniedThreads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[DNDSApplicationConfigurationRecord _initWithMinimumBreakthroughUrgency:allowedThreads:deniedThreads:](self, "_initWithMinimumBreakthroughUrgency:allowedThreads:deniedThreads:", v5, v6, v7);
  return v8;
}

- (id)_initWithMinimumBreakthroughUrgency:(id)a3 allowedThreads:(id)a4 deniedThreads:(id)a5
{
  id v8;
  id v9;
  id v10;
  DNDSApplicationConfigurationRecord *v11;
  NSSet *v12;
  NSSet *allowedThreads;
  NSSet *v14;
  NSSet *deniedThreads;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDSApplicationConfigurationRecord;
  v11 = -[DNDSApplicationConfigurationRecord init](&v19, sel_init);
  if (v11)
  {
    if (v9)
      v12 = (NSSet *)v9;
    else
      v12 = (NSSet *)objc_opt_new();
    allowedThreads = v11->_allowedThreads;
    v11->_allowedThreads = v12;

    if (v10)
      v14 = (NSSet *)v10;
    else
      v14 = (NSSet *)objc_opt_new();
    deniedThreads = v11->_deniedThreads;
    v11->_deniedThreads = v14;

    v16 = &unk_1E86DE568;
    if (!-[NSSet count](v11->_allowedThreads, "count") && !-[NSSet count](v11->_deniedThreads, "count"))
      v16 = &unk_1E86DE580;
    if (v8)
      v17 = v8;
    else
      v17 = v16;
    objc_storeStrong((id *)&v11->_minimumBreakthroughUrgency, v17);
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[DNDSApplicationConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSApplicationConfigurationRecord allowedThreads](self, "allowedThreads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSApplicationConfigurationRecord deniedThreads](self, "deniedThreads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDSApplicationConfigurationRecord *v5;
  DNDSApplicationConfigurationRecord *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v5 = (DNDSApplicationConfigurationRecord *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DNDSApplicationConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSApplicationConfigurationRecord minimumBreakthroughUrgency](v6, "minimumBreakthroughUrgency");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDSApplicationConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_37;
        }
        v10 = (void *)v9;
        -[DNDSApplicationConfigurationRecord minimumBreakthroughUrgency](v6, "minimumBreakthroughUrgency");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
        -[DNDSApplicationConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSApplicationConfigurationRecord minimumBreakthroughUrgency](v6, "minimumBreakthroughUrgency");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v3))
        {
          v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
        v36 = v3;
        v37 = v12;
        v38 = v11;
        v39 = v10;
      }
      -[DNDSApplicationConfigurationRecord allowedThreads](self, "allowedThreads");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSApplicationConfigurationRecord allowedThreads](v6, "allowedThreads");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSApplicationConfigurationRecord allowedThreads](self, "allowedThreads");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[DNDSApplicationConfigurationRecord allowedThreads](v6, "allowedThreads");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v35 = v14;
            -[DNDSApplicationConfigurationRecord allowedThreads](self, "allowedThreads");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSApplicationConfigurationRecord allowedThreads](v6, "allowedThreads");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isEqual:", v3) & 1) != 0)
            {
              v31 = v19;
              v32 = v18;
              v33 = v17;
LABEL_17:
              -[DNDSApplicationConfigurationRecord deniedThreads](self, "deniedThreads");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSApplicationConfigurationRecord deniedThreads](v6, "deniedThreads");
              v21 = objc_claimAutoreleasedReturnValue();
              if (v20 == (void *)v21)
              {

                v13 = 1;
                v27 = v35;
              }
              else
              {
                v22 = (void *)v21;
                v34 = v3;
                -[DNDSApplicationConfigurationRecord deniedThreads](self, "deniedThreads");
                v23 = objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  v24 = (void *)v23;
                  -[DNDSApplicationConfigurationRecord deniedThreads](v6, "deniedThreads");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25)
                  {
                    v30 = v25;
                    -[DNDSApplicationConfigurationRecord deniedThreads](self, "deniedThreads");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSApplicationConfigurationRecord deniedThreads](v6, "deniedThreads");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = objc_msgSend(v29, "isEqual:", v26);

                    v25 = v30;
                  }
                  else
                  {
                    v13 = 0;
                  }

                }
                else
                {

                  v13 = 0;
                }
                v3 = v34;
                v27 = v35;
              }
              if (v27 != v15)
              {

              }
LABEL_34:
              v11 = v38;
              v10 = v39;
              v3 = v36;
              v12 = v37;
              if (v7 != v8)
                goto LABEL_35;
LABEL_37:

              goto LABEL_38;
            }

            v14 = v35;
          }

        }
        v13 = 0;
        goto LABEL_34;
      }
      v35 = v14;
      goto LABEL_17;
    }
    v13 = 0;
  }
LABEL_38:

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSApplicationConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSApplicationConfigurationRecord allowedThreads](self, "allowedThreads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSApplicationConfigurationRecord deniedThreads](self, "deniedThreads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; minimumBreakthroughUrgency: %@; ; allowedThreads: %@; ; deniedThreads: %@; >"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSApplicationConfigurationRecord _initWithRecord:]([DNDSMutableApplicationConfigurationRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("minimumBreakthroughUrgency"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("allowedThreads"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("deniedThreads"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMinimumBreakthroughUrgency:allowedThreads:deniedThreads:", v6, v9, v12);
  return v13;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "healingSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[DNDSApplicationConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v9, CFSTR("minimumBreakthroughUrgency"));

  -[DNDSApplicationConfigurationRecord allowedThreads](self, "allowedThreads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v11, CFSTR("allowedThreads"));

  -[DNDSApplicationConfigurationRecord deniedThreads](self, "deniedThreads");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v13, CFSTR("deniedThreads"));

  return v8;
}

- (NSNumber)minimumBreakthroughUrgency
{
  return self->_minimumBreakthroughUrgency;
}

- (NSSet)allowedThreads
{
  return self->_allowedThreads;
}

- (NSSet)deniedThreads
{
  return self->_deniedThreads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedThreads, 0);
  objc_storeStrong((id *)&self->_allowedThreads, 0);
  objc_storeStrong((id *)&self->_minimumBreakthroughUrgency, 0);
}

@end
