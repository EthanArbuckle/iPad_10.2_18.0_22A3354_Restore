@implementation PFUbiquityRecordImportConflict

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
    _ubMergePolicy = -[NSMergePolicy initWithMergeType:]([PFUbiquityMergePolicy alloc], "initWithMergeType:", 1);
}

- (PFUbiquityRecordImportConflict)init
{
  char *v2;
  PFUbiquityRecordImportConflict *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityRecordImportConflict;
  v2 = -[PFUbiquityRecordImportConflict init](&v5, sel_init);
  v3 = (PFUbiquityRecordImportConflict *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 36) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *((_QWORD *)v2 + 11) = 0;
    *((_QWORD *)v2 + 12) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v3;
}

- (void)dealloc
{
  SEL v3;
  SEL v4;
  SEL v5;
  SEL v6;
  SEL v7;
  SEL v8;
  SEL v9;
  SEL v10;
  SEL v11;
  objc_super v12;

  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
    objc_setProperty_nonatomic(self, v4, 0, 24);
    objc_setProperty_nonatomic(self, v5, 0, 56);
    objc_setProperty_nonatomic(self, v6, 0, 72);
    objc_setProperty_nonatomic(self, v7, 0, 80);
    objc_setProperty_nonatomic(self, v8, 0, 88);
    objc_setProperty_nonatomic(self, v9, 0, 32);
    objc_setProperty_nonatomic(self, v10, 0, 64);
    objc_setProperty_nonatomic(self, v11, 0, 40);
  }

  self->_relationshipsToObjectIDsToCheck = 0;
  v12.receiver = self;
  v12.super_class = (Class)PFUbiquityRecordImportConflict;
  -[PFUbiquityRecordImportConflict dealloc](&v12, sel_dealloc);
}

- (void)_newNormalizedSnapshot:(void *)a1 forObject:(void *)a2
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = (_QWORD *)objc_msgSend(a2, "entity");
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  if (v4)
    v6 = v4[14];
  else
    v6 = 0;
  v7 = objc_msgSend((id)objc_msgSend(v4, "propertiesByName"), "values");
  v8 = *(_QWORD *)(v6 + 48);
  v9 = *(_QWORD *)(v6 + 56);
  if (v8 < v9 + v8)
  {
    v10 = (id *)(v7 + 8 * v8);
    do
    {
      v11 = *v10;
      if (objc_msgSend(*v10, "allowsExternalBinaryDataStorage"))
      {
        v12 = objc_msgSend(v11, "name");
        v13 = (void *)objc_msgSend(v5, "objectForKey:", v12);
        if (v13)
        {
          if (objc_msgSend(v13, "isNSDictionary"))
          {
            v14 = -[_PFExternalReferenceData initForUbiquityDictionary:store:]([_PFExternalReferenceData alloc], "initForUbiquityDictionary:store:", objc_msgSend(a1, "valueForKey:", v12), objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore"));
            objc_msgSend(v5, "setValue:forKey:", v14, v12);

          }
        }
      }
      ++v10;
      --v9;
    }
    while (v9);
  }
  return v5;
}

- (void)addObjectIDsForDiff:(void *)a3 forRelationship:
{
  void *v5;
  _QWORD *v6;
  char isKindOfClass;
  void *v8;
  id v9;

  if (a2)
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 96), "objectForKey:", objc_msgSend(a3, "name"));
    if (!v9)
    {
      v9 = (id)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 96), "setObject:forKey:");
    }
    if (objc_msgSend(a2, "isNSArray"))
    {
      objc_msgSend(v9, "addObjectsFromArray:", a2);
    }
    else
    {
      if (objc_msgSend(a2, "isNSSet"))
      {
        v5 = v9;
        v6 = a2;
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v8 = v9;
        if ((isKindOfClass & 1) == 0)
        {
LABEL_12:

          return;
        }
        objc_msgSend(v9, "unionSet:", a2[1]);
        v6 = (_QWORD *)a2[2];
        v5 = v9;
      }
      objc_msgSend(v5, "unionSet:", v6);
    }
    v8 = v9;
    goto LABEL_12;
  }
}

- (void)addObjectID:(void *)a3 forRelationship:
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  if (a2)
  {
    v5 = objc_msgSend(a3, "name");
    v6 = (id)objc_msgSend(*(id *)(a1 + 96), "objectForKey:", v5);
    if (!v6)
    {
      v7 = (id)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 96), "setObject:forKey:", v7, v5);
      v6 = v7;
    }
    v8 = v6;
    objc_msgSend(v6, "addObject:", a2);

  }
}

- (uint64_t)resolveMergeConflictForLogContent:(void *)a3 previousSnapshot:(void *)a4 andAncestorSnapshot:(unsigned int)a5 withOldVersion:(unsigned int)a6 andNewVersion:(uint64_t)a7 error:
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _QWORD *v19;
  int hasAttributesWithExternalData;
  void *v21;
  PFUbiquityMergeConflict *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v28;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v27 = *(void **)(a1 + 16);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = (void *)objc_msgSend(v27, "entity");
  v10 = (void *)objc_msgSend((id)objc_msgSend(v28, "relationshipsByName"), "allValues");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v16 = (void *)objc_msgSend(v15, "inverseRelationship");
        if ((objc_msgSend(v16, "isOptional") & 1) == 0)
        {
          v17 = a4;
          v18 = objc_msgSend(v15, "isToMany");
          v19 = (_QWORD *)objc_msgSend(a2, "objectForKey:", objc_msgSend(v15, "name"));
          if (v18)
          {
            -[PFUbiquityRecordImportConflict addObjectIDsForDiff:forRelationship:](a1, v19, v16);
            -[PFUbiquityRecordImportConflict addObjectIDsForDiff:forRelationship:](a1, (_QWORD *)objc_msgSend(a3, "objectForKey:", objc_msgSend(v15, "name")), v16);
            a4 = v17;
            -[PFUbiquityRecordImportConflict addObjectIDsForDiff:forRelationship:](a1, (_QWORD *)objc_msgSend(v17, "objectForKey:", objc_msgSend(v15, "name")), v16);
          }
          else
          {
            -[PFUbiquityRecordImportConflict addObjectID:forRelationship:](a1, (uint64_t)v19, v16);
            -[PFUbiquityRecordImportConflict addObjectID:forRelationship:](a1, objc_msgSend(a3, "objectForKey:", objc_msgSend(v15, "name")), v16);
            a4 = v17;
            -[PFUbiquityRecordImportConflict addObjectID:forRelationship:](a1, objc_msgSend(v17, "objectForKey:", objc_msgSend(v15, "name")), v16);
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v12);
  }
  hasAttributesWithExternalData = -[NSEntityDescription _hasAttributesWithExternalDataReferences]((uint64_t)v28);
  if (hasAttributesWithExternalData)
  {
    a2 = -[PFUbiquityRecordImportConflict _newNormalizedSnapshot:forObject:](a2, v27);
    v21 = -[PFUbiquityRecordImportConflict _newNormalizedSnapshot:forObject:](a3, v27);
    a4 = -[PFUbiquityRecordImportConflict _newNormalizedSnapshot:forObject:](a4, v27);
  }
  else
  {
    v21 = a3;
  }
  v22 = -[PFUbiquityMergeConflict initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:]([PFUbiquityMergeConflict alloc], "initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:", *(_QWORD *)(a1 + 16), a6, a5, v21, a2);
  -[PFUbiquityMergeConflict setAncestorSnapshot:](v22, "setAncestorSnapshot:", a4);
  v23 = (void *)_ubMergePolicy;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v22, 0);

  v25 = objc_msgSend(v23, "resolveConflicts:error:", v24, a7);
  objc_msgSend(*(id *)(a1 + 16), "_setVersionReference__:", a5);
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Resulting source object: %@"), "-[PFUbiquityRecordImportConflict resolveMergeConflictForLogContent:previousSnapshot:andAncestorSnapshot:withOldVersion:andNewVersion:error:]", 242, *(_QWORD *)(a1 + 16));

  if (hasAttributesWithExternalData)
  {

  }
  return v25;
}

- (uint64_t)resolveConflict:(uint64_t)a1
{
  uint64_t v3;
  int v4;
  id v5;
  id v6;
  PFUbiquityPeerSnapshotCollection *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PFUbiquityBaseline *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  PFUbiquityBaseline *v27;
  NSPersistentStoreCoordinator *v28;
  NSManagedObjectContext *v29;
  uint64_t v30;
  uint64_t v31;
  NSManagedObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  PFUbiquityTransactionLog *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  PFUbiquitySaveSnapshot *saveSnapshot;
  PFUbiquityLocation *transactionLogLocation;
  NSString *storeName;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  PFUbiquitySaveSnapshot *v63;
  void **v64;
  void **v65;
  PFUbiquitySaveSnapshot *v66;
  PFUbiquitySaveSnapshot *v67;
  PFUbiquityPeerSnapshot *v68;
  PFUbiquityKnowledgeVector *kv;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id *v82;
  id *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id *v90;
  uint64_t v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  id *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  void *v106;
  uint64_t v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  void *v117;
  char v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  int v129;
  char v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSObject *v155;
  id v156;
  char v157;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  _QWORD *v166;
  id v167;
  void *v168;
  unsigned int v169;
  unsigned int v170;
  uint64_t v171;
  void *v172;
  void *v173;
  int v174;
  uint64_t v175;
  id obj;
  int obja;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  id v191;
  char v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  _BYTE v197[128];
  _BYTE v198[128];
  uint8_t v199[128];
  uint8_t buf[4];
  const char *v201;
  __int16 v202;
  int v203;
  uint64_t v204;

  v204 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v157 = 0;
    return v157 & 1;
  }
  v3 = a1;
  v191 = 0;
  v167 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Resolve conflict called on: %@"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 263, v3);
  v166 = a2;
  v4 = objc_msgSend(*(id *)(v3 + 16), "_versionReference");
  v170 = objc_msgSend(*(id *)(v3 + 16), "_versionReference");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_alloc_init(PFUbiquityPeerSnapshotCollection);
  v172 = v6;
  v168 = v5;
  v8 = (void *)objc_msgSend(*(id *)(v3 + 72), "copy");
  v174 = v4;
  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v187, v199, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v188;
    obj = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v188 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * v11);
        if (!v12 || *(_DWORD *)(v12 + 16) != 3)
        {
          v34 = *(_QWORD *)(a1 + 88);
          objc_opt_self();
          *(_QWORD *)&v193 = 0;
          if (v12)
            v35 = *(void **)(v12 + 48);
          else
            v35 = 0;
          v36 = v35;
          if (v34 && (v37 = *(_QWORD *)(v34 + 88)) != 0)
            v38 = *(_QWORD *)(v37 + 48);
          else
            v38 = 0;
          v39 = -[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:](v38, (uint64_t)v36, 1, &v193);
          if (v39)
          {

          }
          else
          {
            if (objc_msgSend((id)v193, "code") != 4)
            {

LABEL_220:
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to find transaction log for entry: %@"), "+[PFUbiquityRecordImportConflict createTransactionLogForTransactionEntry:withImportContext:error:]", 829, v12);
              }
              if ((_QWORD)v193)
              {
                v191 = (id)v193;
              }
              else
              {
                v140 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                _NSCoreDataLog(17, v140, v141, v142, v143, v144, v145, v146, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
                v147 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecord"
                         "ImportConflict.m";
                  v202 = 1024;
                  v203 = 830;
                  _os_log_fault_impl(&dword_18A253000, v147, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                }
              }
LABEL_226:
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ aborting conflict resolution, unable to create snapshot for transaction entry: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 281, a1, v12, v191, objc_msgSend(v191, "userInfo"));
              }
              if (v191)
              {
                if (v166)
                  *v166 = v191;
              }
              else
              {
                v148 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                _NSCoreDataLog(17, v148, v149, v150, v151, v152, v153, v154, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
                v155 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecord"
                         "ImportConflict.m";
                  v202 = 1024;
                  v203 = 282;
                  _os_log_fault_impl(&dword_18A253000, v155, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                }
              }

              goto LABEL_234;
            }
            objc_opt_self();
            v40 = (void *)objc_msgSend(v36, "copy");
            objc_msgSend(v40, "setUbiquityLocationType:", 21);
            -[PFUbiquityLocation updateHash](v40);
            *(_QWORD *)&v193 = 0;
            if (v34 && (v41 = *(_QWORD *)(v34 + 88)) != 0)
              v42 = *(_QWORD *)(v41 + 48);
            else
              v42 = 0;
            v39 = -[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:](v42, (uint64_t)v40, 1, &v193);
            if (!v39)
            {
              if (objc_msgSend((id)v193, "code") == 4)
              {
                objc_opt_self();
                v43 = (void *)objc_msgSend(v36, "copy");
                objc_msgSend(v43, "setUbiquityLocationType:", 26);
                -[PFUbiquityLocation updateHash](v43);
                if (v34 && (v44 = *(_QWORD *)(v34 + 88)) != 0)
                  v45 = *(_QWORD *)(v44 + 48);
                else
                  v45 = 0;
                v39 = -[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:](v45, (uint64_t)v43, 1, &v193);

              }
              else
              {
                v39 = 0;
              }
            }

            if (!v39)
              goto LABEL_220;
          }
          if (!v12 || (v46 = *(_DWORD *)(v12 + 16)) == 0)
          {
            v47 = -[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:]((uint64_t)v39, &v193);
            goto LABEL_56;
          }
          if (v46 == 2)
          {
            v47 = -[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:]((uint64_t)v39, &v193);
            goto LABEL_56;
          }
          if (v46 == 1)
          {
            v47 = -[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:]((uint64_t)v39, &v193);
LABEL_56:
            if ((v47 & 1) == 0)
            {
              if ((_QWORD)v193)
              {
                v191 = (id)v193;
              }
              else
              {
                v48 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                _NSCoreDataLog(17, v48, v49, v50, v51, v52, v53, v54, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
                v55 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecord"
                         "ImportConflict.m";
                  v202 = 1024;
                  v203 = 852;
                  _os_log_fault_impl(&dword_18A253000, v55, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                }
              }
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unknown change type for transaction entry: %@"), "+[PFUbiquityRecordImportConflict createTransactionLogForTransactionEntry:withImportContext:error:]", 847, v12);
          }
          saveSnapshot = v39->_saveSnapshot;
          transactionLogLocation = v39->_transactionLogLocation;
          if (transactionLogLocation)
          {
            storeName = transactionLogLocation->_storeName;
            if (saveSnapshot)
              goto LABEL_65;
LABEL_101:
            v59 = 0;
            if (!v12)
              goto LABEL_102;
LABEL_66:
            v60 = -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](v59, *(_QWORD *)(v12 + 8));
            v61 = *(_DWORD *)(v12 + 16);
            switch(v61)
            {
              case 2:
                v67 = v39->_saveSnapshot;
                if (v67)
                {
                  v64 = (void **)-[NSMutableDictionary objectForKey:](v67->_storeNameToStoreSaveSnapshots, "objectForKey:", *(_QWORD *)(v12 + 32));
                  if (v64)
                  {
                    v65 = v64 + 13;
LABEL_79:
                    v64 = (void **)*v65;
                  }
LABEL_80:
                  v33 = -[PFUbiquityRecordImportConflict createSnapshotFromLogContent:withTransactionLog:](a1, (void *)objc_msgSend(v64, "objectForKey:", v60), (uint64_t)v39);
                  goto LABEL_82;
                }
                break;
              case 1:
                v66 = v39->_saveSnapshot;
                if (v66)
                {
                  v64 = (void **)-[NSMutableDictionary objectForKey:](v66->_storeNameToStoreSaveSnapshots, "objectForKey:", *(_QWORD *)(v12 + 32));
                  if (v64)
                  {
                    v65 = v64 + 12;
                    goto LABEL_79;
                  }
                  goto LABEL_80;
                }
                break;
              case 0:
                v62 = *(_QWORD *)(v12 + 32);
                goto LABEL_70;
              default:
                v33 = 0;
LABEL_82:

                goto LABEL_91;
            }
          }
          else
          {
            storeName = 0;
            if (!saveSnapshot)
              goto LABEL_101;
LABEL_65:
            v59 = -[NSMutableDictionary objectForKey:](saveSnapshot->_storeNameToStoreSaveSnapshots, "objectForKey:", storeName);
            if (v12)
              goto LABEL_66;
LABEL_102:
            v60 = -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](v59, 0);
            v62 = 0;
LABEL_70:
            v63 = v39->_saveSnapshot;
            if (v63)
            {
              v64 = (void **)-[NSMutableDictionary objectForKey:](v63->_storeNameToStoreSaveSnapshots, "objectForKey:", v62);
              if (v64)
              {
                v65 = v64 + 11;
                goto LABEL_79;
              }
              goto LABEL_80;
            }
          }
          v64 = 0;
          goto LABEL_80;
        }
        *(_QWORD *)&v193 = 0;
        v13 = *(_QWORD *)(v12 + 8);
        if (!v13 || !*(_QWORD *)(v13 + 48))
        {
          v15 = (void *)objc_msgSend(*(id *)(a1 + 80), "objectForKey:");
          v16 = *(void **)(v12 + 8);
          if (v16)
            objc_setProperty_nonatomic(v16, v14, v15, 48);
        }
        v17 = *(_QWORD *)(a1 + 88);
        if (v17 && (v18 = *(_QWORD *)(v17 + 56)) != 0)
        {
          v19 = *(_QWORD *)(v18 + 24);
          if (v19)
          {
            v20 = *(_QWORD *)(v19 + 40);
            v21 = *(_QWORD *)(v19 + 48);
            if (*(_DWORD *)(v19 + 24) != 1)
              v19 = *(_QWORD *)(v19 + 8);
          }
          else
          {
            v21 = 0;
            v20 = 0;
          }
        }
        else
        {
          v21 = 0;
          v20 = 0;
          v19 = 0;
        }
        v22 = +[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 10, v20, v21, (void *)v19);
        v23 = [PFUbiquityBaseline alloc];
        v24 = *(_QWORD *)(a1 + 88);
        if (v24 && (v25 = *(_QWORD *)(v24 + 56)) != 0)
          v26 = *(_QWORD *)(v25 + 80);
        else
          v26 = 0;
        v27 = -[PFUbiquityBaseline initWithBaselineLocation:andLocalPeerID:](v23, "initWithBaselineLocation:andLocalPeerID:", v22, v26);

        if (!v27)
        {
          v29 = 0;
LABEL_88:

          goto LABEL_89;
        }
        v28 = -[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:](v27, 1, (id *)&v193);

        if (v28)
        {
          v29 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
          -[NSManagedObjectContext setPersistentStoreCoordinator:](v29, "setPersistentStoreCoordinator:", v28);
          -[NSManagedObjectContext setUndoManager:](v29, "setUndoManager:", 0);
          -[NSManagedObjectContext _setDelegate:](v29, "_setDelegate:", a1);
          -[NSManagedObjectContext setMergePolicy:](v29, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);

          v30 = *(_QWORD *)(v12 + 8);
          if (v30)
            v31 = *(_QWORD *)(v30 + 48);
          else
            v31 = 0;
          v32 = -[NSManagedObjectContext existingObjectWithID:error:](v29, "existingObjectWithID:error:", v31, &v193);
          if (v32)
          {
            v33 = +[PFUbiquityRecordImportConflict createSnapshotFromManagedObject:withSourceObject:]((uint64_t)PFUbiquityRecordImportConflict, v32, *(void **)(a1 + 16));

            if (v33)
              goto LABEL_91;
            goto LABEL_89;
          }
          goto LABEL_88;
        }
LABEL_89:
        if (!(_QWORD)v193)
        {
          v70 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v70, v71, v72, v73, v74, v75, v76, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
          v77 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m";
            v202 = 1024;
            v203 = 705;
            _os_log_fault_impl(&dword_18A253000, v77, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
          goto LABEL_226;
        }
        v33 = 0;
        v191 = (id)v193;
LABEL_91:
        if (!v33)
          goto LABEL_226;
        v68 = -[PFUbiquityPeerSnapshot initWithTranasctionEntry:andLogSnapshot:]([PFUbiquityPeerSnapshot alloc], "initWithTranasctionEntry:andLogSnapshot:", v12, v33);
        -[PFUbiquityPeerSnapshotCollection addSnapshot:]((uint64_t)v7, v68);
        if (v68)
          kv = v68->_kv;
        else
          kv = 0;
        objc_msgSend(v172, "setObject:forKey:", v12, kv);

        ++v11;
      }
      while (v9 != v11);
      v8 = obj;
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v199, 16);
      v9 = v78;
      v3 = a1;
    }
    while (v78);
  }

  -[PFUbiquityPeerSnapshotCollection calculateSnapshotDiffsWithError:]((uint64_t)v7);
  v79 = *(_QWORD *)(v3 + 88);
  if (v79)
    v80 = *(_QWORD *)(v79 + 48);
  else
    v80 = 0;
  v81 = *(void **)(v3 + 32);
  objc_opt_self();
  v82 = v81;
  v169 = v174 + 1;
  while (1)
  {
    v83 = (id *)-[PFUbiquityKnowledgeVector newKnowledgeVectorByDecrementingPeerWithID:]((uint64_t)v82, v80);
    if ((objc_msgSend(v82, "isEqual:", v83) & 1) != 0)
    {
      v92 = 0;
      goto LABEL_130;
    }

    if (v83)
    {
      v84 = objc_msgSend(v83[1], "objectForKey:", v80);
      if (v7)
        goto LABEL_115;
    }
    else
    {
      v84 = 0;
      if (v7)
      {
LABEL_115:
        v85 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](v7->_peerIDToTranasctionNumberToKnowledgeVector, "objectForKey:", v80), "objectForKey:", v84);
        goto LABEL_116;
      }
    }
    v85 = 0;
LABEL_116:
    v195 = 0u;
    v196 = 0u;
    v193 = 0u;
    v194 = 0u;
    v86 = (void *)objc_msgSend(v85, "allObjects");
    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v193, buf, 16);
    if (v87)
    {
      v88 = *(_QWORD *)v194;
      do
      {
        v89 = 0;
        v90 = v83;
        do
        {
          if (*(_QWORD *)v194 != v88)
            objc_enumerationMutation(v86);
          v83 = (id *)-[PFUbiquityKnowledgeVector createAncestorVectorForConflictingVector:](v90, *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * v89));

          ++v89;
          v90 = v83;
        }
        while (v87 != v89);
        v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v193, buf, 16);
      }
      while (v87);
    }
    if (v7)
    {
      v91 = -[NSMutableDictionary objectForKey:](v7->_kvToSnapshot, "objectForKey:", v83);
      if (v91)
        break;
    }
    v82 = v83;

  }
  v82 = 0;
  v92 = *(void **)(v91 + 24);
LABEL_130:

  v93 = v92;
  if (!v7 || (v171 = -[NSMutableDictionary objectForKey:](v7->_kvToSnapshot, "objectForKey:", v93)) == 0)
  {
    v94 = objc_msgSend(*(id *)(v3 + 72), "objectAtIndex:", 0);
    if (v94)
    {
      v95 = *(_QWORD *)(v94 + 56);
      if (v7)
        goto LABEL_134;
LABEL_248:
      v171 = 0;
    }
    else
    {
      v95 = 0;
      if (!v7)
        goto LABEL_248;
LABEL_134:
      v171 = -[NSMutableDictionary objectForKey:](v7->_kvToSnapshot, "objectForKey:", v95);
    }
  }
  v96 = (id *)-[PFUbiquityKnowledgeVector newKnowledgeVectorByAddingKnowledgeVector:](*(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 32));
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nElected ancestor vector: %@ and snapshot: %@\nNew vector: %@"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 309, v3, v93, v171, v96);

  v97 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  if (v96)
  {
    v173 = (void *)objc_msgSend(v96[1], "allKeys");
    v98 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v183, v198, 16);
  }
  else
  {
    v173 = 0;
    v98 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v183, v198, 16);
  }
  v99 = v98;
  if (!v98)
  {
    LOBYTE(obja) = 1;
    goto LABEL_174;
  }
  v175 = *(_QWORD *)v184;
  obja = 1;
  while (2)
  {
    v100 = 0;
    while (2)
    {
      if (*(_QWORD *)v184 != v175)
        objc_enumerationMutation(v173);
      v101 = *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * v100);
      if (v96)
        v102 = (void *)objc_msgSend(v96[1], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * v100));
      else
        v102 = 0;
      if (objc_msgSend(v102, "integerValue") < 1)
        goto LABEL_165;
      if (!v7)
      {
        v104 = 0;
        goto LABEL_169;
      }
      v103 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v7->_peerIDToTransactionNumberToSnapshot, "objectForKey:", v101), "objectForKey:", v102);
      v104 = v103;
      if (!v103)
      {
LABEL_169:
        v106 = 0;
        v105 = 1;
        goto LABEL_150;
      }
      v105 = 0;
      v106 = *(void **)(v103 + 24);
LABEL_150:
      obja &= objc_msgSend(v106, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
      if (v105)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got nil snapshot for peerID: %@ and transaction number: %@\n\tnew knowledge vector: %@\n\timport conflict: %@"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 329, v101, v102, v96, a1);
        v107 = *(_QWORD *)(a1 + 32);
        if (v107)
          v108 = (void *)objc_msgSend(*(id *)(v107 + 8), "objectForKey:", v101);
        else
          v108 = 0;
        v109 = v108;
        if (!v109)
          v109 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
        v110 = objc_msgSend(v109, "integerValue");
        v111 = objc_msgSend(v102, "integerValue") - 1;
        while (v111 > v110)
        {
          v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v111);
          if (v7
            && (v113 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v7->_peerIDToTransactionNumberToSnapshot, "objectForKey:", v101), "objectForKey:", v112)) != 0)
          {
            objc_msgSend(v97, "addObject:", v113);
            v111 = -1;
          }
          else
          {
            --v111;
          }

        }
      }
      else
      {
        objc_msgSend(v97, "addObject:", v104);
      }
LABEL_165:
      if (++v100 != v99)
        continue;
      break;
    }
    v114 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v183, v198, 16);
    v99 = v114;
    if (v114)
      continue;
    break;
  }
LABEL_174:

  if ((obja & 1) != 0)
  {
    if (v7)
      v115 = -[NSMutableDictionary objectForKey:](v7->_kvToSnapshot, "objectForKey:", *(_QWORD *)(a1 + 32));
    else
      v115 = 0;
    objc_msgSend(v97, "addObject:", v115);
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Sorting snapshots: %@"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 366, v97);
  objc_msgSend(v97, "sortUsingComparator:", &__block_literal_global_30);
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got snapshots to merge: %@"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 376, v97);
  v116 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  if (v171)
    v117 = *(void **)(v171 + 8);
  else
    v117 = 0;
  v118 = -[PFUbiquityRecordImportConflict resolveMergeConflictForLogContent:previousSnapshot:andAncestorSnapshot:withOldVersion:andNewVersion:error:](a1, v117, 0, v116, v170, v169, (uint64_t)&v191);

  if ((v118 & 1) != 0)
  {
    if (v171)
      v119 = *(void **)(v171 + 8);
    else
      v119 = 0;
    v120 = v119;
    v181 = 0u;
    v182 = 0u;
    v179 = 0u;
    v180 = 0u;
    v121 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v179, v197, 16);
    if (v121)
    {
      v122 = *(_QWORD *)v180;
LABEL_189:
      v123 = 0;
      while (1)
      {
        if (*(_QWORD *)v180 != v122)
          objc_enumerationMutation(v97);
        v124 = *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * v123);
        v125 = (void *)objc_msgSend(v120, "mutableCopy");
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Merging snapshot into current snapshot: %@"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 394, v124);
        if (v124)
          v126 = *(_QWORD *)(v124 + 16);
        else
          v126 = 0;
        objc_msgSend(v125, "addEntriesFromDictionary:", v126);
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Merging current snapshot: %@\nWith previous snapshot: %@\n and ancestor snapshot: %@\n"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 397, v125, v120, v171);
        v127 = v171 ? *(void **)(v171 + 8) : 0;
        if ((-[PFUbiquityRecordImportConflict resolveMergeConflictForLogContent:previousSnapshot:andAncestorSnapshot:withOldVersion:andNewVersion:error:](a1, v125, v120, v127, v170, v169, (uint64_t)&v191) & 1) == 0)break;

        v120 = +[PFUbiquityRecordImportConflict createSnapshotFromManagedObject:withSourceObject:]((uint64_t)PFUbiquityRecordImportConflict, *(void **)(a1 + 16), *(void **)(a1 + 16));
        if (v121 == ++v123)
        {
          v128 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v179, v197, 16);
          v121 = v128;
          if (v128)
            goto LABEL_189;
          goto LABEL_206;
        }
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error encountered trying to resolve conflict: %@\nuserInfo: %@"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 400, v191, objc_msgSend(v191, "userInfo"));
      v131 = v191;
      if (v191)
        goto LABEL_217;
      v159 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v159, v160, v161, v162, v163, v164, v165, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
      v139 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        goto LABEL_234;
      *(_DWORD *)buf = 136315394;
      v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m";
      v202 = 1024;
      v203 = 401;
LABEL_240:
      _os_log_fault_impl(&dword_18A253000, v139, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      goto LABEL_234;
    }
LABEL_206:
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Done resolving conflict: %@"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 410, a1);

    v129 = 0;
    v130 = 1;
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error encountered trying to reset the source object to the ancestor state: %@\nuserInfo: %@"), "-[PFUbiquityRecordImportConflict resolveConflict:]", 383, v191, objc_msgSend(v191, "userInfo"));
    v131 = v191;
    if (v191)
    {
LABEL_217:
      if (v166)
        *v166 = v131;
    }
    else
    {
      v132 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v132, v133, v134, v135, v136, v137, v138, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
      v139 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m";
        v202 = 1024;
        v203 = 384;
        goto LABEL_240;
      }
    }
LABEL_234:
    v130 = 0;
    v192 = 0;
    v129 = 1;
  }

  v156 = 0;
  v157 = v192;
  if (!v129)
    v157 = v130;
  return v157 & 1;
}

uint64_t __50__PFUbiquityRecordImportConflict_resolveConflict___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
  {
    if (a2)
    {
      objc_msgSend(*(id *)(a2 + 40), "timeIntervalSince1970");
      v6 = v5;
      v7 = *(_QWORD *)(a2 + 24);
      if (a3)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(0, "timeIntervalSince1970");
      v6 = v16;
      v7 = 0;
      if (a3)
      {
LABEL_4:
        objc_msgSend(*(id *)(a3 + 40), "timeIntervalSince1970");
        v9 = v8;
        v10 = *(_QWORD *)(a3 + 24);
        if (a2)
          goto LABEL_5;
        goto LABEL_16;
      }
    }
    objc_msgSend(0, "timeIntervalSince1970");
    v9 = v17;
    v10 = 0;
    if (a2)
    {
LABEL_5:
      v11 = *(void **)(a2 + 40);
      if (a3)
      {
LABEL_6:
        v12 = *(_QWORD *)(a3 + 40);
LABEL_7:
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Comparing:\n\t%f - %@\n\t%f - %@\n\t%d"), "-[PFUbiquityRecordImportConflict resolveConflict:]_block_invoke", 372, v6, v7, v9, v10, objc_msgSend(v11, "compare:", v12));
        goto LABEL_8;
      }
LABEL_17:
      v12 = 0;
      goto LABEL_7;
    }
LABEL_16:
    v11 = 0;
    if (a3)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_8:
  if (!a2)
  {
    v13 = 0;
    if (a3)
      goto LABEL_10;
LABEL_13:
    v14 = 0;
    return objc_msgSend(v13, "compare:", v14);
  }
  v13 = *(void **)(a2 + 40);
  if (!a3)
    goto LABEL_13;
LABEL_10:
  v14 = *(_QWORD *)(a3 + 40);
  return objc_msgSend(v13, "compare:", v14);
}

+ (id)createSnapshotFromManagedObject:(void *)a3 withSourceObject:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSTemporaryObjectID *v24;
  NSTemporaryObjectID *v25;
  char v26;
  void *v27;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)objc_msgSend((id)objc_msgSend(a2, "entity"), "properties");
  v7 = objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore");
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectID"), "persistentStore");
  v9 = (id)objc_msgSend((id)objc_msgSend(a3, "managedObjectContext"), "persistentStoreCoordinator");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v10)
  {
    v11 = v10;
    v33 = *(_QWORD *)v39;
    v30 = v5;
    v31 = a2;
    v29 = v6;
    do
    {
      v12 = 0;
      v32 = v11;
      do
      {
        if (*(_QWORD *)v39 != v33)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
        v14 = objc_msgSend(a2, "valueForKey:", objc_msgSend(v13, "name"));
        if (v14)
        {
          v15 = (void *)v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = v15;
LABEL_30:
            objc_msgSend(v5, "setObject:forKey:", v16, objc_msgSend(v13, "name"));

            goto LABEL_31;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v13, "isToMany"))
              v17 = v15;
            else
              v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v15, 0);
            v18 = v17;
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v17, "count"));
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v35;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v35 != v22)
                    objc_enumerationMutation(v18);
                  v24 = (NSTemporaryObjectID *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "objectID");
                  v25 = v24;
                  if (v7 != v8)
                    v25 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v9, (CFURLRef)-[NSTemporaryObjectID URIRepresentation](v24, "URIRepresentation"), 0);
                  if (v25)
                    objc_msgSend(v19, "addObject:");
                }
                v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              }
              while (v21);
            }
            v26 = objc_msgSend(v13, "isToMany");
            v27 = v19;
            if ((v26 & 1) == 0)
              v27 = (void *)objc_msgSend(v19, "anyObject");
            v16 = v27;

            v5 = v30;
            a2 = v31;
            v6 = v29;
            v11 = v32;
            goto LABEL_30;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unknown property type: %@"), "+[PFUbiquityRecordImportConflict createSnapshotFromManagedObject:withSourceObject:]", 599, v13);
          }
        }
LABEL_31:
        ++v12;
      }
      while (v12 != v11);
      v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v11);
  }

  return v5;
}

+ (uint64_t)resolvedTypeForConflictingLogType:(uint64_t)a3 andLatestTransactionEntry:(_BYTE *)a4 skipObject:
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_opt_self();
  if ((_DWORD)a2 != 2)
  {
    if ((_DWORD)a2 != 1)
    {
      if ((_DWORD)a2)
        return a2;
      if (a3)
      {
        v7 = *(_DWORD *)(a3 + 16);
        if (v7)
        {
          if (v7 != 2)
            return v7 == 1;
          a2 = 2;
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping inserted object with globalID: %@ because it was later deleted by the transaction with entry: %@"), "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 494, *(_QWORD *)(a3 + 8), a3);
          return a2;
        }
        if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        {
LABEL_23:
          a2 = 0;
          *a4 = 1;
          return a2;
        }
        v10 = *(_QWORD *)(a3 + 8);
      }
      else
      {
        if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          goto LABEL_23;
        v10 = 0;
      }
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping inserted object with globalID: %@ because it was later deleted, and the re-inserted by the transaction with entry: %@"), "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 490, v10, a3);
      goto LABEL_23;
    }
    if (a3)
    {
      v9 = *(_DWORD *)(a3 + 16);
      if (v9)
      {
        if (v9 != 2)
          return 1;
        a2 = 2;
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping updated object with globalID: %@ because it was later deleted by the transaction with entry: %@"), "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 514, *(_QWORD *)(a3 + 8), a3);
        return a2;
      }
      if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      {
LABEL_27:
        a2 = 1;
        *a4 = 1;
        return a2;
      }
      v11 = *(_QWORD *)(a3 + 8);
    }
    else
    {
      if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        goto LABEL_27;
      v11 = 0;
    }
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping updated object with globalID: %@ because it was later inserted (meaning it had to have also been deleted by some prior transaction) by the transaction with entry: %@"), "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 507, v11, a3);
    goto LABEL_27;
  }
  if (!a3)
  {
    a2 = 2;
    if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      return a2;
    v12 = 0;
    goto LABEL_32;
  }
  v8 = *(_DWORD *)(a3 + 16);
  switch(v8)
  {
    case 0:
      a2 = 2;
      if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        return a2;
      v12 = *(_QWORD *)(a3 + 8);
LABEL_32:
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Object with globalID: %@ was later inserted by the transaction with entry: %@"), "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 522, v12, a3);
      return a2;
    case 1:
      a2 = 2;
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Deleting existing object with globalID: %@ because previously deleted in a log file."), "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 528, *(_QWORD *)(a3 + 8));
      break;
    case 2:
      a2 = 2;
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping deleted object with globalID: %@ because it was already deleted, and then deleted by the transaction with entry: %@ and thus no longer exists in the store."), "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 525, *(_QWORD *)(a3 + 8), a3);
      break;
    default:
      return 2;
  }
  return a2;
}

- (id)createSnapshotFromLogContent:(uint64_t)a3 withTransactionLog:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  _QWORD *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "entity"), "properties");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v18 = (_QWORD *)a1;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "name");
        v13 = (id)objc_msgSend(a2, "valueForKey:", v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v11, "attributeType") == 1800)
            v13 = +[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v13, v11);
          objc_msgSend(v5, "setValue:forKey:", v13, v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = (void *)objc_msgSend(v18, "createSetOfManagedObjectIDsForGlobalIDsInRelationship:withValue:withGlobalIDToLocalIDURIMap:andTransactionLog:", v11, v13, v18[10], a3);
            v15 = objc_msgSend(v11, "isToMany");
            v16 = (uint64_t)v14;
            if ((v15 & 1) == 0)
              v16 = objc_msgSend(v14, "anyObject", v14);
            objc_msgSend(v5, "setValue:forKey:", v16, v12);

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unknown property type: %@"), "-[PFUbiquityRecordImportConflict createSnapshotFromLogContent:withTransactionLog:]", 743, v11);
            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  return v5;
}

- (id)createSetOfManagedObjectIDsForGlobalIDsInRelationship:(id)a3 withValue:(id)a4 withGlobalIDToLocalIDURIMap:(id)a5 andTransactionLog:(id)a6
{
  NSManagedObject *sourceObject;
  NSPersistentStoreCoordinator *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  PFUbiquityImportContext *importContext;
  PFUbiquitySwitchboardCacheWrapper *cacheWrapper;
  uint64_t peerRangeCache;
  uint64_t v30;
  uint64_t v31;
  PFUbiquityRecordImportConflict *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  if (self)
    sourceObject = self->_sourceObject;
  else
    sourceObject = 0;
  v11 = -[NSManagedObjectContext persistentStoreCoordinator](-[NSManagedObject managedObjectContext](sourceObject, "managedObjectContext"), "persistentStoreCoordinator");
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(a3, "isToMany"))
    v13 = a4;
  else
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", a4, 0);
  v14 = v13;
  if (a6)
  {
    v15 = *((_QWORD *)a6 + 9);
    v16 = *((_QWORD *)a6 + 3);
    if (v16)
    {
      v17 = *(_QWORD *)(v16 + 40);
      if (v15)
      {
LABEL_11:
        a6 = (id)objc_msgSend(*(id *)(v15 + 40), "objectForKey:", v17);
        goto LABEL_12;
      }
    }
    else
    {
      v17 = 0;
      if (v15)
        goto LABEL_11;
    }
    a6 = 0;
  }
LABEL_12:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v18)
  {
    v19 = v18;
    v33 = self;
    v20 = 0;
    v21 = *(_QWORD *)v36;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v14);
        v23 = -[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:]((uint64_t)a6, *(void **)(*((_QWORD *)&v35 + 1) + 8 * v22));
        v24 = v23;
        if (!v23 || (v25 = *(_QWORD *)(v23 + 48)) == 0)
        {
          v26 = (void *)objc_msgSend(a5, "objectForKey:", v23);
          if (!v26)
          {
            if (!v20)
            {
              if ((importContext = v33->_importContext) == 0
                || (cacheWrapper = importContext->_cacheWrapper) == 0
                || (peerRangeCache = (uint64_t)cacheWrapper->_peerRangeCache) == 0
                || (!a6 ? (v30 = 0) : (v30 = *((_QWORD *)a6 + 3)),
                    (v20 = (void *)-[PFUbiquityPeerRangeCache createMapOfManagedObjectIDsForGlobalIDs:count:error:](peerRangeCache, v30, 0, 0)) == 0))
              {
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unable to map objectIDs"), 0));
              }
            }
            v26 = (void *)objc_msgSend(v20, "objectForKey:", v24);
          }
          v25 = -[NSPersistentStoreCoordinator managedObjectIDFromUTF8String:length:](v11, "managedObjectIDFromUTF8String:length:", objc_msgSend(v26, "UTF8String"), objc_msgSend(v26, "lengthOfBytesUsingEncoding:", 4));
        }
        objc_msgSend(v12, "addObject:", v25);
        ++v22;
      }
      while (v19 != v22);
      v31 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      v19 = v31;
    }
    while (v31);
  }
  else
  {
    v20 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  id v4;
  NSString *conflictingObjectGlobalIDStr;
  NSManagedObject *sourceObject;
  uint64_t conflictingLogTransactionType;
  NSDate *conflictLogDate;
  NSDictionary *conflictingLogContent;
  PFUbiquityKnowledgeVector *conflictingLogKnowledgeVector;
  NSArray *transactionHistory;
  NSDictionary *globalIDIndexToLocalIDURIMap;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)PFUbiquityRecordImportConflict;
  v4 = -[PFUbiquityRecordImportConflict description](&v14, sel_description);
  if (self)
  {
    conflictingObjectGlobalIDStr = self->_conflictingObjectGlobalIDStr;
    sourceObject = self->_sourceObject;
    conflictingLogTransactionType = self->_conflictingLogTransactionType;
    conflictLogDate = self->_conflictLogDate;
    conflictingLogContent = self->_conflictingLogContent;
    conflictingLogKnowledgeVector = self->_conflictingLogKnowledgeVector;
    transactionHistory = self->_transactionHistory;
    globalIDIndexToLocalIDURIMap = self->_globalIDIndexToLocalIDURIMap;
  }
  else
  {
    transactionHistory = 0;
    conflictLogDate = 0;
    conflictingLogContent = 0;
    conflictingObjectGlobalIDStr = 0;
    sourceObject = 0;
    conflictingLogTransactionType = 0;
    conflictingLogKnowledgeVector = 0;
    globalIDIndexToLocalIDURIMap = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tconflictingObjectGlobalIDStr: %@\n\tsourceObject: %@\n\tconflictingLogContent: %@\n\tconflictingLogTransactionType: %d\n\tconflictLogDate: %@\n\tconflictingLogKnowledgeVector: %@\n\ttransactionHistory: %@\n\tglobalIDStrToLocalIDURIMap: %@\n\n"), v4, conflictingObjectGlobalIDStr, sourceObject, conflictingLogContent, conflictingLogTransactionType, conflictLogDate, conflictingLogKnowledgeVector, transactionHistory, globalIDIndexToLocalIDURIMap);
}

@end
