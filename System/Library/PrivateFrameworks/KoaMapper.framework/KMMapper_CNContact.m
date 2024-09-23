@implementation KMMapper_CNContact

- (KMMapper_CNContact)init
{
  KMMapper_CNContact *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  uint64_t v5;
  NSNumber *meCardIdentifierKey;
  uint64_t v7;
  NSNumber *alternativeItemIdKey;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KMMapper_CNContact;
  v2 = -[KMMapper_CNContact init](&v10, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

    KVAdditionalFieldTypeToNumber();
    v5 = objc_claimAutoreleasedReturnValue();
    meCardIdentifierKey = v2->_meCardIdentifierKey;
    v2->_meCardIdentifierKey = (NSNumber *)v5;

    KVAdditionalFieldTypeToNumber();
    v7 = objc_claimAutoreleasedReturnValue();
    alternativeItemIdKey = v2->_alternativeItemIdKey;
    v2->_alternativeItemIdKey = (NSNumber *)v7;

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
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  KVItemBuilder *builder;
  void *v18;
  id v19;
  void *v20;
  KVItemBuilder *v21;
  void *v22;
  void *v23;
  id v24;
  KVItemBuilder *v25;
  uint64_t v26;
  id v27;
  KVItemBuilder *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  KVItemBuilder *v32;
  uint64_t v33;
  id v34;
  KVItemBuilder *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  KVItemBuilder *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  KVItemBuilder *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  KVItemBuilder *v47;
  void *v48;
  uint64_t v49;
  KVItemBuilder *v50;
  uint64_t v51;
  uint64_t v52;
  KVItemBuilder *v53;
  uint64_t v54;
  KVItemBuilder *v55;
  uint64_t v56;
  KVItemBuilder *v57;
  uint64_t v58;
  KVItemBuilder *v59;
  uint64_t v60;
  KVItemBuilder *v61;
  uint64_t v62;
  id v63;
  _BOOL4 v64;
  _BOOL4 v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  KVItemBuilder *v74;
  void *v75;
  void *v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  void *v116;
  id *v117;
  id v118;
  id v119[3];
  id v120[9];
  id v121;
  id v122;
  id v123;
  id v124;
  id v125[2];
  id v126[2];
  id v127;
  id v128;
  _QWORD v129[3];

  v129[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  objc_msgSend(v9, "objectForKey:", self->_alternativeItemIdKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v10, "identifier");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_msgSend(v9, "objectForKey:", self->_meCardIdentifierKey);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v14);

  builder = self->_builder;
  v128 = 0;
  -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 2, v14, &v128);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v128;
  v20 = v19;
  if (!v18)
  {
    v24 = v19;
LABEL_67:
    KMMapperSetBuilderError((uint64_t)a5, v24);
    v76 = 0;
    goto LABEL_68;
  }
  v113 = v16;
  v117 = a5;
  v21 = self->_builder;
  objc_msgSend(v10, "namePrefix");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v20;
  -[KVItemBuilder addFieldWithType:value:error:](v21, "addFieldWithType:value:error:", 55, v22, &v127);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v127;

  if (!v23)
  {

LABEL_66:
    a5 = v117;
    goto LABEL_67;
  }
  v114 = v22;
  v25 = self->_builder;
  objc_msgSend(v10, "givenName");
  v126[1] = v24;
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[KVItemBuilder addFieldWithType:value:error:](v25, "addFieldWithType:value:error:", 50);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v24;

  v115 = (void *)v26;
  if (v26)
  {
    v112 = v23;
    v28 = self->_builder;
    objc_msgSend(v10, "middleName");
    v29 = objc_claimAutoreleasedReturnValue();
    v126[0] = v27;
    -[KVItemBuilder addFieldWithType:value:error:](v28, "addFieldWithType:value:error:", 51, v29, v126);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v126[0];

    v110 = (void *)v30;
    v111 = (void *)v29;
    if (v30)
    {
      v32 = self->_builder;
      objc_msgSend(v10, "familyName");
      v125[1] = v31;
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      -[KVItemBuilder addFieldWithType:value:error:](v32, "addFieldWithType:value:error:", 52);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v31;

      v108 = (void *)v33;
      if (v33)
      {
        v35 = self->_builder;
        objc_msgSend(v10, "previousFamilyName");
        v36 = objc_claimAutoreleasedReturnValue();
        v125[0] = v34;
        -[KVItemBuilder addFieldWithType:value:error:](v35, "addFieldWithType:value:error:", 53, v36, v125);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = v125[0];

        v106 = (void *)v37;
        v107 = (void *)v36;
        if (v37)
        {
          v103 = v18;
          v39 = self->_builder;
          objc_msgSend(v10, "nameSuffix");
          v40 = objc_claimAutoreleasedReturnValue();
          v124 = v38;
          -[KVItemBuilder addFieldWithType:value:error:](v39, "addFieldWithType:value:error:", 56, v40, &v124);
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = v124;

          v104 = (void *)v41;
          v105 = (void *)v40;
          if (v41)
          {
            v43 = self->_builder;
            objc_msgSend(v10, "nickname");
            v44 = objc_claimAutoreleasedReturnValue();
            v123 = v42;
            -[KVItemBuilder addFieldWithType:value:error:](v43, "addFieldWithType:value:error:", 54, v44, &v123);
            v45 = objc_claimAutoreleasedReturnValue();
            v46 = v123;

            v101 = (void *)v45;
            v102 = (void *)v44;
            if (v45)
            {
              v47 = self->_builder;
              objc_msgSend(v10, "organizationName");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = v46;
              -[KVItemBuilder addFieldWithType:value:error:](v47, "addFieldWithType:value:error:", 64, v48, &v122);
              v49 = objc_claimAutoreleasedReturnValue();
              v42 = v122;

              v100 = (void *)v49;
              if (v49)
              {
                v95 = v48;
                v50 = self->_builder;
                objc_msgSend(v10, "departmentName");
                v51 = objc_claimAutoreleasedReturnValue();
                v121 = v42;
                -[KVItemBuilder addFieldWithType:value:error:](v50, "addFieldWithType:value:error:", 65, v51, &v121);
                v52 = objc_claimAutoreleasedReturnValue();
                v96 = v121;

                v98 = (void *)v52;
                v99 = (void *)v51;
                if (v52)
                {
                  v53 = self->_builder;
                  objc_msgSend(v10, "jobTitle");
                  v120[8] = v96;
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  -[KVItemBuilder addFieldWithType:value:error:](v53, "addFieldWithType:value:error:", 66);
                  v54 = objc_claimAutoreleasedReturnValue();
                  v42 = v96;

                  v97 = (void *)v54;
                  if (v54)
                  {
                    v55 = self->_builder;
                    objc_msgSend(v10, "phoneticGivenName");
                    v120[7] = v42;
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    -[KVItemBuilder addFieldWithType:value:error:](v55, "addFieldWithType:value:error:", 67);
                    v56 = objc_claimAutoreleasedReturnValue();
                    v90 = v42;

                    v92 = (void *)v56;
                    if (v56)
                    {
                      v57 = self->_builder;
                      objc_msgSend(v10, "phoneticMiddleName");
                      v120[6] = v90;
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      -[KVItemBuilder addFieldWithType:value:error:](v57, "addFieldWithType:value:error:", 68);
                      v58 = objc_claimAutoreleasedReturnValue();
                      v42 = v90;

                      v91 = (void *)v58;
                      if (v58)
                      {
                        v59 = self->_builder;
                        objc_msgSend(v10, "phoneticFamilyName");
                        v120[5] = v42;
                        v88 = (void *)objc_claimAutoreleasedReturnValue();
                        -[KVItemBuilder addFieldWithType:value:error:](v59, "addFieldWithType:value:error:", 69);
                        v60 = objc_claimAutoreleasedReturnValue();
                        v85 = v42;

                        v87 = (void *)v60;
                        if (v60)
                        {
                          v61 = self->_builder;
                          objc_msgSend(v10, "phoneticOrganizationName");
                          v120[4] = v85;
                          v84 = (void *)objc_claimAutoreleasedReturnValue();
                          -[KVItemBuilder addFieldWithType:value:error:](v61, "addFieldWithType:value:error:", 70);
                          v62 = objc_claimAutoreleasedReturnValue();
                          v63 = v85;

                          v86 = (void *)v62;
                          if (v62)
                          {
                            objc_msgSend(v10, "phoneNumbers");
                            v120[3] = v63;
                            v83 = (void *)objc_claimAutoreleasedReturnValue();
                            v64 = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 57);
                            v42 = v63;

                            if (v64)
                            {
                              objc_msgSend(v10, "emailAddresses");
                              v120[2] = v42;
                              v82 = (void *)objc_claimAutoreleasedReturnValue();
                              v65 = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 58);
                              v66 = v42;
                              v67 = v42;
                              v42 = v66;

                              if (v65)
                              {
                                v48 = v95;
                                objc_msgSend(v10, "postalAddresses");
                                v120[1] = v42;
                                v81 = (void *)objc_claimAutoreleasedReturnValue();
                                LODWORD(v30) = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 59);
                                v68 = v42;

                                if ((_DWORD)v30)
                                {
                                  objc_msgSend(v10, "urlAddresses");
                                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                                  v120[0] = v68;
                                  LODWORD(v30) = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 60, v69, 1, v120);
                                  v42 = v120[0];

                                  if ((_DWORD)v30)
                                  {
                                    objc_msgSend(v10, "socialProfiles");
                                    v119[2] = v42;
                                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                                    LODWORD(v30) = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 61);
                                    v70 = v42;

                                    if ((_DWORD)v30)
                                    {
                                      objc_msgSend(v10, "instantMessageAddresses");
                                      v119[1] = v70;
                                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                                      LODWORD(v30) = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 62);
                                      v71 = v70;

                                      if ((_DWORD)v30)
                                      {
                                        objc_msgSend(v10, "contactRelations");
                                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                                        v119[0] = v71;
                                        LOBYTE(v30) = -[KMMapper_CNContact _addLabeledFieldsOfType:labeledValues:labelOnly:error:](self, "_addLabeledFieldsOfType:labeledValues:labelOnly:error:", 63, v78, v113 ^ 1u, v119);
                                        v72 = v119[0];

                                        v71 = v72;
                                      }

                                      v70 = v71;
                                    }

                                    v42 = v70;
                                  }

                                }
                                else
                                {
                                  v42 = v68;
                                }
                                v73 = v114;
                                v18 = v103;

                              }
                              else
                              {
                                v48 = v95;
                                LOBYTE(v30) = 0;
                                v73 = v114;
                                v18 = v103;
                              }

                            }
                            else
                            {
                              v48 = v95;
                              LOBYTE(v30) = 0;
                              v73 = v114;
                              v18 = v103;
                            }

                          }
                          else
                          {
                            v48 = v95;
                            LOBYTE(v30) = 0;
                            v73 = v114;
                            v42 = v63;
                            v18 = v103;
                          }

                        }
                        else
                        {
                          v48 = v95;
                          LOBYTE(v30) = 0;
                          v73 = v114;
                          v18 = v103;
                          v42 = v85;
                        }

                      }
                      else
                      {
                        v48 = v95;
                        LOBYTE(v30) = 0;
                        v73 = v114;
                        v18 = v103;
                      }

                    }
                    else
                    {
                      v48 = v95;
                      LOBYTE(v30) = 0;
                      v73 = v114;
                      v18 = v103;
                      v42 = v90;
                    }

                  }
                  else
                  {
                    v48 = v95;
                    LOBYTE(v30) = 0;
                    v73 = v114;
                    v18 = v103;
                  }

                }
                else
                {
                  v48 = v95;
                  v42 = v96;
                  LOBYTE(v30) = 0;
                  v73 = v114;
                  v18 = v103;
                }

              }
              else
              {
                LOBYTE(v30) = 0;
                v73 = v114;
                v18 = v103;
              }

            }
            else
            {
              LOBYTE(v30) = 0;
              v73 = v114;
              v42 = v46;
              v18 = v103;
            }

          }
          else
          {
            LOBYTE(v30) = 0;
            v73 = v114;
            v18 = v103;
          }

          v38 = v42;
        }
        else
        {
          LOBYTE(v30) = 0;
          v73 = v114;
        }

        v34 = v38;
      }
      else
      {
        LOBYTE(v30) = 0;
        v73 = v114;
      }

      v31 = v34;
    }
    else
    {
      v73 = v114;
    }

    v27 = v31;
    v23 = v112;
  }
  else
  {
    LOBYTE(v30) = 0;
    v73 = v114;
  }

  if ((v30 & 1) == 0)
  {
    v24 = v27;
    goto LABEL_66;
  }
  v74 = self->_builder;
  v118 = v27;
  -[KVItemBuilder buildItemWithError:](v74, "buildItemWithError:", &v118);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v118;

  if (v75)
  {
    v129[0] = v75;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v129, 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    KMMapperSetBuilderError((uint64_t)v117, v24);
    v76 = 0;
  }

LABEL_68:
  return v76;
}

- (BOOL)_addLabeledFieldsOfType:(int64_t)a3 labeledValues:(id)a4 labelOnly:(BOOL)a5 error:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v26;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = v8;
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    LOBYTE(v24) = 1;
    goto LABEL_34;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v11)
  {
    LOBYTE(v24) = 1;
    goto LABEL_33;
  }
  v12 = v11;
  v26 = v9;
  v13 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v30 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v15, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v15, "label");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");
        v19 = objc_msgSend(CFSTR("_$!<"), "length");
        if (v18 >= objc_msgSend(CFSTR(">!$_"), "length") + v19
          && (objc_msgSend(v17, "hasPrefix:", CFSTR("_$!<")) & 1) != 0)
        {
          v20 = objc_msgSend(v17, "hasSuffix:", CFSTR(">!$_"));

          if ((v20 & 1) != 0)
          {
LABEL_25:

            continue;
          }
        }
        else
        {

        }
        if (a5)
        {
          v21 = 0;
          goto LABEL_24;
        }
        objc_msgSend(v15, "value");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = v22;
LABEL_21:
            v21 = v23;
LABEL_23:

LABEL_24:
            -[KVItemBuilder addFieldWithType:label:value:error:](self->_builder, "addFieldWithType:label:value:error:", a3, v17, v21, a6);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v24)
            {

              goto LABEL_31;
            }
            goto LABEL_25;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v22, "name");
            v23 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
        }
        v21 = 0;
        goto LABEL_23;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
      continue;
    break;
  }
  LOBYTE(v24) = 1;
LABEL_31:
  v9 = v26;
LABEL_33:

LABEL_34:
  return (char)v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeItemIdKey, 0);
  objc_storeStrong((id *)&self->_meCardIdentifierKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end
