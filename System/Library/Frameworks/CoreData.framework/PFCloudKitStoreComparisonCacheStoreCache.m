@implementation PFCloudKitStoreComparisonCacheStoreCache

- (uint64_t)populateForStore:(void *)a3 inContext:(_QWORD *)a4 error:
{
  uint64_t v5;
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSFetchRequest *v19;
  void *v20;
  void *v21;
  uint64_t i;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  void *v49;
  void *v50;
  NSFetchRequest *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *m;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  void *v107;
  void *v108;
  id v110;
  uint64_t v111;
  uint64_t v112;
  void *v114;
  char v115;
  char *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *obj;
  uint64_t obja;
  id v123;
  id v124;
  id v125;
  uint64_t v126;
  void *context;
  void *contexta;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  id v150;
  uint8_t buf[4];
  const char *v152;
  __int16 v153;
  int v154;
  _BYTE v155[128];
  _BYTE v156[128];
  const __CFString *v157;
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = a1;
  v150 = 0;
  if (*(_BYTE *)(a1 + 120))
  {
    v6 = (void *)MEMORY[0x18D76B4E4]();
    v7 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"), (uint64_t)a2, a3, (uint64_t)&v150);
    if (v7)
    {
      *(_QWORD *)(v5 + 128) = (id)objc_msgSend(v7, "stringValue");
    }
    else
    {
      v45 = v150;
      if (v150)
        goto LABEL_36;
    }
    v8 = (char *)objc_msgSend(a3, "executeFetchRequest:error:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKDatabaseMetadata entityPath](NSCKDatabaseMetadata, "entityPath")), &v150);
    if (v8)
    {
      v9 = v8;
      if ((unint64_t)objc_msgSend(v8, "count") >= 2)
      {
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Metadata corruption found, store appears to have been used with multiple CloudKit databases: %@");
        _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
        v17 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v152 = v9;
          _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Metadata corruption found, store appears to have been used with multiple CloudKit databases: %@", buf, 0xCu);
        }
      }
      v18 = (void *)objc_msgSend(v9, "lastObject");
      if (v18)
        *(_QWORD *)(v5 + 136) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(v18, "databaseScope"));
      objc_autoreleasePoolPop(v6);
      v6 = (void *)MEMORY[0x18D76B4E4]();
      v19 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
      -[NSFetchRequest setFetchBatchSize:](v19, "setFetchBatchSize:", 50);
      v20 = (void *)objc_msgSend(a3, "executeFetchRequest:error:", v19, &v150);
      if (v20)
      {
        v21 = v20;
        v118 = v6;
        v107 = a2;
        v148 = 0u;
        v149 = 0u;
        v146 = 0u;
        v147 = 0u;
        v126 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v146, v160, 16);
        if (v126)
        {
          v123 = *(id *)v147;
          obj = v21;
          do
          {
            for (i = 0; i != v126; ++i)
            {
              if (*(id *)v147 != v123)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
              context = (void *)MEMORY[0x18D76B4E4]();
              v24 = (id)objc_msgSend((id)objc_msgSend(v23, "objectID"), "persistentStore");
              v25 = objc_msgSend(v24, "identifier");
              v26 = (void *)objc_msgSend(v24, "_persistentStoreCoordinator");
              v27 = objc_msgSend(v23, "ckRecordName");
              v28 = objc_msgSend((id)objc_msgSend(v23, "recordZone"), "ckRecordZoneName");
              v29 = (void *)objc_msgSend((id)objc_msgSend(v23, "recordZone"), "ckOwnerName");
              objc_msgSend((id)objc_msgSend(v23, "objectID"), "persistentStore");
              v30 = (void *)-[PFCloudKitStoreComparisonCacheStoreCache createRecordIDForRecordName:inZoneWithName:ownerName:inStore:](a1, v27, v28, v29);
              v31 = (void *)objc_msgSend((id)objc_msgSend(v24, "model"), "entityForID:", objc_msgSend((id)objc_msgSend(v23, "entityId"), "unsignedLongValue"));
              v32 = objc_msgSend(v26, "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-coredata://%@/%@/p%@"), v25, objc_msgSend((id)objc_msgSend(v31, "entityDescription"), "name"), objc_msgSend(v23, "entityPK"))));
              objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v23, v32);
              objc_msgSend(*(id *)(a1 + 88), "setObject:forKey:", v30, v32);
              objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v23, v30);
              v33 = (id)objc_msgSend(*(id *)(a1 + 112), "objectForKey:", objc_msgSend(v30, "zoneID"));
              if (!v33)
              {
                v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                objc_msgSend(*(id *)(a1 + 112), "setObject:forKey:", v33, objc_msgSend(v30, "zoneID"));
              }
              objc_msgSend(v33, "addObject:", v30);

              objc_msgSend(*(id *)(a1 + 72), "addObject:", v30);
              objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", v32, v30);

              objc_autoreleasePoolPop(context);
            }
            v126 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v160, 16);
          }
          while (v126);
        }
        objc_autoreleasePoolPop(v118);
        v6 = (void *)MEMORY[0x18D76B4E4]();
        v34 = (void *)objc_msgSend(a3, "executeFetchRequest:error:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath")), &v150);
        if (v34)
        {
          v35 = v34;
          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v143;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v143 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * j);
                v41 = (id)objc_msgSend((id)objc_msgSend(v40, "objectID"), "persistentStore");
                v42 = (void *)-[PFCloudKitStoreComparisonCacheStoreCache createRecordZoneIDForZoneName:ownerName:inStore:](a1, objc_msgSend(v40, "ckRecordZoneName"), (void *)objc_msgSend(v40, "ckOwnerName"));
                objc_msgSend(*(id *)(a1 + 96), "addObject:", v42);
                if (objc_msgSend(v40, "encodedShareData"))
                  objc_msgSend(*(id *)(a1 + 104), "addObject:", v42);

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
            }
            while (v37);
          }
          objc_autoreleasePoolPop(v6);
          v5 = a1;
          a2 = v107;
          goto LABEL_32;
        }
      }
    }
    v45 = v150;
LABEL_36:
    v46 = v45;
    objc_autoreleasePoolPop(v6);
    goto LABEL_37;
  }
LABEL_32:
  v43 = (void *)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
  if (objc_msgSend((id)objc_msgSend(a2, "configurationName"), "length"))
    v44 = (void *)objc_msgSend(v43, "entitiesForConfiguration:", objc_msgSend(a2, "configurationName"));
  else
    v44 = (void *)objc_msgSend(v43, "entities");
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v110 = v44;
  v112 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
  if (v112)
  {
    v119 = v43;
    v108 = a2;
    v111 = *(_QWORD *)v139;
    while (2)
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v139 != v111)
          objc_enumerationMutation(v110);
        v49 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)v48);
        v50 = (void *)MEMORY[0x18D76B4E4]();
        v51 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", objc_msgSend(v49, "name"));
        v52 = objc_msgSend((id)objc_msgSend(v49, "propertiesByName"), "objectForKey:", CFSTR("ckRecordID"));
        if (v52)
        {
          v157 = CFSTR("ckRecordID");
          -[NSFetchRequest setPropertiesToFetch:](v51, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v157, 1));
          if (objc_msgSend((id)objc_msgSend(v49, "propertiesByName"), "objectForKey:", CFSTR("ckRecordSystemFields")))
            -[NSFetchRequest setPropertiesToFetch:](v51, "setPropertiesToFetch:", -[NSArray arrayByAddingObject:](-[NSFetchRequest propertiesToFetch](v51, "propertiesToFetch"), "arrayByAddingObject:", CFSTR("ckRecordSystemFields")));
        }
        v53 = (void *)objc_msgSend(a3, "executeFetchRequest:error:", v51, &v150);
        if (!v53)
        {
          v74 = v150;
          objc_autoreleasePoolPop(v50);
          v115 = 0;
          goto LABEL_68;
        }
        v54 = v53;
        v114 = v50;
        v116 = v48;
        v136 = 0u;
        v137 = 0u;
        v134 = 0u;
        v135 = 0u;
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v134, v156, 16);
        if (v55)
        {
          v56 = v55;
          v57 = *(_QWORD *)v135;
          v124 = v54;
          do
          {
            for (k = 0; k != v56; ++k)
            {
              if (*(_QWORD *)v135 != v57)
                objc_enumerationMutation(v124);
              v59 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * k);
              v60 = (void *)MEMORY[0x18D76B4E4]();
              v61 = (void *)objc_msgSend(v59, "objectID");
              v62 = v61;
              if (v52)
              {
                v63 = objc_msgSend(v59, "valueForKey:", CFSTR("ckRecordID"));
                if (!v63)
                {
                  v64 = (void *)objc_msgSend(v62, "URIRepresentation");
                  v5 = a1;
                  v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), objc_msgSend((id)objc_msgSend(v64, "URLByDeletingLastPathComponent"), "lastPathComponent"), objc_msgSend(v64, "lastPathComponent"));
                }
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "entity"), "propertiesByName"), "objectForKey:", CFSTR("ckRecordSystemFields")))
                {
                  if (objc_msgSend(v59, "valueForKey:", CFSTR("ckRecordSystemFields")))
                  {
                    v65 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "System fields shouldn't be set anymore: %@");
                    _NSCoreDataLog(17, v65, v66, v67, v68, v69, v70, v71, (uint64_t)v59);
                    v72 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v152 = (const char *)v59;
                      _os_log_fault_impl(&dword_18A253000, v72, OS_LOG_TYPE_FAULT, "CoreData: System fields shouldn't be set anymore: %@", buf, 0xCu);
                    }
                  }
                }
              }
              else
              {
                v73 = (void *)objc_msgSend(v61, "URIRepresentation");
                v5 = a1;
                v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), objc_msgSend((id)objc_msgSend(v73, "URLByDeletingLastPathComponent"), "lastPathComponent"), objc_msgSend(v73, "lastPathComponent"));
              }
              objc_msgSend(*(id *)(v5 + 16), "setObject:forKey:", v62, v63);
              objc_msgSend(*(id *)(v5 + 8), "addObject:", v63);
              objc_autoreleasePoolPop(v60);
            }
            v56 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v134, v156, 16);
          }
          while (v56);
        }
        objc_autoreleasePoolPop(v114);
        v48 = v116 + 1;
      }
      while (v116 + 1 != (char *)v112);
      v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
      if (v112)
        continue;
      break;
    }
    v115 = 1;
LABEL_68:
    a2 = v108;
    v43 = v119;
  }
  else
  {
    v115 = 1;
  }
  if (*(_BYTE *)(v5 + 120))
  {
    v75 = (void *)+[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingPredicate:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, 0, (uint64_t)a2, a3, (uint64_t)&v150);
    if (v75)
    {
      v76 = v75;
      v132 = 0u;
      v133 = 0u;
      v130 = 0u;
      v131 = 0u;
      v125 = (id)objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v130, v155, 16);
      if (v125)
      {
        v120 = v43;
        obja = *(_QWORD *)v131;
        v117 = v76;
        do
        {
          for (m = 0; m != v125; m = (char *)m + 1)
          {
            if (*(_QWORD *)v131 != obja)
              objc_enumerationMutation(v117);
            v78 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)m);
            v79 = (void *)MEMORY[0x18D76B4E4]();
            v80 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v43, "entitiesByName"), "objectForKey:", objc_msgSend(v78, "cdEntityName")), "relationshipsByName"), "objectForKey:", objc_msgSend(v78, "relationshipName"));
            if (v80)
            {
              v81 = (void *)v80;
              contexta = v79;
              v82 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, objc_msgSend(v78, "recordName"), objc_msgSend(v78, "relatedRecordName"), (uint64_t)v81, objc_msgSend(v81, "inverseRelationship"));
              objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v78, v82);
              objc_msgSend(*(id *)(a1 + 32), "addObject:", v82);
              v83 = objc_msgSend(v78, "recordName");
              v84 = objc_msgSend((id)objc_msgSend(v78, "recordZone"), "ckRecordZoneName");
              v85 = (void *)objc_msgSend((id)objc_msgSend(v78, "recordZone"), "ckOwnerName");
              objc_msgSend((id)objc_msgSend(v78, "objectID"), "persistentStore");
              v86 = (void *)-[PFCloudKitStoreComparisonCacheStoreCache createRecordIDForRecordName:inZoneWithName:ownerName:inStore:](a1, v83, v84, v85);
              v87 = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v86);
              if (!v87)
              {
                v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v87, v86);
              }
              v88 = (id)objc_msgSend(v87, "objectForKey:", objc_msgSend(v81, "name"));
              if (!v88)
              {
                v88 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                objc_msgSend(v87, "setObject:forKey:", v88, objc_msgSend(v81, "name"));
              }
              v89 = objc_msgSend(v78, "relatedRecordName");
              v90 = objc_msgSend((id)objc_msgSend(v78, "recordZone"), "ckRecordZoneName");
              v91 = (void *)objc_msgSend((id)objc_msgSend(v78, "recordZone"), "ckOwnerName");
              objc_msgSend((id)objc_msgSend(v78, "objectID"), "persistentStore");
              v92 = (void *)-[PFCloudKitStoreComparisonCacheStoreCache createRecordIDForRecordName:inZoneWithName:ownerName:inStore:](a1, v89, v90, v91);
              objc_msgSend(v88, "addObject:", v92);

              v93 = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v92);
              if (!v93)
              {
                v93 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v93, v92);
              }
              v94 = (id)objc_msgSend(v93, "objectForKey:", objc_msgSend((id)objc_msgSend(v81, "inverseRelationship"), "name"));
              v43 = v120;
              if (!v94)
              {
                v94 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                objc_msgSend(v93, "setObject:forKey:", v94, objc_msgSend((id)objc_msgSend(v81, "inverseRelationship"), "name"));
              }
              v95 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", objc_msgSend(v86, "zoneID"));
              if (!v95)
              {
                v95 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v95, objc_msgSend(v86, "zoneID"));
              }
              objc_msgSend(v95, "addObject:", v82);

              objc_msgSend(v94, "addObject:", v86);
              v79 = contexta;
            }
            objc_autoreleasePoolPop(v79);
          }
          v125 = (id)objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v130, v155, 16);
        }
        while (v125);
      }
      goto LABEL_91;
    }
LABEL_37:
    v47 = v150;
    goto LABEL_93;
  }
LABEL_91:
  if ((v115 & 1) == 0)
  {
LABEL_93:
    v97 = v150;
    if (v97)
    {
      if (a4)
      {
        v96 = 0;
        *a4 = v97;
        goto LABEL_99;
      }
    }
    else
    {
      v98 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v98, v99, v100, v101, v102, v103, v104, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparisonCache.m");
      v105 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v152 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparisonCache.m";
        v153 = 1024;
        v154 = 492;
        _os_log_fault_impl(&dword_18A253000, v105, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v96 = 0;
    goto LABEL_99;
  }
  v96 = 1;
LABEL_99:

  return v96;
}

- (PFCloudKitStoreComparisonCacheStoreCache)init
{
  PFCloudKitStoreComparisonCacheStoreCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitStoreComparisonCacheStoreCache;
  v2 = -[PFCloudKitStoreComparisonCacheStoreCache init](&v4, sel_init);
  if (v2)
  {
    v2->_identifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_identifierToObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_mtmKeyToMirroredRelationship = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_mtmKeys = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_recordIDToRelationshipNameToRelatedRecordIDs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_recordIDToMetadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_objectIDToRecordMetadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_recordIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_recordIDToObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_objectIDToRecordID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_recordZones = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_sharedRecordZones = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_recordZoneIDToRecordIDs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_zoneIDToMTMKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_checkCloudKitMetadata = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_identifiers = 0;
  self->_identifierToObjectID = 0;

  self->_mtmKeyToMirroredRelationship = 0;
  self->_mtmKeys = 0;

  self->_recordIDToRelationshipNameToRelatedRecordIDs = 0;
  self->_recordIDToMetadata = 0;

  self->_objectIDToRecordMetadata = 0;
  self->_recordIDs = 0;

  self->_recordIDToObjectID = 0;
  self->_objectIDToRecordID = 0;

  self->_recordZones = 0;
  self->_sharedRecordZones = 0;

  self->_recordZoneIDToRecordIDs = 0;
  self->_zoneIDToMTMKeys = 0;

  self->_identityRecordName = 0;
  self->_databaseScopeNumber = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitStoreComparisonCacheStoreCache;
  -[PFCloudKitStoreComparisonCacheStoreCache dealloc](&v3, sel_dealloc);
}

- (uint64_t)createRecordZoneIDForZoneName:(uint64_t)a1 ownerName:(uint64_t)a2 inStore:(void *)a3
{
  void *v3;

  v3 = a3;
  if (objc_msgSend(a3, "isEqualToString:", getCloudKitCKCurrentUserDefaultName[0]())
    && *(_QWORD *)(a1 + 128))
  {
    v3 = *(void **)(a1 + 128);
  }
  return objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", a2, v3);
}

- (uint64_t)createRecordIDForRecordName:(uint64_t)a1 inZoneWithName:(uint64_t)a2 ownerName:(uint64_t)a3 inStore:(void *)a4
{
  void *v5;
  uint64_t v6;

  v5 = (void *)-[PFCloudKitStoreComparisonCacheStoreCache createRecordZoneIDForZoneName:ownerName:inStore:](a1, a3, a4);
  v6 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", a2, v5);

  return v6;
}

@end
