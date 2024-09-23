@implementation KMMapper_SAPerson

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

- (KMMapper_SAPerson)init
{
  KMMapper_SAPerson *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  uint64_t v5;
  NSNumber *sharedUserIdKey;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KMMapper_SAPerson;
  v2 = -[KMMapper_SAPerson init](&v8, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

    KVFieldTypeToNumber();
    v5 = objc_claimAutoreleasedReturnValue();
    sharedUserIdKey = v2->_sharedUserIdKey;
    v2->_sharedUserIdKey = (NSNumber *)v5;

  }
  return v2;
}

- (int64_t)targetItemType
{
  return 2;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  KVItemBuilder *builder;
  void *v11;
  void *v12;
  id v13;
  KVItemBuilder *v14;
  uint64_t v15;
  void *v16;
  id v17;
  KVItemBuilder *v18;
  uint64_t v19;
  id v20;
  KVItemBuilder *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  KVItemBuilder *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  KVItemBuilder *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  KVItemBuilder *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  KVItemBuilder *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  KVItemBuilder *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  KVItemBuilder *v45;
  uint64_t v46;
  id v47;
  KVItemBuilder *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  _BOOL4 v52;
  uint64_t v53;
  _BOOL4 v54;
  _BOOL4 v55;
  id v56;
  _BOOL4 v57;
  KVItemBuilder *v58;
  void *v59;
  id v60;
  BOOL v61;
  void *v62;
  void *v63;
  KVItemBuilder *v64;
  void *v65;
  void *v66;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  _QWORD v113[3];

  v113[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(a4, "objectForKey:", self->_sharedUserIdKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  builder = self->_builder;
  objc_msgSend(v8, "internalGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = 0;
  -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 2, v11, &v112);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v112;
  if (!v12)
  {

LABEL_49:
    KMMapperSetBuilderError((uint64_t)a5, v13);
    v66 = 0;
    goto LABEL_52;
  }
  v14 = self->_builder;
  objc_msgSend(v8, "prefix");
  v15 = objc_claimAutoreleasedReturnValue();
  v111 = v13;
  -[KVItemBuilder addFieldWithType:value:error:](v14, "addFieldWithType:value:error:", 55, v15, &v111);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v111;

  v94 = a5;
  v95 = (void *)v15;
  if (v16)
  {
    v91 = v12;
    v18 = self->_builder;
    objc_msgSend(v8, "firstName");
    v110 = v17;
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[KVItemBuilder addFieldWithType:value:error:](v18, "addFieldWithType:value:error:", 50);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v110;

    v92 = (void *)v19;
    if (v19)
    {
      v88 = v11;
      v21 = self->_builder;
      objc_msgSend(v8, "middleName");
      v22 = objc_claimAutoreleasedReturnValue();
      v109 = v20;
      -[KVItemBuilder addFieldWithType:value:error:](v21, "addFieldWithType:value:error:", 51, v22, &v109);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v109;

      v89 = (void *)v23;
      v90 = (void *)v22;
      if (v23)
      {
        v25 = self->_builder;
        objc_msgSend(v8, "lastName");
        v26 = objc_claimAutoreleasedReturnValue();
        v108 = v24;
        -[KVItemBuilder addFieldWithType:value:error:](v25, "addFieldWithType:value:error:", 52, v26, &v108);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v108;

        v86 = (void *)v27;
        v87 = (void *)v26;
        if (v27)
        {
          v29 = self->_builder;
          objc_msgSend(v8, "suffix");
          v30 = objc_claimAutoreleasedReturnValue();
          v107 = v28;
          -[KVItemBuilder addFieldWithType:value:error:](v29, "addFieldWithType:value:error:", 56, v30, &v107);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = v107;

          v84 = (void *)v31;
          v85 = (void *)v30;
          if (v31)
          {
            v33 = self->_builder;
            objc_msgSend(v8, "nickName");
            v34 = objc_claimAutoreleasedReturnValue();
            v106 = v32;
            -[KVItemBuilder addFieldWithType:value:error:](v33, "addFieldWithType:value:error:", 54, v34, &v106);
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = v106;

            v82 = (void *)v35;
            v83 = (void *)v34;
            if (v35)
            {
              v37 = self->_builder;
              objc_msgSend(v8, "company");
              v38 = objc_claimAutoreleasedReturnValue();
              v105 = v36;
              -[KVItemBuilder addFieldWithType:value:error:](v37, "addFieldWithType:value:error:", 64, v38, &v105);
              v39 = objc_claimAutoreleasedReturnValue();
              v40 = v105;

              v80 = (void *)v39;
              v81 = (void *)v38;
              if (v39)
              {
                v41 = self->_builder;
                objc_msgSend(v8, "firstNamePhonetic");
                v42 = objc_claimAutoreleasedReturnValue();
                v104 = v40;
                -[KVItemBuilder addFieldWithType:value:error:](v41, "addFieldWithType:value:error:", 67, v42, &v104);
                v43 = objc_claimAutoreleasedReturnValue();
                v44 = v104;

                v78 = (void *)v43;
                v79 = (void *)v42;
                if (v43)
                {
                  v45 = self->_builder;
                  objc_msgSend(v8, "lastNamePhonetic");
                  v103 = v44;
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  -[KVItemBuilder addFieldWithType:value:error:](v45, "addFieldWithType:value:error:", 69);
                  v46 = objc_claimAutoreleasedReturnValue();
                  v47 = v103;

                  v76 = (void *)v46;
                  if (v46)
                  {
                    v48 = self->_builder;
                    objc_msgSend(v8, "companyPhonetic");
                    v49 = objc_claimAutoreleasedReturnValue();
                    v102 = v47;
                    -[KVItemBuilder addFieldWithType:value:error:](v48, "addFieldWithType:value:error:", 70, v49, &v102);
                    v50 = objc_claimAutoreleasedReturnValue();
                    v51 = v102;

                    v74 = (void *)v50;
                    v75 = (void *)v49;
                    if (v50)
                    {
                      objc_msgSend(v8, "phones");
                      v101 = v51;
                      v71 = objc_claimAutoreleasedReturnValue();
                      v52 = -[KMMapper_SAPerson _addLabeledFieldsForPhones:error:](self, "_addLabeledFieldsForPhones:error:");
                      v72 = v101;

                      if (v52)
                      {
                        objc_msgSend(v8, "emails");
                        v53 = objc_claimAutoreleasedReturnValue();
                        v100 = v72;
                        v54 = -[KMMapper_SAPerson _addLabeledFieldsForEmails:error:](self, "_addLabeledFieldsForEmails:error:", v53, &v100);
                        v68 = v100;

                        v70 = (void *)v53;
                        if (v54)
                        {
                          objc_msgSend(v8, "addresses");
                          v99 = v68;
                          v73 = (void *)objc_claimAutoreleasedReturnValue();
                          v55 = -[KMMapper_SAPerson _addLabeledFieldsForPostalAddresses:error:](self, "_addLabeledFieldsForPostalAddresses:error:");
                          v56 = v99;

                          if (v55)
                          {
                            objc_msgSend(v8, "relatedNames");
                            v98 = v56;
                            v69 = (void *)objc_claimAutoreleasedReturnValue();
                            v57 = -[KMMapper_SAPerson _addLabeledFieldsForRelatedNames:error:](self, "_addLabeledFieldsForRelatedNames:error:");
                            v51 = v98;

                            if (v57)
                            {
                              v58 = self->_builder;
                              v97 = v51;
                              -[KVItemBuilder addFieldWithType:value:error:](v58, "addFieldWithType:value:error:", 71, v9, &v97);
                              v59 = (void *)objc_claimAutoreleasedReturnValue();
                              v60 = v97;

                              v61 = v59 != 0;
                              v51 = v60;
                            }
                            else
                            {
                              v61 = 0;
                            }
                            v12 = v91;
                            v11 = v88;
                            v62 = v74;
                            v63 = (void *)v71;

                          }
                          else
                          {
                            v61 = 0;
                            v51 = v56;
                            v12 = v91;
                            v11 = v88;
                            v62 = v74;
                            v63 = (void *)v71;
                          }

                        }
                        else
                        {
                          v61 = 0;
                          v12 = v91;
                          v11 = v88;
                          v62 = v74;
                          v63 = (void *)v71;
                          v51 = v68;
                        }

                      }
                      else
                      {
                        v61 = 0;
                        v12 = v91;
                        v11 = v88;
                        v51 = v72;
                        v62 = v74;
                        v63 = (void *)v71;
                      }

                    }
                    else
                    {
                      v61 = 0;
                      v12 = v91;
                      v11 = v88;
                      v62 = 0;
                    }

                    v47 = v51;
                  }
                  else
                  {
                    v61 = 0;
                    v12 = v91;
                    v11 = v88;
                  }

                  v44 = v47;
                }
                else
                {
                  v61 = 0;
                  v12 = v91;
                  v11 = v88;
                }

                v40 = v44;
              }
              else
              {
                v61 = 0;
                v12 = v91;
                v11 = v88;
              }

              v36 = v40;
            }
            else
            {
              v61 = 0;
              v12 = v91;
              v11 = v88;
            }

            v32 = v36;
          }
          else
          {
            v61 = 0;
            v12 = v91;
            v11 = v88;
          }

          v28 = v32;
        }
        else
        {
          v61 = 0;
          v12 = v91;
          v11 = v88;
        }

        v24 = v28;
      }
      else
      {
        v61 = 0;
        v12 = v91;
        v11 = v88;
      }

      v20 = v24;
    }
    else
    {
      v61 = 0;
      v12 = v91;
    }

    v17 = v20;
  }
  else
  {
    v61 = 0;
  }

  if (!v61)
  {
    v13 = v17;
    a5 = v94;
    goto LABEL_49;
  }
  v64 = self->_builder;
  v96 = v17;
  -[KVItemBuilder buildItemWithError:](v64, "buildItemWithError:", &v96);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v96;

  if (v65)
  {
    v113[0] = v65;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v113, 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    KMMapperSetBuilderError((uint64_t)v94, v13);
    v66 = 0;
  }

LABEL_52:
  return v66;
}

- (BOOL)_addLabeledFieldsForPhones:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "label", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_isDefaultLabel(v11) & 1) == 0)
        {
          -[KVItemBuilder addFieldWithType:label:value:error:](self->_builder, "addFieldWithType:label:value:error:", 57, v11, 0, a4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {

            v13 = 0;
            goto LABEL_12;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)_addLabeledFieldsForEmails:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "label", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_isDefaultLabel(v11) & 1) == 0)
        {
          -[KVItemBuilder addFieldWithType:label:value:error:](self->_builder, "addFieldWithType:label:value:error:", 58, v11, 0, a4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {

            v13 = 0;
            goto LABEL_12;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)_addLabeledFieldsForPostalAddresses:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "label", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_isDefaultLabel(v11) & 1) == 0)
        {
          -[KVItemBuilder addFieldWithType:label:value:error:](self->_builder, "addFieldWithType:label:value:error:", 59, v11, 0, a4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {

            v13 = 0;
            goto LABEL_12;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)_addLabeledFieldsForRelatedNames:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  KVItemBuilder *builder;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "label", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_isDefaultLabel(v12) & 1) == 0)
        {
          builder = self->_builder;
          objc_msgSend(v11, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[KVItemBuilder addFieldWithType:label:value:error:](builder, "addFieldWithType:label:value:error:", 63, v12, v14, a4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {

            v16 = 0;
            goto LABEL_12;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_12:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserIdKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
