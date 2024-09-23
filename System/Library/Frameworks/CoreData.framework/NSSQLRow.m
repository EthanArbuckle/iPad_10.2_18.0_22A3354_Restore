@implementation NSSQLRow

+ (unsigned)newBatchRowAllocation:(id *)a3 count:(unsigned int)a4 forSQLEntity:(id)a5 withOwnedObjectIDs:(id *)a6 andTimestamp:(double)a7
{
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void **v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[2];

  v10 = *(_QWORD *)&a4;
  v29[1] = *MEMORY[0x1E0C80C00];
  v13 = objc_msgSend((id)-[NSSQLEntity virtualForeignKeyColumns]((uint64_t)a5), "count");
  v14 = objc_msgSend((id)objc_msgSend(a5, "foreignEntityKeyColumns"), "count");
  v15 = objc_msgSend((id)objc_msgSend(a5, "foreignOrderKeyColumns"), "count");
  v16 = (void *)_PFCDSnapshotClassForEntity(objc_msgSend(a5, "entityDescription"));
  MEMORY[0x1E0C80A78]();
  v19 = (void **)((char *)v29 - v18);
  if (v10 > 0x200)
    v19 = (void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)v29 - v18, 8 * v17);
  v20 = objc_msgSend(v16, "newBatchAllocation:count:withOwnedObjectIDs:", v19, v10, a6);
  if (v20 >= v10)
  {
    v22 = _PFAllocateObjects((objc_class *)a1, a3, v10, 2 * v14 + 8 * v13 + 4 * v15);
    v21 = v22;
    if (v22)
    {
      v23 = v22;
      v24 = (uint64_t *)v19;
      do
      {
        v26 = (uint64_t)*a3++;
        v25 = v26;
        v27 = *v24++;
        *(_QWORD *)(v25 + 40) = v27;
        snapshot_set_transient_default_values(v27);
        *(_BYTE *)(v27 + 24) |= 1u;
        *(double *)(v25 + 32) = a7;
        *(_DWORD *)(v25 + 16) = (16 * (v13 & 0x3FFF)) | ((_DWORD)v15 << 18) | *(_DWORD *)(v25 + 16) & 0xF;
        --v23;
      }
      while (v23);
    }
  }
  else
  {
    _PFDeallocateObjects(v19, v20);
    v21 = 0;
  }
  if (v10 >= 0x201)
    NSZoneFree(0, v19);
  return v21;
}

- (const)knownKeyValuesPointer
{
  if ((*(_BYTE *)&self->super._externalRefFlags & 1) != 0)
    -[NSSQLRow _validateToOnes]((uint64_t)self);
  return 0;
}

- (void)setForeignKeySlot:(unsigned int)a3 int64:(int64_t)a4
{
  _CDSnapshot *snapshot;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  int64_t *v13;
  CFNumberType v14;
  CFNumberRef v15;
  int64_t v16;
  int v17;

  *(_DWORD *)&self->super._externalRefFlags |= 1u;
  snapshot = self->_snapshot;
  v8 = (uint64_t)-[NSManagedObjectID entity](snapshot->_cd_objectID, "entity")[112];
  v9 = *(_QWORD *)(v8 + 104);
  v10 = a3 >= v9;
  v11 = a3 - v9;
  if (v10)
  {
    *(Class *)((char *)&self->super.super.isa + 8 * v11 + _NSSQLRowInstanceSize) = (Class)a4;
  }
  else
  {
    v12 = *(_QWORD *)(v8 + 96);
    if (a4)
    {
      if (HIDWORD(a4))
      {
        v16 = a4;
        v13 = &v16;
        v14 = kCFNumberLongLongType;
      }
      else
      {
        v17 = a4;
        v13 = (int64_t *)&v17;
        v14 = kCFNumberIntType;
      }
      v15 = CFNumberCreate(0, v14, v13);
    }
    else
    {
      v15 = 0;
    }
    snapshot_set_object((char *)snapshot, v12 + a3, (uint64_t)v15);
  }
}

- (uint64_t)foreignKeyForSlot:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  char *v8;
  unsigned int v9;
  Class Class;
  void *v11;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 16), "entity") + 112);
    v5 = *(_QWORD *)(v4 + 104);
    v6 = a2 >= v5;
    v7 = a2 - v5;
    if (v6)
    {
      return *(_QWORD *)(v3 + _NSSQLRowInstanceSize + 8 * v7);
    }
    else
    {
      v8 = *(char **)(v3 + 40);
      v9 = *(_DWORD *)(v4 + 96) + a2;
      Class = object_getClass(v8);
      v11 = *(void **)&v8[*((unsigned int *)object_getIndexedIvars(Class) + v9 + 19)];
      if (v11)
      {
        if (objc_msgSend(v11, "isNSNumber"))
          return objc_msgSend(v11, "longLongValue");
        else
          return objc_msgSend(v11, "_referenceData64");
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (void)setOptLock:(int64_t)a3
{
  self->_snapshot->_cd_version = a3;
}

- (uint64_t)_validateToOnes
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 16) & 2) == 0)
    {
      v2 = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 16), "_storeInfo1");
      v3 = (void *)objc_msgSend(v2, "foreignKeyColumns");
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (result)
      {
        v4 = result;
        v5 = *(_QWORD *)v12;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v12 != v5)
              objc_enumerationMutation(v3);
            v7 = (_BYTE *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "toOneRelationship");
            v8 = v7;
            if (!v7 || !v7[88])
            {
              v9 = objc_msgSend(v7, "slot");
              if (v2)
                v10 = v2[24];
              else
                LODWORD(v10) = 0;
              snapshot_set_object(*(char **)(v1 + 40), v9 + v10, objc_msgSend((id)v1, "newObjectIDForToOne:", v8));
            }
            ++v6;
          }
          while (v4 != v6);
          result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          v4 = result;
        }
        while (result);
      }
      *(_DWORD *)(v1 + 16) &= ~1u;
    }
  }
  return result;
}

- (id)newObjectIDForToOne:(id)a3
{
  NSManagedObjectID *cd_objectID;
  id result;
  id v7;
  NSPersistentStore *v8;
  void *v9;

  cd_objectID = self->_snapshot->_cd_objectID;
  result = (id)-[NSSQLRow foreignKeyForSlot:]((uint64_t)self, objc_msgSend(*((id *)a3 + 8), "slot"));
  if (result)
  {
    v7 = result;
    v8 = -[NSManagedObjectID persistentStore](cd_objectID, "persistentStore");
    v9 = (void *)*((_QWORD *)a3 + 9);
    if (v9)
      _sqlEntityForEntityID(*(_QWORD *)(-[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1") + 16), *(unsigned __int16 *)((char *)&self->super.super.isa+ 2 * objc_msgSend(v9, "slot")+ _NSSQLRowInstanceSize+ (((unint64_t)self->super._externalRefFlags >> 1) & 0x1FFF8)+ (((unint64_t)self->super._externalRefFlags >> 16) & 0xFFFC)));
    return (id)-[NSSQLCore newForeignKeyID:entity:](v8, (uint64_t)v7);
  }
  return result;
}

- (unint64_t)version
{
  if (self)
    return *(unsigned int *)(*(_QWORD *)(self + 40) + 12);
  return self;
}

+ (void)allocForSQLEntity:(uint64_t)a1
{
  objc_class *v3;
  int v4;

  v3 = (objc_class *)objc_opt_self();
  v4 = objc_msgSend((id)-[NSSQLEntity virtualForeignKeyColumns]((uint64_t)a2), "count");
  return _PFAllocateObject(v3, 2 * objc_msgSend((id)objc_msgSend(a2, "foreignEntityKeyColumns"), "count")+ 8 * v4+ 4 * objc_msgSend((id)objc_msgSend(a2, "foreignOrderKeyColumns"), "count"));
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)_snapshot_
{
  if ((*(_BYTE *)&self->super._externalRefFlags & 1) != 0)
    -[NSSQLRow _validateToOnes]((uint64_t)self);
  return self->_snapshot;
}

- (unsigned)_versionNumber
{
  return self->_snapshot->_cd_version;
}

- (id)valueForKey:(id)a3
{
  uint64_t v5;
  _DWORD *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  void *v11;
  void *v12;
  _CDSnapshot *snapshot;
  unsigned int v14;
  Class Class;
  objc_super v16;

  if (!self || (*(_BYTE *)&self->super._externalRefFlags & 2) != 0)
  {
    v6 = 0;
  }
  else
  {
    v5 = -[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1");
    v6 = (_DWORD *)v5;
    if (v5)
    {
      v7 = (unsigned __int8 *)objc_msgSend(*(id *)(v5 + 40), "objectForKey:", a3);
      if (v7)
      {
        v8 = v7;
        v9 = v7[24];
        if (v9 != 7)
        {
          if (v9 == 1)
            return -[NSSQLRow attributeValueForSlot:]((CFDateRef)self, objc_msgSend(v7, "slot"));
          if (objc_msgSend(v7, "propertyType") != 3)
            objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unexpected key found for: %@"), v8), 0));
        }
        if ((*(_BYTE *)&self->super._externalRefFlags & 1) != 0)
          -[NSSQLRow _validateToOnes]((uint64_t)self);
        snapshot = self->_snapshot;
        v14 = objc_msgSend(v8, "slot") + v6[48];
        goto LABEL_19;
      }
    }
  }
  if (a3 == CFSTR("objectID") || objc_msgSend(CFSTR("objectID"), "isEqualToString:", a3))
    return -[NSSQLRow objectID](self, "objectID");
  v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "entityDescription"), "propertiesByName"), "objectForKey:", a3);
  if (objc_msgSend(v11, "_propertyType") != 7)
  {
    v16.receiver = self;
    v16.super_class = (Class)NSSQLRow;
    return -[NSSQLRow valueForKey:](&v16, sel_valueForKey_, a3);
  }
  v12 = (void *)objc_msgSend((id)-[NSSQLEntity sqlAttributesForCompositeAttributeName:]((uint64_t)v6, objc_msgSend(v11, "name")), "firstObject");
  snapshot = self->_snapshot;
  v14 = objc_msgSend(v12, "slot");
LABEL_19:
  Class = object_getClass(snapshot);
  return *(Class *)((char *)&snapshot->super.isa + *((unsigned int *)object_getIndexedIvars(Class) + v14 + 19));
}

- (CFDateRef)attributeValueForSlot:(CFDateRef)result
{
  CFDateRef v3;
  unsigned __int8 *v4;
  uint64_t v5;
  Class Class;
  int v7;
  char *v8;
  Class v9;
  int v10;
  char *v11;
  Class v12;
  char *v13;
  Class v14;
  char *v15;
  Class v16;
  uint64_t *v17;
  CFNumberType v18;
  char *v19;
  Class v20;
  CFAbsoluteTime v21;
  CFDateRef v22;
  char *v23;
  Class v24;
  char *v25;
  Class v26;
  uint64_t v27;
  int v28;

  if (result)
  {
    v3 = result;
    v4 = (unsigned __int8 *)*((_QWORD *)result + 5);
    v5 = a2;
    if (((v4[((unint64_t)a2 >> 3) + 28] >> (a2 & 7)) & 1) != 0)
    {
      return 0;
    }
    else
    {
      Class = object_getClass(v4);
      v7 = *(char *)(*((_QWORD *)object_getIndexedIvars(Class) + 7) + a2);
      v28 = 0;
      switch(v7)
      {
        case 'c':
          v8 = (char *)*((_QWORD *)v3 + 5);
          v9 = object_getClass(v8);
          v10 = v8[*((unsigned int *)object_getIndexedIvars(v9) + v5 + 19)];
          goto LABEL_11;
        case 'd':
          v19 = (char *)*((_QWORD *)v3 + 5);
          v20 = object_getClass(v19);
          v21 = *(double *)&v19[*((unsigned int *)object_getIndexedIvars(v20) + v5 + 19)];
          if (objc_msgSend(*(id *)(*(_QWORD *)(objc_msgSend(*(id *)(*((_QWORD *)v3 + 5) + 16), "entity", *(_QWORD *)&v21) + 96)+ 24+ 8 * v5), "attributeType") == 900)
          {
            v22 = CFDateCreate(0, v21);
            goto LABEL_18;
          }
          v17 = &v27;
          v18 = kCFNumberDoubleType;
          goto LABEL_17;
        case 'e':
        case 'g':
        case 'h':
          goto LABEL_9;
        case 'f':
          v23 = (char *)*((_QWORD *)v3 + 5);
          v24 = object_getClass(v23);
          LODWORD(v27) = *(_DWORD *)&v23[*((unsigned int *)object_getIndexedIvars(v24) + v5 + 19)];
          v17 = &v27;
          v18 = kCFNumberFloatType;
          goto LABEL_17;
        case 'i':
          v15 = (char *)*((_QWORD *)v3 + 5);
          v16 = object_getClass(v15);
          v10 = *(_DWORD *)&v15[*((unsigned int *)object_getIndexedIvars(v16) + v5 + 19)];
          goto LABEL_11;
        default:
          if (v7 == 113)
          {
            v25 = (char *)*((_QWORD *)v3 + 5);
            v26 = object_getClass(v25);
            v27 = *(_QWORD *)&v25[*((unsigned int *)object_getIndexedIvars(v26) + v5 + 19)];
            v17 = &v27;
            v18 = kCFNumberLongLongType;
          }
          else
          {
            if (v7 != 115)
            {
LABEL_9:
              v13 = (char *)*((_QWORD *)v3 + 5);
              v14 = object_getClass(v13);
              return *(CFDateRef *)&v13[*((unsigned int *)object_getIndexedIvars(v14) + v5 + 19)];
            }
            v11 = (char *)*((_QWORD *)v3 + 5);
            v12 = object_getClass(v11);
            v10 = *(__int16 *)&v11[*((unsigned int *)object_getIndexedIvars(v12) + v5 + 19)];
LABEL_11:
            v28 = v10;
            v17 = (uint64_t *)&v28;
            v18 = kCFNumberIntType;
          }
LABEL_17:
          v22 = CFNumberCreate(0, v18, v17);
LABEL_18:
          result = v22;
          break;
      }
    }
  }
  return result;
}

- (CFBitVectorRef)newColumnMaskFrom:(uint64_t)a3 columnInclusionOptions:
{
  char v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const UInt8 *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  int v24;
  unsigned int v25;
  BOOL v26;
  unsigned int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  unsigned int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _WORD *v51;
  int v52;
  int v53;
  char v54;
  unsigned int v55;
  char v56;
  unsigned int v57;
  unsigned __int8 *v58;
  unsigned __int8 *v59;
  int v60;
  Class Class;
  int v62;
  Class v63;
  unsigned int *IndexedIvars;
  uint64_t v65;
  unsigned __int8 *v66;
  int v67;
  Class v68;
  int v69;
  Class v70;
  unsigned int *v71;
  uint64_t v72;
  char *v73;
  Class v74;
  Class v75;
  unsigned int *v76;
  uint64_t v77;
  char *v78;
  Class v79;
  void *v80;
  void *v81;
  void *v82;
  Class v83;
  unsigned int *v84;
  char *v85;
  uint64_t v86;
  double v87;
  Class v88;
  Class v89;
  unsigned int *v90;
  char *v91;
  uint64_t v92;
  float v93;
  Class v94;
  Class v95;
  unsigned int *v96;
  uint64_t v97;
  char *v98;
  Class v99;
  Class v100;
  unsigned int *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  Class v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  CFIndex v109;
  uint64_t *v110;
  uint64_t v111;
  unsigned __int8 *v112;
  id v113;
  CFBitVectorRef v114;
  id v115;
  unint64_t v116;
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
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = *((_BYTE *)result + 16);
    v114 = result;
    if ((v5 & 2) != 0)
      v6 = 0;
    else
      v6 = (void *)objc_msgSend(*(id *)(*((_QWORD *)result + 5) + 16), "_storeInfo1");
    v7 = (void *)objc_msgSend(v6, "foreignKeyColumns");
    v8 = (unsigned __int8 *)objc_msgSend(v6, "foreignEntityKeyColumns");
    v9 = (void *)objc_msgSend(v6, "foreignOrderKeyColumns");
    v115 = (id)objc_msgSend(v6, "attributeColumns");
    v10 = objc_msgSend(v115, "count");
    v113 = v9;
    v11 = objc_msgSend(v9, "count");
    v112 = v8;
    v12 = objc_msgSend(v8, "count");
    v13 = objc_msgSend(v7, "count");
    v110 = &v107;
    v109 = v11 + v10 + v12 + v13;
    MEMORY[0x1E0C80A78](v13);
    v15 = (const UInt8 *)&v107 - v14;
    bzero((char *)&v107 - v14, v16);
    v116 = a3;
    if ((a3 & 0xA) == 0)
    {
      v27 = objc_msgSend(v7, "count");
      goto LABEL_23;
    }
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v129, v136, 16);
    if (!v17)
    {
      v27 = 0;
      if ((a3 & 2) != 0)
        goto LABEL_24;
      goto LABEL_23;
    }
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v130;
LABEL_8:
    v21 = 0;
    v22 = v19;
    while (1)
    {
      if (*(_QWORD *)v130 != v20)
        objc_enumerationMutation(v7);
      v23 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v21);
      if ((a3 & 2) == 0)
        break;
      v25 = objc_msgSend(v23, "slot");
      a3 = -[NSSQLRow foreignKeyForSlot:]((uint64_t)v114, v25);
      v26 = a3 == -[NSSQLRow foreignKeyForSlot:](a2, v25);
      LOBYTE(a3) = v116;
      if (!v26)
        goto LABEL_16;
LABEL_17:
      if (v18 == ++v21)
      {
        v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v129, v136, 16);
        v19 = v22 + v21;
        if (!v18)
        {
          v27 = v22 + v21;
          if ((a3 & 2) != 0)
          {
LABEL_24:
            v127 = 0u;
            v128 = 0u;
            v125 = 0u;
            v126 = 0u;
            v29 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v126;
              do
              {
                v32 = 0;
                v33 = v27;
                v34 = (uint64_t)v114;
                do
                {
                  if (*(_QWORD *)v126 != v31)
                    objc_enumerationMutation(v112);
                  v35 = objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * v32), "slot");
                  if (a2)
                    v36 = *(unsigned __int16 *)(a2
                                              + _NSSQLRowInstanceSize
                                              + (((unint64_t)*(unsigned int *)(a2 + 16) >> 1) & 0x1FFF8)
                                              + (((unint64_t)*(unsigned int *)(a2 + 16) >> 16) & 0xFFFC)
                                              + 2 * v35);
                  else
                    v36 = 0;
                  if (v36 != *(unsigned __int16 *)(v34
                                                  + _NSSQLRowInstanceSize
                                                  + (((unint64_t)*(unsigned int *)(v34 + 16) >> 1) & 0x1FFF8)
                                                  + (((unint64_t)*(unsigned int *)(v34 + 16) >> 16) & 0xFFFC)
                                                  + 2 * v35))
                    v15[(v33 + v32) >> 3] |= 1 << (~(v33 + v32) & 7);
                  ++v32;
                }
                while (v30 != v32);
                v37 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
                v30 = v37;
                v27 = v33 + v32;
              }
              while (v37);
              v27 = v33 + v32;
            }
            v123 = 0u;
            v124 = 0u;
            v121 = 0u;
            v122 = 0u;
            v38 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v122;
              do
              {
                v41 = 0;
                v42 = v27;
                v43 = (uint64_t)v114;
                do
                {
                  if (*(_QWORD *)v122 != v40)
                    objc_enumerationMutation(v113);
                  v44 = objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * v41), "slot");
                  if (a2)
                    v45 = *(_DWORD *)(a2
                                    + _NSSQLRowInstanceSize
                                    + (((unint64_t)*(unsigned int *)(a2 + 16) >> 1) & 0x1FFF8)
                                    + 4 * v44);
                  else
                    v45 = 0;
                  if (*(_DWORD *)(v43
                                 + _NSSQLRowInstanceSize
                                 + (((unint64_t)*(unsigned int *)(v43 + 16) >> 1) & 0x1FFF8)
                                 + 4 * v44) != v45)
                    v15[(v42 + v41) >> 3] |= 1 << (~(v42 + v41) & 7);
                  ++v41;
                }
                while (v39 != v41);
                v46 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
                v39 = v46;
                v27 = v42 + v41;
              }
              while (v46);
              v27 = v42 + v41;
            }
LABEL_52:
            v119 = 0u;
            v120 = 0u;
            v117 = 0u;
            v118 = 0u;
            v47 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
            if (!v47)
              return CFBitVectorCreate(0, v15, v109);
            v48 = v47;
            v113 = (id)((v116 >> 4) & 1);
            v49 = *(_QWORD *)v118;
            while (2)
            {
              v50 = 0;
LABEL_55:
              if (*(_QWORD *)v118 != v49)
                objc_enumerationMutation(v115);
              v51 = *(_WORD **)(*((_QWORD *)&v117 + 1) + 8 * v50);
              if (!v51 || (v51[16] & 0x18) == 0)
              {
                v52 = objc_msgSend(v51, "isConstrained");
                if ((v116 & 8) != 0)
                  v53 = v52 ^ 1;
                else
                  v53 = 1;
                if ((v53 | v113) != 1)
                  goto LABEL_76;
                v54 = v52;
                if ((v116 & 0x10) == 0)
                  LOBYTE(v53) = 1;
                if (((v52 ^ 1) & (v116 >> 2) & 1) != 0 || (v53 & 1) == 0)
                {
                  v55 = objc_msgSend(v51, "slot");
                  if (a2)
                    v56 = 0;
                  else
                    v56 = v54;
                  if ((v56 & 1) != 0)
                  {
                    v15[(unint64_t)v27 >> 3] |= 1 << (~(_BYTE)v27 & 7);
                    goto LABEL_78;
                  }
                  v57 = v55;
                  if (a2)
                    v58 = *(unsigned __int8 **)(a2 + 40);
                  else
                    v58 = 0;
                  v59 = (unsigned __int8 *)*((_QWORD *)v114 + 5);
                  v60 = 1 << (v55 & 7);
                  if (((v60 & v59[((unint64_t)v55 >> 3) + 28]) != 0) != ((v60 & v58[((unint64_t)v55 >> 3) + 28]) != 0))
                  {
LABEL_76:
                    v15[(unint64_t)v27 >> 3] |= 1 << (~(_BYTE)v27 & 7);
                  }
                  else if ((v60 & v59[((unint64_t)v55 >> 3) + 28]) == 0)
                  {
                    v111 = v55;
                    v112 = v58;
                    Class = object_getClass(v59);
                    v62 = *(char *)(*((_QWORD *)object_getIndexedIvars(Class) + 7) + v57);
                    switch(v62)
                    {
                      case 'c':
                        v63 = object_getClass(v59);
                        IndexedIvars = (unsigned int *)object_getIndexedIvars(v63);
                        v65 = v111;
                        v66 = v112;
                        v67 = v59[IndexedIvars[v111 + 19]];
                        v68 = object_getClass(v112);
                        v69 = v66[*((unsigned int *)object_getIndexedIvars(v68) + v65 + 19)];
                        goto LABEL_95;
                      case 'd':
                        v83 = object_getClass(v59);
                        v84 = (unsigned int *)object_getIndexedIvars(v83);
                        v86 = v111;
                        v85 = (char *)v112;
                        v87 = *(double *)&v59[v84[v111 + 19]];
                        v88 = object_getClass(v112);
                        if (v87 != *(double *)&v85[*((unsigned int *)object_getIndexedIvars(v88) + v86 + 19)])
                          goto LABEL_76;
                        break;
                      case 'e':
                      case 'g':
                      case 'h':
                        goto LABEL_86;
                      case 'f':
                        v89 = object_getClass(v59);
                        v90 = (unsigned int *)object_getIndexedIvars(v89);
                        v92 = v111;
                        v91 = (char *)v112;
                        v93 = *(float *)&v59[v90[v111 + 19]];
                        v94 = object_getClass(v112);
                        if (v93 != *(float *)&v91[*((unsigned int *)object_getIndexedIvars(v94) + v92 + 19)])
                          goto LABEL_76;
                        break;
                      case 'i':
                        v95 = object_getClass(v59);
                        v96 = (unsigned int *)object_getIndexedIvars(v95);
                        v97 = v111;
                        v98 = (char *)v112;
                        v67 = *(_DWORD *)&v59[v96[v111 + 19]];
                        v99 = object_getClass(v112);
                        v69 = *(_DWORD *)&v98[*((unsigned int *)object_getIndexedIvars(v99) + v97 + 19)];
                        goto LABEL_95;
                      default:
                        if (v62 == 113)
                        {
                          v100 = object_getClass(v59);
                          v101 = (unsigned int *)object_getIndexedIvars(v100);
                          v102 = v111;
                          v103 = (char *)v112;
                          v104 = *(_QWORD *)&v59[v101[v111 + 19]];
                          v105 = object_getClass(v112);
                          if (v104 != *(_QWORD *)&v103[*((unsigned int *)object_getIndexedIvars(v105) + v102 + 19)])
                            goto LABEL_76;
                        }
                        else if (v62 == 115)
                        {
                          v70 = object_getClass(v59);
                          v71 = (unsigned int *)object_getIndexedIvars(v70);
                          v72 = v111;
                          v73 = (char *)v112;
                          v67 = *(unsigned __int16 *)&v59[v71[v111 + 19]];
                          v74 = object_getClass(v112);
                          v69 = *(unsigned __int16 *)&v73[*((unsigned int *)object_getIndexedIvars(v74) + v72 + 19)];
LABEL_95:
                          if (v67 != v69)
                            goto LABEL_76;
                        }
                        else
                        {
LABEL_86:
                          v75 = object_getClass(v59);
                          v76 = (unsigned int *)object_getIndexedIvars(v75);
                          v77 = v111;
                          v108 = *(void **)&v59[v76[v111 + 19]];
                          v78 = (char *)v112;
                          v79 = object_getClass(v112);
                          v80 = *(void **)&v78[*((unsigned int *)object_getIndexedIvars(v79) + v77 + 19)];
                          if (objc_msgSend(v51, "sqlType") == 16)
                          {
                            v81 = v108;
                            if (v108 == v80)
                              break;
                            if (!objc_msgSend(v51, "isFileBackedFuture"))
                              goto LABEL_76;
                            v82 = v81;
                          }
                          else
                          {
                            v82 = v108;
                            if (v108 == v80)
                              break;
                          }
                          if ((objc_msgSend(v82, "isEqual:", v80) & 1) == 0)
                            goto LABEL_76;
                        }
                        break;
                    }
                  }
                }
              }
              ++v27;
LABEL_78:
              if (v48 == ++v50)
              {
                v106 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
                v48 = v106;
                if (!v106)
                  return CFBitVectorCreate(0, v15, v109);
                continue;
              }
              goto LABEL_55;
            }
          }
LABEL_23:
          v28 = objc_msgSend(v112, "count");
          v27 += v28 + objc_msgSend(v113, "count");
          goto LABEL_52;
        }
        goto LABEL_8;
      }
    }
    v24 = objc_msgSend((id)objc_msgSend(v23, "toOneRelationship"), "isConstrained");
    if ((a3 & 8) == 0 || !v24)
      goto LABEL_17;
LABEL_16:
    v15[(v22 + v21) >> 3] |= 1 << (~(v22 + v21) & 7);
    goto LABEL_17;
  }
  return result;
}

- (void)setForeignOrderKeySlot:(unsigned int)a3 orderKey:(unsigned int)a4
{
  unint64_t externalRefFlags;

  externalRefFlags = self->super._externalRefFlags;
  self->super._externalRefFlags = (_externalRefFlags_st)(externalRefFlags | 1);
  *(_DWORD *)((char *)&self->super.super.isa + 4 * a3 + _NSSQLRowInstanceSize + ((externalRefFlags >> 1) & 0x1FFF8)) = a4;
}

- (id)copy
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!self || (*(_BYTE *)&self->super._externalRefFlags & 2) != 0)
    v3 = 0;
  else
    v3 = (void *)-[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1");
  v4 = objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, v3), "initWithSQLEntity:objectID:", v3, -[NSSQLRow objectID](self, "objectID"));
  v5 = *(void **)(v4 + 40);
  v6 = -[_CDSnapshot mutableCopy](self->_snapshot, "mutableCopy");
  *(_QWORD *)(v4 + 40) = v6;
  v6[24] |= 1u;
  if (v5 != *(void **)(v4 + 40))

  v7 = objc_msgSend((id)-[NSSQLEntity virtualForeignKeyColumns]((uint64_t)v3), "count");
  v8 = objc_msgSend((id)objc_msgSend(v3, "foreignEntityKeyColumns"), "count");
  v9 = objc_msgSend((id)objc_msgSend(v3, "foreignOrderKeyColumns"), "count");
  if (v8 + v7 + v9)
    memcpy((void *)(v4 + _NSSQLRowInstanceSize), (char *)self + _NSSQLRowInstanceSize, 2 * v8 + 8 * v7 + 4 * v9);
  *(_externalRefFlags_st *)(v4 + 16) = self->super._externalRefFlags;
  *(double *)(v4 + 32) = self->super._birth;
  -[NSPersistentCacheRow copyRelationshipCachesFrom:]((_QWORD *)v4, (uint64_t)self);
  return (id)v4;
}

- (NSSQLRow)initWithSQLEntity:(id)a3 ownedObjectID:(id)a4 andTimestamp:(double)a5
{
  id v7;
  _QWORD *v8;
  int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSQLRow;
  v7 = -[NSPersistentCacheRow initWithOptions:andTimestamp:](&v11, sel_initWithOptions_andTimestamp_, 0, a5);
  if (v7)
  {
    v8 = objc_alloc_init((Class)_PFCDSnapshotClassForEntity(objc_msgSend(a3, "entityDescription")));
    *((_QWORD *)v7 + 5) = v8;
    v8[2] = a4;
    snapshot_set_transient_default_values(*((_QWORD *)v7 + 5));
    *(_BYTE *)(*((_QWORD *)v7 + 5) + 24) |= 1u;
    *((_DWORD *)v7 + 4) &= ~1u;
    if (objc_msgSend(a4, "isTemporaryID"))
      v9 = 2;
    else
      v9 = 0;
    *((_DWORD *)v7 + 4) = *((_DWORD *)v7 + 4) & 0xFFFFFFFD | v9;
    *((_DWORD *)v7 + 4) = *((_DWORD *)v7 + 4) & 0xFFFC000F | (16
                                                            * (objc_msgSend((id)-[NSSQLEntity virtualForeignKeyColumns]((uint64_t)a3), "count") & 0x3FFF));
    *((_DWORD *)v7 + 4) = *((_DWORD *)v7 + 4) & 0x3FFFF | ((unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "foreignOrderKeyColumns"), "count") << 18);
  }
  return (NSSQLRow *)v7;
}

- (NSSQLRow)initWithSQLEntity:(id)a3 objectID:(id)a4
{
  return -[NSSQLRow initWithSQLEntity:ownedObjectID:andTimestamp:](self, "initWithSQLEntity:ownedObjectID:andTimestamp:", a3, a4, CFAbsoluteTimeGetCurrent());
}

- (BOOL)hasUniqueConstraintDiffFrom:(const __CFBitVector *)a1
{
  const __CFBitVector *v2;
  const __CFBitVector *v3;
  _BOOL8 v4;
  CFRange v6;

  if (!a1)
    return 0;
  v2 = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:](a1, a2, 24);
  if (!v2)
    return 0;
  v3 = v2;
  v6.length = CFBitVectorGetCount(v2);
  v6.location = 0;
  v4 = CFBitVectorContainsBit(v3, v6, 1u) != 0;
  CFRelease(v3);
  return v4;
}

- (id)objectID
{
  return self->_snapshot->_cd_objectID;
}

+ (void)initialize
{
  objc_opt_self();
  _NSSQLRowInstanceSize = (class_getInstanceSize((Class)a1) + 7) & 0xFFFFFFFFFFFFFFF8;
}

- (void)setForeignEntityKeySlot:(unsigned int)a3 entityKey:(unsigned int)a4
{
  unint64_t externalRefFlags;

  externalRefFlags = self->super._externalRefFlags;
  self->super._externalRefFlags = (_externalRefFlags_st)(externalRefFlags | 1);
  *(_WORD *)((char *)&self->super.super.isa
           + 2 * a3
           + _NSSQLRowInstanceSize
           + ((externalRefFlags >> 1) & 0x1FFF8)
           + ((externalRefFlags >> 16) & 0xFFFC)) = a4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t cd_version;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v43;
  void *v44;
  objc_super v45;

  if (!self || (*(_BYTE *)&self->super._externalRefFlags & 2) != 0)
    v3 = 0;
  else
    v3 = (void *)-[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1");
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v45.receiver = self;
  v45.super_class = (Class)NSSQLRow;
  v5 = -[NSSQLRow description](&v45, sel_description);
  v6 = objc_msgSend(v3, "name");
  v44 = v3;
  if (self)
  {
    v7 = -[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1");
    if (v7)
      v8 = *(unsigned int *)(v7 + 184);
    else
      v8 = 0;
    v9 = -[NSManagedObjectID _referenceData64](self->_snapshot->_cd_objectID, "_referenceData64");
    cd_version = self->_snapshot->_cd_version;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    cd_version = 0;
  }
  v11 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@{%@ %d-%qd-%qi"), v5, v6, v8, v9, cd_version);
  v12 = (void *)objc_msgSend(v44, "attributeColumns");
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = v13;
    for (i = 0; i != v14; ++i)
    {
      v16 = (void *)objc_msgSend(v12, "objectAtIndex:", i);
      v17 = objc_msgSend(v16, "name");
      v18 = (void *)objc_msgSend(v16, "propertyDescription");
      if (v18 && objc_msgSend(v18, "superCompositeAttribute"))
        v17 = objc_msgSend((id)objc_msgSend(v16, "propertyDescription"), "_qualifiedName");
      v19 = -[_CDSnapshot valueForKeyPath:](self->_snapshot, "valueForKeyPath:", v17);
      if (v19)
      {
        v20 = (void *)v19;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v11, "appendFormat:", CFSTR(" %@=<NSFileBackedFuture fileSize=%lu>"), v17, objc_msgSend(v20, "fileSize"));
          else
            objc_msgSend(v11, "appendFormat:", CFSTR(" %@=<NSData len=%lu>"), v17, objc_msgSend(v20, "length"));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v11, "appendFormat:", CFSTR(" %@=\"%@\"), v17, v20);
          else
            objc_msgSend(v11, "appendFormat:", CFSTR(" %@=%@"), v17, objc_msgSend(v20, "description"));
        }
      }
      else
      {
        objc_msgSend(v11, "appendFormat:", CFSTR(" %@=NULL"), v17, v43);
      }
    }
  }
  v21 = (void *)objc_msgSend(v44, "foreignKeyColumns");
  v22 = objc_msgSend(v21, "count");
  if (v22)
  {
    v23 = v22;
    for (j = 0; j != v23; ++j)
    {
      v25 = (void *)objc_msgSend(v21, "objectAtIndex:", j);
      objc_msgSend(v11, "appendFormat:", CFSTR(" %@=%qd"), objc_msgSend(v25, "name"), -[NSSQLRow foreignKeyForSlot:]((uint64_t)self, objc_msgSend(v25, "slot")));
    }
  }
  v26 = (void *)objc_msgSend(v44, "foreignEntityKeyColumns");
  v27 = objc_msgSend(v26, "count");
  if (v27)
  {
    v28 = v27;
    for (k = 0; k != v28; ++k)
    {
      v30 = (void *)objc_msgSend(v26, "objectAtIndex:", k);
      v31 = objc_msgSend(v30, "name");
      v32 = objc_msgSend(v30, "slot");
      if (self)
        v33 = *(unsigned __int16 *)((char *)&self->super.super.isa
                                  + 2 * v32
                                  + _NSSQLRowInstanceSize
                                  + (((unint64_t)self->super._externalRefFlags >> 1) & 0x1FFF8)
                                  + (((unint64_t)self->super._externalRefFlags >> 16) & 0xFFFC));
      else
        v33 = 0;
      objc_msgSend(v11, "appendFormat:", CFSTR(" %@=%u"), v31, v33);
    }
  }
  v34 = (void *)objc_msgSend(v44, "foreignOrderKeyColumns");
  v35 = objc_msgSend(v34, "count");
  if (v35)
  {
    v36 = v35;
    for (m = 0; m != v36; ++m)
    {
      v38 = (void *)objc_msgSend(v34, "objectAtIndex:", m);
      v39 = objc_msgSend(v38, "name");
      v40 = objc_msgSend(v38, "slot");
      if (self)
        v41 = *(unsigned int *)((char *)&self->super.super.isa
                              + 4 * v40
                              + _NSSQLRowInstanceSize
                              + (((unint64_t)self->super._externalRefFlags >> 1) & 0x1FFF8));
      else
        v41 = 0;
      objc_msgSend(v11, "appendFormat:", CFSTR(" %@=%u"), v39, v41);
    }
  }
  objc_msgSend(v11, "appendFormat:", CFSTR(" and to-manys=%p}"), self->super._toManyMap);
  return v11;
}

- (void)setObjectID:(id)a3
{
  int v5;

  snapshot_set_objectID((uint64_t)self->_snapshot, a3);
  if (objc_msgSend(a3, "isTemporaryID"))
    v5 = 2;
  else
    v5 = 0;
  self->super._externalRefFlags = (_externalRefFlags_st)(*(_DWORD *)&self->super._externalRefFlags & 0xFFFFFFFD | v5);
}

@end
