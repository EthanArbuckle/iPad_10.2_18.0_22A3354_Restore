@implementation HDKeyedObjectParameter

- (HDKeyedObjectParameter)init
{
  return -[HDKeyedObjectParameter initWithSummary:required:](self, "initWithSummary:required:", &stru_24F253950, 1);
}

- (HDKeyedObjectParameter)initWithSummary:(id)a3 required:(BOOL)a4
{
  id v7;
  HDKeyedObjectParameter *v8;
  HDKeyedObjectParameter *v9;
  uint64_t v10;
  NSMutableDictionary *keys;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDKeyedObjectParameter;
  v8 = -[HDKeyedObjectParameter init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_summary, a3);
    v10 = objc_opt_new();
    keys = v9->_keys;
    v9->_keys = (NSMutableDictionary *)v10;

    v9->_required = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *keys;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HDKeyedObjectParameter summary](self, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSummary:required:", v5, self->_required);

  keys = self->_keys;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__HDKeyedObjectParameter_copyWithZone___block_invoke;
  v10[3] = &unk_24F253088;
  v8 = v6;
  v11 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keys, "enumerateKeysAndObjectsUsingBlock:", v10);

  return v8;
}

uint64_t __39__HDKeyedObjectParameter_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addKey:forName:", a3, a2);
}

- (void)addKey:(id)a3 forName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isAlphaNumeric") & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Name for key in keyed object parameter must be alphanumeric: \"%@\"), v6);
  v7 = (void *)objc_msgSend(v8, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keys, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)addKeys:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__HDKeyedObjectParameter_addKeys___block_invoke;
  v3[3] = &unk_24F253088;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __34__HDKeyedObjectParameter_addKeys___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addKey:forName:", a3, a2);
}

- (BOOL)validateValue:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  id v21;
  BOOL v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v23 = (void *)MEMORY[0x24BDD17C8];
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Expected Dictionary value for keyed object parameter, not %@."), v25);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x24BDD1540];
      v66 = *MEMORY[0x24BDD0FC8];
      v67[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.osdiags.hardware-diagnostics.ErrorDomain"), 4, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_retainAutorelease(v28);
      v22 = 0;
      *a4 = v8;
      goto LABEL_40;
    }
    v22 = 0;
    goto LABEL_41;
  }
  v47 = v6;
  v7 = v6;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v7, "allKeys");
  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v53 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v29 = (void *)MEMORY[0x24BDD17C8];
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("Expected String keys in dictionary value for keyed object parameter, not %@."), v31);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = (void *)MEMORY[0x24BDD1540];
            v63 = *MEMORY[0x24BDD0FC8];
            v64 = v20;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v32;
            v35 = 4;
            goto LABEL_30;
          }
LABEL_31:
          v22 = 0;
          goto LABEL_35;
        }
        -[NSMutableDictionary objectForKeyedSubscript:](self->_keys, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected key (%@) for keyed object parameter."), v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)MEMORY[0x24BDD1540];
            v61 = *MEMORY[0x24BDD0FC8];
            v62 = v20;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v36;
            v35 = 3;
LABEL_30:
            objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.osdiags.hardware-diagnostics.ErrorDomain"), v35, v33);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = objc_retainAutorelease(v37);
            *a4 = v21;
LABEL_39:
            v6 = v47;

            v22 = 0;
            goto LABEL_40;
          }
          goto LABEL_31;
        }
      }
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v10);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = self->_keys;
  v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (!v15)
  {
    v22 = 1;
    goto LABEL_35;
  }
  v16 = v15;
  v17 = *(_QWORD *)v49;
  while (2)
  {
    for (j = 0; j != v16; ++j)
    {
      if (*(_QWORD *)v49 != v17)
        objc_enumerationMutation(v8);
      v19 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_keys, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v19);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        if ((objc_msgSend(v20, "validateValue:error:", v21, a4) & 1) == 0)
        {
          if (!a4)
            goto LABEL_39;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Key (%@) has invalid value for keyed object parameter."), v19);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)MEMORY[0x24BDD1540];
          v56 = *MEMORY[0x24BDD0FC8];
          v57 = v38;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v39;
          v42 = 4;
LABEL_38:
          objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.osdiags.hardware-diagnostics.ErrorDomain"), v42, v40);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = objc_retainAutorelease(v44);
          *a4 = v45;

          goto LABEL_39;
        }
      }
      else if (objc_msgSend(v20, "required"))
      {
        if (!a4)
          goto LABEL_39;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing required key (%@) in keyed object parameter."), v19);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)MEMORY[0x24BDD1540];
        v58 = *MEMORY[0x24BDD0FC8];
        v59 = v38;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v43;
        v42 = 2;
        goto LABEL_38;
      }

    }
    v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    v22 = 1;
    if (v16)
      continue;
    break;
  }
LABEL_35:
  v6 = v47;
LABEL_40:

LABEL_41:
  return v22;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (BOOL)required
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (NSDictionary)keys
{
  return &self->_keys->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
