@implementation NSSQLSavePlan

- (void)_populateRow:(_BYTE *)a3 fromObject:(int)a4 timestamp:(_BYTE *)a5 inserted:(double)a6 shouldAddToRowCache:
{
  _BYTE *v8;
  unint64_t *v10;
  unint64_t *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  int *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int isValidRelationshipDestination;
  BOOL v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  unint64_t *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id *v65;
  void *v66;
  _WORD *v67;
  void *v68;
  __CFString *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  Class Class;
  int v87;
  uint64_t v88;
  Class v89;
  uint64_t v90;
  uint64_t v91;
  Class v92;
  _QWORD *v93;
  _QWORD *v94;
  double v95;
  float v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  id Property;
  _BOOL4 v101;
  uint64_t v102;
  uint64_t v103;
  const __CFUUID *v104;
  CFStringRef v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  CFStringRef v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  _PFExternalReferenceData *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  _QWORD *v122;
  _BOOL4 v123;
  _NSDataFileBackedFuture *v124;
  id v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  id v129;
  unint64_t *v130;
  _BOOL4 v131;
  void *v132;
  void *v133;
  int v134;
  void *v135;
  unint64_t v136;
  uint64_t v139;
  uint64_t v140;
  _QWORD *v141;
  void *v142;
  void *v143;

  v8 = a3;
  v10 = (unint64_t *)objc_msgSend(a3, "entity");
  v11 = v10;
  if (v10)
    v143 = (void *)v10[13];
  else
    v143 = 0;
  v140 = _kvcPropertysPrimitiveGetters(v10);
  *a5 = 1;
  if ((v8[17] & 0x80) != 0)
    objc_msgSend(v8, "willAccessValueForKey:", 0);
  v134 = a4;
  v141 = (_QWORD *)a2;
  v130 = v11;
  if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
    v12 = 0;
  else
    v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
  v132 = v12;
  v142 = (void *)objc_msgSend(v12, "foreignKeyColumns");
  v13 = objc_msgSend(v142, "count");
  v139 = (uint64_t)v8;
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
    do
    {
      v17 = (void *)MEMORY[0x18D76B4E4]();
      v18 = (void *)objc_msgSend(v142, "objectAtIndex:", v15);
      v19 = (_QWORD *)objc_msgSend(v18, "toOneRelationship");
      v20 = v19;
      if (v19 && *((_BYTE *)v19 + v16[708]))
        goto LABEL_14;
      v21 = v16;
      v22 = objc_msgSend(v19, "name");
      v23 = objc_msgSend(v143, "fastIndexForKnownKey:", v22);
      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
        v28 = (void *)objc_msgSend(v8, "primitiveValueForKey:", v22);
      else
        _PF_Handler_Primitive_GetProperty((id **)v8, v23, v22, *(_QWORD *)(v140 + 8 * v23), v24, v25, v26, v27);
      v29 = v28;
      v30 = objc_msgSend((id)objc_msgSend(v28, "objectID"), "persistentStore");
      if (v30)
      {
        v31 = a1[1];
        if (!v31 || v30 != *(_QWORD *)(v31 + 8))
        {
          v129 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 133010, (uint64_t)CFSTR("CoreData does not support persistent cross-store relationships"), (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v8, CFSTR("Source object"), v29, CFSTR("Destination Object"), objc_msgSend((id)objc_msgSend(v130, "propertiesByName"), "objectForKey:", v22), CFSTR("Relationship"), 0));
          objc_exception_throw(v129);
        }
      }
      isValidRelationshipDestination = -[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v29);
      v33 = !v29 || isValidRelationshipDestination == 0;
      v34 = v33 ? 0 : objc_msgSend((id)objc_msgSend(v29, "objectID"), "_referenceData64");
      v16 = v21;
      objc_msgSend(v141, "setForeignKeySlot:int64:", objc_msgSend(v18, "slot"), v34);
      if (!v20)
        goto LABEL_14;
      v35 = (void *)v20[9];
      if (v35)
      {
        if (v29
          && ((v37 = (void *)objc_msgSend(v29, "objectID"), (v38 = a1[1]) == 0)
            ? (v39 = 0)
            : (v39 = *(_QWORD *)(v38 + 8)),
              (v40 = -[NSSQLCore entityForObjectID:](v39, v37)) != 0))
        {
          v36 = *(unsigned int *)(v40 + 184);
        }
        else
        {
          v36 = 0;
        }
        objc_msgSend(v141, "setForeignEntityKeySlot:entityKey:", objc_msgSend(v35, "slot"), v36);
        v8 = (_BYTE *)v139;
      }
      v41 = (void *)v20[10];
      if (!v41)
        goto LABEL_14;
      if (v29)
      {
        v43 = (void *)v20[7];
        v44 = objc_msgSend(v29, "entity");
        v45 = (unint64_t *)v44;
        if (v44)
          v46 = *(void **)(v44 + 104);
        else
          v46 = 0;
        v135 = v43;
        v47 = objc_msgSend(v43, "name");
        v48 = objc_msgSend(v46, "fastIndexForKnownKey:", v47);
        if (v48 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v49 = (void *)objc_msgSend(v29, "primitiveValueForKey:", v47);
        }
        else
        {
          v50 = v48;
          v51 = _kvcPropertysPrimitiveGetters(v45);
          _PF_Handler_Primitive_GetProperty((id **)v29, v50, v47, *(_QWORD *)(v51 + 8 * v50), v52, v53, v54, v55);
        }
        v56 = (uint64_t)v49;
        v8 = (_BYTE *)v139;
        if (v49)
        {
          v42 = objc_msgSend(v49, "count");
          if (v42)
          {
            -[NSSQLSavePlan _populateOrderKeysInOrderedSet:usingSourceObjectID:inverseRelationship:newIndexes:reorderedIndexes:]((uint64_t)a1, v56, objc_msgSend(v29, "objectID"), v135, 0, 0);
            LODWORD(v42) = -[_NSFaultingMutableOrderedSet _orderKeyForObject:](v56, v139);
          }
        }
        else
        {
          LODWORD(v42) = 0;
        }
        v16 = v21;
        if ((_DWORD)v42)
        {
LABEL_52:
          if (v34)
            v57 = v42;
          else
            v57 = 0;
          v58 = objc_msgSend(v41, "slot");
          v59 = v57;
          v8 = (_BYTE *)v139;
          objc_msgSend(v141, "setForeignOrderKeySlot:orderKey:", v58, v59);
          goto LABEL_14;
        }
      }
      else
      {
        LODWORD(v42) = 0;
      }
      if (!v34)
        goto LABEL_52;
LABEL_14:
      objc_autoreleasePoolPop(v17);
      ++v15;
    }
    while (v14 != v15);
  }
  v60 = (void *)objc_msgSend(v132, "attributeColumns");
  v61 = objc_msgSend(v60, "count");
  v62 = 0x20000;
  if (!_PF_INTERNAL_DATA_SIZE_THRESHOLD)
    v62 = 0;
  v136 = v62;
  if (v61)
  {
    v63 = v61;
    v64 = 0;
    v65 = (id *)v141[5];
    do
    {
      v66 = (void *)MEMORY[0x18D76B4E4]();
      v67 = (_WORD *)objc_msgSend(v60, "objectAtIndex:", v64);
      v68 = (void *)objc_msgSend(v67, "propertyDescription");
      if (v68 && objc_msgSend(v68, "superCompositeAttribute"))
        v69 = -[NSPropertyDescription _rootName]((__CFString *)objc_msgSend(v67, "propertyDescription"));
      else
        v69 = (__CFString *)objc_msgSend(v67, "name");
      v70 = (uint64_t)v69;
      v71 = objc_msgSend(v143, "fastIndexForKnownKey:", v69);
      if (v71 == 0x7FFFFFFFFFFFFFFFLL)
        v76 = objc_msgSend(v8, "primitiveValueForKey:", v70);
      else
        _PF_Handler_Primitive_GetProperty((id **)v8, v71, v70, *(_QWORD *)(v140 + 8 * v71), v72, v73, v74, v75);
      v77 = (_QWORD *)v76;
      if (objc_msgSend((id)objc_msgSend(v67, "attributeDescription"), "attributeType") == 1000)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          *a5 = 0;
      }
      v78 = objc_msgSend(v67, "slot");
      v85 = v78;
      if (v67 && (v67[16] & 8) != 0)
      {
        snapshot_get_value_as_object(v65, v78, v79, v80, v81, v82, v83, v84);
        objc_msgSend(v8, "setPrimitiveValue:forKey:", v88, v70);
      }
      else if (v77)
      {
        Class = object_getClass(v65);
        v87 = *(char *)(*((_QWORD *)object_getIndexedIvars(Class) + 7) + v85);
        switch(v87)
        {
          case 'c':
            snapshot_set_int8(v65, v85, objc_msgSend(v77, "charValue"));
            break;
          case 'd':
            if (objc_msgSend(v77, "isNSNumber"))
              objc_msgSend(v77, "doubleValue");
            else
              objc_msgSend(v77, "timeIntervalSinceReferenceDate");
            snapshot_set_double((char *)v65, v85, v95);
            break;
          case 'e':
          case 'g':
          case 'h':
            goto LABEL_88;
          case 'f':
            objc_msgSend(v77, "floatValue");
            snapshot_set_float((char *)v65, v85, v96);
            break;
          case 'i':
            snapshot_set_int32((char *)v65, v85, objc_msgSend(v77, "intValue"));
            break;
          default:
            if (v87 != 113)
            {
              if (v87 == 115)
              {
                snapshot_set_int16((char *)v65, v85, objc_msgSend(v77, "shortValue"));
                break;
              }
LABEL_88:
              if (objc_msgSend(v67, "sqlType") != 16)
              {
LABEL_96:
                v94 = v77;
                goto LABEL_97;
              }
              v92 = object_getClass(v65);
              v93 = *(id *)((char *)v65 + *((unsigned int *)object_getIndexedIvars(v92) + v85 + 19));
              if (((objc_msgSend(v67, "isFileBackedFuture") & 1) != 0 || v77 == v93)
                && (!objc_msgSend(v67, "isFileBackedFuture")
                 || objc_msgSend(v77, "isEqual:", v93)))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v122 = v77;
                  goto LABEL_152;
                }
              }
              objc_opt_class();
              v8 = (_BYTE *)v139;
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v77, "_createdByUbiquityImport"))
                goto LABEL_96;
              v133 = v93;
              if (!objc_msgSend(v67, "isFileBackedFuture"))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && objc_msgSend(v77, "isNSData")
                  && objc_msgSend(v93, "isEqualToData:", v77))
                {
                  v77 = v93;
                }
                else
                {
                  v102 = a1[1];
                  if (v102 && (v103 = *(_QWORD *)(v102 + 8)) != 0 && (*(_BYTE *)(v103 + 193) & 0x40) != 0
                    || v136 >= objc_msgSend(v77, "length"))
                  {
                    v108 = 0;
                    v113 = 0;
                  }
                  else
                  {
                    v104 = CFUUIDCreate(0);
                    v105 = CFUUIDCreateString(0, v104);
                    CFRelease(v104);
                    v106 = a1[1];
                    if (v106)
                      v107 = *(void **)(v106 + 152);
                    else
                      v107 = 0;
                    v108 = objc_msgSend(v107, "stringByAppendingPathComponent:", v105);
                    v8 = (_BYTE *)v139;
                    v109 = a1[1];
                    if (v109)
                      v110 = *(void **)(v109 + 160);
                    else
                      v110 = 0;
                    v111 = objc_msgSend(v110, "stringByAppendingPathComponent:", v105);
                    v112 = v105;
                    v113 = v111;
                    CFRelease(v112);
                  }
                  if (v133)
                  {
                    v115 = objc_opt_class();
                    v33 = v115 == objc_opt_class();
                    v8 = (_BYTE *)v139;
                    if (v33)
                    {
                      v116 = (id)a1[13];
                      if (!v116)
                      {
                        v116 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                        a1[13] = v116;
                      }
                      objc_msgSend(v116, "addObject:", v133);
                    }
                  }
                  v117 = [_PFExternalReferenceData alloc];
                  v118 = a1[1];
                  if (v118 && (v119 = *(_QWORD *)(v118 + 8)) != 0)
                    v120 = (*(_DWORD *)(v119 + 192) >> 2) & 7;
                  else
                    v120 = 0;
                  v77 = -[_PFExternalReferenceData initForExternalLocation:safeguardLocation:data:protectionLevel:](v117, "initForExternalLocation:safeguardLocation:data:protectionLevel:", v108, v113, v77, v120);
                  v121 = (id)a1[12];
                  if (!v121)
                  {
                    v121 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    a1[12] = v121;
                  }
                  objc_msgSend(v121, "addObject:", v77);
                }
                goto LABEL_97;
              }
              v98 = a1[1];
              if (v98)
                v99 = *(void **)(v98 + 168);
              else
                v99 = 0;
              Property = objc_getProperty(v77, v97, 16, 1);
              if (v133)
                v101 = objc_msgSend(v133, "fileURL") != 0;
              else
                v101 = 0;
              v131 = v101;
              if (objc_msgSend(v77, "_isCloudKitSupportOriginated"))
              {
                if (Property)
                  v123 = 0;
                else
                  v123 = v101;
                if (v123
                  && objc_msgSend((id)objc_msgSend(v77, "UUID"), "isEqual:", objc_msgSend(v133, "UUID")))
                {
LABEL_151:
                  v77 = v133;
LABEL_152:
                  v8 = (_BYTE *)v139;
LABEL_97:
                  snapshot_set_object((char *)v65, v85, (uint64_t)v77);
                  break;
                }
                v127 = (id)a1[14];
                if (!v127)
                {
                  v127 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  a1[14] = v127;
                }
                objc_msgSend(v127, "addObject:", v77);
                v128 = objc_msgSend(v99, "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(v77, "UUID"), "UUIDString"));
                v77 = -[_NSDataFileBackedFuture initWithURL:UUID:size:]([_NSDataFileBackedFuture alloc], (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v128, 0), (void *)objc_msgSend(v77, "UUID"), objc_msgSend(v77, "fileSize"));
                v8 = (_BYTE *)v139;
                v126 = (uint64_t)v133;
                if (!v131)
                  goto LABEL_97;
              }
              else
              {
                if (!objc_msgSend(v77, "fileURL")
                  && objc_msgSend((id)objc_msgSend(v77, "UUID"), "isEqual:", objc_msgSend(v133, "UUID")))
                {
                  goto LABEL_151;
                }
                v124 = [_NSDataFileBackedFuture alloc];
                v77 = -[_NSDataFileBackedFuture initWithDirectoryURL:UUID:originalURL:](v124, (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v99, 1), (void *)objc_msgSend(v77, "UUID"), Property);
                v125 = (id)a1[14];
                if (!v125)
                {
                  v125 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  a1[14] = v125;
                }
                objc_msgSend(v125, "addObject:", v77);
                v8 = (_BYTE *)v139;
                v126 = (uint64_t)v133;
                if (!v131)
                  goto LABEL_97;
              }
              -[NSSQLSavePlan _addFileBackedFutureToDelete:]((uint64_t)a1, v126);
              goto LABEL_97;
            }
            snapshot_set_int64((char *)v65, v85, objc_msgSend(v77, "longLongValue"));
            break;
        }
      }
      else if (((*((unsigned __int8 *)v65 + ((unint64_t)v78 >> 3) + 28) >> (v78 & 7)) & 1) == 0)
      {
        if (objc_msgSend(v67, "sqlType") == 16)
        {
          v89 = object_getClass(v65);
          v90 = *(uint64_t *)((char *)v65 + *((unsigned int *)object_getIndexedIvars(v89) + v85 + 19));
          v91 = objc_opt_class();
          v33 = v91 == objc_opt_class();
          v8 = (_BYTE *)v139;
          if (v33)
          {
            if (objc_msgSend(v67, "isFileBackedFuture"))
            {
              -[NSSQLSavePlan _addFileBackedFutureToDelete:]((uint64_t)a1, v90);
            }
            else
            {
              v114 = (id)a1[13];
              if (!v114)
              {
                v114 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                a1[13] = v114;
              }
              objc_msgSend(v114, "addObject:", v90);
            }
          }
        }
        snapshot_set_null((char *)v65, v85);
      }
      objc_autoreleasePoolPop(v66);
      ++v64;
    }
    while (v63 != v64);
  }
  -[NSSQLSavePlan _recordToManyChangesForObject:inRow:usingTimestamp:inserted:]((uint64_t)a1, (uint64_t)v8, (uint64_t)v141, v134, a6);
}

const void *__40__NSSQLSavePlan__computeUpdatedRowSplit__block_invoke(uint64_t a1, const void *a2, uint64_t a3)
{
  const void *result;
  uint64_t v7;

  result = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 24), a2);
  if (!result)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", a2))
      v7 = *(_QWORD *)(a1 + 48);
    else
      v7 = *(_QWORD *)(a1 + 56);
    return (const void *)objc_msgSend(*(id *)(*(_QWORD *)(v7 + 8) + 40), "addObject:", a3);
  }
  return result;
}

- (void)_computeUpdatedRowSplit
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
      v2 = (void *)objc_msgSend(v2, "persistentStoreRequest");
    v3 = (void *)objc_msgSend(v2, "updatedObjects");
    if (v3)
    {
      v4 = v3;
      if (objc_msgSend(v3, "count"))
      {
        v5 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v4);
        v14 = 0;
        v15 = &v14;
        v16 = 0x3052000000;
        v17 = __Block_byref_object_copy__49;
        v18 = __Block_byref_object_dispose__49;
        v19 = 0;
        v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v8 = 0;
        v9 = &v8;
        v10 = 0x3052000000;
        v11 = __Block_byref_object_copy__49;
        v12 = __Block_byref_object_dispose__49;
        v13 = 0;
        v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v6 = (void *)a1[2];
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __40__NSSQLSavePlan__computeUpdatedRowSplit__block_invoke;
        v7[3] = &unk_1E1EE15D0;
        v7[4] = a1;
        v7[5] = v5;
        v7[6] = &v14;
        v7[7] = &v8;
        objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

        a1[6] = v15[5];
        a1[7] = v9[5];
        _Block_object_dispose(&v8, 8);
        _Block_object_dispose(&v14, 8);
      }
    }
  }
}

- (uint64_t)_createRowsForSave
{
  uint64_t v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  os_unfair_lock_s *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  _BYTE *v27;
  void *v28;
  void *Value;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  _BYTE *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 8);
    if (v2)
      v2 = (void *)objc_msgSend(v2, "persistentStoreRequest");
    v3 = (void *)objc_msgSend(v2, "insertedObjects");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v4;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v76;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v76 != v8)
            objc_enumerationMutation(v3);
          v10 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v9);
          v11 = (void *)MEMORY[0x18D76B4E4]();
          v12 = (const void *)objc_msgSend(v10, "objectID");
          v13 = objc_msgSend(v10, "entity");
          if (v13)
          {
            v15 = (_QWORD *)v13;
            v16 = *(_QWORD *)(v1 + 8);
            if (v16)
              v17 = *(void **)(v16 + 8);
            else
              v17 = 0;
            v14 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v17, v15);
          }
          else
          {
            v14 = 0;
          }
          v18 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(_QWORD *)(v1 + 8), v12);
          v19 = (void *)objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, v14), "initWithSQLEntity:objectID:", v14, v12);
          v20 = v19;
          if (v18)
            v21 = *(unsigned int *)(*(_QWORD *)&v18[10]._os_unfair_lock_opaque + 12) + 1;
          else
            v21 = 1;
          objc_msgSend(v19, "setOptLock:", v21);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v1 + 16), v12, v20);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v1 + 24), v12, v20);

          objc_autoreleasePoolPop(v11);
          ++v9;
        }
        while (v7 != v9);
        v22 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
        v7 = v22;
      }
      while (v22);
    }
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v72 != v25)
            objc_enumerationMutation(v3);
          v27 = *(_BYTE **)(*((_QWORD *)&v71 + 1) + 8 * i);
          v28 = (void *)MEMORY[0x18D76B4E4]();
          Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 16), (const void *)objc_msgSend(v27, "objectID"));
          v70 = 1;
          -[NSSQLSavePlan _populateRow:fromObject:timestamp:inserted:shouldAddToRowCache:]((_QWORD *)v1, (uint64_t)Value, v27, 1, &v70, v5);
          if (v70)
          {
            v30 = *(void **)(v1 + 64);
            v31 = (uint64_t)Value;
          }
          else
          {
            v32 = *(void **)(v1 + 72);
            v31 = objc_msgSend(Value, "objectID");
            v30 = v32;
          }
          objc_msgSend(v30, "addObject:", v31);
          objc_autoreleasePoolPop(v28);
        }
        v24 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
      }
      while (v24);
    }
    v33 = *(void **)(v1 + 8);
    if (v33)
      v33 = (void *)objc_msgSend(v33, "persistentStoreRequest");
    v34 = (void *)objc_msgSend(v33, "updatedObjects");
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v67 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_BYTE **)(*((_QWORD *)&v66 + 1) + 8 * j);
          v40 = (void *)MEMORY[0x18D76B4E4]();
          v41 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v1, (void *)objc_msgSend(v39, "objectID"));
          v70 = 1;
          -[NSSQLSavePlan _populateRow:fromObject:timestamp:inserted:shouldAddToRowCache:]((_QWORD *)v1, (uint64_t)v41, v39, 0, &v70, v5);
          if (v70)
          {
            v42 = *(void **)(v1 + 64);
            v43 = (uint64_t)v41;
          }
          else
          {
            v44 = *(void **)(v1 + 72);
            v43 = objc_msgSend(v41, "objectID");
            v42 = v44;
          }
          objc_msgSend(v42, "addObject:", v43);
          objc_autoreleasePoolPop(v40);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
      }
      while (v36);
    }
    v45 = *(void **)(v1 + 8);
    if (v45)
      v45 = (void *)objc_msgSend(v45, "persistentStoreRequest");
    v46 = (void *)objc_msgSend(v45, "deletedObjects");
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    result = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
    if (result)
    {
      v47 = result;
      v48 = *(_QWORD *)v63;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v63 != v48)
            objc_enumerationMutation(v46);
          v50 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v49);
          v51 = (void *)MEMORY[0x18D76B4E4]();
          v52 = (void *)objc_msgSend(v50, "objectID");
          v53 = objc_msgSend(v50, "entity");
          if (v53)
          {
            v54 = (_QWORD *)v53;
            v55 = *(_QWORD *)(v1 + 8);
            v56 = v55 ? *(void **)(v55 + 8) : 0;
            v57 = _sqlCoreLookupSQLEntityForEntityDescription(v56, v54);
            if (v57)
            {
              v58 = v57;
              v59 = *(_DWORD *)(v57 + 280);
              if ((v59 & 1) != 0)
              {
                -[NSSQLSavePlan _prepareForDeletionOfDatabaseExternalPropertiesForObject:](v1, v50);
                v59 = *(_DWORD *)(v58 + 280);
              }
              if ((v59 & 2) != 0)
                -[NSSQLSavePlan _prepareForDeletionOfDatabaseExternalPropertiesForObject:](v1, v50);
            }
          }
          -[NSSQLSavePlan _createCorrelationTrackerUpdatesForDeletedObject:](v1, v50);
          v60 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v1, v52);
          v61 = v60;
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v1 + 16), v52);
          if (v60)
            objc_msgSend(*(id *)(v1 + 40), "addObject:", v60);

          objc_autoreleasePoolPop(v51);
          ++v49;
        }
        while (v47 != v49);
        result = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
        v47 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_findOrCreateChangeSnapshotForGlobalID:(uint64_t)a1
{
  void *Value;
  os_unfair_lock_s *v5;
  NSSQLObjectFaultRequestContext *v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;

  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
  if (!Value)
  {
    v5 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(_QWORD *)(a1 + 8), a2);
    if (!v5)
    {
      v6 = -[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](*(NSSQLObjectFaultRequestContext **)(a1 + 8), (uint64_t)a2);
      -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)&v6->super.super.isa, 0);
      v7 = *(_QWORD *)(a1 + 8);
      if (v7)
        v8 = *(_QWORD *)(v7 + 8);
      else
        v8 = 0;
      -[NSSQLCore dispatchRequest:withRetries:](v8, v6, 0);
      v9 = (os_unfair_lock_s *)-[NSSQLStoreRequestContext result](v6, "result");
      if (v9)
      {
        v10 = *(_QWORD *)(a1 + 8);
        if (v10)
          objc_msgSend(*(id *)(v10 + 136), "setObject:forKey:", v9, a2);
      }

      v11 = v9;
      if (!v9)
      {
        v14 = *(_QWORD *)(a1 + 8);
        if (v14)
          v15 = *(void **)(v14 + 8);
        else
          v15 = 0;
        v16 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v15, (_QWORD *)objc_msgSend(a2, "entity"));
        v12 = (void *)objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, v16), "initWithSQLEntity:objectID:", v16, a2);
        goto LABEL_11;
      }
      v5 = v9;
    }
    v12 = (void *)-[os_unfair_lock_s copy](v5, "copy");
LABEL_11:
    Value = v12;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), a2, v12);

  }
  return Value;
}

- (void)_recordToManyChangesForObject:(uint64_t)a3 inRow:(int)a4 usingTimestamp:(double)a5 inserted:
{
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  int v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  id v46;
  os_unfair_lock_s *v47;
  os_unfair_lock_s *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSSQLRelationshipFaultRequestContext *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t j;
  uint64_t v66;
  uint64_t v67;
  void **v68;
  _QWORD *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  void *v82;
  uint64_t v83;
  id *v84;
  void *v85;
  void *v86;
  void *v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id *v93;
  uint64_t v94;
  id *v95;
  void *v96;
  void *v97;
  int v98;
  id v99;
  void *v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  id v107;
  void *v108;
  uint64_t v109;
  uint64_t m;
  uint64_t v111;
  BOOL v112;
  uint64_t v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  void *v121;
  void *v122;
  malloc_zone_t *v123;
  malloc_zone_t *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  id v131;
  void *v132;
  id v133;
  uint64_t v134;
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
  int v150;
  uint64_t *v151;
  unint64_t v152;
  uint64_t v153;
  int v154;
  void *v155;
  uint64_t v156;
  void *v157;
  _QWORD *v158;
  _QWORD *v159;
  id v160;
  id v161;
  unint64_t v162;
  uint64_t v163;
  uint64_t v164;
  int v165;
  _QWORD *v166;
  unint64_t *v167;
  id v168;
  id v169;
  void *v170;
  _QWORD *v171;
  char *v172;
  void **v173;
  id v174;
  id v175;
  uint64_t v176;
  id v177;
  unint64_t v178;
  _BYTE *v179;
  _QWORD *v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  void *v185;
  const __CFString *v186;
  uint64_t v187;
  _QWORD v188[2];
  _QWORD v189[2];
  _BYTE v190[128];
  uint64_t v191;

  v165 = a4;
  v176 = a1;
  v191 = *MEMORY[0x1E0C80C00];
  v153 = objc_msgSend((id)a2, "managedObjectContext");
  v167 = (unint64_t *)objc_msgSend((id)a2, "entity");
  if (v167)
  {
    v164 = objc_msgSend((id)v167[13], "keys");
    v8 = v167;
    v166 = (_QWORD *)v167[14];
  }
  else
  {
    v164 = objc_msgSend(0, "keys");
    v8 = 0;
    v166 = 0;
  }
  v163 = _kvcPropertysPrimitiveGetters(v8);
  if ((*(_BYTE *)(a2 + 17) & 0x80) != 0)
    objc_msgSend((id)a2, "willAccessValueForKey:", 0);
  v155 = (void *)objc_msgSend((id)a3, "objectID");
  if (a3
    && (*(_BYTE *)(a3 + 16) & 2) == 0
    && (v9 = objc_msgSend(*(id *)(*(_QWORD *)(a3 + 40) + 16), "_storeInfo1")) != 0)
  {
    v150 = 0;
    v149 = v9;
    v157 = *(void **)(v9 + 40);
  }
  else
  {
    v149 = 0;
    v157 = 0;
    v150 = 1;
  }
  v159 = (_QWORD *)a3;
  v10 = *(_QWORD *)(a2 + 48);
  if (v10)
    v11 = *(void **)(v10 + 8);
  else
    v11 = 0;
  v156 = objc_msgSend(v11, "values");
  if (v156)
  {
    v158 = (_QWORD *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v172 = v159 ? (char *)objc_msgSend(*(id *)(v159[5] + 16), "_referenceData64") : 0;
    v12 = v166[18];
    v13 = v166[19] + v12;
    v178 = v12;
    v162 = v13;
    if (v12 < v13)
    {
      v14 = v165;
      if (!v159)
        v14 = 0;
      v154 = v14;
      v15 = *MEMORY[0x1E0C99768];
      v147 = *MEMORY[0x1E0CB3388];
      v148 = v15;
      while (1)
      {
        v170 = (void *)MEMORY[0x18D76B4E4]();
        v173 = *(void ***)(v164 + 8 * v178);
        v174 = -[NSEntityDescription _relationshipNamed:](v167, (uint64_t)v173);
        v20 = v166[16];
        v22 = v178 >= v20;
        v21 = v178 - v20;
        v22 = !v22 || v21 >= v166[17];
        v23 = !v22;
        LODWORD(v175) = v23;
        _PF_Handler_Primitive_GetProperty((id **)a2, v178, (uint64_t)v173, *(_QWORD *)(v163 + 8 * v178), v16, v17, v18, v19);
        v25 = v24;
        if (v165)
        {
          v26 = &NSOrderedSet_EmptyOrderedSet;
          if (!(_DWORD)v175)
            v26 = &NSSet_EmptySet;
          v27 = (_QWORD *)*v26;
        }
        else
        {
          v27 = *(_QWORD **)(v156 + 8 * v178);
        }
        v171 = v27;
        if (v24 == v27 || (objc_msgSend(v24, "isFault") & 1) != 0)
          goto LABEL_214;
        if (v158 != v25 && objc_msgSend(v25, "count"))
          break;
        v30 = (id)NSSet_EmptySet;
        if (v158 == v171 || !objc_msgSend(v171, "count"))
          goto LABEL_49;
        v31 = objc_msgSend(v171, "count");
        v32 = MEMORY[0x1E0C80A78](v31);
        v35 = (char *)&v147 - v34;
        if (v32 > 0x200)
          v35 = (char *)NSAllocateScannedUncollectable();
        else
          bzero((char *)&v147 - v34, 8 * v33);
        objc_msgSend(v171, "getObjects:", v35);
        v168 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", v35, v31);
        if (v31 >= 0x201)
          NSZoneFree(0, v35);
LABEL_53:
        v183 = 0u;
        v184 = 0u;
        v181 = 0u;
        v182 = 0u;
        v39 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v181, v190, 16, v147);
        if (v39)
        {
          v40 = *(_QWORD *)v182;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v182 != v40)
                objc_enumerationMutation(v30);
              v42 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * i);
              v43 = objc_msgSend((id)objc_msgSend(v42, "objectID"), "persistentStore");
              if (v43 != objc_msgSend((id)objc_msgSend((id)a2, "objectID"), "persistentStore"))
              {
                v132 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a2, CFSTR("Source object"), v42, CFSTR("Destination Object"), v174, CFSTR("Relationship"), 0);
                v133 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 133010, (uint64_t)CFSTR("CoreData does not support persistent cross-store relationships"), v132);

                objc_exception_throw(v133);
              }
            }
            v39 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v181, v190, 16);
          }
          while (v39);
        }
        if (objc_msgSend(v30, "count"))
          goto LABEL_85;
        v44 = objc_msgSend(v168, "count");
        if (v44)
          v45 = 0;
        else
          v45 = (int)v175;
        if (v45 == 1)
        {
          if (!v25 || !v25[4])
          {
            objc_msgSend(v171, "count");
            v46 = 0;
LABEL_84:

LABEL_85:
            if (!v154 || *(_DWORD *)(v159[5] + 12) != 1)
            {
              v55 = [NSSQLRelationshipFaultRequestContext alloc];
              v56 = *(_QWORD *)(v176 + 8);
              if (v56)
                v57 = *(_QWORD *)(v56 + 8);
              else
                v57 = 0;
              v58 = -[NSSQLRelationshipFaultRequestContext initWithObjectID:relationship:context:sqlCore:](v55, "initWithObjectID:relationship:context:sqlCore:", v155, v174, v153, v57);
              -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)v58, 0);
              v59 = *(_QWORD *)(v176 + 8);
              if (v59)
                v60 = *(_QWORD *)(v59 + 8);
              else
                v60 = 0;
              -[NSSQLCore dispatchRequest:withRetries:](v60, (_QWORD *)v58, 0);
              v61 = (void *)objc_msgSend((id)v58, "result");
              v62 = v61;
              if (v58)
              {
                v63 = *(void **)(v58 + 40);
                if (v63)
                {
                  v125 = v63;
                  v126 = objc_msgSend(v125, "code");
                  v127 = objc_msgSend(v125, "description");
                  v188[0] = objc_msgSend(v125, "domain");
                  v177 = (id)MEMORY[0x1E0CB37E8];
                  v128 = objc_msgSend(v125, "code");
                  v129 = objc_msgSend(v177, "numberWithLong:", v128);
                  v188[1] = v147;
                  v189[0] = v129;
                  v189[1] = v125;
                  v130 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v189, v188, 2);
                  v131 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v148, v126, v127, v130);
                  objc_exception_throw(v131);
                }
              }

              if (objc_msgSend(v61, "count"))
                v160 = (id)objc_msgSend(v61, "firstObject");
              else
                v160 = 0;
              if ((_DWORD)v175)
                v161 = (id)objc_msgSend(v61, "lastObject");
              else
                v161 = 0;

              if (!v160)
              {
                if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") < 2)
                {
                  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
                    _NSCoreDataLog(4, (uint64_t)CFSTR("Optimistic locking failure for %@.  Original row was missing while recording to-many changes."), v140, v141, v142, v143, v144, v145, (uint64_t)v155);
                }
                else
                {
                  _NSCoreDataLog(4, (uint64_t)CFSTR("Optimistic locking failure for %@.  Original row was missing while recording to-many changes.  New row = %@"), v134, v135, v136, v137, v138, v139, (uint64_t)v155);
                }
                v185 = v155;
                v186 = CFSTR("_NSCoreDataOptimisticLockingFailureConflictsKey");
                v187 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v185, 1);
                v146 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1);
                objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:](_NSCoreDataOptimisticLockingException, "exceptionWithName:reason:userInfo:", v148, CFSTR("optimistic locking failure"), v146));
              }
              v179 = 0;
              v180 = 0;
              v169 = -[NSSQLSavePlan _newRowCacheRowForToManyUpdatesForRelationship:rowCacheOriginal:originalOrderKeys:originalSnapshot:value:added:deleted:sourceRowPK:properties:sourceObject:newIndexes:reorderedIndexes:](v176, v174, v160, v161, v171, (char *)v25, v30, v168, v172, v157, (void *)a2, (void **)&v180, (void **)&v179);
              if (!(_DWORD)v175)
                goto LABEL_111;
LABEL_103:
              v64 = objc_msgSend(v169, "count");
              if (v64)
              {
                v177 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                for (j = 0; j != v64; ++j)
                {
                  v66 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v180[j]);
                  objc_msgSend(v177, "addObject:", v66);
                }
                -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, v169, v174, a5);
                if (!(_DWORD)v175)
                  goto LABEL_112;
              }
              else
              {
                v177 = (id)NSArray_EmptyArray;
                -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, v169, v174, a5);
              }
              -[NSPersistentCacheRow setAncillaryOrderKeys:forProperty:options:andTimestamp:](v159, v177, v174);
              goto LABEL_112;
            }
            v160 = (id)NSArray_EmptyArray;
            if ((v175 & 1) != 0)
            {
              v161 = (id)NSArray_EmptyArray;
              v179 = 0;
              v180 = 0;
              v169 = -[NSSQLSavePlan _newRowCacheRowForToManyUpdatesForRelationship:rowCacheOriginal:originalOrderKeys:originalSnapshot:value:added:deleted:sourceRowPK:properties:sourceObject:newIndexes:reorderedIndexes:](v176, v174, v160, v161, v171, (char *)v25, v30, v168, v172, v157, (void *)a2, (void **)&v180, (void **)&v179);
              goto LABEL_103;
            }
            v179 = 0;
            v180 = 0;
            v169 = -[NSSQLSavePlan _newRowCacheRowForToManyUpdatesForRelationship:rowCacheOriginal:originalOrderKeys:originalSnapshot:value:added:deleted:sourceRowPK:properties:sourceObject:newIndexes:reorderedIndexes:](v176, v174, v160, 0, v171, (char *)v25, v30, v168, v172, v157, (void *)a2, (void **)&v180, (void **)&v179);
            v161 = 0;
LABEL_111:
            -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, v169, v174, a5);
            v177 = 0;
LABEL_112:
            v173 = (void **)objc_msgSend(v157, "objectForKey:", v173);
            v67 = objc_msgSend(v174, "inverseRelationship");
            v68 = v173;
            if (!v67)
            {
              if (v173)
                v69 = v173[7];
              else
                v69 = 0;
              v70 = objc_msgSend((id)objc_msgSend(v69, "foreignKey"), "slot");
              if (v69 && (v71 = (void *)v69[10]) != 0)
                v72 = objc_msgSend(v71, "slot");
              else
                v72 = 0;
              v73 = objc_msgSend(v30, "count");
              v74 = objc_msgSend(v169, "count");
              v151 = &v147;
              MEMORY[0x1E0C80A78](v74);
              v77 = (char *)&v147 - v76;
              v152 = v78;
              if (v78 > 0x200)
                v77 = (char *)NSAllocateScannedUncollectable();
              else
                bzero((char *)&v147 - v76, 8 * v75);
              if ((_DWORD)v175)
              {
                v79 = objc_msgSend(v169, "getObjects:", v77);
                if (v74)
                {
                  for (k = 0; k != v74; ++k)
                  {
                    v81 = (void *)MEMORY[0x18D76B4E4](v79);
                    if (v179[k])
                    {
                      v82 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v176, *(void **)&v77[8 * k]);
                      objc_msgSend(v82, "setForeignKeySlot:int64:", v70, v172);
                      objc_msgSend(v82, "setForeignOrderKeySlot:orderKey:", v72, v180[k]);
                    }
                    objc_autoreleasePoolPop(v81);
                  }
                }
              }
              else
              {
                v83 = objc_msgSend(v30, "getObjects:", v77);
                if (v73)
                {
                  v84 = (id *)v77;
                  do
                  {
                    v85 = (void *)MEMORY[0x18D76B4E4](v83);
                    v86 = (void *)objc_msgSend(*v84, "objectID");
                    v87 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v176, v86);
                    objc_msgSend(v87, "setForeignKeySlot:int64:", v70, v172);
                    objc_autoreleasePoolPop(v85);
                    ++v84;
                    --v73;
                  }
                  while (v73);
                }
              }
              if (v152 >= 0x201)
                NSZoneFree(0, v77);
              v88 = objc_msgSend(v168, "count");
              v89 = v88;
              if (v88 <= v74)
                v90 = v74;
              else
                v90 = v88;
              MEMORY[0x1E0C80A78](v88);
              v93 = (id *)((char *)&v147 - v92);
              if (v90 > 0x200)
                v93 = (id *)NSAllocateScannedUncollectable();
              else
                bzero((char *)&v147 - v92, 8 * v91);
              if ((v175 & 1) == 0)
              {
                v94 = objc_msgSend(v168, "getObjects:", v93);
                if (v89)
                {
                  v95 = v93;
                  do
                  {
                    v96 = (void *)MEMORY[0x18D76B4E4](v94);
                    v97 = (void *)objc_msgSend(*v95, "objectID");
                    objc_msgSend(-[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v176, v97), "setForeignKeySlot:int64:", v70, 0);
                    objc_autoreleasePoolPop(v96);
                    ++v95;
                    --v89;
                  }
                  while (v89);
                }
              }
              if (v90 >= 0x201)
                NSZoneFree(0, v93);
              v68 = v173;
            }
            if (v68 && *((_BYTE *)v68 + 24) == 9 && (v68[8] ? (v98 = 1) : (v98 = (int)v175), v98 == 1))
            {
              if ((*(_BYTE *)(v176 + 148) & 1) != 0)
                v99 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              else
                v99 = 0;
              v106 = objc_msgSend(v30, "count");
              if (v106)
              {
                v171 = (_QWORD *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v30);
                v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2 * v106);
              }
              else
              {
                v171 = 0;
                v104 = 0;
              }
              if ((_DWORD)v175)
              {
                v175 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v107 = objc_alloc(MEMORY[0x1E0C99E20]);
                v108 = (void *)objc_msgSend(v107, "initWithArray:", v171);
                v109 = objc_msgSend(v169, "count");
                if (v109)
                {
                  for (m = 0; v109 != m; ++m)
                  {
                    v111 = objc_msgSend(v169, "objectAtIndex:", m);
                    if (v173[8])
                    {
                      if (objc_msgSend(v108, "containsObject:", v111))
                      {
                        v112 = v99 == 0;
                        objc_msgSend(v104, "addObject:", v111);
                        objc_msgSend(v104, "addObject:", objc_msgSend(v177, "objectAtIndex:", m));
                        goto LABEL_184;
                      }
                      if (v179[m])
                      {
LABEL_183:
                        v112 = v99 == 0;
                        objc_msgSend(v175, "addObject:", v111);
                        v113 = objc_msgSend(v177, "objectAtIndex:", m);
                        objc_msgSend(v175, "addObject:", v113);
LABEL_184:
                        if (!v112)
                        {
                          objc_msgSend(v99, "addObject:", v111);
                          objc_msgSend(v99, "addObject:", objc_msgSend(v177, "objectAtIndex:", m));
                        }
                      }
                    }
                    else if (v179[m])
                    {
                      goto LABEL_183;
                    }
                  }
                }
              }
              else
              {
                v175 = 0;
                v108 = v104;
                v104 = v171;
                v171 = 0;
              }

              if (v173[8])
              {
                v114 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v168);
                v115 = -[NSSQLSavePlan _correlationTableUpdateTrackerForRelationship:](v176, v173);
                -[NSSQLCorrelationTableUpdateTracker trackInserts:deletes:reorders:forObjectWithID:]((uint64_t)v115, v104, v114, v175, (uint64_t)v155);
                if (v99)
                {
                  v116 = v114;

                  goto LABEL_194;
                }

LABEL_203:
                v116 = 0;
              }
              else
              {
                v117 = -[NSSQLSavePlan _correlationTableUpdateTrackerForRelationship:](v176, v173[7]);
                -[NSSQLCorrelationTableUpdateTracker trackReorders:forObjectWithID:]((uint64_t)v117, v175, (uint64_t)v155);
                if (!v99)
                  goto LABEL_203;
                v116 = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v168);
LABEL_194:
                if (objc_msgSend(v99, "count"))
                  v118 = (uint64_t)v99;
                else
                  v118 = 0;
                if (objc_msgSend(v116, "count"))
                  v119 = (uint64_t)v116;
                else
                  v119 = 0;
                -[NSSQLSavePlan _registerChangedFOKs:deletions:forSourceObject:andRelationship:](v176, v118, v119, v155, v174);
              }

LABEL_205:
            }
            else if (objc_msgSend(v68, "isToMany"))
            {
              if ((*(_BYTE *)(v176 + 148) & 1) != 0 && v168 && objc_msgSend(v168, "count"))
              {
                v100 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v168);
                -[NSSQLSavePlan _registerChangedFOKs:deletions:forSourceObject:andRelationship:](v176, 0, (uint64_t)v100, v155, v174);

              }
              v101 = *(_QWORD *)(v176 + 8);
              if (v101)
              {
                if (*(_BYTE *)(v101 + 82)
                  && (!(_DWORD)v175
                   || objc_msgSend(v30, "count")
                   || objc_msgSend(v168, "count")
                   || objc_msgSend(v171, "count")))
                {
                  v102 = objc_alloc(MEMORY[0x1E0CB3940]);
                  if ((v150 & 1) != 0)
                    v103 = 0;
                  else
                    v103 = *(unsigned int *)(v149 + 184);
                  v104 = (void *)objc_msgSend(v102, "initWithFormat:", CFSTR("%u-%lld"), v103, objc_msgSend(v155, "_referenceData64"));
                  v105 = (void *)objc_msgSend(*(id *)(v176 + 128), "objectForKey:", v104);
                  if (v105)
                  {
                    objc_msgSend(v105, "addObject:", objc_msgSend(v174, "name"));
                  }
                  else
                  {
                    v120 = objc_alloc(MEMORY[0x1E0C99E20]);
                    v121 = (void *)objc_msgSend(v120, "initWithObjects:", objc_msgSend(v174, "name"), 0);
                    objc_msgSend(*(id *)(v176 + 128), "setObject:forKey:", v121, v104);

                  }
                  goto LABEL_205;
                }
              }
            }
            v122 = v179;
            if (v179)
            {
              v123 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
              if (!_PF_Private_Malloc_Zone)
              {
                v123 = malloc_default_zone();
                v122 = v179;
              }
              malloc_zone_free(v123, v122);
              v124 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
              if (!_PF_Private_Malloc_Zone)
                v124 = malloc_default_zone();
              malloc_zone_free(v124, v180);
            }

            v54 = v160;
            goto LABEL_213;
          }
          v46 = -[_NSFaultingMutableOrderedSet _newOrderKeys]((uint64_t)v25);
          v47 = (os_unfair_lock_s *)objc_msgSend(*(id *)(v176 + 8), "rowCache");
          v48 = -[NSPersistentStoreCache ancillaryOrderKeysForSourceObjectID:forProperty:afterTimestamp:](v47, v155, v174, *(double *)&NSSQLDistantPastTimeInterval);
          v49 = objc_msgSend(v171, "count");
          if (!v48)
            goto LABEL_84;
          v50 = v49;
          v51 = objc_msgSend(v46, "count");
          if (v51 != -[os_unfair_lock_s count](v48, "count") || v50 != -[os_unfair_lock_s count](v48, "count"))
            goto LABEL_84;
          if (v50)
          {
            v52 = 0;
            do
            {
              v53 = objc_msgSend(v171, "objectAtIndex:", v52);
              if (v53 != objc_msgSend(v25, "objectAtIndex:", v52)
                || (objc_msgSend((id)objc_msgSend(v46, "objectAtIndex:", v52), "isEqual:", -[os_unfair_lock_s objectAtIndex:](v48, "objectAtIndex:", v52)) & 1) == 0)
              {
                goto LABEL_84;
              }
            }
            while (v50 != ++v52);
          }

        }
        else if (v44)
        {
          goto LABEL_85;
        }
        if (v154 && *(_DWORD *)(v159[5] + 12) == 1)
        {
          -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, (void *)NSArray_EmptyArray, v174, a5);
          if ((_DWORD)v175)
            -[NSPersistentCacheRow setAncillaryOrderKeys:forProperty:options:andTimestamp:](v159, (void *)NSArray_EmptyArray, v174);
        }
        v177 = 0;
        v54 = 0;
        v161 = 0;
LABEL_213:

LABEL_214:
        objc_autoreleasePoolPop(v170);
        if (++v178 == v162)
          return;
      }
      v28 = objc_msgSend(v25, "count");
      v29 = (uint64_t)v171;
      if (v158 != v171)
      {
        v29 = objc_msgSend(v171, "count");
        if (v29)
        {
          v168 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v171, v25);
          v30 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v25, v171);
          goto LABEL_53;
        }
      }
      MEMORY[0x1E0C80A78](v29);
      v38 = (char *)&v147 - v37;
      if (v28 > 0x200)
        v38 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)&v147 - v37, 8 * v36);
      objc_msgSend(v25, "getObjects:", v38);
      v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", v38, v28);
      if (v28 >= 0x201)
        NSZoneFree(0, v38);
LABEL_49:
      v168 = (id)NSSet_EmptySet;
      goto LABEL_53;
    }
  }
}

- (id)initForRequestContext:(id)a3
{
  NSSQLSavePlan *v4;
  NSSQLSavePlan *v5;
  uint64_t v6;
  CFIndex v7;
  const __CFAllocator *v8;
  NSSQLSaveChangesRequestContext *requestContext;
  NSSQLSaveChangesRequestContext *v10;
  NSSQLSaveChangesRequestContext *v11;
  NSSQLSaveChangesRequestContext *v12;
  NSSQLSaveChangesRequestContext *v13;
  uint64_t v14;
  NSSQLSaveChangesRequestContext *v15;
  NSSQLSaveChangesRequestContext *v16;
  NSSQLSaveChangesRequestContext *v17;
  CFDictionaryValueCallBacks valueCallBacks;
  CFDictionaryKeyCallBacks keyCallBacks;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NSSQLSavePlan;
  v4 = -[NSSQLSavePlan init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_requestContext = (NSSQLSaveChangesRequestContext *)a3;
    if (a3)
    {
      v6 = *((_QWORD *)a3 + 1);
      if (v6)
        LODWORD(v6) = (*(_DWORD *)(v6 + 192) >> 5) & 1;
    }
    else
    {
      LODWORD(v6) = 0;
    }
    v4->_flags = (_sqlSaveFlags)(*(_DWORD *)&v4->_flags & 0xFFFFFFFE | v6);
    v7 = *MEMORY[0x1E0C9B390];
    keyCallBacks.retain = 0;
    keyCallBacks.release = 0;
    keyCallBacks.version = v7;
    *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B390] + 24);
    keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E0C9B390] + 40);
    valueCallBacks.version = *MEMORY[0x1E0C9B3A0];
    *(_OWORD *)&valueCallBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 8);
    valueCallBacks.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E0C9B3A0] + 24);
    valueCallBacks.equal = 0;
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4->_changeCache = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &keyCallBacks, &valueCallBacks);
    requestContext = v5->_requestContext;
    if (requestContext)
      requestContext = -[NSSQLStoreRequestContext persistentStoreRequest](requestContext, "persistentStoreRequest");
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](requestContext, "insertedObjects"), "count");
    v10 = v5->_requestContext;
    if (v10)
      v10 = -[NSSQLStoreRequestContext persistentStoreRequest](v10, "persistentStoreRequest");
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext updatedObjects](v10, "updatedObjects"), "count");
    _CFDictionarySetCapacity();
    v5->_insertCache = CFDictionaryCreateMutable(v8, 0, &keyCallBacks, &valueCallBacks);
    v11 = v5->_requestContext;
    if (v11)
      v11 = -[NSSQLStoreRequestContext persistentStoreRequest](v11, "persistentStoreRequest");
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](v11, "insertedObjects"), "count");
    _CFDictionarySetCapacity();
    v5->_toManyCache = CFDictionaryCreateMutable(v8, 0, &keyCallBacks, &valueCallBacks);
    v12 = v5->_requestContext;
    if (v12)
      v12 = -[NSSQLStoreRequestContext persistentStoreRequest](v12, "persistentStoreRequest");
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](v12, "insertedObjects"), "count");
    v13 = v5->_requestContext;
    if (v13)
      v13 = -[NSSQLStoreRequestContext persistentStoreRequest](v13, "persistentStoreRequest");
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext updatedObjects](v13, "updatedObjects"), "count");
    _CFDictionarySetCapacity();
    v5->_toManyRelationshipChanges = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_rowsToDelete = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((*(_BYTE *)&v5->_flags & 1) != 0)
    {
      v5->_updatedFOKRowsInCurrentSave = CFDictionaryCreateMutable(v8, 0, &keyCallBacks, &valueCallBacks);
      v5->_deletedFOKRowsInCurrentSave = CFDictionaryCreateMutable(v8, 0, &keyCallBacks, &valueCallBacks);
    }
    v5->_rowsToAddToRowCache = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5->_objectIDsToRemoveFromRowCache = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (a3)
      v14 = *((_QWORD *)a3 + 1);
    else
      v14 = 0;
    v5->_usedIndexes = (NSMutableDictionary *)-[NSSQLCore harvestIndexStatisticsFromConnections](v14);
    v15 = v5->_requestContext;
    if (v15)
      v15 = -[NSSQLStoreRequestContext persistentStoreRequest](v15, "persistentStoreRequest");
    if (objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](v15, "insertedObjects"), "count"))
      goto LABEL_29;
    v16 = v5->_requestContext;
    if (v16)
      v16 = -[NSSQLStoreRequestContext persistentStoreRequest](v16, "persistentStoreRequest");
    if (objc_msgSend((id)-[NSSQLSaveChangesRequestContext updatedObjects](v16, "updatedObjects"), "count"))
      goto LABEL_29;
    v17 = v5->_requestContext;
    if (v17)
      v17 = -[NSSQLStoreRequestContext persistentStoreRequest](v17, "persistentStoreRequest");
    if (objc_msgSend((id)-[NSSQLSaveChangesRequestContext deletedObjects](v17, "deletedObjects"), "count")
      || -[NSMutableDictionary count](v5->_usedIndexes, "count"))
    {
LABEL_29:
      *(_DWORD *)&v5->_flags |= 2u;
    }
  }
  return v5;
}

- (void)_createCorrelationTrackerUpdatesForDeletedObject:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  objc_class *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v2 = a2;
  v50 = a1;
  v65 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "entity");
  v4 = (unint64_t *)v3;
  if (v3)
  {
    v5 = objc_msgSend(*(id *)(v3 + 104), "keys");
    v6 = v4[14];
  }
  else
  {
    v5 = objc_msgSend(0, "keys");
    v6 = 0;
  }
  v53 = _kvcPropertysPrimitiveGetters(v4);
  if ((*((_BYTE *)v2 + 17) & 0x80) != 0)
    objc_msgSend(v2, "willAccessValueForKey:", 0);
  v49 = objc_msgSend(v2, "objectID");
  v7 = objc_msgSend(v2, "entity");
  if (v7
    && ((v8 = (_QWORD *)v7, (v9 = *(_QWORD *)(v50 + 8)) == 0) ? (v10 = 0) : (v10 = *(void **)(v9 + 8)),
        (v11 = _sqlCoreLookupSQLEntityForEntityDescription(v10, v8)) != 0))
  {
    v54 = *(id *)(v11 + 40);
  }
  else
  {
    v54 = 0;
  }
  v12 = *((_QWORD *)v2 + 6);
  if (v12)
    v13 = *(void **)(v12 + 8);
  else
    v13 = 0;
  v52 = objc_msgSend(v13, "values");
  if (v52)
  {
    v51 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = *(_QWORD *)(v6 + 144);
    v14 = *(_QWORD *)(v6 + 152);
    v16 = v14 + v15;
    if (v15 < v14 + v15)
    {
      v17 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
      v47 = v5;
      v48 = v2;
      while (1)
      {
        v18 = *(_QWORD *)(v5 + 8 * v15);
        v19 = objc_msgSend(v54, "objectForKey:", v18, v47, v48);
        if (v19)
        {
          v24 = (void *)v19;
          if (*(_BYTE *)(v19 + 24) == 9)
          {
            if (*(_QWORD *)(v19 + v17[590]))
            {
              _PF_Handler_Primitive_GetProperty((id **)v2, v15, v18, *(_QWORD *)(v53 + 8 * v15), v20, v21, v22, v23);
              v26 = *(void **)(v52 + 8 * v15);
              if (v25 != v26)
              {
                v27 = v25;
                if ((objc_msgSend(v25, "isFault") & 1) == 0)
                  break;
              }
            }
          }
        }
LABEL_56:
        if (++v15 == v16)
          return;
      }
      if ((void *)v51 == v27 || !objc_msgSend(v27, "count"))
      {
        v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        if ((void *)v51 != v26 && objc_msgSend(v26, "count"))
        {
          v30 = objc_msgSend(v26, "count");
          v31 = MEMORY[0x1E0C80A78](v30);
          v34 = (char *)&v47 - v33;
          if (v31 > 0x200)
            v34 = (char *)NSAllocateScannedUncollectable();
          else
            bzero((char *)&v47 - v33, 8 * v32);
          objc_msgSend(v26, "getObjects:", v34);
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", v34, v30);
          if (v30 >= 0x201)
            NSZoneFree(0, v34);
          goto LABEL_39;
        }
        v35 = (objc_class *)MEMORY[0x1E0C99E20];
      }
      else
      {
        if ((void *)v51 != v26 && objc_msgSend(v26, "count"))
        {
          v28 = +[_PFRoutines newMutableSetFromCollection:byIntersectingWithCollection:]((uint64_t)_PFRoutines, v26, v27);
          v29 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v26, v27);
LABEL_35:
          v36 = v29;
LABEL_39:
          v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v38 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v60;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v60 != v40)
                  objc_enumerationMutation(v28);
                objc_msgSend(v37, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "objectID"));
              }
              v39 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
            }
            while (v39);
          }
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v42 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v43; ++j)
              {
                if (*(_QWORD *)v56 != v44)
                  objc_enumerationMutation(v36);
                objc_msgSend(v37, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "objectID"));
              }
              v43 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            }
            while (v43);
          }
          if (objc_msgSend(v37, "count"))
          {
            v46 = -[NSSQLSavePlan _correlationTableUpdateTrackerForRelationship:](v50, v24);
            -[NSSQLCorrelationTableUpdateTracker trackInserts:deletes:reorders:forObjectWithID:]((uint64_t)v46, 0, v37, 0, v49);
          }

          v5 = v47;
          v2 = v48;
          v17 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
          goto LABEL_56;
        }
        v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v35 = (objc_class *)MEMORY[0x1E0C99E20];
      }
      v29 = objc_alloc_init(v35);
      goto LABEL_35;
    }
  }
}

- (id)_newRowCacheRowForToManyUpdatesForRelationship:(void *)a3 rowCacheOriginal:(void *)a4 originalOrderKeys:(void *)a5 originalSnapshot:(char *)a6 value:(void *)a7 added:(void *)a8 deleted:(char *)a9 sourceRowPK:(void *)a10 properties:(void *)a11 sourceObject:(void *)a12 newIndexes:(void *)a13 reorderedIndexes:
{
  unint64_t v20;
  int v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  void *v38;
  void **v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void **v52;
  id v53;
  size_t v54;
  malloc_zone_t *v55;
  malloc_zone_t *v56;
  char *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  void **j;
  void *v64;
  const void *v65;
  NSFetchRequest *v66;
  NSExpressionDescription *v67;
  NSExpressionDescription *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSSQLFetchRequestContext *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  void *v83;
  uint64_t v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  void *v89;
  void *v90;
  const void *v91;
  os_unfair_lock_s *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  NSFetchRequest *v96;
  NSSQLFetchRequestContext *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t m;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t n;
  const void *v119;
  void *v120;
  os_unfair_lock_s *v121;
  void *Value;
  BOOL v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const void *v127;
  void *v128;
  uint64_t v129;
  id v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  id v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  _NSFaultingMutableOrderedSet *v140;
  uint64_t v141;
  _NSFaultingMutableOrderedSet *v142;
  char v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  BOOL v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  char v151;
  id v152;
  uint64_t v153;
  malloc_zone_t *v154;
  void *v155;
  malloc_zone_t *v156;
  char *v157;
  void *v158;
  const void *v159;
  os_unfair_lock_s *v160;
  NSSQLObjectFaultRequestContext *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  os_unfair_lock_s *v165;
  uint64_t v166;
  uint64_t v167;
  uint32_t v168;
  void *v169;
  NSSQLObjectFaultRequestContext *v170;
  uint64_t v171;
  uint64_t v172;
  os_unfair_lock_s *v173;
  void *v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  const void *v179;
  uint64_t v180;
  _QWORD *v181;
  uint64_t v182;
  char v183;
  uint64_t v184;
  uint64_t v185;
  unint64_t v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const void *v191;
  const void *v192;
  void *v193;
  NSSQLObjectFaultRequestContext *v194;
  uint64_t v195;
  uint64_t v196;
  id v197;
  uint64_t v198;
  id v199;
  char *v200;
  id v201;
  void *v202;
  uint64_t v204;
  char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  uint64_t v210;
  id v211;
  void **v212;
  id v213;
  id v214;
  id v215;
  unint64_t v216;
  void *v217;
  unint64_t v218;
  id v219;
  uint64_t v220;
  id v221;
  void *v222;
  void *v223;
  id v224;
  id v225;
  id v226;
  void **v227;
  char *v228;
  int v229;
  unint64_t v230;
  _NSFaultingMutableOrderedSet *v231;
  id v232;
  char *v233;
  id v234;
  id v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  _BYTE v252[128];
  _BYTE v253[128];
  _BYTE v254[128];
  _BYTE v255[128];
  uint64_t v256;

  v233 = a6;
  v256 = *MEMORY[0x1E0C80C00];
  v219 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v224 = a11;
  v226 = (id)objc_msgSend(a11, "objectID");
  v20 = objc_msgSend(a7, "count");
  v222 = a8;
  v230 = objc_msgSend(a8, "count");
  v223 = a2;
  v21 = objc_msgSend(a2, "isOrdered");
  if (!a3)
  {
    v208 = *MEMORY[0x1E0C99768];
    v209 = (void *)MEMORY[0x1E0C99D80];
    v210 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 134030);
    v211 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v208, 134030, (uint64_t)CFSTR("Invalid rowCache row is nil"), (void *)objc_msgSend(v209, "dictionaryWithObject:forKey:", v210, *MEMORY[0x1E0CB28A8]));
    objc_exception_throw(v211);
  }
  v22 = v21;
  if (v21)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  else if (objc_msgSend(a3, "isNSArray"))
  {
    v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a3);
  }
  else
  {
    v23 = (id)objc_msgSend(a3, "mutableCopy");
  }
  v235 = v23;
  v221 = a10;
  v220 = objc_msgSend(a3, "count");
  MEMORY[0x1E0C80A78](v220);
  v26 = (char *)&v212 - v25;
  v218 = v27;
  if (v27 > 0x200)
  {
    v28 = NSAllocateScannedUncollectable();
    v26 = (char *)v28;
  }
  else
  {
    bzero((char *)&v212 - v25, 8 * v24);
  }
  v229 = v22;
  v228 = v26;
  if (!v22)
  {
    if (v20)
    {
      MEMORY[0x1E0C80A78](v28);
      v32 = (char *)&v212 - v31;
      v33 = v26;
      if (v20 > 0x200)
        v32 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)&v212 - v31, 8 * v20);
      objc_msgSend(a7, "getObjects:", v32);
      v34 = 0;
      v35 = 0;
      do
      {
        v36 = objc_msgSend(*(id *)&v32[8 * v34], "objectID");
        if (v36)
          *(_QWORD *)&v33[8 * v35++] = v36;
        ++v34;
      }
      while (v20 != v34);
      v37 = v20 < 0x201;
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v33, v35);
      objc_msgSend(v235, "addObjectsFromArray:", v38);

      if (!v37)
        NSZoneFree(0, v32);
      v26 = v33;
    }
    goto LABEL_216;
  }
  v227 = a13;
  v217 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, a5);
  if ((objc_msgSend(a3, "isNSArray") & 1) == 0)
    a3 = (void *)objc_msgSend(a3, "array");
  if ((objc_msgSend(a3, "isEqual:", v217) & 1) != 0)
  {
    v29 = objc_msgSend(v223, "name");
    v30 = (_QWORD *)objc_msgSend(v221, "objectForKey:", v29);
    if ((*(_BYTE *)(a1 + 148) & 1) != 0)
      v234 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v234 = 0;
    v39 = v227;
    v215 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v30, "isToMany"))
    {
      if (v30 && (v40 = v30[7]) != 0)
        v41 = *(void **)(v40 + 80);
      else
        v41 = 0;
      LODWORD(v231) = objc_msgSend(v41, "slot");
    }
    else
    {
      LODWORD(v231) = 0;
    }
    v54 = objc_msgSend(v233, "count");
    v55 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v55 = malloc_default_zone();
    *v39 = malloc_type_zone_calloc(v55, v54, 1uLL, 0x100004077774924uLL);
    v56 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v56 = malloc_default_zone();
    *a12 = malloc_type_zone_calloc(v56, v54, 8uLL, 0x100004000313F17uLL);
    v57 = v233;
    v225 = v30;
    -[NSSQLSavePlan _populateOrderKeysInOrderedSet:usingSourceObjectID:inverseRelationship:newIndexes:reorderedIndexes:](a1, (uint64_t)v233, (uint64_t)v226, v30, (_QWORD **)a12, v39);
    v227 = (void **)objc_msgSend(v57, "count");
    v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v248 = 0u;
    v249 = 0u;
    v250 = 0u;
    v251 = 0u;
    v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v248, v255, 16);
    if (v59)
    {
      v60 = *(_QWORD *)v249;
      do
      {
        for (i = 0; i != v59; ++i)
        {
          if (*(_QWORD *)v249 != v60)
            objc_enumerationMutation(v233);
          v62 = objc_msgSend(*(id *)(*((_QWORD *)&v248 + 1) + 8 * i), "objectID");
          objc_msgSend(v235, "addObject:", v62);
        }
        v59 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v248, v255, 16);
      }
      while (v59);
    }
    if (objc_msgSend(v225, "isToMany"))
    {
      if (v227)
      {
        for (j = 0; j != v227; j = (void **)((char *)j + 1))
        {
          v64 = (void *)MEMORY[0x18D76B4E4]();
          v65 = (const void *)objc_msgSend((id)objc_msgSend(v233, "objectAtIndex:", j), "objectID");
          if (!-[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(_QWORD *)(a1 + 8), v65))
            objc_msgSend(v58, "addObject:", v65);
          objc_autoreleasePoolPop(v64);
        }
      }
      v232 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (objc_msgSend(v58, "count"))
      {
        v66 = objc_alloc_init(NSFetchRequest);
        -[NSFetchRequest setEntity:](v66, "setEntity:", objc_msgSend((id)objc_msgSend(v225, "destinationEntity"), "entityDescription"));
        -[NSFetchRequest setPredicate:](v66, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v58));
        -[NSFetchRequest setAllocationType:](v66, "setAllocationType:", 1);
        -[NSFetchRequest setResultType:](v66, "setResultType:", 2);
        v67 = objc_alloc_init(NSExpressionDescription);
        -[NSPropertyDescription setName:](v67, "setName:", CFSTR("self"));
        -[NSExpressionDescription setExpression:](v67, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject"));
        -[NSExpressionDescription setExpressionResultType:](v67, "setExpressionResultType:", 2000);
        v68 = objc_alloc_init(NSExpressionDescription);
        -[NSPropertyDescription setName:](v68, "setName:", CFSTR("fok"));
        if (v225 && (v69 = *((_QWORD *)v225 + 7)) != 0)
          v70 = *(void **)(v69 + 80);
        else
          v70 = 0;
        v71 = objc_msgSend(v70, "name");
        -[NSExpressionDescription setExpression:](v68, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v71));
        -[NSExpressionDescription setExpressionResultType:](v68, "setExpressionResultType:", 200);
        -[NSFetchRequest setPropertiesToFetch:](v66, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v67, v68, 0));
        v72 = [NSSQLFetchRequestContext alloc];
        v73 = *(_QWORD *)(a1 + 8);
        if (v73)
        {
          v74 = *(_QWORD *)(v73 + 32);
          v75 = *(_QWORD *)(v73 + 8);
        }
        else
        {
          v74 = 0;
          v75 = 0;
        }
        v76 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:](v72, "initWithRequest:context:sqlCore:", v66, v74, v75);
        -[NSSQLStoreRequestContext setQueryGenerationToken:](v76, 0);
        v77 = *(_QWORD *)(a1 + 8);
        if (v77)
          v78 = *(_QWORD *)(v77 + 8);
        else
          v78 = 0;
        -[NSSQLCore dispatchRequest:withRetries:](v78, v76, 0);
        v79 = (id)objc_msgSend(v76, "result");

        v246 = 0u;
        v247 = 0u;
        v244 = 0u;
        v245 = 0u;
        v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v244, v254, 16);
        if (v80)
        {
          v81 = *(_QWORD *)v245;
          do
          {
            for (k = 0; k != v80; ++k)
            {
              if (*(_QWORD *)v245 != v81)
                objc_enumerationMutation(v79);
              v83 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * k);
              v84 = objc_msgSend(v83, "objectForKey:", CFSTR("self"));
              objc_msgSend(v232, "setObject:forKey:", v83, v84);
            }
            v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v244, v254, 16);
          }
          while (v80);
        }

        v58 = 0;
      }
    }
    else
    {
      v232 = 0;
    }

    if (objc_msgSend(v225, "isToMany"))
    {
      v214 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (v227)
      {
        v88 = 0;
        v216 = v231;
        while (1)
        {
          v89 = (void *)MEMORY[0x18D76B4E4]();
          v90 = (void *)objc_msgSend(v233, "objectAtIndex:", v88);
          v91 = (const void *)objc_msgSend(v90, "objectID");
          v92 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(_QWORD *)(a1 + 8), v91);
          v93 = v92 ? 0 : (void *)objc_msgSend(v232, "objectForKey:", v91);
          -[NSSQLSavePlan _populateOrderKeysInOrderedSet:usingSourceObjectID:inverseRelationship:newIndexes:reorderedIndexes:](a1, (uint64_t)v233, (uint64_t)v226, v225, 0, 0);
          v94 = -[_NSFaultingMutableOrderedSet _orderKeyForObject:]((uint64_t)v233, (uint64_t)v90);
          v95 = v94;
          if (v92)
            break;
          if (objc_msgSend((id)objc_msgSend(v93, "objectForKey:", CFSTR("fok")), "intValue") != (_DWORD)v94)
          {
            objc_msgSend(v214, "addObject:", v91);
LABEL_90:
            objc_msgSend(v87, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v95), v91);
          }
LABEL_91:
          objc_autoreleasePoolPop(v89);
          if (v227 == (void **)++v88)
            goto LABEL_92;
        }
        if (*(uint32_t *)((char *)&v92[v216]._os_unfair_lock_opaque
                         + _NSSQLRowInstanceSize
                         + (((unint64_t)v92[4]._os_unfair_lock_opaque >> 1) & 0x1FFF8)) == (_DWORD)v94)
          goto LABEL_91;
        goto LABEL_90;
      }
LABEL_92:
      if (objc_msgSend(v214, "count"))
      {
        v96 = objc_alloc_init(NSFetchRequest);
        -[NSFetchRequest setEntity:](v96, "setEntity:", objc_msgSend((id)objc_msgSend(v225, "destinationEntity"), "entityDescription"));
        -[NSFetchRequest setPredicate:](v96, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v214));
        v97 = [NSSQLFetchRequestContext alloc];
        v98 = *(_QWORD *)(a1 + 8);
        if (v98)
        {
          v99 = *(_QWORD *)(v98 + 32);
          v100 = *(_QWORD *)(v98 + 8);
        }
        else
        {
          v99 = 0;
          v100 = 0;
        }
        v101 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:](v97, "initWithRequest:context:sqlCore:", v96, v99, v100);
        -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)v101, 0);
        *(_DWORD *)(*(_QWORD *)(v101 + 136) + 72) = *(_DWORD *)(*(_QWORD *)(v101 + 136) + 72) & 0xFFFFFFE3 | 8;
        v102 = *(_QWORD *)(a1 + 8);
        if (v102)
          v103 = *(_QWORD *)(v102 + 8);
        else
          v103 = 0;
        -[NSSQLCore dispatchRequest:withRetries:](v103, (_QWORD *)v101, 0);
        v104 = (id)objc_msgSend((id)v101, "result");

        v242 = 0u;
        v243 = 0u;
        v240 = 0u;
        v241 = 0u;
        v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v240, v253, 16);
        if (v105)
        {
          v106 = *(_QWORD *)v241;
          do
          {
            for (m = 0; m != v105; ++m)
            {
              if (*(_QWORD *)v241 != v106)
                objc_enumerationMutation(v104);
              v108 = *(void **)(*((_QWORD *)&v240 + 1) + 8 * m);
              v109 = *(_QWORD *)(a1 + 8);
              v110 = objc_msgSend(v108, "objectID");
              if (v109)
                objc_msgSend(*(id *)(v109 + 136), "setObject:forKey:", v108, v110);
            }
            v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v240, v253, 16);
          }
          while (v105);
        }

        v111 = 0;
      }
      else
      {
        v111 = v214;
      }

      v238 = 0u;
      v239 = 0u;
      v236 = 0u;
      v237 = 0u;
      v116 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v236, v252, 16);
      if (v116)
      {
        v117 = *(_QWORD *)v237;
        do
        {
          for (n = 0; n != v116; ++n)
          {
            if (*(_QWORD *)v237 != v117)
              objc_enumerationMutation(v87);
            v119 = *(const void **)(*((_QWORD *)&v236 + 1) + 8 * n);
            v120 = (void *)objc_msgSend(v87, "objectForKey:", v119);
            v121 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(_QWORD *)(a1 + 8), v119);
            Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), v119);
            if (Value)
              v123 = 1;
            else
              v123 = v121 == 0;
            if (!v123)
            {
              Value = (void *)-[os_unfair_lock_s copy](v121, "copy");
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), v119, Value);

            }
            if (Value)
            {
              v124 = objc_msgSend(v120, "intValue");
              objc_msgSend(Value, "setForeignOrderKeySlot:orderKey:", v231, v124);
              objc_msgSend(v234, "addObject:", v119);
              objc_msgSend(v234, "addObject:", v120);
            }
          }
          v116 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v236, v252, 16);
        }
        while (v116);
      }
    }
    else
    {
      v87 = 0;
    }

    if (v234)
    {
      if (objc_msgSend(v234, "count"))
        v125 = (uint64_t)v234;
      else
        v125 = 0;
      if (objc_msgSend(v215, "count"))
        v126 = (uint64_t)v215;
      else
        v126 = 0;
      v127 = (const void *)objc_msgSend(v224, "objectID");
      -[NSSQLSavePlan _registerChangedFOKs:deletions:forSourceObject:andRelationship:](a1, v125, v126, v127, v223);
    }
    else
    {
      v234 = 0;
    }
    goto LABEL_215;
  }
  v232 = a4;
  v215 = (id)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v222);
  if ((*(_BYTE *)(a1 + 148) & 1) != 0)
    v226 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v226 = 0;
  v42 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v233);
  v43 = objc_msgSend(v222, "count");
  v44 = v217;
  v45 = objc_msgSend(v217, "count");
  v234 = v42;
  if (v43 == v45)
  {
    v46 = objc_msgSend(v44, "count");
    if (v46)
    {
      v47 = v46;
      v48 = objc_msgSend(a3, "count");
      if (+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]((uint64_t)_PFRoutines, v44, a3))
      {
        v49 = objc_msgSend(a3, "indexOfObject:", objc_msgSend(v44, "objectAtIndex:", 0));
        if (v49)
        {
          v50 = v49 + v47;
          v51 = v48 - (v49 + v47);
          v52 = a12;
          if (v51)
          {
            v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:range:copyItems:", a3, 0, v49, 0);
            MEMORY[0x1E0C80A78](v53);
            v205 = (char *)&v212 - v204;
            objc_msgSend(a3, "getObjects:range:", (char *)&v212 - v204, v50, v51);
            v86 = v232;
            objc_msgSend(v53, "addObjects:count:", v205, v51);
            goto LABEL_163;
          }
          v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:range:copyItems:", a3, 0, v49, 0);
LABEL_162:
          v86 = v232;
LABEL_163:
          objc_msgSend(v53, "addObjectsFromArray:", v234);
          v225 = 0;
          goto LABEL_164;
        }
        v115 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:range:copyItems:", a3, v47, v48 - v47, 0);
      }
      else
      {
        v115 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, a3, v215);
      }
    }
    else
    {
      v115 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", a3);
    }
    v53 = v115;
    v52 = a12;
    goto LABEL_162;
  }
  v85 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v44, v215);
  if (!+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]((uint64_t)_PFRoutines, v85, v42))
  {

    v112 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, a7);
    v216 = objc_msgSend(a3, "mutableCopy");
    v113 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v44, (void *)v216);
    v114 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v113, v112);

    if (v226)
      v225 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v215, v114);
    else
      v225 = 0;
    v128 = v217;
    v129 = objc_msgSend(v217, "count");
    v52 = a12;
    if (v129 == objc_msgSend(v114, "count"))
    {
      v130 = 0;
    }
    else
    {
      v131 = (void *)objc_msgSend(v128, "mutableCopy");
      v130 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v131, v114);

    }
    v132 = objc_msgSend(v128, "count");
    v133 = objc_msgSend(v114, "count");
    v214 = v114;
    if (v132 == v133)
    {
      v134 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v234, v128);
      v135 = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v134, a3);
    }
    else
    {
      v134 = v130;
      if (!+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]((uint64_t)_PFRoutines, v130, a3))
      {

        v136 = (void *)v216;
        v137 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, (void *)v216, v217);
        objc_msgSend(v137, "minusSet:", v215);
        v53 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v234, v114);
        v138 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v222);
        objc_msgSend(v136, "removeObjectsInArray:", v138);

        v213 = v137;
        if (objc_msgSend(v137, "count"))
        {
          v212 = a12;
          v139 = v136;
          v231 = (_NSFaultingMutableOrderedSet *)objc_msgSend(v136, "count");
          if (v231)
          {
            v140 = 0;
            v141 = 0;
            v142 = 0;
            v143 = 0;
            do
            {
              v144 = objc_msgSend(v139, "objectAtIndex:", v140);
              if ((objc_msgSend(v53, "containsObject:", v144) & 1) != 0)
              {
                if ((unint64_t)v142 | v141)
                {
                  v145 = objc_msgSend(v139, "objectsAtIndexes:", objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v142, v141));
                  v146 = objc_msgSend(v53, "indexOfObject:", v144);
                  objc_msgSend(v53, "insertObjects:atIndexes:", v145, objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v146, v141));
                  v143 = 0;
                }
                v142 = 0;
                v141 = 0;
              }
              else
              {
                v147 = (v143 & 1) == 0;
                if ((v143 & 1) == 0)
                  v142 = v140;
                v143 = 1;
                if (v147)
                  v141 = 1;
                else
                  ++v141;
              }
              v140 = (_NSFaultingMutableOrderedSet *)((char *)v140 + 1);
            }
            while (v231 != v140);
          }
          else
          {
            v142 = 0;
            v141 = 0;
          }
          if ((unint64_t)v142 | v141)
          {
            v206 = objc_msgSend(v139, "objectsAtIndexes:", objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v142, v141));
            v207 = objc_msgSend(v53, "count");
            objc_msgSend(v53, "insertObjects:atIndexes:", v206, objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v207, v141));
          }
          v52 = v212;
          v134 = v213;
        }
        else
        {
          v134 = v213;
        }
        goto LABEL_145;
      }
      v135 = +[_PFRoutines _replaceBaseline:inOrderedSet:withOrderedSet:]((uint64_t)_PFRoutines, v130, a3, v234);
    }
    v53 = v135;
LABEL_145:
    v86 = v232;

    goto LABEL_164;
  }
  v53 = +[_PFRoutines _replaceBaseline:inOrderedSet:withOrderedSet:]((uint64_t)_PFRoutines, v85, v42, a3);

  v225 = 0;
  v52 = a12;
  v86 = v232;
LABEL_164:
  v148 = objc_msgSend(v223, "name");
  v232 = (id)objc_msgSend(v221, "objectForKey:", v148);
  if (objc_msgSend(v232, "isToMany"))
  {
    if (v232 && (v149 = *((_QWORD *)v232 + 7)) != 0)
      v150 = *(void **)(v149 + 80);
    else
      v150 = 0;
    LODWORD(v216) = objc_msgSend(v150, "slot");
  }
  else
  {
    LODWORD(v216) = 0;
  }

  v151 = objc_msgSend(v53, "isNSArray");
  v152 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v153 = (uint64_t)v53;
  if ((v151 & 1) == 0)
    v153 = objc_msgSend(v53, "array", v53);
  v235 = (id)objc_msgSend(v152, "initWithArray:", v153);
  v231 = -[_NSFaultingMutableOrderedSet initWithOrderedSet:]([_NSFaultingMutableOrderedSet alloc], "initWithOrderedSet:", v53);

  if (-[_NSFaultingMutableOrderedSet count](v231, "count"))
  {
    v154 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v154 = malloc_default_zone();
    v155 = malloc_type_zone_calloc(v154, -[_NSFaultingMutableOrderedSet count](v231, "count"), 1uLL, 0x100004077774924uLL);
    *v227 = v155;
    v156 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v156 = malloc_default_zone();
    *v52 = malloc_type_zone_calloc(v156, -[_NSFaultingMutableOrderedSet count](v231, "count"), 8uLL, 0x100004000313F17uLL);
    -[_NSFaultingMutableOrderedSet _populateOrderKeysUsingSnapshot:orderKeys:newIndexes:reorderedIndexes:]((uint64_t)v231, a3, v86, (_QWORD **)v52, v227);
    -[_NSFaultingMutableOrderedSet _updateOrderKeysFromOrderOfObjectIDs:]((id *)v233, v231);
  }
  v233 = (char *)objc_msgSend(v235, "count");
  if (v233)
  {
    v157 = 0;
    v227 = (void **)v216;
    do
    {
      v158 = (void *)MEMORY[0x18D76B4E4]();
      v159 = (const void *)objc_msgSend(v235, "objectAtIndex:", v157);
      v160 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(_QWORD *)(a1 + 8), v159);
      if (!v160)
      {
        v161 = -[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](*(NSSQLObjectFaultRequestContext **)(a1 + 8), (uint64_t)v159);
        -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)&v161->super.super.isa, 0);
        v162 = *(_QWORD *)(a1 + 8);
        if (v162)
          v163 = *(_QWORD *)(v162 + 8);
        else
          v163 = 0;
        -[NSSQLCore dispatchRequest:withRetries:](v163, v161, 0);
        v160 = (os_unfair_lock_s *)-[NSSQLStoreRequestContext result](v161, "result");
        if (v160)
        {
          v164 = *(_QWORD *)(a1 + 8);
          if (v164)
            objc_msgSend(*(id *)(v164 + 136), "setObject:forKey:", v160, v159);
        }

        v165 = v160;
      }
      if (objc_msgSend(v232, "isToMany"))
      {
        v166 = -[_NSFaultingMutableOrderedSet _orderKeyForObject:]((uint64_t)v231, (uint64_t)v159);
        v167 = v166;
        v168 = v160
             ? *(uint32_t *)((char *)&v160[(_QWORD)v227]._os_unfair_lock_opaque
                           + _NSSQLRowInstanceSize
                           + (((unint64_t)v160[4]._os_unfair_lock_opaque >> 1) & 0x1FFF8))
             : 0;
        if (v168 != (_DWORD)v166)
        {
          v169 = (void *)objc_msgSend((id)objc_msgSend(v224, "managedObjectContext"), "objectRegisteredForID:", v159);
          if ((objc_msgSend(v169, "isDeleted") & 1) == 0)
          {
            if (objc_msgSend(v169, "isFault"))
            {
              v170 = -[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](*(NSSQLObjectFaultRequestContext **)(a1 + 8), objc_msgSend(v169, "objectID"));
              -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)&v170->super.super.isa, 0);
              v171 = *(_QWORD *)(a1 + 8);
              if (v171)
                v172 = *(_QWORD *)(v171 + 8);
              else
                v172 = 0;
              -[NSSQLCore dispatchRequest:withRetries:](v172, v170, 0);
              v160 = (os_unfair_lock_s *)-[NSSQLStoreRequestContext result](v170, "result");

              v173 = v160;
            }
            v174 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), v159);
            if (!v174 && v160)
            {
              v174 = (void *)-[os_unfair_lock_s copy](v160, "copy");
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), v159, v174);

            }
            if (v174)
            {
              objc_msgSend(v174, "setForeignOrderKeySlot:orderKey:", v216, v167);
              objc_msgSend(v226, "addObject:", v159);
              v175 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v167);
              objc_msgSend(v226, "addObject:", v175);
            }
          }
        }
      }
      objc_autoreleasePoolPop(v158);
      ++v157;
    }
    while (v233 != v157);
  }
  v176 = v226;
  if (v226)
  {
    if (objc_msgSend(v226, "count"))
      v177 = (uint64_t)v226;
    else
      v177 = 0;
    if (objc_msgSend(v225, "count"))
      v178 = (uint64_t)v225;
    else
      v178 = 0;
    v179 = (const void *)objc_msgSend(v224, "objectID");
    -[NSSQLSavePlan _registerChangedFOKs:deletions:forSourceObject:andRelationship:](a1, v177, v178, v179, v223);
    v176 = v226;
  }

LABEL_215:
  v26 = v228;
LABEL_216:
  if (!v220 || !v230)
    goto LABEL_252;
  v180 = objc_msgSend(v223, "name");
  v181 = (_QWORD *)objc_msgSend(v221, "objectForKey:", v180);
  v182 = objc_msgSend(v181, "isToMany");
  v183 = v182 ^ 1;
  if (!v181)
    v183 = 1;
  if ((v183 & 1) == 0 && (v182 = v181[7]) != 0 && *(_BYTE *)(v182 + 88))
  {
    v182 = objc_msgSend((id)objc_msgSend((id)v182, "foreignKey"), "slot");
    v184 = v182;
    LODWORD(v234) = 1;
  }
  else
  {
    LODWORD(v234) = 0;
    v184 = 0;
  }
  v231 = (_NSFaultingMutableOrderedSet *)&v212;
  MEMORY[0x1E0C80A78](v182);
  v187 = (char *)&v212 - v185;
  if (v186 > 0x200)
    v187 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v212 - v185, 8 * v186);
  v188 = objc_msgSend(v222, "getObjects:", v187);
  v189 = 0;
  v233 = a9;
  LODWORD(v232) = v184;
  do
  {
    v190 = (void *)MEMORY[0x18D76B4E4](v188);
    v191 = (const void *)objc_msgSend(*(id *)&v187[8 * v189], "objectID");
    v192 = v191;
    if ((v229 & 1) == 0)
      *(_QWORD *)&v228[8 * v189] = v191;
    if ((_DWORD)v234)
    {
      v193 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), v191);
      if (v193)
        goto LABEL_242;
      if (-[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(_QWORD *)(a1 + 8), v192))
      {
        v193 = 0;
        goto LABEL_242;
      }
      v194 = -[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](*(NSSQLObjectFaultRequestContext **)(a1 + 8), (uint64_t)v192);
      -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)&v194->super.super.isa, 0);
      v195 = *(_QWORD *)(a1 + 8);
      if (v195)
        v196 = *(_QWORD *)(v195 + 8);
      else
        v196 = 0;
      -[NSSQLCore dispatchRequest:withRetries:](v196, v194, 0);
      v197 = -[NSSQLStoreRequestContext result](v194, "result");
      if (v197)
      {
        v198 = *(_QWORD *)(a1 + 8);
        if (v198)
          objc_msgSend(*(id *)(v198 + 136), "setObject:forKey:", v197, v192);
      }

      v199 = v197;
      v184 = v232;
      if (v197)
      {
        v193 = (void *)objc_msgSend(v197, "copy");
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), v192, v193);

LABEL_242:
        v200 = (char *)-[NSSQLRow foreignKeyForSlot:]((uint64_t)v193, v184);
        if (v200 == v233)
          objc_msgSend(v193, "setForeignKeySlot:int64:", v184, 0);
      }
    }
    objc_autoreleasePoolPop(v190);
    ++v189;
  }
  while (v230 != v189);
  if ((v229 & 1) == 0)
  {
    v201 = objc_alloc(MEMORY[0x1E0C99E60]);
    v202 = (void *)objc_msgSend(v201, "initWithObjects:count:", v228, v230);
    objc_msgSend(v235, "minusSet:", v202);

  }
  if (v230 >= 0x201)
    NSZoneFree(0, v187);
  v26 = v228;
LABEL_252:
  if (v218 >= 0x201)
    NSZoneFree(0, v26);
  objc_msgSend(v219, "drain");
  return v235;
}

- (id)_correlationTableUpdateTrackerForRelationship:(uint64_t)a1
{
  const void *v4;
  id Value;

  v4 = (const void *)objc_msgSend(a2, "correlationTableName");
  Value = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), v4);
  if (!Value)
  {
    Value = -[NSSQLCorrelationTableUpdateTracker initForRelationship:]([NSSQLCorrelationTableUpdateTracker alloc], "initForRelationship:", a2);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v4, Value);

  }
  return Value;
}

- (uint64_t)newCorrelationTableUpdates
{
  void *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = *(void **)(a1 + 32);
  v2 = objc_msgSend(v1, "count");
  v3 = v2;
  if (v2 <= 1)
    v4 = 1;
  else
    v4 = v2;
  if (v2 >= 0x201)
    v5 = 1;
  else
    v5 = v4;
  v6 = (char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 > 0x200)
    v6 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
  objc_msgSend(v1, "getObjects:andKeys:count:", v6, 0, v3);
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v6, v3);
  if (v3 >= 0x201)
    NSZoneFree(0, v6);
  return v7;
}

- (uint64_t)newInsertedRows
{
  void *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = *(void **)(a1 + 24);
  v2 = objc_msgSend(v1, "count");
  v3 = v2;
  if (v2 <= 1)
    v4 = 1;
  else
    v4 = v2;
  if (v2 >= 0x201)
    v5 = 1;
  else
    v5 = v4;
  v6 = (char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 > 0x200)
    v6 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
  objc_msgSend(v1, "getObjects:andKeys:count:", v6, 0, v3);
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v6, v3);
  if (v3 >= 0x201)
    NSZoneFree(0, v6);
  return v7;
}

- (_QWORD)newObjectsForFastLockConflictDetection
{
  void *v1;

  if (result)
  {
    v1 = (void *)result[1];
    if (v1)
      v1 = (void *)objc_msgSend(v1, "persistentStoreRequest");
    return (id)objc_msgSend(v1, "lockedObjects");
  }
  return result;
}

- (void)dealloc
{
  __CFDictionary *updatedFOKRowsInCurrentSave;
  objc_super v4;

  CFRelease(self->_changeCache);
  self->_changeCache = 0;
  CFRelease(self->_toManyCache);
  self->_toManyCache = 0;
  CFRelease(self->_insertCache);
  self->_insertCache = 0;

  self->_toManyRelationshipChanges = 0;
  self->_rowsToDelete = 0;

  self->_externalDataReferencesToDelete = 0;
  self->_externalDataReferencesToSave = 0;

  self->_fileBackedFuturesToCopy = 0;
  self->_fileBackedFuturesToDelete = 0;

  self->_updatedByRequest = 0;
  self->_updatedByForeignKey = 0;

  self->_rowsToAddToRowCache = 0;
  self->_objectIDsToRemoveFromRowCache = 0;

  self->_usedIndexes = 0;
  updatedFOKRowsInCurrentSave = self->_updatedFOKRowsInCurrentSave;
  if (updatedFOKRowsInCurrentSave)
  {
    CFRelease(updatedFOKRowsInCurrentSave);
    self->_updatedFOKRowsInCurrentSave = 0;
    CFRelease(self->_deletedFOKRowsInCurrentSave);
    self->_deletedFOKRowsInCurrentSave = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSSQLSavePlan;
  -[NSSQLSavePlan dealloc](&v4, sel_dealloc);
}

- (void)_populateOrderKeysInOrderedSet:(uint64_t)a3 usingSourceObjectID:(void *)a4 inverseRelationship:(_QWORD *)a5 newIndexes:(void *)a6 reorderedIndexes:
{
  uint64_t v11;
  NSSQLRelationshipFaultRequestContext *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  if (!a2 || a6 || a5 || !*(_QWORD *)(a2 + 32))
  {
    if (a4)
      v11 = objc_msgSend(a4, "propertyDescription");
    else
      v11 = 0;
    v12 = [NSSQLRelationshipFaultRequestContext alloc];
    v13 = *(_QWORD *)(a1 + 8);
    if (v13)
    {
      v14 = *(_QWORD *)(v13 + 32);
      v15 = *(_QWORD *)(v13 + 8);
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    v16 = -[NSSQLRelationshipFaultRequestContext initWithObjectID:relationship:context:sqlCore:](v12, "initWithObjectID:relationship:context:sqlCore:", a3, v11, v14, v15);
    -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)v16, 0);
    v17 = *(_QWORD *)(a1 + 8);
    if (v17)
      v18 = *(_QWORD *)(v17 + 8);
    else
      v18 = 0;
    -[NSSQLCore dispatchRequest:withRetries:](v18, (_QWORD *)v16, 0);
    v19 = (id)objc_msgSend((id)v16, "result");
    if (v16)
    {
      v20 = *(void **)(v16 + 40);
      if (v20)
      {
        v24 = v20;
        v25 = objc_msgSend(v24, "code");
        v26 = objc_msgSend(v24, "description");
        v30[0] = objc_msgSend(v24, "domain");
        v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v24, "code"));
        v30[1] = *MEMORY[0x1E0CB3388];
        v31[0] = v27;
        v31[1] = v24;
        v28 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
        v29 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], v25, v26, v28);
        objc_exception_throw(v29);
      }
    }

    v21 = objc_msgSend(v19, "count") == 2;
    v22 = (void *)objc_msgSend(v19, "firstObject");
    if (v21)
      v23 = (void *)objc_msgSend(v19, "lastObject");
    else
      v23 = (void *)NSOrderedSet_EmptyOrderedSet;
    -[_NSFaultingMutableOrderedSet _populateOrderKeysUsingSnapshot:orderKeys:newIndexes:reorderedIndexes:](a2, v22, v23, a5, a6);

  }
}

- (id)newObjectsForUniquenessConflictDetectionGivenReportedFailures:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
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
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(a2, "count"))
  {
    v36 = 0uLL;
    v37 = 0uLL;
    v34 = 0uLL;
    v35 = 0uLL;
    v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v35;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v35 != v7)
            objc_enumerationMutation(a2);
          v9 = *(_QWORD *)(a1 + 8);
          if (v9 && (v10 = *(_QWORD *)(v9 + 32)) != 0)
            v11 = _PFRetainedObjectIDCore(v10, *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8), 0, 1);
          else
            v11 = 0;
          objc_msgSend(v4, "addObject:", v11);

          ++v8;
        }
        while (v6 != v8);
        v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        v6 = v12;
      }
      while (v12);
    }
  }
  else
  {
    v32 = 0uLL;
    v33 = 0uLL;
    v30 = 0uLL;
    v31 = 0uLL;
    v13 = *(void **)(a1 + 8);
    if (v13)
      v13 = (void *)objc_msgSend(v13, "persistentStoreRequest");
    v14 = (void *)objc_msgSend(v13, "updatedObjects");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v16);
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = *(void **)(a1 + 8);
    if (v19)
      v19 = (void *)objc_msgSend(v19, "persistentStoreRequest", (_QWORD)v26);
    v20 = (void *)objc_msgSend(v19, "insertedObjects", (_QWORD)v26);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v22);
    }
  }
  return v4;
}

- (uint64_t)_registerChangedFOKs:(uint64_t)a3 deletions:(const void *)a4 forSourceObject:(void *)a5 andRelationship:
{
  uint64_t v8;
  id v10;
  id v11;

  v8 = result;
  if (a2)
  {
    v10 = (id)objc_msgSend(*(id *)(result + 80), "objectForKey:", a4);
    if (!v10)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 80), a4, v10);

    }
    result = objc_msgSend(v10, "setValue:forKey:", a2, objc_msgSend(a5, "name"));
  }
  if (a3)
  {
    v11 = (id)objc_msgSend(*(id *)(v8 + 88), "objectForKey:", a4);
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 88), a4, v11);

    }
    return objc_msgSend(v11, "setValue:forKey:", a3, objc_msgSend(a5, "name"));
  }
  return result;
}

- (uint64_t)_addFileBackedFutureToDelete:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  id v9;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
    v5 = *(void **)(v4 + 8);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "fileBackedFuturesDirectory");
  if (a2)
    v7 = *(void **)(a2 + 8);
  else
    v7 = 0;
  result = objc_msgSend((id)objc_msgSend(v7, "path"), "hasPrefix:", v6);
  if ((_DWORD)result)
  {
    v9 = *(id *)(a1 + 120);
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(a1 + 120) = v9;
    }
    return objc_msgSend(v9, "addObject:", a2);
  }
  return result;
}

- (void)_prepareForDeletionOfDatabaseExternalPropertiesForObject:(uint64_t)a1
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  unint64_t *v8;
  unint64_t *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id *v36;
  const __CFDate *v37;
  CFDateRef v38;
  CFDateRef v39;
  id v40;

  v4 = (_QWORD *)objc_msgSend(a2, "entity");
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 8);
    if (v6)
      v7 = *(void **)(v6 + 8);
    else
      v7 = 0;
    v4 = (_QWORD *)_sqlCoreLookupSQLEntityForEntityDescription(v7, v5);
  }
  v8 = (unint64_t *)objc_msgSend(v4, "entityDescription");
  if (v8)
  {
    v9 = v8;
    v10 = (void *)v8[13];
    v11 = objc_msgSend(v8, "propertiesByName");
    v12 = v9[14];
    v13 = *(_QWORD *)(v12 + 48);
    v14 = *(_QWORD *)(v12 + 56);
    v15 = _kvcPropertysPrimitiveGetters(v9);
    if (v13 < v14 + v13)
    {
      v16 = v15;
      v17 = (id *)(v11 + 8 * v13 + 24);
      do
      {
        v18 = (void *)MEMORY[0x18D76B4E4]();
        v19 = *v17;
        if (objc_msgSend(*v17, "storesBinaryDataExternally")
          && (objc_msgSend(v19, "isFileBackedFuture") & 1) == 0)
        {
          v27 = objc_msgSend(v19, "name");
          v28 = objc_msgSend(v10, "fastIndexForKnownKey:", v27);
          if (v28 == 0x7FFFFFFFFFFFFFFFLL)
            v33 = objc_msgSend(a2, "primitiveValueForKey:", v27);
          else
            _PF_Handler_Primitive_GetProperty((id **)a2, v28, v27, *(_QWORD *)(v16 + 8 * v28), v29, v30, v31, v32);
          v34 = v33;
          if (v33)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v35 = *(id *)(a1 + 104);
              if (!v35)
              {
                v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                *(_QWORD *)(a1 + 104) = v35;
              }
              objc_msgSend(v35, "addObject:", v34);
            }
          }
          v36 = (id *)-[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](a1, (void *)objc_msgSend(a2, "objectID"));
          v37 = (const __CFDate *)v36;
          if (v36)
          {
            if (((_BYTE)v36[2] & 2) != 0)
            {
              v36 = 0;
            }
            else
            {
              v36 = (id *)objc_msgSend(*((id *)v36[5] + 2), "_storeInfo1");
              if (v36)
                v36 = (id *)objc_msgSend(v36[5], "objectForKey:", v27);
            }
          }
          v38 = -[NSSQLRow attributeValueForSlot:](v37, objc_msgSend(v36, "slot"));
          if (v38)
          {
            v39 = v38;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v40 = *(id *)(a1 + 104);
              if (!v40)
              {
                v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                *(_QWORD *)(a1 + 104) = v40;
              }
              objc_msgSend(v40, "addObject:", v39);
            }
          }
        }
        else if (objc_msgSend(v19, "isFileBackedFuture"))
        {
          v20 = objc_msgSend(v19, "name");
          v21 = objc_msgSend(v10, "fastIndexForKnownKey:", v20);
          if (v21 == 0x7FFFFFFFFFFFFFFFLL)
            v26 = objc_msgSend(a2, "primitiveValueForKey:", v20);
          else
            _PF_Handler_Primitive_GetProperty((id **)a2, v21, v20, *(_QWORD *)(v16 + 8 * v21), v22, v23, v24, v25);
          if (v26)
            -[NSSQLSavePlan _addFileBackedFutureToDelete:](a1, v26);
        }
        objc_autoreleasePoolPop(v18);
        ++v17;
        --v14;
      }
      while (v14);
    }
  }
  else
  {
    objc_msgSend(0, "propertiesByName");
    __break(1u);
  }
}

- (id)newObjectsForExhaustiveLockConflictDetection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!a1)
    return 0;
  v2 = *(void **)(a1 + 8);
  if (v2)
    v2 = (void *)objc_msgSend(v2, "persistentStoreRequest");
  v3 = (void *)objc_msgSend(v2, "updatedObjects");
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
      v4 = (void *)objc_msgSend(v4, "mutableCopy");
    else
      v4 = 0;
  }
  v5 = *(void **)(a1 + 8);
  if (v5)
    v5 = (void *)objc_msgSend(v5, "persistentStoreRequest");
  v6 = (void *)objc_msgSend(v5, "deletedObjects");
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "count"))
    {
      if (v4)
        objc_msgSend(v4, "unionSet:", v7);
      else
        v4 = (void *)objc_msgSend(v7, "mutableCopy");
    }
  }
  v8 = *(void **)(a1 + 8);
  if (v8)
    v8 = (void *)objc_msgSend(v8, "persistentStoreRequest");
  v9 = (void *)objc_msgSend(v8, "lockedObjects");
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(v9, "count"))
    {
      if (v4)
      {
        objc_msgSend(v4, "unionSet:", v10);
        return v4;
      }
      v4 = (void *)objc_msgSend(v10, "mutableCopy");
    }
  }
  if (v4)
    return v4;
  return objc_alloc_init(MEMORY[0x1E0C99E20]);
}

@end
