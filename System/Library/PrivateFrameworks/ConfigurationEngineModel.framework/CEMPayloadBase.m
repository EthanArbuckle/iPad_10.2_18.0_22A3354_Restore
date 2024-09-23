@implementation CEMPayloadBase

- (id)_loadObjectOfClass:(Class)a3 fromDictionary:(id)a4 withKey:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v10 = a6;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a7;
  objc_msgSend(a4, "objectForKey:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (v10)
    {
      if (a8)
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        v24 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing required key: %@"), v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v17);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

        a8 = 0;
      }
      v14 = 0;
      goto LABEL_10;
    }
    v14 = v13;
    if (!v14)
      goto LABEL_3;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_3:
    a8 = (id *)v14;
    v14 = a8;
    goto LABEL_10;
  }
  if (a8)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Wrong type, key: %@"), v12, *MEMORY[0x24BDD0FC8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v20);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    a8 = 0;
  }
LABEL_10:

  return a8;
}

- (id)loadStringFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;

  v8 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  -[CEMPayloadBase _loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:](self, "_loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:", objc_opt_class(), v14, v13, v8, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownPayloadKeys, 0);
}

- (id)loadArrayFromDictionary:(id)a3 withKey:(id)a4 validator:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  uint64_t (**v16)(id, _QWORD, id *);
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  char v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v33;
  id *v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v10 = a6;
  v45 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = (uint64_t (**)(id, _QWORD, id *))a5;
  v17 = a7;
  -[CEMPayloadBase _loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:](self, "_loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:", objc_opt_class(), v14, v15, v10, v17, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v35 = v15;
    v36 = v14;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v21)
    {
      v22 = v21;
      v34 = a8;
      v23 = 0;
      v24 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v39 != v24)
            objc_enumerationMutation(v20);
          if (v16)
          {
            v26 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            v37 = v23;
            v27 = v16[2](v16, v26, &v37);
            v28 = v37;

            if ((v27 & 1) == 0)
            {
              v15 = v35;
              v14 = v36;
              if (v34)
              {
                if (v28)
                {
                  *v34 = objc_retainAutorelease(v28);
                }
                else
                {
                  v33 = (void *)MEMORY[0x24BDD1540];
                  v42 = *MEMORY[0x24BDD0FC8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Wrong array item type, key: %@"), v35);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = v30;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v31);
                  *v34 = (id)objc_claimAutoreleasedReturnValue();

                }
              }

              v29 = 0;
              goto LABEL_21;
            }
            v23 = v28;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v22)
          continue;
        break;
      }
    }
    else
    {
      v23 = 0;
    }

    v29 = v20;
    v28 = v23;
    v15 = v35;
    v14 = v36;
LABEL_21:

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)mergeUnknownKeysFrom:(id)a3 withParentKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSSet *unknownPayloadKeys;
  CEMPayloadBase *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "unknownPayloadKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v21 = self;
    v10 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v6, "unknownPayloadKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "unknownPayloadKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v7, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    -[NSSet setByAddingObjectsFromSet:](v21->_unknownPayloadKeys, "setByAddingObjectsFromSet:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
    unknownPayloadKeys = v21->_unknownPayloadKeys;
    v21->_unknownPayloadKeys = (NSSet *)v19;

  }
}

- (id)createNestedObjectWithClass:(Class)a3 withParentKey:(id)a4 withPayload:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  -[objc_class load:error:](a3, "load:error:", a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[CEMPayloadBase mergeUnknownKeysFrom:withParentKey:](self, "mergeUnknownKeysFrom:withParentKey:", v11, v10);
    v12 = v11;
  }
  else if (a6)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Wrong nested item, key: %@"), v10, *MEMORY[0x24BDD0FC8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v15);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)load:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  LODWORD(a4) = objc_msgSend(v6, "loadPayload:error:", v5, a4);

  if ((_DWORD)a4)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)loadIntegerFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v8 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  -[CEMPayloadBase _loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:](self, "_loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:", objc_opt_class(), v14, v13, v8, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "integerValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)loadFloatFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  -[CEMPayloadBase _loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:](self, "_loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:", objc_opt_class(), v14, v13, v8, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "floatValue");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)loadBooleanFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v8 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  -[CEMPayloadBase _loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:](self, "_loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:", objc_opt_class(), v14, v13, v8, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v15, "BOOLValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)loadDateFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;

  v8 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  -[CEMPayloadBase _loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:](self, "_loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:", objc_opt_class(), v14, v13, v8, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)loadDataFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;

  v8 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  -[CEMPayloadBase _loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:](self, "_loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:", objc_opt_class(), v14, v13, v8, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)loadArrayFromDictionary:(id)a3 withKey:(id)a4 classType:(Class)a5 nested:(BOOL)a6 isRequired:(BOOL)a7 defaultValue:(id)a8 error:(id *)a9
{
  _BOOL8 v10;
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v10 = a7;
  v11 = a6;
  v57 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a8;
  -[CEMPayloadBase _loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:](self, "_loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:", objc_opt_class(), v15, v16, v10, v17, a9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v19;
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v50;
      v39 = v19;
      v40 = v20;
      v41 = v11;
      v36 = v17;
      v37 = v15;
      while (2)
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v50 != v43)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (v11)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a9)
              {
                v35 = (void *)MEMORY[0x24BDD1540];
                v54 = *MEMORY[0x24BDD0FC8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Wrong array item type, key: %@"), v16);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = v23;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
                v24 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v24);
                *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

                v20 = v40;
              }
LABEL_26:

              v33 = 0;
              v17 = v36;
              v15 = v37;
              goto LABEL_27;
            }
            v38 = i;
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v24 = v22;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v46;
              while (2)
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v46 != v27)
                    objc_enumerationMutation(v24);
                  -[CEMPayloadBase createNestedObjectWithClass:withParentKey:withPayload:error:](self, "createNestedObjectWithClass:withParentKey:withPayload:error:", a5, v16, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j), a9);
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (!v29)
                  {
                    v19 = v39;
                    goto LABEL_25;
                  }
                  v30 = (void *)v29;
                  objc_msgSend(v23, "addObject:", v29);

                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
                if (v26)
                  continue;
                break;
              }
            }

            v31 = (void *)objc_msgSend(v23, "copy");
            v20 = v40;
            objc_msgSend(v40, "addObject:", v31);

            i = v38;
            v19 = v39;
          }
          else
          {
            -[CEMPayloadBase createNestedObjectWithClass:withParentKey:withPayload:error:](self, "createNestedObjectWithClass:withParentKey:withPayload:error:", a5, v16, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i), a9);
            v32 = objc_claimAutoreleasedReturnValue();
            if (!v32)
              goto LABEL_26;
            v23 = (void *)v32;
            objc_msgSend(v20, "addObject:", v32);
          }

          v11 = v41;
        }
        v17 = v36;
        v15 = v37;
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
        if (v42)
          continue;
        break;
      }
    }

    v33 = (void *)objc_msgSend(v20, "copy");
LABEL_27:

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)loadDictionaryFromDictionary:(id)a3 withKey:(id)a4 classType:(Class)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v10 = a6;
  v14 = a4;
  v15 = a7;
  v16 = a3;
  -[CEMPayloadBase _loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:](self, "_loadObjectOfClass:fromDictionary:withKey:isRequired:defaultValue:error:", objc_opt_class(), v16, v14, v10, v15, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CEMPayloadBase createNestedObjectWithClass:withParentKey:withPayload:error:](self, "createNestedObjectWithClass:withParentKey:withPayload:error:", a5, v14, v17, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = v18;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)serializePayload
{
  return -[CEMPayloadBase serializePayloadWithAssetProviders:](self, "serializePayloadWithAssetProviders:", 0);
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (void)_serializeItemIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 isDefaultValue:(BOOL)a7
{
  BOOL v7;

  v7 = !a7;
  if (!a5)
    v7 = 0;
  if (v7 || a6)
    objc_msgSend(a3, "setObject:forKeyedSubscript:", a5, a4);
}

- (void)serializeStringIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;

  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v14, v13, v12, v8, objc_msgSend(v12, "isEqual:", a7));

}

- (void)serializeIntegerIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v8 = a6;
  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "integerValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v16, v12, v15, v8, objc_msgSend(v13, "isEqual:", v14));

}

- (void)serializeFloatIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a6;
  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v13)
  {
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v17, v12, v16, v8, objc_msgSend(v13, "isEqual:", v14));

}

- (void)serializeBooleanIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v8 = a6;
  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v16, v12, v15, v8, objc_msgSend(v13, "isEqual:", v14));

}

- (void)serializeDateIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;

  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v14, v13, v12, v8, objc_msgSend(v12, "isEqual:", a7));

}

- (void)serializeDataIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;

  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v14, v13, v12, v8, objc_msgSend(v12, "isEqual:", a7));

}

- (void)serializeArrayIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 itemSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, _QWORD))a6;
  v17 = a8;
  v18 = v17;
  if (v15)
  {
    v27 = v17;
    v28 = a7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = v15;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          v16[2](v16, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v22);
    }

    v18 = v27;
    if (v28)
      goto LABEL_13;
  }
  else
  {
    v19 = 0;
    if (a7)
    {
LABEL_13:
      v26 = (void *)objc_msgSend(v19, "copy");
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, v14);

      goto LABEL_14;
    }
  }
  if (v19)
    goto LABEL_13;
LABEL_14:

}

- (void)serializeDictionaryIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 dictSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8
{
  id v13;
  id v14;
  void (**v15)(id, id);
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, id))a6;
  v16 = a8;
  if (v14)
  {
    v15[2](v15, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7)
      goto LABEL_6;
  }
  else
  {
    v17 = 0;
    if (a7)
    {
LABEL_6:
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v13);
      goto LABEL_7;
    }
  }
  if (v17)
    goto LABEL_6;
LABEL_7:

}

- (void)serializeAssetIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 assetProvider:(id)a6 transformType:(id)a7 isRequired:(BOOL)a8 defaultValue:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;

  v9 = a8;
  v21 = a6;
  v15 = a7;
  v16 = a9;
  v17 = a4;
  v18 = a3;
  if (v21)
  {
    if (objc_msgSend(v15, "isEqual:", &stru_24C63AAC0))
    {
      v19 = v16;
    }
    else if (objc_msgSend(v15, "isEqual:", CFSTR("<data>")))
    {
      objc_msgSend(v21, "dataRepresentation");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v15, "isEqual:", CFSTR("<url>")))
      {
        v20 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v21, "urlRepresentation");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;
LABEL_10:
    -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v18, v17, v20, v9, objc_msgSend(v20, "isEqual:", v16));

    v17 = v18;
    v18 = v20;
    goto LABEL_11;
  }
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v18, v17, a5, v9, v16);
LABEL_11:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CEMPayloadBase serializePayload](self, "serializePayload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("payload"));

}

- (CEMPayloadBase)initWithCoder:(id)a3
{
  id v4;
  CEMPayloadBase *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CEMPayloadBase *v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CEMPayloadBase;
  v5 = -[CEMPayloadBase init](&v22, sel_init);
  if (!v5)
    goto LABEL_3;
  v20 = (void *)MEMORY[0x24BDBCF20];
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("payload"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  LODWORD(v13) = -[CEMPayloadBase loadPayload:error:](v5, "loadPayload:error:", v15, &v21);

  v16 = 0;
  if ((_DWORD)v13)
LABEL_3:
    v16 = v5;

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)objc_opt_new();
}

- (NSSet)unknownPayloadKeys
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

@end
