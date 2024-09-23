@implementation _NSMappingModelBuilder

+ (int)migrationDebugLevel
{
  return +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel");
}

+ (void)setMigrationDebugLevel:(int)a3
{
  +[NSMappingModel setMigrationDebugLevel:](NSMappingModel, "setMigrationDebugLevel:", *(_QWORD *)&a3);
}

- (_NSMappingModelBuilder)initWithSourceModel:(id)a3 destinationModel:(id)a4
{
  _NSMappingModelBuilder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NSMappingModelBuilder;
  v6 = -[_NSMappingModelBuilder init](&v8, sel_init);
  if (v6)
  {
    v6->_sourceModel = (NSManagedObjectModel *)a3;
    v6->_destinationModel = (NSManagedObjectModel *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_sourceModel = 0;
  self->_destinationModel = 0;

  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSMappingModelBuilder;
  -[_NSMappingModelBuilder dealloc](&v3, sel_dealloc);
}

- (NSMappingModel)newInferredMappingModel:(NSMappingModel *)a1
{
  NSMappingModel *v2;
  id v3;
  void *reserved;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *reserved1;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  NSEntityMapping *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSEntityMapping *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t n;
  void *v49;
  id v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  NSMutableArray *entityMappings;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  void *v84;
  NSMappingModel *v85;
  id obj;
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
  _QWORD v107[7];
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  void (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  _QWORD *v113;
  _QWORD v114[13];
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  void (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  _QWORD *v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  char v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[6];
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  void (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  _QWORD *v135;
  _QWORD v136[7];
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  void (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  _QWORD *v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint8_t v151[128];
  uint8_t buf[4];
  const char *v153;
  __int16 v154;
  int v155;
  uint64_t v156;

  v2 = a1;
  v156 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    a1->_reserved2 = 0;

    v2->_entityMappings = 0;
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v85 = v2;
    reserved = v2->_reserved;
    v5 = 0;
    v6 = objc_msgSend(reserved, "countByEnumeratingWithState:objects:count:", &v99, v150, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v100 != v7)
            objc_enumerationMutation(reserved);
          objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i), objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * i), "renamingIdentifier"));
        }
        v5 += v6;
        v6 = objc_msgSend(reserved, "countByEnumeratingWithState:objects:count:", &v99, v150, 16);
      }
      while (v6);
    }
    if (v5 == objc_msgSend(v3, "count"))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2 * v5);
      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2 * v5);
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      reserved1 = v85->_reserved1;
      v11 = 0;
      v12 = objc_msgSend(reserved1, "countByEnumeratingWithState:objects:count:", &v95, v149, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v96;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v96 != v13)
              objc_enumerationMutation(reserved1);
            v15 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
            v16 = objc_msgSend(v15, "renamingIdentifier");
            v17 = -[_NSMappingModelBuilder newEntityMappingWithSource:destination:]((void *)objc_msgSend(v3, "objectForKey:", v16), v15);
            objc_msgSend(obj, "addObject:", v17);
            objc_msgSend(v9, "addObject:", v16);

            objc_msgSend(v3, "removeObjectForKey:", objc_msgSend(v15, "renamingIdentifier"));
          }
          v11 += v12;
          v12 = objc_msgSend(reserved1, "countByEnumeratingWithState:objects:count:", &v95, v149, 16);
        }
        while (v12);
      }
      if (v11 == objc_msgSend(v9, "count"))
      {

        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v18 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v91, v148, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v92;
          do
          {
            for (k = 0; k != v18; ++k)
            {
              if (*(_QWORD *)v92 != v19)
                objc_enumerationMutation(v3);
              v21 = -[_NSMappingModelBuilder newEntityMappingWithSource:destination:]((void *)objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * k)), 0);
              objc_msgSend(obj, "addObject:", v21);

            }
            v18 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v91, v148, 16);
          }
          while (v18);
        }

        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v147, 16);
        if (v76)
        {
          v75 = *(_QWORD *)v88;
          v72 = *MEMORY[0x1E0CB28A8];
LABEL_27:
          v83 = 0;
          while (1)
          {
            if (*(_QWORD *)v88 != v75)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v83);
            if (objc_msgSend(v22, "mappingType") == 4 || objc_msgSend(v22, "mappingType") == 5)
            {
              v23 = (void *)objc_msgSend((id)objc_msgSend(v85->_reserved, "entitiesByName"), "objectForKey:", objc_msgSend(v22, "sourceEntityName"));
              v80 = (void *)objc_msgSend((id)objc_msgSend(v85->_reserved1, "entitiesByName"), "objectForKey:", objc_msgSend(v22, "destinationEntityName"));
              v85->_reserved2 = v22;
              v82 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
              v24 = (void *)MEMORY[0x1E0CB35D0];
              v25 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("manager"));
              v26 = (void *)MEMORY[0x1E0C99D20];
              v27 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", objc_msgSend(v23, "name"));
              v28 = objc_msgSend(v24, "expressionForFunction:selectorName:arguments:", v25, CFSTR("fetchRequestForSourceEntityNamed:predicateString:"), objc_msgSend(v26, "arrayWithObjects:", v27, objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", CFSTR("TRUEPREDICATE")), 0));
              objc_msgSend(v22, "setSourceExpression:", +[NSFetchRequestExpression expressionForFetch:context:countOnly:](NSFetchRequestExpression, "expressionForFetch:context:countOnly:", v28, objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:selectorName:arguments:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("manager")), CFSTR("sourceContext"), 0), 0));
              v29 = (void *)objc_msgSend(v23, "propertiesByName");
              v30 = objc_msgSend(v29, "count");
              v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v30);
              v143 = 0;
              v144 = &v143;
              v145 = 0x2020000000;
              v146 = 0;
              v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v30);
              v77 = v22;
              v137 = 0;
              v138 = &v137;
              v139 = 0x3052000000;
              v140 = __Block_byref_object_copy__5;
              v141 = __Block_byref_object_dispose__5;
              v136[0] = MEMORY[0x1E0C809B0];
              v136[1] = 3221225472;
              v136[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke;
              v136[3] = &unk_1E1EDD6F0;
              v136[6] = &v143;
              v136[4] = v84;
              v136[5] = v31;
              v142 = v136;
              v130 = 0;
              v131 = &v130;
              v132 = 0x3052000000;
              v133 = __Block_byref_object_copy__5;
              v134 = __Block_byref_object_dispose__5;
              v129[0] = MEMORY[0x1E0C809B0];
              v129[1] = 3221225472;
              v129[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_2;
              v129[3] = &unk_1E1EDD718;
              v129[4] = &v130;
              v129[5] = &v137;
              v135 = v129;
              v127 = 0u;
              v128 = 0u;
              v125 = 0u;
              v126 = 0u;
              v32 = (void *)objc_msgSend(v29, "allValues");
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v125, buf, 16);
              if (v33)
              {
                v34 = *(_QWORD *)v126;
                do
                {
                  for (m = 0; m != v33; ++m)
                  {
                    if (*(_QWORD *)v126 != v34)
                      objc_enumerationMutation(v32);
                    v36 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * m);
                    if ((objc_msgSend(v36, "isTransient") & 1) == 0)
                    {
                      switch(objc_msgSend(v36, "_propertyType"))
                      {
                        case 2:
                        case 4:
                        case 6:
                          v37 = 0;
                          v38 = v138[5];
                          goto LABEL_41;
                        case 7:
                          v38 = v131[5];
                          v39 = objc_msgSend(v36, "elements");
                          v37 = objc_msgSend(v36, "name");
                          v36 = (void *)v39;
LABEL_41:
                          (*(void (**)(uint64_t, void *, uint64_t))(v38 + 16))(v38, v36, v37);
                          break;
                        default:
                          continue;
                      }
                    }
                  }
                  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v125, buf, 16);
                }
                while (v33);
              }
              v40 = v144[3];
              if (v40 == objc_msgSend(v84, "count"))
              {
                v41 = (void *)objc_msgSend(v80, "propertiesByName");
                v42 = objc_msgSend(v41, "count");
                v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v42);
                v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v42);
                v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42);
                v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42);
                v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v121 = 0;
                v122 = &v121;
                v123 = 0x2020000000;
                v124 = 0;
                v115 = 0;
                v116 = &v115;
                v117 = 0x3052000000;
                v118 = __Block_byref_object_copy__5;
                v119 = __Block_byref_object_dispose__5;
                v114[0] = MEMORY[0x1E0C809B0];
                v114[1] = 3221225472;
                v114[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_3;
                v114[3] = &unk_1E1EDD740;
                v114[4] = v84;
                v114[5] = v85;
                v114[6] = v79;
                v114[7] = v78;
                v114[8] = v44;
                v73 = (void *)v43;
                v74 = v31;
                v114[9] = v43;
                v114[10] = v81;
                v114[11] = v31;
                v114[12] = &v121;
                v120 = v114;
                v108 = 0;
                v109 = &v108;
                v110 = 0x3052000000;
                v111 = __Block_byref_object_copy__5;
                v112 = __Block_byref_object_dispose__5;
                v107[0] = MEMORY[0x1E0C809B0];
                v107[1] = 3221225472;
                v107[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_4;
                v107[3] = &unk_1E1EDD768;
                v107[4] = v44;
                v107[5] = &v108;
                v107[6] = &v115;
                v113 = v107;
                v103 = 0u;
                v104 = 0u;
                v105 = 0u;
                v106 = 0u;
                v45 = (void *)objc_msgSend(v41, "allValues");
                v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v103, v151, 16);
                if (v46)
                {
                  v47 = *(_QWORD *)v104;
                  do
                  {
                    for (n = 0; n != v46; ++n)
                    {
                      if (*(_QWORD *)v104 != v47)
                        objc_enumerationMutation(v45);
                      v49 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * n);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        (*(void (**)(uint64_t, uint64_t, uint64_t))(v109[5] + 16))(v109[5], objc_msgSend(v49, "elements"), objc_msgSend(v49, "name"));
                      else
                        (*(void (**)(void))(v116[5] + 16))();
                    }
                    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v103, v151, 16);
                  }
                  while (v46);
                }

                if (*((_BYTE *)v122 + 24))
                {

                }
                else
                {
                  objc_msgSend(v77, "setAttributeMappings:", v73);
                  objc_msgSend(v77, "setRelationshipMappings:", v81);

                  v52 = (void *)objc_msgSend(v77, "userInfo");
                  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v52, "count") + 3);
                  v54 = v53;
                  if (v52)
                    objc_msgSend(v53, "addEntriesFromDictionary:", v52);
                  objc_msgSend(v54, "setObject:forKey:", v74, _NSInferredRemovedPropertiesKey);
                  objc_msgSend(v54, "setObject:forKey:", v79, _NSInferredAddedPropertiesKey);
                  objc_msgSend(v54, "setObject:forKey:", v78, _NSInferredMappedPropertiesKey);
                  objc_msgSend(v77, "setUserInfo:", v54);

                }
                objc_msgSend(v82, "drain");
                v51 = *((_BYTE *)v122 + 24) == 0;
                _Block_object_dispose(&v108, 8);
                _Block_object_dispose(&v115, 8);
                _Block_object_dispose(&v121, 8);
              }
              else
              {
                v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v85->_entityMappings = (NSMutableArray *)objc_msgSend(v50, "initWithDomain:code:userInfo:", v72, 134190, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Each property must have a unique renaming identifier"), CFSTR("reason")));

                objc_msgSend(v82, "drain");
                v51 = 0;
              }
              _Block_object_dispose(&v130, 8);
              _Block_object_dispose(&v137, 8);
              _Block_object_dispose(&v143, 8);
              if (!v51)
                break;
            }
            if (++v83 == v76)
            {
              v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v147, 16);
              if (v76)
                goto LABEL_27;
              goto LABEL_65;
            }
          }
          entityMappings = v85->_entityMappings;
          if (entityMappings)
          {
            if (a2)
            {
              v2 = 0;
              *a2 = (uint64_t)entityMappings;
              goto LABEL_78;
            }
          }
          else
          {
            v62 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v62, v63, v64, v65, v66, v67, v68, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/_NSMappingModelBuilder.m");
            v69 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v153 = "/Library/Caches/com.apple.xbs/Sources/Persistence/_NSMappingModelBuilder.m";
              v154 = 1024;
              v155 = 131;
              _os_log_fault_impl(&dword_18A253000, v69, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            }
          }
          v2 = 0;
        }
        else
        {
LABEL_65:
          v2 = objc_alloc_init(NSMappingModel);
          -[NSMappingModel setEntityMappings:](v2, "setEntityMappings:", obj);
        }
LABEL_78:
        v3 = obj;
      }
      else
      {
        v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v59 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Each destination entity must have a unique renaming identifier"), CFSTR("reason"));
        v60 = objc_msgSend(v58, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134190, v59);
        v85->_entityMappings = (NSMutableArray *)v60;
        if (a2)
          *a2 = v60;

        v2 = 0;
        v3 = v9;
      }
    }
    else
    {
      v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v56 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Each source entity must have a unique renaming identifier"), CFSTR("reason"));
      v57 = objc_msgSend(v55, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134190, v56);
      v85->_entityMappings = (NSMutableArray *)v57;
      v2 = 0;
      if (a2)
        *a2 = v57;
    }

  }
  return v2;
}

- (NSEntityMapping)newEntityMappingWithSource:(void *)a1 destination:(void *)a2
{
  NSEntityMapping *v4;
  uint64_t v5;
  int v6;
  id v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = objc_alloc_init(NSEntityMapping);
  if (a1)
  {
    -[NSEntityMapping setSourceEntityName:](v4, "setSourceEntityName:", objc_msgSend(a1, "name"));
    -[NSEntityMapping setSourceEntityVersionHash:](v4, "setSourceEntityVersionHash:", objc_msgSend(a1, "versionHash"));
    v5 = 0;
    if (a2)
      goto LABEL_3;
LABEL_7:
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@%@_%@"), _NSInferredMappingPrefix, CFSTR("Remove"), objc_msgSend(a1, "renamingIdentifier"));
    -[NSEntityMapping setName:](v4, "setName:", v14);

    v5 = 3;
    goto LABEL_11;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@%@_%@"), _NSInferredMappingPrefix, CFSTR("Add"), objc_msgSend(a2, "renamingIdentifier"));
  -[NSEntityMapping setName:](v4, "setName:", v12);

  v5 = 2;
  if (!a2)
    goto LABEL_7;
LABEL_3:
  -[NSEntityMapping setDestinationEntityName:](v4, "setDestinationEntityName:", objc_msgSend(a2, "name"));
  -[NSEntityMapping setDestinationEntityVersionHash:](v4, "setDestinationEntityVersionHash:", objc_msgSend(a2, "versionHash"));
  if (a1)
  {
    v6 = objc_msgSend((id)objc_msgSend(a1, "versionHash"), "isEqual:", objc_msgSend(a2, "versionHash"));
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = _NSInferredMappingPrefix;
    v9 = objc_msgSend(a1, "renamingIdentifier");
    if (v6)
    {
      v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@%@_%@"), v8, CFSTR("Copy"), v9);
      -[NSEntityMapping setName:](v4, "setName:", v10);

      v5 = 4;
    }
    else
    {
      v15 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@%@_%@"), v8, CFSTR("Transform"), v9);
      -[NSEntityMapping setName:](v4, "setName:", v15);

      v5 = 5;
      if (objc_msgSend(a1, "_isSchemaEqual:", a2) && v4)
      {
        *(_DWORD *)&v4->_entityMappingFlags |= 2u;
        v5 = 5;
      }
    }
  }
LABEL_11:
  -[NSEntityMapping setMappingType:](v4, "setMappingType:", v5);
  return v4;
}

@end
