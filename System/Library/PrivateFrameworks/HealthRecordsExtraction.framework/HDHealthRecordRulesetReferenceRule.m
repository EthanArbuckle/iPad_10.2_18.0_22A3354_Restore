@implementation HDHealthRecordRulesetReferenceRule

- (HDHealthRecordRulesetReferenceRule)initWithKeyPath:(id)a3 allowedTypes:(id)a4 disallowedTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDHealthRecordRulesetReferenceRule *v11;
  uint64_t v12;
  NSString *keyPath;
  uint64_t v14;
  NSSet *allowedResourceTypes;
  uint64_t v16;
  NSSet *disallowedResourceTypes;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDHealthRecordRulesetReferenceRule;
  v11 = -[HDHealthRecordRulesetReferenceRule init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    keyPath = v11->_keyPath;
    v11->_keyPath = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    allowedResourceTypes = v11->_allowedResourceTypes;
    v11->_allowedResourceTypes = (NSSet *)v14;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    disallowedResourceTypes = v11->_disallowedResourceTypes;
    v11->_disallowedResourceTypes = (NSSet *)v16;

  }
  return v11;
}

+ (id)referenceRulesetsForRules:(id)a3 error:(id *)a4
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  __CFString *v24;
  id v25;
  __CFString *v26;
  id v27;
  HDHealthRecordRulesetReferenceRule *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = 0x24BDBC000uLL;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v44;
    v35 = v7;
    v36 = v6;
    v31 = *(_QWORD *)v44;
    while (2)
    {
      v11 = 0;
      v32 = v9;
      do
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v11);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(","));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v14, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("No contained resource type specified for reference rule for key path %@"), v12);
LABEL_31:

          v29 = 0;
          goto LABEL_32;
        }
        v38 = v12;
        v33 = v11;
        v15 = objc_alloc_init(*(Class *)(v5 + 3768));
        v16 = objc_alloc_init(*(Class *)(v5 + 3768));
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v34 = v14;
        v17 = v14;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v40;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v40 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringByTrimmingCharactersInSet:", v23);
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

              if (-[__CFString length](v24, "length"))
              {
                v25 = v15;
                if (-[__CFString hasPrefix:](v24, "hasPrefix:", CFSTR("!"))
                  && (unint64_t)-[__CFString length](v24, "length") >= 2)
                {
                  -[__CFString substringFromIndex:](v24, "substringFromIndex:", 1);
                  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  if (-[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("Any")))
                  {
                    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("I'm afraid you're not allowed to specify \"!%@\"), CFSTR("Any"));
                    v27 = v25;
                    goto LABEL_30;
                  }
                  v27 = v16;

                }
                else
                {
                  v26 = v24;
                  v27 = v25;
                }
                if (-[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("Any")))
                {

                  v26 = CFSTR("Any");
                }
                if (objc_msgSend(v25, "containsObject:", v26)
                  || objc_msgSend(v16, "containsObject:", v26))
                {
                  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Duplicate definition of resource type \"%@\" for keyPath \"%@\"), v26, v38);
LABEL_30:

                  v7 = v35;
                  v6 = v36;
                  v14 = v34;
                  goto LABEL_31;
                }
                objc_msgSend(v27, "addObject:", v26);

              }
              else
              {
                v26 = v24;
              }

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            if (v19)
              continue;
            break;
          }
        }

        v28 = -[HDHealthRecordRulesetReferenceRule initWithKeyPath:allowedTypes:disallowedTypes:]([HDHealthRecordRulesetReferenceRule alloc], "initWithKeyPath:allowedTypes:disallowedTypes:", v38, v15, v16);
        v6 = v36;
        objc_msgSend(v36, "addObject:", v28);

        v11 = v33 + 1;
        v7 = v35;
        v5 = 0x24BDBC000;
        v10 = v31;
      }
      while (v33 + 1 != v32);
      v9 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v9)
        continue;
      break;
    }
  }

  v29 = v6;
LABEL_32:

  return v29;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_keyPath, "hash");
  v4 = -[NSSet hash](self->_allowedResourceTypes, "hash") ^ v3;
  return v4 ^ -[NSSet hash](self->_disallowedResourceTypes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HDHealthRecordRulesetReferenceRule *v4;
  HDHealthRecordRulesetReferenceRule *v5;
  NSString *keyPath;
  NSString *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSSet *allowedResourceTypes;
  NSSet *v14;
  NSSet *v15;
  void *v16;
  NSSet *disallowedResourceTypes;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = (HDHealthRecordRulesetReferenceRule *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      keyPath = self->_keyPath;
      -[HDHealthRecordRulesetReferenceRule keyPath](v5, "keyPath");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (keyPath != v7)
      {
        -[HDHealthRecordRulesetReferenceRule keyPath](v5, "keyPath");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          LOBYTE(v12) = 0;
          goto LABEL_30;
        }
        v9 = (void *)v8;
        v10 = self->_keyPath;
        -[HDHealthRecordRulesetReferenceRule keyPath](v5, "keyPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v10, "isEqualToString:", v11))
        {
          LOBYTE(v12) = 0;
LABEL_29:

          goto LABEL_30;
        }
        v28 = v9;
        v29 = v11;
      }
      allowedResourceTypes = self->_allowedResourceTypes;
      -[HDHealthRecordRulesetReferenceRule allowedResourceTypes](v5, "allowedResourceTypes");
      v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (allowedResourceTypes != v14)
      {
        -[HDHealthRecordRulesetReferenceRule allowedResourceTypes](v5, "allowedResourceTypes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_24;
        v15 = self->_allowedResourceTypes;
        -[HDHealthRecordRulesetReferenceRule allowedResourceTypes](v5, "allowedResourceTypes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSSet isEqualToSet:](v15, "isEqualToSet:", v16))
        {

          LOBYTE(v12) = 0;
LABEL_27:
          v23 = keyPath == v7;
          v9 = v28;
LABEL_28:
          v11 = v29;
          if (!v23)
            goto LABEL_29;
LABEL_30:

          goto LABEL_31;
        }
        v25 = v16;
        v27 = v12;
      }
      disallowedResourceTypes = self->_disallowedResourceTypes;
      -[HDHealthRecordRulesetReferenceRule disallowedResourceTypes](v5, "disallowedResourceTypes", v25);
      v18 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = disallowedResourceTypes == (NSSet *)v18;
      if (disallowedResourceTypes == (NSSet *)v18)
      {

      }
      else
      {
        v19 = (void *)v18;
        -[HDHealthRecordRulesetReferenceRule disallowedResourceTypes](v5, "disallowedResourceTypes");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          v12 = self->_disallowedResourceTypes;
          -[HDHealthRecordRulesetReferenceRule disallowedResourceTypes](v5, "disallowedResourceTypes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = objc_msgSend(v12, "isEqualToSet:", v22);

          if (allowedResourceTypes == v14)
          {

            goto LABEL_27;
          }

          goto LABEL_25;
        }

      }
      if (allowedResourceTypes == v14)
      {
LABEL_25:

        goto LABEL_27;
      }

LABEL_24:
      v9 = v28;

      v23 = keyPath == v7;
      goto LABEL_28;
    }
    LOBYTE(v12) = 0;
  }
LABEL_31:

  return (char)v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7.receiver = self;
  v7.super_class = (Class)HDHealthRecordRulesetReferenceRule;
  -[HDHealthRecordRulesetReferenceRule description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ for «%@»"), v4, self->_keyPath);

  return v5;
}

- (int64_t)appliesTo
{
  return self->_appliesTo;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSSet)allowedResourceTypes
{
  return self->_allowedResourceTypes;
}

- (NSSet)disallowedResourceTypes
{
  return self->_disallowedResourceTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disallowedResourceTypes, 0);
  objc_storeStrong((id *)&self->_allowedResourceTypes, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
