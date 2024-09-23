@implementation ML3ContainerItemDiffOperation

- (ML3ContainerItemDiffOperation)initWithContainerPersistentID:(int64_t)a3 updatedItemsPersistentIDs:(id)a4 connection:(id)a5
{
  return -[ML3ContainerItemDiffOperation initWithContainerPersistentID:updatedItemsPersistentIDs:updatedItemsProperties:connection:](self, "initWithContainerPersistentID:updatedItemsPersistentIDs:updatedItemsProperties:connection:", a3, a4, MEMORY[0x1E0C9AA70], a5);
}

- (ML3ContainerItemDiffOperation)initWithContainerPersistentID:(int64_t)a3 updatedItemsPersistentIDs:(id)a4 updatedItemsProperties:(id)a5 connection:(id)a6
{
  id v10;
  id v11;
  id v12;
  ML3ContainerItemDiffOperation *v13;
  ML3ContainerItemDiffOperation *v14;
  uint64_t v15;
  NSArray *updatedItemsPersistentIDs;
  uint64_t v17;
  NSDictionary *updatedItemsProperties;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ML3ContainerItemDiffOperation;
  v13 = -[ML3ContainerItemDiffOperation init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_containerPersistentID = a3;
    v15 = objc_msgSend(v10, "copy");
    updatedItemsPersistentIDs = v14->_updatedItemsPersistentIDs;
    v14->_updatedItemsPersistentIDs = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    updatedItemsProperties = v14->_updatedItemsProperties;
    v14->_updatedItemsProperties = (NSDictionary *)v17;

    objc_storeStrong((id *)&v14->_connection, a6);
  }

  return v14;
}

- (void)main
{
  ML3DatabaseConnection *connection;
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  ML3ContainerItemDiffOperation *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *updatedItemsPersistentIDs;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int8x8_t v28;
  uint8x8_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  char v49;
  char v50;
  uint64_t v51;
  void *v52;
  __CFString *v53;
  uint64_t v54;
  void *v55;
  __CFString *v56;
  uint64_t v57;
  void *v58;
  __CFString *v59;
  __CFString *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  ML3ContainerItemDiffOperation *j;
  _QWORD *v69;
  _QWORD *k;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  __CFString *v75;
  void *v76;
  __CFString *v77;
  _QWORD *v78;
  id v79;
  NSArray *obj;
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
  id v92;
  uint64_t *v93;
  _QWORD v94[5];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[7];
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, _QWORD *);
  uint64_t (*v104)(uint64_t);
  _BYTE v105[32];
  uint64_t v106;
  int v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _QWORD v122[4];

  v122[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = 0;
  v115 = &v114;
  v116 = 0x3032000000;
  v117 = __Block_byref_object_copy__7757;
  v118 = __Block_byref_object_dispose__7758;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v119 = (id)objc_claimAutoreleasedReturnValue();
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__7757;
  v112 = __Block_byref_object_dispose__7758;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v113 = (id)objc_claimAutoreleasedReturnValue();
  v100 = 0;
  v101 = &v100;
  v102 = 0x5812000000;
  v103 = __Block_byref_object_copy__54;
  v104 = __Block_byref_object_dispose__55;
  memset(v105, 0, sizeof(v105));
  v106 = 0;
  v107 = 1065353216;
  connection = self->_connection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_containerPersistentID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseConnection executeQuery:withParameters:](connection, "executeQuery:withParameters:", CFSTR("SELECT container_item_pid, item_pid, position, uuid, position_uuid, occurrence_id, subscription_store_item_id, cloud_universal_library_id, store_item_id, cloud_status, in_my_library, playback_endpoint_type FROM container_item LEFT OUTER JOIN item USING (item_pid) LEFT OUTER JOIN item_store USING (item_pid) WHERE container_pid = ? ORDER BY position"), v4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __37__ML3ContainerItemDiffOperation_main__block_invoke;
  v99[3] = &unk_1E5B62B78;
  v99[4] = &v114;
  v99[5] = &v108;
  v99[6] = &v100;
  objc_msgSend(v74, "enumerateRowsWithBlock:", v99);
  v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v5 = self->_updatedItemsPersistentIDs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v95, v121, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v96 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
        objc_msgSend((id)v109[5], "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
          objc_msgSend(v79, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v95, v121, 16);
    }
    while (v6);
  }

  v12 = self;
  v73 = (void *)-[NSDictionary mutableCopy](self->_updatedItemsProperties, "mutableCopy");
  v13 = objc_msgSend(v79, "count");
  if (v13)
  {
    v14 = 0;
    while (v13 > v14)
    {
      v15 = (void *)MEMORY[0x1AF43CC0C]();
      if (v13 - v14 >= 0x2710)
        v16 = 10000;
      else
        v16 = v13 - v14;
      +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "statementWithPrefix:inParameterCount:", CFSTR("SELECT item_pid, subscription_store_item_id, cloud_universal_library_id, store_item_id, cloud_status, in_my_library, playback_endpoint_type FROM item LEFT OUTER JOIN item_store USING (item_pid) WHERE item_pid"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v79, "subarrayWithRange:", v14, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3DatabaseConnection executeQuery:withParameters:](self->_connection, "executeQuery:withParameters:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __37__ML3ContainerItemDiffOperation_main__block_invoke_2;
      v94[3] = &unk_1E5B65200;
      v94[4] = &v108;
      objc_msgSend(v20, "enumerateRowsWithBlock:", v94);

      v14 += v16;
      objc_autoreleasePoolPop(v15);
      v12 = self;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  updatedItemsPersistentIDs = v12->_updatedItemsPersistentIDs;
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __37__ML3ContainerItemDiffOperation_main__block_invoke_3;
  v90[3] = &unk_1E5B62508;
  v93 = &v108;
  v72 = v21;
  v91 = v72;
  v84 = v73;
  v92 = v84;
  -[NSArray enumerateObjectsUsingBlock:](updatedItemsPersistentIDs, "enumerateObjectsUsingBlock:", v90);
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v12->_updatedItemsPersistentIDs;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v120, 16);
  if (v23)
  {
    v24 = 0;
    v83 = *(_QWORD *)v87;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v87 != v83)
          objc_enumerationMutation(obj);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v25), "longLongValue");
        v27 = v26;
        v28 = (int8x8_t)v101[7];
        if (!*(_QWORD *)&v28)
          goto LABEL_39;
        v29 = (uint8x8_t)vcnt_s8(v28);
        v29.i16[0] = vaddlv_u8(v29);
        if (v29.u32[0] > 1uLL)
        {
          v30 = v26;
          if (v26 >= *(_QWORD *)&v28)
            v30 = v26 % *(_QWORD *)&v28;
        }
        else
        {
          v30 = (*(_QWORD *)&v28 - 1) & v26;
        }
        v31 = v101[6];
        v32 = *(_QWORD **)(v31 + 8 * v30);
        if (!v32 || (v33 = (_QWORD *)*v32) == 0)
        {
LABEL_39:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("occurrence_id"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          +[ML3ContainerItemDiffMetadata diffMetadataWithPersistentID:containerPersistentID:itemPersistentID:newPosition:previousPosition:uuid:positionUUD:occurrenceID:](ML3ContainerItemDiffMetadata, "diffMetadataWithPersistentID:containerPersistentID:itemPersistentID:newPosition:previousPosition:uuid:positionUUD:occurrenceID:", 0, self->_containerPersistentID, v27, v24, -1, &stru_1E5B66908, &stru_1E5B66908, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "addObject:", v39);
          goto LABEL_40;
        }
        v34 = *(_QWORD *)&v28 - 1;
        while (1)
        {
          v35 = v33[1];
          if (v26 == v35)
            break;
          if (v29.u32[0] > 1uLL)
          {
            if (v35 >= *(_QWORD *)&v28)
              v35 %= *(_QWORD *)&v28;
          }
          else
          {
            v35 &= v34;
          }
          if (v35 != v30)
            goto LABEL_39;
LABEL_38:
          v33 = (_QWORD *)*v33;
          if (!v33)
            goto LABEL_39;
        }
        if (v33[2] != v26)
          goto LABEL_38;
        if (v29.u32[0] > 1uLL)
        {
          v40 = v26;
          if (v26 >= *(_QWORD *)&v28)
            v40 = v26 % *(_QWORD *)&v28;
        }
        else
        {
          v40 = v34 & v26;
        }
        v41 = *(_QWORD **)(v31 + 8 * v40);
        if (!v41 || (v42 = (_QWORD *)*v41) == 0)
LABEL_87:
          std::__throw_out_of_range[abi:ne180100]();
        while (2)
        {
          v43 = v42[1];
          if (v43 != v26)
          {
            if (v29.u32[0] > 1uLL)
            {
              if (v43 >= *(_QWORD *)&v28)
                v43 %= *(_QWORD *)&v28;
            }
            else
            {
              v43 &= v34;
            }
            if (v43 != v40)
              goto LABEL_87;
LABEL_56:
            v42 = (_QWORD *)*v42;
            if (!v42)
              goto LABEL_87;
            continue;
          }
          break;
        }
        if (v42[2] != v26)
          goto LABEL_56;
        v78 = (_QWORD *)v42[3];
        if ((_QWORD *)v42[4] == v78)
          goto LABEL_39;
        v44 = (void *)v115[5];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v45);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "objectForKeyedSubscript:", v46);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          v47 = v38;
          v48 = v39;
          v76 = v47;
          if (v47 == v48)
            v49 = 1;
          else
            v49 = objc_msgSend(v47, "isEqual:", v48);

          v50 = v49 ^ 1;
        }
        else
        {
          v50 = 0;
        }
        if (v78[1] != v24 || (v50 & 1) != 0)
        {
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("uuid"));
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = (void *)v51;
          if (v51)
            v53 = (__CFString *)v51;
          else
            v53 = &stru_1E5B66908;
          v77 = v53;

          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("position_uuid"));
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = (void *)v54;
          if (v54)
            v56 = (__CFString *)v54;
          else
            v56 = &stru_1E5B66908;
          v75 = v56;

          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("occurrence_id"));
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = (void *)v57;
          if (v57)
            v59 = (__CFString *)v57;
          else
            v59 = &stru_1E5B66908;
          v60 = v59;

          +[ML3ContainerItemDiffMetadata diffMetadataWithPersistentID:containerPersistentID:itemPersistentID:newPosition:previousPosition:uuid:positionUUD:occurrenceID:](ML3ContainerItemDiffMetadata, "diffMetadataWithPersistentID:containerPersistentID:itemPersistentID:newPosition:previousPosition:uuid:positionUUD:occurrenceID:", *v78, self->_containerPersistentID, v27, v24, v78[1], v77, v75, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "addObject:", v61);

        }
        v62 = v42[3];
        v63 = v42[4];
        while (1)
        {
          v64 = (_QWORD *)(v62 + 16);
          if (v62 + 16 == v63)
            break;
          v62 += 16;
          v65 = *(_QWORD *)(v62 + 8);
          *(_QWORD *)(v62 - 16) = *v64;
          *(_QWORD *)(v62 - 8) = v65;
        }
        v42[4] = v62;
LABEL_40:

        ++v24;
        ++v25;
      }
      while (v25 != v23);
      v66 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v120, 16);
      v23 = v66;
    }
    while (v66);
  }

  v67 = (_QWORD *)v101[8];
  for (j = self; v67; v67 = (_QWORD *)*v67)
  {
    v69 = (_QWORD *)v67[3];
    for (k = (_QWORD *)v67[4]; v69 != k; j = self)
    {
      +[ML3ContainerItemDiffMetadata diffMetadataWithPersistentID:](ML3ContainerItemDiffMetadata, "diffMetadataWithPersistentID:", *v69);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "addObject:", v71);

      v69 += 2;
    }
  }
  -[ML3ContainerItemDiffOperation setContainerItemsToUpdate:](j, "setContainerItemsToUpdate:", v82);
  -[ML3ContainerItemDiffOperation setContainerItemsToDelete:](j, "setContainerItemsToDelete:", v81);

  _Block_object_dispose(&v100, 8);
  std::__hash_table<std::__hash_value_type<long long,std::vector<std::pair<long long,long long>>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::vector<std::pair<long long,long long>>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::vector<std::pair<long long,long long>>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::vector<std::pair<long long,long long>>>>>::~__hash_table((uint64_t)&v105[8]);
  _Block_object_dispose(&v108, 8);

  _Block_object_dispose(&v114, 8);
}

- (NSArray)containerItemsToUpdate
{
  return self->_containerItemsToUpdate;
}

- (void)setContainerItemsToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_containerItemsToUpdate, a3);
}

- (NSArray)containerItemsToDelete
{
  return self->_containerItemsToDelete;
}

- (void)setContainerItemsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_containerItemsToDelete, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerItemsToDelete, 0);
  objc_storeStrong((id *)&self->_containerItemsToUpdate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_updatedItemsProperties, 0);
  objc_storeStrong((id *)&self->_updatedItemsPersistentIDs, 0);
}

void __37__ML3ContainerItemDiffOperation_main__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint8x8_t v27;
  _QWORD **v28;
  _QWORD *i;
  unint64_t v30;
  _QWORD *v31;
  float v32;
  float v33;
  _BOOL8 v34;
  unint64_t v35;
  unint64_t v36;
  int8x8_t prime;
  void *v38;
  void *v39;
  uint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  uint8x8_t v43;
  unint64_t v44;
  uint8x8_t v45;
  uint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t *v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  uint64_t *v62;
  char *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *v69;
  __CFString *v70;
  void *v71;
  void *v72;
  _QWORD v74[6];
  _QWORD v75[6];
  _QWORD v76[3];
  _QWORD v77[5];

  v77[3] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v67 = a3;
  v65 = v4;
  v66 = objc_msgSend(v4, "int64ForColumnIndex:", 0);
  v5 = objc_msgSend(v4, "int64ForColumnIndex:", 1);
  v68 = objc_msgSend(v4, "int64ForColumnIndex:", 2);
  objc_msgSend(v4, "stringForColumnIndex:", 3);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForColumnIndex:", 4);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForColumnIndex:", 5);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "int64ForColumnIndex:", 6);
  objc_msgSend(v4, "stringForColumnIndex:", 7);
  v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "int64ForColumnIndex:", 8);
  v8 = objc_msgSend(v4, "int64ForColumnIndex:", 9);
  v9 = objc_msgSend(v4, "int64ForColumnIndex:", 10);
  v10 = objc_msgSend(v4, "int64ForColumnIndex:", 11);
  v76[0] = CFSTR("uuid");
  v76[1] = CFSTR("position_uuid");
  v77[0] = v69;
  v77[1] = v71;
  v76[2] = CFSTR("occurrence_id");
  v77[2] = v72;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  v13 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v68);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v14);

  v74[0] = CFSTR("item_store.subscription_store_item_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &stru_1E5B66908;
  if (v70)
    v17 = v70;
  v75[0] = v15;
  v75[1] = v17;
  v74[1] = CFSTR("item_store.cloud_universal_library_id");
  v74[2] = CFSTR("item_store.store_item_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v18;
  v74[3] = CFSTR("item_store.cloud_status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v75[3] = v19;
  v74[4] = CFSTR("in_my_library");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v75[4] = v20;
  v74[5] = CFSTR("item_store.playback_endpoint_type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v75[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

  v25 = *(_QWORD *)(a1[6] + 8);
  v26 = *(_QWORD *)(v25 + 56);
  if (v26)
  {
    v27 = (uint8x8_t)vcnt_s8((int8x8_t)v26);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      v13 = v5;
      if (v5 >= v26)
        v13 = v5 % v26;
    }
    else
    {
      v13 = (v26 - 1) & v5;
    }
    v28 = *(_QWORD ***)(*(_QWORD *)(v25 + 48) + 8 * v13);
    if (v28)
    {
      for (i = *v28; i; i = (_QWORD *)*i)
      {
        v30 = i[1];
        if (v30 == v5)
        {
          if (i[2] == v5)
            goto LABEL_76;
        }
        else
        {
          if (v27.u32[0] > 1uLL)
          {
            if (v30 >= v26)
              v30 %= v26;
          }
          else
          {
            v30 &= v26 - 1;
          }
          if (v30 != v13)
            break;
        }
      }
    }
  }
  i = operator new(0x30uLL);
  v31 = (_QWORD *)(v25 + 64);
  *i = 0;
  i[1] = v5;
  i[2] = v5;
  i[3] = 0;
  i[4] = 0;
  i[5] = 0;
  v32 = (float)(unint64_t)(*(_QWORD *)(v25 + 72) + 1);
  v33 = *(float *)(v25 + 80);
  if (!v26 || (float)(v33 * (float)v26) < v32)
  {
    v34 = 1;
    if (v26 >= 3)
      v34 = (v26 & (v26 - 1)) != 0;
    v35 = v34 | (2 * v26);
    v36 = vcvtps_u32_f32(v32 / v33);
    if (v35 <= v36)
      prime = (int8x8_t)v36;
    else
      prime = (int8x8_t)v35;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v26 = *(_QWORD *)(v25 + 56);
    if (*(_QWORD *)&prime > v26)
      goto LABEL_32;
    if (*(_QWORD *)&prime < v26)
    {
      v44 = vcvtps_u32_f32((float)*(unint64_t *)(v25 + 72) / *(float *)(v25 + 80));
      if (v26 < 3 || (v45 = (uint8x8_t)vcnt_s8((int8x8_t)v26), v45.i16[0] = vaddlv_u8(v45), v45.u32[0] > 1uLL))
      {
        v44 = std::__next_prime(v44);
      }
      else
      {
        v46 = 1 << -(char)__clz(v44 - 1);
        if (v44 >= 2)
          v44 = v46;
      }
      if (*(_QWORD *)&prime <= v44)
        prime = (int8x8_t)v44;
      if (*(_QWORD *)&prime >= v26)
      {
        v26 = *(_QWORD *)(v25 + 56);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v38 = operator new(8 * *(_QWORD *)&prime);
          v39 = *(void **)(v25 + 48);
          *(_QWORD *)(v25 + 48) = v38;
          if (v39)
            operator delete(v39);
          v40 = 0;
          *(int8x8_t *)(v25 + 56) = prime;
          do
            *(_QWORD *)(*(_QWORD *)(v25 + 48) + 8 * v40++) = 0;
          while (*(_QWORD *)&prime != v40);
          v41 = (_QWORD *)*v31;
          if (*v31)
          {
            v42 = v41[1];
            v43 = (uint8x8_t)vcnt_s8(prime);
            v43.i16[0] = vaddlv_u8(v43);
            if (v43.u32[0] > 1uLL)
            {
              if (v42 >= *(_QWORD *)&prime)
                v42 %= *(_QWORD *)&prime;
            }
            else
            {
              v42 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)(v25 + 48) + 8 * v42) = v31;
            v47 = (_QWORD *)*v41;
            if (*v41)
            {
              do
              {
                v48 = v47[1];
                if (v43.u32[0] > 1uLL)
                {
                  if (v48 >= *(_QWORD *)&prime)
                    v48 %= *(_QWORD *)&prime;
                }
                else
                {
                  v48 &= *(_QWORD *)&prime - 1;
                }
                if (v48 != v42)
                {
                  v49 = *(_QWORD *)(v25 + 48);
                  if (!*(_QWORD *)(v49 + 8 * v48))
                  {
                    *(_QWORD *)(v49 + 8 * v48) = v41;
                    goto LABEL_57;
                  }
                  *v41 = *v47;
                  *v47 = **(_QWORD **)(*(_QWORD *)(v25 + 48) + 8 * v48);
                  **(_QWORD **)(*(_QWORD *)(v25 + 48) + 8 * v48) = v47;
                  v47 = v41;
                }
                v48 = v42;
LABEL_57:
                v41 = v47;
                v47 = (_QWORD *)*v47;
                v42 = v48;
              }
              while (v47);
            }
          }
          v26 = (unint64_t)prime;
          goto LABEL_61;
        }
        v64 = *(void **)(v25 + 48);
        *(_QWORD *)(v25 + 48) = 0;
        if (v64)
          operator delete(v64);
        v26 = 0;
        *(_QWORD *)(v25 + 56) = 0;
      }
    }
LABEL_61:
    if ((v26 & (v26 - 1)) != 0)
    {
      if (v5 >= v26)
        v13 = v5 % v26;
      else
        v13 = v5;
    }
    else
    {
      v13 = (v26 - 1) & v5;
    }
  }
  v50 = *(_QWORD *)(v25 + 48);
  v51 = *(_QWORD **)(v50 + 8 * v13);
  if (v51)
  {
    *i = *v51;
LABEL_74:
    *v51 = i;
    goto LABEL_75;
  }
  *i = *v31;
  *v31 = i;
  *(_QWORD *)(v50 + 8 * v13) = v31;
  if (*i)
  {
    v52 = *(_QWORD *)(*i + 8);
    if ((v26 & (v26 - 1)) != 0)
    {
      if (v52 >= v26)
        v52 %= v26;
    }
    else
    {
      v52 &= v26 - 1;
    }
    v51 = (_QWORD *)(*(_QWORD *)(v25 + 48) + 8 * v52);
    goto LABEL_74;
  }
LABEL_75:
  ++*(_QWORD *)(v25 + 72);
LABEL_76:
  v54 = (uint64_t *)i[4];
  v53 = i[5];
  if ((unint64_t)v54 >= v53)
  {
    v56 = (uint64_t *)i[3];
    v57 = ((char *)v54 - (char *)v56) >> 4;
    v58 = v57 + 1;
    if ((unint64_t)(v57 + 1) >> 60)
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    v59 = v53 - (_QWORD)v56;
    if (v59 >> 3 > v58)
      v58 = v59 >> 3;
    if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF0)
      v60 = 0xFFFFFFFFFFFFFFFLL;
    else
      v60 = v58;
    if (v60)
    {
      if (v60 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v61 = (char *)operator new(16 * v60);
      v56 = (uint64_t *)i[3];
      v54 = (uint64_t *)i[4];
    }
    else
    {
      v61 = 0;
    }
    v62 = (uint64_t *)&v61[16 * v57];
    v63 = &v61[16 * v60];
    *v62 = v66;
    v62[1] = v68;
    v55 = v62 + 2;
    if (v54 != v56)
    {
      do
      {
        *((_OWORD *)v62 - 1) = *((_OWORD *)v54 - 1);
        v62 -= 2;
        v54 -= 2;
      }
      while (v54 != v56);
      v56 = (uint64_t *)i[3];
    }
    i[3] = v62;
    i[4] = v55;
    i[5] = v63;
    if (v56)
      operator delete(v56);
  }
  else
  {
    *v54 = v66;
    v54[1] = v68;
    v55 = v54 + 2;
  }
  i[4] = v55;

}

void __37__ML3ContainerItemDiffOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  v5 = objc_msgSend(v3, "int64ForColumnIndex:", 1);
  objc_msgSend(v3, "stringForColumnIndex:", 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v6;
  v7 = objc_msgSend(v3, "int64ForColumnIndex:", 3);
  v8 = objc_msgSend(v3, "int64ForColumnIndex:", 4);
  v9 = objc_msgSend(v3, "int64ForColumnIndex:", 5);
  v10 = objc_msgSend(v3, "int64ForColumnIndex:", 6);
  v23[0] = CFSTR("item_store.subscription_store_item_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_1E5B66908;
  if (v6)
    v13 = (const __CFString *)v6;
  v24[0] = v11;
  v24[1] = v13;
  v23[1] = CFSTR("item_store.cloud_universal_library_id");
  v23[2] = CFSTR("item_store.store_item_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v14;
  v23[3] = CFSTR("item_store.cloud_status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v15;
  v23[4] = CFSTR("in_my_library");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v4;
  v24[4] = v16;
  v23[5] = CFSTR("item_store.playback_endpoint_type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

}

void __37__ML3ContainerItemDiffOperation_main__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;

  v29 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("item_store.subscription_store_item_id"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v26, "longLongValue");
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("item_store.cloud_universal_library_id"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("item_store.store_item_id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");
  v6 = objc_msgSend(v29, "longLongValue");
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("item_store.cloud_status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("in_my_library"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("item_store.playback_endpoint_type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ML3ContainerItemOccurrencePrefix(v24, v25, v5, v6, v8, v10, objc_msgSend(v11, "longLongValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v12);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("_%lld"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, CFSTR("occurrence_id"));
  v22 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

}

@end
