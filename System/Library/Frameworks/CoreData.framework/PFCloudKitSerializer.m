@implementation PFCloudKitSerializer

+ (void)initialize
{
  _QWORD block[5];

  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__PFCloudKitSerializer_initialize__block_invoke;
    block[3] = &unk_1E1EDD520;
    block[4] = a1;
    if (initialize_onceToken != -1)
      dispatch_once(&initialize_onceToken, block);
  }
}

uint64_t __34__PFCloudKitSerializer_initialize__block_invoke()
{
  return objc_opt_self();
}

- (PFCloudKitSerializer)initWithMirroringOptions:(id)a3 metadataCache:(id)a4 recordNamePrefix:(id)a5
{
  PFCloudKitSerializer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFCloudKitSerializer;
  v8 = -[PFCloudKitSerializer init](&v10, sel_init);
  if (v8)
  {
    v8->_manyToManyRecordNameToRecord = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_recordNamePrefix = (NSString *)objc_msgSend(a5, "copy");
    v8->_mirroringOptions = (NSCloudKitMirroringDelegateOptions *)a3;
    v8->_writtenAssetURLs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_metadataCache = (PFCloudKitMetadataCache *)a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_manyToManyRecordNameToRecord = 0;
  self->_recordNamePrefix = 0;

  self->_mirroringOptions = 0;
  self->_writtenAssetURLs = 0;

  self->_metadataCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitSerializer;
  -[PFCloudKitSerializer dealloc](&v3, sel_dealloc);
}

- (id)newCKRecordsFromObject:(int)a3 fullyMaterializeRecords:(int)a4 includeRelationships:(_QWORD *)a5 error:
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  int v44;
  void *v45;
  void *v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  __CFString *v63;
  const __CFString *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  const char *v109;
  id v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  void *v119;
  void *v121;
  id obj;
  _QWORD v124[14];
  _QWORD v125[11];
  char v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _QWORD v131[5];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  void (*v139)(uint64_t, uint64_t);
  void (*v140)(uint64_t);
  uint64_t v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t v144;
  char v145;
  uint8_t buf[4];
  const char *v147;
  __int16 v148;
  int v149;
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v142 = 0;
  v143 = &v142;
  v144 = 0x2020000000;
  v145 = 1;
  v136 = 0;
  v137 = &v136;
  v138 = 0x3052000000;
  v139 = __Block_byref_object_copy__36;
  v140 = __Block_byref_object_dispose__36;
  v141 = 0;
  v113 = (id)objc_msgSend(a2, "managedObjectContext");
  v116 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v115 = (id)objc_msgSend(a2, "entity");
  v112 = (id)objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore");
  v5 = (void *)objc_msgSend(a2, "managedObjectContext");
  v6 = -[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:](a1, a2, v5, v137 + 5);
  if (v6)
  {
    v114 = v6;
    v7 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)objc_msgSend(v6, "recordZone"));
    if (objc_msgSend((id)objc_msgSend(v114, "encodedRecord"), "length"))
    {
      v8 = *(_QWORD *)(a1 + 24);
      if (v8)
        v9 = *(_QWORD *)(v8 + 136);
      else
        v9 = 0;
      v10 = (void *)objc_msgSend(v114, "encodedRecord");
      v11 = -[PFCloudKitArchivingUtilities recordFromEncodedData:error:](v9, v10, v137 + 5);
      v119 = v11;
      if (!v11)
      {
        *((_BYTE *)v143 + 24) = 0;
        v11 = (id)v137[5];
        if (!*((_BYTE *)v143 + 24))
        {
          v117 = 0;
          v119 = 0;
LABEL_25:
          v121 = 0;
          obj = 0;
          goto LABEL_59;
        }
        goto LABEL_14;
      }
    }
    else
    {
      v11 = (id)objc_msgSend(v114, "createRecordFromSystemFields");
      v119 = v11;
    }
    if (!*((_BYTE *)v143 + 24))
    {
      v117 = 0;
      goto LABEL_25;
    }
    if (v119)
    {
      v117 = (id)objc_msgSend(v119, "recordID");
      goto LABEL_15;
    }
LABEL_14:
    v13 = -[NSCKRecordMetadata createRecordID](v114);
    v14 = objc_alloc((Class)getCloudKitCKRecordClass[0]());
    v117 = (id)v13;
    v119 = (void *)objc_msgSend(v14, "initWithRecordType:recordID:", +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, (uint64_t)v115), v13);
LABEL_15:
    v15 = objc_msgSend(v115, "name");
    objc_opt_self();
    v16 = objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", CFSTR("entityName"));
    v17 = objc_msgSend(*(id *)(a1 + 24), "useDeviceToDeviceEncryption");
    v18 = v119;
    if (v17)
      v18 = (void *)objc_msgSend(v119, "encryptedValues");
    objc_msgSend(v18, "setObject:forKey:", v15, v16);
    if (objc_msgSend((id)objc_msgSend(v114, "moveReceipts"), "count") || a3)
    {
      if ((a3 & 1) != 0)
      {
        v19 = (void *)objc_msgSend(CFSTR("Some sample move receipt data."), "dataUsingEncoding:", 4);
        objc_opt_self();
        v20 = objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", CFSTR("moveReceipt"));
        v21 = objc_msgSend(*(id *)(a1 + 24), "useDeviceToDeviceEncryption");
        v22 = v119;
        if (v21)
          v22 = (void *)objc_msgSend(v119, "encryptedValues");
        objc_msgSend(v22, "setObject:forKey:", v19, v20);
        v23 = +[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]((uint64_t)PFCloudKitSerializer, (void *)objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore"));
        if (objc_msgSend(v19, "writeToURL:options:error:", v23, 0, v137 + 5))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v23);
          v24 = (id)objc_msgSend(objc_alloc((Class)getCloudKitCKAssetClass[0]()), "initWithFileURL:", v23);
          objc_opt_self();
          v25 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", CFSTR("moveReceipt"));
          objc_opt_self();
          objc_msgSend(v119, "setObject:forKey:", v24, objc_msgSend(v25, "stringByAppendingString:", CFSTR("_ckAsset")));
        }
        else
        {
          v32 = (void *)MEMORY[0x18D76B4E4]();
          v33 = __ckLoggingOverride != 0;
          v34 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to write CKAsset data for '%@' on '%@' backing record '%@'.\n%@"));
          objc_msgSend(a2, "objectID");
          objc_msgSend(v119, "recordID");
          _NSCoreDataLog(v33, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]");
          objc_autoreleasePoolPop(v32);
          *((_BYTE *)v143 + 24) = 0;
          v41 = (id)v137[5];
        }
      }
      else
      {
        v26 = (void *)objc_msgSend(v114, "createEncodedMoveReceiptData:", v137 + 5);
        if (v26)
        {
          v27 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 24), "ckAssetThresholdBytes"), "unsignedIntegerValue");
          objc_opt_self();
          v28 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", CFSTR("moveReceipt"));
          objc_opt_self();
          v29 = objc_msgSend(v28, "stringByAppendingString:", CFSTR("_ckAsset"));
          if (v27 && objc_msgSend(v26, "length") > v27
            || (v30 = objc_msgSend(v26, "length"), (unint64_t)(objc_msgSend(v119, "size") + v30) >= 0xAAE61))
          {
            v31 = +[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]((uint64_t)PFCloudKitSerializer, (void *)objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore"));
            if (objc_msgSend(v26, "writeToURL:options:error:", v31, 0, v137 + 5))
            {
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v31);
              objc_msgSend(v119, "setObject:forKey:", (id)objc_msgSend(objc_alloc((Class)getCloudKitCKAssetClass[0]()), "initWithFileURL:", v31), v29);
            }
            else
            {
              v46 = (void *)MEMORY[0x18D76B4E4]();
              v47 = __ckLoggingOverride != 0;
              v48 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to write CKAsset data for '%@' on '%@' backing record '%@'.\n%@"));
              objc_msgSend(a2, "objectID");
              objc_msgSend(v119, "recordID");
              _NSCoreDataLog(v47, v48, v49, v50, v51, v52, v53, v54, (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]");
              objc_autoreleasePoolPop(v46);
              *((_BYTE *)v143 + 24) = 0;
              v55 = (id)v137[5];
            }
          }
          else
          {
            objc_opt_self();
            v43 = objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", CFSTR("moveReceipt"));
            v44 = objc_msgSend(*(id *)(a1 + 24), "useDeviceToDeviceEncryption");
            v45 = v119;
            if (v44)
              v45 = (void *)objc_msgSend(v119, "encryptedValues");
            objc_msgSend(v45, "setObject:forKey:", v26, v43);
          }
        }
        else
        {
          *((_BYTE *)v143 + 24) = 0;
          v42 = (id)v137[5];
        }

      }
    }
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", objc_msgSend((id)objc_msgSend(v115, "attributesByName"), "allValues"));
    objc_msgSend(v56, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_22));
    v121 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v56, "count"));
    obj = v56;
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v11 = (id)objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
    v57 = v11;
    if (v11)
    {
      v58 = *(_QWORD *)v133;
      do
      {
        v59 = 0;
        do
        {
          if (*(_QWORD *)v133 != v58)
            objc_enumerationMutation(obj);
          v60 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)v59);
          v61 = (void *)MEMORY[0x18D76B4E4]();
          v62 = objc_msgSend(v60, "name");
          v63 = (__CFString *)objc_msgSend(a2, "valueForKey:", v62);
          if (objc_msgSend(v60, "attributeType") == 1800 || objc_msgSend(v60, "attributeType") == 2100)
          {
            if (v63)
            {
              v64 = (const __CFString *)+[_PFRoutines retainedEncodeObjectValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v63, v60);
            }
            else
            {
              if (!a3)
                goto LABEL_57;
              v64 = +[PFCloudKitSchemaGenerator representativeValueFor:]((uint64_t)PFCloudKitSchemaGenerator, v60);
            }
          }
          else if (objc_msgSend(v60, "attributeType") == 1100)
          {
            v64 = (const __CFString *)-[__CFString UUIDString](v63, "UUIDString");
          }
          else
          {
            if (objc_msgSend(v60, "attributeType") != 1200)
              goto LABEL_55;
            v64 = (const __CFString *)-[__CFString absoluteString](v63, "absoluteString");
          }
          v63 = (__CFString *)v64;
LABEL_55:
          if (v63)
            objc_msgSend(v121, "setObject:forKey:", v63, v62);
LABEL_57:
          objc_autoreleasePoolPop(v61);
          v59 = (char *)v59 + 1;
        }
        while (v57 != v59);
        v11 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
        v57 = v11;
      }
      while (v11);
    }
LABEL_59:
    if (*((_BYTE *)v143 + 24))
    {
      v65 = MEMORY[0x1E0C809B0];
      v131[0] = MEMORY[0x1E0C809B0];
      v131[1] = 3221225472;
      v131[2] = __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_2;
      v131[3] = &unk_1E1EE0838;
      v131[4] = v121;
      objc_msgSend(obj, "sortUsingComparator:", v131);
      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      v11 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v150, 16);
      v66 = v11;
      if (v11)
      {
        v67 = *(_QWORD *)v128;
        do
        {
          v68 = 0;
          do
          {
            if (*(_QWORD *)v128 != v67)
              objc_enumerationMutation(obj);
            v69 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * (_QWORD)v68);
            if (+[PFCloudKitSerializer shouldTrackAttribute:]((uint64_t)PFCloudKitSerializer, v69))
            {
              v125[0] = v65;
              v125[1] = 3221225472;
              v125[2] = __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_3;
              v125[3] = &unk_1E1EE0860;
              v125[4] = v69;
              v125[5] = v121;
              v126 = a3;
              v125[6] = a1;
              v125[7] = v119;
              v125[8] = a2;
              v125[9] = &v142;
              v125[10] = &v136;
              +[_PFRoutines wrapBlockInGuardedAutoreleasePool:](_PFRoutines, "wrapBlockInGuardedAutoreleasePool:", v125);
            }
            v68 = (char *)v68 + 1;
          }
          while (v66 != v68);
          v11 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v150, 16);
          v66 = v11;
        }
        while (v11);
      }
      if (a4)
      {
        v124[0] = v65;
        v124[1] = 3221225472;
        v124[2] = __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_4;
        v124[3] = &unk_1E1EE0888;
        v124[4] = a2;
        v124[5] = a1;
        v124[6] = v114;
        v124[7] = v117;
        v124[8] = v7;
        v124[9] = v113;
        v124[12] = &v136;
        v124[13] = &v142;
        v124[10] = v116;
        v124[11] = v119;
        v11 = (id)objc_msgSend((id)objc_msgSend(v115, "relationshipsByName"), "enumerateKeysAndObjectsUsingBlock:", v124);
      }
    }
    if (*((_BYTE *)v143 + 24))
    {
      if (v119)
      {
        v70 = (void *)MEMORY[0x18D76B4E4](v11);
        if ((unint64_t)__ckLoggingOverride >= 9)
          v71 = 9;
        else
          v71 = __ckLoggingOverride;
        v72 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Serializer has finished creating record: %@\nModified Fields: %@"));
        v73 = objc_msgSend(*(id *)(a1 + 24), "useDeviceToDeviceEncryption");
        v74 = v119;
        if (v73)
          v74 = (void *)objc_msgSend(v119, "encryptedValueStore");
        v75 = v121;
        v76 = obj;
        objc_msgSend(v74, "changedKeys");
        _NSCoreDataLog(v71, v72, v77, v78, v79, v80, v81, v82, (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]");
        objc_autoreleasePoolPop(v70);
        objc_msgSend(v116, "addObject:", v119);
        goto LABEL_83;
      }
      v92 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Supposedly serialization succeeded but there's no record: %@");
      _NSCoreDataLog(17, v92, v93, v94, v95, v96, v97, v98, v137[5]);
      v90 = __pflogFaultLog;
      v75 = v121;
      v76 = obj;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_83:

        goto LABEL_84;
      }
      v109 = (const char *)v137[5];
      *(_DWORD *)buf = 138412290;
      v147 = v109;
      v91 = "CoreData: Supposedly serialization succeeded but there's no record: %@";
    }
    else
    {
      v75 = v121;
      v76 = obj;
      if (v137[5])
        goto LABEL_83;
      v83 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Object serialization failed but did not set an error: %@");
      _NSCoreDataLog(17, v83, v84, v85, v86, v87, v88, v89, (uint64_t)a2);
      v90 = __pflogFaultLog;
      v75 = v121;
      v76 = obj;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        goto LABEL_83;
      *(_DWORD *)buf = 138412290;
      v147 = (const char *)a2;
      v91 = "CoreData: Object serialization failed but did not set an error: %@";
    }
    _os_log_fault_impl(&dword_18A253000, v90, OS_LOG_TYPE_FAULT, v91, buf, 0xCu);
    goto LABEL_83;
  }
  *((_BYTE *)v143 + 24) = 0;
  v12 = (id)v137[5];
LABEL_84:

  if (!*((_BYTE *)v143 + 24))
  {
    v99 = (id)v137[5];
    if (v99)
    {
      if (a5)
        *a5 = v99;
    }
    else
    {
      v100 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v100, v101, v102, v103, v104, v105, v106, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
      v107 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v147 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
        v148 = 1024;
        v149 = 604;
        _os_log_fault_impl(&dword_18A253000, v107, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }

    v116 = 0;
  }

  v137[5] = 0;
  _Block_object_dispose(&v136, 8);
  _Block_object_dispose(&v142, 8);
  return v116;
}

- (id)getRecordMetadataForObject:(void *)a3 inManagedObjectContext:(_QWORD *)a4 error:
{
  uint64_t v8;
  id v9;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v29 = 0;
  v8 = *(_QWORD *)(a1 + 48);
  if (!v8 || (v9 = (id)objc_msgSend(*(id *)(v8 + 16), "objectForKey:", objc_msgSend(a2, "objectID"))) == 0)
  {
    v9 = (id)+[NSCKRecordMetadata metadataForObject:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, a2, a3, &v29);
    if (!v9)
    {
      if (v29
        || (v20 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", objc_msgSend(*(id *)(a1 + 24), "databaseScope")), v9 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:](NSCKRecordMetadata, "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:", a2, objc_msgSend(*(id *)(a1 + 24), "preserveLegacyRecordMetadataBehavior"), v20, *(_QWORD *)(a1 + 16), &v29), objc_msgSend(v9, "setNeedsUpload:", 1), v20, !v9))
      {
        v11 = (void *)MEMORY[0x18D76B4E4]();
        v12 = __ckLoggingOverride != 0;
        v13 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to get a metadata zone: %@"));
        _NSCoreDataLog(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:]");
        objc_autoreleasePoolPop(v11);
        if (v29)
        {
          if (a4)
          {
            v9 = 0;
            *a4 = v29;
            return v9;
          }
        }
        else
        {
          v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
          v28 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
            v32 = 1024;
            v33 = 1588;
            _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
        return 0;
      }
    }
    -[PFCloudKitMetadataCache registerRecordMetadata:forObject:](*(_QWORD *)(a1 + 48), v9, a2);
  }
  return v9;
}

+ (uint64_t)recordTypeForEntity:(uint64_t)a1
{
  void *v3;
  uint64_t v4;

  objc_opt_self();
  if (a2)
  {
    if ((*(_BYTE *)(a2 + 120) & 4) != 0)
    {
      v3 = *(void **)(a2 + 72);
    }
    else
    {
      do
      {
        v3 = (void *)a2;
        a2 = objc_msgSend((id)a2, "superentity");
      }
      while (a2);
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v3, "name");
  objc_opt_self();
  return objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v4);
}

+ (uint64_t)applyCDPrefixToName:(uint64_t)a1
{
  objc_opt_self();
  return objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", a2);
}

+ (uint64_t)generateCKAssetFileURLForObjectInStore:(uint64_t)a1
{
  objc_opt_self();
  return objc_msgSend((id)+[PFCloudKitSerializer assetStorageDirectoryURLForStore:]((uint64_t)PFCloudKitSerializer, a2), "URLByAppendingPathComponent:isDirectory:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.fxd"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString")), 0);
}

uint64_t __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "isTransient") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a2, "isReadOnly") ^ 1;
}

uint64_t __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  int v6;
  int v7;
  void *v9;

  v6 = +[PFCloudKitSerializer isVariableLengthAttributeType:]((uint64_t)PFCloudKitSerializer, objc_msgSend(a2, "attributeType"));
  v7 = +[PFCloudKitSerializer isVariableLengthAttributeType:]((uint64_t)PFCloudKitSerializer, objc_msgSend(a3, "attributeType"));
  if (((v6 ^ 1) & 1) == 0 && !v7)
    return 1;
  if ((v6 & v7) != 1)
    return (uint64_t)((unint64_t)(v7 & (v6 ^ 1u)) << 63) >> 63;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[PFCloudKitSerializer sizeOfVariableLengthAttribute:withValue:]((uint64_t)PFCloudKitSerializer, a2, (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(a2, "name"))));
  return objc_msgSend(v9, "compare:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[PFCloudKitSerializer sizeOfVariableLengthAttribute:withValue:]((uint64_t)PFCloudKitSerializer, a3, (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(a3, "name")))));
}

+ (uint64_t)isVariableLengthAttributeType:(uint64_t)a1
{
  uint64_t result;

  objc_opt_self();
  result = 1;
  if (a2 > 799)
  {
    if (a2 > 1199)
    {
      if (a2 > 1999)
      {
        if (a2 == 2100)
          return result;
        return 0;
      }
      if (a2 != 1200 && a2 != 1800)
        return 0;
    }
    else if (a2 <= 999 || a2 != 1000)
    {
      return 0;
    }
  }
  else if (a2 <= 399 || a2 <= 600 || a2 != 700)
  {
    return 0;
  }
  return result;
}

+ (uint64_t)sizeOfVariableLengthAttribute:(void *)a3 withValue:
{
  uint64_t v5;

  objc_opt_self();
  v5 = objc_msgSend(a2, "attributeType");
  if (!a3)
    return 0;
  if (v5 <= 1199)
  {
    if (v5 != 700)
    {
      if (v5 == 1000)
        goto LABEL_6;
      return 0;
    }
  }
  else if (v5 != 1200)
  {
    if (v5 == 2100 || v5 == 1800)
    {
LABEL_6:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return objc_msgSend(a3, "fileSize");
      return objc_msgSend(a3, "length");
    }
    return 0;
  }
  return objc_msgSend(a3, "length");
}

+ (BOOL)shouldTrackAttribute:(uint64_t)a1
{
  objc_opt_self();
  return (+[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)PFCloudKitSerializer, a2) & 1) == 0
      && objc_msgSend(a2, "attributeType")
      && +[PFCloudKitSerializer shouldTrackProperty:]((uint64_t)PFCloudKitSerializer, a2);
}

void __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _BOOL8 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  void *v54;
  id v55;

  v2 = objc_msgSend(*(id *)(a1 + 32), "name");
  objc_opt_self();
  v3 = objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v2);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v2);
  if (objc_msgSend(*(id *)(a1 + 32), "attributeType") == 1000
    || objc_msgSend(*(id *)(a1 + 32), "attributeType") == 1800)
  {
    v5 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "ckAssetThresholdBytes"), "unsignedIntegerValue");
    objc_opt_self();
    v6 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v2);
    objc_opt_self();
    v7 = objc_msgSend(v6, "stringByAppendingString:", CFSTR("_ckAsset"));
    if (v4)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isFileBackedFuture") & 1) != 0
        || v5
        || *(_BYTE *)(a1 + 88)
        || (v8 = objc_msgSend(v4, "length"), (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v8) > 0xAAE60))
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "isFileBackedFuture") & 1) != 0
          || objc_msgSend(v4, "length") >= v5
          || *(_BYTE *)(a1 + 88)
          || (v9 = objc_msgSend(v4, "length"), (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v9) > 0xAAE60))
        {
          if (*(_BYTE *)(a1 + 88))
          {
            v10 = *(_QWORD *)(a1 + 48);
            v11 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v10, *(void **)(a1 + 32));
            v12 = v4;
            if (v10)
            {
              v13 = v11;
              v14 = *(void **)(a1 + 56);
              if (v13)
                v14 = (void *)objc_msgSend(v14, "encryptedValues");
              objc_msgSend(v14, "setObject:forKey:", v4, v3);
              v12 = v4;
            }
          }
          else
          {
            v12 = 0;
          }
          v24 = +[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]((uint64_t)PFCloudKitSerializer, (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectID"), "persistentStore"));
          v55 = 0;
          if (objc_msgSend(*(id *)(a1 + 32), "isFileBackedFuture"))
          {
            v25 = (id)objc_msgSend(v4, "fileURL");
            if (v25)
            {
              if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtURL:toURL:error:", v25, v24, &v55) & 1) != 0)
              {
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "addObject:", v24);
                objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", (id)objc_msgSend(objc_alloc((Class)getCloudKitCKAssetClass[0]()), "initWithFileURL:", v24), v7);
                v12 = -[_NSDataFileBackedFuture _storeMetadata]((uint64_t)v4);

                goto LABEL_54;
              }
              v32 = (void *)MEMORY[0x18D76B4E4]();
              v33 = __ckLoggingOverride != 0;
              v34 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to copy CKAsset data for '%@' on '%@' backing record '%@'.\n%@"));
              objc_msgSend(*(id *)(a1 + 64), "objectID");
              objc_msgSend(*(id *)(a1 + 56), "recordID");
              _NSCoreDataLog(v33, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]_block_invoke_3");
              objc_autoreleasePoolPop(v32);
            }

            return;
          }
          if (objc_msgSend(v4, "writeToURL:options:error:", v24, 0, &v55))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "addObject:", v24);
            v26 = *(void **)(a1 + 56);
            v27 = objc_alloc((Class)getCloudKitCKAssetClass[0]());
            v28 = v24;
LABEL_52:
            objc_msgSend(v26, "setObject:forKey:", (id)objc_msgSend(v27, "initWithFileURL:", v28), v7);
            goto LABEL_54;
          }
          goto LABEL_53;
        }
      }
      goto LABEL_42;
    }
    v15 = *(void **)(a1 + 56);
    goto LABEL_18;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "attributeType") != 700 && objc_msgSend(*(id *)(a1 + 32), "attributeType") != 1200)
    goto LABEL_43;
  v16 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "ckAssetThresholdBytes"), "unsignedIntegerValue");
  objc_opt_self();
  v17 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v2);
  objc_opt_self();
  v7 = objc_msgSend(v17, "stringByAppendingString:", CFSTR("_ckAsset"));
  if (!v4)
  {
    v29 = *(_QWORD *)(a1 + 48);
    v30 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v29, *(void **)(a1 + 32));
    if (!v29)
      goto LABEL_19;
    v31 = v30;
    v15 = *(void **)(a1 + 56);
    if (v31)
      v15 = (void *)objc_msgSend(v15, "encryptedValues");
LABEL_18:
    objc_msgSend(v15, "setObject:forKey:", 0, v7);
LABEL_19:
    v12 = 0;
    goto LABEL_54;
  }
  if (!v16
    && !*(_BYTE *)(a1 + 88)
    && (v18 = objc_msgSend(v4, "length"), (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v18) <= 0xAAE60)
    || objc_msgSend(v4, "length") < v16
    && !*(_BYTE *)(a1 + 88)
    && (v19 = objc_msgSend(v4, "length"), (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v19) <= 0xAAE60))
  {
LABEL_42:
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", 0, v7);
LABEL_43:
    v12 = v4;
    goto LABEL_54;
  }
  if (*(_BYTE *)(a1 + 88))
  {
    v20 = *(_QWORD *)(a1 + 48);
    v21 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v20, *(void **)(a1 + 32));
    v12 = v4;
    if (v20)
    {
      v22 = v21;
      v23 = *(void **)(a1 + 56);
      if (v22)
        v23 = (void *)objc_msgSend(v23, "encryptedValues");
      objc_msgSend(v23, "setObject:forKey:", v4, v3);
      v12 = v4;
    }
  }
  else
  {
    v12 = 0;
  }
  v41 = +[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]((uint64_t)PFCloudKitSerializer, (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectID"), "persistentStore"));
  v55 = 0;
  if (objc_msgSend((id)objc_msgSend(v4, "dataUsingEncoding:allowLossyConversion:", 4, 0), "writeToURL:options:error:", v41, 0, &v55))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "addObject:", v41);
    v26 = *(void **)(a1 + 56);
    v27 = objc_alloc((Class)getCloudKitCKAssetClass[0]());
    v28 = v41;
    goto LABEL_52;
  }
LABEL_53:
  v42 = (void *)MEMORY[0x18D76B4E4]();
  v43 = __ckLoggingOverride != 0;
  v44 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to write CKAsset data for '%@' on '%@' backing record '%@'.\n%@"));
  objc_msgSend(*(id *)(a1 + 64), "objectID");
  objc_msgSend(*(id *)(a1 + 56), "recordID");
  _NSCoreDataLog(v43, v44, v45, v46, v47, v48, v49, v50, (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]_block_invoke_3");
  objc_autoreleasePoolPop(v42);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = v55;
LABEL_54:
  v51 = *(_QWORD *)(a1 + 48);
  v52 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v51, *(void **)(a1 + 32));
  if (v51)
  {
    v53 = v52;
    v54 = *(void **)(a1 + 56);
    if (v53)
      v54 = (void *)objc_msgSend(v54, "encryptedValues");
    objc_msgSend(v54, "setObject:forKey:", v12, v3);
  }
}

- (uint64_t)shouldEncryptValueForAttribute:(uint64_t)result
{
  void *v3;

  if (result)
  {
    if ((objc_msgSend(*(id *)(result + 24), "useDeviceToDeviceEncryption") & 1) != 0)
    {
      return 1;
    }
    else
    {
      v3 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("NSPersistentCloudKitContainerEncryptedAttributeKey"));
      if (v3)
        return objc_msgSend(v3, "BOOLValue");
      else
        return objc_msgSend(a2, "allowsCloudEncryption");
    }
  }
  return result;
}

void __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  PFMirroredManyToManyRelationshipV2 *v24;
  NSManagedObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  int v69;
  void *v70;
  uint64_t v71;
  int v72;
  int v73;
  void *v74;
  id v75;
  _BYTE *v76;
  uint64_t v77;
  id v78;
  void *v79;
  id obj;
  id v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *context;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t v94[128];
  uint8_t buf[4];
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  void *v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!+[PFCloudKitSerializer shouldTrackProperty:]((uint64_t)PFCloudKitSerializer, a3))
    return;
  v78 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v84 = (void *)objc_msgSend(a3, "inverseRelationship");
  if (!objc_msgSend(a3, "isToMany") || !objc_msgSend(v84, "isToMany"))
  {
    if ((objc_msgSend(a3, "isToMany") & 1) == 0)
    {
      v62 = (void *)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
      v63 = *(_QWORD *)(a1 + 40);
      if (v62)
      {
        v64 = -[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:](v63, v62, (void *)objc_msgSend(v62, "managedObjectContext"), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
        if (!v64)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
          v75 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
          v61 = 0;
          *a4 = 1;
          goto LABEL_67;
        }
        v65 = *(_QWORD *)(a1 + 40);
        v66 = objc_msgSend(v64, "ckRecordName");
        objc_opt_self();
        v67 = objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", a2);
        v68 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "useDeviceToDeviceEncryption");
        if (v65)
        {
          v69 = v68;
          v70 = *(void **)(a1 + 88);
          if (v69)
            v70 = (void *)objc_msgSend(v70, "encryptedValues");
          objc_msgSend(v70, "setObject:forKey:", v66, v67);
        }
      }
      else
      {
        objc_opt_self();
        v71 = objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", a2);
        v72 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "useDeviceToDeviceEncryption");
        if (v63)
        {
          v73 = v72;
          v74 = *(void **)(a1 + 88);
          if (v73)
            v74 = (void *)objc_msgSend(v74, "encryptedValues");
          objc_msgSend(v74, "setObject:forKey:", 0, v71);
        }
      }
    }
    v61 = 0;
    goto LABEL_67;
  }
  obj = (id)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v81 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v76 = a4;
  v77 = a2;
  v82 = (uint64_t)a3;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
  if (!v8)
    goto LABEL_36;
  v9 = v8;
  v83 = *(_QWORD *)v91;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v91 != v83)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v10);
      context = (void *)MEMORY[0x18D76B4E4]();
      v12 = -[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:](*(_QWORD *)(a1 + 40), v11, (void *)objc_msgSend(*(id *)(a1 + 32), "managedObjectContext"), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
      if (v12)
      {
        v13 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, objc_msgSend(*(id *)(a1 + 48), "ckRecordName"), objc_msgSend(v12, "ckRecordName"), v82, (uint64_t)v84);
        objc_msgSend(v81, "addObject:", v13);
        v14 = *(id **)(*(_QWORD *)(a1 + 40) + 48);
        v15 = objc_msgSend(*(id *)(a1 + 56), "zoneID");
        if (v14
          && (v16 = (void *)objc_msgSend((id)objc_msgSend(v14[4], "objectForKey:", v15), "objectForKey:", v13),
              (v14 = (id *)v16) != 0))
        {
          if ((objc_msgSend((id)objc_msgSend(v16, "isUploaded"), "BOOLValue") & 1) != 0)
            goto LABEL_31;
          v17 = 0;
        }
        else
        {
          v17 = 1;
        }
        v19 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", v13);
        if (!v19)
        {
          v20 = (void *)objc_msgSend(v14, "ckRecordID");
          if (objc_msgSend(v20, "length"))
          {
            v21 = objc_alloc((Class)getCloudKitCKRecordIDClass[0]());
          }
          else
          {
            v21 = objc_alloc((Class)getCloudKitCKRecordIDClass[0]());
            v20 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
          }
          v22 = (void *)objc_msgSend(v21, "initWithRecordName:zoneID:", v20, *(_QWORD *)(a1 + 64));
          v79 = (void *)-[NSCKRecordMetadata createRecordID](*(void **)(a1 + 48));
          v23 = (void *)-[NSCKRecordMetadata createRecordID](v12);
          v24 = -[PFMirroredManyToManyRelationshipV2 initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:]([PFMirroredManyToManyRelationshipV2 alloc], "initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:", v22, v79, v23, v82, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "entity"), "relationshipsByName"), "objectForKeyedSubscript:", objc_msgSend(v84, "name")), 0);
          if (v17)
          {
            v25 = +[NSCKMirroredRelationship insertMirroredRelationshipForManyToMany:inZoneWithMetadata:inStore:withManagedObjectContext:]((uint64_t)NSCKMirroredRelationship, (uint64_t)v24, objc_msgSend(*(id *)(a1 + 48), "recordZone"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectID"), "persistentStore"), *(void **)(a1 + 72));
            -[NSManagedObject setIsUploaded:](v25, "setIsUploaded:", MEMORY[0x1E0C9AAA0]);
            -[NSManagedObject setNeedsDelete:](v25, "setNeedsDelete:", MEMORY[0x1E0C9AAA0]);
            -[NSManagedObject setIsPending:](v25, "setIsPending:", MEMORY[0x1E0C9AAA0]);
          }
          if (!objc_msgSend((id)objc_msgSend(v22, "zoneID"), "isEqual:", objc_msgSend(*(id *)(a1 + 56), "zoneID"))|| (objc_msgSend((id)objc_msgSend(v22, "zoneID"), "isEqual:", objc_msgSend(v23, "zoneID")) & 1) == 0)
          {
            v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Serializer is attempting to link relationships across zones: %@ - %@ / %@");
            _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)v22);
            v33 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v37 = *(_QWORD *)(a1 + 56);
              *(_DWORD *)buf = 138412802;
              v96 = (uint64_t)v22;
              v97 = 2112;
              v98 = v37;
              v99 = 2112;
              v100 = v23;
              _os_log_fault_impl(&dword_18A253000, v33, OS_LOG_TYPE_FAULT, "CoreData: Serializer is attempting to link relationships across zones: %@ - %@ / %@", buf, 0x20u);
            }
          }
          v19 = (id)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordClass[0]()), "initWithRecordType:recordID:", CFSTR("CDMR"), v22);
          objc_msgSend(*(id *)(a1 + 80), "addObject:", v19);
          v34 = *(_QWORD *)(a1 + 40);
          if (v34)
          {
            v35 = objc_msgSend(*(id *)(v34 + 24), "useDeviceToDeviceEncryption");
            v36 = (uint64_t)v19;
            if (v35)
              v36 = objc_msgSend(v19, "encryptedValueStore", v19);
          }
          else
          {
            v36 = 0;
          }
          -[PFMirroredManyToManyRelationshipV2 populateRecordValues:](v24, "populateRecordValues:", v36);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v19, v13);

        }
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
        v18 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      }
LABEL_31:
      objc_autoreleasePoolPop(context);
      if (!v12)
        goto LABEL_36;
      ++v10;
    }
    while (v9 != v10);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
    v9 = v38;
  }
  while (v38);
LABEL_36:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
    *v76 = 1;
  v39 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  v40 = objc_msgSend(*(id *)(a1 + 32), "objectID");
  if (v39)
    v41 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v39 + 40), "objectForKey:", v40), "objectForKey:", v77);
  else
    v41 = 0;
  v42 = (void *)objc_msgSend(v41, "mutableCopy");
  objc_msgSend(v42, "minusSet:", v81);
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v87;
    v45 = MEMORY[0x1E0C9AAB0];
    v46 = MEMORY[0x1E0C9AAA0];
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v87 != v44)
          objc_enumerationMutation(v42);
        v48 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v47);
        v49 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
        v50 = objc_msgSend(*(id *)(a1 + 56), "zoneID");
        if (v49)
        {
          v51 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v49 + 32), "objectForKey:", v50), "objectForKey:", v48);
          if (v51)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_50;
          }
        }
        else
        {
          v51 = 0;
        }
        v52 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to look up cached mirrored relationship for mtmKey: %@");
        _NSCoreDataLog(17, v52, v53, v54, v55, v56, v57, v58, v48);
        v59 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v48;
          _os_log_fault_impl(&dword_18A253000, v59, OS_LOG_TYPE_FAULT, "CoreData: Failed to look up cached mirrored relationship for mtmKey: %@", buf, 0xCu);
        }
LABEL_50:
        objc_msgSend(v51, "setNeedsDelete:", v45);
        objc_msgSend(v51, "setIsUploaded:", v46);
        objc_msgSend(v51, "setIsPending:", v46);
        ++v47;
      }
      while (v43 != v47);
      v60 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
      v43 = v60;
    }
    while (v60);
  }

  v61 = v81;
LABEL_67:

}

+ (uint64_t)mtmKeyForObjectWithRecordName:(uint64_t)a3 relatedToObjectWithRecordName:(uint64_t)a4 byRelationship:(uint64_t)a5 withInverse:
{
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v27[0] = a4;
  v27[1] = a5;
  v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2), "sortedArrayUsingComparator:", &__block_literal_global_137);
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "entity");
  if (v11)
  {
    if ((*(_BYTE *)(v11 + 120) & 4) != 0)
    {
      v12 = *(void **)(v11 + 72);
    }
    else
    {
      do
      {
        v12 = (void *)v11;
        v11 = objc_msgSend((id)v11, "superentity");
      }
      while (v11);
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("CD_M2M_"), objc_msgSend(v12, "name"), objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "name"));
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v9);
        if (*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18) == a4)
          v19 = a2;
        else
          v19 = a3;
        objc_msgSend(v14, "addObject:", v19);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }
  v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v13, objc_msgSend(v14, "componentsJoinedByString:", CFSTR(":")));

  return v20;
}

- (BOOL)applyUpdatedRecords:(uint64_t)a3 deletedRecordIDs:(uint64_t)a4 toStore:(void *)a5 inManagedObjectContext:(uint64_t)a6 onlyUpdatingAttributes:(uint64_t)a7 andRelationships:(uint64_t)a8 madeChanges:(_QWORD *)a9 error:
{
  _BOOL8 v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[14];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__36;
  v25 = __Block_byref_object_dispose__36;
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke;
  v20[3] = &unk_1E1EE0950;
  v20[4] = a5;
  v20[5] = a1;
  v20[6] = a4;
  v20[7] = a2;
  v20[8] = a3;
  v20[9] = a6;
  v20[10] = a7;
  v20[11] = &v21;
  v20[12] = &v27;
  v20[13] = a8;
  objc_msgSend(a5, "performBlockAndWait:", v20);
  if (!*((_BYTE *)v28 + 24))
  {
    v11 = (id)v22[5];
    if (v11)
    {
      if (a9)
        *a9 = v11;
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
        v33 = 1024;
        v34 = 1217;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v22[5] = 0;
  v9 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v9;
}

void __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke(uint64_t a1)
{
  void *v2;
  PFCloudKitImportZoneContext *v3;
  NSArray *modifiedRecords;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  NSManagedObject *v14;
  NSManagedObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSManagedObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  NSArray *v45;
  void *v46;
  uint64_t v47;
  NSArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  char v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  int v66;
  void *v67;
  char v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _PFEvanescentData *v81;
  void *v82;
  uint64_t v83;
  _NSCloudKitDataFileBackedFuture *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  _BOOL8 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _NSCloudKitDataFileBackedFuture *v107;
  uint64_t v108;
  void *v109;
  char v110;
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
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  NSObject *v128;
  id v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  NSObject *v152;
  void *v153;
  id v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  NSObject *v199;
  NSArray *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t i;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  int v219;
  void *v220;
  char v221;
  uint64_t v222;
  void *v223;
  void *v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  PFMirroredOneToManyRelationship *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  NSObject *v242;
  id v243;
  uint64_t v244;
  void *v245;
  id v246;
  id v247;
  void *v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  id v260;
  int v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  void *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t j;
  void *v270;
  id v271;
  void *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t k;
  id v276;
  uint64_t v277;
  BOOL v278;
  uint64_t v279;
  char v280;
  id v281;
  void *v282;
  uint64_t v283;
  uint64_t v284;
  id v285;
  uint64_t v286;
  id v287;
  NSFetchRequest *v288;
  void *v289;
  uint64_t v290;
  void *v291;
  void *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  void *v297;
  void *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  unint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  id v314;
  void *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t m;
  NSManagedObject *v319;
  id v320;
  id v321;
  void *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t n;
  uint64_t v328;
  void *v329;
  void *v330;
  void *v331;
  unint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  id v341;
  void *v342;
  unint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  id v353;
  PFCloudKitImportZoneContext *v354;
  uint64_t v355;
  id v356;
  NSArray *obj;
  uint64_t v358;
  uint64_t v359;
  id v360;
  char v361;
  id WeakRetained;
  void *context;
  NSArray *v364;
  id v365;
  uint64_t v366;
  NSManagedObject *v367;
  int v368;
  id v369;
  uint64_t v370;
  void *v371;
  NSArray *v372;
  NSArray *v373;
  uint64_t v374;
  NSManagedObject *v375;
  uint64_t v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  _QWORD v385[8];
  int8x16_t v386;
  uint64_t v387;
  _QWORD v388[4];
  __int128 v389;
  uint64_t v390;
  uint64_t v391;
  id v392;
  int8x16_t v393;
  _QWORD v394[8];
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  _QWORD v411[5];
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  uint64_t v420;
  _BYTE v421[128];
  _BYTE v422[128];
  _BYTE v423[128];
  _BYTE v424[128];
  _BYTE v425[128];
  _BYTE v426[128];
  _BYTE v427[128];
  _BYTE buf[12];
  __int16 v429;
  NSManagedObject *v430;
  _BYTE v431[128];
  uint64_t v432;

  v432 = *MEMORY[0x1E0C80C00];
  v356 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator"), "managedObjectModel");
  v360 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  v376 = a1;
  v2 = (void *)objc_msgSend(v356, "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 48), "configurationName"));
  v411[0] = MEMORY[0x1E0C809B0];
  v411[1] = 3221225472;
  v411[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2;
  v411[3] = &unk_1E1EE08B0;
  v411[4] = v360;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v411);
  v3 = -[PFCloudKitImportZoneContext initWithUpdatedRecords:deletedRecordTypeToRecordIDs:options:fileBackedFuturesDirectory:]([PFCloudKitImportZoneContext alloc], "initWithUpdatedRecords:deletedRecordTypeToRecordIDs:options:fileBackedFuturesDirectory:", *(_QWORD *)(v376 + 56), *(_QWORD *)(v376 + 64), *(_QWORD *)(*(_QWORD *)(v376 + 40) + 24), objc_msgSend(*(id *)(v376 + 48), "fileBackedFuturesDirectory"));
  v370 = (uint64_t)v3;
  if (-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]((uint64_t)v3, *(void **)(v376 + 32), *(void **)(v376 + 48), (id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40)))
  {
    v409 = 0u;
    v410 = 0u;
    v407 = 0u;
    v408 = 0u;
    v354 = v3;
    if (v3)
      modifiedRecords = v3->_modifiedRecords;
    else
      modifiedRecords = 0;
    obj = modifiedRecords;
    v359 = -[NSArray countByEnumeratingWithState:objects:count:](modifiedRecords, "countByEnumeratingWithState:objects:count:", &v407, v426, 16);
    if (v359)
    {
      v358 = *(_QWORD *)v408;
      do
      {
        v366 = 0;
        do
        {
          if (*(_QWORD *)v408 != v358)
            objc_enumerationMutation(obj);
          v371 = *(void **)(*((_QWORD *)&v407 + 1) + 8 * v366);
          context = (void *)MEMORY[0x18D76B4E4]();
          v5 = objc_msgSend((id)objc_msgSend(v371, "recordType"), "hasPrefix:", CFSTR("CD_"));
          v6 = *(_QWORD *)(v376 + 40);
          v7 = v6;
          v8 = CFSTR("entityName");
          if (v5)
          {
            objc_opt_self();
            v8 = (__CFString *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", CFSTR("entityName"));
            v7 = *(_QWORD *)(v376 + 40);
          }
          v9 = objc_msgSend(*(id *)(v7 + 24), "useDeviceToDeviceEncryption");
          if (!v6)
            goto LABEL_16;
          v10 = v9;
          v11 = v371;
          if (v10)
          {
            v12 = -[__CFString hasSuffix:](v8, "hasSuffix:", CFSTR("_ckAsset"));
            v11 = v371;
            if ((v12 & 1) == 0)
              v11 = (void *)objc_msgSend(v371, "encryptedValues");
          }
          v13 = (void *)objc_msgSend(v11, "objectForKey:", v8);
          if (!v13)
          {
LABEL_16:
            v13 = (void *)objc_msgSend(v371, "recordType");
            objc_opt_self();
            if (objc_msgSend(v13, "hasPrefix:", CFSTR("CD_")))
              v13 = (void *)objc_msgSend(v13, "substringFromIndex:", objc_msgSend(CFSTR("CD_"), "length"));
          }
          if (objc_msgSend(v360, "objectForKey:", v13))
          {
            v14 = +[NSCKRecordMetadata metadataForRecord:inManagedObjectContext:fromStore:error:]((uint64_t)NSCKRecordMetadata, v371, *(void **)(v376 + 32), *(_QWORD *)(v376 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40));
            v15 = v14;
            if (!v14)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
              v28 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
              goto LABEL_234;
            }
            if (!-[NSManagedObject recordZone](v14, "recordZone"))
            {
              v16 = *(_QWORD *)(*(_QWORD *)(v376 + 40) + 48);
              v17 = objc_msgSend((id)objc_msgSend(v371, "recordID"), "zoneID");
              if (!v16 || (v18 = (NSManagedObject *)objc_msgSend(*(id *)(v16 + 8), "objectForKey:", v17)) == 0)
              {
                v18 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)objc_msgSend((id)objc_msgSend(v371, "recordID"), "zoneID"), objc_msgSend(*(id *)(*(_QWORD *)(v376 + 40) + 24), "databaseScope"), *(_QWORD *)(v376 + 48), *(void **)(v376 + 32), *(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
                if (v18)
                {
                  -[PFCloudKitMetadataCache cacheZoneMetadata:](*(_QWORD *)(*(_QWORD *)(v376 + 40) + 48), v18);
                }
                else
                {
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
                  v29 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
                  v18 = 0;
                }
              }
              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
                -[NSManagedObject setRecordZone:](v15, "setRecordZone:", v18);
            }
            v367 = v15;
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
            {
              v30 = objc_msgSend(v371, "recordID");
              if (v370
                && (v31 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v370 + 64), "objectForKey:", v13), "objectForKey:", v30)) != 0)
              {
                v375 = (NSManagedObject *)objc_msgSend(*(id *)(v376 + 32), "objectWithID:", v31);
                v32 = _sqlEntityForEntityDescription(objc_msgSend(*(id *)(v376 + 48), "model"), (_QWORD *)objc_msgSend(v31, "entity"));
                if (v32)
                  v33 = *(unsigned int *)(v32 + 184);
                else
                  v33 = 0;
                if (objc_msgSend((id)-[NSManagedObject entityId](v15, "entityId"), "longValue") != v33
                  || (v34 = objc_msgSend(v31, "_referenceData64"),
                      v34 != objc_msgSend((id)-[NSManagedObject entityPK](v15, "entityPK"), "integerValue")))
                {
                  v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Record metadata doesn't match row: %@\n%@");
                  _NSCoreDataLog(17, v35, v36, v37, v38, v39, v40, v41, (uint64_t)v31);
                  v42 = __pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v31;
                    v429 = 2112;
                    v430 = v15;
                    _os_log_fault_impl(&dword_18A253000, v42, OS_LOG_TYPE_FAULT, "CoreData: Record metadata doesn't match row: %@\n%@", buf, 0x16u);
                  }
                }
              }
              else
              {
                v375 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v13, *(_QWORD *)(v376 + 32));
                -[PFCloudKitImportZoneContext registerObject:forInsertedRecord:withMetadata:](v370, v375, v371, v15);
              }
              v43 = *(void **)(v376 + 72);
              if (v43)
              {
                v44 = objc_msgSend(v43, "objectForKey:", -[NSEntityDescription name](-[NSManagedObject entity](v375, "entity"), "name"));
                if (v44)
                  v45 = (NSArray *)v44;
                else
                  v45 = (NSArray *)MEMORY[0x1E0C9AA60];
              }
              else
              {
                v45 = 0;
              }
              v46 = *(void **)(v376 + 80);
              if (v46)
              {
                v47 = objc_msgSend(v46, "objectForKey:", -[NSEntityDescription name](-[NSManagedObject entity](v375, "entity"), "name"));
                v48 = (NSArray *)MEMORY[0x1E0C9AA60];
                if (v47)
                  v48 = (NSArray *)v47;
                v372 = v48;
              }
              else
              {
                v372 = 0;
              }
              v374 = *(_QWORD *)(v376 + 40);
              if (!v374)
                goto LABEL_220;
              v49 = *(_QWORD *)(*(_QWORD *)(v376 + 88) + 8);
              v420 = 0;
              if (-[NSManagedObject isInserted](v375, "isInserted")
                && objc_msgSend(*(id *)(v374 + 24), "preserveLegacyRecordMetadataBehavior")
                && -[NSDictionary objectForKey:](-[NSEntityDescription attributesByName](-[NSManagedObject entity](v375, "entity"), "attributesByName"), "objectForKey:", CFSTR("ckRecordID"))&& !-[NSManagedObject valueForKey:](v375, "valueForKey:", CFSTR("ckRecordID")))
              {
                -[NSManagedObject setValue:forKey:](v375, "setValue:forKey:", objc_msgSend((id)objc_msgSend(v371, "recordID"), "recordName"), CFSTR("ckRecordID"));
              }
              v50 = *(_QWORD *)(v374 + 24);
              if (v50)
                v51 = *(_QWORD *)(v50 + 136);
              else
                v51 = 0;
              v52 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v51, (uint64_t)v371, &v420);
              if (v52)
              {
                -[NSManagedObject setEncodedRecord:](v367, "setEncodedRecord:", v52);
                -[NSManagedObject setCkRecordSystemFields:](v367, "setCkRecordSystemFields:", 0);
              }

              v368 = objc_msgSend((id)objc_msgSend(v371, "recordType"), "hasPrefix:", CFSTR("CD_"));
              if (!v52)
                goto LABEL_216;
              if (!v45)
                v45 = -[NSDictionary allValues](-[NSEntityDescription attributesByName](-[NSManagedObject entity](v375, "entity"), "attributesByName"), "allValues");
              v419 = 0u;
              v418 = 0u;
              v417 = 0u;
              v416 = 0u;
              v53 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v416, v431, 16);
              if (!v53)
                goto LABEL_185;
              v355 = v49;
              v54 = *(_QWORD *)v417;
              v361 = 1;
              v364 = v45;
              while (2)
              {
                v55 = 0;
LABEL_69:
                if (*(_QWORD *)v417 != v54)
                  objc_enumerationMutation(v45);
                v56 = *(void **)(*((_QWORD *)&v416 + 1) + 8 * v55);
                if ((+[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)PFCloudKitSerializer, v56) & 1) != 0
                  || (objc_msgSend(v56, "isTransient") & 1) != 0
                  || (objc_msgSend(v56, "isReadOnly") & 1) != 0
                  || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v56, "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey")), "BOOLValue") & 1) != 0)
                {
                  goto LABEL_155;
                }
                v57 = objc_msgSend(v56, "name");
                v58 = (void *)v57;
                if (v368)
                {
                  objc_opt_self();
                  v58 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v57);
                }
                v59 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v374, v56);
                v60 = v371;
                if (v59)
                {
                  v61 = objc_msgSend(v58, "hasSuffix:", CFSTR("_ckAsset"));
                  v60 = v371;
                  if ((v61 & 1) == 0)
                    v60 = (void *)objc_msgSend(v371, "encryptedValues");
                }
                v62 = (void *)objc_msgSend(v60, "objectForKey:", v58);
                v63 = v62;
                if (!v62)
                {
                  if (!+[PFCloudKitSerializer isVariableLengthAttributeType:]((uint64_t)PFCloudKitSerializer, objc_msgSend(v56, "attributeType")))goto LABEL_96;
                  v69 = (void *)v57;
                  if (v368)
                  {
                    objc_opt_self();
                    v69 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v57);
                  }
                  objc_opt_self();
                  v62 = (void *)objc_msgSend(v371, "objectForKey:", objc_msgSend(v69, "stringByAppendingString:", CFSTR("_ckAsset")));
                  if (!v62)
                  {
LABEL_96:
                    if ((objc_msgSend(v56, "isTransient") & 1) == 0)
                    {
                      v70 = *(_QWORD *)(v374 + 48);
                      v71 = -[NSManagedObject objectID](v375, "objectID");
                      if (v70
                        && (objc_msgSend((id)objc_msgSend(*(id *)(v70 + 48), "objectForKey:", v71), "containsObject:", v57) & 1) != 0)
                      {
                        v72 = (void *)MEMORY[0x18D76B4E4]();
                        if ((unint64_t)__ckLoggingOverride >= 0x10)
                          v73 = 16;
                        else
                          v73 = __ckLoggingOverride;
                        v74 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Importer is rejecting updated value for '%@' on '%@' because there are pending local edits that haven't been exported yet."));
                        -[NSManagedObject objectID](v375, "objectID");
                        _NSCoreDataLog(v73, v74, v75, v76, v77, v78, v79, v80, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                        objc_autoreleasePoolPop(v72);
                      }
                      else
                      {
                        -[NSManagedObject setValue:forKey:](v375, "setValue:forKey:", objc_msgSend(v56, "defaultValue"), v57);
                      }
                    }
                    v369 = 0;

                    v110 = 1;
                    v63 = 0;
                    goto LABEL_153;
                  }
                }
                v369 = objc_loadWeakRetained((id *)(v374 + 32));
                if (objc_msgSend(v56, "attributeType") == 1000
                  || objc_msgSend(v56, "attributeType") == 1800
                  || objc_msgSend(v56, "attributeType") == 2100)
                {
                  if (objc_msgSend(v56, "isFileBackedFuture"))
                  {
                    getCloudKitCKAssetClass[0]();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v64 = v62;
                      v65 = (void *)v57;
                      if (v368)
                      {
                        objc_opt_self();
                        v65 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v57);
                      }
                      v66 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v374, v56);
                      v67 = v371;
                      if (v66)
                      {
                        v68 = objc_msgSend(v65, "hasSuffix:", CFSTR("_ckAsset"));
                        v67 = v371;
                        if ((v68 & 1) == 0)
                          v67 = (void *)objc_msgSend(v371, "encryptedValues");
                      }
                      v365 = (id)objc_msgSend(v67, "objectForKey:", v65);
                    }
                    else
                    {
                      v365 = v62;
                      v82 = (void *)v57;
                      if (v368)
                      {
                        objc_opt_self();
                        v82 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v57);
                      }
                      objc_opt_self();
                      v64 = (id)objc_msgSend(v371, "objectForKey:", objc_msgSend(v82, "stringByAppendingString:", CFSTR("_ckAsset")));
                    }
                    if (v365)
                    {
                      if (v64)
                      {
                        v83 = objc_msgSend(v369, "cloudKitSerializer:safeSaveURLForAsset:", v374, v64);
                        if (v83)
                        {
                          v84 = [_NSCloudKitDataFileBackedFuture alloc];
                          if (v370)
                            v85 = *(_QWORD *)(v370 + 104);
                          else
                            v85 = 0;
                          v86 = -[_NSCloudKitDataFileBackedFuture initWithStoreMetadata:directory:originalFileURL:](v84, "initWithStoreMetadata:directory:originalFileURL:", v365, v85, v83);
                          goto LABEL_125;
                        }
                        v121 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Delegate didn't return a file url for asset: %@");
                        _NSCoreDataLog(17, v121, v122, v123, v124, v125, v126, v127, (uint64_t)v64);
                        v128 = __pflogFaultLog;
                        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)&buf[4] = v64;
                          _os_log_fault_impl(&dword_18A253000, v128, OS_LOG_TYPE_FAULT, "CoreData: Delegate didn't return a file url for asset: %@", buf, 0xCu);
                        }
                        v109 = 0;
                      }
                      else
                      {
                        v107 = [_NSCloudKitDataFileBackedFuture alloc];
                        if (v370)
                          v108 = *(_QWORD *)(v370 + 104);
                        else
                          v108 = 0;
                        v86 = -[_NSDataFileBackedFuture initWithStoreMetadata:directory:](v107, "initWithStoreMetadata:directory:", v365, v108);
LABEL_125:
                        v109 = (void *)v86;
                      }
                      v129 = -[NSManagedObject valueForKey:](v375, "valueForKey:", objc_msgSend(v56, "name"));
                      if (objc_msgSend(v129, "isEqual:", v109)
                        && (objc_msgSend(v129, "fileURL") || !v109 || !objc_getProperty(v109, v130, 16, 1)))
                      {

                      }
                      else
                      {

                        v129 = v109;
                      }
                      v63 = v129;

                    }
                  }
                  else
                  {
                    getCloudKitCKAssetClass[0]();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v81 = -[_PFEvanescentData initWithURL:]([_PFEvanescentData alloc], "initWithURL:", objc_msgSend(v369, "cloudKitSerializer:safeSaveURLForAsset:", v374, v62));

                      if (v81)
                      {
                        v63 = v81;
                      }
                      else
                      {
                        v111 = (void *)MEMORY[0x18D76B4E4]();
                        v112 = __ckLoggingOverride;
                        v113 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Error attempting to read CKAsset file: %@"));
                        _NSCoreDataLog(v112 != 0, v113, v114, v115, v116, v117, v118, v119, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                        objc_autoreleasePoolPop(v111);
                        v63 = 0;
                      }
                    }
                    else
                    {
                      getCloudKitCKEncryptedDataClass[0]();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {

                        v87 = (id)objc_msgSend(v62, "data");
                        v88 = (void *)MEMORY[0x18D76B4E4]();
                        v89 = __ckLoggingOverride;
                        v90 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ encountered CKEncryptedData blob on record (%@): %@"));
                        _NSCoreDataLog(v89 != 0, v90, v91, v92, v93, v94, v95, v96, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                        v63 = v87;
                        objc_autoreleasePoolPop(v88);
                      }
                      else if ((objc_msgSend(v62, "isNSData") & 1) == 0)
                      {
                        v98 = (void *)MEMORY[0x18D76B4E4]();
                        v99 = __ckLoggingOverride != 0;
                        v100 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unknown value class (%@) for attribute:\n%@"));
                        objc_opt_class();
                        _NSCoreDataLog(v99, v100, v101, v102, v103, v104, v105, v106, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                        objc_autoreleasePoolPop(v98);

                        v63 = 0;
                      }
                    }
                    if (objc_msgSend(v56, "attributeType") == 1800 || objc_msgSend(v56, "attributeType") == 2100)
                    {
                      v120 = +[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v63, v56);

                      v63 = v120;
                    }
                  }
LABEL_143:
                  v131 = *(_QWORD *)(v374 + 48);
                  v132 = -[NSManagedObject objectID](v375, "objectID");
                  if (v131
                    && (objc_msgSend((id)objc_msgSend(*(id *)(v131 + 48), "objectForKey:", v132), "containsObject:", v57) & 1) != 0)
                  {
                    v133 = objc_msgSend(v56, "usesMergeableStorage");
                    v134 = (void *)MEMORY[0x18D76B4E4]();
                    if (v133)
                    {
                      objc_msgSend(v63, "merge:", -[NSManagedObject valueForKey:](v375, "valueForKey:", v57));
                      v135 = objc_msgSend(v63, "copy");

                      -[NSManagedObject setValue:forKey:](v375, "setValue:forKey:", v135, v57);
                      objc_autoreleasePoolPop(v134);
                      v110 = v361;
                      v63 = (id)v135;
                      goto LABEL_153;
                    }
                    if ((unint64_t)__ckLoggingOverride >= 0x10)
                      v136 = 16;
                    else
                      v136 = __ckLoggingOverride;
                    v137 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Importer is rejecting updated value for '%@' on '%@' because there are pending local edits that haven't been exported yet."));
                    -[NSManagedObject objectID](v375, "objectID");
                    _NSCoreDataLog(v136, v137, v138, v139, v140, v141, v142, v143, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                    objc_autoreleasePoolPop(v134);
                  }
                  else
                  {
                    -[NSManagedObject setValue:forKey:](v375, "setValue:forKey:", v63, v57);
                  }
                  v110 = v361;
LABEL_153:

                  if ((v110 & 1) == 0)
                  {
                    v49 = v355;
                    if (!v420)
                    {
                      v191 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attribute serialization failed but did not set an error: %@.%@");
                      v192 = objc_msgSend((id)objc_msgSend(v56, "entity"), "name");
                      objc_msgSend(v56, "name");
                      _NSCoreDataLog(17, v191, v193, v194, v195, v196, v197, v198, v192);
                      v199 = __pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        v262 = objc_msgSend((id)objc_msgSend(v56, "entity"), "name");
                        v263 = objc_msgSend(v56, "name");
                        *(_DWORD *)buf = 138412546;
                        *(_QWORD *)&buf[4] = v262;
                        v429 = 2112;
                        v430 = (NSManagedObject *)v263;
                        _os_log_fault_impl(&dword_18A253000, v199, OS_LOG_TYPE_FAULT, "CoreData: Attribute serialization failed but did not set an error: %@.%@", buf, 0x16u);
                      }
                    }
LABEL_184:
                    if ((v361 & 1) != 0)
                    {
LABEL_185:
                      v200 = v372;
                      if (!v372)
                        v200 = -[NSDictionary allValues](-[NSEntityDescription relationshipsByName](-[NSManagedObject entity](v375, "entity"), "relationshipsByName"), "allValues");
                      v414 = 0u;
                      v415 = 0u;
                      v412 = 0u;
                      v413 = 0u;
                      v373 = v200;
                      v201 = -[NSArray countByEnumeratingWithState:objects:count:](v200, "countByEnumeratingWithState:objects:count:", &v412, v427, 16);
                      if (v201)
                      {
                        v202 = *(_QWORD *)v413;
                        do
                        {
                          for (i = 0; i != v201; ++i)
                          {
                            if (*(_QWORD *)v413 != v202)
                              objc_enumerationMutation(v373);
                            v204 = *(void **)(*((_QWORD *)&v412 + 1) + 8 * i);
                            if ((!objc_msgSend(v204, "isToMany")
                               || (objc_msgSend((id)objc_msgSend(v204, "inverseRelationship"), "isToMany") & 1) == 0)
                              && (objc_msgSend(v204, "isToMany") & 1) == 0)
                            {
                              v205 = *(_QWORD *)(v374 + 48);
                              v206 = objc_msgSend(v204, "name");
                              v207 = -[NSManagedObject objectID](v375, "objectID");
                              if (v205
                                && (objc_msgSend((id)objc_msgSend(*(id *)(v205 + 48), "objectForKey:", v207), "containsObject:", v206) & 1) != 0)
                              {
                                v208 = (void *)MEMORY[0x18D76B4E4]();
                                if ((unint64_t)__ckLoggingOverride >= 0x10)
                                  v209 = 16;
                                else
                                  v209 = __ckLoggingOverride;
                                v210 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Importer is rejecting updated value for '%@' on '%@' because there are pending local edits that haven't been exported yet."));
                                objc_msgSend(v204, "name");
                                -[NSManagedObject objectID](v375, "objectID");
                                _NSCoreDataLog(v209, v210, v211, v212, v213, v214, v215, v216, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                                objc_autoreleasePoolPop(v208);
                              }
                              else
                              {
                                v217 = objc_msgSend(v204, "name");
                                v218 = (void *)v217;
                                if (v368)
                                {
                                  objc_opt_self();
                                  v218 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v217);
                                }
                                v219 = objc_msgSend(*(id *)(v374 + 24), "useDeviceToDeviceEncryption");
                                v220 = v371;
                                if (v219)
                                {
                                  v221 = objc_msgSend(v218, "hasSuffix:", CFSTR("_ckAsset"));
                                  v220 = v371;
                                  if ((v221 & 1) == 0)
                                    v220 = (void *)objc_msgSend(v371, "encryptedValues");
                                }
                                v222 = objc_msgSend(v220, "objectForKey:", v218);
                                if (v222)
                                {
                                  v223 = (void *)-[NSCKRecordMetadata createRecordID](v367);
                                  v224 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", v222, objc_msgSend(v223, "zoneID"));
                                  v225 = (void *)MEMORY[0x18D76B4E4]();
                                  if ((unint64_t)__ckLoggingOverride >= 9)
                                    v226 = 9;
                                  else
                                    v226 = __ckLoggingOverride;
                                  v227 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Adding mirrored relationship to link for record %@ related to %@ by %@"));
                                  objc_msgSend(v204, "name");
                                  _NSCoreDataLog(v226, v227, v228, v229, v230, v231, v232, v233, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                                  objc_autoreleasePoolPop(v225);
                                  v234 = +[PFMirroredRelationship mirroredRelationshipWithManagedObject:withRecordID:relatedToObjectWithRecordID:byRelationship:]((uint64_t)PFMirroredRelationship, (uint64_t)v375, (uint64_t)v223, (uint64_t)v224, (uint64_t)v204);
                                  -[PFCloudKitImportZoneContext addMirroredRelationshipToLink:](v370, v234);

                                }
                                else if ((objc_msgSend(v204, "isTransient") & 1) == 0)
                                {
                                  -[NSManagedObject setValue:forKey:](v375, "setValue:forKey:", 0, v217);
                                }
                              }
                            }
                          }
                          v201 = -[NSArray countByEnumeratingWithState:objects:count:](v373, "countByEnumeratingWithState:objects:count:", &v412, v427, 16);
                        }
                        while (v201);
                      }
                      goto LABEL_221;
                    }
LABEL_216:
                    if (v420)
                    {
                      *(_QWORD *)(v49 + 40) = v420;
                    }
                    else
                    {
                      v235 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                      _NSCoreDataLog(17, v235, v236, v237, v238, v239, v240, v241, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
                      v242 = __pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 136315394;
                        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
                        v429 = 1024;
                        LODWORD(v430) = 1511;
                        _os_log_fault_impl(&dword_18A253000, v242, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                      }
                    }
LABEL_220:
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
                    v243 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
                    goto LABEL_221;
                  }
                  v45 = v364;
LABEL_155:
                  if (v53 == ++v55)
                  {
                    v190 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v416, v431, 16);
                    v53 = v190;
                    if (!v190)
                    {
                      v49 = v355;
                      goto LABEL_184;
                    }
                    continue;
                  }
                  goto LABEL_69;
                }
                break;
              }
              if (objc_msgSend(v56, "attributeType") == 1100)
              {

                v97 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v62);
                if (v97)
                  goto LABEL_119;
                v155 = (void *)MEMORY[0x18D76B4E4]();
                v156 = __ckLoggingOverride;
                v157 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to initialize NSUUID from CKRecord with value: %@\n%@"));
                _NSCoreDataLog(v156 != 0, v157, v158, v159, v160, v161, v162, v163, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                goto LABEL_167;
              }
              if (objc_msgSend(v56, "attributeType") != 700 && objc_msgSend(v56, "attributeType") != 1200)
                goto LABEL_143;
              getCloudKitCKAssetClass[0]();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (objc_msgSend(v56, "attributeType") != 1200)
                  goto LABEL_143;

                v97 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v62);
                if (v97)
                {
LABEL_119:
                  v63 = (id)v97;
                  goto LABEL_143;
                }
                v155 = (void *)MEMORY[0x18D76B4E4]();
                v164 = __ckLoggingOverride;
                v165 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to initialize NSURL from CKRecord with value: %@\n%@"));
                _NSCoreDataLog(v164 != 0, v165, v166, v167, v168, v169, v170, v171, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
LABEL_167:
                v63 = 0;
                objc_autoreleasePoolPop(v155);
                goto LABEL_143;
              }
              v144 = objc_msgSend(v369, "cloudKitSerializer:safeSaveURLForAsset:", v374, v62);
              if (!v144)
              {
                v145 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Delegate didn't return a file url for asset: %@");
                _NSCoreDataLog(17, v145, v146, v147, v148, v149, v150, v151, (uint64_t)v62);
                v152 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v62;
                  _os_log_fault_impl(&dword_18A253000, v152, OS_LOG_TYPE_FAULT, "CoreData: Delegate didn't return a file url for asset: %@", buf, 0xCu);
                }
              }
              v153 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfURL:encoding:error:", v144, 4, &v420);
              if (v153)
              {
                if (objc_msgSend(v56, "attributeType") == 700)
                {

                  v154 = v153;
                  goto LABEL_174;
                }
                if (objc_msgSend(v56, "attributeType") == 1200)
                {

                  v154 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v153);
                  if (v154)
                  {
LABEL_174:
                    v63 = v154;
                  }
                  else
                  {
                    v181 = (void *)MEMORY[0x18D76B4E4]();
                    v182 = __ckLoggingOverride;
                    v183 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to initialize NSURL from CKAsset with value: %@\n%@"));
                    _NSCoreDataLog(v182 != 0, v183, v184, v185, v186, v187, v188, v189, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                    v63 = 0;
                    objc_autoreleasePoolPop(v181);
                  }
                }
              }
              else
              {
                v172 = (void *)MEMORY[0x18D76B4E4]();
                v173 = __ckLoggingOverride;
                v174 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to read value from asset at URL: %@\n%@"));
                _NSCoreDataLog(v173 != 0, v174, v175, v176, v177, v178, v179, v180, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                objc_autoreleasePoolPop(v172);
                v361 = 0;
              }

              goto LABEL_143;
            }
LABEL_221:
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
            {
              v244 = *(_QWORD *)(v376 + 40);
              if (v244)
              {
                v245 = v371;
                if (objc_msgSend(*(id *)(v244 + 24), "useDeviceToDeviceEncryption"))
                  v245 = (void *)objc_msgSend(v371, "encryptedValueStore");
              }
              else
              {
                v245 = 0;
              }
              objc_opt_self();
              v246 = (id)objc_msgSend(v245, "objectForKey:", objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", CFSTR("moveReceipt")));
              if (v246)
              {
LABEL_226:
                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24)
                  && (-[NSManagedObject mergeMoveReceiptsWithData:error:](v367, "mergeMoveReceiptsWithData:error:", v246, *(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40) & 1) == 0)
                {
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
                  v247 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
                }
              }
              else
              {
                objc_opt_self();
                v248 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", CFSTR("moveReceipt"));
                objc_opt_self();
                v249 = objc_msgSend(v371, "objectForKey:", objc_msgSend(v248, "stringByAppendingString:", CFSTR("_ckAsset")));
                if (v249)
                {
                  v250 = objc_msgSend(WeakRetained, "cloudKitSerializer:safeSaveURLForAsset:", *(_QWORD *)(v376 + 40), v249);
                  v246 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v250, 0, *(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
                  if (v246)
                    goto LABEL_226;
                  v251 = (void *)MEMORY[0x18D76B4E4]();
                  v252 = __ckLoggingOverride;
                  v253 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Error attempting to read move receipt CKAsset file: %@"));
                  _NSCoreDataLog(v252 != 0, v253, v254, v255, v256, v257, v258, v259, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
                  objc_autoreleasePoolPop(v251);
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
                  v260 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
                }
                v246 = 0;
              }

            }
          }
          else
          {
            v19 = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 3)
              v20 = 3;
            else
              v20 = __ckLoggingOverride;
            v21 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping record because its entity '%@' is no longer in the managed object model's configured entities: %@\n%@"));
            objc_msgSend(v360, "allKeys");
            _NSCoreDataLog(v20, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
            objc_autoreleasePoolPop(v19);
          }
LABEL_234:
          v261 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24);
          objc_autoreleasePoolPop(context);
          if (!v261)
            goto LABEL_241;
          ++v366;
        }
        while (v366 != v359);
        v264 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v407, v426, 16);
        v359 = v264;
      }
      while (v264);
    }
LABEL_241:
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
    {
      v265 = (void *)MEMORY[0x18D76B4E4]();
      v405 = 0u;
      v406 = 0u;
      v403 = 0u;
      v404 = 0u;
      if (v354)
        v266 = *(void **)(v370 + 24);
      else
        v266 = 0;
      v267 = objc_msgSend(v266, "countByEnumeratingWithState:objects:count:", &v403, v425, 16);
      if (v267)
      {
        v268 = *(_QWORD *)v404;
        do
        {
          for (j = 0; j != v267; ++j)
          {
            if (*(_QWORD *)v404 != v268)
              objc_enumerationMutation(v266);
            objc_msgSend(*(id *)(v376 + 32), "deleteObject:", objc_msgSend(*(id *)(v376 + 32), "objectWithID:", *(_QWORD *)(*((_QWORD *)&v403 + 1) + 8 * j)));
          }
          v267 = objc_msgSend(v266, "countByEnumeratingWithState:objects:count:", &v403, v425, 16);
        }
        while (v267);
      }
      objc_autoreleasePoolPop(v265);
      v270 = v370 ? *(void **)(v370 + 24) : 0;
      v271 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, objc_msgSend(v270, "allObjects"), *(_QWORD *)(v376 + 48), *(void **)(v376 + 32), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40));
      v272 = v271;
      if (v271)
      {
        v401 = 0u;
        v402 = 0u;
        v399 = 0u;
        v400 = 0u;
        v273 = objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v399, v424, 16);
        if (v273)
        {
          v274 = *(_QWORD *)v400;
          do
          {
            for (k = 0; k != v273; ++k)
            {
              if (*(_QWORD *)v400 != v274)
                objc_enumerationMutation(v272);
              objc_msgSend(*(id *)(v376 + 32), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v399 + 1) + 8 * k));
            }
            v273 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v399, v424, 16);
          }
          while (v273);
        }
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
        v314 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
      {
        v397 = 0u;
        v398 = 0u;
        v395 = 0u;
        v396 = 0u;
        v315 = v370 ? *(void **)(v370 + 112) : 0;
        v316 = objc_msgSend(v315, "countByEnumeratingWithState:objects:count:", &v395, v423, 16);
        if (v316)
        {
          v317 = *(_QWORD *)v396;
          while (2)
          {
            for (m = 0; m != v316; ++m)
            {
              if (*(_QWORD *)v396 != v317)
                objc_enumerationMutation(v315);
              v319 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)objc_msgSend(*(id *)(*((_QWORD *)&v395 + 1) + 8 * m), "zoneID"), objc_msgSend(*(id *)(*(_QWORD *)(v376 + 40) + 24), "databaseScope"), *(_QWORD *)(v376 + 48), *(void **)(v376 + 32), *(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
              if (!v319)
              {
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
                v320 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
                goto LABEL_263;
              }
              -[NSManagedObject setEncodedShareData:](v319, "setEncodedShareData:", 0);
            }
            v316 = objc_msgSend(v315, "countByEnumeratingWithState:objects:count:", &v395, v423, 16);
            if (v316)
              continue;
            break;
          }
        }
      }
    }
  }
  else
  {
    v276 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
  }
LABEL_263:
  v277 = *(_QWORD *)(v376 + 96);
  if (!*(_BYTE *)(*(_QWORD *)(v277 + 8) + 24))
    goto LABEL_270;
  v278 = -[PFCloudKitImportZoneContext linkInsertedObjectsAndMetadataInContext:error:](v370, *(void **)(v376 + 32), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40));
  v279 = v376;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = v278;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(v376 + 32), "hasChanges"))
      **(_BYTE **)(v376 + 104) = 1;
    v280 = objc_msgSend(*(id *)(v376 + 32), "save:", *(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
    v277 = *(_QWORD *)(v376 + 96);
    if ((v280 & 1) != 0)
      goto LABEL_270;
    *(_BYTE *)(*(_QWORD *)(v277 + 8) + 24) = 0;
    v279 = v376;
  }
  v281 = *(id *)(*(_QWORD *)(*(_QWORD *)(v279 + 88) + 8) + 40);
  v277 = *(_QWORD *)(v376 + 96);
LABEL_270:
  if (*(_BYTE *)(*(_QWORD *)(v277 + 8) + 24))
  {
    v282 = v370 ? *(void **)(v370 + 48) : 0;
    v394[0] = MEMORY[0x1E0C809B0];
    v394[1] = 3221225472;
    v394[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2_61;
    v394[3] = &unk_1E1EE08D8;
    v283 = *(_QWORD *)(v376 + 32);
    v284 = *(_QWORD *)(v376 + 40);
    v394[4] = v370;
    v394[5] = v283;
    v394[6] = WeakRetained;
    v394[7] = v284;
    objc_msgSend(v282, "enumerateObjectsUsingBlock:", v394);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
    {
      if (!-[PFCloudKitImportZoneContext populateUnresolvedIDsInStore:withManagedObjectContext:error:](v370, *(_QWORD *)(v376 + 48), *(void **)(v376 + 32), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40)))goto LABEL_354;
      if (v370)
        v285 = (id)objc_msgSend(*(id *)(v370 + 40), "copy");
      else
        v285 = 0;
      v388[0] = MEMORY[0x1E0C809B0];
      v388[1] = 3221225472;
      v388[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_3;
      v388[3] = &unk_1E1EE0900;
      v389 = *(_OWORD *)(v376 + 40);
      v286 = *(_QWORD *)(v376 + 32);
      v393 = vextq_s8(*(int8x16_t *)(v376 + 88), *(int8x16_t *)(v376 + 88), 8uLL);
      v390 = v286;
      v391 = v370;
      v392 = WeakRetained;
      objc_msgSend(v285, "enumerateObjectsUsingBlock:", v388);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
      {
        if (objc_msgSend(*(id *)(v376 + 32), "hasChanges"))
        {
          **(_BYTE **)(v376 + 104) = 1;
          if ((objc_msgSend(*(id *)(v376 + 32), "save:", *(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40) & 1) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
            v287 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
          }
        }
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
      {
        v288 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKImportPendingRelationship entityPath]());
        -[NSFetchRequest setFetchBatchSize:](v288, "setFetchBatchSize:", 200);
        -[NSFetchRequest setReturnsObjectsAsFaults:](v288, "setReturnsObjectsAsFaults:", 0);
        v289 = *(void **)(v376 + 32);
        v385[0] = MEMORY[0x1E0C809B0];
        v385[1] = 3221225472;
        v385[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_72;
        v385[3] = &unk_1E1EE0928;
        v385[4] = v289;
        v385[5] = v370;
        v290 = *(_QWORD *)(v376 + 48);
        v386 = vextq_s8(*(int8x16_t *)(v376 + 88), *(int8x16_t *)(v376 + 88), 8uLL);
        v385[6] = v290;
        v385[7] = v356;
        v387 = *(_QWORD *)(v376 + 104);
        +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v288, v289, (uint64_t)v385);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
        {
          v291 = (void *)+[NSCKMirroredRelationship fetchPendingMirroredRelationshipsInStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, *(_QWORD *)(v376 + 48), *(void **)(v376 + 32), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40));
          v292 = v291;
          if (v291)
          {
            v383 = 0u;
            v384 = 0u;
            v381 = 0u;
            v382 = 0u;
            v293 = objc_msgSend(v291, "countByEnumeratingWithState:objects:count:", &v381, v422, 16);
            if (v293)
            {
              v294 = *(_QWORD *)v382;
              do
              {
                v295 = 0;
                do
                {
                  if (*(_QWORD *)v382 != v294)
                    objc_enumerationMutation(v292);
                  v296 = *(void **)(*((_QWORD *)&v381 + 1) + 8 * v295);
                  v297 = -[NSCKMirroredRelationship createRecordIDForRecord](v296);
                  v298 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v296);
                  v299 = objc_msgSend(v296, "cdEntityName");
                  if (v370)
                    v300 = objc_msgSend((id)objc_msgSend(*(id *)(v370 + 64), "objectForKey:", v299), "objectForKey:", v297);
                  else
                    v300 = 0;
                  v301 = objc_msgSend(v296, "relatedEntityName");
                  if (v370)
                    v302 = objc_msgSend((id)objc_msgSend(*(id *)(v370 + 64), "objectForKey:", v301), "objectForKey:", v298);
                  else
                    v302 = 0;

                  if (v300 && v302)
                  {
                    *(_QWORD *)buf = 0;
                    if (-[NSCKMirroredRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:isDelete:error:]((_BOOL8)v296, v370, *(void **)(v376 + 32), objc_msgSend((id)objc_msgSend(v296, "needsDelete"), "BOOLValue"), (uint64_t *)buf))
                    {
                      goto LABEL_296;
                    }
                    v303 = (void *)MEMORY[0x18D76B4E4]();
                    v304 = __ckLoggingOverride;
                    v305 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to resolve pending relationship: %@\n%@"));
                    if (v304 >= 9)
                      v312 = 9;
                    else
                      v312 = v304;
                    _NSCoreDataLog(v312, v305, v306, v307, v308, v309, v310, v311, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
                    objc_autoreleasePoolPop(v303);
                  }
                  else if (objc_msgSend((id)objc_msgSend(v296, "needsDelete"), "BOOLValue"))
                  {
LABEL_296:
                    objc_msgSend(v296, "setIsPending:", MEMORY[0x1E0C9AAA0]);
                  }
                  ++v295;
                }
                while (v293 != v295);
                v313 = objc_msgSend(v292, "countByEnumeratingWithState:objects:count:", &v381, v422, 16);
                v293 = v313;
              }
              while (v313);
            }
          }
          else
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
            v321 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
          }
        }
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
      {
        v379 = 0u;
        v380 = 0u;
        v377 = 0u;
        v378 = 0u;
        v322 = v370 ? *(void **)(v370 + 48) : 0;
        v323 = objc_msgSend(v322, "countByEnumeratingWithState:objects:count:", &v377, v421, 16);
        if (v323)
        {
          v324 = *(_QWORD *)v378;
          v325 = *MEMORY[0x1E0CB28A8];
          v326 = MEMORY[0x1E0C9AAB0];
          do
          {
            for (n = 0; n != v323; ++n)
            {
              if (*(_QWORD *)v378 != v324)
                objc_enumerationMutation(v322);
              v328 = *(_QWORD *)(*((_QWORD *)&v377 + 1) + 8 * n);
              v329 = +[NSCKMirroredRelationship mirroredRelationshipForManyToMany:inStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, v328, *(_QWORD *)(v376 + 48), *(void **)(v376 + 32), *(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
              v330 = v329;
              if (v329)
              {
                objc_msgSend(v329, "setNeedsDelete:", v326);
                *(_QWORD *)buf = 0;
                if (!-[NSCKMirroredRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:isDelete:error:]((_BOOL8)v330, v370, *(void **)(v376 + 32), 1, (uint64_t *)buf))
                {
                  if (objc_msgSend((id)objc_msgSend(*(id *)buf, "domain"), "isEqualToString:", v325)
                    && (objc_msgSend(*(id *)buf, "code") == 134412 || objc_msgSend(*(id *)buf, "code") == 134413))
                  {
                    v331 = (void *)MEMORY[0x18D76B4E4]();
                    v332 = __ckLoggingOverride;
                    v333 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Marking deleted mirrored relationship fulfilled, one or more of the related objects is missing: %@"));
                    if (v332 >= 9)
                      v340 = 9;
                    else
                      v340 = v332;
                    _NSCoreDataLog(v340, v333, v334, v335, v336, v337, v338, v339, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
                    objc_autoreleasePoolPop(v331);
                    objc_msgSend(v330, "setNeedsDelete:", v326);
                    objc_msgSend(v330, "setIsPending:", MEMORY[0x1E0C9AAA0]);
                  }
                  else
                  {
                    objc_msgSend(v330, "setIsPending:", v326);
                    v342 = (void *)MEMORY[0x18D76B4E4](objc_msgSend(WeakRetained, "cloudKitSerializer:failedToUpdateRelationship:withError:", *(_QWORD *)(v376 + 40), v328, *(_QWORD *)buf));
                    v343 = __ckLoggingOverride;
                    v344 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to update deleted mirrored relationship: %@\n%@"));
                    if (v343 >= 0x10)
                      v351 = 16;
                    else
                      v351 = v343;
                    _NSCoreDataLog(v351, v344, v345, v346, v347, v348, v349, v350, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
                    objc_autoreleasePoolPop(v342);
                  }
                }
              }
              else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40))
              {
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
                v341 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
              }
            }
            v323 = objc_msgSend(v322, "countByEnumeratingWithState:objects:count:", &v377, v421, 16);
          }
          while (v323);
        }
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24))
      {
        v352 = v370 ? *(void **)(v370 + 56) : 0;
        if ((+[NSCKMirroredRelationship purgeMirroredRelationshipsWithRecordIDs:fromStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, (void *)objc_msgSend(v352, "allObjects"), *(_QWORD *)(v376 + 48), *(void **)(v376 + 32), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40)) & 1) == 0)
        {
LABEL_354:
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v376 + 96) + 8) + 24) = 0;
          v353 = *(id *)(*(_QWORD *)(*(_QWORD *)(v376 + 88) + 8) + 40);
        }
      }
    }
  }

}

uint64_t __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a2, objc_msgSend(a2, "name"));
}

void __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2_61(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = 0;
  if ((objc_msgSend(a2, "updateRelationshipValueUsingImportContext:andManagedObjectContext:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &v22) & 1) == 0)
  {
    v4 = (void *)objc_msgSend(v22, "domain");
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8])
      && (objc_msgSend(v22, "code") == 134412 || objc_msgSend(v22, "code") == 134413))
    {
      v5 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v6 = 16;
      else
        v6 = __ckLoggingOverride;
      v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Deleted relationship failed to update because one or more of the objects in it is already gone: %@"));
      _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
    }
    else
    {
      v5 = (void *)MEMORY[0x18D76B4E4](objc_msgSend(*(id *)(a1 + 48), "cloudKitSerializer:failedToUpdateRelationship:withError:", *(_QWORD *)(a1 + 56), a2, v22));
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v14 = 16;
      else
        v14 = __ckLoggingOverride;
      v15 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to update deleted mirrored relationship: %@\n%@"));
      _NSCoreDataLog(v14, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
    }
    objc_autoreleasePoolPop(v5);
  }
}

uint64_t __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSManagedObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSManagedObject *v20;
  uint64_t result;
  uint64_t v22;
  NSManagedObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSManagedObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  v4 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 9)
    v5 = 9;
  else
    v5 = __ckLoggingOverride;
  v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Updating relationship: %@"));
  _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_3");
  objc_autoreleasePoolPop(v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a2)
    {
      v13 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, objc_msgSend(*(id *)(a2 + 48), "recordName"), objc_msgSend(*(id *)(a2 + 56), "recordName"), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
      v14 = *(void **)(a2 + 32);
    }
    else
    {
      v13 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, objc_msgSend(0, "recordName"), objc_msgSend(0, "recordName"), 0, 0);
      v14 = 0;
    }
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v16 = objc_msgSend(v14, "zoneID");
    if (!v15
      || (v17 = (NSManagedObject *)objc_msgSend((id)objc_msgSend(*(id *)(v15 + 32), "objectForKey:", v16), "objectForKey:", v13)) == 0)
    {
      v23 = (NSManagedObject *)+[NSCKMirroredRelationship mirroredRelationshipForManyToMany:inStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, a2, *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v42);
      v24 = v42;
      if (v42)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        result = v24;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = result;
        return result;
      }
      v17 = v23;
      if (!v23)
      {
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
        if (a2)
          v26 = *(void **)(a2 + 48);
        else
          v26 = 0;
        v27 = objc_msgSend(v26, "zoneID");
        if (!v25 || (v28 = objc_msgSend(*(id *)(v25 + 8), "objectForKey:", v27)) == 0)
        {
          if (a2)
            v29 = *(void **)(a2 + 48);
          else
            v29 = 0;
          v30 = (void *)objc_msgSend(v29, "zoneID");
          v31 = *(_QWORD *)(a1 + 56);
          if (v31)
            v32 = *(void **)(v31 + 96);
          else
            v32 = 0;
          v33 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v30, objc_msgSend(v32, "databaseScope"), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v42);
          if (v33)
          {
            v28 = (uint64_t)v33;
            -[PFCloudKitMetadataCache cacheZoneMetadata:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v33);
          }
          else
          {
            v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Need to handle fetch errors here for the zone and abort serialization. %@");
            _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)v42);
            v41 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = (uint64_t)v42;
              _os_log_fault_impl(&dword_18A253000, v41, OS_LOG_TYPE_FAULT, "CoreData: Need to handle fetch errors here for the zone and abort serialization. %@", buf, 0xCu);
            }
            v28 = 0;
          }
        }
        v17 = +[NSCKMirroredRelationship insertMirroredRelationshipForManyToMany:inZoneWithMetadata:inStore:withManagedObjectContext:]((uint64_t)NSCKMirroredRelationship, a2, v28, *(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
      }
    }
    if (objc_msgSend((id)a2, "updateRelationshipValueUsingImportContext:andManagedObjectContext:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), &v42))
    {
      v18 = MEMORY[0x1E0C9AAA0];
      -[NSManagedObject setIsPending:](v17, "setIsPending:", MEMORY[0x1E0C9AAA0]);
      -[NSManagedObject setNeedsDelete:](v17, "setNeedsDelete:", v18);
      v19 = MEMORY[0x1E0C9AAB0];
      v20 = v17;
    }
    else
    {
      v22 = MEMORY[0x1E0C9AAB0];
      -[NSManagedObject setIsPending:](v17, "setIsPending:", MEMORY[0x1E0C9AAB0]);
      -[NSManagedObject setNeedsDelete:](v17, "setNeedsDelete:", MEMORY[0x1E0C9AAA0]);
      v20 = v17;
      v19 = v22;
    }
    return -[NSManagedObject setIsUploaded:](v20, "setIsUploaded:", v19);
  }
  else
  {
    result = objc_msgSend((id)a2, "updateRelationshipValueUsingImportContext:andManagedObjectContext:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), &v42);
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 64), "cloudKitSerializer:failedToUpdateRelationship:withError:", *(_QWORD *)(a1 + 32), a2, v42);
  }
  return result;
}

uint64_t __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_72(uint64_t a1, void *a2, void *a3, _BYTE *a4, _BYTE *a5)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  PFMirroredManyToManyRelationship *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  PFMirroredOneToManyRelationship *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t result;
  void *v98;
  _BOOL8 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *context;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[2];
  _QWORD v131[2];
  _BYTE buf[12];
  __int16 v133;
  void *v134;
  __int16 v135;
  void *v136;
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = result;
    return result;
  }
  v6 = a2;
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v126, v138, 16);
  if (!v7)
    goto LABEL_83;
  v8 = v7;
  v113 = *(_QWORD *)v127;
  v109 = *MEMORY[0x1E0CB28A8];
  v110 = v6;
  do
  {
    v9 = 0;
    v111 = v8;
    do
    {
      if (*(_QWORD *)v127 != v113)
        objc_enumerationMutation(v6);
      v115 = v9;
      v10 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v9);
      context = (void *)MEMORY[0x18D76B4E4]();
      v114 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", objc_msgSend(v10, "cdEntityName")), "relationshipsByName"), "objectForKey:", objc_msgSend(v10, "relationshipName"));
      v11 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(v10, "recordZoneName"), objc_msgSend(v10, "recordZoneOwnerName"));
      v12 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v10, "recordName"), v11);
      v13 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(v10, "relatedRecordZoneName"), objc_msgSend(v10, "relatedRecordZoneOwnerName"));
      v120 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v10, "relatedRecordName"), v13);
      v117 = (void *)v13;
      if ((objc_msgSend(v11, "isEqual:", v13) & 1) == 0)
      {
        v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Import is attempting to link objects across zones: %@");
        _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)v10);
        v21 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v10;
          _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Import is attempting to link objects across zones: %@", buf, 0xCu);
        }
      }
      v118 = v11;
      v22 = a1;
      v23 = *(_QWORD *)(a1 + 40);
      v119 = v10;
      v24 = objc_msgSend(v10, "cdEntityName");
      if (v23)
        v25 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v23 + 64), "objectForKey:", v24), "objectForKey:", v12);
      else
        v25 = 0;
      v26 = *(_QWORD *)(a1 + 40);
      v27 = objc_msgSend(v119, "relatedEntityName");
      if (v26)
      {
        v28 = objc_msgSend((id)objc_msgSend(*(id *)(v26 + 64), "objectForKey:", v27), "objectForKey:", v120);
        v29 = (void *)v28;
        if (v25 && v28)
          goto LABEL_41;
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v31 = v30;
        if (v25)
        {
          if (v29)
            goto LABEL_20;
        }
        else
        {
          objc_msgSend(v30, "addObject:", v12);
          if (v29)
            goto LABEL_20;
        }
      }
      else
      {
        v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (v25)
        {
          v22 = a1;
          v31 = v95;
        }
        else
        {
          v31 = v95;
          objc_msgSend(v95, "addObject:", v12);
          v22 = a1;
        }
      }
      objc_msgSend(v31, "addObject:", v120);
      v29 = 0;
LABEL_20:
      v125 = 0;
      v112 = v31;
      v32 = +[NSCKRecordMetadata metadataForRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, v31, *(void **)(v22 + 48), *(void **)(v22 + 32), &v125);
      if (!v32)
      {
        v98 = (void *)MEMORY[0x18D76B4E4]();
        v99 = __ckLoggingOverride != 0;
        v100 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Pending relationship Fallback fetch failed (%@ / %@): %@"));
        _NSCoreDataLog(v99, v100, v101, v102, v103, v104, v105, v106, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
        objc_autoreleasePoolPop(v98);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v125;
        *a4 = 1;

        objc_autoreleasePoolPop(context);
        goto LABEL_83;
      }
      v33 = v32;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v122;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v122 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
            v39 = (void *)-[NSCKRecordMetadata createRecordID](v38);
            if (objc_msgSend(v39, "isEqual:", v12))
            {
              v25 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v38);
              v40 = *(_QWORD *)(a1 + 40);
              if (v40)
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](v40, v25, *(void **)(v40 + 64), (uint64_t)v39);

            }
            else if (objc_msgSend(v39, "isEqual:", v120))
            {
              v29 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v38);
              v41 = *(_QWORD *)(a1 + 40);
              if (v41)
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](v41, v29, *(void **)(v41 + 64), (uint64_t)v39);

            }
            else
            {
              v42 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown recordID returned as part of fetch for missing pending relationship objectIDs: %@ - %@ - %@");
              _NSCoreDataLog(17, v42, v43, v44, v45, v46, v47, v48, (uint64_t)v39);
              v49 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v39;
                v133 = 2112;
                v134 = v33;
                v135 = 2112;
                v136 = v119;
                _os_log_fault_impl(&dword_18A253000, v49, OS_LOG_TYPE_FAULT, "CoreData: Unknown recordID returned as part of fetch for missing pending relationship objectIDs: %@ - %@ - %@", buf, 0x20u);
              }
            }

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
        }
        while (v35);

        v6 = v110;
        v8 = v111;
      }
      else
      {

      }
      v22 = a1;
      if (!v25)
      {
LABEL_46:
        v55 = (void *)MEMORY[0x18D76B4E4]();
        if ((unint64_t)__ckLoggingOverride >= 9)
          v56 = 9;
        else
          v56 = __ckLoggingOverride;
        v57 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to find matching objectIDs for %@ / %@ in pending relationship: %@"));
        objc_msgSend(v119, "objectID");
        _NSCoreDataLog(v56, v57, v58, v59, v60, v61, v62, v63, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
        objc_autoreleasePoolPop(v55);

        v65 = v115;
        v64 = context;
        goto LABEL_73;
      }
LABEL_41:
      if (!v29)
        goto LABEL_46;
      if (objc_msgSend(v114, "isToMany")
        && objc_msgSend((id)objc_msgSend(v114, "inverseRelationship"), "isToMany"))
      {
        v131[0] = objc_msgSend(v119, "recordName");
        v131[1] = objc_msgSend(v119, "relatedRecordName");
        v50 = +[PFMirroredManyToManyRelationship ckRecordNameForOrderedRecordNames:]((uint64_t)PFMirroredManyToManyRelationship, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2));
        v130[0] = v114;
        v130[1] = objc_msgSend(v114, "inverseRelationship");
        v51 = +[PFMirroredManyToManyRelationship ckRecordTypeForOrderedRelationships:]((uint64_t)PFMirroredManyToManyRelationship, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2));
        v52 = v118;
        v53 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", v50, v118);
        if (objc_msgSend(v119, "needsDelete"))
          v54 = +[PFMirroredRelationship mirroredRelationshipWithDeletedRecordType:recordID:andManagedObjectModel:]((uint64_t)PFMirroredRelationship, v51, (uint64_t)v53, *(_QWORD *)(a1 + 56));
        else
          v54 = -[PFMirroredManyToManyRelationship initWithRecordID:recordType:managedObjectModel:andType:]([PFMirroredManyToManyRelationship alloc], "initWithRecordID:recordType:managedObjectModel:andType:", v53, v51, *(_QWORD *)(a1 + 56), 0);
        v67 = (PFMirroredOneToManyRelationship *)v54;

        v6 = v110;
        v8 = v111;
        v22 = a1;
      }
      else
      {
        *(_QWORD *)buf = 0;
        v66 = objc_msgSend(*(id *)(v22 + 32), "existingObjectWithID:error:", v25, buf);
        if (v66)
        {
          v67 = +[PFMirroredRelationship mirroredRelationshipWithManagedObject:withRecordID:relatedToObjectWithRecordID:byRelationship:]((uint64_t)PFMirroredRelationship, v66, (uint64_t)v12, (uint64_t)v120, (uint64_t)v114);
        }
        else
        {
          if (objc_msgSend((id)objc_msgSend(*(id *)buf, "domain"), "isEqualToString:", v109)
            && objc_msgSend(*(id *)buf, "code") == 133000)
          {
            v68 = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 3)
              v69 = 3;
            else
              v69 = __ckLoggingOverride;
            v70 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping pending relationship because it's destination object has gone missing: %@\n%@"));
            _NSCoreDataLog(v69, v70, v71, v72, v73, v74, v75, v76, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
            objc_autoreleasePoolPop(v68);

            v120 = 0;
            v12 = 0;
          }
          else
          {
            v77 = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 3)
              v78 = 3;
            else
              v78 = __ckLoggingOverride;
            v79 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Skipping pending relationship because existingObjectWithID failed: %@\n%@"));
            _NSCoreDataLog(v78, v79, v80, v81, v82, v83, v84, v85, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
            objc_autoreleasePoolPop(v77);
          }
          v67 = 0;
          v22 = a1;
        }
        v52 = v118;
      }
      *(_QWORD *)buf = 0;
      if (-[PFMirroredOneToManyRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:error:](v67, "updateRelationshipValueUsingImportContext:andManagedObjectContext:error:", *(_QWORD *)(v22 + 40), *(_QWORD *)(v22 + 32), buf))
      {
        objc_msgSend(*(id *)(v22 + 32), "deleteObject:", v119);
      }
      else
      {
        v86 = (void *)MEMORY[0x18D76B4E4]();
        if ((unint64_t)__ckLoggingOverride >= 9)
          v87 = 9;
        else
          v87 = __ckLoggingOverride;
        v88 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to resolve pending relationship: %@\n%@"));
        _NSCoreDataLog(v87, v88, v89, v90, v91, v92, v93, v94, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
        objc_autoreleasePoolPop(v86);
      }
      v65 = v115;
      v64 = context;

LABEL_73:
      objc_autoreleasePoolPop(v64);
      v9 = v65 + 1;
    }
    while (v9 != v8);
    v96 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v126, v138, 16);
    v8 = v96;
  }
  while (v96);
LABEL_83:
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    **(_BYTE **)(a1 + 80) = 1;
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deletedObjects"), "count"))
      *a5 = 1;
  }
  result = objc_msgSend(*(id *)(a1 + 32), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if ((result & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    return (uint64_t)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  }
  return result;
}

+ (uint64_t)isPrivateAttribute:(uint64_t)a1
{
  objc_opt_self();
  if ((objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("ckRecordSystemFields")) & 1) != 0)
    return 1;
  else
    return objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("ckRecordID"));
}

+ (uint64_t)assetStorageDirectoryURLForStore:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_opt_self();
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, (void *)objc_msgSend(a2, "URL")))return objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", objc_msgSend(a2, "identifier")), "stringByAppendingPathComponent:", CFSTR("inMemory_store_ckAssets")));
  v4 = (void *)objc_msgSend(a2, "URL");
  v5 = objc_msgSend((id)objc_msgSend(v4, "lastPathComponent"), "stringByDeletingPathExtension");
  v6 = (void *)objc_msgSend(v4, "URLByDeletingLastPathComponent");
  return objc_msgSend(v6, "URLByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_ckAssets"), v5));
}

+ (uint64_t)oldAssetStorageDirectoryURLForStore:(uint64_t)a1
{
  objc_opt_self();
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, (void *)objc_msgSend(a2, "URL")))return objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", objc_msgSend(a2, "identifier")), "stringByAppendingPathComponent:", CFSTR("ckAssetFiles")));
  else
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "URL"), "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:isDirectory:", CFSTR("ckAssetFiles"), 1);
}

+ (uint64_t)isMirroredRelationshipRecordType:(uint64_t)a1
{
  objc_opt_self();
  if ((objc_msgSend(a2, "hasPrefix:", CFSTR("CD_M2M_")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a2, "isEqualToString:", CFSTR("CDMR"));
}

+ (id)assetsOnRecord:(uint64_t)a1 withOptions:(void *)a2
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)objc_msgSend(a2, "allKeys");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasSuffix:", CFSTR("_ckAsset")))
        {
          v10 = objc_msgSend(a2, "objectForKey:", v9);
          if (v10)
            objc_msgSend(v3, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

+ (uint64_t)estimateByteSizeOfRecordID:(uint64_t)a1
{
  uint64_t v3;

  objc_opt_self();
  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "zoneID"), "zoneName"), "length");
  return v3 + objc_msgSend((id)objc_msgSend(a2, "recordName"), "length") + 24;
}

+ (id)newSetOfRecordKeysForEntitiesInConfiguration:(void *)a3 inManagedObjectModel:(int)a4 includeCKAssetsForFileBackedFutures:
{
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  id obj;
  uint64_t v32;
  int v33;
  id v34;
  uint64_t v35;
  void *context;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = 0x1E0C99000uLL;
  v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_msgSend(a3, "entitiesForConfiguration:", a2);
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v35)
  {
    v32 = *(_QWORD *)v39;
    v33 = a4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(obj);
        v37 = v8;
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v8);
        context = (void *)MEMORY[0x18D76B4E4]();
        objc_opt_self();
        v10 = objc_alloc_init(*(Class *)(v7 + 3616));
        objc_opt_self();
        objc_msgSend(v10, "addObject:", objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", CFSTR("entityName")));
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v11 = (void *)objc_msgSend((id)objc_msgSend(v9, "attributesByName"), "allValues");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v47;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v47 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v15);
              v17 = (void *)MEMORY[0x18D76B4E4]();
              v18 = +[PFCloudKitSerializer newSetOfRecordKeysForAttribute:includeCKAssetsForFileBackedFutures:]((uint64_t)PFCloudKitSerializer, v16, a4);
              objc_msgSend(v10, "unionSet:", v18);

              objc_autoreleasePoolPop(v17);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          }
          while (v13);
        }
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v19 = (void *)objc_msgSend((id)objc_msgSend(v9, "relationshipsByName"), "allValues");
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        v7 = 0x1E0C99000uLL;
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v43;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v43 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v23);
              v25 = (void *)MEMORY[0x18D76B4E4]();
              objc_opt_self();
              v26 = objc_alloc_init(*(Class *)(v7 + 3616));
              if ((objc_msgSend(v24, "isToMany") & 1) != 0)
              {
                if (!objc_msgSend((id)objc_msgSend(v24, "inverseRelationship"), "isToMany"))
                  goto LABEL_24;
                objc_msgSend(v26, "addObject:", CFSTR("CD_recordNames"));
                objc_msgSend(v26, "addObject:", CFSTR("CD_relationships"));
                v27 = v26;
                v28 = CFSTR("CD_entityNames");
              }
              else
              {
                objc_opt_self();
                if (!+[PFCloudKitSerializer shouldTrackProperty:]((uint64_t)PFCloudKitSerializer, v24))
                  goto LABEL_24;
                v29 = objc_msgSend(v24, "name");
                v7 = 0x1E0C99000;
                objc_opt_self();
                v28 = (const __CFString *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v29);
                v27 = v26;
              }
              objc_msgSend(v27, "addObject:", v28);
LABEL_24:
              objc_msgSend(v10, "unionSet:", v26);

              objc_autoreleasePoolPop(v25);
              ++v23;
            }
            while (v21 != v23);
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          }
          while (v21);
        }
        objc_opt_self();
        objc_msgSend(v10, "addObject:", objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", CFSTR("moveReceipt")));
        objc_msgSend(v34, "unionSet:", v10);

        objc_autoreleasePoolPop(context);
        v8 = v37 + 1;
        a4 = v33;
      }
      while (v37 + 1 != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v35);
  }
  return v34;
}

+ (id)newSetOfRecordKeysForAttribute:(int)a3 includeCKAssetsForFileBackedFutures:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_opt_self();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (+[PFCloudKitSerializer shouldTrackAttribute:]((uint64_t)PFCloudKitSerializer, a2))
  {
    v6 = objc_msgSend(a2, "name");
    objc_opt_self();
    objc_msgSend(v5, "addObject:", objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v6));
    if (+[PFCloudKitSerializer isVariableLengthAttributeType:]((uint64_t)PFCloudKitSerializer, objc_msgSend(a2, "attributeType")))
    {
      if (!objc_msgSend(a2, "isFileBackedFuture") || a3)
      {
        v7 = objc_msgSend(a2, "name");
        objc_opt_self();
        v8 = (void *)objc_msgSend(CFSTR("CD_"), "stringByAppendingString:", v7);
        objc_opt_self();
        objc_msgSend(v5, "addObject:", objc_msgSend(v8, "stringByAppendingString:", CFSTR("_ckAsset")));
      }
    }
  }
  return v5;
}

+ (BOOL)shouldTrackProperty:(uint64_t)a1
{
  objc_opt_self();
  return (objc_msgSend(a2, "isTransient") & 1) == 0
      && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey")), "BOOLValue");
}

uint64_t __111__PFCloudKitSerializer_mtmKeyForObjectWithRecordName_relatedToObjectWithRecordName_byRelationship_withInverse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;

  v5 = objc_msgSend(a2, "entity");
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 120) & 4) != 0)
    {
      v6 = *(void **)(v5 + 72);
    }
    else
    {
      do
      {
        v6 = (void *)v5;
        v5 = objc_msgSend((id)v5, "superentity");
      }
      while (v5);
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_msgSend(v6, "name");
  v8 = objc_msgSend(a3, "entity");
  if (v8)
  {
    if ((*(_BYTE *)(v8 + 120) & 4) != 0)
    {
      v9 = *(void **)(v8 + 72);
    }
    else
    {
      do
      {
        v9 = (void *)v8;
        v8 = objc_msgSend((id)v8, "superentity");
      }
      while (v8);
    }
  }
  else
  {
    v9 = 0;
  }
  result = objc_msgSend(v7, "compare:options:", objc_msgSend(v9, "name"), 1);
  if (!result)
    return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:options:", objc_msgSend(a3, "name"), 1);
  return result;
}

+ (id)createSetOfObjectIDsRelatedToObject:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *context;
  id obj;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", objc_msgSend(a2, "objectID"), 0);
  do
  {
    v6 = (id)objc_msgSend(v4, "objectAtIndex:", 0);
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    context = (void *)MEMORY[0x18D76B4E4](objc_msgSend(v3, "addObject:", objc_msgSend(v6, "objectID")));
    v24 = v6;
    v7 = (void *)objc_msgSend(v6, "entity");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = v7;
    obj = (id)objc_msgSend(v7, "relationshipsByName");
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v25)
    {
      v22 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v10 = (void *)MEMORY[0x18D76B4E4]();
          v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "relationshipsByName"), "objectForKey:", v9), "isToMany");
          v12 = (void *)objc_msgSend(v24, "valueForKey:", v9);
          v13 = v12;
          if (v11)
          {
            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v27;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v27 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                  if ((objc_msgSend(v3, "containsObject:", objc_msgSend(v18, "objectID")) & 1) == 0
                    && (objc_msgSend(v5, "containsObject:", objc_msgSend(v18, "objectID")) & 1) == 0)
                  {
                    objc_msgSend(v4, "addObject:", v18);
                    objc_msgSend(v5, "addObject:", objc_msgSend(v18, "objectID"));
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              }
              while (v15);
            }
          }
          else if (v12
                 && (objc_msgSend(v3, "containsObject:", objc_msgSend(v12, "objectID")) & 1) == 0
                 && (objc_msgSend(v5, "containsObject:", objc_msgSend(v13, "objectID")) & 1) == 0)
          {
            objc_msgSend(v4, "addObject:", v13);
            objc_msgSend(v5, "addObject:", objc_msgSend(v13, "objectID"));
          }
          objc_autoreleasePoolPop(v10);
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v25);
    }
    objc_autoreleasePoolPop(context);
    objc_msgSend((id)objc_msgSend(v24, "managedObjectContext"), "refreshObject:mergeChanges:", v24, objc_msgSend(v24, "hasChanges"));

  }
  while (objc_msgSend(v4, "count"));

  return v3;
}

+ (id)defaultRecordZoneIDForDatabaseScope:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_MergedGlobals_84 != -1)
    dispatch_once(&_MergedGlobals_84, &__block_literal_global_144);
  if (a3 == 1)
    return (id)qword_1ECD8DAF8;
  if (a3 == 2)
    return (id)qword_1ECD8DAF0;
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unable to provide a default CKRecordZoneID for database scope: %@");
  v6 = softLinkCKDatabaseScopeString(a3);
  _NSCoreDataLog(17, v5, v7, v8, v9, v10, v11, v12, v6);
  v13 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = softLinkCKDatabaseScopeString(a3);
    _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Unable to provide a default CKRecordZoneID for database scope: %@", buf, 0xCu);
  }
  return 0;
}

uint64_t __60__PFCloudKitSerializer_defaultRecordZoneIDForDatabaseScope___block_invoke()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t result;

  v0 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
  qword_1ECD8DAF0 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("com.apple.coredata.cloudkit.zone"), getCloudKitCKCurrentUserDefaultName[0]());
  v1 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
  v2 = getCloudKitCKRecordZoneDefaultName[0]();
  result = objc_msgSend(v1, "initWithZoneName:ownerName:", v2, getCloudKitCKCurrentUserDefaultName[0]());
  qword_1ECD8DAF8 = result;
  return result;
}

+ (void)_invalidateStaticCaches
{

  qword_1ECD8DAF0 = 0;
  qword_1ECD8DAF8 = 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
