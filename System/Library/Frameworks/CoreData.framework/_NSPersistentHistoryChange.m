@implementation _NSPersistentHistoryChange

+ (void)_propertyDataForEntity:(void *)a3 withSetOfPropertyNames:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const UInt8 *v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  CFIndex v56;
  const __CFBitVector *v57;
  void *v58;
  UInt8 *v59;
  CFIndex v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;
  CFRange v98;

  v97 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = (void *)objc_msgSend(a2, "foreignKeyColumns");
  v6 = (void *)objc_msgSend(a2, "foreignEntityKeyColumns");
  v7 = (void *)objc_msgSend(a2, "foreignOrderKeyColumns");
  v8 = (void *)objc_msgSend(a2, "attributeColumns");
  v9 = (void *)objc_msgSend(a2, "toManyRelationships");
  v10 = (void *)objc_msgSend(a2, "manyToManyRelationships");
  v65 = v8;
  v11 = objc_msgSend(v8, "count");
  v64 = v7;
  v12 = objc_msgSend(v7, "count") + v11;
  v63 = v6;
  v13 = objc_msgSend(v6, "count");
  v14 = v12 + v13 + objc_msgSend(v5, "count");
  v66 = v9;
  v15 = objc_msgSend(v9, "count");
  v62 = v10;
  v16 = objc_msgSend(v10, "count");
  v61 = v14 + v15 + v16;
  MEMORY[0x1E0C80A78](v16);
  v18 = (const UInt8 *)&v61 - v17;
  bzero((char *)&v61 - v17, v19);
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v88;
    do
    {
      v24 = 0;
      v25 = v22;
      do
      {
        if (*(_QWORD *)v88 != v23)
          objc_enumerationMutation(v5);
        if (objc_msgSend(a3, "containsObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * v24), "toOneRelationship", v61), "name")))v18[(v25 + v24) >> 3] |= 1 << (~(v25 + v24) & 7);
        ++v24;
      }
      while (v21 != v24);
      v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
      v22 = v25 + v24;
    }
    while (v21);
    v26 = v25 + v24;
  }
  else
  {
    v26 = 0;
  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v27 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v83, v95, 16, v61);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v84;
    do
    {
      v30 = 0;
      v31 = v26;
      v32 = v63;
      do
      {
        if (*(_QWORD *)v84 != v29)
          objc_enumerationMutation(v32);
        if (objc_msgSend(a3, "containsObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v30), "toOneRelationship"), "name")))v18[(v31 + v30) >> 3] |= 1 << (~(v31 + v30) & 7);
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      v26 = v31 + v30;
    }
    while (v28);
    v26 = v31 + v30;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v33 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v80;
    do
    {
      v36 = 0;
      v37 = v26;
      v38 = v64;
      do
      {
        if (*(_QWORD *)v80 != v35)
          objc_enumerationMutation(v38);
        if (objc_msgSend(a3, "containsObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v36), "toOneRelationship"), "name")))v18[(v37 + v36) >> 3] |= 1 << (~(v37 + v36) & 7);
        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
      v26 = v37 + v36;
    }
    while (v34);
    v26 = v37 + v36;
  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v39 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v76;
    do
    {
      v42 = 0;
      v43 = v26;
      v44 = v65;
      do
      {
        if (*(_QWORD *)v76 != v41)
          objc_enumerationMutation(v44);
        if (objc_msgSend(a3, "containsObject:", objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v42), "name")))v18[(v43 + v42) >> 3] |= 1 << (~(v43 + v42) & 7);
        ++v42;
      }
      while (v40 != v42);
      v40 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
      v26 = v43 + v42;
    }
    while (v40);
    v26 = v43 + v42;
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v45 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v72;
    do
    {
      v48 = 0;
      v49 = v26;
      v50 = v66;
      do
      {
        if (*(_QWORD *)v72 != v47)
          objc_enumerationMutation(v50);
        if (objc_msgSend(a3, "containsObject:", objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v48), "name")))v18[(v49 + v48) >> 3] |= 1 << (~(v49 + v48) & 7);
        ++v48;
      }
      while (v46 != v48);
      v46 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
      v26 = v49 + v48;
    }
    while (v46);
    v26 = v49 + v48;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v51 = v62;
  v52 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v67, v91, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v68 != v54)
          objc_enumerationMutation(v51);
        if (objc_msgSend(a3, "containsObject:", objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "name")))v18[(v26 + i) >> 3] |= 1 << (~(v26 + i) & 7);
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v67, v91, 16);
      v26 += i;
    }
    while (v53);
  }
  v56 = v61;
  v57 = CFBitVectorCreate(0, v18, v61);
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (unint64_t)(v56 + 7) >> 3);
  v59 = (UInt8 *)objc_msgSend(v58, "mutableBytes");
  v98.location = 0;
  v98.length = v56;
  CFBitVectorGetBits(v57, v98, v59);
  CFRelease(v57);
  return v58;
}

+ (void)_dataMaskForEntity:(const __CFBitVector *)a3 andDeltaMask:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  uint64_t v18;
  const UInt8 *v19;
  size_t v20;
  CFIndex Count;
  CFIndex v22;
  CFIndex v23;
  CFIndex v24;
  char v25;
  const __CFBitVector *v27;
  void *v28;
  UInt8 *v29;
  _QWORD v31[2];
  CFRange v32;

  v31[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = (void *)objc_msgSend(a2, "foreignKeyColumns");
  v6 = (void *)objc_msgSend(a2, "foreignEntityKeyColumns");
  v7 = (void *)objc_msgSend(a2, "foreignOrderKeyColumns");
  v8 = (void *)objc_msgSend(a2, "attributeColumns");
  v9 = (void *)objc_msgSend(a2, "toManyRelationships");
  v10 = (void *)objc_msgSend(a2, "manyToManyRelationships");
  v11 = objc_msgSend(v8, "count");
  v12 = objc_msgSend(v7, "count") + v11;
  v13 = objc_msgSend(v6, "count");
  v14 = v12 + v13 + objc_msgSend(v5, "count");
  v15 = objc_msgSend(v9, "count");
  v16 = objc_msgSend(v10, "count");
  v17 = v14 + v15 + v16;
  MEMORY[0x1E0C80A78](v16);
  v19 = (const UInt8 *)v31 - v18;
  bzero((char *)v31 - v18, v20);
  Count = CFBitVectorGetCount(a3);
  v22 = Count - 1;
  if (Count < 1)
    return 0;
  v23 = Count;
  v24 = 0;
  v25 = 0;
  do
  {
    while (CFBitVectorGetBitAtIndex(a3, v24))
    {
      v25 = 1;
      v19[v24 >> 3] |= 1 << (~(_BYTE)v24 & 7);
      if (v22 == v24++)
        goto LABEL_10;
    }
    ++v24;
  }
  while (v23 != v24);
  if ((v25 & 1) == 0)
    return 0;
LABEL_10:
  v27 = CFBitVectorCreate(0, v19, v17);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (unint64_t)(v17 + 7) >> 3);
  v29 = (UInt8 *)objc_msgSend(v28, "mutableBytes");
  v32.location = 0;
  v32.length = v17;
  CFBitVectorGetBits(v27, v32, v29);
  CFRelease(v27);
  return v28;
}

+ (id)_mergeOldMask:(void *)a3 andNewMask:
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  unsigned int v9;
  char v12;

  objc_opt_self();
  v5 = objc_msgSend(a2, "bytes");
  v6 = objc_msgSend(a3, "bytes");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (objc_msgSend(a2, "length"))
  {
    v8 = 0;
    v9 = 1;
    do
    {
      if (objc_msgSend(a3, "length") <= v8)
        break;
      v12 = *(_BYTE *)(v6 + v8) | *(_BYTE *)(v5 + v8);
      objc_msgSend(v7, "appendBytes:length:", &v12, 1);
      v8 = v9;
    }
    while (objc_msgSend(a2, "length") > (unint64_t)v9++);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_changedObjectID = 0;
  self->_tombstone = 0;

  self->_columns = 0;
  self->_sqlEntity = 0;

  self->_backingObjectID = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSPersistentHistoryChange;
  -[_NSPersistentHistoryChange dealloc](&v3, sel_dealloc);
}

- (void)_setTransaction:(id)a3
{
  self->_transaction = (NSPersistentHistoryTransaction *)a3;
}

- (_NSPersistentHistoryChange)initWithDictionary:(id)a3 andChangeObjectID:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  const __CFString *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  NSObject *v29;
  id v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _NSPersistentHistoryChange *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  const __CFString *v56;
  _QWORD *v57;
  uint64_t v58;
  const __CFString *v59;
  const char *v60;
  NSObject *v61;
  uint32_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  void *v74;
  void *v75;
  uint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const __CFString *v85;
  NSObject *v86;
  _NSPersistentHistoryChange *v87;
  _QWORD *v89;
  uint64_t v90;
  const __CFString *v91;
  _QWORD *v92;
  uint64_t v93;
  const __CFString *v94;
  _QWORD *v95;
  uint64_t v96;
  const __CFString *v97;
  _QWORD *v98;
  uint64_t v99;
  const __CFString *v100;
  _QWORD *v101;
  uint64_t v102;
  const __CFString *v103;
  _QWORD *v104;
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  uint64_t v108;
  const __CFString *v109;
  const __CFString *v110;
  __CFString *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int64_t v115;
  void *v116;
  _QWORD *v117;
  _NSPersistentHistoryChange *v118;
  objc_super v119;
  objc_super v120;
  uint8_t buf[4];
  _QWORD *v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  const __CFString *v128;
  __int16 v129;
  const __CFString *v130;
  __int16 v131;
  const __CFString *v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "count");
  if (a4 && v7)
  {
    v8 = objc_msgSend(a4, "_referenceData64");
    v9 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("CHANGETYPE")), "unsignedIntegerValue");
    v116 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("COLUMNS"));
    v10 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("ENTITY")), "unsignedLongValue");
    v11 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("ENTITYPK")), "longLongValue");
    v12 = (__CFString *)objc_msgSend(a4, "persistentStore");
    v13 = v12;
    v115 = v8;
    v118 = self;
    v113 = v11;
    v114 = v10;
    if (!v12 || (v10 ? (v14 = v11 < 1) : (v14 = 1), v14))
    {
      v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexpectedly nil entry in: entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@");
      v44 = (_QWORD *)-[__CFString model](v13, "model");
      if (v44)
        v44 = (_QWORD *)v44[5];
      objc_msgSend(v44, "valueForKey:", CFSTR("name"));
      v45 = (_QWORD *)-[__CFString model](v13, "model");
      if (v45)
        v45 = (_QWORD *)v45[5];
      objc_msgSend(v45, "valueForKey:", CFSTR("entityID"));
      if (v13)
        v52 = v13;
      else
        v52 = CFSTR("<null>");
      _NSCoreDataLog(17, v43, v46, v47, v48, v49, v50, v51, 0);
      v53 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        goto LABEL_58;
      v54 = (_QWORD *)-[__CFString model](v13, "model");
      if (v54)
        v54 = (_QWORD *)v54[5];
      v55 = objc_msgSend(v54, "valueForKey:", CFSTR("name"));
      if (v55)
        v56 = (const __CFString *)v55;
      else
        v56 = CFSTR("<null>");
      v57 = (_QWORD *)-[__CFString model](v13, "model");
      if (v57)
        v57 = (_QWORD *)v57[5];
      v58 = objc_msgSend(v57, "valueForKey:", CFSTR("entityID"));
      *(_DWORD *)buf = 138413570;
      if (v58)
        v59 = (const __CFString *)v58;
      else
        v59 = CFSTR("<null>");
      v122 = 0;
      v123 = 2048;
      v124 = v10;
      v125 = 2048;
      v126 = v11;
      v127 = 2112;
      v128 = v56;
      v129 = 2112;
      v130 = v59;
      v131 = 2112;
      v132 = v52;
      v60 = "CoreData: Unexpectedly nil entry in: entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@";
      v61 = v53;
      v62 = 62;
    }
    else
    {
      v15 = objc_msgSend((id)-[__CFString model](v12, "model"), "entityForID:", v10);
      if (v15)
      {
        v117 = (_QWORD *)v15;
        v112 = -[__CFString newObjectIDForEntity:pk:](v13, "newObjectIDForEntity:pk:", v15, v11);
        if (!v112)
        {
          v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexpected change - objectID failed for entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@");
          v17 = (_QWORD *)-[__CFString model](v13, "model");
          if (v17)
            v17 = (_QWORD *)v17[5];
          v18 = objc_msgSend(v17, "valueForKey:", CFSTR("name"));
          if (v18)
            v19 = (const __CFString *)v18;
          else
            v19 = CFSTR("<null>");
          v20 = (_QWORD *)-[__CFString model](v13, "model");
          if (v20)
            v20 = (_QWORD *)v20[5];
          v21 = objc_msgSend(v20, "valueForKey:", CFSTR("entityID"));
          if (v21)
            v28 = (const __CFString *)v21;
          else
            v28 = CFSTR("<null>");
          v110 = v28;
          v111 = v13;
          v108 = v11;
          v109 = v19;
          _NSCoreDataLog(17, v16, v22, v23, v24, v25, v26, v27, (uint64_t)v117);
          v29 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v101 = (_QWORD *)-[__CFString model](v13, "model");
            if (v101)
              v101 = (_QWORD *)v101[5];
            v102 = objc_msgSend(v101, "valueForKey:", CFSTR("name"));
            if (v102)
              v103 = (const __CFString *)v102;
            else
              v103 = CFSTR("<null>");
            v104 = (_QWORD *)-[__CFString model](v13, "model");
            if (v104)
              v104 = (_QWORD *)v104[5];
            v105 = objc_msgSend(v104, "valueForKey:", CFSTR("entityID"));
            *(_DWORD *)buf = 138413570;
            if (v105)
              v106 = (const __CFString *)v105;
            else
              v106 = CFSTR("<null>");
            v122 = v117;
            v123 = 2048;
            v124 = v10;
            v125 = 2048;
            v126 = v11;
            v127 = 2112;
            v128 = v103;
            v129 = 2112;
            v130 = v106;
            v131 = 2112;
            v132 = v13;
            _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Unexpected change - objectID failed for entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@", buf, 0x3Eu);
          }
        }
        if (v9 == 2)
        {
          v30 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, v117);
          if (objc_msgSend(v30, "count"))
          {
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v30, "count"));
            if (objc_msgSend(v30, "count"))
            {
              v32 = 0;
              do
              {
                v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu"), CFSTR("TOMBSTONE"), v32, v108, v109, v110, v111);
                v34 = objc_msgSend(a3, "objectForKey:", v33);
                if (v34 != NSKeyValueCoding_NullValue)
                {
                  v35 = objc_msgSend(a3, "objectForKey:", v33);
                  if (v35)
                    objc_msgSend(v31, "setObject:forKey:", v35, objc_msgSend(v30, "objectAtIndexedSubscript:", v32));
                }
                ++v32;
              }
              while (v32 < objc_msgSend(v30, "count"));
            }
            if (!objc_msgSend(v31, "count"))
            {

              v31 = 0;
            }
          }
          else
          {
            v31 = 0;
          }
          v74 = (void *)v112;

          v73 = 1;
        }
        else
        {
          v31 = 0;
          v73 = 1;
          v74 = (void *)v112;
        }
        goto LABEL_59;
      }
      v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexpected change - entity ID (%ld) not found in model - %@ - %@, store - %@");
      v64 = (_QWORD *)-[__CFString model](v13, "model");
      if (v64)
        v64 = (_QWORD *)v64[5];
      objc_msgSend(v64, "valueForKey:", CFSTR("name"));
      v65 = (_QWORD *)-[__CFString model](v13, "model");
      if (v65)
        v65 = (_QWORD *)v65[5];
      objc_msgSend(v65, "valueForKey:", CFSTR("entityID"));
      _NSCoreDataLog(17, v63, v66, v67, v68, v69, v70, v71, v10);
      v72 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_58:
        v73 = 0;
        v74 = 0;
        v117 = 0;
        v31 = 0;
LABEL_59:
        v75 = v74;
        if (!objc_opt_class())
        {
          v76 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexpectedly corrupt changedObjectID failed for entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@");
          v77 = (_QWORD *)-[__CFString model](v13, "model");
          if (v77)
            v77 = (_QWORD *)v77[5];
          objc_msgSend(v77, "valueForKey:", CFSTR("name"));
          v78 = (_QWORD *)-[__CFString model](v13, "model");
          if (v78)
            v78 = (_QWORD *)v78[5];
          objc_msgSend(v78, "valueForKey:", CFSTR("entityID"));
          if (v13)
            v85 = v13;
          else
            v85 = CFSTR("<null>");
          _NSCoreDataLog(17, v76, v79, v80, v81, v82, v83, v84, (uint64_t)v117);
          v86 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v89 = (_QWORD *)-[__CFString model](v13, "model");
            if (v89)
              v89 = (_QWORD *)v89[5];
            v90 = objc_msgSend(v89, "valueForKey:", CFSTR("name"));
            if (v90)
              v91 = (const __CFString *)v90;
            else
              v91 = CFSTR("<null>");
            v92 = (_QWORD *)-[__CFString model](v13, "model");
            if (v92)
              v92 = (_QWORD *)v92[5];
            v93 = objc_msgSend(v92, "valueForKey:", CFSTR("entityID"));
            *(_DWORD *)buf = 138413570;
            if (v93)
              v94 = (const __CFString *)v93;
            else
              v94 = CFSTR("<null>");
            v122 = v117;
            v123 = 2048;
            v124 = v114;
            v125 = 2048;
            v126 = v113;
            v127 = 2112;
            v128 = v91;
            v129 = 2112;
            v130 = v94;
            v131 = 2112;
            v132 = v85;
            _os_log_fault_impl(&dword_18A253000, v86, OS_LOG_TYPE_FAULT, "CoreData: Unexpectedly corrupt changedObjectID failed for entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@", buf, 0x3Eu);
          }
        }
        v119.receiver = v118;
        v119.super_class = (Class)_NSPersistentHistoryChange;
        v87 = -[_NSPersistentHistoryChange init](&v119, sel_init);
        v42 = v87;
        if (v87)
        {
          v87->_changeID = v115;
          v87->_changedObjectID = (NSManagedObjectID *)v75;
          v42->_changeType = v9;
          if (v31)
            v42->_tombstone = (NSDictionary *)v31;
          if (v116)
            v42->_columns = (NSData *)v116;
          if (v73)
            v42->_sqlEntity = (NSSQLEntity *)v117;
          v42->_backingObjectID = (NSManagedObjectID *)a4;
        }

        return v42;
      }
      v95 = (_QWORD *)-[__CFString model](v13, "model");
      if (v95)
        v95 = (_QWORD *)v95[5];
      v96 = objc_msgSend(v95, "valueForKey:", CFSTR("name"));
      if (v96)
        v97 = (const __CFString *)v96;
      else
        v97 = CFSTR("<null>");
      v98 = (_QWORD *)-[__CFString model](v13, "model");
      if (v98)
        v98 = (_QWORD *)v98[5];
      v99 = objc_msgSend(v98, "valueForKey:", CFSTR("entityID"));
      *(_DWORD *)buf = 134218754;
      if (v99)
        v100 = (const __CFString *)v99;
      else
        v100 = CFSTR("<null>");
      v122 = (_QWORD *)v10;
      v123 = 2112;
      v124 = (uint64_t)v97;
      v125 = 2112;
      v126 = (uint64_t)v100;
      v127 = 2112;
      v128 = v13;
      v60 = "CoreData: Unexpected change - entity ID (%ld) not found in model - %@ - %@, store - %@";
      v61 = v72;
      v62 = 42;
    }
    _os_log_fault_impl(&dword_18A253000, v61, OS_LOG_TYPE_FAULT, v60, buf, v62);
    goto LABEL_58;
  }
  v120.receiver = self;
  v120.super_class = (Class)_NSPersistentHistoryChange;
  v42 = -[_NSPersistentHistoryChange init](&v120, sel_init);
  if (v42)
    _NSCoreDataLog(1, (uint64_t)CFSTR("_NSPersistentHistoryChange was created with an empty changeDictionary or changeObjectID"), v36, v37, v38, v39, v40, v41, v107);
  return v42;
}

- (id)changedObjectID
{
  return self->_changedObjectID;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (id)updatedProperties
{
  NSData *columns;
  NSSQLEntity *sqlEntity;

  columns = self->_columns;
  if (columns && (sqlEntity = self->_sqlEntity) != 0)
    return +[_NSPersistentHistoryChange _updatedPropertiesForEntity:andData:]((uint64_t)_NSPersistentHistoryChange, sqlEntity, columns);
  else
    return 0;
}

+ (CFMutableSetRef)_updatedPropertiesForEntity:(void *)a3 andData:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  CFMutableSetRef Mutable;
  const __CFBitVector *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = (void *)objc_msgSend(a2, "foreignKeyColumns");
  v6 = (void *)objc_msgSend(a2, "foreignEntityKeyColumns");
  v7 = (void *)objc_msgSend(a2, "foreignOrderKeyColumns");
  v8 = (void *)objc_msgSend(a2, "attributeColumns");
  v9 = (void *)objc_msgSend(a2, "toManyRelationships");
  v10 = (void *)objc_msgSend(a2, "manyToManyRelationships");
  v65 = v8;
  v11 = objc_msgSend(v8, "count");
  v12 = objc_msgSend(v7, "count");
  v13 = objc_msgSend(v6, "count");
  v14 = objc_msgSend(v5, "count");
  v66 = v9;
  v15 = objc_msgSend(v9, "count");
  v67 = v10;
  v16 = v12 + v11 + v13 + v14 + v15 + objc_msgSend(v10, "count");
  if (v16 > 8 * objc_msgSend(a3, "length"))
    return 0;
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v18 = CFBitVectorCreate(0, (const UInt8 *)objc_msgSend(a3, "bytes"), v16);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v19)
  {
    v20 = 0;
    v21 = *(_QWORD *)v89;
    do
    {
      v22 = 0;
      v23 = v20;
      do
      {
        if (*(_QWORD *)v89 != v21)
          objc_enumerationMutation(v5);
        v24 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v22);
        if (CFBitVectorGetBitAtIndex(v18, (v23 + v22)))
        {
          v25 = (void *)objc_msgSend(v24, "toOneRelationship");
          if (v25)
          {
            v26 = objc_msgSend(v25, "propertyDescription");
            if (v26)
              -[__CFSet addObject:](Mutable, "addObject:", v26);
          }
        }
        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
      v20 = v23 + v22;
    }
    while (v19);
    LODWORD(v19) = v23 + v22;
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v85;
    do
    {
      v30 = 0;
      v31 = v19;
      do
      {
        if (*(_QWORD *)v85 != v29)
          objc_enumerationMutation(v6);
        v32 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v30);
        if (CFBitVectorGetBitAtIndex(v18, (v31 + v30)))
        {
          v33 = (void *)objc_msgSend(v32, "toOneRelationship");
          if (v33)
          {
            v34 = objc_msgSend(v33, "propertyDescription");
            if (v34)
              -[__CFSet addObject:](Mutable, "addObject:", v34);
          }
        }
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
      LODWORD(v19) = v31 + v30;
    }
    while (v28);
    LODWORD(v19) = v31 + v30;
  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v35 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v81;
    do
    {
      v38 = 0;
      v39 = v19;
      do
      {
        if (*(_QWORD *)v81 != v37)
          objc_enumerationMutation(v7);
        v40 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v38);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v38)))
        {
          v41 = (void *)objc_msgSend(v40, "toOneRelationship");
          if (v41)
          {
            v42 = objc_msgSend(v41, "propertyDescription");
            if (v42)
              -[__CFSet addObject:](Mutable, "addObject:", v42);
          }
        }
        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
      LODWORD(v19) = v19 + v38;
    }
    while (v36);
    LODWORD(v19) = v39 + v38;
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v43 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v77;
    do
    {
      v46 = 0;
      v47 = v19;
      do
      {
        if (*(_QWORD *)v77 != v45)
          objc_enumerationMutation(v65);
        v48 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v46);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v46)))
          -[__CFSet addObject:](Mutable, "addObject:", objc_msgSend(v48, "attributeDescription"));
        ++v46;
      }
      while (v44 != v46);
      v44 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
      LODWORD(v19) = v19 + v46;
    }
    while (v44);
    LODWORD(v19) = v47 + v46;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v49 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v73;
    do
    {
      v52 = 0;
      v53 = v19;
      do
      {
        if (*(_QWORD *)v73 != v51)
          objc_enumerationMutation(v66);
        v54 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v52);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v52)))
        {
          if (v54)
            v55 = objc_msgSend(v54, "propertyDescription");
          else
            v55 = 0;
          -[__CFSet addObject:](Mutable, "addObject:", v55);
        }
        ++v52;
      }
      while (v50 != v52);
      v56 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
      v50 = v56;
      LODWORD(v19) = v19 + v52;
    }
    while (v56);
    LODWORD(v19) = v53 + v52;
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v57 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v69;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v69 != v59)
          objc_enumerationMutation(v67);
        v61 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v60);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v60)))
        {
          if (v61)
            v62 = objc_msgSend(v61, "propertyDescription");
          else
            v62 = 0;
          -[__CFSet addObject:](Mutable, "addObject:", v62);
        }
        ++v60;
      }
      while (v58 != v60);
      v63 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
      v58 = v63;
      LODWORD(v19) = v19 + v60;
    }
    while (v63);
  }
  CFRelease(v18);
  return Mutable;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPersistentHistoryChange)initWithCoder:(id)a3
{
  _NSPersistentHistoryChange *v4;
  void *v5;
  NSManagedObjectID *changedObjectID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NSPersistentHistoryChange;
  v4 = -[_NSPersistentHistoryChange init](&v8, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v4->_changedObjectID = (NSManagedObjectID *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[_PFRoutines xpcStoreArchiverObjectIDClassesForSecureCoding](), CFSTR("NSPersistentHistoryChangeObjectID"));
    v4->_changeID = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPersistentHistoryChangeID")), "longLongValue");
    v4->_changeType = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPersistentHistoryChangeType")), "integerValue");
    v4->_tombstone = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[_PFRoutines attributeClassesForSecureCoding](), CFSTR("NSPersistentHistoryChangeTombstone"));
    v4->_columns = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPersistentHistoryChangeColumn"));
    changedObjectID = v4->_changedObjectID;
    if (changedObjectID)
      v4->_sqlEntity = (NSSQLEntity *)(id)_sqlEntityForEntityDescription(-[NSPersistentStore model](-[NSManagedObjectID persistentStore](changedObjectID, "persistentStore"), "model"), (_QWORD *)-[NSManagedObjectID entity](v4->_changedObjectID, "entity"));
    objc_autoreleasePoolPop(v5);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;

  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  objc_msgSend(a3, "encodeObject:forKey:", self->_changedObjectID, CFSTR("NSPersistentHistoryChangeObjectID"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_changeID), CFSTR("NSPersistentHistoryChangeID"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_changeType), CFSTR("NSPersistentHistoryChangeType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_tombstone, CFSTR("NSPersistentHistoryChangeTombstone"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_transaction, CFSTR("NSPersistentHistoryChangeTransaction"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_columns, CFSTR("NSPersistentHistoryChangeColumn"));
  objc_autoreleasePoolPop(v5);
}

- (id)tombstone
{
  return self->_tombstone;
}

- (id)transaction
{
  return self->_transaction;
}

- (int64_t)changeID
{
  return self->_changeID;
}

- (id)_backingObjectID
{
  return self->_backingObjectID;
}

@end
