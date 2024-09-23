@implementation STSiriContext

- (STSiriContext)initWithModelObjects:(id)a3
{
  id v4;
  STSiriContext *v5;
  STSiriContext *v6;
  uint64_t v7;
  NSArray *modelObjects;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STSiriContext;
  v5 = -[STSiriContext init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(v4, "copy");
      modelObjects = v6->_modelObjects;
      v6->_modelObjects = (NSArray *)v7;
    }
    else
    {
      modelObjects = v5->_modelObjects;
      v5->_modelObjects = (NSArray *)MEMORY[0x1E0C9AA60];
    }

  }
  return v6;
}

- (id)modelObjects
{
  return self->_modelObjects;
}

- (id)_aceValue
{
  unint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  __int128 v9;
  objc_class *v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  __int128 v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0C99000uLL;
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[STSiriContext modelObjects](self, "modelObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[STSiriContext modelObjects](self, "modelObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v38)
  {
    v10 = 0;
    v37 = *(_QWORD *)v48;
    *(_QWORD *)&v9 = 136315394;
    v34 = v9;
    v35 = v8;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v48 != v37)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "_aceCollectionClass", v34);
        if ((objc_class *)v13 != v10)
        {
          v14 = (objc_class *)v13;
          if (v10 && -[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()))
          {
            v15 = objc_alloc_init(v10);
            objc_msgSend(v15, "setDomainObjects:", v7);
            objc_msgSend(v15, "dictionary");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

          }
          else
          {
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            v15 = v7;
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
            if (v17)
            {
              v18 = v17;
              v36 = v7;
              v19 = v3;
              v20 = *(_QWORD *)v44;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v44 != v20)
                    objc_enumerationMutation(v15);
                  objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "dictionary");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v22);

                }
                v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
              }
              while (v18);
              v3 = v19;
              v8 = v35;
              v7 = v36;
            }
          }

          v23 = objc_alloc_init(*(Class *)(v3 + 3560));
          v7 = v23;
          v10 = v14;
        }
        objc_msgSend(v12, "_aceContextObjectValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v7, "addObject:", v24);
        }
        else
        {
          v25 = AFSiriLogContextDaemon;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v34;
            v53 = "-[STSiriContext _aceValue]";
            v54 = 2112;
            v55 = v12;
            _os_log_impl(&dword_19AF50000, v25, OS_LOG_TYPE_INFO, "%s Unable to create context object for Siri model object %@; dropping on floor",
              buf,
              0x16u);
          }
        }

      }
      v38 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v38);

    if (v10 && -[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()))
    {
      v26 = objc_alloc_init(v10);
      objc_msgSend(v26, "setDomainObjects:", v7);
      objc_msgSend(v26, "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v27);

      goto LABEL_37;
    }
  }
  else
  {

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v26 = v7;
  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "dictionary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v32);

      }
      v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v29);
  }
  v7 = v26;
LABEL_37:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_modelObjects, CFSTR("ModelObjects"));
}

- (STSiriContext)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  STSiriContext *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("ModelObjects"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[STSiriContext initWithModelObjects:](self, "initWithModelObjects:", v8);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelObjects, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
