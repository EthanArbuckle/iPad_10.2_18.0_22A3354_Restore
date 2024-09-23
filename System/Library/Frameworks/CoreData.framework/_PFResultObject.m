@implementation _PFResultObject

- (void)release
{

}

- (void)_setParentBuffer:(id)a3
{
  self->_parent_buffer = (_PFResultArray *)a3;
}

- (id)valueAtIndex:(unint64_t)a3
{
  void *v5;
  _PFResultArray *parent_buffer;
  $90161CA090A212753249BD5EF7BDB7E6 *resultSet;
  $832F591C28F8B7CE1ACC7DCBC97655CC var7;
  NSKnownKeysDictionary *metadata;
  NSKnownKeysMappingStrategy *v10;
  _PFResultObject *v11;
  unint64_t v12;
  uint64_t v13;
  _PFResultObject *v14;
  unint64_t v15;
  Class isa;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _PFResultArray *v20;
  _PFWeakReference *weakRequestStore;
  id WeakRetained;
  uint64_t v23;
  id v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  CFStringRef v44;
  __CFString *v45;
  CFStringRef v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  _PFResultArray *v50;
  _PFWeakReference *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  _PFResultArray *v56;
  _PFWeakReference *v57;
  id v58;
  _PFExternalReferenceData *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _PFExternalReferenceData *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  objc_class *v90;
  __CFString *v91;
  CFStringRef v92;
  __CFString *v93;
  CFStringRef v94;
  objc_class *v95;
  _NSDataFileBackedFuture *v96;
  _NSDataFileBackedFuture *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _PFExternalReferenceData *v102;
  uint64_t v103;
  void *v104;
  _PFExternalReferenceData *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  void *v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint8_t buf[4];
  uint64_t v119;
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x18D76B4E4]();
  parent_buffer = self->_parent_buffer;
  if (parent_buffer)
    resultSet = parent_buffer->_resultSet;
  else
    resultSet = 0;
  var7 = resultSet->var7;
  if ((*(_BYTE *)&var7 & 0x10) != 0)
  {
    if ((*(_BYTE *)&var7 & 0x40) != 0)
    {
      v42 = CFSTR("%@: backing buffer has been purged");
    }
    else
    {
      if ((*(_BYTE *)&var7 & 0x20) == 0)
        goto LABEL_4;
      v42 = CFSTR("%@: backing buffer can be purged");
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v42, _NSMethodExceptionProem());
    goto LABEL_29;
  }
LABEL_4:
  if (parent_buffer)
    metadata = parent_buffer->_metadata;
  else
    metadata = 0;
  v10 = -[NSKnownKeysDictionary mapping](metadata, "mapping");
  if (-[NSKnownKeysMappingStrategy length](v10, "length") <= a3)
    goto LABEL_29;
  v11 = self + 1;
  v12 = *((_QWORD *)&self[1].super.super.isa + a3);
  if (!v12)
    goto LABEL_29;
  v13 = 0;
  if (a3)
  {
    v14 = self + 1;
    v15 = a3;
    do
    {
      isa = v14->super.super.isa;
      v14 = (_PFResultObject *)((char *)v14 + 8);
      v13 += (uint64_t)isa;
      --v15;
    }
    while (v15);
  }
  v113 = -[NSKnownKeysMappingStrategy length](v10, "length");
  v17 = -[NSKnownKeysDictionary valueAtIndex:](metadata, "valueAtIndex:", a3);
  if (a3 < 6 || self->_sql_entity_id != 16001)
    goto LABEL_22;
  if (!self[1]._primary_key)
  {
LABEL_29:
    objc_autoreleasePoolPop(v5);
    return 0;
  }
  v18 = vaddvq_s64(vaddq_s64(*(int64x2_t *)&self[1]._cd_rc, *(int64x2_t *)&self[1].super.super.isa));
  v19 = *(_QWORD *)(((unint64_t)&v11->super.super.isa
                   + 8 * -[NSKnownKeysMappingStrategy length](v10, "length")
                   + v18
                   + 7) & 0xFFFFFFFFFFFFFFF8);
  v20 = self->_parent_buffer;
  v111 = v12;
  v112 = v5;
  if (v20 && (weakRequestStore = v20->_weakRequestStore) != 0)
    WeakRetained = objc_loadWeakRetained(&weakRequestStore->_object);
  else
    WeakRetained = 0;
  v23 = objc_msgSend((id)objc_msgSend(WeakRetained, "model"), "entityForID:", v19);
  v24 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, (_QWORD *)v23);
  v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "name"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("TOMBSTONE"), &stru_1E1EE23F0), "intValue");
  if (v25 < (int)objc_msgSend(v24, "count"))
  {
    v26 = objc_msgSend(v24, "objectAtIndexedSubscript:", v25);
    if (v23)
      v27 = (void *)objc_msgSend(*(id *)(v23 + 40), "objectForKey:", v26);
    else
      v27 = 0;
    v17 = (id)objc_msgSend(v27, "propertyDescription");
  }

  v12 = v111;
  v5 = v112;
LABEL_22:
  v34 = (unsigned int *)(((unint64_t)&v11->super.super.isa + 8 * v113 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  switch(objc_msgSend(v17, "_propertyType"))
  {
    case 2:
    case 6:
      v41 = objc_msgSend(v17, "attributeType");
      goto LABEL_31;
    case 4:
      goto LABEL_64;
    case 5:
      v41 = objc_msgSend(v17, "expressionResultType");
      if (v41)
      {
LABEL_31:
        if (v41 <= 799)
        {
          if (v41 > 399)
          {
            if (v41 <= 599)
            {
              if (v41 != 400)
              {
                if (v41 != 500)
                  goto LABEL_45;
                goto LABEL_84;
              }
              if (v12 > 0x1F)
                v92 = -[_PFResultObject stringFromPtr:](self, v34);
              else
                v92 = -[_PFResultObject taggedStringFromPtr:withLength:]((CFStringRef)self, (char *)v34);
              v94 = v92;
              v95 = (objc_class *)MEMORY[0x1E0CB3598];
              goto LABEL_118;
            }
            if (v41 == 600)
            {
LABEL_84:
              v46 = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)v34);
              goto LABEL_105;
            }
            if (v41 == 700)
            {
              if (v12 > 0x1F)
                v46 = -[_PFResultObject stringFromPtr:](self, v34);
              else
                v46 = -[_PFResultObject taggedStringFromPtr:withLength:]((CFStringRef)self, (char *)v34);
              goto LABEL_105;
            }
            goto LABEL_45;
          }
          if (v41 != 100 && v41 != 200)
          {
            if (v41 != 300)
              goto LABEL_45;
            v46 = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)v34);
LABEL_105:
            v45 = (__CFString *)v46;
            goto LABEL_106;
          }
LABEL_55:
          v46 = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v34);
          goto LABEL_105;
        }
        if (v41 <= 1099)
        {
          if (v41 == 800)
            goto LABEL_55;
          if (v41 == 900)
          {
            v93 = (__CFString *)CFDateCreate(0, *(CFAbsoluteTime *)v34);
            goto LABEL_122;
          }
          if (v41 != 1000)
            goto LABEL_45;
        }
        else
        {
          if (v41 <= 1799)
          {
            if (v41 != 1100)
            {
              if (v41 == 1200)
              {
                if (v12 > 0x1F)
                  v44 = -[_PFResultObject stringFromPtr:](self, v34);
                else
                  v44 = -[_PFResultObject taggedStringFromPtr:withLength:]((CFStringRef)self, (char *)v34);
                v94 = v44;
                v95 = (objc_class *)MEMORY[0x1E0C99E98];
LABEL_118:
                v93 = (__CFString *)objc_msgSend([v95 alloc], "initWithString:", v94);
                goto LABEL_122;
              }
LABEL_45:
              _NSCoreDataLog(1, (uint64_t)CFSTR("Unsupported type for buffer allocated dictionary: %@"), v35, v36, v37, v38, v39, v40, v41);
LABEL_46:
              v45 = 0;
              goto LABEL_123;
            }
            goto LABEL_74;
          }
          if (v41 != 1800)
          {
            if (v41 != 2000)
              goto LABEL_45;
            goto LABEL_64;
          }
        }
LABEL_74:
        v54 = -[_PFResultObject dataFromPtr:]((uint64_t)self, v34);
        v55 = v54;
        if (v41 != 1800)
        {
          if (v41 == 1100)
          {
            if (objc_msgSend(v54, "length") != 16)
              goto LABEL_46;
            v93 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(v55, "bytes"));
            goto LABEL_122;
          }
          if ((objc_msgSend(v17, "_isFileBackedFuture") & 1) == 0
            && (!objc_msgSend(v17, "_storeBinaryDataExternally") || (*(_BYTE *)&resultSet->var7 & 2) != 0))
          {
            v93 = v55;
            goto LABEL_122;
          }
          v56 = self->_parent_buffer;
          if (v56 && (v57 = v56->_weakRequestStore) != 0)
            v58 = objc_loadWeakRetained(&v57->_object);
          else
            v58 = 0;
          if (*(_BYTE *)objc_msgSend(v55, "bytes") == 1)
          {
            v59 = [_PFExternalReferenceData alloc];
            v60 = objc_msgSend(v55, "bytes");
            v61 = objc_msgSend(v55, "length");
            if (v58)
              v62 = (*((_DWORD *)v58 + 48) >> 2) & 7;
            else
              v62 = 0;
            v63 = v59;
            v64 = v60;
            v65 = 0;
            v66 = 0;
          }
          else
          {
            if (*(_BYTE *)objc_msgSend(v55, "bytes") == 3)
            {
              v96 = [_NSDataFileBackedFuture alloc];
              v97 = -[_NSDataFileBackedFuture initWithStoreMetadata:directory:](v96, "initWithStoreMetadata:directory:", v55, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", objc_msgSend(v58, "fileBackedFuturesDirectory"), 1));
LABEL_135:
              v45 = (__CFString *)v97;

              goto LABEL_123;
            }
            v98 = (const char *)(objc_msgSend(v55, "bytes") + 1);
            v99 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "stringWithFileSystemRepresentation:length:", v98, strnlen(v98, objc_msgSend(v55, "length") - 1));
            v100 = objc_msgSend((id)objc_msgSend(v58, "externalDataReferencesDirectory"), "stringByAppendingPathComponent:", v99);
            if (v58)
            {
              if (!*((_QWORD *)v58 + 20))
                objc_msgSend(v58, "externalDataReferencesDirectory");
              v101 = objc_msgSend(*((id *)v58 + 21), "stringByAppendingPathComponent:", v99);
              if (objc_msgSend((id)objc_msgSend(v58, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"))&& !objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v100))
              {
                if (objc_msgSend((id)objc_msgSend(v58, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"))&& (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v100) & 1) == 0)
                {
                  v104 = +[PFUbiquitySwitchboard ubiquitousExternalReferenceLocationForUUID:inStore:]((uint64_t)PFUbiquitySwitchboard, v99, v58);
                  v105 = [_PFExternalReferenceData alloc];
                  v106 = v5;
                  v107 = objc_msgSend(v55, "bytes");
                  v108 = objc_msgSend(v55, "length");
                  v109 = v107;
                  v5 = v106;
                  v97 = -[_PFExternalReferenceData initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:ubiquitousLocation:](v105, "initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:ubiquitousLocation:", v109, v108, v100, v101, (*((_DWORD *)v58 + 48) >> 2) & 7, v104);
                }
                else
                {
                  v97 = v55;
                }
                goto LABEL_135;
              }
            }
            else
            {
              v101 = objc_msgSend(0, "stringByAppendingPathComponent:", v99);
            }
            v102 = [_PFExternalReferenceData alloc];
            v103 = objc_msgSend(v55, "bytes");
            v61 = objc_msgSend(v55, "length");
            if (v58)
              v62 = (*((_DWORD *)v58 + 48) >> 2) & 7;
            else
              v62 = 0;
            v63 = v102;
            v64 = v103;
            v65 = v100;
            v66 = v101;
          }
          v97 = -[_PFExternalReferenceData initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:](v63, "initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:", v64, v61, v65, v66, v62);
          goto LABEL_135;
        }
        v93 = (__CFString *)+[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v54, v17);
LABEL_122:
        v45 = v93;
        goto LABEL_123;
      }
      objc_msgSend(v17, "expression");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_44:
        v41 = 0;
        goto LABEL_45;
      }
LABEL_64:
      v47 = *(_QWORD *)v34;
      v48 = *((_QWORD *)v34 + 1);
      if (v47)
        v49 = v48 == 0;
      else
        v49 = 1;
      if (v49)
        goto LABEL_102;
      v50 = self->_parent_buffer;
      if (v50 && (v51 = v50->_weakRequestStore) != 0)
        v52 = objc_loadWeakRetained(&v51->_object);
      else
        v52 = 0;
      if (v47 < 16000)
      {
        v53 = objc_msgSend((id)objc_msgSend(v52, "model"), "entityForID:", v47);
        if (v53)
        {
LABEL_104:
          v90 = (objc_class *)objc_msgSend(v52, "objectIDFactoryForSQLEntity:", v53);

          v46 = (CFStringRef)(id)objc_msgSend([v90 alloc], "initWithPK64:", v48);
          goto LABEL_105;
        }
        goto LABEL_101;
      }
      v67 = (void *)objc_msgSend(v52, "ancillarySQLModels");
      v114 = 0u;
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v114, v120, 16);
      if (v68)
      {
        v69 = v68;
        v70 = *(_QWORD *)v115;
        do
        {
          v71 = 0;
          do
          {
            if (*(_QWORD *)v115 != v70)
              objc_enumerationMutation(v67);
            v72 = (unsigned int *)objc_msgSend(v67, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v71));
            if (v72)
            {
              if (v47 <= v72[17])
                goto LABEL_95;
              v73 = v72[18];
            }
            else
            {
              v73 = 0;
            }
            if (v47 <= v73)
            {
              v74 = objc_msgSend(v72, "entityForID:", v47);
              if (v74)
              {
                v53 = v74;
                goto LABEL_104;
              }
            }
LABEL_95:
            ++v71;
          }
          while (v69 != v71);
          v75 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v114, v120, 16);
          v69 = v75;
        }
        while (v75);
      }
      v76 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown ancillary entityID - %lld");
      _NSCoreDataLog(17, v76, v77, v78, v79, v80, v81, v82, v47);
      v83 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v119 = v47;
        _os_log_fault_impl(&dword_18A253000, v83, OS_LOG_TYPE_FAULT, "CoreData: Unknown ancillary entityID - %lld", buf, 0xCu);
      }
LABEL_101:

      _NSCoreDataLog(1, (uint64_t)CFSTR("BufferAllocations Result Object has an invalid Object ID"), v84, v85, v86, v87, v88, v89, v110);
LABEL_102:
      v45 = 0;
LABEL_106:
      v91 = v45;
LABEL_123:
      objc_autoreleasePoolPop(v5);
      return v45;
    default:
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unsupported property type: %@"), v28, v29, v30, v31, v32, v33, (uint64_t)v17);
      goto LABEL_44;
  }
}

- (id)objectForKey:(id)a3
{
  _PFResultArray *parent_buffer;
  NSKnownKeysDictionary *metadata;

  parent_buffer = self->_parent_buffer;
  if (parent_buffer)
    metadata = parent_buffer->_metadata;
  else
    metadata = 0;
  return -[_PFResultObject valueAtIndex:](self, "valueAtIndex:", -[NSKnownKeysMappingStrategy indexForKey:](-[NSKnownKeysDictionary mapping](metadata, "mapping"), "indexForKey:", a3));
}

- (_PFResultObject)retain
{
  _PFResultArray *v3;

  v3 = self->_parent_buffer;
  return self;
}

- (CFStringRef)stringFromPtr:(void *)a1
{
  _QWORD *v2;
  objc_class *v4;
  const UInt8 *v6;
  CFIndex v7;
  id v8;

  if (!a1)
    return 0;
  v2 = a2;
  if (*a2 != -1)
  {
    if (!*a2)
    {
      v4 = (objc_class *)objc_opt_class();
      object_setClass(v2, v4);
    }
    v2[1] = a1;
    return (CFStringRef)v2;
  }
  v6 = (const UInt8 *)a2 + +[_PFResultUniString bufferOffset](_PFResultUniString, "bufferOffset");
  v7 = *((unsigned int *)v2 + 4);
  v2[1] = a1;
  v8 = a1;
  return (id)CFStringCreateWithBytesNoCopy(0, v6, v7, 0x8000100u, 0, +[_PFResultUniString cfDeallocator](_PFResultUniString, "cfDeallocator"));
}

- (void)dataFromPtr:(uint64_t)a1
{
  void *v2;
  objc_class *v4;

  if (!a1)
    return 0;
  v2 = a2;
  if (!*a2)
  {
    v4 = (objc_class *)objc_opt_class();
    object_setClass(v2, v4);
  }
  objc_msgSend(v2, "setParentObject:", a1);
  return v2;
}

- (_PFResultObject)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{

  return 0;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (CFStringRef)taggedStringFromPtr:(CFStringRef)result withLength:(char *)__s
{
  __CFString *v2;
  int64_t v3;
  int64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!result)
    return result;
  v2 = (__CFString *)result;
  result = *(CFStringRef *)__s;
  if (*(_QWORD *)__s == -1)
  {
    result = -[_PFResultObject stringFromPtr:](v2, __s);
    if (result)
      return result;
    goto LABEL_11;
  }
  if ((*(_BYTE *)(*(_QWORD *)(v2->info + 24) + 40) & 2) != 0)
  {
    v3 = strlen(__s);
    if (v3 > 7)
    {
      v5 = 0;
    }
    else
    {
      v4 = v3;
      v16 = 0;
      __memmove_chk();
      v5 = (8 * v4) | (v16 << 7) | 0x8000000000000002;
      v14 = *MEMORY[0x1E0DE7C58] ^ v5;
      if ((~v14 & 0xC000000000000007) != 0)
        v5 = v14 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v14 & 7));
    }
    result = (CFStringRef)(id)v5;
  }
  if (!result)
  {
LABEL_11:
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexpected tagged string result");
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v15);
    v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Unexpected tagged string result", (uint8_t *)&v15, 2u);
    }
    return 0;
  }
  return result;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)retainCount
{
  return -[_PFResultArray retainCount](self->_parent_buffer, "retainCount");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t var0;

  if (self)
  {
    v8 = self;
    if (!a3->var0)
      a3->var2 = (unint64_t *)self;
    a3->var1 = a4;
    v9 = *(_QWORD *)(self + 8);
    if (v9)
      v10 = *(void **)(v9 + 40);
    else
      v10 = 0;
    v11 = (void *)objc_msgSend(v10, "mapping");
    v12 = objc_msgSend(v11, "length");
    v13 = objc_msgSend(v11, "keys");
    self = 0;
    var0 = a3->var0;
    if (a5 && var0 < v12)
    {
      self = 0;
      do
      {
        if (*(_QWORD *)(v8 + 40 + 8 * var0))
          a4[self++] = *(id *)(v13 + 8 * var0);
        ++var0;
      }
      while (var0 < v12 && self < a5);
    }
    a3->var0 = var0;
  }
  return self;
}

- (id)keyEnumerator
{
  _PFResultObjectKeyEnumerator *v3;
  _PFResultArray *parent_buffer;
  NSKnownKeysDictionary *metadata;
  uint64_t v6;
  _PFResultArray *v7;
  NSKnownKeysDictionary *v8;

  v3 = [_PFResultObjectKeyEnumerator alloc];
  parent_buffer = self->_parent_buffer;
  if (parent_buffer)
    metadata = parent_buffer->_metadata;
  else
    metadata = 0;
  v6 = -[NSKnownKeysMappingStrategy keys](-[NSKnownKeysDictionary mapping](metadata, "mapping"), "keys");
  v7 = self->_parent_buffer;
  if (v7)
    v8 = v7->_metadata;
  else
    v8 = 0;
  return -[_PFResultObjectKeyEnumerator initWithArray:forTarget:withReferenceValues:andRange:](v3, "initWithArray:forTarget:withReferenceValues:andRange:", v6, self, &self[1], 0, -[NSKnownKeysMappingStrategy length](-[NSKnownKeysDictionary mapping](v8, "mapping"), "length"));
}

@end
