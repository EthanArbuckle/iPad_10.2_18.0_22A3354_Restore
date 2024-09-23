@implementation PFCloudKitImportZoneContext

- (PFCloudKitImportZoneContext)initWithUpdatedRecords:(id)a3 deletedRecordTypeToRecordIDs:(id)a4 options:(id)a5 fileBackedFuturesDirectory:(id)a6
{
  PFCloudKitImportZoneContext *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PFCloudKitImportZoneContext;
  v10 = -[PFCloudKitImportZoneContext init](&v12, sel_init);
  if (v10)
  {
    v10->_updatedRecords = (NSArray *)a3;
    v10->_deletedRecordTypeToRecordID = (NSDictionary *)a4;
    v10->_recordTypeToUnresolvedRecordIDs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10->_mirroringOptions = (NSCloudKitMirroringDelegateOptions *)a5;
    if (a6 && objc_msgSend(a6, "length"))
      v10->_fileBackedFuturesDirectory = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", a6);
    v10->_metadatasToLink = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_updatedRecords = 0;
  self->_deletedRecordTypeToRecordID = 0;

  self->_deletedObjectIDs = 0;
  self->_deletedMirroredRelationshipRecordIDs = 0;

  self->_modifiedRecords = 0;
  self->_updatedRelationships = 0;

  self->_deletedRelationships = 0;
  self->_recordTypeToRecordIDToObjectID = 0;

  self->_recordTypeToUnresolvedRecordIDs = 0;
  self->_importOperations = 0;

  self->_mirroringOptions = 0;
  self->_fileBackedFuturesDirectory = 0;

  self->_metadatasToLink = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImportZoneContext;
  -[PFCloudKitImportZoneContext dealloc](&v3, sel_dealloc);
}

- (uint64_t)initializeCachesWithManagedObjectContext:(void *)a3 andObservedStore:(id *)a4 error:
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  PFMirroredManyToManyRelationshipV2 *v29;
  PFMirroredManyToManyRelationshipV2 *v30;
  _QWORD *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  PFMirroredManyToManyRelationship *v79;
  _QWORD *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  PFMirroredManyToManyRelationshipV2 *v87;
  NSRelationshipDescription *relationshipDescription;
  id v89;
  NSRelationshipDescription *v90;
  CKRecordID *ckRecordID;
  NSRelationshipDescription *inverseRelationshipDescription;
  id v93;
  NSRelationshipDescription *v94;
  CKRecordID *relatedCKRecordID;
  id v96;
  id v97;
  void *v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  id v122;
  id *v123;
  id v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t k;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  void **p_cache;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  void **v144;
  uint64_t v145;
  uint64_t m;
  uint64_t v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  uint64_t v152;
  char *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  uint64_t n;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  BOOL v161;
  void *v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  char v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  NSObject *v185;
  uint64_t v186;
  id v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  NSObject *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  NSObject *v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  NSObject *v213;
  id v214;
  uint64_t v215;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  char v223;
  uint64_t v224;
  uint64_t v225;
  char *v226;
  char *v227;
  void *context;
  char *contexta;
  char *v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  id obj;
  id obja;
  id objb;
  id v243;
  id v244;
  id v246;
  id v247;
  _QWORD v248[6];
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  _QWORD v269[8];
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  _QWORD v278[8];
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  id v287;
  uint8_t buf[4];
  const char *v289;
  __int16 v290;
  int v291;
  _BYTE v292[128];
  _BYTE v293[128];
  _BYTE v294[128];
  _BYTE v295[128];
  _BYTE v296[128];
  _BYTE v297[128];
  _BYTE v298[128];
  _BYTE v299[128];
  _BYTE v300[128];
  uint64_t v301;

  v301 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v287 = 0;
  v220 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v246 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v243 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v219 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v218 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v232 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v233 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v239 = a2;
  v244 = (id)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
  v247 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v234 = a3;
  if (objc_msgSend(a3, "configurationName"))
    v6 = (void *)objc_msgSend(v244, "entitiesForConfiguration:", objc_msgSend(a3, "configurationName"));
  else
    v6 = (void *)objc_msgSend((id)objc_msgSend(v244, "entitiesByName"), "allValues");
  v7 = v6;
  v285 = 0u;
  v286 = 0u;
  v283 = 0u;
  v284 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v283, v300, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v284;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v284 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v247, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v283 + 1) + 8 * i), "name"));
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v283, v300, 16);
    }
    while (v8);
  }
  v281 = 0u;
  v282 = 0u;
  v279 = 0u;
  v280 = 0u;
  obj = *(id *)(a1 + 8);
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v279, v299, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v280;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v280 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * j);
        v15 = (void *)MEMORY[0x18D76B4E4]();
        v16 = (void *)objc_msgSend(v14, "recordType");
        v17 = (void *)objc_msgSend(v14, "recordType");
        if (objc_msgSend(v17, "hasPrefix:", CFSTR("CD_")))
          v17 = (void *)objc_msgSend(v17, "substringFromIndex:", objc_msgSend(CFSTR("CD_"), "length"));
        if ((objc_msgSend(v16, "hasPrefix:", CFSTR("CD_M2M_")) & 1) != 0
          || objc_msgSend(v16, "isEqualToString:", CFSTR("CDMR")))
        {
          v18 = (void *)MEMORY[0x18D76B4E4]();
          v19 = __ckLoggingOverride;
          v20 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Updating relationship described by record: %@"));
          if (v19 >= 9)
            v27 = 9;
          else
            v27 = v19;
          _NSCoreDataLog(v27, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
          objc_autoreleasePoolPop(v18);
          v28 = (uint64_t)v14;
          if (objc_msgSend(*(id *)(a1 + 96), "useDeviceToDeviceEncryption"))
            v28 = objc_msgSend(v14, "encryptedValues");
          if (!+[PFMirroredRelationship isValidMirroredRelationshipRecord:values:](PFMirroredRelationship, "isValidMirroredRelationshipRecord:values:", v14, v28))
          {
            v32 = (void *)MEMORY[0x18D76B4E4]();
            v33 = __ckLoggingOverride;
            v34 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Skipping invalid mirrored relationship record: %@"));
            if (v33 >= 3)
              v41 = 3;
            else
              v41 = v33;
LABEL_47:
            _NSCoreDataLog(v41, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
            objc_autoreleasePoolPop(v32);
            goto LABEL_48;
          }
          v29 = +[PFMirroredRelationship mirroredRelationshipWithManyToManyRecord:values:andManagedObjectModel:]((uint64_t)PFMirroredRelationship, v14, v28, (uint64_t)v244);
          v30 = v29;
          if (v29)
          {
            if (v29->super._relationshipDescription && v29->super._inverseRelationshipDescription)
            {
              objc_msgSend(v219, "addObject:", v29);
              v31 = -[PFMirroredManyToManyRelationship recordTypeToRecordID](v30);
              v278[0] = MEMORY[0x1E0C809B0];
              v278[1] = 3221225472;
              v278[2] = __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke;
              v278[3] = &unk_1E1EDD640;
              v278[4] = v247;
              v278[5] = v246;
              v278[6] = a1;
              v278[7] = v14;
              objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v278);
              goto LABEL_48;
            }
            v43 = (void *)MEMORY[0x18D76B4E4]();
            v44 = __ckLoggingOverride;
            v45 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Skipping mirrored relationship for unknown relationships: %@"));
            if (v44 >= 0x10)
              v52 = 16;
            else
              v52 = v44;
            _NSCoreDataLog(v52, v45, v46, v47, v48, v49, v50, v51, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
          }
          else
          {
            v43 = (void *)MEMORY[0x18D76B4E4]();
            v53 = __ckLoggingOverride;
            v54 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to serialize many to many relationship from record: %@"));
            _NSCoreDataLog(v53 != 0, v54, v55, v56, v57, v58, v59, v60, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
          }
          objc_autoreleasePoolPop(v43);
        }
        else
        {
          if (!objc_msgSend(v247, "containsObject:", v17))
          {
            v32 = (void *)MEMORY[0x18D76B4E4]();
            v61 = __ckLoggingOverride;
            v34 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Skipping unknown updated record: %@\nIt is not a part of: %@"));
            if (v61 >= 3)
              v41 = 3;
            else
              v41 = v61;
            goto LABEL_47;
          }
          v42 = (id)objc_msgSend(v246, "objectForKey:", v16);
          if (!v42)
          {
            v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v246, "setObject:forKey:", v42, v16);
          }
          objc_msgSend(v220, "addObject:", v14);
          objc_msgSend(v42, "addObject:", objc_msgSend(v14, "recordID"));

        }
LABEL_48:
        objc_autoreleasePoolPop(v15);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v279, v299, 16);
    }
    while (v11);
  }
  v276 = 0u;
  v277 = 0u;
  v274 = 0u;
  v275 = 0u;
  v221 = *(id *)(a1 + 16);
  v62 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v274, v298, 16);
  if (!v62)
  {
    v223 = 1;
    goto LABEL_124;
  }
  v223 = 1;
  v224 = *(_QWORD *)v275;
  do
  {
    v63 = 0;
    v226 = (char *)v62;
    do
    {
      if (*(_QWORD *)v275 != v224)
        objc_enumerationMutation(v221);
      v230 = v63;
      v64 = *(void **)(*((_QWORD *)&v274 + 1) + 8 * (_QWORD)v63);
      context = (void *)MEMORY[0x18D76B4E4]();
      obja = (id)objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v64);
      v236 = (uint64_t)v64;
      if (objc_msgSend(v64, "hasPrefix:", CFSTR("CD_")))
        v236 = objc_msgSend(v64, "substringFromIndex:", objc_msgSend(CFSTR("CD_"), "length"));
      v272 = 0u;
      v273 = 0u;
      v270 = 0u;
      v271 = 0u;
      v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v270, v297, 16);
      if (v65)
      {
        v66 = *(_QWORD *)v271;
        do
        {
          v67 = 0;
          do
          {
            if (*(_QWORD *)v271 != v66)
              objc_enumerationMutation(obja);
            v68 = *(void **)(*((_QWORD *)&v270 + 1) + 8 * v67);
            v69 = (void *)MEMORY[0x18D76B4E4]();
            v70 = __ckLoggingOverride;
            v71 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Deleting record with id (%@): %@"));
            if (v70 >= 9)
              v78 = 9;
            else
              v78 = v70;
            _NSCoreDataLog(v78, v71, v72, v73, v74, v75, v76, v77, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
            objc_autoreleasePoolPop(v69);
            if (objc_msgSend(v64, "hasPrefix:", CFSTR("CD_M2M_")))
            {
              v79 = +[PFMirroredRelationship mirroredRelationshipWithDeletedRecordType:recordID:andManagedObjectModel:]((uint64_t)PFMirroredRelationship, (uint64_t)v64, (uint64_t)v68, (uint64_t)v244);
              objc_msgSend(v243, "addObject:", v79);
              v80 = -[PFMirroredManyToManyRelationship recordTypeToRecordID](v79);
              v269[0] = MEMORY[0x1E0C809B0];
              v269[1] = 3221225472;
              v269[2] = __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke_2;
              v269[3] = &unk_1E1EDD640;
              v269[4] = v247;
              v269[5] = v246;
              v269[6] = a1;
              v269[7] = v68;
              objc_msgSend(v80, "enumerateKeysAndObjectsUsingBlock:", v269);
              goto LABEL_106;
            }
            if (objc_msgSend(v64, "isEqualToString:", CFSTR("CDMR")))
            {
              v81 = (void *)+[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingPredicate:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("ckRecordID"), objc_msgSend(v68, "recordName"), v64, v68), (uint64_t)v234, v239, (uint64_t)&v287);
              if (!v81)
              {
                v111 = (void *)MEMORY[0x18D76B4E4]();
                v112 = __ckLoggingOverride;
                v113 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Import context failed to fetch mirrored relationships during import: %@"));
                _NSCoreDataLog(v112 != 0, v113, v114, v115, v116, v117, v118, v119, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
                objc_autoreleasePoolPop(v111);
                v223 = 0;
                v120 = v287;
                goto LABEL_117;
              }
              v82 = (void *)objc_msgSend(v81, "lastObject");
              v83 = v82;
              if (!v82)
              {
                v98 = (void *)MEMORY[0x18D76B4E4]();
                v99 = __ckLoggingOverride;
                v100 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping mirrored relationship with record id (not found locally): %@"));
                if (v99 >= 9)
                  v107 = 9;
                else
                  v107 = v99;
                goto LABEL_105;
              }
              objc_msgSend(v82, "setNeedsDelete:", MEMORY[0x1E0C9AAB0]);
              objc_msgSend(v83, "setIsUploaded:", MEMORY[0x1E0C9AAB0]);
              if (!objc_msgSend(v247, "containsObject:", objc_msgSend(v83, "cdEntityName")))
              {
                v98 = (void *)MEMORY[0x18D76B4E4]();
                v108 = __ckLoggingOverride;
                v100 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Skipping unknown deleted relationship recordID: %@ - %@"));
                if (v108 >= 3)
                  v107 = 3;
                else
                  v107 = v108;
LABEL_105:
                _NSCoreDataLog(v107, v100, v101, v102, v103, v104, v105, v106, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
                objc_autoreleasePoolPop(v98);
                goto LABEL_106;
              }
              v84 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v244, "entitiesByName"), "objectForKey:", objc_msgSend(v83, "cdEntityName")), "relationshipsByName"), "objectForKey:", objc_msgSend(v83, "relationshipName"));
              v85 = -[NSCKMirroredRelationship createRecordIDForRecord](v83);
              v86 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v83);
              v87 = -[PFMirroredManyToManyRelationshipV2 initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:]([PFMirroredManyToManyRelationshipV2 alloc], "initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:", v68, v85, v86, v84, objc_msgSend(v84, "inverseRelationship"), 1);
              objc_msgSend(v243, "addObject:", v87);
              if (v87)
                relationshipDescription = v87->super._relationshipDescription;
              else
                relationshipDescription = 0;
              v89 = (id)objc_msgSend(v246, "objectForKey:", -[NSEntityDescription name](-[NSPropertyDescription entity](relationshipDescription, "entity"), "name"));
              if (!v89)
              {
                v89 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                if (v87)
                  v90 = v87->super._relationshipDescription;
                else
                  v90 = 0;
                objc_msgSend(v246, "setObject:forKey:", v89, -[NSEntityDescription name](-[NSPropertyDescription entity](v90, "entity"), "name"));
              }
              if (v87)
                ckRecordID = v87->super._ckRecordID;
              else
                ckRecordID = 0;
              objc_msgSend(v89, "addObject:", ckRecordID);

              if (v87)
                inverseRelationshipDescription = v87->super._inverseRelationshipDescription;
              else
                inverseRelationshipDescription = 0;
              v93 = (id)objc_msgSend(v246, "objectForKey:", -[NSEntityDescription name](-[NSPropertyDescription entity](inverseRelationshipDescription, "entity"), "name"));
              if (!v93)
              {
                v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                if (v87)
                  v94 = v87->super._inverseRelationshipDescription;
                else
                  v94 = 0;
                objc_msgSend(v246, "setObject:forKey:", v93, -[NSEntityDescription name](-[NSPropertyDescription entity](v94, "entity"), "name"));
              }
              if (v87)
                relatedCKRecordID = v87->super._relatedCKRecordID;
              else
                relatedCKRecordID = 0;
              objc_msgSend(v93, "addObject:", relatedCKRecordID);

            }
            else
            {
              if (!objc_msgSend(v247, "containsObject:", v236))
              {
                if (objc_msgSend(v64, "isEqualToString:", getCloudKitCKRecordTypeShare[0]()))
                {
                  objc_msgSend(v232, "addObject:", v68);
                  goto LABEL_106;
                }
                v98 = (void *)MEMORY[0x18D76B4E4]();
                v109 = __ckLoggingOverride;
                v100 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Skipping unknown deleted record: %@ - %@"));
                if (v109 >= 3)
                  v107 = 3;
                else
                  v107 = v109;
                goto LABEL_105;
              }
              v96 = (id)objc_msgSend(v246, "objectForKey:", v64);
              if (!v96)
              {
                v96 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v246, "setObject:forKey:", v96, v64);
              }
              objc_msgSend(v96, "addObject:", v68);

              v97 = (id)objc_msgSend(v233, "objectForKey:", v64);
              if (!v97)
              {
                v97 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                objc_msgSend(v233, "setObject:forKey:", v97, v64);
              }
              objc_msgSend(v97, "addObject:", v68);

            }
LABEL_106:
            ++v67;
          }
          while (v65 != v67);
          v110 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v270, v297, 16);
          v65 = v110;
        }
        while (v110);
      }
LABEL_117:
      objc_autoreleasePoolPop(context);
      v63 = v230 + 1;
    }
    while (v230 + 1 != v226);
    v62 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v274, v298, 16);
  }
  while (v62);
  if ((v223 & 1) == 0)
  {
    v121 = v287;
    v122 = v287;
    if (v287)
    {
      v123 = a4;
      if (a4)
      {
        objb = 0;
        v231 = 0;
        goto LABEL_160;
      }
    }
    else
    {
      v197 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v197, v198, v199, v200, v201, v202, v203, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
      v204 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v289 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
        v290 = 1024;
        v291 = 448;
        _os_log_fault_impl(&dword_18A253000, v204, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    objb = 0;
    v231 = 0;
    goto LABEL_207;
  }
LABEL_124:
  v124 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, *(void **)(a1 + 8), MEMORY[0x1E0C9AA60], (uint64_t)v234, v239, &v287);
  v125 = v124;
  if (!v124)
  {
    v122 = v287;
    if (v287)
    {
      v123 = a4;
      if (a4)
      {
        objb = 0;
        v231 = 0;
        v223 = 0;
LABEL_160:
        *v123 = v122;
        goto LABEL_207;
      }
    }
    else
    {
      v189 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v189, v190, v191, v192, v193, v194, v195, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
      v196 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v289 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
        v290 = 1024;
        v291 = 444;
        _os_log_fault_impl(&dword_18A253000, v196, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    objb = 0;
    v231 = 0;
    v223 = 0;
    goto LABEL_207;
  }
  v267 = 0u;
  v268 = 0u;
  v265 = 0u;
  v266 = 0u;
  v126 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v265, v296, 16);
  if (v126)
  {
    v127 = *(_QWORD *)v266;
    do
    {
      for (k = 0; k != v126; ++k)
      {
        if (*(_QWORD *)v266 != v127)
          objc_enumerationMutation(v125);
        v129 = *(void **)(*((_QWORD *)&v265 + 1) + 8 * k);
        v130 = (void *)MEMORY[0x18D76B4E4]();
        v131 = -[NSCKMirroredRelationship createRecordIDForRecord](v129);
        v132 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v129);
        v133 = (id)objc_msgSend(v246, "objectForKey:", objc_msgSend(v129, "cdEntityName"));
        if (!v133)
        {
          v133 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v246, "setObject:forKey:", v133, objc_msgSend(v129, "cdEntityName"));
        }
        objc_msgSend(v133, "addObject:", v131);

        v134 = (id)objc_msgSend(v246, "objectForKey:", objc_msgSend(v129, "relatedEntityName"));
        if (!v134)
        {
          v134 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v246, "setObject:forKey:", v134, objc_msgSend(v129, "relatedEntityName"));
        }
        objc_msgSend(v134, "addObject:", v132);

        objc_autoreleasePoolPop(v130);
      }
      v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v265, v296, 16);
    }
    while (v126);
  }
  objb = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v263 = 0u;
  v264 = 0u;
  v261 = 0u;
  v262 = 0u;
  v231 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", objc_msgSend(v246, "allKeys"));
  v135 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v261, v295, 16);
  if (v135)
  {
    v136 = *(_QWORD *)v262;
    p_cache = &OBJC_METACLASS___PFCloudKitHistoryAnalyzerOptions.cache;
    v138 = (void *)MEMORY[0x1E0C9AA60];
LABEL_138:
    v139 = 0;
    v237 = v135;
    while (1)
    {
      if (*(_QWORD *)v262 != v136)
        objc_enumerationMutation(v231);
      v140 = (void *)objc_msgSend(v246, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v261 + 1) + 8 * v139));
      v141 = (void *)+[NSCKRecordMetadata createMapOfMetadataMatchingRecords:andRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)(p_cache + 448), v138, v140, v234, v239, &v287);
      if (v141)
      {
        v259 = 0u;
        v260 = 0u;
        v257 = 0u;
        v258 = 0u;
        v142 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v257, v294, 16);
        if (v142)
        {
          v143 = v136;
          v144 = p_cache;
          v145 = *(_QWORD *)v258;
          do
          {
            for (m = 0; m != v142; ++m)
            {
              if (*(_QWORD *)v258 != v145)
                objc_enumerationMutation(v140);
              v147 = *(_QWORD *)(*((_QWORD *)&v257 + 1) + 8 * m);
              v148 = (void *)objc_msgSend(v141, "objectForKey:", v147);
              if (v148)
              {
                v149 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v148);
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](a1, v149, objb, v147);

              }
            }
            v142 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v257, v294, 16);
          }
          while (v142);
          p_cache = v144;
          v136 = v143;
          v135 = v237;
          v138 = (void *)MEMORY[0x1E0C9AA60];
        }
      }
      else
      {
        v223 = 0;
        v150 = v287;
      }

      if ((v223 & 1) == 0)
        break;
      if (++v139 == v135)
      {
        v135 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v261, v295, 16);
        if (v135)
          goto LABEL_138;
        goto LABEL_162;
      }
    }
  }
  else if ((v223 & 1) != 0)
  {
LABEL_162:
    v151 = (id)+[NSCKImportOperation fetchUnfinishedImportOperationsInStore:withManagedObjectContext:error:]((uint64_t)NSCKImportOperation, (uint64_t)v234, v239, (uint64_t)&v287);
    *(_QWORD *)(a1 + 88) = v151;
    if (v151)
    {
      v255 = 0u;
      v256 = 0u;
      v253 = 0u;
      v254 = 0u;
      v222 = v151;
      v152 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v253, v293, 16);
      if (v152)
      {
        v225 = *(_QWORD *)v254;
        do
        {
          v153 = 0;
          v227 = (char *)v152;
          do
          {
            if (*(_QWORD *)v254 != v225)
              objc_enumerationMutation(v222);
            contexta = v153;
            v154 = *(void **)(*((_QWORD *)&v253 + 1) + 8 * (_QWORD)v153);
            v249 = 0u;
            v250 = 0u;
            v251 = 0u;
            v252 = 0u;
            v155 = (void *)objc_msgSend(v154, "pendingRelationships");
            v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v249, v292, 16);
            if (v156)
            {
              v235 = v155;
              v238 = *(_QWORD *)v250;
              do
              {
                for (n = 0; n != v156; ++n)
                {
                  if (*(_QWORD *)v250 != v238)
                    objc_enumerationMutation(v235);
                  v158 = *(void **)(*((_QWORD *)&v249 + 1) + 8 * n);
                  v159 = objc_msgSend((id)objc_msgSend(v244, "entitiesByName"), "objectForKey:", objc_msgSend(v158, "cdEntityName"));
                  v160 = objc_msgSend((id)objc_msgSend(v244, "entitiesByName"), "objectForKey:", objc_msgSend(v158, "relatedEntityName"));
                  if (v159)
                    v161 = v160 == 0;
                  else
                    v161 = 1;
                  if (v161)
                  {
                    v162 = (void *)MEMORY[0x18D76B4E4](v160);
                    v163 = __ckLoggingOverride;
                    v164 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Deleting pending relationship because it's entities are no longer in the model: %@"));
                    if (v163 >= 0x10)
                      v171 = 16;
                    else
                      v171 = v163;
                    _NSCoreDataLog(v171, v164, v165, v166, v167, v168, v169, v170, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
                    objc_autoreleasePoolPop(v162);
                    objc_msgSend(v239, "deleteObject:", v158);
                  }
                  else
                  {
                    v172 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, v159);
                    v173 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(v158, "recordZoneName"), objc_msgSend(v158, "recordZoneOwnerName"));
                    v174 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v158, "recordName"), v173);
                    v175 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(v158, "relatedRecordZoneName"), objc_msgSend(v158, "relatedRecordZoneOwnerName"));
                    v176 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v158, "relatedRecordName"), v175);
                    v177 = objc_msgSend(v173, "isEqual:", v175);
                    if ((v177 & 1) == 0)
                    {
                      v178 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Import is attempting to link objects across zones: %@");
                      _NSCoreDataLog(17, v178, v179, v180, v181, v182, v183, v184, (uint64_t)v158);
                      v185 = __pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v289 = (const char *)v158;
                        _os_log_fault_impl(&dword_18A253000, v185, OS_LOG_TYPE_FAULT, "CoreData: Import is attempting to link objects across zones: %@", buf, 0xCu);
                      }
                    }
                    -[PFCloudKitImportZoneContext addUnresolvedRecordID:forRecordType:toCache:]((uint64_t)v174, v172, *(void **)(a1 + 72));
                    v186 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, objc_msgSend((id)objc_msgSend(v244, "entitiesByName"), "objectForKey:", objc_msgSend(v158, "relatedEntityName")));
                    -[PFCloudKitImportZoneContext addUnresolvedRecordID:forRecordType:toCache:]((uint64_t)v176, v186, *(void **)(a1 + 72));
                    if ((objc_msgSend((id)objc_msgSend(v233, "objectForKey:", v172), "containsObject:", v174) & 1) != 0
                      || objc_msgSend((id)objc_msgSend(v233, "objectForKey:", v186), "containsObject:", v176))
                    {
                      objc_msgSend(v239, "deleteObject:", v158);
                    }

                  }
                }
                v156 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v249, v292, 16);
              }
              while (v156);
            }
            v153 = contexta + 1;
          }
          while (contexta + 1 != v227);
          v152 = objc_msgSend(v222, "countByEnumeratingWithState:objects:count:", &v253, v293, 16);
        }
        while (v152);
      }
      *(_QWORD *)(a1 + 64) = objb;
      *(_QWORD *)(a1 + 32) = objc_msgSend(v220, "copy");
      *(_QWORD *)(a1 + 48) = objc_msgSend(v243, "copy");
      *(_QWORD *)(a1 + 56) = objc_msgSend(v218, "copy");
      *(_QWORD *)(a1 + 40) = v219;
      *(_QWORD *)(a1 + 112) = objc_msgSend(v232, "copy");
      v187 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v188 = *(void **)(a1 + 16);
      v248[0] = MEMORY[0x1E0C809B0];
      v248[1] = 3221225472;
      v248[2] = __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke_46;
      v248[3] = &unk_1E1EDD668;
      v248[4] = a1;
      v248[5] = v187;
      objc_msgSend(v188, "enumerateKeysAndObjectsUsingBlock:", v248);
      *(_QWORD *)(a1 + 24) = objc_msgSend(v187, "copy");

      goto LABEL_207;
    }
    v205 = v287;
    v223 = 0;
  }
  if (v287)
  {
    if (a4)
      *a4 = v287;
  }
  else
  {
    v206 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v206, v207, v208, v209, v210, v211, v212, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
    v213 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v289 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
      v290 = 1024;
      v291 = 439;
      _os_log_fault_impl(&dword_18A253000, v213, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  v214 = v287;
LABEL_207:
  v215 = v223 & 1;

  return v215;
}

void __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2))
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", a2);
    if (!v6)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v16, a2);
      v6 = v16;
    }
    v17 = v6;
    objc_msgSend(v6, "addObjectsFromArray:", a3);

  }
  else
  {
    v7 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 3)
      v8 = 3;
    else
      v8 = __ckLoggingOverride;
    v9 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Skipping unknown updated relationship record: %@"));
    _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]_block_invoke");
    objc_autoreleasePoolPop(v7);
  }
}

void __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2))
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", a2);
    if (!v6)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v16, a2);
      v6 = v16;
    }
    v17 = v6;
    objc_msgSend(v6, "addObjectsFromArray:", a3);

  }
  else
  {
    v7 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 3)
      v8 = 3;
    else
      v8 = __ckLoggingOverride;
    v9 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Skipping unknown deleted relationship recordID: %@ - %@"));
    _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]_block_invoke_2");
    objc_autoreleasePoolPop(v7);
  }
}

- (uint64_t)addObjectID:(void *)a3 toCache:(uint64_t)a4 andRecordID:
{
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (result)
  {
    v7 = result;
    v8 = (void *)objc_msgSend(a2, "entity");
    v9 = objc_msgSend(v8, "name");
    do
    {
      -[PFCloudKitImportZoneContext addObjectID:toCache:forRecordWithType:andUniqueIdentifier:](v7, (uint64_t)a2, a3, v9, a4);
      v8 = (void *)objc_msgSend(v8, "superentity");
      result = objc_msgSend(v8, "name");
      v9 = result;
    }
    while (result);
  }
  return result;
}

- (void)addUnresolvedRecordID:(uint64_t)a1 forRecordType:(uint64_t)a2 toCache:(void *)a3
{
  id v6;
  id v7;
  id v8;

  v6 = (id)objc_msgSend(a3, "objectForKey:", a2);
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a3, "setObject:forKey:", v7, a2);
    v6 = v7;
  }
  v8 = v6;
  objc_msgSend(v6, "addObject:", a1);

}

uint64_t __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a2;
  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "hasPrefix:", CFSTR("CD_")))
    v4 = (void *)objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("CD_"), "length"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a3);
        v10 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", v4), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        if (v10)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)registerObject:(void *)a3 forInsertedRecord:(void *)a4 withMetadata:
{
  _PFCKInsertedMetadataLink *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  objc_super v18;

  if (a1)
  {
    -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](a1, (void *)objc_msgSend(a2, "objectID"), *(void **)(a1 + 64), objc_msgSend(a3, "recordID"));
    v7 = [_PFCKInsertedMetadataLink alloc];
    if (v7
      && (v18.receiver = v7,
          v18.super_class = (Class)_PFCKInsertedMetadataLink,
          (v17 = objc_msgSendSuper2(&v18, sel_init)) != 0))
    {
      v17[2] = a2;
      v17[1] = a4;
    }
    else
    {
      v17 = 0;
    }
    v8 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v9 = 9;
    else
      v9 = __ckLoggingOverride;
    v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Linking %@ to %@"));
    objc_msgSend(a2, "objectID");
    _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitImportZoneContext registerObject:forInsertedRecord:withMetadata:]");
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 80), "addObject:", v17);

  }
}

- (uint64_t)addMirroredRelationshipToLink:(uint64_t)result
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, void *);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  uint64_t v15;

  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 40), "addObject:", a2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = -[PFMirroredOneToManyRelationship recordTypesToRecordIDs](a2);
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke;
      v14 = &unk_1E1EDD690;
      v15 = v3;
      v5 = &v11;
    }
    else
    {
      objc_opt_class();
      result = objc_opt_isKindOfClass();
      if ((result & 1) == 0)
        return result;
      v4 = -[PFMirroredManyToManyRelationship recordTypeToRecordID](a2);
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke_2;
      v9 = &unk_1E1EDD690;
      v10 = v3;
      v5 = &v6;
    }
    return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  }
  return result;
}

uint64_t __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (!objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", a2), "objectForKey:", v10))
        {
          v11 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", a2);
          if (!v11)
          {
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKey:", v11, a2);
          }
          objc_msgSend(v11, "addObject:", v10);

        }
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (!objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", a2), "objectForKey:", v10))
        {
          v11 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", a2);
          if (!v11)
          {
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKey:", v11, a2);
          }
          objc_msgSend(v11, "addObject:", v10);

        }
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)populateUnresolvedIDsInStore:(void *)a3 withManagedObjectContext:(_QWORD *)a4 error:
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[9];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__PFCloudKitImportZoneContext_populateUnresolvedIDsInStore_withManagedObjectContext_error___block_invoke;
  v16[3] = &unk_1E1EDD6B8;
  v16[4] = a1;
  v16[5] = a2;
  v16[6] = a3;
  v16[7] = &v17;
  v16[8] = &v23;
  objc_msgSend(a3, "performBlockAndWait:", v16);
  if (!*((_BYTE *)v24 + 24))
  {
    v7 = (id)v18[5];
    if (v7)
    {
      if (a4)
        *a4 = v7;
    }
    else
    {
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
      v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
        v29 = 1024;
        v30 = 590;
        _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v18[5] = 0;
  v5 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v5;
}

void __91__PFCloudKitImportZoneContext_populateUnresolvedIDsInStore_withManagedObjectContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 9)
    v3 = 9;
  else
    v3 = __ckLoggingOverride;
  v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Populating unresolved relationships:\n%@"));
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitImportZoneContext populateUnresolvedIDsInStore:withManagedObjectContext:error:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allKeys"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v11;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v12)
  {
    v29 = *(_QWORD *)v35;
LABEL_6:
    v13 = 0;
    v28 = v12;
    while (1)
    {
      if (*(_QWORD *)v35 != v29)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v13);
      v15 = (void *)MEMORY[0x18D76B4E4]();
      v16 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", v14);
      v17 = (void *)+[NSCKRecordMetadata createMapOfMetadataMatchingRecords:andRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, MEMORY[0x1E0C9AA60], v16, *(void **)(a1 + 40), *(void **)(a1 + 48), (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      if (v17)
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v31 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
              v22 = (void *)objc_msgSend(v17, "objectForKey:", v21);
              v23 = v22;
              if (v22 && (objc_msgSend(v22, "isInserted") & 1) == 0)
              {
                v24 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v23);
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](*(_QWORD *)(a1 + 32), v24, *(void **)(*(_QWORD *)(a1 + 32) + 64), v21);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v18);
        }
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        v25 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      }

      v26 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      objc_autoreleasePoolPop(v15);
      if (!v26)
        break;
      if (++v13 == v28)
      {
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v12)
          goto LABEL_6;
        break;
      }
    }
  }

}

- (void)addObjectID:(void *)a3 toCache:(uint64_t)a4 forRecordWithType:(uint64_t)a5 andUniqueIdentifier:
{
  id v9;
  id v10;
  id v11;

  if (a1)
  {
    v9 = (id)objc_msgSend(a3, "objectForKey:", a4);
    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(a3, "setObject:forKey:", v10, a4);
      v9 = v10;
    }
    v11 = v9;
    objc_msgSend(v9, "setObject:forKey:", a2, a5);

  }
}

- (BOOL)linkInsertedObjectsAndMetadataInContext:(uint64_t *)a3 error:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v49 = 0;
    if (!objc_msgSend(a2, "obtainPermanentIDsForObjects:error:", objc_msgSend((id)objc_msgSend(a2, "insertedObjects"), "allObjects"), &v49))goto LABEL_31;
    v41 = a3;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = *(id *)(v5 + 80);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v46;
      v43 = *MEMORY[0x1E0CB28A8];
      v42 = *MEMORY[0x1E0CB2D68];
      v9 = 1;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v10);
          if (v11)
            v12 = *(void **)(v11 + 16);
          else
            v12 = 0;
          v13 = (char *)objc_msgSend(v12, "objectID");
          if (objc_msgSend(v13, "isTemporaryID"))
          {
            v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found temporary objectID for metadata link: %@\n%@\n%@\n%@");
            objc_msgSend(a2, "insertedObjects");
            v40 = v49;
            _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
            v21 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v30 = objc_msgSend(a2, "insertedObjects");
              *(_DWORD *)buf = 138413058;
              v53 = v13;
              v54 = 2112;
              v55 = v11;
              v56 = 2112;
              v57 = v30;
              v58 = 2112;
              v59 = v49;
              _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Found temporary objectID for metadata link: %@\n%@\n%@\n%@", buf, 0x2Au);
            }
            v22 = (void *)MEMORY[0x1E0CB35C8];
            v50 = v42;
            v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found temporary objectID for metadata link: %@\n%@\n%@"), v13, v11, objc_msgSend(a2, "insertedObjects"), v40);
            v9 = 0;
            v49 = objc_msgSend(v22, "errorWithDomain:code:userInfo:", v43, 134410, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
          }
          else
          {
            v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "_referenceData64"));
            if (v11)
              v24 = *(void **)(v11 + 8);
            else
              v24 = 0;
            objc_msgSend(v24, "setEntityPK:", v23);
            v25 = _sqlEntityForEntityDescription(objc_msgSend((id)objc_msgSend(v13, "persistentStore"), "model"), (_QWORD *)objc_msgSend(v13, "entity"));
            if (v25)
              v26 = *(unsigned int *)(v25 + 184);
            else
              v26 = 0;
            v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v26);
            if (v11)
            {
              objc_msgSend(*(id *)(v11 + 8), "setEntityId:", v27);
              v28 = *(void **)(v11 + 8);
            }
            else
            {
              objc_msgSend(0, "setEntityId:", v27);
              v28 = 0;
            }
            v29 = (void *)-[NSCKRecordMetadata createRecordID](v28);
            -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](v5, v13, *(void **)(v5 + 64), (uint64_t)v29);

          }
          ++v10;
        }
        while (v7 != v10);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
        v7 = v31;
      }
      while (v31);
    }
    else
    {
      v9 = 1;
    }

    *(_QWORD *)(v5 + 80) = 0;
    a3 = v41;
    if ((v9 & 1) != 0)
    {
      return 1;
    }
    else
    {
LABEL_31:
      if (v49)
      {
        if (a3)
        {
          result = 0;
          *a3 = v49;
          return result;
        }
      }
      else
      {
        v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v32, v33, v34, v35, v36, v37, v38, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
        v39 = __pflogFaultLog;
        result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        if (!result)
          return result;
        *(_DWORD *)buf = 136315394;
        v53 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
        v54 = 1024;
        LODWORD(v55) = 674;
        _os_log_fault_impl(&dword_18A253000, v39, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      return 0;
    }
  }
  return result;
}

@end
