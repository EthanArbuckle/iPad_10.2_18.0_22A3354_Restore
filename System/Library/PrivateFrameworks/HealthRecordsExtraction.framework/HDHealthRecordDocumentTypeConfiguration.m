@implementation HDHealthRecordDocumentTypeConfiguration

- (HDHealthRecordDocumentTypeConfiguration)initWithVersion:(id)a3 extractionRulesets:(id)a4
{
  id v6;
  id v7;
  HDHealthRecordDocumentTypeConfiguration *v8;
  uint64_t v9;
  NSNumber *extractionRulesetVersion;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDHealthRecordDocumentTypeConfiguration;
  v8 = -[HDHealthRecordDocumentTypeConfiguration init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    extractionRulesetVersion = v8->_extractionRulesetVersion;
    v8->_extractionRulesetVersion = (NSNumber *)v9;

    objc_storeStrong((id *)&v8->_extractionRulesets, a4);
  }

  return v8;
}

- (id)extractionRulesetForRelease:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_extractionRulesets;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "FHIRRelease", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (HRSSupportedFHIRConfiguration)supportedFHIRConfiguration
{
  HKHealthRecordsExtractionRouter *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  __int128 v25;
  HDHealthRecordDocumentTypeConfiguration *v26;
  NSArray *obj;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  HDHealthRecordDocumentTypeConfiguration *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v28 = objc_alloc_init(MEMORY[0x24BE48AA0]);
  v3 = objc_alloc_init(HKHealthRecordsExtractionRouter);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = self;
  obj = self->_extractionRulesets;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v31;
    *(_QWORD *)&v5 = 138544130;
    v25 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v9, "releaseSupport", v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "FHIRRelease");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKHealthRecordsExtractionRouter supportedResourceTypesForRelease:](v3, "supportedResourceTypesForRelease:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "releaseSupport");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "resourceTypes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setByAddingObjectsFromSet:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_alloc(MEMORY[0x24BE48AA8]);
        objc_msgSend(v9, "releaseSupport");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "FHIRRelease");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v16, "initWithFHIRRelease:resourceTypes:", v18, v15);

        v29 = 0;
        LOBYTE(v18) = objc_msgSend(v28, "addSupportedFHIRRelease:error:", v19, &v29);
        v20 = v29;
        if ((v18 & 1) == 0)
        {
          _HKInitializeLogging();
          v21 = (void *)*MEMORY[0x24BDD2FF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
          {
            v22 = v21;
            objc_msgSend(v9, "releaseSupport");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v35 = v26;
            v36 = 2114;
            v37 = v23;
            v38 = 2114;
            v39 = v28;
            v40 = 2114;
            v41 = v20;
            _os_log_error_impl(&dword_224DAC000, v22, OS_LOG_TYPE_ERROR, "%{public}@ failed to add release %{public}@ to %{public}@: %{public}@", buf, 0x2Au);

          }
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v6);
  }

  return (HRSSupportedFHIRConfiguration *)v28;
}

+ (HDHealthRecordDocumentTypeConfiguration)configurationWithError:(id *)a3
{
  return (HDHealthRecordDocumentTypeConfiguration *)objc_msgSend(a1, "configurationWithExtractionVersionOverride:rulesetOverrides:error:", 0, 0, a3);
}

+ (HDHealthRecordDocumentTypeConfiguration)configurationWithExtractionVersionOverride:(id)a3 rulesetOverrides:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  HDHealthRecordDocumentTypeConfiguration *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id *v39;
  id v40;
  void *v41;
  id obj;
  HDHealthRecordDocumentTypeConfiguration *v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v44 = a4;
  v52 = 0;
  v40 = a1;
  objc_msgSend(a1, "_bundledPipelineConfigurationWithError:", &v52);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v52;
  if (v9)
  {
    if (v8)
    {
      v43 = (HDHealthRecordDocumentTypeConfiguration *)v8;
      v11 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("version"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v51 = 0;
      HKSafeObject();
      v12 = (HDHealthRecordDocumentTypeConfiguration *)objc_claimAutoreleasedReturnValue();
      v11 = 0;

      v43 = v12;
      if (!v12)
      {
LABEL_31:

        goto LABEL_32;
      }
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FHIRExtractionRulesets"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v39 = a5;
      v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      obj = v14;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v48;
        v19 = (void *)*MEMORY[0x24BDD2C08];
        v37 = v9;
        v38 = v8;
        v35 = v11;
        v36 = v10;
        v34 = v14;
        v41 = v15;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v48 != v18)
              objc_enumerationMutation(obj);
            v21 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v20);
            HKFHIRReleaseFromNSString();
            v22 = objc_claimAutoreleasedReturnValue();
            if ((void *)v22 == v19)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", v39, 100, CFSTR("Not a supported FHIR release: %@"), v21);

LABEL_28:
              v12 = 0;
              v9 = v37;
              v8 = v38;
              v11 = v35;
              v10 = v36;
              v14 = v34;
              v15 = v41;
              goto LABEL_29;
            }
            v23 = (void *)v22;
            objc_msgSend(v44, "objectForKeyedSubscript:", v22);
            v24 = objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              v25 = (void *)v24;
              v26 = 0;
            }
            else
            {
              objc_msgSend(obj, "objectForKeyedSubscript:", v21);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = 0;
              objc_msgSend(v40, "_rulesetDictionaryFromRulesetData:error:", v27, &v46);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v46;

              if (!v25)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to parse extraction rules data for FHIR release %@"), v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", v39, 100, v25, v26);
                v30 = 1;
                goto LABEL_20;
              }
            }
            v28 = v26;
            v45 = v26;
            +[HDHealthRecordRuleset rulesetFromDictionary:rulesetVersion:error:](HDHealthRecordRuleset, "rulesetFromDictionary:rulesetVersion:error:", v25, v43, &v45);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v45;

            if (v29)
            {
              objc_msgSend(v41, "addObject:", v29);
              v30 = 0;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to create extraction ruleset from extraction rules for FHIR release %@"), v21);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", v39, 100, v31, v26);

              v30 = 1;
            }

LABEL_20:
            if (v30)
              goto LABEL_28;
            ++v20;
          }
          while (v17 != v20);
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
          v17 = v32;
          v9 = v37;
          v8 = v38;
          v11 = v35;
          v10 = v36;
          v14 = v34;
          v15 = v41;
        }
        while (v32);
      }

      v12 = -[HDHealthRecordDocumentTypeConfiguration initWithVersion:extractionRulesets:]([HDHealthRecordDocumentTypeConfiguration alloc], "initWithVersion:extractionRulesets:", v43, v15);
LABEL_29:

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 100, CFSTR("The bundled pipeline configuration does not contain any available extraction rulesets"));
      v12 = 0;
    }

    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", a5, 100, CFSTR("unable to read bundled extraction pipeline configuration"), v10);
  v12 = 0;
LABEL_32:

  return v12;
}

+ (id)_rulesetDictionaryFromRulesetData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = (objc_class *)objc_opt_class();

    NSStringFromClass(v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_assignError:code:format:", a4, 100, CFSTR("Expecting NSData for extraction ruleset but got %@"), v5);
    v6 = 0;
  }

  return v6;
}

+ (id)_bundledPipelineConfigurationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("HDHealthRecordPipelineConfiguration"), CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v5, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSNumber)extractionRulesetVersion
{
  return self->_extractionRulesetVersion;
}

- (NSArray)extractionRulesets
{
  return self->_extractionRulesets;
}

- (void)setExtractionRulesets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionRulesets, 0);
  objc_storeStrong((id *)&self->_extractionRulesetVersion, 0);
}

@end
