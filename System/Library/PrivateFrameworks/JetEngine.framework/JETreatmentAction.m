@implementation JETreatmentAction

- (uint64_t)sourceField
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void)performActionWithContext:(id)a3
{
  id v4;
  char *v5;
  id v6;

  v4 = a3;
  -[JETreatmentContext metrics]((uint64_t)v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[JETreatmentAction performAction:atKeyIndex:context:]((id *)&self->super.isa, v6, 0, v4);
  v5 = (char *)objc_claimAutoreleasedReturnValue();
  -[JETreatmentContext setMetrics:](v4, v5);

}

- (id)performAction:(uint64_t)a3 atKeyIndex:(void *)a4 context:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    if (objc_msgSend(a1[10], "count") == a3)
    {
      objc_msgSend(a1, "performAction:context:", v7, v8);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;

      if (v10)
      {
        objc_msgSend(a1[10], "objectAtIndexedSubscript:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[9], "objectAtIndexedSubscript:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hasSuffix:", CFSTR("[]")))
        {
          objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 2);
          v13 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;

          if (v15)
          {
            v31 = v13;
            v32 = v10;
            v33 = v12;
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v30 = v15;
            v20 = v15;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v35;
              v24 = a3 + 1;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v35 != v23)
                    objc_enumerationMutation(v20);
                  -[JETreatmentAction performAction:atKeyIndex:context:](a1, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), v24, v8);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v26)
                    objc_msgSend(v19, "addObject:", v26);

                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
              }
              while (v22);
            }

            v12 = v33;
            if (objc_msgSend(v33, "hasSuffix:", CFSTR("[]")))
            {
              objc_msgSend(v33, "substringToIndex:", objc_msgSend(v33, "length") - 2);
              v27 = objc_claimAutoreleasedReturnValue();

              v12 = (void *)v27;
            }
            v13 = v31;
            v10 = v32;
            v15 = v30;
            v28 = (void *)objc_msgSend(v32, "mutableCopy", v30);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v19, v12);
            a1 = (id *)objc_msgSend(v28, "copy");

          }
          else
          {
            a1 = (id *)v9;
          }

          v11 = (void *)v13;
        }
        else
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[JETreatmentAction performAction:atKeyIndex:context:](a1, v16, a3 + 1, v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v12);
          a1 = (id *)objc_msgSend(v18, "copy");

        }
      }
      else
      {
        a1 = (id *)v9;
      }

    }
  }

  return a1;
}

- (id)performAction:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSDictionary *fieldsMap;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *v14;
  NSDictionary *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *whitelistedFields;
  id v29;
  NSArray *v30;
  void *v31;
  NSArray *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  NSArray *blacklistedFields;
  void *v41;
  NSArray *v42;
  NSDictionary *extractAndReplaceConfig;
  NSDictionary *v44;
  NSDictionary *v45;
  void *v46;
  uint64_t v47;
  id v49;
  void *v50;
  NSDictionary *obj;
  uint64_t v52;
  JETreatmentAction *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self)
    goto LABEL_6;
  if (!self->_blacklisted)
  {
    if (self->_overrideFieldValue)
    {
      v9 = self->_overrideFieldValue;

      v6 = v9;
    }
LABEL_6:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_63:
      v6 = v6;
      v8 = v6;
      goto LABEL_64;
    }
    if (self)
      fieldsMap = self->_fieldsMap;
    else
      fieldsMap = 0;
    v49 = v7;
    if (-[NSDictionary count](fieldsMap, "count"))
    {
      v56 = (void *)objc_msgSend(v6, "mutableCopy");
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      if (self)
        v11 = self->_fieldsMap;
      else
        v11 = 0;
      obj = v11;
      v54 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
      if (v54)
      {
        v52 = *(_QWORD *)v67;
        v53 = self;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v67 != v52)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v12);
            if (self)
              v14 = self->_fieldsMap;
            else
              v14 = 0;
            v15 = v14;
            -[NSDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            v55 = v13;
            v57 = v16;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v72 = v16;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
              v17 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v17 = v16;
              else
                v17 = 0;
            }
            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            v18 = v17;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v63;
              while (2)
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v63 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                  v24 = v6;
                  objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("."));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  NullableValueForKeyPathArray(v24, v25, 0);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v26)
                  {
                    objc_msgSend(v56, "setObject:forKeyedSubscript:", v26, v55);

                    goto LABEL_34;
                  }
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
                if (v20)
                  continue;
                break;
              }
            }
LABEL_34:

            ++v12;
            self = v53;
          }
          while (v12 != v54);
          v27 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
          v54 = v27;
        }
        while (v27);
      }

      v7 = v49;
      if (self)
        goto LABEL_39;
    }
    else
    {
      v56 = v6;
      if (self)
      {
LABEL_39:
        whitelistedFields = self->_whitelistedFields;
        goto LABEL_40;
      }
    }
    whitelistedFields = 0;
LABEL_40:
    if (-[NSArray count](whitelistedFields, "count", v49))
    {
      v29 = objc_alloc(MEMORY[0x1E0C99E08]);
      if (self)
        v30 = self->_whitelistedFields;
      else
        v30 = 0;
      v31 = (void *)objc_msgSend(v29, "initWithCapacity:", -[NSArray count](v30, "count"));
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      if (self)
        v32 = self->_whitelistedFields;
      else
        v32 = 0;
      v33 = v32;
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v59 != v36)
              objc_enumerationMutation(v33);
            v38 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
            objc_msgSend(v56, "objectForKeyedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v39, v38);

          }
          v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        }
        while (v35);
      }

      v7 = v50;
      if (self)
        goto LABEL_53;
    }
    else
    {
      v31 = v56;
      if (self)
      {
LABEL_53:
        blacklistedFields = self->_blacklistedFields;
        goto LABEL_54;
      }
    }
    blacklistedFields = 0;
LABEL_54:
    if (-[NSArray count](blacklistedFields, "count"))
    {
      v41 = (void *)objc_msgSend(v31, "mutableCopy");
      v6 = v41;
      if (self)
        v42 = self->_blacklistedFields;
      else
        v42 = 0;
      objc_msgSend(v41, "removeObjectsForKeys:", v42);

      if (self)
        goto LABEL_58;
    }
    else
    {
      v6 = v31;
      if (self)
      {
LABEL_58:
        extractAndReplaceConfig = self->_extractAndReplaceConfig;
        goto LABEL_59;
      }
    }
    extractAndReplaceConfig = 0;
LABEL_59:
    if (-[NSDictionary count](extractAndReplaceConfig, "count"))
    {
      if (self)
        v44 = self->_extractAndReplaceConfig;
      else
        v44 = 0;
      v45 = v44;
      -[JETreatmentContext metrics]((uint64_t)v7);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[JEExtractAndReplaceField metricsAfterExtractAndReplaceSubFieldWithConfig:metrics:](JEExtractAndReplaceField, "metricsAfterExtractAndReplaceSubFieldWithConfig:metrics:", v45, v46);
      v47 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v47;
    }
    goto LABEL_63;
  }
  v8 = 0;
LABEL_64:

  return v8;
}

+ (id)treatmentActionWithField:(id)a3 configuration:(id)a4 topic:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  JEHashTreatmentAction *v14;
  __objc2_class *v15;
  JEHashTreatmentAction *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("treatmentType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (objc_msgSend(v13, "isEqualToString:", CFSTR("numberDeres")))
    {
      v15 = JEDeresNumberTreatmentAction;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("urlDeres")))
    {
      v15 = JEDeresURLTreatmentAction;
    }
    else
    {
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("hash")))
      {
        v16 = -[JEHashTreatmentAction initWithField:configuration:topic:]([JEHashTreatmentAction alloc], "initWithField:configuration:topic:", v7, v11, v9);
LABEL_23:
        v14 = v16;

        goto LABEL_24;
      }
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("versionDeres")))
      {
        v15 = JEDeresVersionTreatmentAction;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("impressionDurationFilter")))
      {
        v15 = JEImpressionDurationFilteringTreatmentAction;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("allowList")))
      {
        v15 = _TtC9JetEngine33AllowedFieldValuesTreatmentAction;
      }
      else
      {
        v15 = JETreatmentAction;
      }
    }
    v16 = (JEHashTreatmentAction *)objc_msgSend([v15 alloc], "initWithField:configuration:", v7, v11);
    goto LABEL_23;
  }
  v14 = 0;
LABEL_24:

  return v14;
}

- (JETreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  JETreatmentAction *v8;
  uint64_t v9;
  NSString *field;
  void *v11;
  id v12;
  uint64_t v13;
  NSString *sourceField;
  uint64_t v15;
  id overrideFieldValue;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSArray *whitelistedFields;
  void *v23;
  id v24;
  uint64_t v25;
  NSArray *blacklistedFields;
  void *v27;
  id v28;
  uint64_t v29;
  NSDictionary *fieldsMap;
  void *v31;
  id v32;
  uint64_t v33;
  NSDictionary *extractAndReplaceConfig;
  NSString *v35;
  uint64_t v36;
  NSArray *destinationKeyPath;
  uint64_t v38;
  NSArray *v39;
  NSArray *v40;
  uint64_t v41;
  NSArray *sourceKeyPath;
  NSArray *v43;
  void *v45;
  objc_super v46;

  v6 = a3;
  v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)JETreatmentAction;
  v8 = -[JETreatmentAction init](&v46, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    field = v8->_field;
    v8->_field = (NSString *)v9;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sourceField"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    v13 = objc_msgSend(v12, "copy");
    sourceField = v8->_sourceField;
    v8->_sourceField = (NSString *)v13;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("overrideFieldValue"));
    v15 = objc_claimAutoreleasedReturnValue();
    overrideFieldValue = v8->_overrideFieldValue;
    v8->_overrideFieldValue = (id)v15;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blacklisted"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    v8->_blacklisted = objc_msgSend(v18, "BOOLValue");
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("whitelistedFields"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    v21 = objc_msgSend(v20, "copy");
    whitelistedFields = v8->_whitelistedFields;
    v8->_whitelistedFields = (NSArray *)v21;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blacklistedFields"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    v25 = objc_msgSend(v24, "copy");
    blacklistedFields = v8->_blacklistedFields;
    v8->_blacklistedFields = (NSArray *)v25;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fieldsMap"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;

    v29 = objc_msgSend(v28, "copy");
    fieldsMap = v8->_fieldsMap;
    v8->_fieldsMap = (NSDictionary *)v29;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extractAndReplace"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;
    else
      v32 = 0;

    v33 = objc_msgSend(v32, "copy");
    extractAndReplaceConfig = v8->_extractAndReplaceConfig;
    v8->_extractAndReplaceConfig = (NSDictionary *)v33;

    v35 = v8->_field;
    -[NSString componentsSeparatedByString:](v35, "componentsSeparatedByString:", CFSTR("."));
    v36 = objc_claimAutoreleasedReturnValue();
    destinationKeyPath = v8->_destinationKeyPath;
    v8->_destinationKeyPath = (NSArray *)v36;

    v38 = -[NSString length](v8->_sourceField, "length");
    v39 = v8->_destinationKeyPath;
    if (v38)
    {
      v40 = (NSArray *)-[NSArray mutableCopy](v39, "mutableCopy");
      -[NSArray removeLastObject](v40, "removeLastObject");
      -[NSArray addObject:](v40, "addObject:", v8->_sourceField);
      v41 = -[NSArray copy](v40, "copy");
      sourceKeyPath = v8->_sourceKeyPath;
      v8->_sourceKeyPath = (NSArray *)v41;

    }
    else
    {
      v43 = v39;
      v40 = v8->_sourceKeyPath;
      v8->_sourceKeyPath = v43;
    }

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceKeyPath, 0);
  objc_storeStrong((id *)&self->_destinationKeyPath, 0);
  objc_storeStrong((id *)&self->_extractAndReplaceConfig, 0);
  objc_storeStrong((id *)&self->_fieldsMap, 0);
  objc_storeStrong((id *)&self->_whitelistedFields, 0);
  objc_storeStrong((id *)&self->_blacklistedFields, 0);
  objc_storeStrong(&self->_overrideFieldValue, 0);
  objc_storeStrong((id *)&self->_sourceField, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

@end
