@implementation KMMapper_AppGlobalVocabulary

- (KMMapper_AppGlobalVocabulary)init
{
  KMMapper_AppGlobalVocabulary *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *intentSlotToFieldTypeMap;
  objc_super v16;
  _QWORD v17[5];
  _QWORD v18[5];
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)KMMapper_AppGlobalVocabulary;
  v2 = -[KMMapper_AppGlobalVocabulary init](&v16, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v6;
    v17[0] = CFSTR("playlistTitle");
    KVFieldTypeToNumber();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v17[1] = CFSTR("musicArtistName");
    KVFieldTypeToNumber();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    v17[2] = CFSTR("audiobookTitle");
    KVFieldTypeToNumber();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v9;
    v17[3] = CFSTR("audiobookAuthor");
    KVFieldTypeToNumber();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v10;
    v17[4] = CFSTR("showTitle");
    KVFieldTypeToNumber();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[4] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    intentSlotToFieldTypeMap = v2->_intentSlotToFieldTypeMap;
    v2->_intentSlotToFieldTypeMap = (NSDictionary *)v13;

  }
  return v2;
}

- (int64_t)targetItemType
{
  return 14;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v7;
  NSMutableArray *v8;
  NSMutableArray *items;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t j;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  uint64_t v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  NSMutableArray *v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id obj;
  uint64_t v58;
  id v59;
  uint64_t v60;
  KMMapper_AppGlobalVocabulary *v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  id *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  items = self->_items;
  self->_items = v8;

  v56 = v7;
  objc_msgSend(v7, "arrayValueForKey:expectedObjectsType:keyRequired:error:", *MEMORY[0x24BDDA3F8], objc_opt_class(), 1, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v10;
  if (v10)
  {
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    obj = v10;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
    if (v52)
    {
      v54 = *(_QWORD *)v104;
      v53 = *MEMORY[0x24BDDA3D8];
      v51 = *MEMORY[0x24BDDA408];
      v66 = *MEMORY[0x24BDDA3E8];
      v60 = *MEMORY[0x24BDDA400];
      v77 = *MEMORY[0x24BDDA3F0];
      v76 = *MEMORY[0x24BDDA3E0];
      v61 = self;
      v78 = a5;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v104 != v54)
            objc_enumerationMutation(obj);
          v58 = v11;
          v12 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v11);
          v67 = (void *)objc_opt_new();
          objc_msgSend(v12, "arrayValueForKey:expectedObjectsType:keyRequired:error:", v53, objc_opt_class(), 1, a5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v101 = 0u;
            v102 = 0u;
            v99 = 0u;
            v100 = 0u;
            v62 = v13;
            v14 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v100;
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v100 != v16)
                    objc_enumerationMutation(v62);
                  -[KMMapper_AppGlobalVocabulary _resolveFieldTypeFromIntentSlotName:](self, "_resolveFieldTypeFromIntentSlotName:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v18)
                    objc_msgSend(v67, "addObject:", v18);

                }
                v15 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
              }
              while (v15);
            }

            a5 = v78;
            objc_msgSend(v12, "arrayValueForKey:expectedObjectsType:keyRequired:error:", v51, objc_opt_class(), 1, v78);
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = (void *)v19;
              v63 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v95 = 0u;
              v96 = 0u;
              v97 = 0u;
              v98 = 0u;
              v59 = v20;
              v68 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
              if (v68)
              {
                v64 = *(_QWORD *)v96;
                do
                {
                  for (j = 0; j != v68; ++j)
                  {
                    if (*(_QWORD *)v96 != v64)
                      objc_enumerationMutation(v59);
                    v22 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
                    objc_msgSend(v22, "stringValueForKey:error:", v66, a5);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v23, "length"))
                    {
                      v72 = j;
                      objc_msgSend(v63, "objectForKey:", v23);
                      v24 = (id)objc_claimAutoreleasedReturnValue();
                      if (!v24)
                      {
                        v24 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                        objc_msgSend(v24, "addObject:", v23);
                        objc_msgSend(v63, "setObject:forKey:", v24, v23);
                      }
                      v70 = v23;
                      objc_msgSend(v22, "arrayValueForKey:expectedObjectsType:keyRequired:error:", v60, objc_opt_class(), 1, a5);
                      v74 = (id)objc_claimAutoreleasedReturnValue();
                      if (v74)
                      {
                        v93 = 0u;
                        v94 = 0u;
                        v91 = 0u;
                        v92 = 0u;
                        v25 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
                        if (v25)
                        {
                          v26 = v25;
                          v27 = *(_QWORD *)v92;
                          do
                          {
                            for (k = 0; k != v26; ++k)
                            {
                              if (*(_QWORD *)v92 != v27)
                                objc_enumerationMutation(v74);
                              v29 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * k);
                              objc_msgSend(v29, "stringValueForKey:error:", v77, a5);
                              v30 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v30, "length"))
                                objc_msgSend(v24, "addObject:", v30);
                              objc_msgSend(v29, "arrayValueForKey:expectedObjectsType:keyRequired:error:", v76, objc_opt_class(), 0, a5);
                              v31 = (void *)objc_claimAutoreleasedReturnValue();
                              v87 = 0u;
                              v88 = 0u;
                              v89 = 0u;
                              v90 = 0u;
                              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v87, v109, 16);
                              if (v32)
                              {
                                v33 = v32;
                                v34 = *(_QWORD *)v88;
                                do
                                {
                                  for (m = 0; m != v33; ++m)
                                  {
                                    if (*(_QWORD *)v88 != v34)
                                      objc_enumerationMutation(v31);
                                    v36 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * m);
                                    if (objc_msgSend(v36, "length"))
                                      objc_msgSend(v24, "addObject:", v36);
                                  }
                                  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v87, v109, 16);
                                }
                                while (v33);
                              }

                              a5 = v78;
                            }
                            v26 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
                          }
                          while (v26);
                        }
                      }

                      self = v61;
                      v23 = v70;
                      j = v72;
                    }

                  }
                  v68 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
                }
                while (v68);
              }

              v85 = 0u;
              v86 = 0u;
              v83 = 0u;
              v84 = 0u;
              v37 = v67;
              v69 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v83, v108, 16);
              if (v69)
              {
                v38 = *(_QWORD *)v84;
                v73 = v37;
                v65 = *(_QWORD *)v84;
                do
                {
                  v39 = 0;
                  do
                  {
                    if (*(_QWORD *)v84 != v38)
                      objc_enumerationMutation(v37);
                    v71 = v39;
                    v75 = (id)KVFieldTypeFromNumber();
                    v79 = 0u;
                    v80 = 0u;
                    v81 = 0u;
                    v82 = 0u;
                    v40 = v63;
                    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v79, v107, 16);
                    if (v41)
                    {
                      v42 = v41;
                      v43 = *(_QWORD *)v80;
                      while (2)
                      {
                        for (n = 0; n != v42; ++n)
                        {
                          if (*(_QWORD *)v80 != v43)
                            objc_enumerationMutation(v40);
                          v45 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * n);
                          objc_msgSend(v40, "setValueForKey:expectedObjectsType:keyRequired:error:", v45, objc_opt_class(), 1, a5);
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u#%@"), (unsigned __int16)v75, v45);
                          v47 = (void *)objc_claimAutoreleasedReturnValue();
                          v48 = -[KMMapper_AppGlobalVocabulary _addItemWithItemId:fieldType:values:error:](self, "_addItemWithItemId:fieldType:values:error:", v47, v75, v46, a5);

                          if (!v48)
                          {

                            v49 = 0;
                            goto LABEL_70;
                          }
                          self = v61;
                        }
                        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v79, v107, 16);
                        if (v42)
                          continue;
                        break;
                      }
                    }

                    v39 = v71 + 1;
                    v37 = v73;
                    v38 = v65;
                  }
                  while (v71 + 1 != v69);
                  v69 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v83, v108, 16);
                }
                while (v69);
              }

            }
          }

          v11 = v58 + 1;
        }
        while (v58 + 1 != v52);
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
      }
      while (v52);
    }

  }
  v49 = self->_items;
LABEL_70:

  return v49;
}

- (BOOL)_addItemWithItemId:(id)a3 fieldType:(int64_t)a4 values:(id)a5 error:(id *)a6
{
  id v10;
  KVItemBuilder *builder;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  KVItemBuilder *v21;
  void *v22;
  void *v23;
  KVItemBuilder *v24;
  void *v25;
  BOOL v26;
  id *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  builder = self->_builder;
  v35 = 0;
  -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 14, a3, &v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v35;

  if (v12)
  {
    v28 = a6;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      while (2)
      {
        v18 = 0;
        v19 = v13;
        do
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v18);
          v21 = self->_builder;
          v30 = v19;
          -[KVItemBuilder addFieldWithType:value:error:](v21, "addFieldWithType:value:error:", a4, v20, &v30);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v30;

          if (!v22)
          {
            KMMapperSetBuilderError((uint64_t)v28, v13);

            goto LABEL_14;
          }
          ++v18;
          v19 = v13;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v16)
          continue;
        break;
      }
    }
    v23 = v13;

    v24 = self->_builder;
    v29 = v13;
    -[KVItemBuilder buildItemWithError:](v24, "buildItemWithError:", &v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v29;

    v26 = v25 != 0;
    if (v25)
      -[NSMutableArray addObject:](self->_items, "addObject:", v25);
    else
      KMMapperSetBuilderError((uint64_t)v28, v13);

  }
  else
  {
    KMMapperSetBuilderError((uint64_t)a6, v13);
LABEL_14:
    v26 = 0;
  }

  return v26;
}

- (id)_resolveFieldTypeFromIntentSlotName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
    {
      -[NSDictionary objectForKey:](self->_intentSlotToFieldTypeMap, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentSlotToFieldTypeMap, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end
