@implementation AXAuditObjectTransportManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__AXAuditObjectTransportManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, block);
  return (id)sharedManager_instance_0;
}

void __46__AXAuditObjectTransportManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance_0;
  sharedManager_instance_0 = v0;

}

- (AXAuditObjectTransportManager)init
{
  AXAuditObjectTransportManager *v2;
  uint64_t v3;
  NSMutableDictionary *keyToTransportInfo;
  uint64_t v5;
  NSMutableArray *transportInfoEncodeOnly;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXAuditObjectTransportManager;
  v2 = -[AXAuditObjectTransportManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    keyToTransportInfo = v2->__keyToTransportInfo;
    v2->__keyToTransportInfo = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    transportInfoEncodeOnly = v2->__transportInfoEncodeOnly;
    v2->__transportInfoEncodeOnly = (NSMutableArray *)v5;

    -[AXAuditObjectTransportManager _registerKnownClasses](v2, "_registerKnownClasses");
  }
  return v2;
}

- (void)_registerKnownClasses
{
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
  -[AXAuditObjectTransportManager registerTransportableClass:](self, "registerTransportableClass:", objc_opt_class());
}

- (void)registerTransportableClass:(Class)a3
{
  -[objc_class registerTransportableObjectWithManager:](a3, "registerTransportableObjectWithManager:", self);
}

- (id)transportDictionaryForObject:(id)a3
{
  id v4;
  void *v5;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  CFTypeID v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD);
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", AuditTransportObjectTypePassthrough, AuditTransportObjectTypeKey);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, AuditTransportValueKey);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (objc_class *)MEMORY[0x24BDD1688];
        v8 = v4;
        v9 = [v7 alloc];
        objc_msgSend(v8, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

        objc_msgSend(v8, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");
        v49[0] = MEMORY[0x24BDAC760];
        v49[1] = 3221225472;
        v49[2] = __62__AXAuditObjectTransportManager_transportDictionaryForObject___block_invoke;
        v49[3] = &unk_25071A680;
        v49[4] = self;
        v50 = v11;
        v14 = v11;
        objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 2, v49);

        objc_msgSend(v5, "setObject:forKeyedSubscript:", AuditTransportObjectTypePassthrough, AuditTransportObjectTypeKey);
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, AuditTransportValueKey);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = (void *)objc_opt_new();
          v17 = v4;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v46 != v20)
                  objc_enumerationMutation(v17);
                -[AXAuditObjectTransportManager transportDictionaryForObject:](self, "transportDictionaryForObject:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                  objc_msgSend(v16, "addObject:", v22);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
            }
            while (v19);
          }
          objc_msgSend(v5, "setObject:forKeyedSubscript:", AuditTransportObjectTypePassthrough, AuditTransportObjectTypeKey);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, AuditTransportValueKey);

        }
        else
        {
          v23 = CFGetTypeID(v4);
          if (v23 == CGColorGetTypeID())
          {
            objc_msgSend(v5, "setObject:forKeyedSubscript:", AuditTransportObjectTypePassthrough, AuditTransportObjectTypeKey);
            objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v4);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, AuditTransportValueKey);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = (void *)objc_opt_new();
              v24 = v4;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v42;
                do
                {
                  v28 = 0;
                  v40 = v26;
                  do
                  {
                    if (*(_QWORD *)v42 != v27)
                      objc_enumerationMutation(v24);
                    v29 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v28);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v30 = v27;
                      v31 = v24;
                      objc_msgSend(v24, "objectForKey:", v29);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      -[AXAuditObjectTransportManager transportDictionaryForObject:](self, "transportDictionaryForObject:", v32);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v33)
                        objc_msgSend(v38, "setObject:forKey:", v33, v29);

                      v24 = v31;
                      v27 = v30;
                      v26 = v40;
                    }
                    ++v28;
                  }
                  while (v26 != v28);
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
                }
                while (v26);
              }
              objc_msgSend(v5, "setObject:forKeyedSubscript:", AuditTransportObjectTypePassthrough, AuditTransportObjectTypeKey, v38);
              v16 = v39;
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, AuditTransportValueKey);

            }
            else
            {
              -[AXAuditObjectTransportManager _transportInfoForObject:](self, "_transportInfoForObject:", v4);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v16)
              {
                -[AXAuditObjectTransportManager _transportInfoEncodeOnlyForObject:](self, "_transportInfoEncodeOnlyForObject:", v4);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v16, "transportKey");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, AuditTransportObjectTypeKey);

              if (v16)
              {
                objc_msgSend(v16, "createTransportObjectBlock");
                v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, id))v35)[2](v35, v4);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                -[AXAuditObjectTransportManager transportDictionaryForObject:](self, "transportDictionaryForObject:", v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, AuditTransportValueKey);

              }
            }
          }
        }

      }
    }
    -[AXAuditObjectTransportManager _validateTransportObjectIfNeeded:](self, "_validateTransportObjectIfNeeded:", v5);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __62__AXAuditObjectTransportManager_transportDictionaryForObject___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "transportDictionaryForObject:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v7, a3, a4);

}

- (id)objectForTransportDictionary:(id)a3 expectedClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD);
  objc_class *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  char isKindOfClass;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  id v40;
  uint64_t v41;
  id v43;
  void *v44;
  void *v45;
  objc_class *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[5];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[AXAuditObjectTransportManager _validateTransportObjectIfNeeded:](self, "_validateTransportObjectIfNeeded:", v6);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", AuditTransportObjectTypeKey);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:", AuditTransportObjectTypePassthrough))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v8, "length"))
        {
LABEL_46:
          v7 = 0;
LABEL_47:

          goto LABEL_48;
        }
        -[AXAuditObjectTransportManager _keyToTransportInfo](self, "_keyToTransportInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", AuditTransportValueKey);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXAuditObjectTransportManager objectForTransportDictionary:expectedClass:](self, "objectForTransportDictionary:expectedClass:", v21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "createLocalObjectBlock");
          v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v23)[2](v23, v22);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v7 = 0;
        }

        if (!a4)
          goto LABEL_47;
LABEL_43:
        if (!v7 || (objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_47;

        goto LABEL_46;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", AuditTransportValueKey);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = v8;
        v46 = a4;
        v43 = v6;
        v44 = v9;
        v10 = v9;
        v7 = (void *)objc_opt_new();
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v54 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
              objc_msgSend(v11, "objectForKey:", v16, v43);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[AXAuditObjectTransportManager objectForTransportDictionary:expectedClass:](self, "objectForTransportDictionary:expectedClass:", v17, 0);
                v18 = objc_claimAutoreleasedReturnValue();

                v17 = (void *)v18;
              }
              if (v17)
                objc_msgSend(v7, "setObject:forKey:", v17, v16);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
          }
          while (v13);
        }

        v6 = v43;
LABEL_18:
        v8 = v45;
        a4 = v46;
        v9 = v44;
        goto LABEL_39;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (objc_class *)MEMORY[0x24BDD1688];
        v25 = v9;
        v26 = [v24 alloc];
        objc_msgSend(v25, "string");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v26, "initWithString:", v27);

        objc_msgSend(v25, "string");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "length");
        v51[0] = MEMORY[0x24BDAC760];
        v51[1] = 3221225472;
        v51[2] = __76__AXAuditObjectTransportManager_objectForTransportDictionary_expectedClass___block_invoke;
        v51[3] = &unk_25071A680;
        v51[4] = self;
        v52 = v28;
        v31 = v28;
        objc_msgSend(v25, "enumerateAttributesInRange:options:usingBlock:", 0, v30, 2, v51);

        v7 = (void *)objc_msgSend(v31, "copy");
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v33 = v9;
        v34 = v33;
        if ((isKindOfClass & 1) != 0)
        {
          v44 = v9;
          v45 = v8;
          v46 = a4;
          v7 = (void *)objc_opt_new();
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v35 = v34;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v48 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(id *)(*((_QWORD *)&v47 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[AXAuditObjectTransportManager objectForTransportDictionary:expectedClass:](self, "objectForTransportDictionary:expectedClass:", v40, 0);
                  v41 = objc_claimAutoreleasedReturnValue();

                  v40 = (id)v41;
                }
                if (v40)
                  objc_msgSend(v7, "addObject:", v40);

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            }
            while (v37);
          }

          goto LABEL_18;
        }
        v7 = v33;
      }
LABEL_39:

      if (!a4)
        goto LABEL_47;
      goto LABEL_43;
    }
  }
  v7 = 0;
LABEL_48:

  return v7;
}

void __76__AXAuditObjectTransportManager_objectForTransportDictionary_expectedClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "objectForTransportDictionary:expectedClass:", v8, objc_opt_class());
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v9, a3, a4);

}

- (id)transportArrayForArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[AXAuditObjectTransportManager transportDictionaryForObject:](self, "transportDictionaryForObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[AXAuditObjectTransportManager _validateTransportObjectIfNeeded:](self, "_validateTransportObjectIfNeeded:", v5);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)arrayForTransportArray:(id)a3 expectedClass:(Class)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[AXAuditObjectTransportManager _validateTransportObjectIfNeeded:](self, "_validateTransportObjectIfNeeded:", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[AXAuditObjectTransportManager objectForTransportDictionary:expectedClass:](self, "objectForTransportDictionary:expectedClass:", v13, a4, (_QWORD)v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v7, "addObject:", v14);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_transportInfoEncodeOnlyForObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t (**v10)(_QWORD, _QWORD);
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AXAuditObjectTransportManager _transportInfoEncodeOnly](self, "_transportInfoEncodeOnly", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "canEncodeObjectBlock");
        v10 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v11 = ((uint64_t (**)(_QWORD, id))v10)[2](v10, v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_transportInfoForObject:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD);
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AXAuditObjectTransportManager _keyToTransportInfo](self, "_keyToTransportInfo");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "canEncodeObjectBlock");
      v11 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, id))v11)[2](v11, v4);

      if ((v12 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (void)registerTransportInfoMasquerade:(id)a3 encodeOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  AXAuditObjectTransportManager *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "masqueradeAsClass");
  if (!v7)
    goto LABEL_24;
  v8 = v7;
  -[AXAuditObjectTransportManager _keyToTransportInfo](self, "_keyToTransportInfo");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v11 = v9;
  if (!v10)
  {
LABEL_22:

    goto LABEL_23;
  }
  v12 = v10;
  v17 = self;
  v13 = *(_QWORD *)v19;
LABEL_4:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v19 != v13)
      objc_enumerationMutation(v9);
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend((id)objc_msgSend(v11, "masqueradeAsClass"), "isEqual:", v8) & 1) != 0)
        {

          if (!v11)
            goto LABEL_23;
LABEL_20:
          objc_msgSend(v11, "transportKey");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setTransportKey:", v15);
          objc_msgSend(v6, "setMasqueradeTransportInfo:", v11);
          -[AXAuditObjectTransportManager _transportInfoEncodeOnly](v17, "_transportInfoEncodeOnly");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v6);

LABEL_21:
          goto LABEL_22;
        }
      }
      goto LABEL_13;
    }
    if ((objc_msgSend((id)objc_msgSend(v11, "entryClass"), "isEqual:", v8) & 1) != 0)
      break;
LABEL_13:

    if (v12 == ++v14)
    {
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        goto LABEL_4;
      v11 = v9;
      goto LABEL_22;
    }
  }

  if (v11)
  {
    if (v4)
      goto LABEL_20;
    objc_msgSend(v11, "transportKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTransportKey:", v15);
    objc_msgSend(v6, "setMasqueradeTransportInfo:", v11);
    objc_msgSend(v9, "setObject:forKey:", v6, v15);
    goto LABEL_21;
  }
LABEL_23:

LABEL_24:
}

- (void)registerTransportInfoPropertyBased:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "transportKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXAuditObjectTransportManager _keyToTransportInfo](self, "_keyToTransportInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, v6);

}

- (void)_validateTransportObjectIfNeeded:(id)a3
{
  id v4;

  v4 = a3;
  if (-[AXAuditObjectTransportManager enforceSecureTransport](self, "enforceSecureTransport"))
    -[AXAuditObjectTransportManager validateSupportedConnectionSecureTransport:](self, "validateSupportedConnectionSecureTransport:", v4);

}

- (BOOL)validateSupportedConnectionSecureTransport:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  BOOL v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  _QWORD v43[9];

  v43[8] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v43[2] = objc_opt_class();
    v43[3] = objc_opt_class();
    v43[4] = objc_opt_class();
    v43[5] = objc_opt_class();
    v43[6] = objc_opt_class();
    v43[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 8);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v37 != v7)
            objc_enumerationMutation(v5);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            v13 = 1;
            goto LABEL_41;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v9 = v4;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v33;
        while (2)
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v33 != v11)
              objc_enumerationMutation(v9);
            if (!-[AXAuditObjectTransportManager validateSupportedConnectionSecureTransport:](self, "validateSupportedConnectionSecureTransport:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j)))
            {
              v13 = 0;
              goto LABEL_34;
            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v10)
            continue;
          break;
        }
      }
      v13 = 1;
LABEL_34:

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v14 = v4;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v29;
          while (2)
          {
            for (k = 0; k != v15; ++k)
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v14);
              v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k);
              if (-[AXAuditObjectTransportManager validateSupportedConnectionSecureTransport:](self, "validateSupportedConnectionSecureTransport:", v18))
              {
                objc_msgSend(v14, "objectForKey:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = -[AXAuditObjectTransportManager validateSupportedConnectionSecureTransport:](self, "validateSupportedConnectionSecureTransport:", v19);

                if (v20)
                  continue;
              }
              v13 = 0;
              goto LABEL_40;
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            v13 = 1;
            if (v15)
              continue;
            break;
          }
        }
        else
        {
          v13 = 1;
        }
LABEL_40:

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = 0;
          v25 = &v24;
          v26 = 0x2020000000;
          v27 = 0;
          v21 = objc_msgSend(v4, "length");
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __76__AXAuditObjectTransportManager_validateSupportedConnectionSecureTransport___block_invoke;
          v23[3] = &unk_25071A6A8;
          v23[4] = self;
          v23[5] = &v24;
          objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v21, 0, v23);
          v13 = *((_BYTE *)v25 + 24) == 0;
          _Block_object_dispose(&v24, 8);
        }
        else
        {
          v13 = 0;
        }
      }
    }
LABEL_41:

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

uint64_t __76__AXAuditObjectTransportManager_validateSupportedConnectionSecureTransport___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "validateSupportedConnectionSecureTransport:", a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (BOOL)enforceSecureTransport
{
  return self->_enforceSecureTransport;
}

- (void)setEnforceSecureTransport:(BOOL)a3
{
  self->_enforceSecureTransport = a3;
}

- (NSMutableDictionary)_keyToTransportInfo
{
  return self->__keyToTransportInfo;
}

- (void)set_keyToTransportInfo:(id)a3
{
  objc_storeStrong((id *)&self->__keyToTransportInfo, a3);
}

- (NSMutableArray)_transportInfoEncodeOnly
{
  return self->__transportInfoEncodeOnly;
}

- (void)set_transportInfoEncodeOnly:(id)a3
{
  objc_storeStrong((id *)&self->__transportInfoEncodeOnly, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__transportInfoEncodeOnly, 0);
  objc_storeStrong((id *)&self->__keyToTransportInfo, 0);
}

@end
