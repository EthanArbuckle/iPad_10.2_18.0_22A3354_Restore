@implementation _CDSnapshot

- (void)release
{
  int *p_cd_rc;
  int v3;
  unsigned int v4;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 - 2, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    if ((v3 & 0x80000000) == 0)
    {
      while (1)
      {
        v4 = __ldaxr((unsigned int *)p_cd_rc);
        if (v4 != -2)
          break;
        if (!__stlxr(1u, (unsigned int *)p_cd_rc))
        {
          -[_CDSnapshot dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

- (void)dealloc
{
  Class Class;
  unsigned int *IndexedIvars;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int *v7;
  int v8;

  Class = object_getClass(self);
  IndexedIvars = (unsigned int *)object_getIndexedIvars(Class);
  v5 = IndexedIvars[16];
  if ((_DWORD)v5)
  {
    v6 = (unsigned __int8 *)*((_QWORD *)IndexedIvars + 7);
    v7 = IndexedIvars + 19;
    do
    {
      v8 = *v6++;
      if (v8 == 64)

      ++v7;
      --v5;
    }
    while (v5);
  }

  _PFDeallocateObject(self);
}

+ (Class)classForEntity:(id)a3
{
  const char *v5;
  const char *v6;
  const char *Name;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  Class v16;
  void *v17;
  Class result;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  _QWORD *v23;
  objc_class *v24;
  Class v25;
  const UInt8 *IndexedIvars;
  const __CFAllocator *v27;
  CFDataRef v28;
  int v29;
  int v30;
  Class ClassPair;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  size_t v47;
  uint8_t v48;
  const char *v49;
  uint64_t v50;
  _DWORD *v51;
  id *v52;
  unint64_t v53;
  objc_ivar *InstanceVariable;
  objc_ivar *v55;
  int Offset;
  void *v57;
  void *v58;
  const char *v59;
  void *v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  size_t size;
  objc_class *v65;
  _QWORD *v66;
  uint64_t extraBytes;
  const char *v68;
  unint64_t v69;
  int v70;
  Class Class;
  uint64_t v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  char types[16];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  char v118[128];
  char __str[512];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v5 = (const char *)objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
  if (!v5 || (v6 = v5, !*v5))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Entity name must not be nil."), 0));
  v65 = (objc_class *)a1;
  Name = class_getName((Class)a1);
  snprintf(__str, 0x200uLL, "%s_%s_", Name, v6);
  v66 = a3;
  v8 = *(_QWORD *)(*((_QWORD *)a3 + 14) + 8);
  v72 = *((_QWORD *)a3 + 12) + 24;
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v10 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v10, v11, v12, 0);
  objc_msgSend(v15, "addObject:", v13);
  obj = v15;
  objc_msgSend(v15, "addObject:", v14);
  if (!v8)
  {
LABEL_22:
    v60 = v9;
    v68 = v6;
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_85);
    extraBytes = 4 * v8 + 80;
    if (v8 <= 1)
      v21 = 1;
    else
      v21 = v8;
    size = v21;
    if (v8)
      v22 = ((v8 - 1) >> 3) + 1;
    else
      v22 = 1;
    v63 = v22;
    v62 = v22 - 1;
    v61 = 4 * (v22 - 1);
    v69 = v8;
    v70 = 2;
    v24 = v65;
    v23 = v66;
    while (1)
    {
      Class = objc_getClass(__str);
      v25 = Class;
      if (!Class)
        break;
LABEL_30:
      IndexedIvars = (const UInt8 *)object_getIndexedIvars(v25);
      if (!Class)
        goto LABEL_107;
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      *(_OWORD *)types = 0u;
      v86 = 0u;
      v27 = _PFStackAllocatorCreate((unint64_t *)types, 1024);
      v28 = CFDataCreate(v27, IndexedIvars + 24, 32);
      v29 = objc_msgSend((id)objc_msgSend(v23, "versionHash"), "isEqual:", v28);
      v30 = v29;
      if (*((_QWORD *)&v86 + 1))
      {
        if (v28)
          CFRelease(v28);
        if (!v30)
          goto LABEL_109;
      }
      else
      {
        *(_QWORD *)&types[8] = *(_QWORD *)types;
        if (!v29)
          goto LABEL_109;
      }
      if (v69 == *((_DWORD *)IndexedIvars + 16)
        && (!*((_QWORD *)IndexedIvars + 1)
         || objc_msgSend((id)objc_msgSend(v23, "name"), "isEqual:", *((_QWORD *)IndexedIvars + 1)))
        && (!*((_QWORD *)IndexedIvars + 2)
         || (objc_msgSend((id)objc_msgSend(v23, "managedObjectClassName"), "isEqual:", *((_QWORD *)IndexedIvars + 2)) & 1) != 0))
      {
LABEL_107:
        if (!*((_QWORD *)IndexedIvars + 1))
        {
          *(_DWORD *)IndexedIvars = 0;
          *((_DWORD *)IndexedIvars + 1) = v23[20];
          v57 = (void *)objc_msgSend((id)objc_msgSend(v23, "name"), "mutableCopy");
          *((_QWORD *)IndexedIvars + 1) = objc_msgSend(v57, "copy");

          v58 = (void *)objc_msgSend((id)objc_msgSend(v23, "managedObjectClassName"), "mutableCopy");
          *((_QWORD *)IndexedIvars + 2) = objc_msgSend(v58, "copy");

        }
        goto LABEL_110;
      }
LABEL_109:
      v59 = class_getName(v24);
      __snprintf_chk(__str, 0x200uLL, 0, 0x200uLL, "%s_%s_%x", v59, v68, v70);
      v25 = 0;
      ++v70;
LABEL_110:
      if (v25)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_85);
        objc_msgSend(v60, "drain");
        return v25;
      }
    }
    ClassPair = objc_allocateClassPair(v24, __str, extraBytes);
    v25 = ClassPair;
    if (!ClassPair)
      goto LABEL_109;
    v32 = (char *)object_getIndexedIvars(ClassPair);
    *((_QWORD *)v32 + 7) = malloc_type_malloc(size, 0x100004077774924uLL);
    *((_DWORD *)v32 + 16) = v69;
    if (v63 >= 2)
    {
      __snprintf_chk(__str, 0x200uLL, 0, 0x200uLL, "_cd_nullFlags2_");
      __snprintf_chk(types, 0xAuLL, 0, 0xAuLL, "[%dC]", v62);
      if (!class_addIvar(v25, __str, v61, 0, types))
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("class_addIvar failed"), 0));
    }
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v118, 16);
    if (!v33)
    {
LABEL_97:
      objc_registerClassPair(v25);
      v24 = v65;
      v23 = v66;
      CFArrayAppendValue((CFMutableArrayRef)qword_1ECD8DB08, v25);
      if (v69)
      {
        v51 = v32 + 76;
        v52 = (id *)v72;
        v53 = v69;
        do
        {
          InstanceVariable = class_getInstanceVariable(v25, (const char *)objc_msgSend((id)objc_msgSend(*v52, "name"), "UTF8String"));
          *v51++ = ivar_getOffset(InstanceVariable);
          ++v52;
          --v53;
        }
        while (v53);
      }
      v55 = class_getInstanceVariable(v25, "_cd_nullFlags_");
      Offset = ivar_getOffset(v55);
      *((_DWORD *)v32 + 17) = class_getInstanceSize(v25) - Offset;
      objc_msgSend((id)objc_msgSend(v66, "versionHash"), "getBytes:length:", v32 + 24, 32);
      goto LABEL_30;
    }
    v74 = *(_QWORD *)v82;
LABEL_41:
    v34 = 0;
    v75 = v33;
    while (1)
    {
      if (*(_QWORD *)v82 != v74)
        objc_enumerationMutation(obj);
      v35 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v34);
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, v117, 16);
      v76 = v34;
      if (v36)
        break;
LABEL_95:
      v34 = v76 + 1;
      if (v76 + 1 == v75)
      {
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v118, 16);
        if (!v33)
          goto LABEL_97;
        goto LABEL_41;
      }
    }
    v37 = *(_QWORD *)v78;
LABEL_46:
    v38 = 0;
    while (1)
    {
      if (*(_QWORD *)v78 != v37)
        objc_enumerationMutation(v35);
      v39 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v38);
      v40 = (const char *)objc_msgSend((id)objc_msgSend(v39, "name"), "UTF8String");
      v41 = objc_msgSend(v39, "_entitysReferenceID");
      if (objc_msgSend(v39, "_propertyType") != 2 && objc_msgSend(v39, "_propertyType") != 6)
      {
        v46 = objc_msgSend(v39, "_propertyType");
        v44 = 8 * (v46 == 7);
        if (v46 == 7)
          v45 = "@";
        else
          v45 = 0;
        v43 = 3;
        goto LABEL_81;
      }
      v42 = objc_msgSend(v39, "attributeType");
      v43 = 3;
      if (v42 <= 499)
      {
        if (v42 == 300)
          v44 = 8;
        else
          v44 = 0;
        v45 = "q";
        if (v42 != 300)
          v45 = 0;
        if (v42 == 200)
        {
          v44 = 4;
          v43 = 2;
        }
        else
        {
          v43 = 3;
        }
        if (v42 == 200)
          v45 = "i";
        if (v42 == 100)
        {
          v44 = 2;
          v43 = 1;
          v45 = "s";
        }
        goto LABEL_81;
      }
      if (v42 > 799)
      {
        if (v42 == 800)
        {
          v43 = 0;
          v44 = 1;
          v45 = "c";
          goto LABEL_81;
        }
        if (v42 != 900)
        {
          v44 = 0;
          v45 = 0;
          goto LABEL_81;
        }
      }
      else if (v42 != 500)
      {
        v44 = 4;
        if (v42 == 600)
        {
          v43 = 2;
        }
        else
        {
          v44 = 0;
          v43 = 3;
        }
        v45 = "f";
        if (v42 != 600)
          v45 = 0;
        goto LABEL_81;
      }
      v44 = 8;
      v45 = "d";
LABEL_81:
      if (v45)
        v47 = v44;
      else
        v47 = 8;
      if (v45)
        v48 = v43;
      else
        v48 = 3;
      if (v45)
        v49 = v45;
      else
        v49 = "@";
      *(_BYTE *)(*((_QWORD *)v32 + 7) + v41) = *v49;
      if (!class_addIvar(v25, v40, v47, v48, v49))
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("class_addIvar failed"), 0));
      if (v36 == ++v38)
      {
        v50 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, v117, 16);
        v36 = v50;
        if (!v50)
          goto LABEL_95;
        goto LABEL_46;
      }
    }
  }
  v16 = 0;
  while (1)
  {
    v17 = *(void **)(v72 + 8 * (_QWORD)v16);
    result = (Class)objc_msgSend(v17, "_entitysReferenceID");
    if (v16 != result)
      break;
    if (objc_msgSend(v17, "_propertyType") == 2 || objc_msgSend(v17, "_propertyType") == 6)
    {
      v19 = objc_msgSend(v17, "attributeType");
      if (v19 <= 499)
      {
        v20 = (void *)v11;
        if (v19 == 100)
          goto LABEL_21;
        v20 = (void *)v12;
        if (v19 == 200)
          goto LABEL_21;
        v20 = (void *)v13;
        if (v19 == 300)
          goto LABEL_21;
      }
      else if (v19 > 799)
      {
        v20 = (void *)v10;
        if (v19 == 800)
          goto LABEL_21;
        v20 = (void *)v13;
        if (v19 == 900)
          goto LABEL_21;
      }
      else
      {
        v20 = (void *)v13;
        if (v19 == 500)
          goto LABEL_21;
        v20 = (void *)v12;
        if (v19 == 600)
          goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(v17, "_propertyType");
    }
    v20 = (void *)v14;
LABEL_21:
    objc_msgSend(v20, "addObject:", v17);
    v16 = (Class)((char *)v16 + 1);
    if ((Class)v8 == v16)
      goto LABEL_22;
  }
  __break(1u);
  return result;
}

- (_CDSnapshot)retain
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 + 2, (unsigned int *)p_cd_rc));
  if (v3 <= -3)
    __break(1u);
  return self;
}

- (id)mutableCopy
{
  id v3;
  _DWORD *v4;
  Class Class;
  unsigned int *IndexedIvars;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned int *v9;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = objc_alloc((Class)objc_opt_class());
  v4 = -[_CDSnapshot initWithObjectID:](v3, self->_cd_objectID);
  v4[3] = self->_cd_version;
  Class = object_getClass(self);
  IndexedIvars = (unsigned int *)object_getIndexedIvars(Class);
  memcpy(v4 + 7, &self->_cd_nullFlags_, IndexedIvars[17]);
  v7 = IndexedIvars[16];
  if ((_DWORD)v7)
  {
    v8 = (unsigned __int8 *)*((_QWORD *)IndexedIvars + 7);
    v9 = IndexedIvars + 19;
    do
    {
      v10 = *v8++;
      if (v10 == 64)
      {
        v11 = *v9;
        v12 = *(Class *)((char *)&self->super.isa + v11);
        v13 = v12;
        *(_QWORD *)((char *)v4 + v11) = v12;
      }
      ++v9;
      --v7;
    }
    while (v7);
  }
  return v4;
}

+ (_CDSnapshot)alloc
{
  return (_CDSnapshot *)_PFAllocateObject((Class)a1, 0);
}

- (_QWORD)initWithObjectID:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)_CDSnapshot;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[2] = a2;
  return v3;
}

+ (unsigned)newBatchAllocation:(id *)a3 count:(unsigned int)a4 withOwnedObjectIDs:(id *)a5
{
  id *v6;
  unsigned int result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  result = _PFAllocateObjects((objc_class *)a1, a3, a4, 0);
  if (result)
  {
    v8 = result;
    do
    {
      v10 = (uint64_t)*v6++;
      v9 = v10;
      v11 = (uint64_t)*a5++;
      *(_QWORD *)(v9 + 16) = v11;
      --v8;
    }
    while (v8);
  }
  return result;
}

+ (void)_entityDeallocated
{
  id *IndexedIvars;
  id *v3;

  IndexedIvars = (id *)object_getIndexedIvars(a1);
  if (IndexedIvars)
  {
    v3 = IndexedIvars;
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_85);

    v3[1] = 0;
    v3[2] = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_85);
  }
}

+ (void)initialize
{
  objc_super v3;

  if (objc_getClass("_CDSnapshot") == a1)
  {
    objc_opt_self();
    object_getIndexedIvars(a1);
    qword_1ECD8DB08 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  }
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____CDSnapshot;
  objc_msgSendSuper2(&v3, sel_initialize);
}

+ (void)_invalidateStaticCaches
{
  CFMutableArrayRef Mutable;
  CFIndex i;
  uint64_t v4;
  uint64_t v5;
  uint64_t j;
  uint64_t v7;
  uint64_t v8;
  uint64_t k;
  void *v10;
  void **IndexedIvars;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_85);
  if (qword_1ECD8DB08)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    for (i = 0; i < CFArrayGetCount((CFArrayRef)qword_1ECD8DB08); ++i)
      -[__CFArray addObject:](Mutable, "addObject:", CFArrayGetValueAtIndex((CFArrayRef)qword_1ECD8DB08, i));
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_1ECD8DB08);
  }
  else
  {
    Mutable = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_85);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = -[__CFArray countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v4; ++j)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(Mutable);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "_entityDeallocated");
      }
      v4 = -[__CFArray countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_85);
  if (Mutable)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = -[__CFArray countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (k = 0; k != v7; ++k)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(Mutable);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * k);
          IndexedIvars = (void **)object_getIndexedIvars(v10);
          if (IndexedIvars)
            free(IndexedIvars[7]);
          objc_disposeClassPair((Class)v10);
        }
        v7 = -[__CFArray countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      }
      while (v7);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_85);

}

+ (_CDSnapshot)allocWithZone:(_NSZone *)a3
{
  return (_CDSnapshot *)_PFAllocateObject((Class)a1, 0);
}

- (id)copy
{
  id result;

  if ((*(_BYTE *)&self->_cd_flags & 1) != 0)
    return self;
  result = -[_CDSnapshot mutableCopy](self, "mutableCopy");
  *(_BYTE *)&self->_cd_flags |= 1u;
  return result;
}

- (unint64_t)hash
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  v2 = (2 * ((unint64_t)self >> 4)) & 0xAAAAAAAA | (((unint64_t)self >> 4) >> 1) & 0x55555555;
  v3 = (4 * v2) & 0xCCCCCCCC | (v2 >> 2) & 0x33333333;
  v4 = (16 * v3) & 0xF0F0F0F0 | (v3 >> 4) & 0xF0F0F0F;
  return (v4 << 8) & 0xFF0000 | (v4 << 24) | (v4 >> 8) & 0xFF00 | HIBYTE(v4);
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_cd_rc + 2) >> 1;
}

- (BOOL)_tryRetain
{
  int *p_cd_rc;
  uint64_t v3;
  BOOL v4;
  BOOL result;
  unsigned int v6;

  p_cd_rc = &self->_cd_rc;
  while (1)
  {
    v3 = *p_cd_rc;
    v4 = (v3 & 1) != 0 || v3 == 4294967294;
    result = !v4;
    if (v4)
      break;
    if ((int)v3 <= -3)
    {
      __break(1u);
      return result;
    }
    while (1)
    {
      v6 = __ldaxr((unsigned int *)p_cd_rc);
      if (v6 != (_DWORD)v3)
        break;
      if (!__stlxr(v3 + 2, (unsigned int *)p_cd_rc))
        return result;
    }
    __clrex();
  }
  return result;
}

- (BOOL)_isDeallocating
{
  int cd_rc;

  cd_rc = self->_cd_rc;
  if (cd_rc == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (cd_rc <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = cd_rc & 1;
  }
  return (char)self;
}

- (id)description
{
  void *v3;
  id v4;
  NSString *v5;
  NSManagedObjectID *cd_objectID;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  __CFString *v27;
  uint64_t v29;
  NSManagedObjectID *v30;
  NSString *v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSArray *v35;
  void *v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v37.receiver = self;
  v37.super_class = (Class)_CDSnapshot;
  v4 = -[_CDSnapshot description](&v37, sel_description);
  if (!self)
  {
    v5 = (NSString *)objc_msgSend(0, "name");
    cd_objectID = 0;
    v10 = 0;
    return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (entity: %@; id: %@ ; data: %@)"),
                 v4,
                 v5,
                 cd_objectID,
                 v10);
  }
  v5 = -[NSEntityDescription name](-[NSManagedObjectID entity](self->_cd_objectID, "entity"), "name");
  cd_objectID = self->_cd_objectID;
  v7 = -[NSEntityDescription properties](-[NSManagedObjectID entity](cd_objectID, "entity"), "properties");
  v8 = -[NSArray count](v7, "count");
  v9 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v8);
  v10 = (void *)v9;
  if (v8)
  {
    v30 = cd_objectID;
    v31 = v5;
    v32 = v4;
    v33 = v3;
    v11 = 0;
    v35 = v7;
    v36 = (void *)v9;
    v34 = v8;
    while (1)
    {
      v12 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", v11);
      v13 = objc_msgSend(v12, "name");
      v14 = -[_CDSnapshot valueForKey:](self, "valueForKey:", v13);
      if (v14)
      {
        v15 = v14;
        switch(objc_msgSend(v12, "_propertyType"))
        {
          case 2:
          case 6:
          case 7:
            v16 = objc_msgSend(v12, "attributeType");
            if (v16 <= 799)
            {
              if (v16 <= 399)
              {
                if (v16 == 100)
                  goto LABEL_66;
                if (v16 == 200)
                  goto LABEL_66;
                v17 = CFSTR("(...not nil..)");
                if (v16 == 300)
                  goto LABEL_66;
              }
              else if (v16 > 599)
              {
                if (v16 == 600)
                  goto LABEL_66;
                v17 = CFSTR("(...not nil..)");
                if (v16 != 700)
                  goto LABEL_69;
                if (!-[__CFString isNSString](v15, "isNSString", CFSTR("(...not nil..)")))
                  goto LABEL_66;
                if ((unint64_t)-[__CFString length](v15, "length") >= 0xC9)
                {
                  v19 = -[__CFString substringToIndex:](v15, "substringToIndex:", 200);
                  goto LABEL_68;
                }
                v17 = v15;
              }
              else
              {
                if (v16 == 400)
                  goto LABEL_66;
                v17 = CFSTR("(...not nil..)");
                if (v16 == 500)
                  goto LABEL_66;
              }
            }
            else if (v16 > 1199)
            {
              if (v16 > 1999)
              {
                if (v16 == 2100)
                  goto LABEL_66;
                v17 = CFSTR("(...not nil..)");
                if (v16 == 2000)
                  goto LABEL_66;
              }
              else
              {
                if (v16 == 1200)
                  goto LABEL_66;
                v17 = CFSTR("(...not nil..)");
                if (v16 == 1800)
                  goto LABEL_66;
              }
            }
            else
            {
              if (v16 > 999)
              {
                if (v16 == 1000)
                {
                  if (objc_msgSend(v12, "isFileBackedFuture"))
                    goto LABEL_66;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    || !-[__CFString isNSData](v15, "isNSData")
                    || (unint64_t)-[__CFString length](v15, "length") < 0x33)
                  {
                    goto LABEL_66;
                  }
                  v27 = (__CFString *)-[__CFString subdataWithRange:](v15, "subdataWithRange:", 0, 50);
                }
                else
                {
                  v17 = CFSTR("(...not nil..)");
                  if (v16 != 1100)
                    goto LABEL_69;
LABEL_66:
                  v27 = v15;
                }
                v19 = -[__CFString description](v27, "description");
                goto LABEL_68;
              }
              if (v16 == 800)
                goto LABEL_66;
              v17 = CFSTR("(...not nil..)");
              if (v16 == 900)
                goto LABEL_66;
            }
LABEL_69:
            v18 = v10;
            break;
          case 3:
            goto LABEL_20;
          case 4:
            if ((objc_msgSend(v12, "isToMany") & 1) != 0)
            {
LABEL_20:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                || !-[__CFString isFault](v15, "isFault"))
              {
                v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[__CFString count](v15, "count"));
                v38 = 0u;
                v39 = 0u;
                v40 = 0u;
                v41 = 0u;
                v21 = -[__CFString countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
                if (v21)
                {
                  v22 = v21;
                  v23 = 0;
                  v24 = *(_QWORD *)v39;
                  do
                  {
                    v25 = 0;
                    if (v23 <= 0xA)
                      v26 = 10 - v23;
                    else
                      v26 = 0;
                    do
                    {
                      if (*(_QWORD *)v39 != v24)
                        objc_enumerationMutation(v15);
                      if (v26 == v25)
                      {
                        objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(...and %ld more...)"), -[__CFString count](v15, "count") - 10));
                        goto LABEL_44;
                      }
                      objc_msgSend(v20, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v25++), "objectID"));
                    }
                    while (v22 != v25);
                    v22 = -[__CFString countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
                    v23 += v25;
                  }
                  while (v22);
                }
LABEL_44:
                v10 = v36;
                objc_msgSend(v36, "setObject:forKey:", v20, v13);

                v8 = v34;
                v7 = v35;
                goto LABEL_71;
              }
              v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<relationship fault: %p '%@'>"), v15, objc_msgSend((id)-[__CFString relationship](v15, "relationship"), "name"));
              goto LABEL_68;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = v10;
              v17 = v15;
              break;
            }
            if (v15 != (__CFString *)_CD_ScalarNull)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("foreign key: %@"), v15, v29);
              else
                v19 = -[__CFString objectID](v15, "objectID");
LABEL_68:
              v17 = (const __CFString *)v19;
              goto LABEL_69;
            }
            v18 = v10;
            v17 = CFSTR("<deferred relationship fault>");
            break;
          default:
            v18 = v10;
            v17 = CFSTR("(...not nil..)");
            break;
        }
      }
      else
      {
        v18 = v10;
        v17 = CFSTR("nil");
      }
      objc_msgSend(v18, "setObject:forKey:", v17, v13);
LABEL_71:
      if (++v11 == v8)
      {
        v4 = v32;
        v3 = v33;
        cd_objectID = v30;
        v5 = v31;
        return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (entity: %@; id: %@ ; data: %@)"),
                     v4,
                     v5,
                     cd_objectID,
                     v10);
      }
    }
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (entity: %@; id: %@ ; data: %@)"),
               v4,
               v5,
               cd_objectID,
               v10);
}

- (id)valueForKey:(id)a3
{
  NSEntityDescription *v5;
  NSEntityDescription *v6;
  uint64_t v7;
  unsigned int v9;
  Class isa;
  void *v11;
  Class Class;
  objc_super v13;

  v5 = -[NSManagedObjectID entity](self->_cd_objectID, "entity");
  v6 = v5;
  if (v5)
    v5 = (NSEntityDescription *)v5->_propertyMapping;
  v7 = -[NSEntityDescription indexForKey:](v5, "indexForKey:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  v9 = v7;
  if (((*(&self->_cd_nullFlags_ + (v7 >> 3)) >> (v7 & 7)) & 1) != 0)
    return 0;
  isa = v6->_properties[v7 + 3].super.super.isa;
  if ((-[objc_class _isRelationship](isa, "_isRelationship") & 1) != 0
    || -[objc_class attributeType](isa, "attributeType") != 900)
  {
LABEL_4:
    v13.receiver = self;
    v13.super_class = (Class)_CDSnapshot;
    return -[_CDSnapshot valueForKey:](&v13, sel_valueForKey_, a3);
  }
  v11 = (void *)MEMORY[0x1E0C99D68];
  Class = object_getClass(self);
  return (id)objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&self->super.isa + *((unsigned int *)object_getIndexedIvars(Class) + v9 + 19)));
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  NSEntityDescription *v7;
  NSEntityDescription *v8;
  uint64_t v9;
  unsigned int v10;
  Class isa;
  double v12;
  objc_super v13;

  if ((*(_BYTE *)&self->_cd_flags & 1) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("snapshot is marked read only"), 0));
  v7 = -[NSManagedObjectID entity](self->_cd_objectID, "entity");
  v8 = v7;
  if (v7)
    v7 = (NSEntityDescription *)v7->_propertyMapping;
  v9 = -[NSEntityDescription indexForKey:](v7, "indexForKey:", a4);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  v10 = v9;
  if (!a3)
  {
    snapshot_set_null((char *)self, v9);
    return;
  }
  isa = v8->_properties[v9 + 3].super.super.isa;
  if ((-[objc_class _isRelationship](isa, "_isRelationship") & 1) != 0
    || -[objc_class attributeType](isa, "attributeType") != 900)
  {
LABEL_10:
    v13.receiver = self;
    v13.super_class = (Class)_CDSnapshot;
    -[_CDSnapshot setValue:forKey:](&v13, sel_setValue_forKey_, a3, a4);
    return;
  }
  if (objc_msgSend(a3, "isNSNumber"))
    objc_msgSend(a3, "doubleValue");
  else
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  snapshot_set_double((char *)self, v10, v12);
}

@end
