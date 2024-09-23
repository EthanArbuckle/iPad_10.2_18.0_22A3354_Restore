@implementation HDHealthRecordRuleset

- (id)initForFHIRRelease:(id)a3 rulesetVersion:(id)a4
{
  id v7;
  id v8;
  HDHealthRecordRuleset *v9;
  HDHealthRecordRuleset *v10;
  uint64_t v11;
  NSNumber *rulesetVersion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDHealthRecordRuleset;
  v9 = -[HDHealthRecordRuleset init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_FHIRRelease, a3);
    v11 = objc_msgSend(v8, "copy");
    rulesetVersion = v10->_rulesetVersion;
    v10->_rulesetVersion = (NSNumber *)v11;

  }
  return v10;
}

+ (id)rulesetFromDictionary:(id)a3 rulesetVersion:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  id *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id obj;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthRecordRuleset.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dict"));

  }
  v53 = 0;
  objc_msgSend(v9, "hk_safeStringForKeyPath:error:", CFSTR("release"), &v53);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v53;
  if (v11)
  {
    HKFHIRReleaseFromNSString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)*MEMORY[0x24BDD2C08])
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a5, 100, CFSTR("Ruleset specifies an unsupported release: \"%@\"), v11);
      v32 = 0;
    }
    else
    {
      v14 = -[HDHealthRecordRuleset initForFHIRRelease:rulesetVersion:]([HDHealthRecordRuleset alloc], "initForFHIRRelease:rulesetVersion:", v13, v10);

      v52 = 0;
      objc_msgSend(v9, "hk_safeValueForKeyPath:class:error:", CFSTR("resources"), objc_opt_class(), &v52);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v52;
      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v45 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v15, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        if (v16)
        {
          v17 = v16;
          v36 = a5;
          v37 = v14;
          v18 = *(_QWORD *)v49;
          v43 = v15;
          v19 = (void *)v45;
          v40 = v10;
          v41 = v9;
          v38 = v13;
          v39 = v11;
LABEL_8:
          v20 = 0;
          while (1)
          {
            if (*(_QWORD *)v49 != v18)
              objc_enumerationMutation(obj);
            v21 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v20);
            v22 = objc_opt_class();
            v47 = v12;
            objc_msgSend(v15, "hk_safeValueForKeyPath:class:error:", v21, v22, &v47);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v47;

            if (!v23)
              break;
            v46 = v24;
            +[HDHealthRecordRulesetResource resourceFromDictionary:resourceName:error:](HDHealthRecordRulesetResource, "resourceFromDictionary:resourceName:error:", v23, v21, &v46);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v46;

            if (!v25)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", v36, 100, CFSTR("Ruleset couldn't create rule from resource"), v12);

              v24 = v12;
              goto LABEL_28;
            }
            objc_msgSend(v25, "resourceType");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v27)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, v26);
            }
            objc_msgSend(v25, "condition");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
              objc_msgSend(v27, "insertObject:atIndex:", v25, 0);
            else
              objc_msgSend(v27, "addObject:", v25);
            v29 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v25, "clinicalType");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v30, "type"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKeyedSubscript:", v25, v31);

            ++v20;
            v15 = v43;
            v19 = (void *)v45;
            if (v17 == v20)
            {
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
              v10 = v40;
              v9 = v41;
              v13 = v38;
              v11 = v39;
              v14 = v37;
              if (v17)
                goto LABEL_8;
              goto LABEL_25;
            }
          }
          objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", v36, 100, CFSTR("Ruleset couldn't load resources"), v24);
LABEL_28:

          v32 = 0;
          v12 = v24;
          v10 = v40;
          v9 = v41;
          v13 = v38;
          v11 = v39;
          v14 = v37;
          v33 = v44;
          goto LABEL_29;
        }
        v19 = (void *)v45;
LABEL_25:

        objc_msgSend(v14, "setRulesByResourceType:", v19);
        v33 = v44;
        objc_msgSend(v14, "setRulesByClinicalType:", v44);
        v32 = v14;
LABEL_29:

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", a5, 100, CFSTR("Ruleset couldn't find resources"), v12);
        v32 = 0;
      }

    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (HRSSupportedFHIRRelease)releaseSupport
{
  id v3;
  NSString *FHIRRelease;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BE48AA8]);
  FHIRRelease = self->_FHIRRelease;
  v5 = (void *)MEMORY[0x24BDBCF20];
  -[NSDictionary allKeys](self->_rulesByResourceType, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFHIRRelease:resourceTypes:", FHIRRelease, v7);

  return (HRSSupportedFHIRRelease *)v8;
}

- (id)rulesetForClinicalType:(int64_t)a3
{
  NSDictionary *rulesByClinicalType;
  void *v4;
  void *v5;

  rulesByClinicalType = self->_rulesByClinicalType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](rulesByClinicalType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rulesetForFHIRResourceType:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_rulesByResourceType, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)rulesetForFHIRResourceObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_rulesByResourceType, "objectForKeyedSubscript:", v6);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v12, "evaluateWithObject:", v4, (_QWORD)v16) & 1) != 0)
        {
          v14 = v12;

          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }

  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
    -[HDHealthRecordRuleset rulesetForFHIRResourceObject:].cold.1(v13);
  v14 = 0;
LABEL_13:

  return v14;
}

- (NSString)FHIRRelease
{
  return self->_FHIRRelease;
}

- (NSNumber)rulesetVersion
{
  return self->_rulesetVersion;
}

- (NSDictionary)rulesByResourceType
{
  return self->_rulesByResourceType;
}

- (void)setRulesByResourceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)rulesByClinicalType
{
  return self->_rulesByClinicalType;
}

- (void)setRulesByClinicalType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulesByClinicalType, 0);
  objc_storeStrong((id *)&self->_rulesByResourceType, 0);
  objc_storeStrong((id *)&self->_rulesetVersion, 0);
  objc_storeStrong((id *)&self->_FHIRRelease, 0);
}

- (void)rulesetForFHIRResourceObject:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_224DAC000, v1, OS_LOG_TYPE_DEBUG, "rulesetForFHIRResourceObject: no suitable ruleset found for %@", (uint8_t *)&v3, 0xCu);

}

@end
