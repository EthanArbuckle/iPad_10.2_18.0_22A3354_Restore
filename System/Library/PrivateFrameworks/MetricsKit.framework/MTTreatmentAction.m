@implementation MTTreatmentAction

+ (id)treatmentActionWithField:(id)a3 configData:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("treatmentType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("numberDeres")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("urlDeres")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("hash")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("versionDeres")))
    {
      v9 = (objc_class *)objc_opt_class();
    }
    v10 = (void *)objc_msgSend([v9 alloc], "initWithField:configDictionary:", v5, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MTTreatmentAction)initWithField:(id)a3 configDictionary:(id)a4
{
  id v6;
  id v7;
  MTTreatmentAction *v8;
  MTTreatmentAction *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  objc_super v44;

  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)MTTreatmentAction;
  v8 = -[MTTreatmentAction init](&v44, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MTTreatmentAction setField:](v8, "setField:", v6);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sourceField"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTTreatmentAction setSourceField:](v9, "setSourceField:", v10);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("overrideFieldValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTreatmentAction setOverrideFieldValue:](v9, "setOverrideFieldValue:", v11);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("denylisted"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTTreatmentAction setDenylisted:](v9, "setDenylisted:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allowlistedFields"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTTreatmentAction setAllowlistedFields:](v9, "setAllowlistedFields:", v13);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("denylistedFields"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = (void *)v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTTreatmentAction setDenylistedFields:](v9, "setDenylistedFields:", v14);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blacklisted"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !-[MTTreatmentAction denylisted](v9, "denylisted")
      && objc_msgSend(v15, "BOOLValue"))
    {
      -[MTTreatmentAction setDenylisted:](v9, "setDenylisted:", objc_msgSend(v15, "BOOLValue"));
    }
    v42 = v15;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("whitelistedFields"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MTTreatmentAction allowlistedFields](v9, "allowlistedFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)MEMORY[0x24BDBCF00];
        -[MTTreatmentAction allowlistedFields](v9, "allowlistedFields");
        v19 = v16;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v19);
        v38 = v12;
        v40 = v6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "orderedSetWithArray:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "array");
        v23 = v13;
        v24 = v10;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTTreatmentAction setAllowlistedFields:](v9, "setAllowlistedFields:", v25);

        v10 = v24;
        v13 = v23;

        v12 = v38;
        v6 = v40;

        v16 = v19;
      }
      else
      {
        -[MTTreatmentAction setAllowlistedFields:](v9, "setAllowlistedFields:", v16);
      }

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blacklistedFields"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MTTreatmentAction denylistedFields](v9, "denylistedFields");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v37 = v16;
        v28 = (void *)MEMORY[0x24BDBCF00];
        -[MTTreatmentAction denylistedFields](v9, "denylistedFields");
        v41 = v6;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "arrayByAddingObjectsFromArray:", v26);
        v39 = v10;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "orderedSetWithArray:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "array");
        v32 = v13;
        v33 = v12;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTTreatmentAction setDenylistedFields:](v9, "setDenylistedFields:", v34);

        v12 = v33;
        v13 = v32;

        v16 = v37;
        v10 = v39;

        v6 = v41;
      }
      else
      {
        -[MTTreatmentAction setDenylistedFields:](v9, "setDenylistedFields:", v26);
      }

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fieldsMap"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTTreatmentAction setFieldsMap:](v9, "setFieldsMap:", v35);
    -[MTTreatmentAction computeKeyPaths](v9, "computeKeyPaths");

  }
  return v9;
}

- (void)computeKeyPaths
{
  void *v3;
  NSArray *v4;
  NSArray *dstKeyPath;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  NSArray *srcKeyPath;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;

  -[MTTreatmentAction field](self, "field");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dstKeyPath = self->_dstKeyPath;
  self->_dstKeyPath = v4;

  -[MTTreatmentAction sourceField](self, "sourceField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = self->_dstKeyPath;
  if (v7)
  {
    v14 = (NSArray *)-[NSArray mutableCopy](v8, "mutableCopy");
    -[NSArray removeLastObject](v14, "removeLastObject");
    -[MTTreatmentAction sourceField](self, "sourceField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v14, "addObject:", v9);

    v10 = (NSArray *)-[NSArray copy](v14, "copy");
    srcKeyPath = self->_srcKeyPath;
    self->_srcKeyPath = v10;

    v12 = v14;
  }
  else
  {
    v13 = v8;
    v12 = self->_srcKeyPath;
    self->_srcKeyPath = v13;
  }

}

- (void)performActionWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "metrics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MTTreatmentAction performAction:atKeyIndex:context:](self, "performAction:atKeyIndex:context:", v6, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetrics:", v5);

}

- (id)performAction:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  MTTreatmentAction *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  id obj;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[MTTreatmentAction denylisted](self, "denylisted"))
  {
    -[MTTreatmentAction overrideFieldValue](self, "overrideFieldValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MTTreatmentAction overrideFieldValue](self, "overrideFieldValue");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MTTreatmentAction fieldsMap](self, "fieldsMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        v47 = (void *)objc_msgSend(v5, "mutableCopy");
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        -[MTTreatmentAction fieldsMap](self, "fieldsMap");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        if (!v11)
          goto LABEL_30;
        v12 = v11;
        v13 = *(_QWORD *)v57;
        v14 = 0x24BDBC000uLL;
        v44 = *(_QWORD *)v57;
        while (1)
        {
          v15 = 0;
          v45 = v12;
          do
          {
            if (*(_QWORD *)v57 != v13)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v15);
            -[MTTreatmentAction fieldsMap](self, "fieldsMap", v44);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v62 = v18;
              objc_msgSend(*(id *)(v14 + 3632), "arrayWithObjects:count:", &v62, 1);
              v19 = (id)objc_claimAutoreleasedReturnValue();
              if (!v19)
                goto LABEL_28;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_28;
              v19 = v18;
              if (!v19)
                goto LABEL_28;
            }
            v20 = self;
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v21 = v19;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v53;
              while (2)
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v53 != v24)
                    objc_enumerationMutation(v21);
                  objc_msgSend(v5, "mt_nullableValueForKeyPathExt:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (v26)
                  {
                    v27 = (void *)v26;
                    objc_msgSend(v47, "setObject:forKeyedSubscript:", v26, v16);

                    goto LABEL_27;
                  }
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
                if (v23)
                  continue;
                break;
              }
            }
LABEL_27:

            self = v20;
            v13 = v44;
            v12 = v45;
            v14 = 0x24BDBC000;
LABEL_28:

            ++v15;
          }
          while (v15 != v12);
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
          if (!v12)
          {
LABEL_30:

            goto LABEL_32;
          }
        }
      }
      v47 = v5;
LABEL_32:
      -[MTTreatmentAction allowlistedFields](self, "allowlistedFields");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (v29)
      {
        v30 = (void *)MEMORY[0x24BDBCED8];
        -[MTTreatmentAction allowlistedFields](self, "allowlistedFields");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
        v5 = (id)objc_claimAutoreleasedReturnValue();

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        -[MTTreatmentAction allowlistedFields](self, "allowlistedFields");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v49;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v49 != v35)
                objc_enumerationMutation(v32);
              v37 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
              objc_msgSend(v47, "objectForKeyedSubscript:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, v37);

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          }
          while (v34);
        }

      }
      else
      {
        v5 = v47;
      }
      -[MTTreatmentAction denylistedFields](self, "denylistedFields");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");

      if (v40)
      {
        v41 = (void *)objc_msgSend(v5, "mutableCopy");
        -[MTTreatmentAction denylistedFields](self, "denylistedFields");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "removeObjectsForKeys:", v42);

        v5 = v41;
      }
    }
    v5 = v5;
    v6 = v5;
    goto LABEL_45;
  }
  v6 = 0;
LABEL_45:

  return v6;
}

- (id)performAction:(id)a3 atKeyIndex:(int64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  MTTreatmentAction *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[MTTreatmentAction srcKeyPath](self, "srcKeyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 == a4)
  {
    -[MTTreatmentAction performAction:context:](self, "performAction:context:", v8, v9);
    v12 = (MTTreatmentAction *)objc_claimAutoreleasedReturnValue();
LABEL_23:
    self = v12;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  v13 = v8;
  -[MTTreatmentAction srcKeyPath](self, "srcKeyPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTTreatmentAction dstKeyPath](self, "dstKeyPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "hasSuffix:", CFSTR("[]")))
  {
    objc_msgSend(v15, "substringToIndex:", objc_msgSend(v15, "length") - 2);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v18;
      v35 = v17;
      v36 = v13;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v33 = v19;
      v21 = v19;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v38;
        v25 = a4 + 1;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v21);
            -[MTTreatmentAction performAction:atKeyIndex:context:](self, "performAction:atKeyIndex:context:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), v25, v9, v33);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
              objc_msgSend(v20, "addObject:", v27);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v23);
      }

      v17 = v35;
      if (objc_msgSend(v35, "hasSuffix:", CFSTR("[]")))
      {
        objc_msgSend(v35, "substringToIndex:", objc_msgSend(v35, "length") - 2);
        v28 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v28;
      }
      v13 = v36;
      v19 = v33;
      v18 = v34;
      objc_msgSend(v36, "mt_dictionarybyReplacingKey:value:", v17, v20, v33);
      self = (MTTreatmentAction *)objc_claimAutoreleasedReturnValue();

      v29 = 1;
    }
    else
    {
      v29 = 0;
    }

    v15 = (void *)v18;
  }
  else
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTreatmentAction performAction:atKeyIndex:context:](self, "performAction:atKeyIndex:context:", v30, a4 + 1, v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "mt_dictionarybyReplacingKey:value:", v17, v31);
    self = (MTTreatmentAction *)objc_claimAutoreleasedReturnValue();

    v29 = 1;
  }

  if (!v29)
  {
LABEL_22:
    v12 = (MTTreatmentAction *)v8;
    goto LABEL_23;
  }
LABEL_24:

  return self;
}

- (NSString)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
  objc_storeStrong((id *)&self->_field, a3);
}

- (NSString)sourceField
{
  return self->_sourceField;
}

- (void)setSourceField:(id)a3
{
  objc_storeStrong((id *)&self->_sourceField, a3);
}

- (id)overrideFieldValue
{
  return self->_overrideFieldValue;
}

- (void)setOverrideFieldValue:(id)a3
{
  objc_storeStrong(&self->_overrideFieldValue, a3);
}

- (BOOL)denylisted
{
  return self->_denylisted;
}

- (void)setDenylisted:(BOOL)a3
{
  self->_denylisted = a3;
}

- (NSArray)denylistedFields
{
  return self->_denylistedFields;
}

- (void)setDenylistedFields:(id)a3
{
  objc_storeStrong((id *)&self->_denylistedFields, a3);
}

- (NSArray)allowlistedFields
{
  return self->_allowlistedFields;
}

- (void)setAllowlistedFields:(id)a3
{
  objc_storeStrong((id *)&self->_allowlistedFields, a3);
}

- (NSDictionary)fieldsMap
{
  return self->_fieldsMap;
}

- (void)setFieldsMap:(id)a3
{
  objc_storeStrong((id *)&self->_fieldsMap, a3);
}

- (NSArray)dstKeyPath
{
  return self->_dstKeyPath;
}

- (void)setDstKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_dstKeyPath, a3);
}

- (NSArray)srcKeyPath
{
  return self->_srcKeyPath;
}

- (void)setSrcKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_srcKeyPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srcKeyPath, 0);
  objc_storeStrong((id *)&self->_dstKeyPath, 0);
  objc_storeStrong((id *)&self->_fieldsMap, 0);
  objc_storeStrong((id *)&self->_allowlistedFields, 0);
  objc_storeStrong((id *)&self->_denylistedFields, 0);
  objc_storeStrong(&self->_overrideFieldValue, 0);
  objc_storeStrong((id *)&self->_sourceField, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

@end
