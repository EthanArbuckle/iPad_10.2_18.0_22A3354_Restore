@implementation MOUserSafetyScanningPolicySettingMetadata

- (id)valueFromPersistableValue:(id)a3
{
  return +[MOUserSafetyScanningPolicy initializeWithPersistableValue:](MOUserSafetyScanningPolicy, "initializeWithPersistableValue:", a3);
}

- (id)persistableValueFromValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "persistableValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (MOUserSafetyScanningPolicy)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOUserSafetyScanningPolicySettingMetadata;
  -[MOSettingMetadata defaultValue](&v3, sel_defaultValue);
  return (MOUserSafetyScanningPolicy *)(id)objc_claimAutoreleasedReturnValue();
}

- (MOUserSafetyScanningPolicySettingMetadata)initWithSettingName:(id)a3 defaultPolicy:(id)a4 interventionCombineOperator:(int64_t)a5 rankedInterventionTypes:(id)a6 maximumApplicationCount:(unint64_t)a7 isPublic:(BOOL)a8 scope:(id)a9 isPrivacySensitive:(BOOL)a10
{
  _BOOL8 v10;
  NSDictionary *v16;
  MOUserSafetyScanningPolicySettingMetadata *v17;
  NSDictionary *rankedInterventionTypes;
  objc_super v20;

  v10 = a8;
  v16 = (NSDictionary *)a6;
  v20.receiver = self;
  v20.super_class = (Class)MOUserSafetyScanningPolicySettingMetadata;
  v17 = -[MOSettingMetadata initWithSettingName:defaultValue:isPublic:scope:isPrivacySensitive:](&v20, sel_initWithSettingName_defaultValue_isPublic_scope_isPrivacySensitive_, a3, a4, v10, a9, a10);
  v17->_interventionCombineOperator = a5;
  rankedInterventionTypes = v17->_rankedInterventionTypes;
  v17->_rankedInterventionTypes = v16;

  v17->_maximumApplicationCount = a7;
  return v17;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t maximumApplicationCount;
  id v9;

  v4 = a3;
  if (+[MOUserSafetyScanningPolicy isValidPersistableRepresentation:](MOUserSafetyScanningPolicy, "isValidPersistableRepresentation:", v4))
  {
    +[MOUserSafetyScanningPolicy initializeWithPersistableValue:](MOUserSafetyScanningPolicy, "initializeWithPersistableValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    maximumApplicationCount = self->_maximumApplicationCount;

    if (v7 <= maximumApplicationCount)
      v9 = v4;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  -[MOUserSafetyScanningPolicySettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOUserSafetyScanningPolicySettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!v8)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v13 = v8;
    goto LABEL_7;
  }
  if (!v8)
  {
    v13 = v7;
LABEL_7:
    v12 = v13;
    goto LABEL_9;
  }
  +[MOUserSafetyScanningPolicy initializeWithPersistableValue:](MOUserSafetyScanningPolicy, "initializeWithPersistableValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOUserSafetyScanningPolicy initializeWithPersistableValue:](MOUserSafetyScanningPolicy, "initializeWithPersistableValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOUserSafetyScanningPolicySettingMetadata _combine:with:](self, "_combine:with:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistableValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

- (id)_combine:(id)a3 with:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  MOUserSafetyScanningPolicy *v15;
  uint64_t v16;
  MOUserSafetyScanningPolicy *v17;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id obj;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "policy");
  if (v10 != 2)
  {
    if (v10 != 1)
    {
      if (v10)
        goto LABEL_12;
      goto LABEL_13;
    }
    v16 = objc_msgSend(v9, "policy");
    if (v16 == 2)
    {
LABEL_13:
      v17 = (MOUserSafetyScanningPolicy *)v9;
      goto LABEL_14;
    }
    if (v16 != 1)
    {
      if (!v16)
        goto LABEL_11;
      goto LABEL_12;
    }
    v46 = v8;
    objc_msgSend(v8, "allServices");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v49 = v9;
    objc_msgSend(v9, "allServices");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (!v21)
      goto LABEL_31;
    v22 = v21;
    v23 = *(_QWORD *)v55;
    while (1)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v55 != v23)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v20, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          objc_msgSend(v49, "allServices");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, v25);
LABEL_28:

          goto LABEL_29;
        }
        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "objectForKeyedSubscript:", v25);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v5, "BOOLValue");
        if (v28)
        {
          objc_msgSend(v49, "allServices");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v25);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v4, "BOOLValue");
        }
        else
        {
          v29 = 0;
        }
        objc_msgSend(v27, "numberWithInt:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, v25);

        if (v28)
        {

          v30 = v9;
          goto LABEL_28;
        }
LABEL_29:

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (!v22)
      {
LABEL_31:

        objc_msgSend(v46, "allApplications");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v32, "mutableCopy");

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v49, "allApplications");
        v47 = (id)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (!v34)
          goto LABEL_46;
        v35 = v34;
        v36 = *(_QWORD *)v51;
        while (1)
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v51 != v36)
              objc_enumerationMutation(v47);
            v38 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
            objc_msgSend(v33, "objectForKeyedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v39)
            {
              objc_msgSend(v49, "allApplications");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectForKeyedSubscript:", v38);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v44, v38);
LABEL_43:

              goto LABEL_44;
            }
            v40 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v33, "objectForKeyedSubscript:", v38);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "BOOLValue");
            if (v42)
            {
              objc_msgSend(v49, "allApplications");
              obj = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "objectForKeyedSubscript:", v38);
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v5, "BOOLValue");
            }
            else
            {
              v43 = 0;
            }
            objc_msgSend(v40, "numberWithInt:", v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v45, v38);

            if (v42)
            {

              v44 = obj;
              goto LABEL_43;
            }
LABEL_44:

          }
          v35 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          if (!v35)
          {
LABEL_46:

            v15 = -[MOUserSafetyScanningPolicy initWithAllServices:allApplications:interventionType:]([MOUserSafetyScanningPolicy alloc], "initWithAllServices:allApplications:interventionType:", v20, v33, 0);
            v8 = v46;
            v9 = v49;
            goto LABEL_15;
          }
        }
      }
    }
  }
  v11 = objc_msgSend(v9, "policy");
  if (v11 < 2)
  {
LABEL_11:
    v17 = (MOUserSafetyScanningPolicy *)v8;
LABEL_14:
    v15 = v17;
    goto LABEL_15;
  }
  if (v11 != 2)
  {
LABEL_12:
    v15 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v8, "interventionType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interventionType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOUserSafetyScanningPolicySettingMetadata _combineInterventionType:with:](self, "_combineInterventionType:with:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[MOUserSafetyScanningPolicy initWithAllServices:allApplications:interventionType:]([MOUserSafetyScanningPolicy alloc], "initWithAllServices:allApplications:interventionType:", 0, 0, v14);
LABEL_15:

  return v15;
}

- (id)_combineInterventionType:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t interventionCombineOperator;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_rankedInterventionTypes, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_rankedInterventionTypes, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  interventionCombineOperator = self->_interventionCombineOperator;
  if (interventionCombineOperator == 1)
  {
    v13 = objc_msgSend(v8, "integerValue");
    v12 = v13 > objc_msgSend(v9, "integerValue");
  }
  else
  {
    if (interventionCombineOperator)
      goto LABEL_9;
    v11 = objc_msgSend(v8, "integerValue");
    v12 = v11 < objc_msgSend(v9, "integerValue");
  }
  if (v12)
    v14 = v6;
  else
    v14 = v7;
  self = v14;
LABEL_9:

  return self;
}

- (int64_t)interventionCombineOperator
{
  return self->_interventionCombineOperator;
}

- (NSDictionary)rankedInterventionTypes
{
  return self->_rankedInterventionTypes;
}

- (unint64_t)maximumApplicationCount
{
  return self->_maximumApplicationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedInterventionTypes, 0);
}

@end
