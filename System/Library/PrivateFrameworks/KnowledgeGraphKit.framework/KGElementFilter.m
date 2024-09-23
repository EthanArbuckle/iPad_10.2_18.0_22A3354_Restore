@implementation KGElementFilter

- (KGElementFilter)initWithRequiredLabels:(id)a3 optionalLabels:(id)a4 properties:(id)a5
{
  id v9;
  id v10;
  id v11;
  KGElementFilter *v12;
  KGElementFilter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)KGElementFilter;
  v12 = -[KGElementFilter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requiredLabels, a3);
    objc_storeStrong((id *)&v13->_optionalLabels, a4);
    objc_storeStrong((id *)&v13->_properties, a5);
  }

  return v13;
}

- (BOOL)noLabelsOrProperties
{
  return !-[NSArray count](self->_requiredLabels, "count")
      && !-[NSArray count](self->_optionalLabels, "count")
      && -[NSDictionary count](self->_properties, "count") == 0;
}

- (BOOL)matchesElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "labels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[KGElementFilter matchesLabels:](self, "matchesLabels:", v6);

  if (v7)
  {
    objc_msgSend(v4, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[KGElementFilter matchesProperties:](self, "matchesProperties:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)matchesLabels:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  BOOL v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
  v11 = 0;
  if (!-[NSArray count](self->_requiredLabels, "count")
    || (v6 = -[NSArray count](self->_requiredLabels, "count"), v6 <= objc_msgSend(v4, "count"))
    && (v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_requiredLabels),
        v8 = objc_msgSend(v7, "isSubsetOfSet:", v5),
        v7,
        v8))
  {
    if (!-[NSArray count](self->_optionalLabels, "count")
      || (v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_optionalLabels),
          v10 = objc_msgSend(v5, "intersectsSet:", v9),
          v9,
          v10))
    {
      v11 = 1;
    }
  }

  return v11;
}

- (BOOL)matchesProperties:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  id v18;
  void *v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v37;
  id v38;
  NSDictionary *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[16];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSDictionary count](self->_properties, "count"))
  {
    v5 = -[NSDictionary count](self->_properties, "count");
    if (v5 <= objc_msgSend(v4, "count"))
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v7 = self->_properties;
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v47;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v47 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v11);
            -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v12, v37);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "kgPropertyValue");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v16 = objc_msgSend(v13, "containsObject:", v15);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = v13;
                objc_msgSend(v18, "value");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                switch(objc_msgSend(v18, "comparator"))
                {
                  case 0:
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "KGBinaryPredicate is KGPredicateComparator_None", buf, 2u);
                    }
                    goto LABEL_55;
                  case 1:
                    v20 = objc_msgSend(v19, "isEqual:", v15);

                    if ((v20 & 1) == 0)
                      goto LABEL_56;
                    goto LABEL_50;
                  case 2:
                    v21 = objc_msgSend(v19, "isEqual:", v15);

                    if ((v21 & 1) != 0)
                      goto LABEL_56;
                    goto LABEL_50;
                  case 3:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_55;
                    v22 = objc_msgSend(v15, "compare:", v19);

                    if (v22 != -1)
                      goto LABEL_56;
                    goto LABEL_50;
                  case 4:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_55;
                    v23 = objc_msgSend(v15, "compare:", v19);

                    if (v23 == 1)
                      goto LABEL_56;
                    goto LABEL_50;
                  case 5:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_55;
                    v24 = objc_msgSend(v15, "compare:", v19);

                    if (v24 != 1)
                      goto LABEL_56;
                    goto LABEL_50;
                  case 6:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_55;
                    v25 = objc_msgSend(v15, "compare:", v19);

                    if (v25 == -1)
                      goto LABEL_56;
                    goto LABEL_50;
                  case 7:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_55;
                    v26 = objc_msgSend(v15, "compare:options:", v19, 1);

                    if (v26)
                      goto LABEL_56;
                    goto LABEL_50;
                  case 8:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_55;
                    v38 = v18;
                    v39 = v7;
                    v27 = v15;
                    v28 = v19;
                    v29 = v27;
                    v37 = v28;
                    v30 = v28;
                    v41 = 0u;
                    v42 = 0u;
                    v43 = 0u;
                    v44 = 0u;
                    obj = v29;
                    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
                    if (!v31)
                      goto LABEL_48;
                    v32 = v31;
                    v33 = *(_QWORD *)v42;
                    break;
                  default:
                    goto LABEL_49;
                }
                while (2)
                {
                  for (i = 0; i != v32; ++i)
                  {
                    if (*(_QWORD *)v42 != v33)
                      objc_enumerationMutation(obj);
                    if (!objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "compare:options:", v30, 1, v37))
                    {
LABEL_48:

                      v18 = v38;
                      v7 = v39;
                      v19 = v37;
LABEL_49:

LABEL_50:
                      goto LABEL_14;
                    }
                  }
                  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
                  if (v32)
                    continue;
                  break;
                }
                v15 = obj;

                v19 = v30;
                v18 = v38;
                v7 = v39;
LABEL_55:

LABEL_56:
LABEL_57:
                v6 = 0;
                goto LABEL_58;
              }
              v16 = objc_msgSend(v15, "isEqual:", v13);
            }
            v17 = v16;

            if ((v17 & 1) == 0)
              goto LABEL_57;
LABEL_14:
            ++v11;
          }
          while (v11 != v9);
          v35 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          v9 = v35;
        }
        while (v35);
      }
      v6 = 1;
LABEL_58:

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  KGElementFilter *v4;
  KGElementFilter *v5;
  BOOL v6;

  v4 = (KGElementFilter *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (-[KGElementFilter isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[NSArray isEqualToArray:](self->_requiredLabels, "isEqualToArray:", v5->_requiredLabels)
      && -[NSArray isEqualToArray:](self->_optionalLabels, "isEqualToArray:", v5->_optionalLabels)
      && -[NSDictionary isEqualToDictionary:](self->_properties, "isEqualToDictionary:", v5->_properties);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[NSArray hash](self->_requiredLabels, "hash") + 2654435769;
  v4 = (-[NSArray hash](self->_optionalLabels, "hash") + (v3 << 6) + (v3 >> 2) + 2654435769u) ^ v3;
  return (-[NSDictionary hash](self->_properties, "hash") + (v4 << 6) + (v4 >> 2) + 2654435769u) ^ v4;
}

- (NSArray)requiredLabels
{
  return self->_requiredLabels;
}

- (NSArray)optionalLabels
{
  return self->_optionalLabels;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (BOOL)includeTombstones
{
  return self->_includeTombstones;
}

- (void)setIncludeTombstones:(BOOL)a3
{
  self->_includeTombstones = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_optionalLabels, 0);
  objc_storeStrong((id *)&self->_requiredLabels, 0);
}

+ (id)any
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithRequiredLabels:optionalLabels:properties:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70]);
}

@end
