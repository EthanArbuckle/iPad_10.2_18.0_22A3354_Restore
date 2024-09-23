@implementation HDDescription

+ (id)descriptionWithSummary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSummary:", v4);

  return v5;
}

- (HDDescription)init
{
  return -[HDDescription initWithSummary:](self, "initWithSummary:", &stru_24F253950);
}

- (HDDescription)initWithSummary:(id)a3
{
  id v5;
  HDDescription *v6;
  HDDescription *v7;
  uint64_t v8;
  NSDictionary *metadata;
  uint64_t v10;
  NSMutableDictionary *parameters;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDDescription;
  v6 = -[HDDescription init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_summary, a3);
    v8 = objc_opt_new();
    metadata = v7->_metadata;
    v7->_metadata = (NSDictionary *)v8;

    v10 = objc_opt_new();
    parameters = v7->_parameters;
    v7->_parameters = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (NSDictionary)parameters
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_parameters, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_parameters;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)addParameter:(id)a3 forName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isAlphaNumeric") & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Name for parameter in description must be alphanumeric: \"%@\"), v6);
  v7 = (void *)objc_msgSend(v8, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parameters, "setObject:forKeyedSubscript:", v7, v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *parameters;
  id v11;
  _QWORD v13[4];
  id v14;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[HDDescription summary](self, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setSummary:", v7);

  -[HDDescription metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setMetadata:", v9);

  parameters = self->_parameters;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __30__HDDescription_copyWithZone___block_invoke;
  v13[3] = &unk_24F2530B0;
  v11 = v5;
  v14 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](parameters, "enumerateKeysAndObjectsUsingBlock:", v13);

  return v11;
}

uint64_t __30__HDDescription_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addParameter:forName:", a3, a2);
}

- (BOOL)validateAgainstValues:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (v7 <= -[NSMutableDictionary count](self->_parameters, "count"))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v6, "allKeys");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (!v13)
    {
LABEL_12:

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v8 = self->_parameters;
      v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v37 != v21)
              objc_enumerationMutation(v8);
            v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", v23);
            v12 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              if (!objc_msgSend(v12, "validateValue:error:", v24, a4))
                goto LABEL_30;
            }
            else if (objc_msgSend(v12, "required"))
            {
              if (a4)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing required parameter %@"), v23);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = (void *)MEMORY[0x24BDD1540];
                v44 = *MEMORY[0x24BDD0FC8];
                v45 = v30;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.osdiags.hardware-diagnostics.ErrorDomain"), 2, v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                v34 = objc_retainAutorelease(v33);
                *a4 = v34;

              }
LABEL_30:

              goto LABEL_31;
            }

          }
          v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          v25 = 1;
          if (v20)
            continue;
          break;
        }
      }
      else
      {
        v25 = 1;
      }
LABEL_33:

      goto LABEL_34;
    }
    v14 = v13;
    v15 = *(_QWORD *)v41;
LABEL_6:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v15)
        objc_enumerationMutation(v8);
      v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v16);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        break;
      if (v14 == ++v16)
      {
        v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v14)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
    if (!a4)
      goto LABEL_32;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected parameter (%@)"), v17);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x24BDD1540];
    v47 = *MEMORY[0x24BDD0FC8];
    v48 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.osdiags.hardware-diagnostics.ErrorDomain"), 3, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_retainAutorelease(v28);
    *a4 = v29;

LABEL_31:
LABEL_32:
    v25 = 0;
    goto LABEL_33;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected at most %lu parameters but have %lu."), -[NSMutableDictionary count](self->_parameters, "count"), objc_msgSend(v6, "count"));
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD0FC8];
    v51[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.osdiags.hardware-diagnostics.ErrorDomain"), 3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v11);
    *a4 = v12;
    goto LABEL_31;
  }
  v25 = 0;
LABEL_34:

  return v25;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
