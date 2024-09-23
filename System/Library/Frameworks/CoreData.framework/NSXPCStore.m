@implementation NSXPCStore

- (Class)_objectIDClass
{
  return (Class)objc_opt_class();
}

+ (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  void *v5;
  NSXPCStoreManagedObjectArchivingToken *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v11;

  v5 = (void *)MEMORY[0x18D76B4E4](a1, a2, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = [NSXPCStoreManagedObjectArchivingToken alloc];
    v7 = (id)objc_msgSend(a4, "objectID");
LABEL_5:
    v8 = -[NSXPCStoreManagedObjectArchivingToken initWithURI:](v6, "initWithURI:", objc_msgSend(v7, "URIRepresentation"));
LABEL_6:
    v9 = (void *)v8;
    objc_autoreleasePoolPop(v5);
    return v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = [NSXPCStoreManagedObjectArchivingToken alloc];
    v7 = a4;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = +[_NSXPCStoreUtilities newUserInfoFromException:]((uint64_t)_NSXPCStoreUtilities, a4);
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(a4, "timeIntervalSinceReferenceDate");
    v8 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (+[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken") == a4)
    {
      a4 = CFSTR("current");
    }
    else if (+[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken") == a4)
    {
      a4 = CFSTR("unpinned");
    }
    else
    {
      +[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken");
    }
  }
  objc_autoreleasePoolPop(v5);
  return a4;
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v9;
  int *p_outstandingRequests;
  int v11;
  unsigned int v12;
  uint64_t *v13;
  uint64_t *v14;
  NSPersistentHistoryResult *v15;
  uint64_t v16;
  void *v17;
  NSCoreDataXPCMessage *v18;
  const char *v19;
  NSCoreDataXPCMessage *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSPersistentHistoryResult *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  NSCoreDataXPCMessage *v35;
  const char *v36;
  NSCoreDataXPCMessage *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSBatchInsertResult *v46;
  id v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t *v59;
  void *v60;
  NSCoreDataXPCMessage *v61;
  const char *v62;
  NSCoreDataXPCMessage *v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  NSCoreDataXPCMessage *v72;
  const char *v73;
  NSCoreDataXPCMessage *v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSString *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  NSFetchRequest *v98;
  uint64_t *v99;
  __CFString *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  NSObject *v131;
  _NSPersistentHistoryTransactionPredicateParser *v132;
  void *v133;
  void *v134;
  id v135;
  uint64_t v136;
  void *i;
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
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unsigned int v159;
  unsigned int v160;
  uint64_t v162;
  NSFetchRequest *v163;
  uint64_t *v164;
  __CFString *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  BOOL v169;
  NSFetchRequest *v170;
  uint64_t v171;
  uint64_t *v172;
  void *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t k;
  NSPersistentHistoryChangeRequest *v177;
  NSFetchRequest *v178;
  uint64_t *v179;
  void *v180;
  BOOL v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t m;
  NSPersistentHistoryChangeRequest *v187;
  NSFetchRequest *v188;
  uint64_t *v189;
  uint64_t *v190;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t j;
  uint64_t *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  char v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  NSFetchRequest *v208;
  void *v209;
  void *v210;
  NSManagedObjectContext *v211;
  void *v212;
  uint64_t *v213;
  uint64_t *v214;
  _BYTE buf[12];
  __int16 v216;
  int v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  NSString *v222;
  const __CFString *v223;
  uint64_t v224;
  __CFString *v225;
  NSString *v226;
  NSString *v227;
  uint64_t v228;

  v228 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a3, "requestType");
  p_outstandingRequests = &self->_outstandingRequests;
  do
    v11 = __ldxr((unsigned int *)p_outstandingRequests);
  while (__stxr(v11 + 1, (unsigned int *)p_outstandingRequests));
  if (v11 > -2)
  {
    switch(v9)
    {
      case 1:
        v14 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)a3, (NSManagedObjectContext *)a4, a5);
        goto LABEL_135;
      case 2:
        if (!self)
          goto LABEL_137;
        v47 = 0;
        v225 = 0;
        if ((*(_BYTE *)&self->super.super._flags & 4) != 0)
          v47 = -[NSXPCStore metadata](self, "metadata");
        v48 = -[NSXPCSaveRequestContext initForStore:request:metadata:forceInsertsToUpdates:context:]([NSXPCSaveRequestContext alloc], "initForStore:request:metadata:forceInsertsToUpdates:context:", self, a3, v47, 0, a4);
        v49 = (uint64_t *)-[NSXPCStore _executeSaveRequestForContext:error:]((uint64_t *)self, v48, &v225);
        v13 = v49;
        if (!v49)
          goto LABEL_127;
        if ((objc_msgSend(v49, "BOOLValue") & 1) != 0)
          goto LABEL_129;
        if (!v48)
          goto LABEL_124;
        v50 = v48[6];
        if (!v50)
          goto LABEL_125;
        if (objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "count")
          && (v51 = -[__CFString domain](v225, "domain"),
              v210 = (void *)*MEMORY[0x1E0CB28A8],
              objc_msgSend((id)*MEMORY[0x1E0CB28A8], "isEqual:", v51))
          && -[__CFString code](v225, "code") == 1555)
        {
          if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault"))
            _NSCoreDataLog(8, (uint64_t)CFSTR("Attempting to resend what looks like it may be a reinsert"), v52, v53, v54, v55, v56, v57, v203);
          *(_QWORD *)buf = 0;
          v58 = -[NSXPCSaveRequestContext initForStore:request:metadata:forceInsertsToUpdates:context:]([NSXPCSaveRequestContext alloc], "initForStore:request:metadata:forceInsertsToUpdates:context:", self, a3, v47, 1, a4);
          v59 = (uint64_t *)-[NSXPCStore _executeSaveRequestForContext:error:]((uint64_t *)self, v58, buf);
          v13 = v59;
          if (v59)
          {
            if ((objc_msgSend(v59, "BOOLValue") & 1) != 0)
              goto LABEL_129;
            if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault"))
              _NSCoreDataLog(8, (uint64_t)CFSTR("Reinsert hit optimistic locking error, will discard and let the next save resolve it."), v196, v197, v198, v199, v200, v201, v203);
            if (objc_msgSend(v210, "isEqual:", -[__CFString domain](v225, "domain"))
              && objc_msgSend(*(id *)buf, "code") == 134050)
            {
              -[NSXPCStore _commitChangesForRequestContext:]((uint64_t)self, v58);
              v202 = 1;
              v13 = (uint64_t *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
            }
            else
            {
              v202 = 0;
              v13 = 0;
              if (a5)
                *a5 = v225;
            }
            LOBYTE(v50) = 1;
            if ((v202 & 1) != 0)
              goto LABEL_129;
LABEL_126:
            if ((v50 & 1) == 0)
            {
LABEL_127:
              v13 = 0;
              if (a5)
                *a5 = v225;
            }
LABEL_129:

            goto LABEL_138;
          }
        }
        else
        {
          if (-[__CFString code](v225, "code") != 134050
            || (v133 = (void *)-[__CFString domain](v225, "domain"),
                !objc_msgSend(v133, "isEqualToString:", *MEMORY[0x1E0CB28A8])))
          {
LABEL_124:
            LOBYTE(v50) = 0;
LABEL_125:
            v13 = 0;
            goto LABEL_126;
          }
          v134 = (void *)objc_msgSend((id)-[__CFString userInfo](v225, "userInfo"), "valueForKey:", CFSTR("conflictList"));
          v135 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, 0);
          v220 = 0u;
          v221 = 0u;
          v218 = 0u;
          v219 = 0u;
          v13 = (uint64_t *)objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
          if (v13)
          {
            v136 = *(_QWORD *)v219;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(_QWORD *)v219 != v136)
                  objc_enumerationMutation(v134);
                -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v135, (const void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v218 + 1) + 8 * (_QWORD)i), "sourceObject"), "objectID"));
              }
              v13 = (uint64_t *)objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
            }
            while (v13);
          }
        }
        LOBYTE(v50) = 0;
        goto LABEL_126;
      case 5:
        if (!self)
          goto LABEL_137;
        *(_QWORD *)&v218 = 0;
        -[NSBatchInsertRequest _resolveEntityWithSQLCore:]((uint64_t)a3, self);
        v60 = (void *)objc_msgSend(a3, "encodeForXPC");
        v61 = objc_alloc_init(NSCoreDataXPCMessage);
        v63 = v61;
        if (v61)
        {
          v61->_messageCode = 16;
          objc_setProperty_nonatomic(v61, v62, v60, 24);
        }

        v64 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v63, (uint64_t)a4, &v225, &v218);
        if (v64)
        {
          v65 = (void *)MEMORY[0x1E0C99E60];
          v66 = objc_opt_class();
          v67 = objc_opt_class();
          v68 = objc_opt_class();
          v69 = objc_msgSend(v65, "setWithObjects:", v66, v67, v68, objc_opt_class(), 0);
          v70 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v64, (uint64_t)self, v69);
          if (v70)
          {
            v46 = -[NSBatchInsertResult initWithResultType:andObject:]([NSBatchInsertResult alloc], "initWithResultType:andObject:", objc_msgSend(a3, "resultType"), v70);
            goto LABEL_134;
          }
          v110 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F49490);
          *(_QWORD *)&v218 = v110;
          if (v110)
          {
LABEL_99:
            if (a5)
            {
              v46 = 0;
              *a5 = v110;
              goto LABEL_134;
            }
LABEL_131:
            v46 = 0;
LABEL_134:
            v14 = v46;
            goto LABEL_135;
          }
          v145 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v145, v146, v147, v148, v149, v150, v151, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
          v118 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            goto LABEL_131;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
          v216 = 1024;
          v217 = 1465;
        }
        else
        {
          v110 = (void *)v218;
          if ((_QWORD)v218)
            goto LABEL_99;
          v111 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v111, v112, v113, v114, v115, v116, v117, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
          v118 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            goto LABEL_131;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
          v216 = 1024;
          v217 = 1470;
        }
        _os_log_fault_impl(&dword_18A253000, v118, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        goto LABEL_131;
      case 6:
        if (!self)
          goto LABEL_137;
        *(_QWORD *)&v218 = 0;
        objc_msgSend(a3, "_resolveEntityWithContext:", a4);
        v71 = (void *)objc_msgSend(a3, "encodeForXPC");
        if (!v71)
        {
          v89 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F494B8);
          if (v89)
            goto LABEL_93;
          v103 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v103, v104, v105, v106, v107, v108, v109, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
          v97 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
            v216 = 1024;
            v217 = 1483;
            goto LABEL_123;
          }
          goto LABEL_137;
        }
        v72 = objc_alloc_init(NSCoreDataXPCMessage);
        v74 = v72;
        if (v72)
        {
          v72->_messageCode = 15;
          objc_setProperty_nonatomic(v72, v73, v71, 24);
        }

        v75 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v74, (uint64_t)a4, &v225, &v218);
        if (v75)
        {
          v76 = (void *)MEMORY[0x1E0C99E60];
          v77 = objc_opt_class();
          v78 = objc_opt_class();
          v79 = objc_opt_class();
          v80 = objc_msgSend(v76, "setWithObjects:", v77, v78, v79, objc_opt_class(), 0);
          v81 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v75, (uint64_t)self, v80);
          if (v81)
          {
            v46 = -[NSBatchUpdateResult initWithResultType:andObject:]([NSBatchUpdateResult alloc], "initWithResultType:andObject:", objc_msgSend(a3, "resultType"), v81);
            goto LABEL_134;
          }
          v123 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F494E0);
          *(_QWORD *)&v218 = v123;
          if (v123)
          {
LABEL_119:
            if (a5)
            {
              v46 = 0;
              *a5 = v123;
              goto LABEL_134;
            }
            goto LABEL_133;
          }
          v152 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v152, v153, v154, v155, v156, v157, v158, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
          v131 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
LABEL_133:
            v46 = 0;
            goto LABEL_134;
          }
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
          v216 = 1024;
          v217 = 1502;
        }
        else
        {
          v123 = (void *)v218;
          if ((_QWORD)v218)
            goto LABEL_119;
          v124 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v124, v125, v126, v127, v128, v129, v130, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
          v131 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            goto LABEL_133;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
          v216 = 1024;
          v217 = 1507;
        }
        _os_log_fault_impl(&dword_18A253000, v131, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        goto LABEL_133;
      case 7:
        if (!self)
          goto LABEL_137;
        objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "_resolveEntityWithContext:", a4);
        v34 = (void *)objc_msgSend(a3, "encodeForXPC");
        v35 = objc_alloc_init(NSCoreDataXPCMessage);
        v37 = v35;
        if (v35)
        {
          v35->_messageCode = 12;
          objc_setProperty_nonatomic(v35, v36, v34, 24);
        }

        *(_QWORD *)buf = 0;
        v38 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v37, (uint64_t)a4, &v218, buf);

        if (v38)
        {
          v39 = (void *)MEMORY[0x1E0C99E60];
          v40 = objc_opt_class();
          v41 = objc_opt_class();
          v42 = objc_opt_class();
          v43 = objc_msgSend(v39, "setWithObjects:", v40, v41, v42, objc_opt_class(), 0);
          v44 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v38, (uint64_t)self, v43);
          v45 = v44;
          if (a5 && !v44)
            *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F49508);
          v46 = -[NSBatchDeleteResult initWithResultType:andObject:]([NSBatchDeleteResult alloc], "initWithResultType:andObject:", objc_msgSend(a3, "resultType"), v45);
        }
        else
        {
          v46 = 0;
          if (a5)
            *a5 = *(id *)buf;
        }
        goto LABEL_134;
      case 8:
        goto LABEL_15;
      case 10:
        if (!a5)
          goto LABEL_137;
        v33 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134091, &unk_1E1F49580);
        goto LABEL_39;
      default:
        if (!a5)
          goto LABEL_137;
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v32 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Invalid request type"), CFSTR("Reason"));
        v33 = (id)objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v32);
LABEL_39:
        v13 = 0;
        *a5 = v33;
        goto LABEL_138;
    }
  }
  do
    v12 = __ldxr((unsigned int *)p_outstandingRequests);
  while (__stxr(v12 - 1, (unsigned int *)p_outstandingRequests));
  if (v9 != 8)
  {
    if (v9 == 1)
      return (id)NSArray_EmptyArray;
    goto LABEL_11;
  }
  if ((objc_msgSend(a3, "isDelete") & 1) != 0)
  {
LABEL_11:
    v13 = 0;
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134098, 0);
    return v13;
  }
  v15 = [NSPersistentHistoryResult alloc];
  v16 = objc_msgSend(a3, "resultType");
  -[NSPersistentHistoryResult initWithResultType:andResult:](v15, "initWithResultType:andResult:", v16, MEMORY[0x1E0C9AA60]);
LABEL_15:
  if (!self)
    goto LABEL_137;
  v212 = 0;
  if (!-[NSDictionary valueForKey:](-[NSPersistentStore options](self, "options"), "valueForKey:", CFSTR("NSPersistentHistoryTrackingKey")))
  {
    v82 = -[NSPersistentStore identifier](self, "identifier");
    -[NSPersistentStore URL](self, "URL");
    _NSCoreDataLog(1, (uint64_t)CFSTR("History Change Request failed as no history tracking option detected on store %@ at %@"), v83, v84, v85, v86, v87, v88, (uint64_t)v82);
    v89 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134091, &unk_1E1F49530);
    v212 = v89;
    if (v89)
      goto LABEL_93;
    v90 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v90, v91, v92, v93, v94, v95, v96, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
    v97 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
LABEL_137:
      v13 = 0;
      goto LABEL_138;
    }
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
    v216 = 1024;
    v217 = 1554;
    goto LABEL_123;
  }
  if (objc_msgSend(a3, "token")
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "token"), "storeTokens"), "objectForKey:", -[NSPersistentStore identifier](self, "identifier")))
  {
    v119 = (void *)MEMORY[0x1E0CB35C8];
    v225 = CFSTR("Reason");
    v120 = (void *)MEMORY[0x1E0CB3940];
    v121 = objc_msgSend(a3, "token");
    v222 = -[NSPersistentStore identifier](self, "identifier");
    *(_QWORD *)&v218 = objc_msgSend(v120, "stringWithFormat:", CFSTR("Unable to find stores referenced in History Token (%@) - %@"), v121, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v222, 1));
    v122 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v218, &v225, 1);
    v89 = (void *)objc_msgSend(v119, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134501, v122);
    v212 = v89;
    if (v89)
    {
LABEL_93:
      if (a5)
      {
        v13 = 0;
        *a5 = v89;
        goto LABEL_138;
      }
      goto LABEL_137;
    }
    v138 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v138, v139, v140, v141, v142, v143, v144, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
    v97 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      goto LABEL_137;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
    v216 = 1024;
    v217 = 1561;
LABEL_123:
    _os_log_fault_impl(&dword_18A253000, v97, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_137;
  }
  if (objc_msgSend(a3, "isDelete"))
  {
    v17 = (void *)objc_msgSend(a3, "encodeForXPC");
    v18 = objc_alloc_init(NSCoreDataXPCMessage);
    v20 = v18;
    if (v18)
    {
      v18->_messageCode = 13;
      objc_setProperty_nonatomic(v18, v19, v17, 24);
    }

    v21 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v20, (uint64_t)a4, buf, &v212);
    if (v21)
    {
      v209 = (void *)MEMORY[0x1E0C99E60];
      v207 = objc_opt_class();
      v206 = objc_opt_class();
      v205 = objc_opt_class();
      v204 = objc_opt_class();
      v22 = objc_opt_class();
      v23 = objc_opt_class();
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      v26 = objc_opt_class();
      v27 = objc_msgSend(v209, "setWithObjects:", v207, v206, v205, v204, v22, v23, v24, v25, v26, objc_opt_class(), 0);
      v28 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v21, (uint64_t)self, v27);
      v29 = v28;
      if (a5 && !v28)
        *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F49558);
      v30 = -[NSPersistentHistoryResult initWithResultType:andResult:]([NSPersistentHistoryResult alloc], "initWithResultType:andResult:", objc_msgSend(a3, "resultType"), v29);
    }
    else
    {
      v30 = 0;
      if (a5)
        *a5 = v212;
    }
    v14 = v30;
LABEL_135:
    v13 = v14;
    goto LABEL_138;
  }
  v211 = (NSManagedObjectContext *)a4;
  if (!a4)
  {
    v211 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v211, "setPersistentStoreCoordinator:", -[NSPersistentStore persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  }
  -[NSManagedObjectContext _setAllowAncillaryEntities:](v211, "_setAllowAncillaryEntities:", 1);
  if (objc_msgSend(a3, "token"))
  {
    v98 = -[NSPersistentHistoryChangeRequest fetchRequestDescribingTokenCheckForStore:]((NSFetchRequest *)a3, self);
    if (v98)
    {
      v99 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v98, v211, &v212);
      if (objc_msgSend(v99, "count") && (objc_msgSend((id)objc_msgSend(v99, "firstObject"), "BOOLValue") & 1) == 0)
      {
        v100 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Persistent History Token is expired for store at %@"), -[NSURL path](-[NSPersistentStore URL](self, "URL"), "path"));
        v101 = (void *)MEMORY[0x1E0CB35C8];
        v225 = v100;
        v222 = (NSString *)CFSTR("message");
        v223 = CFSTR("NSStoreUUID");
        v226 = -[NSPersistentStore identifier](self, "identifier");
        v224 = *MEMORY[0x1E0CB2AA0];
        v227 = -[NSURL path](-[NSPersistentStore URL](self, "URL"), "path");
        v102 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v225, &v222, 3);
        v212 = (void *)objc_msgSend(v101, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134301, v102);
      }

      if (v212)
      {
        if (a5)
          *a5 = v212;
        if (a4)
        {
LABEL_82:
          -[NSManagedObjectContext _setAllowAncillaryEntities:](v211, "_setAllowAncillaryEntities:", 0);
          goto LABEL_137;
        }
LABEL_136:

        goto LABEL_137;
      }
    }
  }
  else if (objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "predicate"))
  {
    v132 = -[_NSPersistentHistoryTransactionPredicateParser initWithPredicate:]([_NSPersistentHistoryTransactionPredicateParser alloc], "initWithPredicate:", objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "predicate"));
    *(_QWORD *)buf = 0;
    -[_NSPersistentHistoryTransactionPredicateParser parse:](v132, "parse:", buf);
    if (*(_QWORD *)buf)
    {
      if (a5)
        *a5 = *(id *)buf;
      goto LABEL_137;
    }
    v162 = objc_msgSend(-[_NSPersistentHistoryTransactionPredicateParser storeTokens](v132, "storeTokens"), "objectForKey:", -[NSPersistentStore identifier](self, "identifier"));
    if (v162)
    {
      v163 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), +[_PFPersistentHistoryModel ancillaryModelNamespace](_PFPersistentHistoryModel, "ancillaryModelNamespace"), CFSTR("TRANSACTION")));
      -[NSFetchRequest setIncludesSubentities:](v163, "setIncludesSubentities:", 0);
      -[NSFetchRequest setPredicate:](v163, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("_pk = %@"), v162));
      -[NSFetchRequest setResultType:](v163, "setResultType:", 4);
      v164 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v163, v211, &v212);

      if (objc_msgSend(v164, "count"))
      {
        if ((objc_msgSend((id)objc_msgSend(v164, "firstObject"), "BOOLValue") & 1) == 0)
        {
          v165 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Persistent History Token is expired for store at %@"), -[NSURL path](-[NSPersistentStore URL](self, "URL"), "path"));
          v166 = (void *)MEMORY[0x1E0CB35C8];
          v225 = v165;
          v222 = (NSString *)CFSTR("message");
          v223 = CFSTR("NSStoreUUID");
          v226 = -[NSPersistentStore identifier](self, "identifier");
          v224 = *MEMORY[0x1E0CB2AA0];
          v227 = -[NSURL path](-[NSPersistentStore URL](self, "URL"), "path");
          v167 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v225, &v222, 3);
          v168 = (void *)objc_msgSend(v166, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134301, v167);
          v212 = v168;
          if (v168)
          {
            if (a5)
              *a5 = v168;
            if (a4)
              goto LABEL_82;
            goto LABEL_136;
          }
        }
      }
    }
  }
  v169 = objc_msgSend(a3, "resultType") == 2
      || objc_msgSend(a3, "resultType") == 6
      || objc_msgSend(a3, "resultType") == 0;
  v170 = -[NSPersistentHistoryChangeRequest fetchRequestDescribingChangeRequestForStore:](a3, self);
  if (v169)
    v171 = 4;
  else
    v171 = 2 * (objc_msgSend(a3, "fetchBatchSize") == 0);
  -[NSFetchRequest setResultType:](v170, "setResultType:", v171);
  v172 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v170, v211, &v212);
  v208 = v170;
  if (objc_msgSend(a3, "resultType") == 5
    && (objc_msgSend((id)objc_msgSend(a3, "entityNameToFetch"), "isEqualToString:", CFSTR("CHANGE")) & 1) == 0
    && !objc_msgSend(a3, "fetchBatchSize"))
  {
    v191 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v172, "count"));
    v220 = 0u;
    v221 = 0u;
    v218 = 0u;
    v219 = 0u;
    v192 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
    if (v192)
    {
      v193 = *(_QWORD *)v219;
      do
      {
        for (j = 0; j != v192; ++j)
        {
          if (*(_QWORD *)v219 != v193)
            objc_enumerationMutation(v172);
          objc_msgSend(v191, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v218 + 1) + 8 * j), "objectForKey:", CFSTR("self")));
        }
        v192 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
      }
      while (v192);
    }
    if (objc_msgSend(v191, "count"))
    {
      v187 = -[NSPersistentHistoryChangeRequest initWithTransactionIDs:]([NSPersistentHistoryChangeRequest alloc], "initWithTransactionIDs:", v191);
      v188 = -[NSPersistentHistoryChangeRequest fetchRequestDescribingChangeRequestForStore:](v187, self);
      -[NSFetchRequest setResultType:](v188, "setResultType:", 2);
      v195 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v188, v211, &v212);
      v182 = 0;
      if (!v212 && v195)
      {
        v213 = v172;
        v214 = v195;
        v182 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v213, 2);
      }
      goto LABEL_208;
    }
LABEL_206:
    v182 = (uint64_t)v172;
    goto LABEL_209;
  }
  if ((objc_msgSend(a3, "resultType") == 1 || objc_msgSend(a3, "resultType") == 4)
    && objc_msgSend((id)objc_msgSend(a3, "entityNameToFetch"), "isEqualToString:", CFSTR("TRANSACTION")))
  {
    v173 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v172, "count"));
    v220 = 0u;
    v221 = 0u;
    v218 = 0u;
    v219 = 0u;
    v174 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
    if (v174)
    {
      v175 = *(_QWORD *)v219;
      do
      {
        for (k = 0; k != v174; ++k)
        {
          if (*(_QWORD *)v219 != v175)
            objc_enumerationMutation(v172);
          objc_msgSend(v173, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v218 + 1) + 8 * k), "objectForKey:", CFSTR("self")));
        }
        v174 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
      }
      while (v174);
    }
    if (objc_msgSend(v173, "count"))
    {
      v177 = -[NSPersistentHistoryChangeRequest initWithTransactionIDs:]([NSPersistentHistoryChangeRequest alloc], "initWithTransactionIDs:", v173);
      v178 = -[NSPersistentHistoryChangeRequest fetchRequestDescribingChangeRequestForStore:](v177, self);
      -[NSFetchRequest setResultType:](v178, "setResultType:", 2);
      v179 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v178, v211, &v212);
      v180 = v212;

      if (v179)
        v181 = v180 == 0;
      else
        v181 = 0;
      if (v181)
        v182 = (uint64_t)v179;
      else
        v182 = 0;

      goto LABEL_209;
    }
    goto LABEL_193;
  }
  if (objc_msgSend(a3, "resultType") != 3 && objc_msgSend(a3, "resultType") != 5
    || !objc_msgSend((id)objc_msgSend(a3, "entityNameToFetch"), "isEqualToString:", CFSTR("CHANGE")))
  {
    goto LABEL_206;
  }
  v183 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v172, "count"));
  v220 = 0u;
  v221 = 0u;
  v218 = 0u;
  v219 = 0u;
  v184 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
  if (v184)
  {
    v185 = *(_QWORD *)v219;
    do
    {
      for (m = 0; m != v184; ++m)
      {
        if (*(_QWORD *)v219 != v185)
          objc_enumerationMutation(v172);
        objc_msgSend(v183, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v218 + 1) + 8 * m), "objectForKey:", CFSTR("TRANSACTIONID")));
      }
      v184 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v218, buf, 16);
    }
    while (v184);
  }
  if (objc_msgSend(v183, "count"))
  {
    v187 = -[NSPersistentHistoryChangeRequest initWithTransactionIDs:]([NSPersistentHistoryChangeRequest alloc], "initWithTransactionIDs:", v183);
    -[NSPersistentHistoryChangeRequest setResultType:](v187, "setResultType:", 3);
    v188 = -[NSPersistentHistoryChangeRequest fetchRequestDescribingChangeRequestForStore:](v187, self);
    -[NSFetchRequest setResultType:](v188, "setResultType:", 2);
    v189 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v188, v211, &v212);
    v182 = 0;
    if (!v212)
    {
      v190 = v189;
      if (v189)
      {
        if (objc_msgSend(a3, "resultType") == 5)
        {
          v213 = v190;
          v214 = v172;
          v182 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v213, 2);
        }
        else
        {
          v182 = (uint64_t)v190;
        }
      }
    }
LABEL_208:

    goto LABEL_209;
  }
LABEL_193:
  v182 = MEMORY[0x1E0C9AA60];
LABEL_209:
  v13 = +[NSPersistentHistoryResult _processResult:forRequest:withProvider:](NSPersistentHistoryResult, "_processResult:forRequest:withProvider:", v182, a3, self);
  if (a4)
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v211, "_setAllowAncillaryEntities:", 0);
  else

  do
  {
LABEL_138:
    v159 = __ldxr((unsigned int *)p_outstandingRequests);
    v160 = v159 - 1;
  }
  while (__stxr(v160, (unsigned int *)p_outstandingRequests));
  if (!v160)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_requestTerminationSem);
  return v13;
}

- (id)currentChangeToken
{
  id v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v3 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__NSXPCStore_Internal__currentChangeToken__block_invoke;
  v6[3] = &unk_1E1EDD0E0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)type
{
  return CFSTR("NSXPCStore");
}

- (id)metadata
{
  os_unfair_lock_s *p_stateLock;
  NSDictionary *metadata;
  NSDictionary *v5;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  metadata = self->_metadata;
  if (metadata)
  {
    v5 = metadata;
    os_unfair_lock_unlock(p_stateLock);
    if (v5)
      return v5;
  }
  else
  {
    os_unfair_lock_unlock(p_stateLock);
  }
  v5 = 0;
  if (-[NSXPCStore loadMetadata:](self, "loadMetadata:", 0))
  {
    os_unfair_lock_lock_with_options();
    v5 = self->_metadata;
    os_unfair_lock_unlock(p_stateLock);
  }
  return v5;
}

- (Class)objectIDFactoryForSQLEntity:(id)a3
{
  if (a3 && *((_QWORD *)a3 + 3))
    return (Class)-[NSXPCStore objectIDFactoryForEntity:](self, "objectIDFactoryForEntity:");
  else
    return 0;
}

- (id)objectIDFactoryForEntity:(id)a3
{
  id v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSXPCStore;
  v5 = -[NSPersistentStore objectIDFactoryForEntity:](&v8, sel_objectIDFactoryForEntity_);
  if (!objc_msgSend(v5, "_storeInfo1"))
  {
    v6 = 0;
    if (self && a3)
      v6 = _sqlEntityForEntityDescription((uint64_t)self->_model, a3);
    objc_msgSend(v5, "_setStoreInfo1:", v6);
  }
  return v5;
}

- (id)_storeInfoForEntityDescription:(id)a3
{
  return (id)_sqlEntityForEntityDescription((uint64_t)self->_model, a3);
}

- (id)sqlCore
{
  return self->_core;
}

- (id)sendMessage:(uint64_t)a3 fromContext:(_QWORD *)a4 interrupts:(_QWORD *)a5 error:
{
  void *v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  const char *v15;
  char v16;
  char v17;
  void *v18;
  const char *v19;
  unint64_t v20;
  unint64_t v21;
  double Current;
  unint64_t v23;
  _QWORD *v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  double v41;
  unsigned int v42;
  int v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  BOOL v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i;
  void *v105;
  void *v106;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  _QWORD *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (self)
  {
    v10 = (void *)a1[22];
    if (v10)
      objc_setProperty_nonatomic(self, (SEL)self, v10, 32);
  }
  v114 = a5;
  if (!a3)
    goto LABEL_12;
  v11 = (id)objc_msgSend(*(id *)(a3 + 168), "copy");
  if (self)
  {
    v13 = v11;
    if (v11)
      objc_setProperty_nonatomic(self, v12, v11, 40);
  }
  v14 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a3 + 184) + 128), "copy", v13);
  if (!v14)
  {
LABEL_12:
    v16 = objc_msgSend((id)a3, "_allowAncillaryEntities");
    if (self)
      goto LABEL_13;
LABEL_95:
    v17 = 1;
    goto LABEL_14;
  }
  if (!self)
  {
    objc_msgSend((id)a3, "_allowAncillaryEntities");
    goto LABEL_95;
  }
  objc_setProperty_nonatomic(self, v15, v14, 48);
  v16 = objc_msgSend((id)a3, "_allowAncillaryEntities");
LABEL_13:
  v17 = 0;
  *((_BYTE *)self + 16) = v16;
LABEL_14:
  v18 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
  if ((v17 & 1) == 0)
    objc_setProperty_nonatomic(self, v19, v18, 56);
  v20 = 0;
  v21 = 0x1E0CB3000uLL;
  while (1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (a1[19])
    {
      v23 = v21;
      v24 = -[NSXPCStoreMessageContext initForMessage:store:]([NSXPCStoreMessageContext alloc], "initForMessage:store:", self, a1);
      -[NSXPCStoreConnectionManager sendMessageWithContext:](a1[19], (uint64_t)v24);
      if (v24)
        v25 = (void *)v24[3];
      else
        v25 = 0;
      v26 = v25;
      if (v114)
      {
        if (v24)
          v27 = (void *)v24[4];
        else
          v27 = 0;
        *v114 = v27;
      }

      v21 = v23;
      if (v26)
        break;
    }
    v29 = objc_msgSend(*(id *)(v21 + 2368), "stringWithFormat:", CFSTR("sendMessage: failed #%d"), v20);
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v29, (uint64_t)a1, v30, v31, v32, v33, v34, v109);
    v40 = v20 + 1;
    *a4 = v20 + 1;
    if (v20 == 2)
    {
      +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)CFSTR("Unable to sendMessage: to server"), (uint64_t)a1, v35, v36, v37, v38, v39, v108);
LABEL_28:
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "options"), "valueForKey:", CFSTR("NSXPCStoreSkipRetryWaitKey")), "BOOLValue") & 1) == 0)
      {
        v41 = CFAbsoluteTimeGetCurrent();
        if (v20 < 4)
          v42 = 3;
        else
          v42 = +[NSXPCStore _isOnExtendedTimeout](NSXPCStore, "_isOnExtendedTimeout") ? 60 : 3;
        v28 = v41 - Current;
        if (v41 - Current < (double)v42)
          sleep(v42 - v28);
      }
      goto LABEL_36;
    }
    if (v20)
      goto LABEL_28;
LABEL_36:
    ++v20;
    if (v40 == 8)
    {
      v26 = 0;
      v43 = 1;
      goto LABEL_41;
    }
  }
  v43 = 0;
LABEL_41:
  if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault", v28) >= 1)
  {
    NSLog((NSString *)CFSTR("Got reply pointer: %p"), v26);
    v108 = (uint64_t)v26;
    NSLog((NSString *)CFSTR("Got reply: %@"));
  }
  if (v43)
  {
    v44 = *(void **)(v21 + 2368);
    v110 = objc_msgSend(a1, "options");
    v45 = objc_msgSend(v44, "stringWithFormat:", CFSTR("Unable to connect to server with options %@"));
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v45, (uint64_t)a1, v46, v47, v48, v49, v50, v110);
    v51 = v114;
    if (v114)
    {
      v52 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB28A8];
      v54 = (void *)MEMORY[0x1E0C99D80];
      v55 = (const __CFString *)objc_msgSend(*(id *)(v21 + 2368), "stringWithFormat:", CFSTR("Unable to send to server; failed after %d attempts."),
                                  8);
      v56 = v54;
      goto LABEL_46;
    }
    return 0;
  }
  else
  {
    v58 = objc_msgSend(v26, "objectForKey:", CFSTR("reply"));
    v59 = objc_msgSend(v26, "objectForKey:", CFSTR("error"));
    if (NSKeyValueCoding_NullValue == v59)
      v60 = 0;
    else
      v60 = (void *)v59;
    if (v58)
    {
      v61 = *(void **)(v58 + 24);
      v62 = *(_QWORD *)(v58 + 8) == 0;
    }
    else
    {
      v61 = 0;
      v62 = 1;
    }
    v63 = v61;
    v57 = v63;
    if (v62)
    {
      if (v60)
      {
        if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault") >= 1)
          _NSCoreDataLog(8, (uint64_t)CFSTR(" Got success, but also an error. Ignoring the error (%@)."), v69, v70, v71, v72, v73, v74, (uint64_t)v60);
      }
      else if (!v63)
      {
        +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)CFSTR("sendMessage: apparently succeeded, but no response or error"), (uint64_t)a1, v64, v65, v66, v67, v68, v108);
        v51 = v114;
        if (!v114)
          return 0;
        v52 = (void *)MEMORY[0x1E0CB35C8];
        v53 = *MEMORY[0x1E0CB28A8];
        v56 = (void *)MEMORY[0x1E0C99D80];
        v55 = CFSTR("No data, cause unknown");
LABEL_46:
        v57 = 0;
        *v51 = objc_msgSend(v52, "errorWithDomain:code:userInfo:", v53, 134060, objc_msgSend(v56, "dictionaryWithObject:forKey:", v55, CFSTR("Problem")));
      }
    }
    else
    {
      if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault") >= 1)
        _NSCoreDataLog(8, (uint64_t)CFSTR(" Request failed: (%@)."), v75, v76, v77, v78, v79, v80, (uint64_t)v60);
      if (v60)
      {
        v81 = (void *)objc_msgSend(v60, "userInfo");
        v82 = objc_msgSend(v60, "code");
        v83 = objc_msgSend(v81, "objectForKey:", CFSTR("NSAffectedObjectsErrorKey"));
        v113 = v81;
        if (v83)
        {
          v84 = (void *)v83;
          v111 = v82;
          v85 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v119 = 0u;
          v120 = 0u;
          v121 = 0u;
          v122 = 0u;
          v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
          if (v86)
          {
            v87 = v86;
            v88 = *(_QWORD *)v120;
            do
            {
              v89 = 0;
              do
              {
                if (*(_QWORD *)v120 != v88)
                  objc_enumerationMutation(v84);
                if (a3)
                  v90 = _PFRetainedObjectIDCore(a3, *(void **)(*((_QWORD *)&v119 + 1) + 8 * v89), 0, 1);
                else
                  v90 = 0;
                objc_msgSend(v85, "addObject:", v90);

                ++v89;
              }
              while (v87 != v89);
              v91 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
              v87 = v91;
            }
            while (v91);
          }
          v81 = v113;
          v92 = (void *)objc_msgSend(v113, "mutableCopy");
          objc_msgSend(v92, "setObject:forKey:", v85, CFSTR("NSAffectedObjectsErrorKey"));

          v82 = v111;
        }
        else
        {
          v92 = 0;
        }
        v99 = (void *)objc_msgSend(v81, "objectForKey:", CFSTR("conflictList"));
        if (v99)
        {
          v100 = v99;
          v112 = v92;
          v117 = 0u;
          v118 = 0u;
          v115 = 0u;
          v116 = 0u;
          v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
          if (v101)
          {
            v102 = v101;
            v103 = *(_QWORD *)v116;
            do
            {
              for (i = 0; i != v102; ++i)
              {
                if (*(_QWORD *)v116 != v103)
                  objc_enumerationMutation(v100);
                v105 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
                v106 = (void *)MEMORY[0x18D76B4E4]();
                objc_msgSend(v105, "_doCleanupForXPCStore:context:", a1, a3);
                objc_autoreleasePoolPop(v106);
              }
              v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
            }
            while (v102);
          }
          v92 = v112;
          if (!v112)
            v92 = (void *)objc_msgSend(v113, "mutableCopy");
          objc_msgSend(v92, "setObject:forKey:", v100, CFSTR("conflictList"));
          v82 = 134050;
        }
        if (v92)
        {
          v60 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", objc_msgSend(v60, "domain"), v82, v92);

        }
        if (v114)
          *v114 = v60;
      }
      else
      {
        v93 = objc_msgSend(*(id *)(v21 + 2368), "stringWithFormat:", CFSTR("Send failed with no error; probably something wrong here"));
        +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v93, (uint64_t)a1, v94, v95, v96, v97, v98, v108);
      }
    }
  }
  return v57;
}

- (uint64_t)executeFetchRequest:(NSManagedObjectContext *)a3 withContext:(_QWORD *)a4 error:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSCoreDataXPCMessage *v17;
  NSCoreDataXPCMessage *v18;
  _WORD *v19;
  uint64_t v20;
  const char *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _WORD *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _PFBatchFaultingArray *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  BOOL v47;
  _PFArray *v48;
  _PFBatchFaultingArray *v49;
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
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  void **v66;
  void **v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  id *v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  void **v88;
  unsigned int *v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t k;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  void **v96;
  unint64_t v97;
  uint64_t v98;
  int v99;
  id v100;
  _PFBatchFaultingArray *v101;
  _QWORD *v102;
  id v103;
  NSPersistentStore *v104;
  NSManagedObjectContext *v105;
  uint64_t v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  void *v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v102 = a4;
  v105 = a3;
  v119 = *MEMORY[0x1E0C80C00];
  v104 = (NSPersistentStore *)result;
  if (!result)
    return result;
  v107 = 0;
  v100 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR("Executing fetch %@"), v5, v6, v7, v8, v9, v10, a2);
  if (objc_msgSend((id)a2, "fetchBatchSize") && !objc_msgSend((id)a2, "resultType"))
  {
    v11 = (id)objc_msgSend((id)a2, "copy");
    objc_msgSend(v11, "setResultType:", 1);
    objc_msgSend(v11, "setFetchBatchSize:", 0);
    v99 = 1;
    v98 = a2;
    a2 = (uint64_t)v11;
  }
  else
  {
    v98 = 0;
    v99 = 0;
  }
  if ((_MergedGlobals_116 & 1) == 0
    && objc_msgSend((id)a2, "resultType") == 2
    && !objc_msgSend((id)a2, "allocationType")
    && !objc_msgSend((id)a2, "fetchBatchSize")
    && objc_msgSend((id)a2, "_isEditable"))
  {
    v12 = -[NSManagedObjectContext _allowAncillaryEntities](v105, "_allowAncillaryEntities");
    v13 = a2 ? v12 : 1;
    if ((v13 & 1) == 0)
      *(_DWORD *)(a2 + 104) = *(_DWORD *)(a2 + 104) & 0xFFFE3FFF | 0x4000;
  }
  v14 = +[NSSQLCore bufferedAllocationsOverride](NSSQLCore, "bufferedAllocationsOverride");
  if (v14 >= 1 && objc_msgSend((id)a2, "resultType") == 2 && objc_msgSend((id)a2, "_isEditable"))
  {
    if (v14 == 1)
      v15 = 1;
    else
      v15 = 2;
    objc_msgSend((id)a2, "setAllocationType:", v15);
  }
  v16 = (void *)objc_msgSend((id)a2, "encodeForXPC");
  v17 = objc_alloc_init(NSCoreDataXPCMessage);
  v18 = v17;
  if (v17)
    v17->_messageCode = 2;
  v19 = -[_NSQueryGenerationToken _generationalComponentForStore:](-[NSManagedObjectContext _queryGenerationToken](v105, "_queryGenerationToken"), v104);
  if (v19)
    v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v16, v19, 0);
  else
    v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v16);

  v22 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, v20);
  if (v18)
    objc_setProperty_nonatomic(v18, v21, v22, 24);

  v23 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)v104, v18, (uint64_t)v105, &v106, &v107);
  if (!v23)
  {
    if (v107)
    {
      v40 = (void *)objc_msgSend(v107, "userInfo");
      v41 = (void *)objc_msgSend(v40, "objectForKey:", CFSTR("exception info"));
      v42 = (void *)objc_msgSend(v41, "objectForKey:", CFSTR("controlled exception"));
      if (v41)
      {
        if ((objc_msgSend(v42, "BOOLValue") & 1) == 0)
        {
          v43 = (void *)MEMORY[0x1E0C99DA0];
          v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fetch threw on server (%@)"), v40);
          v45 = (void *)objc_msgSend(v43, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v44, v40);
          if (v45)
            objc_exception_throw(v45);
        }
      }
    }
    v34 = 0;
    goto LABEL_56;
  }
  if (-[NSManagedObjectContext _allowAncillaryEntities](v105, "_allowAncillaryEntities")
    && objc_msgSend((id)a2, "_isEditable"))
  {
    objc_msgSend((id)a2, "_resolveEntityWithContext:", v105);
  }
  v24 = (void *)NSSet_EmptySet;
  v25 = -[NSManagedObjectModel _allowedClassesFromTransformableAttributes](objc_msgSend((id)-[NSPersistentStore model](v104, "model"), "managedObjectModel"));
  if (objc_msgSend(v24, "count"))
    v25 = objc_msgSend(v24, "setByAddingObjectsFromSet:", v25);
  v26 = objc_msgSend((id)+[_NSXPCStoreUtilities classesForFetchArchive](), "setByAddingObjectsFromSet:", v25);
  v103 = (id)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v23, (uint64_t)v104, v26);
  if (objc_msgSend(v103, "count"))
  {
    v27 = -[_NSQueryGenerationToken _generationalComponentForStore:](-[NSManagedObjectContext _queryGenerationToken](v105, "_queryGenerationToken"), v104);
    v28 = (void *)objc_msgSend(v103, "objectAtIndex:", 0);
    v29 = objc_msgSend((id)a2, "resultType");
    v30 = v29;
    if (v29 != 4)
    {
      if (v29)
      {
        v46 = 0;
        v47 = 0;
      }
      else
      {
        v46 = objc_msgSend((id)a2, "_disablePersistentStoreResultCaching") ^ 1;
        v47 = objc_msgSend((id)objc_msgSend((id)a2, "propertiesToFetch"), "count") != 0;
      }
      v116 = 0;
      if (objc_msgSend((id)a2, "allocationType") == 1 || objc_msgSend((id)a2, "allocationType") == 2)
      {
        if (v46)
          v66 = &v116;
        else
          v66 = 0;
        v101 = (_PFBatchFaultingArray *)+[_NSXPCStoreUtilities _decodeBufferResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, v28, (void *)a2, 0, (uint64_t)v104, (uint64_t)v105, (uint64_t)v66, (uint64_t *)&v107);
      }
      else
      {
        if (v46)
          v67 = &v116;
        else
          v67 = 0;
        v101 = (_PFBatchFaultingArray *)+[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, v28, (NSFetchRequest *)a2, 0, v104, v105, v67, &v107);
      }
      if (v116)
        v68 = v47;
      else
        v68 = 1;
      if ((v68 & 1) == 0 && ((v46 ^ 1) & 1) == 0)
        -[NSXPCStore cacheFetchedRows:forManagedObjects:generation:]((uint64_t)v104, v116, v101, v27);
      if (!v30)
      {
        if (v47)
        {
          v97 = -[_PFBatchFaultingArray count](v101, "count");
          if (v97)
          {
            v95 = -[NSPersistentStore faultHandler]((unint64_t)v104);
            v96 = (void **)-[_PFBatchFaultingArray _objectsPointer](v101, "_objectsPointer");
            v69 = *v96;
            v70 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v71 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v72 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v114 = 0u;
            v115 = 0u;
            v112 = 0u;
            v113 = 0u;
            v73 = (void *)objc_msgSend(v69, "mapping");
            v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
            if (v74)
            {
              v75 = *(_QWORD *)v113;
              do
              {
                for (i = 0; i != v74; ++i)
                {
                  if (*(_QWORD *)v113 != v75)
                    objc_enumerationMutation(v73);
                  v77 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a2, "entity"), "propertiesByName"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i));
                  v78 = v77;
                  if (v77 && (objc_msgSend(v77, "_entitysReferenceID") & 0x8000000000000000) == 0)
                  {
                    objc_msgSend(v70, "addObject:", v78);
                    objc_msgSend(v71, "addObject:", v78);
                  }
                }
                v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
              }
              while (v74);
            }
            v110 = 0u;
            v111 = 0u;
            v108 = 0u;
            v109 = 0u;
            v79 = (void *)objc_msgSend((id)a2, "propertiesToFetch");
            v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
            v81 = v96;
            if (v80)
            {
              v82 = *(_QWORD *)v109;
              do
              {
                for (j = 0; j != v80; ++j)
                {
                  if (*(_QWORD *)v109 != v82)
                    objc_enumerationMutation(v79);
                  v84 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * j);
                  if (objc_msgSend(v84, "isTransient"))
                  {
                    objc_msgSend(v72, "addObject:", v84);
                    if ((objc_msgSend(v84, "_entitysReferenceID") & 0x8000000000000000) == 0)
                      objc_msgSend(v71, "addObject:", objc_msgSend(v84, "name"));
                  }
                }
                v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
              }
              while (v80);
            }
            if (v97 <= 1)
              v85 = 1;
            else
              v85 = v97;
            v86 = v95;
            do
            {
              v87 = *v81;
              v88 = (void **)objc_msgSend(*v81, "values");
              v89 = (unsigned int *)-[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v105, *v88, v86);
              _PFFaultHandlerFulfillPartialFault(v86, v89, (uint64_t)v105, (uint64_t)v88, v70, (uint64_t)v71, v72);
              *v81 = v89;

              ++v81;
              --v85;
            }
            while (v85);
          }
        }
        else
        {
          v90 = -[NSPersistentStore faultHandler]((unint64_t)v104);
          v91 = objc_msgSend(v116, "count");
          if (v91)
          {
            for (k = 0; k != v91; ++k)
            {
              v93 = -[_PFBatchFaultingArray objectAtIndex:](v101, "objectAtIndex:", k);
              _PFFaultHandlerFulfillFault(v90, v93, (uint64_t)v105, (void *)objc_msgSend(v116, "objectAtIndex:", k), 0);
            }
          }
        }
      }

      if ((unint64_t)objc_msgSend(v103, "count") >= 2)
        -[NSXPCStore decodePrefetchArray:forSources:context:](v104, (void *)objc_msgSend(v103, "objectAtIndex:", 1), v101, v105);
      goto LABEL_42;
    }
    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v103 = (id)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v28, (uint64_t)v104, v33);
  }
  v101 = (_PFBatchFaultingArray *)v103;
LABEL_42:
  v34 = v101;
  if (v99)
  {
    v35 = -[_PFBatchFaultingArray count](v101, "count");
    v36 = MEMORY[0x1E0C80A78](v35);
    v39 = (char *)&v94 - v38;
    if (v36 >= 0x201)
      v39 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v94 - v38, 8 * v37);
    -[_PFBatchFaultingArray getObjects:range:](v34, "getObjects:range:", v39, 0, v35);
    v48 = -[_PFArray initWithObjects:count:andFlags:]([_PFArray alloc], "initWithObjects:count:andFlags:", v39, v35, 27);
    if (v35 >= 0x201)
      NSZoneFree(0, v39);

    v49 = [_PFBatchFaultingArray alloc];
    v34 = -[_PFBatchFaultingArray initWithPFArray:andRequest:andContext:](v49, "initWithPFArray:andRequest:andContext:", v48, v98, v105);

  }
LABEL_56:
  if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault"))
  {
    if (v34)
    {
      v56 = -[_PFBatchFaultingArray count](v34, "count");
      _NSCoreDataLog(8, (uint64_t)CFSTR("Fetch retrieved %lu results from server"), v57, v58, v59, v60, v61, v62, v56);
    }
    else
    {
      _NSCoreDataLog(8, (uint64_t)CFSTR("Fetch retrieved null, error %@"), v50, v51, v52, v53, v54, v55, (uint64_t)v107);
    }
  }
  v63 = v107;
  objc_msgSend(v100, "drain");
  v64 = v107;
  v65 = 0;

  if (v102)
  {
    if (v107)
      *v102 = v107;
  }
  return (uint64_t *)v34;
}

+ (int)debugDefault
{
  return dword_1ECD8D794;
}

- (id)model
{
  return self->_model;
}

- (BOOL)supportsConcurrentRequestHandling
{
  id v2;
  uint64_t v3;
  BOOL v4;

  v2 = -[NSDictionary valueForKey:](-[NSPersistentStore options](self, "options"), "valueForKey:", CFSTR("NSPersistentStoreConnectionPoolMaxSize"));
  v3 = objc_msgSend(v2, "integerValue");
  if (v2)
    v4 = v3 <= 0;
  else
    v4 = 0;
  return !v4;
}

- (BOOL)load:(id *)a3
{
  unsigned int v4;
  BOOL v5;
  int v6;
  int v7;
  NSCoreDataXPCMessage *v9;
  NSCoreDataXPCMessage *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;
  uint64_t v30;
  uint64_t v31;

  v29.receiver = self;
  v29.super_class = (Class)NSXPCStore;
  v4 = -[NSIncrementalStore load:](&v29, sel_load_, a3);
  v5 = v4;
  if (self && v4)
  {
    v6 = objc_msgSend(-[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options"), "objectForKey:", CFSTR("NSPersistentStoreRemoteChangeNotificationOptionKey")), "BOOLValue");
    v7 = objc_msgSend(-[NSDictionary valueForKey:](-[NSPersistentStore options](self, "options"), "valueForKey:", CFSTR("NSXPCStorePostUpdateNotifications")), "BOOLValue") | v6;
    if (!self->_observer && v7 != 0)
    {
      v9 = objc_alloc_init(NSCoreDataXPCMessage);
      v10 = v9;
      if (v9)
        v9->_messageCode = 7;
      v31 = 0;
      v11 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v9, 0, &v30, &v31);

      if (v11)
      {
        v18 = (void *)MEMORY[0x1E0C99E60];
        v19 = objc_opt_class();
        v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
        v21 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v11, (uint64_t)self, v20);
        if (v21)
          self->_remoteStoreChangedNotificationName = (NSString *)objc_msgSend((id)objc_msgSend(v21, "objectForKey:", CFSTR("notificationName")), "copy");
        else
          _NSCoreDataLog(8, (uint64_t)CFSTR("Failed to enable remote store notifications: Can't get notification name. %@"), v22, v23, v24, v25, v26, v27, v31);
      }
      if (self->_remoteStoreChangedNotificationName)
        self->_observer = (NSXPCStoreNotificationObserver *)-[NSXPCStoreNotificationObserver initForObservationWithName:store:]([NSXPCStoreNotificationObserver alloc], "initForObservationWithName:store:", -[NSXPCStore remoteStoreChangedNotificationName](self, "remoteStoreChangedNotificationName"), self);
      else
        _NSCoreDataLog(8, (uint64_t)CFSTR("Failed to enable remote store notifications: %@"), v12, v13, v14, v15, v16, v17, v31);
    }
  }
  return v5;
}

- (NSString)remoteStoreChangedNotificationName
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

+ (void)initialize
{
  const char *v3;

  objc_opt_self();
  if ((id)objc_opt_class() == a1)
  {
    dword_1ECD8D794 = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.XPCDebug"));
    v3 = getprogname();
    if (v3)
    {
      if (*v3)
      {
        if (!strncmp("PhotosReliveWidget", v3, 0x12uLL))
          _MergedGlobals_116 = 1;
      }
    }
  }
}

- (NSXPCStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  id v6;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSXPCStore *v26;
  NSSQLModel *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  NSSQLCore *v37;
  id *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v44;
  NSXPCStore *v45;
  id v46;
  id v47;
  objc_super v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v6 = a6;
  v60 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a6, "valueForKey:", CFSTR("serviceName"))
    && !objc_msgSend(v6, "valueForKey:", CFSTR("NSXPCStoreServiceName"))
    && !objc_msgSend(v6, "valueForKey:", CFSTR("NSXPCStoreServerEndpointFactory")))
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("No service name or endpoint factory supplied"), 0));
  }
  v47 = a4;
  if ((objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("skipModelCheck")), "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(v6, "valueForKey:", CFSTR("NSXPCStoreServerEndpointFactory"))
      && !objc_msgSend(v6, "valueForKey:", CFSTR("NSPersistentHistoryTrackingKey")))
    {
      v6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
      objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentHistoryTrackingKey"));
    }
  }
  else
  {
    v10 = (void *)objc_msgSend(a3, "managedObjectModel");
    v45 = self;
    v46 = a5;
    if (objc_msgSend(a4, "length")
      && !objc_msgSend(a4, "isEqualToString:", CFSTR("PF_DEFAULT_CONFIGURATION_NAME")))
    {
      v11 = (void *)objc_msgSend(v10, "entitiesForConfiguration:", a4);
    }
    else
    {
      v11 = (void *)objc_msgSend(v10, "entities");
    }
    v12 = v11;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v55 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v51;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v51 != v18)
                  objc_enumerationMutation(v16);
                v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
                if (objc_msgSend(v20, "_propertyType") == 4
                  && objc_msgSend(v20, "isToMany")
                  && objc_msgSend(v20, "isOrdered"))
                {
                  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("XPC store does not currently allow models containing ordered relationships"), 0));
                }
              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            }
            while (v17);
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v13);
    }
    a5 = v46;
    a4 = v47;
    self = v45;
  }
  v49.receiver = self;
  v49.super_class = (Class)NSXPCStore;
  v26 = -[NSPersistentStore initWithPersistentStoreCoordinator:configurationName:URL:options:](&v49, sel_initWithPersistentStoreCoordinator_configurationName_URL_options_, a3, a4, a5, v6);
  if (v26)
  {
    v26->_requestTerminationSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v26->_cache = -[NSGenerationalRowCache initWithStore:]([NSGenerationalRowCache alloc], "initWithStore:", v26);
    v27 = -[NSSQLModel initWithManagedObjectModel:configurationName:]([NSSQLModel alloc], "initWithManagedObjectModel:configurationName:", objc_msgSend(a3, "managedObjectModel"), v47);
    v26->_model = v27;
    if (!v27)
      +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)CFSTR("Unable to load model"), (uint64_t)v26, v28, v29, v30, v31, v32, v44);
    v26->_sanityCheckToken = 0;
    v26->_stateLock._os_unfair_lock_opaque = 0;
    v26->_outstandingRequests = 0;
    v26->_connectionManager = (NSXPCStoreConnectionManager *)-[NSXPCStoreConnectionManager initForStore:]([NSXPCStoreConnectionManager alloc], "initForStore:", v26);
    if (a3)
    {
      v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v35 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
      objc_msgSend(v35, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NSXPCStoreDelegate"));
      v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/dev/null/CDInternalXPCStore-%p"), v26);
      v37 = [NSSQLCore alloc];
      v38 = -[NSSQLCore initWithPersistentStoreCoordinator:configurationName:URL:options:](v37, "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, v47, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v36), v35);
      v26->_core = (NSSQLCore *)v38;
      -[NSSQLCore _useModel:](v38, v26->_model);
    }
    else
    {
      v34 = 0;
      v33 = 0;
    }
    v39 = objc_msgSend(v6, "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
    if (a3 && v39)
    {
      v40 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
      if ((objc_msgSend(v40, "isNSDictionary") & 1) == 0 && (objc_msgSend(v40, "isNSNumber") & 1) == 0)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersistentHistoryTrackingKey must be a NSNumber"), 0));
      if ((objc_msgSend(v40, "isNSDictionary") & 1) != 0
        || objc_msgSend(v40, "isNSNumber") && objc_msgSend(v40, "BOOLValue"))
      {
        v41 = -[NSDictionary objectForKey:](-[NSSQLCore ancillaryModels](v26->_core, "ancillaryModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
        -[_PFModelMap addManagedObjectModel:](*((_QWORD *)a3 + 12), v41);
        objc_msgSend(v33, "setObject:forKey:", v41, CFSTR("NSPersistentHistoryTrackingKey"));
        objc_msgSend(v34, "setObject:forKey:", objc_msgSend(-[NSSQLCore ancillarySQLModels](v26->_core, "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), CFSTR("NSPersistentHistoryTrackingKey"));
        v42 = +[_PFPersistentHistoryFetchModel newFetchHistoryModelForCoordinator:andOptions:]();
        -[_PFModelMap addManagedObjectModel:](*((_QWORD *)a3 + 12), v42);

      }
    }
    v26->_ancillaryModels = (NSDictionary *)objc_msgSend(v33, "copy");
    v26->_ancillarySQLModels = (NSDictionary *)objc_msgSend(v34, "copy");

  }
  else
  {
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)CFSTR("Unable to initialize client"), 0, v21, v22, v23, v24, v25, v44);
  }
  return v26;
}

- (void)setMetadata:(id)a3
{
  -[NSXPCStore _setMetadata:includeVersioning:](self, "_setMetadata:includeVersioning:", a3, 1);
}

- (BOOL)loadMetadata:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  NSCoreDataXPCMessage *v10;
  NSCoreDataXPCMessage *v11;
  id v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL result;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSString *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(-[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator"), "managedObjectModel");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(v5);
        if ((-[NSEntityDescription _hasAttributesWithFileBackedFutures](*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i)) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:
  v10 = objc_alloc_init(NSCoreDataXPCMessage);
  v11 = v10;
  if (v10)
    v10->_messageCode = 1;
  v40 = 0;
  v12 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v10, 0, &v39, &v40);
  if (v12)
  {
    v38 = 0;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, &v38, a3);
    v14 = v13;
    if (!v13)
    {

      return v12 != 0;
    }
    if (v9)
    {
      v15 = (NSString *)(id)objc_msgSend(v13, "objectForKey:", CFSTR("NSFileBackedFuturePathKey"));
      self->_fileBackedFuturesDirectory = v15;
      if (!v15)
      {
        v26 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F49468);
        result = 0;
        *a3 = v26;
        return result;
      }
      v14 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("NSMetadataKey"));
    }
    v16 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("NSStoreModelVersionIdentifiers"));
    if (!v16)
    {
      if (a3)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Server did not return model version info. (Unsupported configuration.)"), CFSTR("Reason"));
        v19 = (void *)objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134080, v18);
        v12 = 0;
        *a3 = v19;
      }
      else
      {
        v12 = 0;
      }
    }
    if (!objc_msgSend(-[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options"), "objectForKey:", CFSTR("NSIgnorePersistentStoreVersioningOption")), "BOOLValue")|| (objc_msgSend(v16, "isEqual:", objc_msgSend(v5, "entityVersionHashesByName")) & 1) != 0)
    {
      if (self)
      {
        os_unfair_lock_lock_with_options();
        v28 = self->_sanityCheckToken;
        os_unfair_lock_unlock(&self->_stateLock);
        v29 = v28;
        v30 = (NSString *)objc_msgSend(v14, "objectForKey:", CFSTR("NSStoreUUID"));
        if (v29)
        {
          if ((-[NSString isEqual:](v29, "isEqual:", v30) & 1) == 0)
          {
            if (a3)
            {
              v31 = (void *)MEMORY[0x1E0CB35C8];
              v32 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Server side store changed, remove and re-add this client store"), CFSTR("Reason"));
              v33 = (void *)objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v32);
              v12 = 0;
              *a3 = v33;
            }
            else
            {
              v12 = 0;
            }
          }
        }
        else
        {
          os_unfair_lock_lock_with_options();
          if (self->_sanityCheckToken != v30)
          {
            v34 = v30;

            self->_sanityCheckToken = v30;
          }
          os_unfair_lock_unlock(&self->_stateLock);
        }
      }
      else
      {
        objc_msgSend(v14, "objectForKey:", CFSTR("NSStoreUUID"));
      }
      -[NSXPCStore _setMetadata:includeVersioning:](self, "_setMetadata:includeVersioning:", v14, 0);

      if (v12)
        return v12 != 0;
      goto LABEL_24;
    }
    if (a3)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Server schema is incompatible and ignore version enabled. (Unsupported configuration.)"), CFSTR("Reason"));
      *a3 = (id)objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134020, v36);
    }
  }
  else if (a3)
  {
    *a3 = v40;
  }

LABEL_24:
  v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to load metadata: %@"), v40);
  +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v20, (uint64_t)self, v21, v22, v23, v24, v25, v37);
  v12 = 0;
  return v12 != 0;
}

- (void)_setMetadata:(id)a3 includeVersioning:(BOOL)a4
{
  id v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSXPCStore;
  v5 = -[NSPersistentStore _updatedMetadataWithSeed:includeVersioning:](&v7, sel__updatedMetadataWithSeed_includeVersioning_, a3, a4);
  os_unfair_lock_lock_with_options();
  if ((objc_msgSend(v5, "isEqual:", self->_metadata) & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSXPCStore;
    -[NSPersistentStore _setMetadataDirty:](&v6, sel__setMetadataDirty_, 1);

    self->_metadata = (NSDictionary *)v5;
  }
  os_unfair_lock_unlock(&self->_stateLock);
}

void __42__NSXPCStore_Internal__currentChangeToken__block_invoke(uint64_t a1)
{
  NSCoreDataXPCMessage *v2;
  NSCoreDataXPCMessage *v3;
  const char *v4;
  id v5;
  id v6;
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(NSCoreDataXPCMessage);
  v3 = v2;
  if (v2)
    v2->_messageCode = 14;
  v27[0] = objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1));
  if (v3)
    objc_setProperty_nonatomic(v3, v4, v5, 24);

  v26 = 0;
  v6 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 32), v3, 0, &v25, &v26);
  if (v6)
  {
    v13 = (uint64_t)v6;
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v18 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v13, *(_QWORD *)(a1 + 32), v17);
    if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault"))
      _NSCoreDataLog(8, (uint64_t)CFSTR("Decoded history token - %@"), v19, v20, v21, v22, v23, v24, (uint64_t)v18);

    if (v18)
    {
      if (objc_msgSend(v18, "count"))
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[_NSPersistentHistoryToken initWithDictionary:]([_NSPersistentHistoryToken alloc], "initWithDictionary:", v18);
    }
  }
  else
  {
    _NSCoreDataLog(8, (uint64_t)CFSTR("Nil result for history token request - %@"), v7, v8, v9, v10, v11, v12, v26);

  }
}

- (BOOL)_allowCoreDataFutures
{
  return 1;
}

+ (BOOL)_allowCoreDataFutures
{
  return 1;
}

+ (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return (id)objc_msgSend(a1, "archiver:willEncodeObject:", a4, a5);
}

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return (id)objc_msgSend((id)objc_opt_class(), "replacementObjectForXPCConnection:encoder:object:", a3, a4, a5);
}

- (void)dealloc
{
  NSObject *requestTerminationSem;
  objc_super v4;

  -[NSXPCStoreConnectionManager disconnectAllConnections:]((uint64_t)self->_connectionManager, 0);

  self->_ancillaryModels = 0;
  self->_ancillarySQLModels = 0;

  self->_connectionManager = 0;
  -[NSXPCStoreNotificationObserver setStore:]((id *)&self->_observer->super.isa, 0);

  self->_observer = 0;
  requestTerminationSem = self->_requestTerminationSem;
  if (requestTerminationSem)
    dispatch_release(requestTerminationSem);

  self->_remoteStoreChangedNotificationName = 0;
  self->_cache = 0;

  self->_model = 0;
  self->_metadata = 0;

  self->_core = 0;
  self->_sanityCheckToken = 0;

  self->_fileBackedFuturesDirectory = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSXPCStore;
  -[NSIncrementalStore dealloc](&v4, sel_dealloc);
}

- (void)willRemoveFromPersistentStoreCoordinator:(id)a3
{
  objc_super v5;

  if (self)
    -[NSXPCStoreConnectionManager disconnectAllConnections:]((uint64_t)self->_connectionManager, 1);
  -[NSXPCStoreNotificationObserver setStore:]((id *)&self->_observer->super.isa, 0);
  v5.receiver = self;
  v5.super_class = (Class)NSXPCStore;
  -[NSPersistentStore willRemoveFromPersistentStoreCoordinator:](&v5, sel_willRemoveFromPersistentStoreCoordinator_, a3);
}

- (void)setURL:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("CoreData: XPC: Can't move an XPC store from the client"), 0));
}

- (void)setIdentifier:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("CoreData: XPC: Can't change store identifier from the client"), 0));
}

- (id)_rawMetadata__
{
  return self->_metadata;
}

- (BOOL)supportsGenerationalQuerying
{
  return 1;
}

- (id)currentQueryGeneration
{
  id v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v3 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__NSXPCStore_currentQueryGeneration__block_invoke;
  v6[3] = &unk_1E1EDD0E0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __36__NSXPCStore_currentQueryGeneration__block_invoke(uint64_t a1)
{
  NSCoreDataXPCMessage *v2;
  NSCoreDataXPCMessage *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = objc_alloc_init(NSCoreDataXPCMessage);
  v3 = v2;
  if (v2)
    v2->_messageCode = 9;
  v25 = 0;
  v4 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 32), v2, 0, &v24, &v25);

  if (!v4)
  {
    v14 = CFSTR("Nil result for query generation request");
    goto LABEL_7;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v13 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v4, v11, v12);
  if (!v13)
  {
    v14 = CFSTR("Unable to decode query generation");
LABEL_7:
    _NSCoreDataLog(8, (uint64_t)v14, v5, v6, v7, v8, v9, v10, v22);
    v23 = v25;
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get query generation: %@"));
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v15, *(_QWORD *)(a1 + 32), v16, v17, v18, v19, v20, v23);
    v13 = 0;
  }
  result = v13;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_hasActiveGenerations
{
  NSXPCStore *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__NSXPCStore__hasActiveGenerations__block_invoke;
  v5[3] = &unk_1E1EDD0E0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __35__NSXPCStore__hasActiveGenerations__block_invoke(uint64_t a1)
{
  NSCoreDataXPCMessage *v2;
  NSCoreDataXPCMessage *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = objc_alloc_init(NSCoreDataXPCMessage);
  v3 = v2;
  if (v2)
    v2->_messageCode = 17;
  v25 = 0;
  v4 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 32), v2, 0, &v24, &v25);

  if (!v4)
  {
    v14 = CFSTR("Nil result for active generations request");
    goto LABEL_7;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v13 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v4, v11, v12);
  if (!v13)
  {
    v14 = CFSTR("Unable to decode active generations result");
LABEL_7:
    _NSCoreDataLog(8, (uint64_t)v14, v5, v6, v7, v8, v9, v10, v22);
    v23 = v25;
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to check for active generations: %@"));
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v15, *(_QWORD *)(a1 + 32), v16, v17, v18, v19, v20, v23);
    v13 = 0;
  }
  result = objc_msgSend(v13, "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)freeQueryGenerationWithIdentifier:(id)a3
{
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v5 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__NSXPCStore_freeQueryGenerationWithIdentifier___block_invoke;
  v6[3] = &unk_1E1EDD0B8;
  objc_copyWeak(&v7, &location);
  v6[4] = a3;
  objc_msgSend(v5, "performBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__NSXPCStore_freeQueryGenerationWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t *Weak;
  uint64_t *v3;
  void *v4;
  NSCoreDataXPCMessage *v5;
  NSCoreDataXPCMessage *v6;
  _NSQueryGenerationToken *v7;
  _QWORD *v8;
  id v9;
  const char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  Weak = (uint64_t *)objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    v3 = Weak;
    v4 = *(void **)(a1 + 32);
    -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](Weak[17], (uint64_t)v4);
    v5 = objc_alloc_init(NSCoreDataXPCMessage);
    v6 = v5;
    if (v5)
      v5->_messageCode = 10;
    v7 = [_NSQueryGenerationToken alloc];
    if (v7)
      v8 = -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v7, v4, v3, 0);
    else
      v8 = 0;
    v9 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v8);

    if (v6)
      objc_setProperty_nonatomic(v6, v10, v9, 24);

    v23 = 0;
    v11 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](v3, v6, 0, &v22, &v23);
    if (v11)
    {
      v12 = (uint64_t)v11;
      v13 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v14 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v12, (uint64_t)v3, v13);
      if (v14 && (objc_msgSend(v14, "BOOLValue") & 1) != 0)
        goto LABEL_14;
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to release query generation: %@"), v23);
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to release query generation failed: %@"), v23);
    }
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v15, (uint64_t)v3, v16, v17, v18, v19, v20, v21);
LABEL_14:

  }
}

- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v6 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator", a3, a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__NSXPCStore_reopenQueryGenerationWithIdentifier_error___block_invoke;
  v9[3] = &unk_1E1EDD138;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = &v10;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

id __56__NSXPCStore_reopenQueryGenerationWithIdentifier_error___block_invoke(uint64_t a1)
{
  NSCoreDataXPCMessage *v2;
  NSCoreDataXPCMessage *v3;
  _NSQueryGenerationToken *v4;
  _QWORD *v5;
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = objc_alloc_init(NSCoreDataXPCMessage);
  v3 = v2;
  if (v2)
    v2->_messageCode = 11;
  v4 = [_NSQueryGenerationToken alloc];
  if (v4)
    v5 = -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v4, *(void **)(a1 + 32), *(void **)(a1 + 40), 0);
  else
    v5 = 0;
  v6 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v5);

  if (v3)
    objc_setProperty_nonatomic(v3, v7, v6, 24);

  v22 = 0;
  v8 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 40), v3, 0, &v21, &v22);
  if (!v8
    || (v9 = (uint64_t)v8,
        v10 = *(_QWORD *)(a1 + 40),
        v11 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()),
        (v12 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v9, v10, v11)) == 0))
  {
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to reopen query generation failed: %@"), v22);
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v13, *(_QWORD *)(a1 + 40), v14, v15, v16, v17, v18, v20);
    v12 = 0;
  }

  result = v12;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (void)cacheFetchedRows:(void *)a3 forManagedObjects:(void *)a4 generation:
{
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSIncrementalStoreNode *v14;
  NSXPCRow *v15;
  unsigned int *v16;
  uint64_t v17;
  int v18;
  unsigned int *v19;
  unsigned int v20;

  if (a1)
  {
    v6 = -[NSGenerationalRowCache rowCacheForGeneration:](*(_QWORD *)(a1 + 136), a4);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceReferenceDate");
    v8 = v7;
    v9 = objc_msgSend(a2, "count");
    if (v9)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
      {
        v12 = (void *)objc_msgSend(a2, "objectAtIndex:", i);
        v13 = (void *)objc_msgSend(v12, "objectID");
        v14 = -[NSIncrementalStoreNode initWithObjectID:fromSQLRow:]([NSIncrementalStoreNode alloc], "initWithObjectID:fromSQLRow:", v13, v12);
        v15 = -[NSXPCRow initWithNode:]([NSXPCRow alloc], "initWithNode:", v14);
        v16 = (unsigned int *)v15;
        if (v15)
          v15->super._birth = v8;
        v17 = objc_msgSend(a3, "objectAtIndex:", i);
        if (v17)
        {
          v18 = *(_DWORD *)(v17 + 16);
          if ((v18 & 0x200) != 0)
          {
            if (!v16 || (int)v16[3] >= 1)
              goto LABEL_15;
LABEL_13:
            v19 = v16 + 3;
            do
              v20 = __ldxr(v19);
            while (__stxr(v20 + 1, v19));
            goto LABEL_15;
          }
          *(_DWORD *)(v17 + 16) = v18 | 0x200;
        }
        if (v16)
          goto LABEL_13;
LABEL_15:
        -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v6, v16, v13, 0);

      }
    }
  }
}

- (uint64_t)decodePrefetchArray:(void *)a3 forSources:(NSManagedObjectContext *)a4 context:
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(a2);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x18D76B4E4]();
        -[NSXPCStore decodePrefetchResult:forSources:context:](a1, v12, a3, a4);
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v9 = result;
    }
    while (result);
  }
  return result;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, a4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        -[NSPersistentStoreCache incrementRefCountForObjectID:]((uint64_t)v5, *(const void **)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, a4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        -[NSPersistentStoreCache decrementRefCountForObjectID:]((uint64_t)v5, *(const void **)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (uint64_t)_commitChangesForRequestContext:(uint64_t)a1
{
  void *v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  os_unfair_lock_s *v15;
  unsigned int *v16;
  unsigned int *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a2)
    v4 = (void *)a2[5];
  else
    v4 = 0;
  v5 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:](*(_QWORD *)(a1 + 136), 0);
  v29 = a2;
  v6 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:](*(_QWORD *)(a1 + 136), (void *)objc_msgSend((id)objc_msgSend(a2, "managedObjectContext"), "_queryGenerationToken"));
  if (objc_msgSend(v4, "count"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v37;
      v11 = v5 == v6 || v6 == 0;
      v12 = 0x1EDF5B000uLL;
      v30 = *(_QWORD *)v37;
      do
      {
        v13 = 0;
        v31 = v8;
        do
        {
          if (*(_QWORD *)v37 != v9)
            objc_enumerationMutation(v4);
          v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
          if (v11)
          {
            v15 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v5, *(const void **)(*((_QWORD *)&v36 + 1) + 8 * v13), *(double *)&NSSQLDistantPastTimeInterval);
            v16 = (unsigned int *)objc_msgSend(v4, "objectForKey:", v14);
            v17 = v16;
            if (v15)
            {
              v18 = v11;
              v19 = v4;
              if (v16)
                v20 = *(void **)((char *)v16 + *(int *)(v12 + 3296));
              else
                v20 = 0;
              v21 = v12;
              v22 = objc_msgSend(v20, "version");
              if (v22 == objc_msgSend(*(id *)((char *)&v15->_os_unfair_lock_opaque + *(int *)(v21 + 3296)), "version"))
                -[NSPersistentCacheRow updateMissingRelationshipCachesFromOriginal:](v17, (uint64_t)v15);
              -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v5, v17, v14, 0);
              v12 = v21;
              v4 = v19;
              v11 = v18;
              v9 = v30;
              v8 = v31;
            }
            else
            {
              -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v5, v16, v14, 0);
            }
          }
          else
          {
            -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v5, *(const void **)(*((_QWORD *)&v36 + 1) + 8 * v13));
          }
          ++v13;
        }
        while (v8 != v13);
        v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        v8 = v23;
      }
      while (v23);
    }
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  if (v29)
    v24 = (void *)objc_msgSend((id)v29[2], "deletedObjects");
  else
    v24 = 0;
  result = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (result)
  {
    v26 = result;
    v27 = *(_QWORD *)v33;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v5, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v28++), "objectID"));
      }
      while (v26 != v28);
      result = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      v26 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_executeSaveRequestForContext:(_QWORD *)a3 error:
{
  uint64_t v6;
  NSCoreDataXPCMessage *v7;
  NSCoreDataXPCMessage *v8;
  id v9;
  SEL v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = objc_msgSend(a2, "managedObjectContext");
  v7 = objc_alloc_init(NSCoreDataXPCMessage);
  v8 = v7;
  if (v7)
  {
    v7->_messageCode = 3;
    v9 = -[NSXPCSaveRequestContext newEncodedSaveRequest](a2);
    objc_setProperty_nonatomic(v8, v10, v9, 24);
  }
  else
  {
    v9 = -[NSXPCSaveRequestContext newEncodedSaveRequest](a2);
  }

  v15 = 0;
  v11 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](a1, v8, v6, &v15, a3);
  v12 = (uint64_t)v11;
  if (a2)
    a2[6] = v15;
  if (v11)
  {
    v13 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v12 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v12, (uint64_t)a1, v13);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), "isEqual:", v12))
      -[NSXPCStore _commitChangesForRequestContext:]((uint64_t)a1, a2);
  }

  return v12;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _WORD *v17;
  os_unfair_lock_s *v18;
  double v19;
  double v20;
  os_unfair_lock_s *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v30;
  id v31;
  NSCoreDataXPCMessage *v32;
  const char *v33;
  NSCoreDataXPCMessage *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSIncrementalStoreNode *v40;
  void *v41;
  NSFetchRequest *v42;
  _PFArray *v43;
  NSXPCRow *v44;
  NSXPCRow *v45;
  void *v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  _QWORD *v56;
  double v57;
  void *v58;
  _WORD *v59;
  uint64_t v60;
  void *v61;
  os_unfair_lock_s *v62;
  void *v63;
  id v64;
  uint64_t v65;
  int v66;
  unsigned int *p_externalReferenceCount;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSKnownKeysDictionary *v75;
  id *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  id v81;

  v9 = 0x1E1EDA000uLL;
  if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR("Firing fault %@"), v10, v11, v12, v13, v14, v15, (uint64_t)a3);
  v16 = (void *)objc_msgSend(a4, "_queryGenerationToken");
  if (objc_msgSend(v16, "_isEnabled"))
    v17 = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v16, self);
  else
    v17 = 0;
  v18 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v17);
  objc_msgSend(a4, "stalenessInterval");
  if (v19 != 0.0)
  {
    v20 = v19 <= 0.0 ? *(double *)&NSSQLDistantPastTimeInterval : CFAbsoluteTimeGetCurrent() - v19;
    v21 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v18, a3, v20);
    if (v21)
    {
      v22 = *(void **)&v21[10]._os_unfair_lock_opaque;
      if (v22)
      {
        v78 = v22;
        if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault"))
          _NSCoreDataLog(8, (uint64_t)CFSTR("Returning cached value %@"), v23, v24, v25, v26, v27, v28, (uint64_t)v78);
        return v78;
      }
    }
  }
  v30 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v30, "addObject:", objc_msgSend(a3, "URIRepresentation"));
  if (v17)
    objc_msgSend(v30, "addObject:", v17);
  v31 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v30);
  v32 = objc_alloc_init(NSCoreDataXPCMessage);
  v34 = v32;
  if (v32)
  {
    v32->_messageCode = 5;
    objc_setProperty_nonatomic(v32, v33, v31, 24);
  }

  v79 = 0;
  v80 = 0;
  v35 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v34, (uint64_t)a4, &v79, &v80);
  if (!v35)
  {
    if (a5)
    {
      v40 = 0;
      *a5 = v80;
      goto LABEL_67;
    }
    goto LABEL_46;
  }
  v36 = (uint64_t)v35;
  v76 = a5;
  v37 = (void *)+[_NSXPCStoreUtilities classesForSaveArchive]();
  v38 = objc_msgSend(v37, "setByAddingObjectsFromSet:", -[NSManagedObjectModel _allowedClassesFromTransformableAttributes](objc_msgSend(-[NSXPCStore model](self, "model"), "managedObjectModel")));
  v39 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v36, (uint64_t)self, v38);
  if (objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", 0), "integerValue") != 1)
  {
    if (objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", 0), "integerValue") == 2)
    {
      v41 = (void *)objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", 1), "firstObject");
      v42 = objc_alloc_init(NSFetchRequest);
      -[NSFetchRequest setEntity:](v42, "setEntity:", objc_msgSend(a3, "entity"));
      v81 = 0;
      v43 = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, v41, v42, 1, &self->super.super, (NSManagedObjectContext *)a4, &v81, &v80);

      if (-[_PFArray count](v43, "count"))
      {
        v44 = (NSXPCRow *)objc_msgSend(v81, "lastObject");
        v45 = v44;
      }
      else
      {
        v44 = 0;
        v80 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134093, 0);
      }

      v9 = 0x1E1EDA000;
      if (v44)
      {
        v60 = objc_msgSend(a4, "objectRegisteredForID:", a3);
        v61 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v44);
        -[NSXPCStore cacheFetchedRows:forManagedObjects:generation:]((uint64_t)self, v61, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v60), v17);
        v62 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v18, a3, *(double *)&NSSQLDistantPastTimeInterval);
        if (v62)
          v63 = *(void **)&v62[10]._os_unfair_lock_opaque;
        else
          v63 = 0;
        v40 = v63;
      }
      else
      {
        v40 = 0;
        if (v76 && v80)
        {
          v40 = 0;
          *v76 = v80;
        }
      }
      goto LABEL_66;
    }
    if (v76)
    {
      v40 = 0;
      *v76 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, 0);
      goto LABEL_67;
    }
    goto LABEL_46;
  }
  if (objc_msgSend(v39, "count") != 1)
  {
    v46 = (void *)objc_msgSend(v39, "lastObject");
    v47 = (_QWORD *)objc_msgSend(a3, "entity");
    v48 = (_QWORD *)objc_msgSend(v47, "_propertyRangesByType");
    v49 = v48[7] + v48[13] + 1;
    if (objc_msgSend(v46, "count") == v49)
    {
      v50 = v48[6];
      v51 = v48[7];
      v75 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", -[NSEntityDescription knownKeysMappingStrategy](v47));
      v77 = -[NSKnownKeysDictionary knownKeyValuesPointer](v75, "knownKeyValuesPointer");
      if (v51)
      {
        v52 = 0;
        v53 = v77 + 8 * v50;
        do
        {
          v54 = (void *)objc_msgSend(v46, "objectAtIndex:", v52);
          if ((void *)NSKeyValueCoding_NullValue != v54)
            *(_QWORD *)(v53 + 8 * v52) = v54;
          ++v52;
        }
        while (v51 != v52);
      }
      v55 = v48[13];
      if (v55)
      {
        v56 = (_QWORD *)(v77 + 8 * v48[12]);
        do
        {
          *v56++ = (id)objc_msgSend(v46, "objectAtIndex:", v51++);
          --v55;
        }
        while (v55);
      }
      v40 = -[NSIncrementalStoreNode initWithObjectID:withValues:version:]([NSIncrementalStoreNode alloc], "initWithObjectID:withValues:version:", a3, v75, objc_msgSend((id)objc_msgSend(v46, "lastObject"), "unsignedIntegerValue"));

      v44 = -[NSXPCRow initWithNode:]([NSXPCRow alloc], "initWithNode:", v40);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      if (v44)
        v44->super._birth = v57;
      v58 = (void *)objc_msgSend(a4, "_queryGenerationToken");
      v9 = 0x1E1EDA000uLL;
      if ((objc_msgSend(v58, "_isEnabled") & 1) != 0)
        v59 = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v58, self);
      else
        v59 = 0;
      v64 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v59);
      v65 = objc_msgSend(a4, "objectWithID:", a3);
      if (v65)
      {
        v66 = *(_DWORD *)(v65 + 16);
        if ((v66 & 0x200) != 0)
        {
          if (!v44 || v44->super._externalReferenceCount >= 1)
            goto LABEL_65;
          goto LABEL_63;
        }
        *(_DWORD *)(v65 + 16) = v66 | 0x200;
      }
      if (!v44)
      {
LABEL_65:
        -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v64, (unsigned int *)v44, a3, 0);
LABEL_66:

        goto LABEL_67;
      }
LABEL_63:
      p_externalReferenceCount = (unsigned int *)&v44->super._externalReferenceCount;
      do
        v68 = __ldxr(p_externalReferenceCount);
      while (__stxr(v68 + 1, p_externalReferenceCount));
      goto LABEL_65;
    }
    if (v76)
    {
      v40 = 0;
      *v76 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Unexpected number of property values returned from server"), CFSTR("Reason")));
      goto LABEL_67;
    }
LABEL_46:
    v40 = 0;
    goto LABEL_67;
  }
  if (!v76)
    goto LABEL_46;
  v40 = 0;
  *v76 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 133000, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3), CFSTR("NSAffectedObjectsErrorKey"), 0));
LABEL_67:

  if (objc_msgSend(*(id *)(v9 + 3568), "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR("Retrieved node from server %@"), v69, v70, v71, v72, v73, v74, (uint64_t)v40);
  return v40;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  double v11;
  double v12;
  void *v13;
  _WORD *v14;
  os_unfair_lock_s *v15;
  os_unfair_lock_s *v16;
  double v17;
  os_unfair_lock_s *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  os_unfair_lock_s *v23;
  void *v24;
  os_unfair_lock_s *v25;
  id v26;
  id v27;
  id v28;
  NSCoreDataXPCMessage *v29;
  const char *v30;
  NSCoreDataXPCMessage *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  Class *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  double v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  _WORD *v69;
  uint64_t v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[18];

  v76[16] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a5, "stalenessInterval");
  v12 = v11;
  v13 = (void *)objc_msgSend(a5, "_queryGenerationToken");
  if (objc_msgSend(v13, "_isEnabled"))
    v14 = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v13, self);
  else
    v14 = 0;
  v15 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v14);
  if (v12 != 0.0)
  {
    v16 = v15;
    if (v12 <= 0.0)
      v17 = *(double *)&NSSQLDistantPastTimeInterval;
    else
      v17 = CFAbsoluteTimeGetCurrent() - v12;
    v18 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v16, a4, v17);
    if (v18)
      v19 = *(void **)&v18[10]._os_unfair_lock_opaque;
    else
      v19 = 0;
    v20 = v19;
    if (!v20)
    {
      v76[0] = 0;
      v21 = -[NSXPCStore newValuesForObjectWithID:withContext:error:](self, "newValuesForObjectWithID:withContext:error:", a4, a5, v76);
      if (!v21)
      {
        if (a6)
          *a6 = (id)v76[0];
        return 0;
      }
      v20 = v21;
    }
    v22 = (void *)objc_msgSend(v20, "valueForPropertyDescription:", a3);
    if ((objc_msgSend(a3, "isToMany") & 1) == 0)
    {
      v24 = (void *)NSKeyValueCoding_NullValue;
      if (v22)
        v24 = v22;
      v23 = v24;
      goto LABEL_19;
    }
    if (v22)
    {
      v23 = v22;
LABEL_19:
      v25 = v23;

      return v25;
    }

    v25 = -[NSPersistentStoreCache toManyForSourceObjectID:forProperty:afterTimestamp:](v16, a4, a3, v17);
    if (v25)
      return v25;
  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v27, "setValue:forKey:", objc_msgSend(a4, "URIRepresentation"), CFSTR("source"));
  objc_msgSend(v27, "setValue:forKey:", objc_msgSend(a3, "name"), CFSTR("relationship"));
  objc_msgSend(v26, "addObject:", v27);

  if (v14)
    objc_msgSend(v26, "addObject:", v14);
  v28 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v26);

  v29 = objc_alloc_init(NSCoreDataXPCMessage);
  v31 = v29;
  if (v29)
  {
    v29->_messageCode = 6;
    objc_setProperty_nonatomic(v29, v30, v28, 24);
  }

  v71 = 0;
  v32 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v31, (uint64_t)a5, &v70, &v71);

  if (v32)
  {
    v69 = v14;
    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    v36 = objc_msgSend(v33, "setWithObjects:", v34, v35, objc_opt_class(), 0);
    v37 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v32, (uint64_t)self, v36);
    if (+[NSXPCStore debugDefault](NSXPCStore, "debugDefault"))
    {
      objc_msgSend(a3, "name");
      _NSCoreDataLog(8, (uint64_t)CFSTR("Decoded value for %@ - %@ : %@"), v38, v39, v40, v41, v42, v43, (uint64_t)a4);
    }
    v44 = (void *)objc_msgSend(a5, "persistentStoreCoordinator");
    if (objc_msgSend(a3, "isToMany"))
    {
      v45 = objc_msgSend(a3, "isOrdered");
      v46 = (Class *)0x1E0C99E10;
      if (!v45)
        v46 = (Class *)0x1E0C99E20;
      v25 = (os_unfair_lock_s *)objc_alloc_init(*v46);
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v47 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v47)
      {
        v48 = v47;
        v68 = a4;
        v49 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v73 != v49)
              objc_enumerationMutation(v37);
            v51 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
            v52 = (void *)MEMORY[0x18D76B4E4]();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_57;
            v53 = objc_msgSend(v44, "managedObjectIDForURIRepresentation:", v51);
            if (v53)
              -[os_unfair_lock_s addObject:](v25, "addObject:", v53);
            objc_autoreleasePoolPop(v52);
          }
          v48 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
        }
        while (v48);
        a4 = v68;
      }
    }
    else
    {
      v54 = NSKeyValueCoding_NullValue;
      if (v54 != objc_msgSend(v37, "lastObject"))
      {
        v55 = objc_msgSend(v37, "lastObject");
        objc_opt_class();
        v56 = v69;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_57:
          v61 = objc_msgSend(a3, "name");
          _NSCoreDataLog(8, (uint64_t)CFSTR("Got a bad relationship value for %@, %@ (%@)"), v62, v63, v64, v65, v66, v67, v61);
          __break(1u);
        }
        v57 = (void *)objc_msgSend(v44, "managedObjectIDForURIRepresentation:", v55);
        if (v57)
          v25 = v57;
        else
          v25 = 0;
        goto LABEL_53;
      }
      v25 = (os_unfair_lock_s *)(id)NSKeyValueCoding_NullValue;
    }
    v56 = v69;
LABEL_53:
    if (objc_msgSend(a3, "isToMany"))
    {
      v58 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v56);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceReferenceDate");
      -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]((uint64_t)v58, v25, 0, a4, a3, v59);
    }
    return v25;
  }
  v25 = 0;
  if (a6)
    *a6 = v71;
  return v25;
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSCoreDataXPCMessage *v18;
  const char *v19;
  NSCoreDataXPCMessage *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _DWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  id *v54;
  NSCoreDataXPCMessage *v55;
  NSXPCStore *v56;
  size_t count;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
    return (id)NSArray_EmptyArray;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v69 != v10)
          objc_enumerationMutation(a3);
        v12 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "entity"), "name");
        v13 = (void *)objc_msgSend(v7, "objectForKey:", v12);
        if (v13)
        {
          v14 = objc_msgSend(v13, "integerValue") + 1;
          v15 = (void *)MEMORY[0x1E0CB37E8];
        }
        else
        {
          v15 = (void *)MEMORY[0x1E0CB37E8];
          v14 = 1;
        }
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v15, "numberWithInteger:", v14), v12);
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v9);
  }
  v16 = objc_msgSend(v7, "count");
  v17 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v7);
  v18 = objc_alloc_init(NSCoreDataXPCMessage);
  v20 = v18;
  if (v18)
  {
    v18->_messageCode = 4;
    objc_setProperty_nonatomic(v18, v19, v17, 24);
  }

  v67 = 0;
  v21 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v20, objc_msgSend((id)objc_msgSend(a3, "lastObject"), "managedObjectContext"), &v66, &v67);
  if (v21)
  {
    v22 = (uint64_t)v21;
    v54 = a4;
    v55 = v20;
    count = v16;
    v23 = (void *)MEMORY[0x1E0C99E60];
    v56 = self;
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, v29, objc_opt_class(), 0);
    v31 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v22, (uint64_t)v56, v30);
    if (objc_msgSend(v31, "count"))
      v32 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    else
      v32 = 0;
    if (objc_msgSend(v31, "count") != count)
    {

      v48 = v54;
      if (!v54)
        return 0;
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB28A8];
      v51 = (void *)MEMORY[0x1E0C99D80];
      v52 = CFSTR("Wrong number of object IDs returned from server");
      goto LABEL_43;
    }
    v33 = -[NSKnownKeysMappingStrategy initForKeys:]([NSKnownKeysMappingStrategy alloc], "initForKeys:", objc_msgSend(v31, "allKeys"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v63;
LABEL_24:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v63 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v37);
        v39 = objc_msgSend((id)objc_msgSend(v31, "objectForKey:", v38), "count");
        if (v39 != objc_msgSend((id)objc_msgSend(v7, "objectForKey:", v38), "unsignedIntegerValue"))
          break;
        if (v35 == ++v37)
        {
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
          if (v35)
            goto LABEL_24;
          goto LABEL_30;
        }
      }

      v48 = v54;
      if (!v54)
        return 0;
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB28A8];
      v51 = (void *)MEMORY[0x1E0C99D80];
      v52 = CFSTR("Wrong number of object IDs returned from server (2)");
LABEL_43:
      v32 = 0;
      *v48 = (id)objc_msgSend(v49, "errorWithDomain:code:userInfo:", v50, 134060, objc_msgSend(v51, "dictionaryWithObject:forKey:", v52, CFSTR("Reason")));
      return v32;
    }
LABEL_30:
    v40 = malloc_type_calloc(count, 4uLL, 0x100004052888210uLL);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v41 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v59 != v43)
            objc_enumerationMutation(a3);
          v45 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "entity"), "name");
          v46 = (void *)objc_msgSend(v31, "objectForKey:", v45);
          v47 = objc_msgSend(v33, "indexForKey:", v45);
          ++v40[v47];
          objc_msgSend(v32, "addObject:", objc_msgSend(v46, "objectAtIndex:"));
        }
        v42 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      }
      while (v42);
    }

    free(v40);
    v20 = v55;
  }
  else
  {
    v32 = 0;
    if (a4)
      *a4 = v67;
  }

  return v32;
}

- (id)newForeignKeyID:(int64_t)a3 entity:(id)a4
{
  if (a3)
    return (id)objc_msgSend(objc_alloc(-[NSXPCStore objectIDFactoryForSQLEntity:](self, "objectIDFactoryForSQLEntity:", a4)), "initWithPK64:", a3);
  else
    return 0;
}

+ (BOOL)_isOnExtendedTimeout
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NSXPCStore_Internal___isOnExtendedTimeout__block_invoke;
  block[3] = &unk_1E1EDD108;
  block[4] = &v5;
  if (_isOnExtendedTimeout_onceToken != -1)
    dispatch_once(&_isOnExtendedTimeout_onceToken, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__NSXPCStore_Internal___isOnExtendedTimeout__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
  result = objc_msgSend(CFSTR("com.apple.internetaccounts"), "isEqual:", v2);
  if ((result & 1) != 0
    || (result = objc_msgSend(CFSTR("com.apple.preferences.internetaccounts.remoteservices"), "isEqual:", v2),
        (_DWORD)result))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)_prepareStoreForRemovalFromCoordinator:(id)a3
{
  NSObject *v5;
  NSObject *requestTerminationSem;
  int *p_outstandingRequests;
  dispatch_time_t v9;
  NSObject *v11;

  if (-[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator") == a3)
  {
    os_unfair_lock_lock_with_options();
    if (a3 && (v5 = self->_requestTerminationSem) != 0)
    {
      dispatch_retain(v5);
      requestTerminationSem = self->_requestTerminationSem;
      os_unfair_lock_unlock(&self->_stateLock);
      if (requestTerminationSem)
      {
        p_outstandingRequests = &self->_outstandingRequests;
        do
        {
          if (__ldxr((unsigned int *)p_outstandingRequests))
          {
            while (1)
            {
              __clrex();
              v9 = dispatch_time(0, 10000000000);
              dispatch_semaphore_wait(requestTerminationSem, v9);
              while (!__ldxr((unsigned int *)p_outstandingRequests))
              {
                if (!__stxr(0xFFF0BDC1, (unsigned int *)p_outstandingRequests))
                  goto LABEL_14;
              }
            }
          }
        }
        while (__stxr(0xFFF0BDC1, (unsigned int *)p_outstandingRequests));
LABEL_14:
        os_unfair_lock_lock_with_options();
        v11 = self->_requestTerminationSem;
        if (v11)
        {
          dispatch_release(v11);
          self->_requestTerminationSem = 0;
        }
        os_unfair_lock_unlock(&self->_stateLock);
        dispatch_release(requestTerminationSem);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_stateLock);
    }
  }
}

- (id)ancillaryModels
{
  return self->_ancillaryModels;
}

- (id)ancillarySQLModels
{
  return self->_ancillarySQLModels;
}

- (id)newObjectIDForEntity:(id)a3 pk:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc(-[NSXPCStore objectIDFactoryForSQLEntity:](self, "objectIDFactoryForSQLEntity:", a3)), "initWithPK64:", a4);
}

- (os_unfair_lock_s)_cachedRowForRelationship:(const void *)a3 onObjectWithID:(void *)a4 generation:
{
  os_unfair_lock_s *v6;

  if (result)
  {
    v6 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:](*(_QWORD *)&result[34]._os_unfair_lock_opaque, a4);
    return -[NSPersistentStoreCache toManyForSourceObjectID:forProperty:afterTimestamp:](v6, a3, a2, *(double *)&NSSQLDistantPastTimeInterval);
  }
  return result;
}

- (os_unfair_lock_s)_cachedRowForObjectWithID:(void *)a3 generation:
{
  os_unfair_lock_s *v4;

  if (result)
  {
    v4 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:](*(_QWORD *)&result[34]._os_unfair_lock_opaque, a3);
    result = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v4, a2, *(double *)&NSSQLDistantPastTimeInterval);
    if (result)
      return *(os_unfair_lock_s **)&result[10]._os_unfair_lock_opaque;
  }
  return result;
}

- (void)_clearCachedRowForObjectWithID:(void *)a3 generation:
{
  id v4;

  if (a1)
  {
    v4 = -[NSGenerationalRowCache rowCacheForGeneration:](*(_QWORD *)(a1 + 136), a3);
    -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v4, a2);
  }
}

- (void)decodePrefetchResult:(void *)a3 forSources:(NSManagedObjectContext *)a4 context:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  NSManagedObject *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSFetchRequest *v27;
  _PFArray *v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  _NSFaultingMutableSet *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  BOOL v55;
  id v56;
  os_unfair_lock_s *v57;
  void *v58;
  id v59;
  int v60;
  os_unfair_lock_s *v61;
  os_unfair_lock_s *v62;
  id v63;
  int v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *j;
  void *v69;
  void *v70;
  void *v71;
  unsigned int *v72;
  _NSFaultingMutableSet *v73;
  uint64_t v74;
  unsigned int *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  unsigned int *v83;
  _NSFaultingMutableSet *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  _PFArray *v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  void *v99;
  void *v100;
  uint64_t v101;
  id v102;
  unint64_t v103;
  id v104;
  unint64_t v105;
  _PFArray *v106;
  unint64_t v107;
  void *v108;
  NSManagedObject *v109;
  id v110;
  void *v111;
  _WORD *v112;
  void *v113;
  NSPersistentStore *v114;
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
  void *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  v111 = a3;
  v141 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a2, "objectAtIndex:", 0);
  v8 = objc_msgSend(a2, "objectAtIndex:", 1);
  v9 = objc_msgSend(-[NSPersistentStore _persistentStoreCoordinator](a1, "_persistentStoreCoordinator"), "managedObjectModel");
  if (v9 && (v10 = (void *)objc_msgSend(*(id *)(v9 + 32), "objectForKey:", v8)) != 0)
    v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "propertiesByName"), "objectForKey:", v7);
  else
    v11 = 0;
  if (objc_msgSend(v11, "_propertyType") != 4)
    return;
  v12 = objc_msgSend(v11, "isToMany");
  if (!v11)
    return;
  v13 = v12;
  v110 = (id)objc_msgSend(a2, "objectAtIndex:", 2);
  v14 = objc_msgSend(a2, "count");
  if (v14 < 4)
    return;
  v15 = v14;
  v16 = (NSManagedObject *)objc_msgSend(a2, "objectAtIndex:", 3);
  if (!v16)
    return;
  v109 = v16;
  v104 = a2;
  v105 = v15;
  v113 = v11;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceReferenceDate");
  v18 = v17;
  v114 = a1;
  v112 = -[_NSQueryGenerationToken _generationalComponentForStore:](-[NSManagedObjectContext _queryGenerationToken](a4, "_queryGenerationToken"), a1);
  LODWORD(v107) = v13;
  if (v13)
  {
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v19 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v132, v140, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v133;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v133 != v21)
            objc_enumerationMutation(v111);
          v23 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
          if (-[NSEntityDescription _relationshipNamed:]((_QWORD *)objc_msgSend(v23, "entity"), v7))
          {
            v24 = (void *)objc_msgSend(v23, "objectID");
            v25 = (void *)NSArray_EmptyArray;
            v26 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)v114[1]._oidFactories, v112);
            -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]((uint64_t)v26, v25, 0, v24, v113, v18);
          }
        }
        v20 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v132, v140, 16);
      }
      while (v20);
    }
  }
  v27 = objc_alloc_init(NSFetchRequest);
  -[NSFetchRequest setEntity:](v27, "setEntity:", objc_msgSend(v113, "destinationEntity"));
  -[NSFetchRequest setResultType:](v27, "setResultType:", 0);
  v131 = 0;
  v28 = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, v109, v27, 0, v114, a4, &v131, 0);
  -[NSXPCStore cacheFetchedRows:forManagedObjects:generation:]((uint64_t)v114, v131, v28, v112);

  v29 = -[_PFArray count](v28, "count");
  if (!v29)
  {

    return;
  }
  v30 = v29;
  v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v28);
  if (v105 < 5)
    v104 = 0;
  else
    v104 = (id)objc_msgSend(v104, "lastObject");
  v31 = v107;
  v107 = -[NSPersistentStore faultHandler]((unint64_t)v114);
  v102 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v103 = v30;
  v106 = v28;
  if (!v31)
  {
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v45 = v113;
    v110 = (id)objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
    if (!v110)
      goto LABEL_108;
    v109 = *(NSManagedObject **)v120;
    while (1)
    {
      v46 = 0;
      v47 = v112;
      do
      {
        if (*(NSManagedObject **)v120 != v109)
          objc_enumerationMutation(v111);
        v48 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)v46);
        v49 = (void *)MEMORY[0x18D76B4E4]();
        v50 = (const void *)objc_msgSend(v48, "objectID");
        v51 = objc_msgSend(v48, "primitiveValueForKey:", v7);
        if (!v51)
        {
          v54 = (void *)-[os_unfair_lock_s valueForPropertyDescription:](-[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v114, v50, v47), "valueForPropertyDescription:", v45);
          goto LABEL_53;
        }
        v52 = (void *)v51;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v53 = -[os_unfair_lock_s valueForPropertyDescription:](-[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v114, v50, v47), "valueForPropertyDescription:", v45);
          if (objc_msgSend(v52, "isEqual:", v53))
            v54 = (void *)v53;
          else
            v54 = 0;
          goto LABEL_53;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v52, "isFault"))
          goto LABEL_69;
        v57 = -[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v114, v50, v47);
        if (!v57)
        {
          v54 = (void *)objc_msgSend(v52, "objectID");
          v61 = -[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v114, v54, v47);
          if (v61)
          {
            v62 = v61;
            v45 = v113;
            if (a4)
            {
              v63 = _PFRetainedObjectIDCore((uint64_t)a4, v54, 0, 1);
              v56 = v63;
              if (v63)
              {
                v64 = *((_DWORD *)v63 + 4);
                if ((v64 & 0x200) == 0)
                  *((_DWORD *)v63 + 4) = v64 | 0x200;
              }
            }
            else
            {
              v56 = 0;
            }
            if (objc_msgSend(v56, "isFault"))
              _PFFaultHandlerFulfillFault(v107, (uint64_t)v56, (uint64_t)a4, v62, 0);
            goto LABEL_60;
          }
          v45 = v113;
LABEL_53:
          if (v54)
            v55 = NSKeyValueCoding_NullValue == (_QWORD)v54;
          else
            v55 = 1;
          if (!v55)
          {
            if (a4)
              v56 = _PFRetainedObjectIDCore((uint64_t)a4, v54, 0, 1);
            else
              v56 = 0;
            _PFFaultHandlerPreconnectRelationship(v107, (unsigned int *)v48, v45, v56);
LABEL_60:
            objc_msgSend(v108, "removeObject:", v56);

            goto LABEL_69;
          }
          goto LABEL_69;
        }
        v58 = (void *)-[os_unfair_lock_s valueForPropertyDescription:](v57, "valueForPropertyDescription:", v113);
        v45 = v113;
        if (objc_msgSend((id)objc_msgSend(v52, "objectID"), "isEqual:", v58))
        {
          if (a4)
          {
            v59 = _PFRetainedObjectIDCore((uint64_t)a4, v58, 0, 1);
            v56 = v59;
            if (v59)
            {
              v60 = *((_DWORD *)v59 + 4);
              if ((v60 & 0x200) == 0)
                *((_DWORD *)v59 + 4) = v60 | 0x200;
            }
          }
          else
          {
            v56 = 0;
          }
          goto LABEL_60;
        }
LABEL_69:
        objc_autoreleasePoolPop(v49);
        v46 = (char *)v46 + 1;
      }
      while (v110 != v46);
      v65 = (void *)objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
      v110 = v65;
      if (!v65)
        goto LABEL_108;
    }
  }
  if (!objc_msgSend((id)objc_msgSend(v113, "inverseRelationship"), "isToMany"))
  {
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v111 = -[_PFArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v123, v138, 16);
    if (v111)
    {
      v66 = 0;
      v67 = 0;
      v110 = *(id *)v124;
      do
      {
        for (j = 0; j != v111; j = (char *)j + 1)
        {
          v69 = (void *)v66;
          if (*(id *)v124 != v110)
            objc_enumerationMutation(v106);
          v70 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)j);
          v71 = (void *)MEMORY[0x18D76B4E4]();
          v66 = -[os_unfair_lock_s valueForPropertyDescription:](-[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v114, (const void *)objc_msgSend(v70, "objectID"), v112), "valueForPropertyDescription:", objc_msgSend(v113, "inverseRelationship"));
          if (objc_msgSend(v113, "inverseRelationship") && (objc_msgSend(v69, "isEqual:", v66) & 1) == 0)
          {
            if (v67)
            {
              v109 = (NSManagedObject *)-[os_unfair_lock_s valueForPropertyDescription:](-[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v114, (const void *)objc_msgSend((id)objc_msgSend(v67, "lastObject"), "objectID"), v112), "valueForPropertyDescription:", objc_msgSend(v113, "inverseRelationship"));
              v72 = -[NSManagedObjectContext objectWithID:](a4, "objectWithID:");
              v73 = -[_NSFaultingMutableSet initWithSource:destinations:forRelationship:inContext:]([_NSFaultingMutableSet alloc], "initWithSource:destinations:forRelationship:inContext:", v72, v67, v113, a4);
              if (objc_msgSend(v113, "isOrdered"))
              {
                v74 = objc_msgSend(v67, "valueForKey:", CFSTR("objectID"));
              }
              else
              {
                v75 = v72;
                v76 = (void *)MEMORY[0x1E0C99E60];
                v77 = objc_msgSend(v67, "valueForKey:", CFSTR("objectID"));
                v78 = v76;
                v72 = v75;
                v74 = objc_msgSend(v78, "setWithArray:", v77);
              }
              v79 = (void *)v74;
              v80 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)v114[1]._oidFactories, v112);
              -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]((uint64_t)v80, v79, 0, v109, v113, v18);
              _PFFaultHandlerPreconnectRelationship(v107, v72, v113, v73);
              objc_msgSend(v108, "minusSet:", v73);

            }
            v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          }
          objc_msgSend(v67, "addObject:", v70);
          objc_autoreleasePoolPop(v71);
        }
        v111 = -[_PFArray countByEnumeratingWithState:objects:count:](v106, "countByEnumeratingWithState:objects:count:", &v123, v138, 16);
      }
      while (v111);
      if (!v67 || !objc_msgSend(v67, "count"))
        goto LABEL_107;
      v81 = v112;
      v82 = (void *)-[os_unfair_lock_s valueForPropertyDescription:](-[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v114, (const void *)objc_msgSend((id)objc_msgSend(v67, "lastObject"), "objectID"), v112), "valueForPropertyDescription:", objc_msgSend(v113, "inverseRelationship"));
      v83 = -[NSManagedObjectContext objectWithID:](a4, "objectWithID:", v82);
      v84 = -[_NSFaultingMutableSet initWithSource:destinations:forRelationship:inContext:]([_NSFaultingMutableSet alloc], "initWithSource:destinations:forRelationship:inContext:", v83, v67, v113, a4);
      if (objc_msgSend(v113, "isOrdered"))
      {
        v85 = (void *)objc_msgSend(v67, "valueForKey:", CFSTR("objectID"));
      }
      else
      {
        v86 = (void *)MEMORY[0x1E0C99E60];
        v87 = objc_msgSend(v67, "valueForKey:", CFSTR("objectID"));
        v88 = v86;
        v81 = v112;
        v85 = (void *)objc_msgSend(v88, "setWithArray:", v87);
      }
      -[NSXPCStore cacheContents:ofRelationship:onObjectWithID:withTimestamp:generation:]((uint64_t)v114, v85, v113, v82, v81, v18);
      _PFFaultHandlerPreconnectRelationship(v107, v83, v113, v84);
      objc_msgSend(v108, "minusSet:", v84);

    }
    v67 = 0;
LABEL_107:

    goto LABEL_108;
  }
  v32 = objc_msgSend(v110, "count");
  if (v32 >= 2)
  {
    v33 = 0;
    v105 = v32 >> 1;
    do
    {
      v111 = (void *)MEMORY[0x18D76B4E4]();
      v34 = (void *)objc_msgSend(v110, "objectAtIndex:", 2 * v33);
      v109 = -[NSManagedObjectContext objectWithID:](a4, "objectWithID:", v34);
      v35 = (void *)objc_msgSend(v110, "objectAtIndex:", (2 * v33) | 1);
      v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v127 = 0u;
      v128 = 0u;
      v129 = 0u;
      v130 = 0u;
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v128;
        do
        {
          v40 = 0;
          do
          {
            if (*(_QWORD *)v128 != v39)
              objc_enumerationMutation(v35);
            if (a4)
              v41 = _PFRetainedObjectIDCore((uint64_t)a4, *(void **)(*((_QWORD *)&v127 + 1) + 8 * v40), 0, 1);
            else
              v41 = 0;
            objc_msgSend(v36, "addObject:", v41);

            ++v40;
          }
          while (v38 != v40);
          v42 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
          v38 = v42;
        }
        while (v42);
      }
      if ((objc_msgSend(v113, "isOrdered") & 1) == 0)
        v35 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v35);
      v43 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)v114[1]._oidFactories, v112);
      -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]((uint64_t)v43, v35, 0, v34, v113, v18);
      v44 = -[_NSFaultingMutableSet initWithSource:destinations:forRelationship:inContext:]([_NSFaultingMutableSet alloc], "initWithSource:destinations:forRelationship:inContext:", v109, v36, v113, a4);
      _PFFaultHandlerPreconnectRelationship(v107, (unsigned int *)v109, v113, v44);
      objc_msgSend(v108, "minusSet:", v44);

      objc_autoreleasePoolPop(v111);
      ++v33;
    }
    while (v33 != v105);
  }
LABEL_108:
  objc_msgSend(v102, "drain");
  v89 = v106;
  if (v104)
    -[NSXPCStore decodePrefetchArray:forSources:context:](v114, v104, v106, a4);
  v90 = v103;
  if (v103 >= 0x201)
    v91 = 1;
  else
    v91 = v103;
  v92 = (8 * v91 + 15) & 0xFFFFFFFFFFFFFFF0;
  v93 = (char *)&v101 - v92;
  if (v103 > 0x200)
    v93 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v101 - v92, 8 * v103);
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v94 = -[_PFArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
  if (v94)
  {
    v95 = v94;
    v96 = 0;
    v97 = *(_QWORD *)v116;
    do
    {
      for (k = 0; k != v95; ++k)
      {
        if (*(_QWORD *)v116 != v97)
          objc_enumerationMutation(v89);
        *(_QWORD *)&v93[8 * v96 + 8 * k] = objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * k), "objectID");
      }
      v95 = -[_PFArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
      v96 += k;
    }
    while (v95);
  }
  v99 = v108;
  v100 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v108);
  -[NSPersistentStore managedObjectContextDidUnregisterObjectsWithIDs:generation:](v114, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v100, v112);

  if (v90 >= 0x201)
    NSZoneFree(0, v93);

}

- (void)cacheContents:(void *)a3 ofRelationship:(void *)a4 onObjectWithID:(void *)a5 withTimestamp:(double)a6 generation:
{
  id v10;

  v10 = -[NSGenerationalRowCache rowCacheForGeneration:](*(_QWORD *)(a1 + 136), a5);
  -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]((uint64_t)v10, a2, 0, a4, a3, a6);
}

+ (void)setDebugDefault:(int)a3
{
  dword_1ECD8D794 = a3;
}

- (id)_newObjectIDForEntityDescription:(id)a3 pk:(int64_t)a4
{
  return -[NSXPCStore newObjectIDForEntity:pk:](self, "newObjectIDForEntity:pk:", _sqlEntityForEntityDescription((uint64_t)self->_model, a3), a4);
}

- (id)connectionManager
{
  return self->_connectionManager;
}

- (id)fileBackedFuturesDirectory
{
  return self->_fileBackedFuturesDirectory;
}

@end
