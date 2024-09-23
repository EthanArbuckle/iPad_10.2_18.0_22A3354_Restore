@implementation HDHealthRecordParsedHumanName

- (HDHealthRecordParsedHumanName)initWithHumanNameDictionary:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HDHealthRecordParsedHumanName *v10;
  void *v11;
  uint64_t v12;
  NSString *use;
  void *v14;
  uint64_t v15;
  NSString *text;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSString *family;
  void *v25;
  uint64_t v26;
  NSArray *given;
  void *v28;
  uint64_t v29;
  NSArray *prefix;
  void *v31;
  uint64_t v32;
  NSArray *suffix;
  void *v34;
  uint64_t v35;
  HKMedicalDateInterval *period;
  HDHealthRecordParsedHumanName *v37;
  objc_super v39;

  v8 = a3;
  v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)HDHealthRecordParsedHumanName;
  v10 = -[HDHealthRecordParsedHumanName init](&v39, sel_init);
  if (!v10)
    goto LABEL_12;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("use"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hd_stringValue");
    v12 = objc_claimAutoreleasedReturnValue();
    use = v10->_use;
    v10->_use = (NSString *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("text"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hd_stringValue");
    v15 = objc_claimAutoreleasedReturnValue();
    text = v10->_text;
    v10->_text = (NSString *)v15;

    objc_msgSend(v9, "FHIRRelease");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)*MEMORY[0x24BDD2BF0];

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("family"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v17 == v18)
    {
      objc_msgSend(v19, "hd_stringArrayValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR(" "));
      v23 = objc_claimAutoreleasedReturnValue();
      family = v10->_family;
      v10->_family = (NSString *)v23;

    }
    else
    {
      objc_msgSend(v19, "hd_stringValue");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v10->_family;
      v10->_family = (NSString *)v21;
    }

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("given"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hd_stringArrayValue");
    v26 = objc_claimAutoreleasedReturnValue();
    given = v10->_given;
    v10->_given = (NSArray *)v26;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("prefix"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hd_stringArrayValue");
    v29 = objc_claimAutoreleasedReturnValue();
    prefix = v10->_prefix;
    v10->_prefix = (NSArray *)v29;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("suffix"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "hd_stringArrayValue");
    v32 = objc_claimAutoreleasedReturnValue();
    suffix = v10->_suffix;
    v10->_suffix = (NSArray *)v32;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("period"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      +[HDHealthRecordsExtractionUtilities medicalDateIntervalWithPeriod:error:](HDHealthRecordsExtractionUtilities, "medicalDateIntervalWithPeriod:error:", v34, a5);
      v35 = objc_claimAutoreleasedReturnValue();
      period = v10->_period;
      v10->_period = (HKMedicalDateInterval *)v35;

      if (!v10->_period)
      {

LABEL_16:
        v37 = 0;
        goto LABEL_13;
      }
    }

  }
  if (!-[NSString length](v10->_family, "length")
    && !-[NSArray count](v10->_given, "count")
    && !-[NSString length](v10->_text, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, CFSTR("Neither given nor family name nor text is present on HumanName dictionary"));
    goto LABEL_16;
  }
LABEL_12:
  v37 = v10;
LABEL_13:

  return v37;
}

- (NSString)fullName
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *text;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[NSArray count](self->_prefix, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", self->_prefix);
  if (-[NSArray count](self->_given, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", self->_given);
  if (-[NSString length](self->_family, "length"))
    objc_msgSend(v3, "addObject:", self->_family);
  if (-[NSArray count](self->_suffix, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", self->_suffix);
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = &stru_24ED08A78;
    if (v4)
      v6 = (__CFString *)v4;
    v7 = v6;

  }
  else
  {
    text = (__CFString *)self->_text;
    if (!text)
      text = &stru_24ED08A78;
    v7 = text;
  }

  return (NSString *)v7;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = objc_opt_class();
  -[HDHealthRecordParsedHumanName fullName](self, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p name: \"%@\"; use: %@>"), v4, self, v5, self->_use);

  return v6;
}

+ (id)parsedNamesWithHumanNames:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  HDHealthRecordParsedHumanName *v18;
  HDHealthRecordParsedHumanName *v19;
  id v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  HKSafeObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      v22 = v9;
      v23 = v7;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          objc_opt_class();
          HKSafeObject();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!v16)
            goto LABEL_14;
          v17 = (void *)v16;
          v18 = -[HDHealthRecordParsedHumanName initWithHumanNameDictionary:FHIRVersion:error:]([HDHealthRecordParsedHumanName alloc], "initWithHumanNameDictionary:FHIRVersion:error:", v16, v8, a5);
          if (!v18)
          {

LABEL_14:
            v20 = 0;
            v9 = v22;
            v7 = v23;
            goto LABEL_15;
          }
          v19 = v18;
          objc_msgSend(v10, "addObject:", v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v9 = v22;
        v7 = v23;
        if (v13)
          continue;
        break;
      }
    }

    v20 = v10;
LABEL_15:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)preferredNameInNames:(id)a3 FHIRVersion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthRecordParsedHumanName.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[names isKindOfClass:[NSArray class]]"));

  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __66__HDHealthRecordParsedHumanName_preferredNameInNames_FHIRVersion___block_invoke;
  v41[3] = &unk_24ECF56E8;
  v8 = v7;
  v42 = v8;
  objc_msgSend(v6, "hk_filter:", v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v31 = v8;
    v32 = v6;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 7);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v16, "use");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v17)
            v19 = (__CFString *)v17;
          else
            v19 = CFSTR("{none}");
          v20 = v19;

          if (objc_msgSend(&unk_24ED0FD80, "containsObject:", v20))
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v21)
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v20);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v13);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = objc_msgSend(&unk_24ED0FD80, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      v9 = v30;
      while (2)
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(&unk_24ED0FD80);
          objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (void *)v26;
            goto LABEL_29;
          }
        }
        v23 = objc_msgSend(&unk_24ED0FD80, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        if (v23)
          continue;
        break;
      }
      v27 = 0;
    }
    else
    {
      v27 = 0;
      v9 = v30;
    }
LABEL_29:

    v8 = v31;
    v6 = v32;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

uint64_t __66__HDHealthRecordParsedHumanName_preferredNameInNames_FHIRVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  char v13;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "period");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v3, "period");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateForUTC");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "laterDate:", *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v7 == v11;

      v13 = !v12;
    }
    else
    {

      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13 & 1;
}

- (NSString)use
{
  return self->_use;
}

- (NSString)family
{
  return self->_family;
}

- (NSArray)given
{
  return self->_given;
}

- (NSArray)prefix
{
  return self->_prefix;
}

- (NSArray)suffix
{
  return self->_suffix;
}

- (NSString)text
{
  return self->_text;
}

- (HKMedicalDateInterval)period
{
  return self->_period;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_period, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_given, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_use, 0);
}

@end
