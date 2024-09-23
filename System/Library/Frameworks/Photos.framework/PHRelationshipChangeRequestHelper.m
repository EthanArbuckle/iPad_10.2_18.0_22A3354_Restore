@implementation PHRelationshipChangeRequestHelper

- (PHRelationshipChangeRequestHelper)initWithRelationshipName:(id)a3 changeRequestHelper:(id)a4
{
  id v7;
  id v8;
  PHRelationshipChangeRequestHelper *v9;
  id *p_isa;
  PHRelationshipChangeRequestHelper *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v13.receiver = self;
    v13.super_class = (Class)PHRelationshipChangeRequestHelper;
    v9 = -[PHRelationshipChangeRequestHelper init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_relationshipName, a3);
      objc_storeStrong(p_isa + 8, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PHRelationshipChangeRequestHelper)initWithRelationshipName:(id)a3 xpcDict:(id)a4 changeRequestHelper:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHRelationshipChangeRequestHelper *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableArray *mutableObjectIDsAndUUIDs;
  PHRelationshipChangeRequestHelper *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSArray *originalObjectIDs;
  _QWORD v26[4];
  id v27;
  PHRelationshipChangeRequestHelper *v28;
  _QWORD applier[4];
  PHRelationshipChangeRequestHelper *v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:](self, "initWithRelationshipName:changeRequestHelper:", v8, v10);
  if (v11)
  {
    xpc_dictionary_get_value(v9, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      xpc_dictionary_get_value(v12, "mutableObjectIDsAndUUIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v10, "request");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "persistentStoreCoordinator");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHChangeRequestHelper changeRequest](v11->_changeRequestHelper, "changeRequest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "recordUpdateRequest:", v17);

        -[PHChangeRequestHelper setMutated:](v11->_changeRequestHelper, "setMutated:", 1);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", xpc_array_get_count(v14));
        v18 = objc_claimAutoreleasedReturnValue();
        mutableObjectIDsAndUUIDs = v11->_mutableObjectIDsAndUUIDs;
        v11->_mutableObjectIDsAndUUIDs = (NSMutableArray *)v18;

        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __90__PHRelationshipChangeRequestHelper_initWithRelationshipName_xpcDict_changeRequestHelper___block_invoke;
        applier[3] = &unk_1E35DEE78;
        v20 = v11;
        v30 = v20;
        v21 = v16;
        v31 = v21;
        xpc_array_apply(v14, applier);
        xpc_dictionary_get_value(v13, "originalObjectIDs");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", xpc_array_get_count(v22));
        v23 = objc_claimAutoreleasedReturnValue();
        originalObjectIDs = v20->_originalObjectIDs;
        v20->_originalObjectIDs = (NSArray *)v23;

        if (v22)
        {
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __90__PHRelationshipChangeRequestHelper_initWithRelationshipName_xpcDict_changeRequestHelper___block_invoke_2;
          v26[3] = &unk_1E35DEE78;
          v27 = v21;
          v28 = v20;
          xpc_array_apply(v22, v26);

        }
      }

    }
  }

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  xpc_object_t v5;
  xpc_object_t v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  xpc_object_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unsigned __int8 uu[8];
  uint64_t v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_mutableObjectIDsAndUUIDs)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    v21 = v4;
    xpc_dictionary_set_value(v4, -[NSString UTF8String](self->_relationshipName, "UTF8String"), v5);
    v6 = xpc_array_create(0, 0);
    xpc_dictionary_set_value(v5, "originalObjectIDs", v6);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = self->_originalObjectIDs;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          PLXPCArrayAppendManagedObjectID();
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      }
      while (v9);
    }

    v12 = xpc_array_create(0, 0);
    xpc_dictionary_set_value(v5, "mutableObjectIDsAndUUIDs", v12);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = self->_mutableObjectIDsAndUUIDs;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
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
          v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            PLXPCArrayAppendManagedObjectID();
          }
          else
          {
            *(_QWORD *)uu = 0;
            v31 = 0;
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v18);
            v20 = v19;
            if (v19)
            {
              objc_msgSend(v19, "getUUIDBytes:", uu);
              if (!uuid_is_null(uu))
                xpc_array_set_uuid(v12, 0xFFFFFFFFFFFFFFFFLL, uu);
            }

          }
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      }
      while (v15);
    }

    v4 = v21;
  }

}

- (void)prepareIfNeededWithExistentObjectIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self, "originalObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (v9)
      v5 = v9;
    else
      v5 = (id)MEMORY[0x1E0C9AA60];
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self, "setOriginalObjectIDs:", v5);
  }
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self, "mutableObjectIDsAndUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PHRelationshipChangeRequestHelper originalObjectIDs](self, "originalObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](self, "setMutableObjectIDsAndUUIDs:", v8);

  }
}

- (NSString)destinationUUIDKeyPath
{
  __CFString *destinationUUIDKeyPath;

  destinationUUIDKeyPath = (__CFString *)self->_destinationUUIDKeyPath;
  if (!destinationUUIDKeyPath)
  {
    self->_destinationUUIDKeyPath = (NSString *)CFSTR("uuid");
    destinationUUIDKeyPath = CFSTR("uuid");
  }
  return (NSString *)destinationUUIDKeyPath;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 orderedMutableChildren:(id)a4 error:(id *)a5
{
  void *v7;
  BOOL v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t m;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t n;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t ii;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  int v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  int v97;
  BOOL v98;
  void *v100;
  void *v101;
  id v102;
  id v103;
  uint64_t v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  int v109;
  id v110;
  id v112;
  PHRelationshipChangeRequestHelper *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  _QWORD v118[4];
  id v119;
  id v120;
  id v121;
  id v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD v126[4];
  id v127;
  id v128;
  id v129;
  id v130;
  uint64_t *v131;
  uint64_t v132;
  char v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[4];
  id v143;
  id v144;
  id v145;
  PHRelationshipChangeRequestHelper *v146;
  id v147;
  id v148;
  uint64_t *v149;
  uint64_t *v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  id v155;
  _QWORD v156[4];
  id v157;
  id v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t (*v179)(uint64_t, uint64_t);
  void (*v180)(uint64_t);
  id v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  char v185;
  uint8_t buf[4];
  const char *v187;
  __int16 v188;
  int v189;
  __int16 v190;
  int v191;
  _BYTE v192[128];
  uint64_t v193;
  void *v194;
  _BYTE v195[128];
  uint64_t v196;
  void *v197;
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  uint64_t v201;

  v201 = *MEMORY[0x1E0C80C00];
  v112 = a3;
  v114 = a4;
  v182 = 0;
  v183 = &v182;
  v184 = 0x2020000000;
  v185 = 1;
  v176 = 0;
  v177 = &v176;
  v178 = 0x3032000000;
  v179 = __Block_byref_object_copy__7891;
  v180 = __Block_byref_object_dispose__7892;
  v181 = 0;
  v113 = self;
  if (-[PHChangeRequestHelper isMutated](self->_changeRequestHelper, "isMutated") && self->_mutableObjectIDsAndUUIDs)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", self->_originalObjectIDs);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", self->_mutableObjectIDsAndUUIDs);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = 0;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = 0;
    v173 = 0;
    v172 = 0;
    v171 = 0;
    diffOrderedSets();
    v107 = 0;
    v110 = 0;
    v105 = 0;
    v103 = 0;

    if (objc_msgSend(v105, "count"))
      v8 = v175 == 0;
    else
      v8 = 1;
    v9 = !v8;
    v109 = v9;
    v104 = objc_msgSend(v110, "count");
    objc_msgSend(v112, "managedObjectContext");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & v109) == 1)
    {
      v10 = v112;
      if (objc_msgSend(v10, "customSortKey"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v114, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v10;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v114, "count"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v169 = 0u;
        v170 = 0u;
        v167 = 0u;
        v168 = 0u;
        v12 = v114;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v167, v200, 16);
        if (v13)
        {
          v14 = 0;
          v15 = *(_QWORD *)v168;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v168 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14 + i);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKey:", v18, v19);

              objc_msgSend(v17, "objectID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14 + i);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "setObject:forKey:", v20, v21);

            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v167, v200, 16);
            v14 = (v14 + i);
          }
          while (v13);
        }

        v165 = 0u;
        v166 = 0u;
        v163 = 0u;
        v164 = 0u;
        v22 = v113->_mutableObjectIDsAndUUIDs;
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v163, v199, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v164;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v164 != v24)
                objc_enumerationMutation(v22);
              v26 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * j);
              objc_msgSend(v11, "objectForKey:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "removeObjectForKey:", v26);
              objc_msgSend(v115, "removeObjectForKey:", v27);

            }
            v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v163, v199, 16);
          }
          while (v23);
        }

        objc_msgSend(v101, "setCustomSortKey:", 0);
        v161 = 0u;
        v162 = 0u;
        v159 = 0u;
        v160 = 0u;
        v28 = v113->_originalObjectIDs;
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v159, v198, 16);
        if (v29)
        {
          v30 = 0;
          v31 = *(_QWORD *)v160;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v160 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(v117, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * k));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v12, "indexOfObject:", v33);

              objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "moveObjectsAtIndexes:toIndex:", v35, v30 + k);

            }
            v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v159, v198, 16);
            v30 += k;
          }
          while (v29);
        }

        for (m = 0; objc_msgSend(v12, "count") > m; ++m)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", m);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "objectForKey:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            objc_msgSend(v117, "objectWithID:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v12, "indexOfObject:", v39);

            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "moveObjectsAtIndexes:toIndex:", v41, m);

          }
        }

        v10 = v101;
      }

    }
    if (objc_msgSend(v107, "count"))
      v42 = !-[PHRelationshipChangeRequestHelper allowsRemove](v113, "allowsRemove");
    else
      v42 = 0;
    if (objc_msgSend(v110, "count"))
      v43 = !-[PHRelationshipChangeRequestHelper allowsInsert](v113, "allowsInsert");
    else
      v43 = 0;
    if (v109)
    {
      v44 = !-[PHRelationshipChangeRequestHelper allowsMove](v113, "allowsMove");
      if ((v42 & 1) == 0)
        goto LABEL_47;
    }
    else
    {
      v44 = 0;
      if ((v42 & 1) == 0)
      {
LABEL_47:
        v45 = (v43 | v44) ^ 1;
        *((_BYTE *)v183 + 24) = (v43 | v44) ^ 1;
        if (((v43 | v44) & 1) == 0)
          goto LABEL_52;
        goto LABEL_51;
      }
    }
    *((_BYTE *)v183 + 24) = 0;
LABEL_51:
    v46 = (void *)MEMORY[0x1E0CB35C8];
    v196 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid operation (insert %d delete %d move %d)"), v43, v42, v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v197, &v196, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)v177[5];
    v177[5] = v49;

    v45 = *((unsigned __int8 *)v183 + 24);
LABEL_52:
    v51 = 0;
    v52 = 0;
    if (v45 && v104)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v156[0] = MEMORY[0x1E0C809B0];
      v156[1] = 3221225472;
      v156[2] = __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke;
      v156[3] = &unk_1E35D7458;
      v102 = v106;
      v157 = v102;
      v54 = v53;
      v158 = v54;
      objc_msgSend(v110, "enumerateIndexesUsingBlock:", v156);
      if (objc_msgSend(v54, "count"))
      {
        v55 = (void *)MEMORY[0x1E0C97B48];
        -[PHRelationshipChangeRequestHelper destinationEntityName](v113, "destinationEntityName");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "fetchRequestWithEntityName:", v56);
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = (void *)MEMORY[0x1E0CB3880];
        -[PHRelationshipChangeRequestHelper destinationUUIDKeyPath](v113, "destinationUUIDKeyPath");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "predicateWithFormat:", CFSTR("%K in %@"), v58, v54);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "setPredicate:", v59);

        v155 = 0;
        objc_msgSend(v117, "executeFetchRequest:error:", v116, &v155);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v155;
        v100 = v61;
        if (v60)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = 0u;
          v154 = 0u;
          v151 = 0u;
          v152 = 0u;
          v63 = v60;
          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v151, v195, 16);
          if (v64)
          {
            v65 = *(_QWORD *)v152;
            do
            {
              for (n = 0; n != v64; ++n)
              {
                if (*(_QWORD *)v152 != v65)
                  objc_enumerationMutation(v63);
                v67 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * n);
                -[PHRelationshipChangeRequestHelper destinationUUIDKeyPath](v113, "destinationUUIDKeyPath");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "valueForKey:", v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setObject:forKey:", v67, v69);

              }
              v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v151, v195, 16);
            }
            while (v64);
          }

        }
        else
        {
          v70 = (void *)MEMORY[0x1E0CB35C8];
          v193 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to fetch %@"), v61);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v194 = v71;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v72);
          v73 = objc_claimAutoreleasedReturnValue();
          v74 = (void *)v177[5];
          v177[5] = v73;

          v62 = 0;
          *((_BYTE *)v183 + 24) = 0;
        }

      }
      else
      {
        v62 = 0;
      }
      v75 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v142[0] = MEMORY[0x1E0C809B0];
      v142[1] = 3221225472;
      v142[2] = __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_2;
      v142[3] = &unk_1E35D7480;
      v143 = v102;
      v144 = v117;
      v77 = v62;
      v145 = v77;
      v146 = v113;
      v52 = v75;
      v147 = v52;
      v51 = v76;
      v148 = v51;
      v149 = &v176;
      v150 = &v182;
      objc_msgSend(v110, "enumerateIndexesUsingBlock:", v142);

      v45 = *((unsigned __int8 *)v183 + 24);
    }
    if (!v45)
    {
      v83 = 0;
LABEL_106:

      goto LABEL_107;
    }
    if (objc_msgSend(v107, "count"))
    {
      objc_msgSend(v108, "objectsAtIndexes:", v107);
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v78 = (id)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v138, v192, 16);
      if (v79)
      {
        v80 = *(_QWORD *)v139;
        do
        {
          for (ii = 0; ii != v79; ++ii)
          {
            if (*(_QWORD *)v139 != v80)
              objc_enumerationMutation(v78);
            objc_msgSend(v117, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * ii));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            if (v82)
              objc_msgSend(v114, "removeObject:", v82);

          }
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v138, v192, 16);
        }
        while (v79);
      }

      if ((v109 | (v104 != 0)) != 1)
      {
        v83 = 0;
        goto LABEL_100;
      }
      objc_msgSend(v108, "removeObjectsAtIndexes:", v107);

    }
    else if ((v109 & 1) == 0 && !v104)
    {
      v83 = 0;
      goto LABEL_101;
    }
    objc_msgSend((id)objc_opt_class(), "_offsetsFromSourceOIDs:toManagedObjects:", v108, v114);
    v83 = (id)objc_claimAutoreleasedReturnValue();
    if (!v104)
      goto LABEL_101;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "count");
    v134 = 0;
    v135 = &v134;
    v136 = 0x2020000000;
    v137 = 0;
    v137 = objc_msgSend(v114, "count");
    if (v85)
    {
      objc_msgSend(v83, "objectAtIndex:", v85 - 1);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "unsignedIntegerValue");

    }
    else
    {
      v87 = objc_msgSend(v114, "count");
    }
    if (v109)
    {
      objc_msgSend(v52, "objectEnumerator");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v88 = 0;
    }
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_3;
    v126[3] = &unk_1E35D74A8;
    v83 = v83;
    v127 = v83;
    v131 = &v134;
    v132 = v87;
    v78 = v84;
    v128 = v78;
    v133 = v109;
    v89 = v88;
    v129 = v89;
    v130 = v108;
    objc_msgSend(v51, "enumerateIndexesUsingBlock:", v126);
    v90 = objc_msgSend(v114, "count");
    if (objc_msgSend(v52, "count"))
      objc_msgSend(v114, "insertObjects:atIndexes:", v52, v78);
    v91 = objc_msgSend(v114, "count") - v90;
    if (v91 != objc_msgSend(v52, "count"))
    {
      PLPhotoKitGetLog();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        v93 = objc_msgSend(v52, "count");
        *(_DWORD *)buf = 136315650;
        v187 = "-[PHRelationshipChangeRequestHelper applyMutationsToManagedObject:orderedMutableChildren:error:]";
        v188 = 1024;
        v189 = v93;
        v190 = 1024;
        v191 = v91;
        _os_log_impl(&dword_1991EC000, v92, OS_LOG_TYPE_ERROR, "Unreported error from %s, attempted to insert %d, only %d inserted", buf, 0x18u);
      }

    }
    _Block_object_dispose(&v134, 8);
LABEL_100:

LABEL_101:
    if (v109)
    {
      v134 = 0;
      v135 = &v134;
      v136 = 0x2020000000;
      v137 = 0;
      v94 = objc_msgSend(v83, "count");
      if (v94)
      {
        objc_msgSend(v83, "objectAtIndex:", v94 - 1);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend(v95, "unsignedIntegerValue");

      }
      else
      {
        v96 = objc_msgSend(v114, "count");
      }
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_210;
      v118[3] = &unk_1E35D74D0;
      v123 = &v134;
      v124 = v175;
      v119 = v108;
      v120 = v117;
      v121 = v114;
      v83 = v83;
      v122 = v83;
      v125 = v96;
      objc_msgSend(v105, "enumerateIndexesUsingBlock:", v118);

      _Block_object_dispose(&v134, 8);
    }
    goto LABEL_106;
  }
LABEL_107:
  v97 = *((unsigned __int8 *)v183 + 24);
  if (a5 && !*((_BYTE *)v183 + 24))
  {
    *a5 = objc_retainAutorelease((id)v177[5]);
    v97 = *((unsigned __int8 *)v183 + 24);
  }
  v98 = v97 != 0;
  _Block_object_dispose(&v176, 8);

  _Block_object_dispose(&v182, 8);
  return v98;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 unorderedMutableChildren:(id)a4 error:(id *)a5
{
  return -[PHRelationshipChangeRequestHelper applyMutationsToManagedObject:unorderedMutableChildren:inserts:deletes:error:](self, "applyMutationsToManagedObject:unorderedMutableChildren:inserts:deletes:error:", a3, a4, 0, 0, a5);
}

- (BOOL)applyMutationsToManagedObject:(id)a3 unorderedMutableChildren:(id)a4 inserts:(id *)a5 deletes:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PHRelationshipChangeRequestHelper *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  BOOL v54;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  uint64_t v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  PHRelationshipChangeRequestHelper *v78;
  SEL v79;
  id v80;
  id v81;
  BOOL v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id *v87;
  id v88;
  id *v89;
  id *v90;
  void *v91;
  void *v92;
  void *v93;
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
  id v106;
  _QWORD v107[4];
  id v108;
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;
  id v112;
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  -[PHRelationshipChangeRequestHelper changeRequestHelper](self, "changeRequestHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isMutated") & 1) == 0)
  {

    goto LABEL_14;
  }
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self, "mutableObjectIDsAndUUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_14:
    v53 = 0;
    v54 = 1;
    goto LABEL_15;
  }
  v79 = a2;
  v93 = v14;
  v17 = (void *)MEMORY[0x1E0C99E60];
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self, "originalObjectIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99E60];
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self, "mutableObjectIDsAndUUIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0C99E20];
  v24 = v22;
  objc_msgSend(v23, "setWithSet:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "intersectSet:", v24);

  v26 = (void *)MEMORY[0x1E0C99E20];
  v27 = v25;
  v86 = (void *)v19;
  objc_msgSend(v26, "setWithSet:", v19);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "minusSet:", v27);

  v28 = (void *)MEMORY[0x1E0C99E20];
  v29 = v27;
  v85 = v24;
  objc_msgSend(v28, "setWithSet:", v24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "minusSet:", v29);
  v84 = v29;

  objc_msgSend(v13, "managedObjectContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = __114__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_unorderedMutableChildren_inserts_deletes_error___block_invoke;
  v107[3] = &unk_1E35D74F8;
  v33 = v32;
  v108 = v33;
  v91 = v30;
  objc_msgSend(v30, "enumerateObjectsUsingBlock:", v107);
  v89 = a6;
  v90 = a5;
  v87 = a7;
  v88 = v13;
  v83 = v33;
  if (objc_msgSend(v33, "count"))
  {
    v34 = (void *)MEMORY[0x1E0C97B48];
    -[PHRelationshipChangeRequestHelper destinationEntityName](self, "destinationEntityName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "fetchRequestWithEntityName:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x1E0CB3880];
    v38 = self;
    -[PHRelationshipChangeRequestHelper destinationUUIDKeyPath](self, "destinationUUIDKeyPath");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "predicateWithFormat:", CFSTR("%K in %@"), v39, v33);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPredicate:", v40);

    v106 = 0;
    objc_msgSend(v31, "executeFetchRequest:error:", v36, &v106);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v106;
    v43 = v42;
    v82 = v41 != 0;
    if (v41)
    {
      v77 = v42;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v45 = v41;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
      if (v46)
      {
        v47 = v46;
        v74 = v41;
        v75 = v36;
        v48 = *(_QWORD *)v103;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v103 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
            -[PHRelationshipChangeRequestHelper destinationUUIDKeyPath](v38, "destinationUUIDKeyPath");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "valueForKey:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKey:", v50, v52);

          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
        }
        while (v47);
        v80 = 0;
        a6 = v89;
        a5 = v90;
        v41 = v74;
        v36 = v75;
      }
      else
      {
        v80 = 0;
      }
      v43 = v77;
    }
    else
    {
      v81 = (id)MEMORY[0x1E0CB35C8];
      v111 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to fetch %@"), v42);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v112 = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v56);
      v80 = (id)objc_claimAutoreleasedReturnValue();

      v44 = 0;
    }

    v14 = v93;
    self = v38;
  }
  else
  {
    v44 = 0;
    v80 = 0;
    v82 = 1;
    v14 = v93;
  }
  v57 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v92, "count"))
  {
    v78 = self;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v58 = v92;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v99;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v99 != v61)
            objc_enumerationMutation(v58);
          v63 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", v79, v78, CFSTR("PHChangeRequestHelper.m"), 908, CFSTR("Expected delete oid (%@) to be ManagedObjectID"), v63);

          }
          objc_msgSend(v31, "objectWithID:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (v64)
          {
            objc_msgSend(v14, "removeObject:", v64);
            objc_msgSend(v57, "addObject:", v64);
          }

        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
      }
      while (v60);
    }

    a6 = v89;
    a5 = v90;
  }
  v65 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v91, "count"))
  {
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v66 = v91;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v95;
      do
      {
        for (k = 0; k != v68; ++k)
        {
          if (*(_QWORD *)v95 != v69)
            objc_enumerationMutation(v66);
          v71 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v31, "objectWithID:", v71);
          else
            objc_msgSend(v44, "objectForKey:", v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72)
          {
            objc_msgSend(v93, "addObject:", v72);
            objc_msgSend(v65, "addObject:", v72);
          }

        }
        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
      }
      while (v68);
    }

    v14 = v93;
    a6 = v89;
    a5 = v90;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v65);
  if (a6)
    *a6 = objc_retainAutorelease(v57);

  v54 = v82;
  if (v87)
    v73 = v82;
  else
    v73 = 1;
  if ((v73 & 1) != 0)
  {
    v13 = v88;
    v53 = v80;
  }
  else
  {
    v53 = objc_retainAutorelease(v80);
    v54 = 0;
    *v87 = v53;
    v13 = v88;
  }
LABEL_15:

  return v54;
}

- (BOOL)applyMutationsToManagedObjectToOneRelationship:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  BOOL v24;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  _QWORD v76[4];
  id v77;
  uint64_t v78;
  id v79;
  _BYTE v80[128];
  uint64_t v81;
  void *v82;
  uint64_t v83;
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHRelationshipChangeRequestHelper changeRequestHelper](self, "changeRequestHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isMutated") & 1) == 0)
  {

    goto LABEL_6;
  }
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self, "mutableObjectIDsAndUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_6:
    v23 = 0;
    v24 = 1;
    goto LABEL_7;
  }
  v9 = (void *)MEMORY[0x1E0C99E20];
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self, "originalObjectIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self, "mutableObjectIDsAndUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intersectSet:", v14);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minusSet:", v15);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "minusSet:", v15);
  v70 = v17;
  if ((unint64_t)objc_msgSend(v16, "count") < 2)
  {
    v69 = v16;
    if ((unint64_t)objc_msgSend(v17, "count") >= 2)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v81 = *MEMORY[0x1E0CB2D50];
      v27 = (void *)MEMORY[0x1E0CB3940];
      -[PHRelationshipChangeRequestHelper relationshipName](self, "relationshipName");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v17;
      v20 = (void *)v28;
      objc_msgSend(v27, "stringWithFormat:", CFSTR("Invalid change to %@, cannot add %d objects"), v28, objc_msgSend(v29, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v6, "managedObjectContext");
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __90__PHRelationshipChangeRequestHelper_applyMutationsToManagedObjectToOneRelationship_error___block_invoke;
    v76[3] = &unk_1E35D74F8;
    v34 = v33;
    v77 = v34;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v76);
    v68 = (id)v32;
    if (objc_msgSend(v34, "count"))
    {
      v66 = v11;
      v35 = (void *)MEMORY[0x1E0C97B48];
      -[PHRelationshipChangeRequestHelper destinationEntityName](self, "destinationEntityName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "fetchRequestWithEntityName:", v36);
      v37 = (void *)v32;
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = (void *)MEMORY[0x1E0CB3880];
      -[PHRelationshipChangeRequestHelper destinationUUIDKeyPath](self, "destinationUUIDKeyPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v34;
      objc_msgSend(v39, "predicateWithFormat:", CFSTR("%K in %@"), v40, v34);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setPredicate:", v41);

      v75 = 0;
      v64 = v38;
      objc_msgSend(v37, "executeFetchRequest:error:", v38, &v75);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v75;
      v16 = v69;
      v62 = v43;
      v63 = v42;
      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v44 = v42;
        v23 = (id)objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
        v11 = v66;
        if (v23)
        {
          v59 = v15;
          v60 = v14;
          v61 = a4;
          v45 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(_QWORD *)v72 != v45)
                objc_enumerationMutation(v44);
              v47 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
              -[PHRelationshipChangeRequestHelper destinationUUIDKeyPath](self, "destinationUUIDKeyPath");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "valueForKey:", v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKey:", v47, v49);

            }
            v23 = (id)objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
          }
          while (v23);
          v14 = v60;
          a4 = v61;
          v11 = v66;
          v15 = v59;
          v16 = v69;
        }
      }
      else
      {
        v50 = (void *)MEMORY[0x1E0CB35C8];
        v78 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to fetch %@"), v43);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v79 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v51 = v15;
        v52 = v14;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v50;
        v16 = v69;
        objc_msgSend(v54, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v53);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        v14 = v52;
        v15 = v51;
        v31 = 0;
        v11 = v66;
      }

      v24 = (char)v63;
      if (!v63)
        goto LABEL_34;
      v17 = v70;
    }
    else
    {

      v23 = 0;
      v31 = 0;
      v16 = v69;
    }
    if (objc_msgSend(v16, "count") == 1 && !objc_msgSend(v17, "count"))
    {
      -[PHRelationshipChangeRequestHelper relationshipName](self, "relationshipName");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", 0, v55);

      v16 = v69;
    }
    if (objc_msgSend(v17, "count") == 1)
    {
      objc_msgSend(v17, "anyObject");
      v56 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v67 = (void *)v56;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v68, "objectWithID:", v56);
      else
        objc_msgSend(v31, "objectForKey:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHRelationshipChangeRequestHelper relationshipName](self, "relationshipName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v57, v58);

      v24 = 1;
      v16 = v69;
    }
    else
    {
      v24 = 1;
    }
LABEL_34:
    v30 = v68;
    goto LABEL_35;
  }
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v83 = *MEMORY[0x1E0CB2D50];
  v19 = (void *)MEMORY[0x1E0CB3940];
  -[PHRelationshipChangeRequestHelper relationshipName](self, "relationshipName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("Invalid change to %@, cannot remove %d objects"), v20, objc_msgSend(v16, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v22);
  v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  objc_msgSend(v6, "managedObjectContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v31 = 0;
LABEL_35:

  if (a4 && !v24)
  {
    v23 = objc_retainAutorelease(v23);
    v24 = 0;
    *a4 = v23;
  }
LABEL_7:

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_mutableObjectIDsAndUUIDs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = self->_originalObjectIDs;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          PLDataFromManagedObjectID();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("originalObjectIDs"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = self->_mutableObjectIDsAndUUIDs;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            PLDataFromManagedObjectID();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
          else
          {
            objc_msgSend(v12, "addObject:", v18, (_QWORD)v20);
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("mutableObjectIDsAndUUIDs"));
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_relationshipName, CFSTR("relationshipName"), (_QWORD)v20);

}

- (PHRelationshipChangeRequestHelper)initWithCoder:(id)a3
{
  id v4;
  PHRelationshipChangeRequestHelper *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSString *relationshipName;
  NSMutableArray *v11;
  NSMutableArray *mutableObjectIDsAndUUIDs;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *originalObjectIDs;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)PHRelationshipChangeRequestHelper;
  v5 = -[PHRelationshipChangeRequestHelper init](&v55, sel_init);
  if (v5)
  {
    v45 = v4;
    v6 = v4;
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable _PLAssertRespondsToSelector(id  _Nullable __strong, SEL _Nonnull)");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_userInfo);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("PLHelperExtension.h"), 89, CFSTR("Object does not respond to selector %@: %@"), v43, v6);

      }
      v7 = v6;
    }

    objc_msgSend(v6, "userInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "persistentStoreCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relationshipName"));
    v9 = objc_claimAutoreleasedReturnValue();
    relationshipName = v5->_relationshipName;
    v5->_relationshipName = (NSString *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableObjectIDsAndUUIDs = v5->_mutableObjectIDsAndUUIDs;
    v5->_mutableObjectIDsAndUUIDs = v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v6;
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v15, CFSTR("mutableObjectIDsAndUUIDs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v52;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v21);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            PLManagedObjectIDFromData();
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = (void *)v23;
              +[PHPhotoLibrary uniquedOID:](PHPhotoLibrary, "uniquedOID:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                -[NSMutableArray addObject:](v5->_mutableObjectIDsAndUUIDs, "addObject:", v25);

              }
            }
          }
          else
          {
            -[NSMutableArray addObject:](v5->_mutableObjectIDsAndUUIDs, "addObject:", v22);
          }
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v19);
    }

    v26 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    originalObjectIDs = v5->_originalObjectIDs;
    v5->_originalObjectIDs = v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "decodeObjectOfClasses:forKey:", v30, CFSTR("originalObjectIDs"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v32 = v31;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v48;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v48 != v35)
            objc_enumerationMutation(v32);
          PLManagedObjectIDFromData();
          v37 = objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            v38 = (void *)v37;
            +[PHPhotoLibrary uniquedOID:](PHPhotoLibrary, "uniquedOID:", v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              -[NSArray addObject:](v5->_originalObjectIDs, "addObject:", v39);

            }
          }
          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v34);
    }

    v4 = v45;
  }

  return v5;
}

- (NSString)relationshipName
{
  return self->_relationshipName;
}

- (NSString)destinationEntityName
{
  return self->_destinationEntityName;
}

- (void)setDestinationEntityName:(id)a3
{
  objc_storeStrong((id *)&self->_destinationEntityName, a3);
}

- (void)setDestinationUUIDKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationUUIDKeyPath, a3);
}

- (BOOL)allowsInsert
{
  return self->_allowsInsert;
}

- (void)setAllowsInsert:(BOOL)a3
{
  self->_allowsInsert = a3;
}

- (BOOL)allowsMove
{
  return self->_allowsMove;
}

- (void)setAllowsMove:(BOOL)a3
{
  self->_allowsMove = a3;
}

- (BOOL)allowsRemove
{
  return self->_allowsRemove;
}

- (void)setAllowsRemove:(BOOL)a3
{
  self->_allowsRemove = a3;
}

- (NSArray)originalObjectIDs
{
  return self->_originalObjectIDs;
}

- (void)setOriginalObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_originalObjectIDs, a3);
}

- (NSMutableArray)mutableObjectIDsAndUUIDs
{
  return self->_mutableObjectIDsAndUUIDs;
}

- (void)setMutableObjectIDsAndUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_mutableObjectIDsAndUUIDs, a3);
}

- (id)isDestinationObjectValid
{
  return self->_isDestinationObjectValid;
}

- (void)setIsDestinationObjectValid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PHChangeRequestHelper)changeRequestHelper
{
  return self->_changeRequestHelper;
}

- (void)setChangeRequestHelper:(id)a3
{
  objc_storeStrong((id *)&self->_changeRequestHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRequestHelper, 0);
  objc_storeStrong(&self->_isDestinationObjectValid, 0);
  objc_storeStrong((id *)&self->_mutableObjectIDsAndUUIDs, 0);
  objc_storeStrong((id *)&self->_originalObjectIDs, 0);
  objc_storeStrong((id *)&self->_destinationUUIDKeyPath, 0);
  objc_storeStrong((id *)&self->_destinationEntityName, 0);
  objc_storeStrong((id *)&self->_relationshipName, 0);
}

void __90__PHRelationshipChangeRequestHelper_applyMutationsToManagedObjectToOneRelationship_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __114__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_unorderedMutableChildren_inserts_deletes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "objectWithID:", v4);
  else
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 56), "isDestinationObjectValid");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(*(id *)(a1 + 56), "isDestinationObjectValid"),
        v8 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        v9 = ((uint64_t (**)(_QWORD, void *))v8)[2](v8, v5),
        v8,
        v7,
        v9))
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 72), "addIndex:", a2);
  }
  else
  {
LABEL_8:
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Added object failed validation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
  }

}

void __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_3(uint64_t a1, unint64_t a2)
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a2)
  {
    v5 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

  }
  if (v5 + a2 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  else
    v6 = v5 + a2;
  objc_msgSend(*(id *)(a1 + 40), "addIndex:", v6);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v8, a2);

  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 48), "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 56);
    objc_msgSend(v9, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertObject:atIndex:", v11, a2);

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

void __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_210(uint64_t a1, unint64_t a2)
{
  const __CFArray *v4;
  uint64_t v5;
  CFIndex v6;
  const void *ValueAtIndex;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v4 = *(const __CFArray **)(a1 + 72);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(_QWORD *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6 + 1;
  ValueAtIndex = CFArrayGetValueAtIndex(v4, v6);
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= (unint64_t)ValueAtIndex)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", ValueAtIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v16 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectWithID:", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", v9);
        if (objc_msgSend(*(id *)(a1 + 56), "count") <= a2)
        {
          v12 = *(_QWORD *)(a1 + 80);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "unsignedIntegerValue");

        }
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = v12 + a2;
          if (v13 < objc_msgSend(*(id *)(a1 + 48), "count") && v13 != v10)
          {
            v14 = *(void **)(a1 + 48);
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "moveObjectsAtIndexes:toIndex:", v15, v13);

          }
        }

      }
      v8 = v16;
    }
  }

}

uint64_t __90__PHRelationshipChangeRequestHelper_initWithRelationshipName_xpcDict_changeRequestHelper___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  const unsigned __int8 *bytes;
  _BYTE v9[40];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (MEMORY[0x19AEBF1D8]() == MEMORY[0x1E0C813A0])
  {
    memset(v9, 0, 37);
    bytes = xpc_uuid_get_bytes(v4);

    uuid_unparse(bytes, v9);
    if (!v9[0])
      return 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v6, *(_OWORD *)v9, *(_QWORD *)&v9[16], *(_OWORD *)&v9[24], v10);

    return 1;
  }
  PLManagedObjectIDFromXPCValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[PHPhotoLibrary uniquedOID:](PHPhotoLibrary, "uniquedOID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_7;
  }
  return 1;
}

uint64_t __90__PHRelationshipChangeRequestHelper_initWithRelationshipName_xpcDict_changeRequestHelper___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  PLManagedObjectIDFromXPCValue();
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    +[PHPhotoLibrary uniquedOID:](PHPhotoLibrary, "uniquedOID:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", v4);

    }
  }
  return 1;
}

+ (id)_offsetsFromSourceOIDs:(id)a3 toManagedObjects:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PHPhotoLibrary uniquedOIDsFromObjects:](PHPhotoLibrary, "uniquedOIDsFromObjects:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      v14 = -v10;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(obj);
        v15 = objc_msgSend(v6, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
        if (v15 >= v10 + v11 + v13 && v15 != 0x7FFFFFFFFFFFFFFFLL)
          v11 = v15 + v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v17);

        ++v13;
        --v14;
      }
      while (v9 != v13);
      v10 += v13;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)objectIDsOrUUIDsFromPHObjects:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PLObjectIDOrUUIDFromPHObject(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)existentObjectIDsUsingQuery:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "executeQuery");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchedObjectIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
