@implementation KMMapper_HMHome

- (KMMapper_HMHome)init
{
  KMMapper_HMHome *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KMMapper_HMHome;
  v2 = -[KMMapper_HMHome init](&v6, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

  }
  return v2;
}

- (int64_t)targetItemType
{
  return 4;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v7;
  NSMutableArray *v8;
  NSMutableArray *items;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t n;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  char v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  void *v89;
  _BOOL4 v90;
  NSMutableArray *v91;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id obj;
  id obja;
  void *v105;
  uint64_t v106;
  void *v107;
  id *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  items = self->_items;
  self->_items = v8;

  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assistantIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = a5;
  v14 = -[KMMapper_HMHome _addItemWithItemId:assistantHomeKitId:fieldType:name:error:](self, "_addItemWithItemId:assistantHomeKitId:fieldType:name:error:", v11, v12, 150, v13, a5);

  if (!v14)
    goto LABEL_73;
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v105 = v7;
  objc_msgSend(v7, "zones");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v130;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v130 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
        objc_msgSend(v20, "rooms");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          objc_msgSend(v20, "uniqueIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "UUIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "assistantIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[KMMapper_HMHome _addItemWithItemId:assistantHomeKitId:fieldType:name:error:](self, "_addItemWithItemId:assistantHomeKitId:fieldType:name:error:", v24, v25, 151, v26, v108);

          if (!v27)
          {
LABEL_70:

LABEL_71:
            v91 = 0;
            v7 = v105;
            goto LABEL_74;
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
    }
    while (v17);
  }

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  objc_msgSend(v105, "rooms");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v125, v137, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v126;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v126 != v30)
          objc_enumerationMutation(v15);
        v32 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * j);
        objc_msgSend(v32, "uniqueIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "UUIDString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "assistantIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[KMMapper_HMHome _addItemWithItemId:assistantHomeKitId:fieldType:name:error:](self, "_addItemWithItemId:assistantHomeKitId:fieldType:name:error:", v34, v35, 152, v36, v108);

        if (!v37)
          goto LABEL_70;
      }
      v29 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v125, v137, 16);
    }
    while (v29);
  }

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  objc_msgSend(v105, "serviceGroups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v121, v136, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v122;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v122 != v40)
          objc_enumerationMutation(v15);
        v42 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * k);
        objc_msgSend(v42, "services");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");

        if (v44)
        {
          objc_msgSend(v42, "uniqueIdentifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "UUIDString");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "assistantIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "name");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = -[KMMapper_HMHome _addItemWithItemId:assistantHomeKitId:fieldType:name:error:](self, "_addItemWithItemId:assistantHomeKitId:fieldType:name:error:", v46, v47, 154, v48, v108);

          if (!v49)
            goto LABEL_70;
        }
      }
      v39 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v121, v136, 16);
    }
    while (v39);
  }

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v7 = v105;
  objc_msgSend(v105, "actionSets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v135, 16);
  if (!v50)
    goto LABEL_41;
  v51 = v50;
  v106 = *(_QWORD *)v118;
  v52 = *MEMORY[0x24BDD5218];
  v101 = *MEMORY[0x24BDD5220];
  do
  {
    for (m = 0; m != v51; ++m)
    {
      if (*(_QWORD *)v118 != v106)
        objc_enumerationMutation(obj);
      v54 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * m);
      objc_msgSend(v54, "actionSetType");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isEqualToString:", v52);

      if ((v56 & 1) != 0)
        continue;
      objc_msgSend(v54, "actionSetType");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v57, "isEqualToString:", v101) & 1) == 0)
      {

LABEL_38:
        objc_msgSend(v54, "uniqueIdentifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "UUIDString");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "assistantIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "name");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = -[KMMapper_HMHome _addItemWithItemId:assistantHomeKitId:fieldType:name:error:](self, "_addItemWithItemId:assistantHomeKitId:fieldType:name:error:", v61, v62, 155, v63, v108);

        if (v64)
          continue;

LABEL_73:
        v91 = 0;
        goto LABEL_74;
      }
      objc_msgSend(v54, "actions");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "count");

      if (v59)
        goto LABEL_38;
    }
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v135, 16);
  }
  while (v51);
LABEL_41:

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  objc_msgSend(v105, "accessories");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v113, v134, 16);
  if (!v100)
    goto LABEL_69;
  v66 = *(_QWORD *)v114;
  v97 = *MEMORY[0x24BDD49E0];
  v95 = *MEMORY[0x24BDD49A0];
  v94 = *MEMORY[0x24BDD4990];
  v93 = *MEMORY[0x24BDD4A30];
  v98 = *(_QWORD *)v114;
  v99 = v65;
  while (2)
  {
    v67 = 0;
    while (2)
    {
      if (*(_QWORD *)v114 != v66)
        objc_enumerationMutation(v65);
      v102 = v67;
      v68 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v67);
      objc_msgSend(v68, "name");
      v69 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "category");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "categoryType");
      obja = (id)objc_claimAutoreleasedReturnValue();

      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      objc_msgSend(v68, "services");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v109, v133, 16);
      if (v72)
      {
        v73 = v72;
        v96 = v68;
        v74 = 0;
        v75 = *(_QWORD *)v110;
        v107 = v71;
        while (2)
        {
          for (n = 0; n != v73; ++n)
          {
            if (*(_QWORD *)v110 != v75)
              objc_enumerationMutation(v71);
            v77 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * n);
            if (objc_msgSend(v77, "isUserInteractive"))
            {
              objc_msgSend(v77, "name");
              v78 = objc_claimAutoreleasedReturnValue();
              if (v78 | v69)
              {
                v79 = (void *)v78;
                objc_msgSend(v77, "name");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = objc_msgSend(v80, "isEqual:", v69);

                if ((v81 & 1) == 0)
                {
                  objc_msgSend(v77, "uniqueIdentifier");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "UUIDString");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "assistantIdentifier");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "name");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = -[KMMapper_HMHome _addItemWithItemId:assistantHomeKitId:fieldType:name:error:](self, "_addItemWithItemId:assistantHomeKitId:fieldType:name:error:", v83, v84, 153, v85, v108);

                  if (!v86)
                  {

                    v65 = v99;
                    goto LABEL_76;
                  }
                }
                v74 = 1;
                v71 = v107;
              }
              else
              {
                v74 = 1;
              }
            }
          }
          v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v109, v133, 16);
          if (v73)
            continue;
          break;
        }

        v65 = v99;
        v68 = v96;
        if ((v74 & 1) != 0)
          goto LABEL_66;
      }
      else
      {

      }
      if ((objc_msgSend(obja, "isEqual:", v97) & 1) != 0
        || (objc_msgSend(obja, "isEqual:", v95) & 1) != 0
        || (objc_msgSend(obja, "isEqual:", v94) & 1) != 0
        || objc_msgSend(obja, "isEqual:", v93))
      {
LABEL_66:
        objc_msgSend(v68, "uniqueIdentifier");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "UUIDString");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "assistantIdentifier");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = -[KMMapper_HMHome _addItemWithItemId:assistantHomeKitId:fieldType:name:error:](self, "_addItemWithItemId:assistantHomeKitId:fieldType:name:error:", v88, v89, 157, v69, v108);

        if (!v90)
        {
LABEL_76:

          goto LABEL_71;
        }
      }

      v67 = v102 + 1;
      v7 = v105;
      v66 = v98;
      if (v102 + 1 != v100)
        continue;
      break;
    }
    v100 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v113, v134, 16);
    if (v100)
      continue;
    break;
  }
LABEL_69:

  v91 = self->_items;
LABEL_74:

  return v91;
}

- (BOOL)_addItemWithItemId:(id)a3 assistantHomeKitId:(id)a4 fieldType:(int64_t)a5 name:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  KVItemBuilder *builder;
  void *v15;
  id v16;
  KVItemBuilder *v17;
  void *v18;
  id v19;
  KVItemBuilder *v20;
  void *v21;
  KVItemBuilder *v22;
  void *v23;
  BOOL v24;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a4;
  v13 = a6;
  builder = self->_builder;
  v29 = 0;
  -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 4, a3, &v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v29;
  if (!v15)
    goto LABEL_6;
  v17 = self->_builder;
  v28 = v16;
  -[KVItemBuilder addFieldWithType:value:error:](v17, "addFieldWithType:value:error:", a5, v13, &v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v28;

  if (!v18)
  {

    goto LABEL_8;
  }
  v20 = self->_builder;
  v27 = v19;
  -[KVItemBuilder addFieldWithType:value:error:](v20, "addFieldWithType:value:error:", 158, v12, &v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v27;

  if (!v21)
  {
LABEL_6:
    v19 = v16;
LABEL_8:
    KMMapperSetBuilderError((uint64_t)a7, v19);
    v24 = 0;
    goto LABEL_11;
  }
  v22 = self->_builder;
  v26 = v16;
  -[KVItemBuilder buildItemWithError:](v22, "buildItemWithError:", &v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v26;

  v24 = v23 != 0;
  if (v23)
    -[NSMutableArray addObject:](self->_items, "addObject:", v23);
  else
    KMMapperSetBuilderError((uint64_t)a7, v19);

LABEL_11:
  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end
