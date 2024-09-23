@implementation GEOAvailableExperimentBranch

- (GEOAvailableExperimentBranch)initWithLabel:(id)a3 name:(id)a4 experimentIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOAvailableExperimentBranch *v11;
  uint64_t v12;
  NSString *label;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *experimentIdentifier;
  GEOAvailableExperimentBranch *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)GEOAvailableExperimentBranch;
  v11 = -[GEOAvailableExperimentBranch init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    label = v11->_label;
    v11->_label = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    experimentIdentifier = v11->_experimentIdentifier;
    v11->_experimentIdentifier = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)description
{
  return -[GEOAvailableExperimentBranch _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  void *i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  GEOAvailableExperimentBranch *v21;
  NSMutableArray *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E1C241D0);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
    objc_msgSend(i, "appendString:", CFSTR("\t"));
  v6 = (void *)MEMORY[0x1E0CB37A0];
  v27.receiver = self;
  v27.super_class = (Class)GEOAvailableExperimentBranch;
  -[GEOAvailableExperimentBranch description](&v27, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@ %@\n"), v7, self->_label, self->_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = self;
  obj = self->_assignments;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        if (objc_msgSend(v13, "serviceType") == 1)
        {
          v14 = (void *)MEMORY[0x1E0CB3940];
          v15 = objc_msgSend(v13, "placeRequestType");
          if (v15 >= 0x3F)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = off_1E1C0E0C8[(int)v15];
          }
          objc_msgSend(v14, "stringWithFormat:", CFSTR("Dispatcher.%@"), v16);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = objc_msgSend(v13, "serviceType");
          if (v17 >= 4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = off_1E1C0E2C0[(int)v17];
          }
        }
        objc_msgSend(v8, "appendString:", i);
        objc_msgSend(v13, "querySubstring");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendFormat:", CFSTR("\t+> %@ - %@\n"), v18, v19);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v10);
  }

  if (v21->_clientConfig)
  {
    objc_msgSend(v8, "appendString:", i);
    objc_msgSend(v8, "appendFormat:", CFSTR("\t+> CLIENT - %@"), v21->_clientConfig);
  }

  return v8;
}

- (void)_addAssignment:(id)a3
{
  id v4;
  NSMutableArray *assignments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  assignments = self->_assignments;
  v8 = v4;
  if (!assignments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_assignments;
    self->_assignments = v6;

    v4 = v8;
    assignments = self->_assignments;
  }
  -[NSMutableArray addObject:](assignments, "addObject:", v4);

}

- (id)querySubstringForType:(int64_t)a3 dispatcherRequestType:(int)a4
{
  BOOL v5;
  int v6;
  BOOL v7;
  int v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  int v16;
  BOOL v17;
  char v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3 != 2 && a3 == 1;
  if (a3 == 2)
    v6 = 2;
  else
    v6 = a3 == 1;
  v7 = a3 != 3 && v5;
  if (a3 == 3)
    v8 = 3;
  else
    v8 = v6;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = self->_assignments;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    v13 = !v7;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "serviceType", (_QWORD)v21);
        v17 = v16 == v8;
        if (v16 == v8)
          v18 = v13;
        else
          v18 = 1;
        if ((v18 & 1) == 0)
          v17 = objc_msgSend(v15, "placeRequestType") == a4;
        if (v17)
        {
          objc_msgSend(v15, "querySubstring");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_28:

  return v19;
}

- (NSDictionary)clientConfigValues
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_clientConfig, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_clientConfig, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = self->_clientConfig;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v9, "hasAbConfigKey", (_QWORD)v16)
            && objc_msgSend(v9, "hasAbConfigValue"))
          {
            objc_msgSend(v9, "abConfigValue");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            switch(objc_msgSend(v9, "abConfigValueType"))
            {
              case 1u:
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "intValue"));
                v11 = objc_claimAutoreleasedReturnValue();
                goto LABEL_14;
              case 2u:
                v12 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v10, "doubleValue");
                objc_msgSend(v12, "numberWithDouble:");
                v11 = objc_claimAutoreleasedReturnValue();
                goto LABEL_14;
              case 3u:
                objc_msgSend(v10, "stringValue");
                v11 = objc_claimAutoreleasedReturnValue();
                goto LABEL_14;
              case 4u:
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "BOOLValue"));
                v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
                v13 = (void *)v11;
                if (v11)
                {
                  objc_msgSend(v9, "abConfigKey");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v14);

                }
                break;
              default:
                break;
            }

          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  return (NSDictionary *)v3;
}

- (NSDictionary)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *experimentIdentifier;
  NSString *label;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  experimentIdentifier = self->_experimentIdentifier;
  if (experimentIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", experimentIdentifier, CFSTR("ExperimentID"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", label, CFSTR("BranchLabel"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_assignments;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "serviceType", (_QWORD)v21) - 1;
        if (v13 < 3)
          v14 = v13 + 1;
        else
          v14 = 0;
        v15 = objc_msgSend(v12, "placeRequestType");
        objc_msgSend(v12, "querySubstring");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _GEOSetQueryForExperimentTypeInDictionary(v4, v14, v15, v16);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  -[GEOAvailableExperimentBranch clientConfigValues](self, "clientConfigValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("ClientConfig"));
  if (objc_msgSend(v4, "count", (_QWORD)v21))
    v18 = v4;
  else
    v18 = 0;
  v19 = v18;

  return v19;
}

- (BOOL)isActive
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  _getValue(GeoServicesConfig_DebugActiveExperimentBranch, (uint64_t)off_1EDF4DB88, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ExperimentID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", self->_experimentIdentifier))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BranchLabel"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", self->_label);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)_clientConfig
{
  return self->_clientConfig;
}

- (void)_setClientConfig:(id)a3
{
  objc_storeStrong((id *)&self->_clientConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConfig, 0);
  objc_storeStrong((id *)&self->_assignments, 0);
  objc_storeStrong((id *)&self->_experimentIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
