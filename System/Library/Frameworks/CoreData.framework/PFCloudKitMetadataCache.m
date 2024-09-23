@implementation PFCloudKitMetadataCache

- (PFCloudKitMetadataCache)init
{
  PFCloudKitMetadataCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitMetadataCache;
  v2 = -[PFCloudKitMetadataCache init](&v4, sel_init);
  if (v2)
  {
    v2->_recordZoneIDToZoneMetadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_objectIDToRecordMetadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_recordIDToMirroredRelationshipOrRecordMetadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_zoneIDToMtmKeyToMirroredRelationship = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_objectIDToRelationshipNameToExistingMTMKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_objectIDToChangedPropertyKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_invalidatedMTMKeys = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_mutableZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_recordZoneIDToZoneMetadata = 0;
  self->_objectIDToRecordMetadata = 0;

  self->_recordIDToMirroredRelationshipOrRecordMetadata = 0;
  self->_zoneIDToMtmKeyToMirroredRelationship = 0;

  self->_objectIDToRelationshipNameToExistingMTMKeys = 0;
  self->_objectIDToChangedPropertyKeys = 0;

  self->_invalidatedMTMKeys = 0;
  self->_mutableZoneIDs = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitMetadataCache;
  -[PFCloudKitMetadataCache dealloc](&v3, sel_dealloc);
}

- (uint64_t)cacheMetadataForObjectsWithIDs:(uint64_t)a3 andRecordsWithIDs:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(uint64_t)a6 mirroringOptions:(_QWORD *)a7 error:
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSFetchRequest *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  int v89;
  id v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v106;
  uint64_t v107;
  uint64_t n;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSFetchRequest *v114;
  NSPersistentHistoryChangeRequest *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t ii;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t jj;
  id v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v152;
  id v153;
  void *v156;
  int v157;
  id obj;
  id obja;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  void *context;
  void *contexta;
  void *contextb;
  id v166;
  id v167;
  char *v168;
  id v169;
  void *v170;
  id v171;
  id v172;
  id v173;
  id v174;
  __int128 v176;
  __int128 v177;
  __int128 v178;
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
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  _QWORD v220[10];
  id v221;
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  void *v225;
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  void *v229;
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  uint8_t v234[128];
  uint8_t buf[4];
  const char *v236;
  __int16 v237;
  void *v238;
  __int16 v239;
  uint64_t v240;
  uint64_t v241;

  v241 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v221 = 0;
  v153 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v170 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a3);
  v156 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a3);
  v171 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v172 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v173 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v174 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(a2, "count"))
  {
    v9 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, a2, a4, a5, &v221);
    v10 = v9;
    if (v9)
    {
      v220[0] = MEMORY[0x1E0C809B0];
      v220[1] = 3221225472;
      v220[2] = __132__PFCloudKitMetadataCache_cacheMetadataForObjectsWithIDs_andRecordsWithIDs_inStore_withManagedObjectContext_mirroringOptions_error___block_invoke;
      v220[3] = &unk_1E1EE0B08;
      v220[4] = a1;
      v220[5] = v172;
      v220[6] = v173;
      v220[7] = v174;
      v220[8] = v156;
      v220[9] = v170;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v220);
      v157 = 1;
    }
    else
    {
      v11 = v221;
      v157 = 0;
    }

  }
  else
  {
    v157 = 1;
  }
  if (objc_msgSend(v156, "count"))
  {
    context = (void *)MEMORY[0x18D76B4E4]();
    v12 = +[NSCKRecordMetadata metadataForRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, (void *)objc_msgSend(v156, "allObjects"), a4, a5, &v221);
    v13 = v12;
    if (!v12)
    {
      v157 = 0;
      v25 = v221;
      goto LABEL_31;
    }
    v218 = 0u;
    v219 = 0u;
    v216 = 0u;
    v217 = 0u;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v216, v234, 16);
    if (!v14)
      goto LABEL_31;
    v166 = *(id *)v217;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(id *)v217 != v166)
          objc_enumerationMutation(v13);
        v16 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x18D76B4E4]();
        v18 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v16);
        objc_msgSend(a1[2], "setObject:forKey:", v16, v18);
        v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(a1[6], "setObject:forKey:", v19, v18);
        v20 = (id)objc_msgSend(v172, "objectForKey:", objc_msgSend(v16, "entityId"));
        if (!v20)
        {
          v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v172, "setObject:forKey:", v20, objc_msgSend(v16, "entityId"));
        }
        objc_msgSend(v20, "addObject:", objc_msgSend(v16, "entityPK"));

        v21 = (void *)objc_msgSend(v16, "lastExportedTransactionNumber");
        v22 = (void *)objc_msgSend(v173, "objectForKey:", objc_msgSend(v16, "entityId"));
        v23 = (void *)objc_msgSend(v174, "objectForKey:", v18);
        if (v21)
        {
          if (objc_msgSend(v22, "compare:", v21) != 1)
            objc_msgSend(v173, "setObject:forKey:", v21, objc_msgSend(v16, "entityId"));
          if (objc_msgSend(v23, "compare:", v21) != 1)
            goto LABEL_26;
        }
        else
        {
          if (!v22)
            objc_msgSend(v173, "setObject:forKey:", &unk_1E1F4B738, objc_msgSend(v16, "entityId"));
          if (!v23)
          {
            v21 = &unk_1E1F4B738;
LABEL_26:
            objc_msgSend(v174, "setObject:forKey:", v21, v18);
          }
        }
        v24 = (void *)-[NSCKRecordMetadata createRecordID](v16);
        objc_msgSend(v170, "addObject:", v24);
        objc_msgSend(a1[3], "setObject:forKey:", v16, v24);

        objc_autoreleasePoolPop(v17);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v216, v234, 16);
      if (!v14)
      {
LABEL_31:
        objc_autoreleasePoolPop(context);
        break;
      }
    }
  }
  if (!v157)
    goto LABEL_102;
  v26 = (void *)objc_msgSend(v170, "allObjects");
  v27 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, MEMORY[0x1E0C9AA60], v26, (uint64_t)a4, a5, &v221);
  if (!v27)
  {
    LOBYTE(v157) = 0;
    v92 = v221;
    goto LABEL_102;
  }
  v167 = (id)objc_msgSend((id)objc_msgSend(a5, "persistentStoreCoordinator"), "managedObjectModel");
  v214 = 0u;
  v215 = 0u;
  v212 = 0u;
  v213 = 0u;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v212, v233, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v213;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v213 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * j);
        v32 = (void *)MEMORY[0x18D76B4E4]();
        v33 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v167, "entitiesByName"), "objectForKey:", objc_msgSend(v31, "cdEntityName")), "relationshipsByName"), "objectForKey:", objc_msgSend(v31, "relationshipName"));
        if (v33)
        {
          v34 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, objc_msgSend(v31, "recordName"), objc_msgSend(v31, "relatedRecordName"), (uint64_t)v33, objc_msgSend(v33, "inverseRelationship"));
          v35 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)objc_msgSend(v31, "recordZone"));
          if (objc_msgSend((id)objc_msgSend(a1[4], "objectForKey:", v35), "objectForKey:", v34))
          {
            v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Already have a mirrored relationship registered for this key: %@\n%@\n%@");
            objc_msgSend((id)objc_msgSend(a1[4], "objectForKey:", v35), "objectForKey:", v34);
            _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, v34);
            v43 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v48 = objc_msgSend((id)objc_msgSend(a1[4], "objectForKey:", v35), "objectForKey:", v34);
              *(_DWORD *)buf = 138412802;
              v236 = (const char *)v34;
              v237 = 2112;
              v238 = v31;
              v239 = 2112;
              v240 = v48;
              _os_log_fault_impl(&dword_18A253000, v43, OS_LOG_TYPE_FAULT, "CoreData: Already have a mirrored relationship registered for this key: %@\n%@\n%@", buf, 0x20u);
            }
          }
          v44 = (id)objc_msgSend(a1[4], "objectForKey:", v35);
          if (!v44)
          {
            v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(a1[4], "setObject:forKey:", v44, v35);
          }
          objc_msgSend(v44, "setObject:forKey:", v31, v34);

          v45 = -[NSCKMirroredRelationship createRecordID](v31);
          objc_msgSend(a1[3], "setObject:forKey:", v31, v45);

          v46 = -[NSCKMirroredRelationship createRecordIDForRecord](v31);
          objc_msgSend(v171, "addObject:", v46);

          v47 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v31);
          objc_msgSend(v171, "addObject:", v47);

        }
        objc_autoreleasePoolPop(v32);
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v212, v233, 16);
    }
    while (v28);
  }
  objc_msgSend(v171, "minusSet:", v170);
  v49 = +[NSCKRecordMetadata metadataForRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, (void *)objc_msgSend(v171, "allObjects"), a4, a5, &v221);
  v50 = v49;
  if (!v49)
  {
    LOBYTE(v157) = 0;
    v93 = v221;
    goto LABEL_102;
  }
  v210 = 0u;
  v211 = 0u;
  v208 = 0u;
  v209 = 0u;
  v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v208, v232, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v209;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v209 != v52)
          objc_enumerationMutation(v50);
        v54 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * k);
        v55 = (void *)MEMORY[0x18D76B4E4]();
        v56 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v54);
        objc_msgSend(a1[2], "setObject:forKey:", v54, v56);

        v57 = (void *)-[NSCKRecordMetadata createRecordID](v54);
        objc_msgSend(a1[3], "setObject:forKey:", v54, v57);

        objc_autoreleasePoolPop(v55);
      }
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v208, v232, 16);
    }
    while (v51);
  }
  v58 = (void *)objc_msgSend((id)objc_msgSend(a4, "_persistentStoreCoordinator"), "managedObjectModel");
  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  obj = a1[4];
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v231, 16);
  if (v59)
  {
    v160 = *(_QWORD *)v205;
    do
    {
      v60 = 0;
      v162 = (char *)v59;
      do
      {
        if (*(_QWORD *)v205 != v160)
          objc_enumerationMutation(obj);
        v61 = *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * (_QWORD)v60);
        v62 = MEMORY[0x18D76B4E4]();
        v63 = (void *)objc_msgSend(a1[4], "objectForKey:", v61);
        contexta = (void *)v62;
        v168 = v60;
        v202 = 0u;
        v203 = 0u;
        v200 = 0u;
        v201 = 0u;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v200, v230, 16);
        if (v64)
        {
          v65 = *(_QWORD *)v201;
          do
          {
            for (m = 0; m != v64; ++m)
            {
              if (*(_QWORD *)v201 != v65)
                objc_enumerationMutation(v63);
              v67 = *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * m);
              v68 = (void *)objc_msgSend(v63, "objectForKey:", v67);
              v69 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v58, "entitiesByName"), "objectForKey:", objc_msgSend(v68, "cdEntityName")), "relationshipsByName"), "objectForKey:", objc_msgSend(v68, "relationshipName"));
              v70 = -[NSCKMirroredRelationship createRecordIDForRecord](v68);
              v71 = (void *)-[PFCloudKitMetadataCache recordMetadataForRecordID:]((uint64_t)a1, (uint64_t)v70);
              if (v71)
              {
                v72 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v71);
                -[PFCloudKitMetadataCache _addMirroredRelationshipMTMKey:forObjectWithID:andRelationshipName:]((uint64_t)a1, v67, (uint64_t)v72, objc_msgSend(v69, "name"));

              }
              else
              {
                objc_msgSend(a1[7], "addObject:", v67);
              }

              v73 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v68);
              v74 = (void *)-[PFCloudKitMetadataCache recordMetadataForRecordID:]((uint64_t)a1, (uint64_t)v73);
              if (v74)
              {
                v75 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v74);
                -[PFCloudKitMetadataCache _addMirroredRelationshipMTMKey:forObjectWithID:andRelationshipName:]((uint64_t)a1, v67, (uint64_t)v75, objc_msgSend((id)objc_msgSend(v69, "inverseRelationship"), "name"));

              }
              else
              {
                objc_msgSend(a1[7], "addObject:", v67);
              }

            }
            v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v200, v230, 16);
          }
          while (v64);
        }
        objc_autoreleasePoolPop(contexta);
        v60 = v168 + 1;
      }
      while (v168 + 1 != v162);
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v231, 16);
    }
    while (v59);
  }
  v76 = (void *)MEMORY[0x18D76B4E4]();
  v77 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
  v229 = a4;
  -[NSFetchRequest setAffectedStores:](v77, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v229, 1));
  v78 = (void *)objc_msgSend(a5, "executeFetchRequest:error:", v77, &v221);
  v79 = v78;
  if (!v78)
  {
    LOBYTE(v157) = 0;
    v94 = v221;
    goto LABEL_101;
  }
  v198 = 0u;
  v199 = 0u;
  v196 = 0u;
  v197 = 0u;
  v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v196, v228, 16);
  if (!v80)
    goto LABEL_101;
  v81 = *(_QWORD *)v197;
  do
  {
    v82 = 0;
    do
    {
      if (*(_QWORD *)v197 != v81)
        objc_enumerationMutation(v79);
      v83 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * v82);
      v84 = (void *)MEMORY[0x18D76B4E4]();
      v85 = -[NSCKRecordZoneMetadata createRecordZoneID](v83);
      objc_msgSend(a1[1], "setObject:forKey:", v83, v85);
      if (!objc_msgSend(v83, "encodedShareData"))
      {
        objc_msgSend(a1[8], "addObject:", v85);
LABEL_90:

        v89 = 1;
        goto LABEL_92;
      }
      if (a6)
        v86 = *(_QWORD *)(a6 + 136);
      else
        v86 = 0;
      v87 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](v86, (void *)objc_msgSend(v83, "encodedShareData"), (char *)v85, &v221);
      v88 = v87;
      if (v87)
      {
        if (objc_msgSend((id)objc_msgSend(v87, "currentUserParticipant"), "permission") != 2)
          objc_msgSend(a1[8], "addObject:", v85);

        v85 = 0;
        goto LABEL_90;
      }
      v90 = v221;
      LOBYTE(v157) = 0;

      v89 = 0;
LABEL_92:
      objc_autoreleasePoolPop(v84);
      if (!v89)
        goto LABEL_101;
      ++v82;
    }
    while (v80 != v82);
    v91 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v196, v228, 16);
    v80 = v91;
  }
  while (v91);
LABEL_101:
  objc_autoreleasePoolPop(v76);
  if ((v157 & 1) != 0)
  {
    v169 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v194 = 0u;
    v195 = 0u;
    v192 = 0u;
    v193 = 0u;
    v106 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v192, v227, 16);
    if (v106)
    {
      v107 = *(_QWORD *)v193;
      do
      {
        for (n = 0; n != v106; ++n)
        {
          if (*(_QWORD *)v193 != v107)
            objc_enumerationMutation(v172);
          v109 = *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * n);
          v110 = (void *)MEMORY[0x18D76B4E4]();
          v111 = objc_msgSend(v173, "objectForKey:", v109);
          objc_msgSend(v169, "addObject:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("TRANSACTIONID > %@ AND ENTITY = %@ AND ENTITYPK IN %@"), v111, v109, objc_msgSend(v172, "objectForKey:", v109)));
          objc_autoreleasePoolPop(v110);
        }
        v106 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v192, v227, 16);
      }
      while (v106);
    }
    v190 = 0u;
    v191 = 0u;
    v188 = 0u;
    v189 = 0u;
    v112 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v188, v226, 16);
    if (v112)
    {
      v145 = *(_QWORD *)v189;
LABEL_120:
      v148 = 0;
      v144 = v112;
      while (1)
      {
        if (*(_QWORD *)v189 != v145)
          objc_enumerationMutation(v169);
        v113 = *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * v148);
        v146 = (void *)MEMORY[0x18D76B4E4]();
        v114 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", -[NSEntityDescription name](+[NSPersistentHistoryChange entityDescription](NSPersistentHistoryChange, "entityDescription"), "name"));
        -[NSFetchRequest setPredicate:](v114, "setPredicate:", v113);
        v115 = +[NSPersistentHistoryChangeRequest fetchHistoryWithFetchRequest:](NSPersistentHistoryChangeRequest, "fetchHistoryWithFetchRequest:", v114);
        -[NSPersistentHistoryChangeRequest setResultType:](v115, "setResultType:", 5);
        -[NSPersistentHistoryChangeRequest setUseQueryGenerationToken:](v115, "setUseQueryGenerationToken:", 1);
        v225 = a4;
        -[NSPersistentStoreRequest setAffectedStores:](v115, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v225, 1));
        v116 = (void *)objc_msgSend(a5, "executeRequest:error:", v115, &v221);
        v117 = v116;
        if (v116)
        {
          v118 = (void *)objc_msgSend(v116, "result");
          v186 = 0u;
          v187 = 0u;
          v184 = 0u;
          v185 = 0u;
          v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v184, v224, 16);
          if (v119)
          {
            v147 = v118;
            v143 = v117;
            v152 = *(_QWORD *)v185;
            do
            {
              v161 = 0;
              v149 = v119;
              do
              {
                if (*(_QWORD *)v185 != v152)
                  objc_enumerationMutation(v147);
                v120 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * v161);
                obja = (id)MEMORY[0x18D76B4E4]();
                if (!+[PFCloudKitHistoryAnalyzer isPrivateTransaction:](PFCloudKitHistoryAnalyzer, "isPrivateTransaction:", v120))
                {
                  v182 = 0u;
                  v183 = 0u;
                  v180 = 0u;
                  v181 = 0u;
                  v121 = (void *)objc_msgSend(v120, "changes");
                  v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v180, v223, 16);
                  if (v122)
                  {
                    v123 = *(_QWORD *)v181;
                    contextb = v121;
                    do
                    {
                      for (ii = 0; ii != v122; ++ii)
                      {
                        if (*(_QWORD *)v181 != v123)
                          objc_enumerationMutation(contextb);
                        v125 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * ii);
                        v126 = (void *)MEMORY[0x18D76B4E4]();
                        v127 = (void *)objc_msgSend(v174, "objectForKey:", objc_msgSend(v125, "changedObjectID"));
                        if (!v127)
                        {
                          v128 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Didn't get a minimum transaction number for change: %@");
                          _NSCoreDataLog(17, v128, v129, v130, v131, v132, v133, v134, (uint64_t)v125);
                          v135 = __pflogFaultLog;
                          v127 = &unk_1E1F4B738;
                          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v236 = (const char *)v125;
                            _os_log_fault_impl(&dword_18A253000, v135, OS_LOG_TYPE_FAULT, "CoreData: Didn't get a minimum transaction number for change: %@", buf, 0xCu);
                          }
                        }
                        v136 = objc_msgSend(v120, "transactionNumber");
                        if (v136 >= objc_msgSend(v127, "integerValue"))
                        {
                          v137 = (void *)objc_msgSend(a1[6], "objectForKey:", objc_msgSend(v125, "changedObjectID"));
                          if (v137)
                          {
                            v178 = 0u;
                            v179 = 0u;
                            v176 = 0u;
                            v177 = 0u;
                            v138 = (void *)objc_msgSend(v125, "updatedProperties");
                            v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v176, v222, 16);
                            if (v139)
                            {
                              v140 = *(_QWORD *)v177;
                              do
                              {
                                for (jj = 0; jj != v139; ++jj)
                                {
                                  if (*(_QWORD *)v177 != v140)
                                    objc_enumerationMutation(v138);
                                  objc_msgSend(v137, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v176 + 1) + 8 * jj), "name"));
                                }
                                v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v176, v222, 16);
                              }
                              while (v139);
                            }
                          }
                        }
                        objc_autoreleasePoolPop(v126);
                      }
                      v122 = objc_msgSend(contextb, "countByEnumeratingWithState:objects:count:", &v180, v223, 16);
                    }
                    while (v122);
                  }
                }
                objc_autoreleasePoolPop(obja);
                ++v161;
              }
              while (v161 != v149);
              v119 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v184, v224, 16);
            }
            while (v119);
            v117 = v143;
          }
        }
        else
        {
          LOBYTE(v157) = 0;
          v142 = v221;
        }
        objc_autoreleasePoolPop(v146);
        if (!v117)
          break;
        if (++v148 == v144)
        {
          v112 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v188, v226, 16);
          if (v112)
            goto LABEL_120;
          break;
        }
      }
    }
  }
  else
  {
LABEL_102:
    v169 = 0;
  }
  v95 = v157 & 1;
  objc_msgSend(v153, "drain");

  if ((v157 & 1) == 0)
  {
    v96 = v221;
    if (v96)
    {
      if (a7)
        *a7 = v96;
    }
    else
    {
      v97 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v97, v98, v99, v100, v101, v102, v103, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataCache.m");
      v104 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v236 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataCache.m";
        v237 = 1024;
        LODWORD(v238) = 419;
        _os_log_fault_impl(&dword_18A253000, v104, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v95;
}

void __132__PFCloudKitMetadataCache_cacheMetadataForObjectsWithIDs_andRecordsWithIDs_inStore_withManagedObjectContext_mirroringOptions_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", a3, a2);
  v12 = (id)-[NSCKRecordMetadata createRecordID](a3);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v6, a2);

  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", objc_msgSend(a3, "entityId"));
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, objc_msgSend(a3, "entityId"));
  }
  objc_msgSend(v7, "addObject:", objc_msgSend(a3, "entityPK"));

  v8 = (void *)objc_msgSend(a3, "lastExportedTransactionNumber");
  v9 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", objc_msgSend(a3, "entityId"));
  v10 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", a2);
  v11 = (void *)v10;
  if (!v8)
  {
    if (v9)
    {
      if (v10)
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", &unk_1E1F4B738, objc_msgSend(a3, "entityId"));
      if (v11)
        goto LABEL_14;
    }
    v8 = &unk_1E1F4B738;
LABEL_13:
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v8, a2);
    goto LABEL_14;
  }
  if (objc_msgSend(v9, "compare:", v8) != 1)
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, objc_msgSend(a3, "entityId"));
  if (objc_msgSend(v11, "compare:", v8) != 1)
    goto LABEL_13;
LABEL_14:
  objc_msgSend(*(id *)(a1 + 64), "removeObject:", v12);
  objc_msgSend(*(id *)(a1 + 72), "addObject:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", a3, v12);

}

- (uint64_t)recordMetadataForRecordID:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = objc_msgSend(*(id *)(a1 + 24), "objectForKey:", a2);
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Expected to get an instance of NSCKRecordMetadata for this recordID: %@ but got: %@");
      _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, a2);
      v11 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = a2;
        v15 = 2112;
        v16 = v3;
        _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: Expected to get an instance of NSCKRecordMetadata for this recordID: %@ but got: %@", buf, 0x16u);
      }
    }
  }
  return v3;
}

- (void)_addMirroredRelationshipMTMKey:(uint64_t)a3 forObjectWithID:(uint64_t)a4 andRelationshipName:
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:"), "objectForKey:", a4);
  if (!v8)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", a3);
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, a3);
    }
    objc_msgSend(v9, "setObject:forKey:", v10, a4);

    v8 = v10;
  }
  v11 = v8;
  objc_msgSend(v8, "addObject:", a2);

}

- (void)registerRecordMetadata:(void *)a3 forObject:
{
  id v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", a2, objc_msgSend(a3, "objectID"));
    v5 = (id)-[NSCKRecordMetadata createRecordID](a2);
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", a2, v5);

  }
}

- (void)cacheZoneMetadata:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = -[NSCKRecordZoneMetadata createRecordZoneID](a2);
    if (objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v4))
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempting to cache zone metadata but already have one: %@\n%@");
      _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, (uint64_t)a2);
      v12 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        v13 = *(_QWORD *)(a1 + 8);
        *(_DWORD *)buf = 138412546;
        v15 = a2;
        v16 = 2112;
        v17 = v13;
        _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: Attempting to cache zone metadata but already have one: %@\n%@", buf, 0x16u);
      }
    }
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", a2, v4);

  }
}

@end
