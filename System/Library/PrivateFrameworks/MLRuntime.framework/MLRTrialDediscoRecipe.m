@implementation MLRTrialDediscoRecipe

- (MLRTrialDediscoRecipe)initWithAssetURL:(id)a3 configOverride:(id)a4 error:(id *)a5
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  MLRTrialDediscoRecipe *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  uint64_t v20;
  void *v21;
  MLRTrialDediscoRecipe *v22;
  uint64_t v23;
  NSDictionary *encodingSchema;
  uint64_t v25;
  NSString *baseKeyFormat;
  uint64_t v27;
  NSDictionary *dpConfig;
  uint64_t v29;
  NSDictionary *dediscoTaskConfig;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void **v37;
  uint64_t *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id *v57;
  void *v58;
  id v59;
  id v60;
  objc_super v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[4];

  v71[2] = *MEMORY[0x24BDAC8D0];
  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("assetURL and configOverride cannot be both nil"), 0);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v52);
  }
  v10 = (void *)v9;
  v61.receiver = self;
  v61.super_class = (Class)MLRTrialDediscoRecipe;
  v11 = -[MLRTrialDediscoRecipe init](&v61, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v57 = a5;
      v60 = 0;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v8, 8, &v60);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v60;
      if (v13)
      {
        v59 = v14;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v13, 0, &v59);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v59;

        if (v15)
        {
          v55 = v16;
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("dediscoConfig"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("dediscoConfig"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "mutableCopy");

            v12 = (void *)v20;
            v21 = v55;
            a5 = v57;
            if (!v10)
            {
LABEL_12:
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("encodingSchema"));
              v23 = objc_claimAutoreleasedReturnValue();
              encodingSchema = v11->_encodingSchema;
              v11->_encodingSchema = (NSDictionary *)v23;

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("baseKey"));
                v25 = objc_claimAutoreleasedReturnValue();
                baseKeyFormat = v11->_baseKeyFormat;
                v11->_baseKeyFormat = (NSString *)v25;

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DifferentialPrivacyParameters"));
                  v27 = objc_claimAutoreleasedReturnValue();
                  dpConfig = v11->_dpConfig;
                  v11->_dpConfig = (NSDictionary *)v27;

                  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DediscoTaskConfig"));
                  v29 = objc_claimAutoreleasedReturnValue();
                  dediscoTaskConfig = v11->_dediscoTaskConfig;
                  v11->_dediscoTaskConfig = (NSDictionary *)v29;

                  v22 = v11;
                  v31 = v21;
LABEL_29:

                  goto LABEL_30;
                }
                v58 = v12;
                v32 = (void *)MEMORY[0x24BDD1540];
                v33 = v21;
                v34 = *MEMORY[0x24BE2D188];
                v62 = *MEMORY[0x24BDD0FC8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("key=%@ is of wrong type, value=%@"), CFSTR("baseKey"), v11->_baseKeyFormat);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = v35;
                v36 = (void *)MEMORY[0x24BDBCE70];
                v37 = &v63;
                v38 = &v62;
              }
              else
              {
                v58 = v12;
                v32 = (void *)MEMORY[0x24BDD1540];
                v33 = v21;
                v34 = *MEMORY[0x24BE2D188];
                v64 = *MEMORY[0x24BDD0FC8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("key=%@ is of wrong type, value=%@"), CFSTR("encodingSchema"), v11->_encodingSchema);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = v35;
                v36 = (void *)MEMORY[0x24BDBCE70];
                v37 = &v65;
                v38 = &v64;
              }
              objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "errorWithDomain:code:userInfo:", v34, 5007, v46);
              v31 = (id)objc_claimAutoreleasedReturnValue();

              if (a5)
              {
                v31 = objc_retainAutorelease(v31);
                v22 = 0;
                *a5 = v31;
              }
              else
              {
                v22 = 0;
              }
              v12 = v58;
              goto LABEL_29;
            }
LABEL_11:
            objc_msgSend(v12, "addEntriesFromDictionary:", v10);
            goto LABEL_12;
          }
          v54 = (void *)MEMORY[0x24BDD1540];
          v53 = *MEMORY[0x24BE2D188];
          v66 = *MEMORY[0x24BDD0FC8];
          v47 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("dediscoConfig"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringWithFormat:", CFSTR("key=%@ is of wrong type, value=%@"), CFSTR("dediscoConfig"), v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v49;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "errorWithDomain:code:userInfo:", v53, 5007, v50);
          v31 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v56 = (void *)MEMORY[0x24BDD1540];
          v43 = *MEMORY[0x24BE2D188];
          v68[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fail to decode recipe from path=%@"), v8);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v68[1] = *MEMORY[0x24BDD1398];
          v69[0] = v44;
          v69[1] = v16;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "errorWithDomain:code:userInfo:", v43, 5007, v45);
          v31 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (v57)
        {
          v31 = objc_retainAutorelease(v31);
          *v57 = v31;
        }

      }
      else
      {
        v39 = (void *)MEMORY[0x24BDD1540];
        v40 = *MEMORY[0x24BE2D188];
        v70[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fail to read recipe with path=%@"), v8);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = *MEMORY[0x24BDD1398];
        v71[0] = v41;
        v71[1] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 5007, v42);
        v31 = (id)objc_claimAutoreleasedReturnValue();

        if (v57)
        {
          v31 = objc_retainAutorelease(v31);
          v22 = 0;
          *v57 = v31;
          goto LABEL_29;
        }
      }
      v22 = 0;
      goto LABEL_29;
    }
    v21 = 0;
    if (!v10)
      goto LABEL_12;
    goto LABEL_11;
  }
  v22 = 0;
LABEL_30:

  return v22;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLRTrialDediscoRecipe baseKeyFormat](self, "baseKeyFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLRTrialDediscoRecipe encodingSchema](self, "encodingSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLRTrialDediscoRecipe dpConfig](self, "dpConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLRTrialDediscoRecipe dediscoTaskConfig](self, "dediscoTaskConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n(%@, %@, %@, %@)\n"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)mlrDediscoMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MLRTrialDediscoRecipe dpConfig](self, "dpConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MLRTrialDediscoRecipe dediscoTaskConfig](self, "dediscoTaskConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDBCED8];
      -[MLRTrialDediscoRecipe dpConfig](self, "dpConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dictionaryWithDictionary:", v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      -[MLRTrialDediscoRecipe dediscoTaskConfig](self, "dediscoTaskConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("DediscoTaskConfig"));

    }
    else
    {
      -[MLRTrialDediscoRecipe dpConfig](self, "dpConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (NSString)baseKeyFormat
{
  return self->_baseKeyFormat;
}

- (NSDictionary)encodingSchema
{
  return self->_encodingSchema;
}

- (NSDictionary)dpConfig
{
  return self->_dpConfig;
}

- (NSDictionary)dediscoTaskConfig
{
  return self->_dediscoTaskConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dediscoTaskConfig, 0);
  objc_storeStrong((id *)&self->_dpConfig, 0);
  objc_storeStrong((id *)&self->_encodingSchema, 0);
  objc_storeStrong((id *)&self->_baseKeyFormat, 0);
}

@end
