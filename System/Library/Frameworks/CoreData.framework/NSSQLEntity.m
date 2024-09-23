@implementation NSSQLEntity

- (id)foreignOrderKeyColumns
{
  return self->_fokColumns;
}

- (id)foreignEntityKeyColumns
{
  return self->_ekColumns;
}

- (uint64_t)virtualForeignKeyColumns
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  unint64_t *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 120))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v3 = *(void **)(v1 + 96);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v13 != v6)
              objc_enumerationMutation(v3);
            v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
            v9 = objc_msgSend(v8, "toOneRelationship");
            if (v9)
            {
              if (*(_BYTE *)(v9 + 88))
                objc_msgSend(v2, "addObject:", v8);
            }
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v5);
      }
      v10 = (unint64_t *)(v1 + 120);
      while (!__ldaxr(v10))
      {
        if (!__stlxr((unint64_t)v2, v10))
          return *(_QWORD *)(v1 + 120);
      }
      __clrex();

    }
    return *(_QWORD *)(v1 + 120);
  }
  return result;
}

- (id)foreignKeyColumns
{
  return self->_fkColumns;
}

- (id)entityDescription
{
  return self->_entityDescription;
}

- (_QWORD)_addColumnToFetch:(_QWORD *)result
{
  _QWORD *v3;
  uint64_t v4;
  __int16 v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;
  NSSQLColumn *v12;
  NSSQLColumn *v13;

  if (result && a2)
  {
    v3 = result;
    v4 = result[21];
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(v4 + 72), "count");
      objc_msgSend(*(id *)(v4 + 72), "addObject:", a2);
      a2[13] = v5;
    }
    v6 = objc_msgSend(a2, "propertyType") - 1;
    if (v6 <= 9 && ((0x20Du >> v6) & 1) != 0)
    {
      v7 = *off_1E1EDFA30[(char)v6];
      v8 = *(void **)((char *)v3 + v7);
      if (v8)
      {
        v9 = objc_msgSend(*(id *)((char *)v3 + v7), "count");
        objc_msgSend(v8, "addObject:", a2);
        if ((__int16)a2[14] == -1)
          a2[14] = v9;
      }
    }
    result = (_QWORD *)v3[10];
    if (result)
    {
      v10 = (unsigned __int16)a2[13];
      if (objc_msgSend(result, "count") < v10)
      {
        do
        {
          v11 = objc_msgSend((id)v3[10], "count");
          objc_opt_self();
          os_unfair_lock_lock_with_options();
          v12 = (NSSQLColumn *)objc_msgSend((id)qword_1ECD8D7C0, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11));
          if (!v12)
          {
            v13 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", CFSTR("0"), 1);
            v12 = v13;
            if (v13)
            {
              *(_WORD *)&v13->super._flags &= ~1u;
              v13->super._fetchIndex = v11;
            }
            objc_msgSend((id)qword_1ECD8D7C0, "setObject:forKey:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11));

          }
          os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_95);
          objc_msgSend((id)v3[10], "addObject:", v12);
        }
        while (objc_msgSend((id)v3[10], "count") < v10);
      }
      return (_QWORD *)objc_msgSend((id)v3[10], "addObject:", a2);
    }
  }
  return result;
}

- (id)model
{
  return self->_model;
}

- (_QWORD)_generateProperties
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  char *v18;
  size_t v19;
  NSSQLEntityKey *v20;
  NSSQLPrimaryKey *v21;
  NSSQLOptLockKey *v22;
  NSSQLStoreMappingGenerator *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  __CFString **v31;
  unint64_t v32;
  __CFString *v33;
  const void *Value;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id *v39;
  __int128 v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSSQLAttribute *v49;
  uint64_t v50;
  objc_class *v51;
  NSString *v52;
  objc_class *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  objc_class *v61;
  NSString *v62;
  objc_class *v63;
  NSString *v64;
  void *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  size_t v69;
  uint64_t v70;
  char *v71;
  size_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v80;
  void *v81;
  __CFString *v82;
  const void *v83;
  unsigned int *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id *v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  NSSQLToOne *v92;
  _WORD *v93;
  uint64_t v94;
  NSSQLForeignEntityKey *foreignEntityKey;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  __objc2_class **v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  id *v114;
  void *v115;
  id v116;
  void *v117;
  _QWORD *v118;
  uint64_t v119;
  _QWORD *v120;
  NSString *v121;
  __int128 v122;
  __int128 *v123;
  id v124;
  unsigned int *v125;
  int v126;
  int v127;
  __int128 *v128;
  unint64_t *v129;
  unint64_t *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _QWORD v135[2];
  uint64_t (*v136)(uint64_t, void *, uint64_t);
  void *v137;
  uint64_t v138;
  id v139;
  __int128 *v140;
  id v141;
  _BYTE *v142;
  char v143;
  _BYTE v144[128];
  _BYTE buf[24];
  void (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  _QWORD *v148;
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (uint64_t)result;
    v2 = (_QWORD *)result[20];
    v124 = (id)objc_msgSend(result, "entityDescription");
    v3 = *(_QWORD *)(v1 + 16);
    if (v3 && *(_BYTE *)(v3 + 65))
    {
      v129 = 0;
      v130 = 0;
      v127 = 1;
    }
    else
    {
      v130 = (unint64_t *)objc_msgSend(v124, "_leopardStyleAttributesByName");
      v129 = (unint64_t *)objc_msgSend(v124, "_leopardStyleRelationshipsByName");
      v127 = 0;
    }
    v4 = objc_msgSend((id)v1, "model");
    if (v4)
      v126 = (*(unsigned __int8 *)(v4 + 56) >> 1) & 1;
    else
      v126 = 0;
    v5 = *(_QWORD *)(v1 + 160);
    v6 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
    if (v5)
    {
      *(_QWORD *)(v1 + 80) = objc_msgSend(*(id *)(v5 + 80), "mutableCopy");
      v7 = objc_alloc(MEMORY[0x1E0C99E08]);
      if (v2)
        v8 = v2[5];
      else
        v8 = 0;
      *(_QWORD *)(v1 + 40) = objc_msgSend(v7, "initWithDictionary:", v8);
      v9 = objc_alloc(MEMORY[0x1E0C99E08]);
      if (v2)
        v10 = v2[34];
      else
        v10 = 0;
      *(_QWORD *)(v1 + 272) = objc_msgSend(v9, "initWithDictionary:", v10);
      if ((v127 & 1) == 0)
      {
        v11 = _PF_Leopard_CFDictionaryCreate();
        v128 = &v122;
        *(_QWORD *)(v1 + 248) = v11;
        v12 = (unint64_t *)v2[31];
        v13 = *v12;
        if (*v12 <= 1)
          v14 = 1;
        else
          v14 = *v12;
        if (v13 >= 0x201)
          v15 = 1;
        else
          v15 = v14;
        v16 = 8 * v15;
        MEMORY[0x1E0C80A78](v11);
        v18 = (char *)&v122 - v17;
        if (v16 >= 0x200)
          v19 = 512;
        else
          v19 = v16;
        bzero(v18, v19);
        if (v13 > 0x200)
          v18 = (char *)NSAllocateScannedUncollectable();
        else
          bzero(v18, v16);
        v24 = v12[1];
        if (v24 >= 1)
        {
          v25 = 0;
          v26 = (uint64_t *)v12[9];
          do
          {
            v28 = *v26++;
            v27 = v28;
            v29 = v12[8];
            if (v29 != v28 && v27 != ~v29)
              *(_QWORD *)&v18[8 * v25++] = v27;
            --v24;
          }
          while (v24);
        }
        if ((uint64_t)v13 >= 1)
        {
          v31 = (__CFString **)v18;
          v32 = v13;
          do
          {
            v33 = *v31++;
            Value = (const void *)_PF_Leopard_CFDictionaryGetValue(v12, v33);
            _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(v1 + 248), v33, Value);
            --v32;
          }
          while (v32);
        }
        v6 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
        if (v13 >= 0x201)
          NSZoneFree(0, v18);
      }
      *(_QWORD *)(v1 + 96) = objc_msgSend((id)objc_msgSend(v2, "foreignKeyColumns"), "mutableCopy");
      *(_QWORD *)(v1 + 88) = objc_msgSend((id)objc_msgSend(v2, "foreignEntityKeyColumns"), "mutableCopy");
      *(_QWORD *)(v1 + 104) = objc_msgSend((id)objc_msgSend(v2, "foreignOrderKeyColumns"), "mutableCopy");
      *(_QWORD *)(v1 + 112) = objc_msgSend((id)objc_msgSend(v2, "attributeColumns"), "mutableCopy");
      if (v2)
      {
        *(_QWORD *)(v1 + 128) = v2[16];
        *(_QWORD *)(v1 + 136) = v2[17];
        *(_QWORD *)(v1 + 144) = v2[18];
        v35 = *(void **)((char *)v2 + v6[458]);
      }
      else
      {
        v35 = 0;
        *(_QWORD *)(v1 + 128) = 0;
        *(_QWORD *)(v1 + 136) = 0;
        *(_QWORD *)(v1 + 144) = 0;
      }
      v23 = v35;
    }
    else
    {
      *(_QWORD *)(v1 + 40) = objc_opt_new();
      *(_QWORD *)(v1 + 272) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if ((v127 & 1) == 0)
        *(_QWORD *)(v1 + 248) = _PF_Leopard_CFDictionaryCreate();
      *(_QWORD *)(v1 + 72) = objc_opt_new();
      *(_QWORD *)(v1 + 80) = objc_opt_new();
      *(_QWORD *)(v1 + 96) = objc_opt_new();
      *(_QWORD *)(v1 + 88) = objc_opt_new();
      *(_QWORD *)(v1 + 104) = objc_opt_new();
      *(_QWORD *)(v1 + 112) = objc_opt_new();
      v20 = -[NSSQLEntityKey initWithEntity:propertyDescription:]([NSSQLEntityKey alloc], "initWithEntity:propertyDescription:", v1, 0);
      *(_QWORD *)(v1 + 136) = v20;
      -[NSSQLEntity _addColumnToFetch:]((_QWORD *)v1, v20);
      objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", *(_QWORD *)(v1 + 136), objc_msgSend(*(id *)(v1 + 136), "name"));
      if ((v127 & 1) == 0)
        _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(v1 + 248), (__CFString *)objc_msgSend(*(id *)(v1 + 136), "name"), *(const void **)(v1 + 136));

      v21 = -[NSSQLPrimaryKey initWithEntity:propertyDescription:]([NSSQLPrimaryKey alloc], "initWithEntity:propertyDescription:", v1, 0);
      *(_QWORD *)(v1 + 128) = v21;
      -[NSSQLEntity _addColumnToFetch:]((_QWORD *)v1, v21);
      objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", *(_QWORD *)(v1 + 128), objc_msgSend(*(id *)(v1 + 128), "name"));
      if ((v127 & 1) == 0)
        _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(v1 + 248), (__CFString *)objc_msgSend(*(id *)(v1 + 128), "name"), *(const void **)(v1 + 128));

      v22 = -[NSSQLOptLockKey initWithEntity:propertyDescription:]([NSSQLOptLockKey alloc], "initWithEntity:propertyDescription:", v1, 0);
      *(_QWORD *)(v1 + 144) = v22;
      -[NSSQLEntity _addColumnToFetch:]((_QWORD *)v1, v22);
      objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", *(_QWORD *)(v1 + 144), objc_msgSend(*(id *)(v1 + 144), "name"));
      if ((v127 & 1) == 0)
        _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(v1 + 248), (__CFString *)objc_msgSend(*(id *)(v1 + 144), "name"), *(const void **)(v1 + 144));

      v23 = objc_alloc_init(NSSQLStoreMappingGenerator);
    }
    *(_QWORD *)(v1 + v6[458]) = v23;
    if ((v127 & 1) != 0)
      v128 = 0;
    else
      v128 = (__int128 *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v126)
    {
      v125 = (unsigned int *)objc_msgSend(v124, "_newSnowLeopardStyleDictionaryContainingPropertiesOfType:", 1);
      v123 = &v122;
      v36 = v125[2];
      v37 = MEMORY[0x1E0C80A78](v125);
      v39 = (id *)((char *)&v122 - v38);
      _PF_SnowLeopard_CFDictionaryGetValues(v37, (uint64_t)&v122 - v38);
    }
    else
    {
      v125 = (unsigned int *)objc_msgSend(v124, "_newMappingForPropertiesOfRange:", 1);
      v36 = objc_msgSend(v125, "count");
      v123 = &v122;
      MEMORY[0x1E0C80A78](v36);
      v39 = (id *)((char *)&v122 - v41);
      objc_msgSend(v125, "getObjects:", (char *)&v122 - v41);
    }
    if (v36)
    {
      *(_QWORD *)&v40 = 138412546;
      v122 = v40;
      do
      {
        v42 = *v39;
        if ((objc_msgSend(*v39, "isTransient", (_QWORD)v122, *((_QWORD *)&v122 + 1)) & 1) == 0)
        {
          if (v42 && objc_msgSend(v42, "attributeType") == 2100)
          {
            v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3052000000;
              v146 = __Block_byref_object_copy__25;
              v147 = __Block_byref_object_dispose__25;
              v135[0] = MEMORY[0x1E0C809B0];
              v135[1] = 3221225472;
              v136 = __34__NSSQLEntity__generateProperties__block_invoke;
              v137 = &unk_1E1EDF9F0;
              v141 = v42;
              v142 = buf;
              v138 = v1;
              v139 = v43;
              v143 = v127;
              v140 = v128;
              v148 = v135;
              v44 = objc_msgSend(v42, "elements");
              v45 = objc_msgSend(v42, "name");
              v136((uint64_t)v135, (void *)v44, v45);
              v46 = objc_msgSend(v42, "name");
              if (v46)
              {
                v47 = (void *)objc_msgSend(*(id *)(v1 + 272), "objectForKey:", v46);
                if (v47)
                {
                  objc_msgSend(v47, "addObjectsFromArray:", v43);
                }
                else
                {
                  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v43);
                  objc_msgSend(*(id *)(v1 + 272), "setObject:forKey:", v65, v46);

                }
              }

              _Block_object_dispose(buf, 8);
            }
            else
            {
              v50 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexpected multi-column attribute description class (expected %@): %@");
              v51 = (objc_class *)objc_opt_class();
              v52 = NSStringFromClass(v51);
              v53 = (objc_class *)objc_opt_class();
              v121 = NSStringFromClass(v53);
              _NSCoreDataLog(17, v50, v54, v55, v56, v57, v58, v59, (uint64_t)v52);
              v60 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                v61 = (objc_class *)objc_opt_class();
                v62 = NSStringFromClass(v61);
                v63 = (objc_class *)objc_opt_class();
                v64 = NSStringFromClass(v63);
                *(_DWORD *)buf = v122;
                *(_QWORD *)&buf[4] = v62;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v64;
                _os_log_fault_impl(&dword_18A253000, v60, OS_LOG_TYPE_FAULT, "CoreData: Unexpected multi-column attribute description class (expected %@): %@", buf, 0x16u);
              }
            }
          }
          else
          {
            v48 = objc_msgSend(v42, "name");
            if (!objc_msgSend(*(id *)(v1 + 40), "objectForKey:", v48))
            {
              v49 = -[NSSQLAttribute initWithEntity:propertyDescription:]([NSSQLAttribute alloc], "initWithEntity:propertyDescription:", v1, v42);
              -[NSSQLEntity _addColumnToFetch:]((_QWORD *)v1, v49);
              objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", v49, v48);
              if ((v127 & 1) == 0)
                objc_msgSend(v128, "setObject:forKey:", v49, v48);
              if (objc_msgSend(v42, "_propertyType") == 6)
                -[NSSQLEntity addDerivedAttribute:](v1, (uint64_t)v49);

            }
          }
        }
        ++v39;
        --v36;
      }
      while (v36);
    }
    if ((v126 & 1) != 0)
      _PF_SnowLeopard_CFDictionaryDestroy((uint64_t)v125);
    else

    if ((v127 & 1) == 0)
    {
      v67 = *v130;
      if ((uint64_t)*v130 >= 1)
      {
        if (v67 >= 0x201)
          v68 = 1;
        else
          v68 = *v130;
        v69 = 8 * v68;
        MEMORY[0x1E0C80A78](v66);
        v71 = (char *)&v122 - v70;
        if (v69 >= 0x200)
          v72 = 512;
        else
          v72 = v69;
        bzero(v71, v72);
        if (v67 > 0x200)
          v71 = (char *)NSAllocateScannedUncollectable();
        else
          bzero(v71, v69);
        v73 = v130[1];
        if (v73 > 0)
        {
          v74 = 0;
          v75 = (uint64_t *)v130[9];
          do
          {
            v77 = *v75++;
            v76 = v77;
            v78 = v130[8];
            if (v78 != v77 && v76 != ~v78)
              *(_QWORD *)&v71[8 * v74++] = v76;
            --v73;
          }
          while (v73);
        }
        v80 = 0;
        do
        {
          v81 = (void *)_PF_Leopard_CFDictionaryGetValue(v130, *(__CFString **)&v71[8 * v80]);
          if ((objc_msgSend(v81, "isTransient") & 1) == 0)
          {
            v82 = (__CFString *)objc_msgSend(v81, "name");
            v83 = (const void *)objc_msgSend(v128, "objectForKey:", v82);
            if (v83)
              _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(v1 + 248), v82, v83);
          }
          ++v80;
        }
        while (v67 != v80);
        if (v67 >= 0x201)
          NSZoneFree(0, v71);
      }
      objc_msgSend(v128, "removeAllObjects");
    }
    if (v126)
    {
      v84 = (unsigned int *)objc_msgSend(v124, "_newSnowLeopardStyleDictionaryContainingPropertiesOfType:", 2);
      v85 = v84[2];
      v86 = MEMORY[0x1E0C80A78](v84);
      v88 = (id *)((char *)&v122 - v87);
      _PF_SnowLeopard_CFDictionaryGetValues(v86, (uint64_t)&v122 - v87);
    }
    else
    {
      v84 = (unsigned int *)objc_msgSend(v124, "_newMappingForPropertiesOfRange:", 2);
      v85 = objc_msgSend(v84, "count");
      MEMORY[0x1E0C80A78](v85);
      v88 = (id *)((char *)&v122 - v89);
      objc_msgSend(v84, "getObjects:", (char *)&v122 - v89);
    }
    for (; v85; --v85)
    {
      v90 = *v88;
      if ((objc_msgSend(*v88, "isTransient") & 1) == 0)
      {
        v91 = objc_msgSend(v90, "name");
        if (!objc_msgSend(*(id *)(v1 + 40), "objectForKey:", v91))
        {
          if (objc_msgSend(v90, "maxCount") == 1)
          {
            v92 = -[NSSQLToOne initWithEntity:propertyDescription:]([NSSQLToOne alloc], "initWithEntity:propertyDescription:", v1, v90);
            v93 = -[NSSQLToOne foreignKey](v92, "foreignKey");
            objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", v93, objc_msgSend(v93, "name"));
            if ((v127 & 1) == 0)
            {
              v94 = objc_msgSend(v93, "name");
              objc_msgSend(v128, "setObject:forKey:", v93, v94);
            }
            -[NSSQLEntity _addColumnToFetch:]((_QWORD *)v1, v93);
            if (!v92)
              goto LABEL_128;
            foreignEntityKey = v92->_foreignEntityKey;
            if (foreignEntityKey)
            {
              objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", foreignEntityKey, -[NSSQLForeignEntityKey name](v92->_foreignEntityKey, "name"));
              if ((v127 & 1) == 0)
              {
                v96 = -[NSSQLForeignEntityKey name](foreignEntityKey, "name");
                objc_msgSend(v128, "setObject:forKey:", foreignEntityKey, v96);
              }
              -[NSSQLEntity _addColumnToFetch:]((_QWORD *)v1, foreignEntityKey);
            }
          }
          else
          {
            v97 = (void *)objc_msgSend(v90, "inverseRelationship");
            if (!v97 || (v98 = objc_msgSend(v97, "maxCount"), v99 = off_1E1EDAD20, v98 == 1))
              v99 = off_1E1EDAD28;
            v92 = (NSSQLToOne *)objc_msgSend(objc_alloc(*v99), "initWithEntity:propertyDescription:", v1, v90);
            if (!v92)
              goto LABEL_128;
          }
          objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", v92, v91);
          if ((v127 & 1) == 0)
            objc_msgSend(v128, "setObject:forKey:", v92, v91);

        }
      }
LABEL_128:
      ++v88;
    }
    if ((v126 & 1) != 0)
      _PF_SnowLeopard_CFDictionaryDestroy((uint64_t)v84);
    else

    if ((v127 & 1) == 0)
    {
      v101 = *v129;
      if ((uint64_t)*v129 >= 1)
      {
        MEMORY[0x1E0C80A78](v100);
        v103 = (char *)&v122 - v102;
        if (v101 > 0x200)
          v103 = (char *)NSAllocateScannedUncollectable();
        else
          bzero((char *)&v122 - v102, 8 * v101);
        v104 = v129[1];
        if (v104 > 0)
        {
          v105 = 0;
          v106 = (uint64_t *)v129[9];
          do
          {
            v108 = *v106++;
            v107 = v108;
            v109 = v129[8];
            if (v109 != v108 && v107 != ~v109)
              *(_QWORD *)&v103[8 * v105++] = v107;
            --v104;
          }
          while (v104);
        }
        v111 = 0;
        do
        {
          v112 = (void *)_PF_Leopard_CFDictionaryGetValue(v129, *(__CFString **)&v103[8 * v111]);
          if ((objc_msgSend(v112, "isTransient") & 1) == 0)
          {
            v113 = objc_msgSend(v112, "name");
            v114 = (id *)objc_msgSend(v128, "objectForKey:", v113);
            if (v114)
            {
              if (objc_msgSend(v112, "maxCount") == 1)
              {
                v115 = (void *)objc_msgSend(v114, "foreignKey");
                _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(v1 + 248), (__CFString *)objc_msgSend(v115, "name"), v115);
                v116 = v114[9];
                if (v116)
                  _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(v1 + 248), (__CFString *)objc_msgSend(v114[9], "name"), v116);
              }
              _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(v1 + 248), (__CFString *)objc_msgSend(v114, "name"), v114);
            }
          }
          ++v111;
        }
        while (v101 != v111);
        if (v101 >= 0x201)
          NSZoneFree(0, v103);
      }

      _PF_Leopard_CFDictionaryDestroy(v129);
      _PF_Leopard_CFDictionaryDestroy(v130);
    }
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v117 = *(void **)(v1 + 152);
    result = (_QWORD *)objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v131, v144, 16);
    v118 = result;
    if (result)
    {
      v119 = *(_QWORD *)v132;
      do
      {
        v120 = 0;
        do
        {
          if (*(_QWORD *)v132 != v119)
            objc_enumerationMutation(v117);
          -[NSSQLEntity _generateProperties](*(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)v120));
          v120 = (_QWORD *)((char *)v120 + 1);
        }
        while (v118 != v120);
        result = (_QWORD *)objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v131, v144, 16);
        v118 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)addDerivedAttribute:(uint64_t)result
{
  uint64_t v3;
  id v4;

  if (result)
  {
    v3 = result;
    v4 = *(id *)(result + 256);
    if (!v4)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(v3 + 256) = v4;
    }
    return objc_msgSend(v4, "addObject:", a2);
  }
  return result;
}

- (id)name
{
  return -[NSEntityDescription name](self->_entityDescription, "name");
}

- (id)attributeColumns
{
  return self->_attrColumns;
}

- (uint64_t)_generateIDWithSuperEntity:(int)a3 nextID:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend((id)a1, "entityDescription");
  if (a2)
  {
    *(_QWORD *)(a1 + 168) = objc_msgSend(a2, "rootEntity");
    *(_QWORD *)(a1 + 160) = a2;
    -[NSSQLEntity _addSubentity:]((uint64_t)a2, a1);
  }
  else
  {
    *(_QWORD *)(a1 + 168) = a1;
  }
  *(_DWORD *)(a1 + 184) = a3;
  v7 = objc_msgSend((id)a1, "model");
  if (v7)
  {
    objc_msgSend(*(id *)(v7 + 40), "addObject:", a1);
    CFRetain((CFTypeRef)a1);
  }
  v8 = (a3 + 1);
  v9 = -[NSEntityDescription _sortedSubentities](v6);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v8 = -[NSSQLEntity _generateIDWithSuperEntity:nextID:](objc_msgSend(*(id *)(a1 + 16), "entityNamed:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "name")), a1, v8);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  *(_DWORD *)(a1 + 188) = v8 - 1;
  return v8;
}

- (id)attributes
{
  id *v2;

  while (self)
  {
    v2 = (id *)self;
    self = (id)*((_QWORD *)self + 21);
    if (self == v2)
      return v2[9];
  }
  return self;
}

- (id)_generateMulticolumnUniquenessConstraints
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;
  id *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(result, "rootEntity");
    if (v2)
      v15 = *(void **)(v2 + 216);
    else
      v15 = 0;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v3 = objc_msgSend(v1, "entityDescription");
    if (v3)
    {
      v4 = *(_QWORD *)(v3 + 128);
      if (!v4 || (v5 = *(void **)(v4 + 24)) == 0)
        v5 = (void *)NSArray_EmptyArray;
    }
    else
    {
      v5 = 0;
    }
    result = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (result)
    {
      v6 = result;
      obj = v5;
      v17 = *(_QWORD *)v23;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v7);
          if ((unint64_t)objc_msgSend(v8, "count") >= 2)
          {
            v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v15, "addObject:", v9);

            v20 = 0u;
            v21 = 0u;
            v18 = 0u;
            v19 = 0u;
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v19;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v19 != v12)
                    objc_enumerationMutation(v8);
                  v14 = (void *)objc_msgSend(v1[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
                  objc_msgSend(v14, "setConstrained:", 1);
                  objc_msgSend(v9, "addObject:", v14);
                }
                v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              }
              while (v11);
            }
          }
          v7 = (id *)((char *)v7 + 1);
        }
        while (v7 != v6);
        result = (id *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        v6 = result;
      }
      while (result);
    }
  }
  return result;
}

- (id)rootEntity
{
  return self->_rootEntity;
}

- (uint64_t)_generateAttributeDerivations:(uint64_t)result
{
  NSSQLEntity_DerivedAttributesExtension *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSSQLEntity_DerivedAttributesExtension *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSSQLEntity_DerivedAttributesExtension *v29;
  NSSQLEntity_DerivedAttributesExtension *v30;
  uint64_t v31;
  NSSQLEntity_DerivedAttributesExtension *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
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
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t *v100;
  NSSQLEntity_DerivedAttributesExtension *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  const __CFString *v115;
  uint64_t v116;
  const __CFString *v117;
  char *v118;
  const __CFString *v119;
  uint64_t v120;
  const __CFString *v121;
  char *v122;
  const __CFString *v123;
  uint64_t v124;
  _QWORD v125[2];
  _QWORD v126[2];
  const __CFString *v127;
  uint64_t v128;
  const __CFString *v129;
  char *v130;
  _BYTE v131[128];
  const __CFString *v132;
  uint64_t v133;
  _QWORD v134[2];
  _QWORD v135[2];
  uint8_t buf[4];
  const char *v137;
  __int16 v138;
  int v139;
  const __CFString *v140;
  uint64_t v141;
  _QWORD v142[2];
  _QWORD v143[2];
  _BYTE v144[128];
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = (NSSQLEntity_DerivedAttributesExtension *)result;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v4 = *(void **)(result + 256);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v111, v144, 16);
  if (!v5)
    return 1;
  v6 = v5;
  v100 = a2;
  v7 = 0x1E0C99000uLL;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = *(_QWORD *)v112;
  v10 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
  while (2)
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v112 != v9)
        objc_enumerationMutation(v4);
      v105 = v11;
      v12 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v11);
      v13 = (void *)objc_msgSend(*(id *)(v7 + 3616), "set");
      v14 = (char *)objc_msgSend(v12, "propertyDescription");
      v110 = 0;
      v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "derivationExpression"), "_keypathsForDerivedPropertyValidation:", &v110);
      if (!v15)
      {
        v55 = *MEMORY[0x1E0C99778];
        v56 = *MEMORY[0x1E0CB3388];
        v142[0] = CFSTR("derived attribute");
        v142[1] = v56;
        v143[0] = v14;
        v143[1] = v110;
        v57 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v55, CFSTR("Invalid keypaths found in derived attribute (derivationExpression)"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, v142, 2));
        v58 = *MEMORY[0x1E0CB28A8];
        v140 = CFSTR("NSUnderlyingException");
        v141 = v57;
        v36 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v58, 134097, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
        if (!v36)
        {
          v59 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v59, v60, v61, v62, v63, v64, v65, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
          v44 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
            v138 = 1024;
            v139 = 1484;
LABEL_65:
            _os_log_fault_impl(&dword_18A253000, v44, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
          return 0;
        }
LABEL_47:
        if (v100)
          *v100 = v36;
        return 0;
      }
      objc_msgSend(v13, "addObjectsFromArray:", objc_msgSend(v15, "allObjects"));
      if (v14)
      {
        v16 = *(void **)&v14[v10[861]];
        if (v16)
        {
          v17 = (void *)objc_msgSend(v16, "_keypathsForDerivedPropertyValidation:", &v110);
          if (v17)
          {
            objc_msgSend(v13, "addObjectsFromArray:", objc_msgSend(v17, "allObjects"));
            goto LABEL_12;
          }
          v76 = *MEMORY[0x1E0C99778];
          v77 = *MEMORY[0x1E0CB3388];
          v134[0] = CFSTR("derived attribute");
          v134[1] = v77;
          v135[0] = v14;
          v135[1] = v110;
          v78 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v76, CFSTR("Invalid keypaths found in derived attribute (filteringPredicate)"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, v134, 2));
          v79 = *MEMORY[0x1E0CB28A8];
          v132 = CFSTR("NSUnderlyingException");
          v133 = v78;
          v36 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v79, 134097, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1));
          if (!v36)
          {
            v80 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v80, v81, v82, v83, v84, v85, v86, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
            v44 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
              v138 = 1024;
              v139 = 1493;
              goto LABEL_65;
            }
            return 0;
          }
          goto LABEL_47;
        }
      }
LABEL_12:
      v102 = v14;
      if (objc_msgSend(v13, "count"))
      {
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v103 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v106, v131, 16);
        if (v103)
        {
          v104 = *(_QWORD *)v107;
          v101 = v3;
          v98 = v6;
          v99 = v4;
          v97 = v9;
          while (2)
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v107 != v104)
                objc_enumerationMutation(v13);
              v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * v18), "componentsSeparatedByString:", CFSTR("."));
              v20 = objc_msgSend(v19, "count");
              if (v20)
              {
                v21 = v20;
                v22 = 0;
                v23 = v20 - 1;
                v24 = v101;
                while (1)
                {
                  v25 = (void *)objc_msgSend(v19, "objectAtIndexedSubscript:", v22);
                  if (objc_msgSend(v25, "hasPrefix:", CFSTR("@")))
                    break;
                  if (!v24
                    || (v26 = (void *)-[objc_class objectForKey:](v24[1].super.isa, "objectForKey:", v25)) == 0)
                  {
                    v33 = *MEMORY[0x1E0C99778];
                    v125[0] = CFSTR("derived attribute");
                    v125[1] = CFSTR("component");
                    v126[0] = v102;
                    v126[1] = v25;
                    v34 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v33, CFSTR("Invalid keypaths found in derived attribute (can't find keypath component)"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 2));
                    v35 = *MEMORY[0x1E0CB28A8];
                    v123 = CFSTR("NSUnderlyingException");
                    v124 = v34;
                    v36 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v35, 134097, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1));
                    if (v36)
                      goto LABEL_47;
                    v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                    _NSCoreDataLog(17, v37, v38, v39, v40, v41, v42, v43, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
                    v44 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
                      v138 = 1024;
                      v139 = 1526;
                      goto LABEL_65;
                    }
                    return 0;
                  }
                  v27 = v26;
                  v28 = objc_msgSend((id)objc_msgSend(v26, "propertyDescription"), "_propertyType");
                  if (v28 == 6)
                  {
                    v45 = *MEMORY[0x1E0C99778];
                    v121 = CFSTR("derived attribute");
                    v122 = v102;
                    v46 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v45, CFSTR("Invalid keypaths found in derived attribute (derived attribute found in dependency chain)"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1));
                    v47 = *MEMORY[0x1E0CB28A8];
                    v119 = CFSTR("NSUnderlyingException");
                    v120 = v46;
                    v36 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v47, 134097, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1));
                    if (v36)
                      goto LABEL_47;
                    v48 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                    _NSCoreDataLog(17, v48, v49, v50, v51, v52, v53, v54, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
                    v44 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
                      v138 = 1024;
                      v139 = 1533;
                      goto LABEL_65;
                    }
                    return 0;
                  }
                  if (v23 == v22)
                  {
                    v29 = -[NSSQLEntity derivedAttributesExtension](v24);
                    -[NSSQLEntity_DerivedAttributesExtension addDerivationKeypath:forAttribute:]((uint64_t)v29, v19, v12);
                  }
                  else if (v28 == 2)
                  {
                    if ((objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", v22 + 1), "hasPrefix:", CFSTR("@")) & 1) == 0)
                    {
                      v66 = *MEMORY[0x1E0C99778];
                      v117 = CFSTR("derived attribute");
                      v118 = v102;
                      v67 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v66, CFSTR("Invalid keypaths found in derived attribute (non-terminal attribute not followed by a function)"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1));
                      v68 = *MEMORY[0x1E0CB28A8];
                      v115 = CFSTR("NSUnderlyingException");
                      v116 = v67;
                      v36 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v68, 134097, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1));
                      if (v36)
                        goto LABEL_47;
                      v69 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                      _NSCoreDataLog(17, v69, v70, v71, v72, v73, v74, v75, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
                      v44 = __pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 136315394;
                        v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
                        v138 = 1024;
                        v139 = 1546;
                        goto LABEL_65;
                      }
                      return 0;
                    }
                  }
                  else if (v28 == 4)
                  {
                    v24 = (NSSQLEntity_DerivedAttributesExtension *)objc_msgSend(v27, "destinationEntity");
                  }
                  if (v21 == ++v22)
                    goto LABEL_35;
                }
                if (objc_msgSend(CFSTR("@count"), "caseInsensitiveCompare:", v25))
                {
                  if (v24)
                  {
                    v30 = -[NSSQLEntity derivedAttributesExtension](v24);
                    -[NSSQLEntity_DerivedAttributesExtension addDerivationKeypath:forAttribute:]((uint64_t)v30, v19, v12);
                  }
                  goto LABEL_35;
                }
                v87 = *MEMORY[0x1E0C99778];
                v129 = CFSTR("derived attribute");
                v130 = v102;
                v88 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v87, CFSTR("Invalid keypaths found in derived attribute (unsupported function)"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1));
                v89 = *MEMORY[0x1E0CB28A8];
                v127 = CFSTR("NSUnderlyingException");
                v128 = v88;
                v36 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v89, 134097, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1));
                if (v36)
                  goto LABEL_47;
                v90 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                _NSCoreDataLog(17, v90, v91, v92, v93, v94, v95, v96, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
                v44 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
                  v138 = 1024;
                  v139 = 1515;
                  goto LABEL_65;
                }
                return 0;
              }
LABEL_35:
              ++v18;
            }
            while (v18 != v103);
            v31 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v106, v131, 16);
            v3 = v101;
            v6 = v98;
            v4 = v99;
            v7 = 0x1E0C99000;
            v8 = (void *)MEMORY[0x1E0C9AA60];
            v9 = v97;
            v10 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
            v103 = v31;
            if (v31)
              continue;
            break;
          }
        }
      }
      else
      {
        v32 = -[NSSQLEntity derivedAttributesExtension](v3);
        -[NSSQLEntity_DerivedAttributesExtension addDerivationKeypath:forAttribute:]((uint64_t)v32, v8, v12);
      }
      v11 = v105 + 1;
    }
    while (v105 + 1 != v6);
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v111, v144, 16);
    result = 1;
    if (v6)
      continue;
    return result;
  }
}

- (void)_organizeConstraints
{
  uint64_t v2;
  CFIndex v4;
  void *v5;
  CFStringRef (__cdecl *v6)(const void *);
  __CFDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  CFIndex v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CFDictionaryKeyCallBacks keyCallBacks;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 216), "count");
    if (!*(_QWORD *)(a1 + 160) && v2 != 0)
    {
      v4 = v2;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v2);
      keyCallBacks.version = *MEMORY[0x1E0C9B390];
      *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B390] + 8);
      v6 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B390] + 24);
      keyCallBacks.equal = 0;
      keyCallBacks.hash = 0;
      keyCallBacks.copyDescription = v6;
      v19 = v4;
      v7 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, &keyCallBacks, MEMORY[0x1E0C9B3A0]);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v20 = a1;
      obj = *(id *)(a1 + 216);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(obj);
            v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1)));
            v13 = (const void *)objc_msgSend((id)objc_msgSend(v12, "valueForKey:", CFSTR("columnName")), "componentsJoinedByString:", CFSTR("_"));
            objc_msgSend(v5, "addObject:", v13);
            CFDictionaryAddValue(v7, v13, v12);
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v9);
      }
      objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_37);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v19);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v5);
            objc_msgSend(v14, "addObject:", CFDictionaryGetValue(v7, *(const void **)(*((_QWORD *)&v22 + 1) + 8 * j)));
          }
          v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        }
        while (v16);
      }

      *(_QWORD *)(v20 + 216) = v14;
      CFRelease(v7);
    }
  }
}

- (NSSQLEntity)initWithModel:(id)a3 entityDescription:(id)a4
{
  NSSQLEntity *v6;
  NSSQLStoreMappingGenerator *v7;
  _BOOL4 v8;
  _NSRange *v9;
  int v10;
  NSSQLEntity *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSMutableDictionary *rtreeIndices;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)NSSQLEntity;
  v6 = -[NSSQLEntity init](&v26, sel_init);
  if (v6)
  {
    v7 = +[NSSQLStoreMappingGenerator defaultMappingGenerator]();
    if (a3)
      v8 = *((_DWORD *)a3 + 17) >> 7 > 0x7Cu;
    else
      v8 = 0;
    v6->_tableName = (NSString *)-[NSSQLStoreMappingGenerator generateTableName:isAncillary:]((uint64_t)v7, a4, v8);
    v6->_entityDescription = (NSEntityDescription *)a4;
    v6->_model = (NSSQLModel *)a3;
    v6->_fetch_entity_plan = 0;
    if (a4)
      v9 = (_NSRange *)*((_QWORD *)a4 + 14);
    else
      v9 = 0;
    v6->_toOneRange = v9[6];
    v6->_sqlentityFlags = (__sqlentityFlags)(*(_DWORD *)&v6->_sqlentityFlags & 0xFFFFFFFE | -[NSEntityDescription _hasAttributesWithExternalDataReferences]((uint64_t)a4));
    if (-[NSEntityDescription _hasAttributesWithFileBackedFutures]((uint64_t)a4))
      v10 = 2;
    else
      v10 = 0;
    v6->_sqlentityFlags = (__sqlentityFlags)(*(_DWORD *)&v6->_sqlentityFlags & 0xFFFFFFFD | v10);
    if (!objc_msgSend(a4, "superentity"))
    {
      v6->_multicolumnUniquenessConstraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6->_uniqueProperties = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    if (objc_msgSend(a4, "indexes") && objc_msgSend((id)objc_msgSend(a4, "indexes"), "count"))
    {
      rtreeIndices = v6->_rtreeIndices;
      if (!rtreeIndices)
      {
        rtreeIndices = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v6->_rtreeIndices = rtreeIndices;
      }
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v11 = v6;
      v12 = -[NSEntityDescription indexes](v6->_entityDescription, "indexes");
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v17, "elements"), "count")
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "elements"), "firstObject"), "collationType") == 1)
            {
              v29 = 0u;
              v30 = 0u;
              v27 = 0u;
              v28 = 0u;
              v18 = (void *)objc_msgSend(v17, "elements");
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v28;
LABEL_25:
                v22 = 0;
                while (1)
                {
                  if (*(_QWORD *)v28 != v21)
                    objc_enumerationMutation(v18);
                  if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22), "property"), "isOptional") & 1) != 0)break;
                  if (v20 == ++v22)
                  {
                    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                    if (v20)
                      goto LABEL_25;
                    goto LABEL_31;
                  }
                }
              }
              else
              {
LABEL_31:
                v23 = -[NSSQLRTreeIndex initForIndexDescription:sqlEntity:]([NSSQLRTreeIndex alloc], "initForIndexDescription:sqlEntity:", v17, v11);
                -[NSMutableDictionary setObject:forKey:](rtreeIndices, "setObject:forKey:", v23, objc_msgSend(v17, "name"));

              }
            }
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v14);
      }
      return v11;
    }
  }
  return v6;
}

- (uint64_t)_addSubentity:(uint64_t)result
{
  uint64_t v3;
  id v4;

  if (result)
  {
    v3 = result;
    v4 = *(id *)(result + 152);
    if (!v4)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(v3 + 152) = v4;
    }
    return objc_msgSend(v4, "addObject:", a2);
  }
  return result;
}

- (NSSQLEntity_DerivedAttributesExtension)derivedAttributesExtension
{
  NSSQLEntity_DerivedAttributesExtension *v1;

  if (result)
  {
    v1 = result;
    result = (NSSQLEntity_DerivedAttributesExtension *)result[6]._triggerSQL;
    if (!result)
    {
      result = -[NSSQLEntity_DerivedAttributesExtension initWithEntity:]([NSSQLEntity_DerivedAttributesExtension alloc], "initWithEntity:", v1);
      v1[6]._triggerSQL = (NSMutableArray *)result;
    }
  }
  return result;
}

- (void)_generateInverseRelationshipsAndMore
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  size_t v13;
  uint64_t v14;
  void *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  char *v21;
  size_t v22;
  unsigned int v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  size_t v27;
  uint64_t v28;
  size_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  size_t v41;
  uint64_t v42;
  char *v43;
  size_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  const __CFString *v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  int v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  NSSQLToOne *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  size_t v85;
  uint64_t v86;
  char *v87;
  size_t v88;
  uint64_t k;
  __CFString *v90;
  uint64_t Value;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t *v95;
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
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (uint64_t)result;
    v2 = objc_msgSend(result, "model");
    if (v2 && (*(_BYTE *)(v2 + 56) & 1) != 0)
    {
      v14 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)v14;
      v16 = *(unint64_t **)(v1 + 248);
      v17 = *v16;
      if ((uint64_t)*v16 >= 1)
      {
        if (v17 >= 0x201)
          v18 = 1;
        else
          v18 = *v16;
        v19 = 8 * v18;
        MEMORY[0x1E0C80A78](v14);
        v21 = (char *)&v92 - v20;
        if (v19 >= 0x200)
          v22 = 512;
        else
          v22 = v19;
        bzero(v21, v22);
        if (v17 > 0x200)
          v21 = (char *)NSAllocateScannedUncollectable();
        else
          bzero(v21, v19);
        v30 = *(_QWORD **)(v1 + 248);
        v31 = v30[1];
        if (v31 > 0)
        {
          v32 = 0;
          v33 = (uint64_t *)v30[9];
          do
          {
            v35 = *v33++;
            v34 = v35;
            v36 = v30[8];
            if (v36 != v35 && v34 != ~v36)
              *(_QWORD *)&v21[8 * v32++] = v34;
            --v31;
          }
          while (v31);
        }
        v38 = 0;
        do
          objc_msgSend(v15, "addObject:", _PF_Leopard_CFDictionaryGetValue(*(_QWORD **)(v1 + 248), *(__CFString **)&v21[8 * v38++]));
        while (v17 != v38);
        if (v17 >= 0x201)
          NSZoneFree(0, v21);
      }
      goto LABEL_81;
    }
    v3 = objc_msgSend((id)v1, "model");
    if (v3 && (*(_BYTE *)(v3 + 56) & 2) != 0)
    {
      v23 = objc_msgSend(*(id *)(v1 + 40), "count");
      if ((int)v23 >= 1)
      {
        v24 = PF_Tiger_CFDictionaryCreate(0, v23, 1);
        v8 = v24;
        v95 = &v92;
        v25 = v23;
        if (v23 >= 0x201uLL)
          v26 = 1;
        else
          v26 = v23;
        v27 = 8 * v26;
        MEMORY[0x1E0C80A78](v24);
        v12 = (char *)&v92 - v28;
        if (v27 >= 0x200)
          v29 = 512;
        else
          v29 = v27;
        bzero(v12, v29);
        v94 = v25;
        if (v25 > 0x200)
          v12 = (char *)NSAllocateScannedUncollectable();
        else
          bzero(v12, v27);
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v45 = *(void **)(v1 + 40);
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v104, v110, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v105;
          do
          {
            for (i = 0; i != v47; ++i)
            {
              if (*(_QWORD *)v105 != v48)
                objc_enumerationMutation(v45);
              PF_Tiger_CFDictionarySetValue((uint64_t)v8, *(const __CFString **)(*((_QWORD *)&v104 + 1) + 8 * i), objc_msgSend(*(id *)(v1 + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * i)));
            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v104, v110, 16);
          }
          while (v47);
        }
LABEL_78:
        PF_Tiger_CFDictionaryGetKeysAndValues((uint64_t)v8, 0, v12);
        v56 = v94;
        v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, v94);
        PF_Tiger_CFDictionaryDestroy(v8);
        if (v56 >= 0x201)
        {
          v57 = v12;
LABEL_80:
          NSZoneFree(0, v57);
        }
LABEL_81:
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        result = (void *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
        if (!result)
          return result;
        v58 = result;
        v59 = *(_QWORD *)v97;
        while (1)
        {
          v60 = 0;
          do
          {
            if (*(_QWORD *)v97 != v59)
              objc_enumerationMutation(v15);
            v61 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)v60);
            if (v61)
            {
              v62 = *(unsigned __int8 *)(v61 + 24);
              if ((v62 - 7) <= 2)
              {
                if (*(_QWORD *)(v61 + 56))
                {
                  if (v62 == 7 && *(_QWORD *)(v61 + 80))
                    goto LABEL_97;
                }
                else
                {
                  v63 = (void *)objc_msgSend((id)objc_msgSend((id)v61, "propertyDescription"), "inverseRelationship");
                  if (v63)
                  {
                    if (*(_BYTE *)(v61 + 24) == 9)
                      goto LABEL_101;
                    v64 = objc_msgSend((id)v61, "destinationEntity");
                    v65 = objc_msgSend(v63, "name");
                    if (v64)
                      v66 = (_QWORD *)objc_msgSend(*(id *)(v64 + 40), "objectForKey:", v65);
                    else
                      v66 = 0;
                    -[NSSQLRelationship _setInverseRelationship:]((_QWORD *)v61, v66);
                    if (*(_BYTE *)(v61 + 24) == 7)
                    {
LABEL_97:
                      -[NSSQLEntity _addForeignOrderKeyForToOne:entity:](v1, (id *)v61, (_QWORD *)v1);
                      goto LABEL_104;
                    }
                    if (objc_msgSend(v66, "entity") == v1)
                      objc_msgSend(v66, "isToMany");
                  }
                  else
                  {
                    if (objc_msgSend((id)v61, "isToMany"))
                    {
                      v67 = -[NSSQLEntity _addVirtualToOneForToMany:withInheritedProperty:](objc_msgSend((id)v61, "destinationEntity"), (_QWORD *)v61, 0);
                      -[NSSQLRelationship _setInverseRelationship:]((_QWORD *)v61, v67);
                      goto LABEL_104;
                    }
                    if (*(_BYTE *)(v61 + 24) == 9)
                    {
LABEL_101:
                      v68 = objc_msgSend((id)v61, "destinationEntity");
                      v69 = objc_msgSend(v63, "name");
                      if (v68)
                        v70 = objc_msgSend(*(id *)(v68 + 40), "objectForKey:", v69);
                      else
                        v70 = 0;
                      -[NSSQLManyToMany _setInverseManyToMany:]((_QWORD *)v61, v70);
                    }
                  }
                }
              }
            }
LABEL_104:
            v60 = (char *)v60 + 1;
          }
          while (v58 != v60);
          result = (void *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
          v58 = result;
          if (!result)
            return result;
        }
      }
    }
    else
    {
      v4 = *(_QWORD *)(v1 + 16);
      if (v4 && *(_BYTE *)(v4 + 65))
      {
        v5 = (void *)-[NSSQLModel _precomputedKeyOrderForEntity:](v4, (void *)v1);
        v6 = objc_msgSend(*(id *)(v1 + 40), "count");
        if ((int)v6 >= 1)
        {
          v7 = PF_Tiger_CFDictionaryCreate(0, v6, 1);
          v8 = v7;
          if (v6 >= 0x201uLL)
            v9 = 1;
          else
            v9 = v6;
          v10 = 8 * v9;
          MEMORY[0x1E0C80A78](v7);
          v12 = (char *)&v92 - v11;
          if (v10 >= 0x200)
            v13 = 512;
          else
            v13 = v10;
          bzero(v12, v13);
          v94 = v6;
          v95 = &v92;
          if (v6 > 0x200uLL)
            v12 = (char *)NSAllocateScannedUncollectable();
          else
            bzero(v12, v10);
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v50 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
          if (v50)
          {
            v51 = v50;
            v52 = *(_QWORD *)v101;
            do
            {
              for (j = 0; j != v51; ++j)
              {
                if (*(_QWORD *)v101 != v52)
                  objc_enumerationMutation(v5);
                v54 = *(const __CFString **)(*((_QWORD *)&v100 + 1) + 8 * j);
                v55 = objc_msgSend(*(id *)(v1 + 40), "objectForKey:", v54);
                if (v55)
                  PF_Tiger_CFDictionarySetValue((uint64_t)v8, v54, v55);
              }
              v51 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
            }
            while (v51);
          }
          goto LABEL_78;
        }
      }
      else
      {
        v39 = **(_QWORD **)(v1 + 248);
        if ((uint64_t)v39 >= 1)
        {
          v95 = &v92;
          if (v39 >= 0x201)
            v40 = 1;
          else
            v40 = v39;
          v41 = 8 * v40;
          MEMORY[0x1E0C80A78](v4);
          v43 = (char *)&v92 - v42;
          if (v41 >= 0x200)
            v44 = 512;
          else
            v44 = v41;
          bzero(v43, v44);
          if (v39 > 0x200)
            v43 = (char *)NSAllocateScannedUncollectable();
          else
            bzero(v43, v41);
          v71 = *(_QWORD **)(v1 + 248);
          v72 = v71[1];
          if (v72 >= 1)
          {
            v73 = 0;
            v74 = (uint64_t *)v71[9];
            do
            {
              v76 = *v74++;
              v75 = v76;
              v77 = v71[8];
              if (v77 != v76 && v75 != ~v77)
                *(_QWORD *)&v43[8 * v73++] = v75;
              --v72;
            }
            while (v72);
          }
          v79 = objc_msgSend(*(id *)(v1 + 40), "count");
          v80 = PF_Tiger_CFDictionaryCreate(0, v79, 1);
          v81 = v80;
          v93 = (int)v79;
          v94 = v79 << 32;
          if (v79 << 32)
            v82 = (int)v79;
          else
            v82 = 1;
          v83 = v79;
          if (v79 >= 0x201uLL)
            v84 = 1;
          else
            v84 = v82;
          v85 = 8 * v84;
          MEMORY[0x1E0C80A78](v80);
          v87 = (char *)&v92 - v86;
          if (v85 >= 0x200)
            v88 = 512;
          else
            v88 = v85;
          bzero(v87, v88);
          if (v83 > 0x200)
            v87 = (char *)NSAllocateScannedUncollectable();
          else
            bzero(v87, v85);
          for (k = 0; k != v39; ++k)
          {
            v90 = *(__CFString **)&v43[8 * k];
            Value = _PF_Leopard_CFDictionaryGetValue(*(_QWORD **)(v1 + 248), v90);
            PF_Tiger_CFDictionarySetValue((uint64_t)v81, v90, Value);
          }
          PF_Tiger_CFDictionaryGetKeysAndValues((uint64_t)v81, 0, v87);
          v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, v93);
          PF_Tiger_CFDictionaryDestroy(v81);
          if (HIDWORD(v94) >= 0x201)
            NSZoneFree(0, v87);
          if (v39 < 0x201)
            goto LABEL_81;
          v57 = v43;
          goto LABEL_80;
        }
      }
    }
    v15 = (void *)NSArray_EmptyArray;
    goto LABEL_81;
  }
  return result;
}

- (uint64_t)_addForeignOrderKeyForToOne:(_QWORD *)a3 entity:
{
  uint64_t v5;
  _WORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v5 = result;
  result = objc_msgSend(a2, "sourceEntity");
  if (!a2)
    return result;
  v6 = a2[10];
  if (!v6)
    return result;
  v7 = (_QWORD *)result;
  result = objc_msgSend(*(id *)(v5 + 40), "objectForKey:", objc_msgSend(a2[10], "name"));
  if (result)
    return result;
  objc_msgSend(*(id *)(v5 + 40), "setObject:forKey:", v6, objc_msgSend(v6, "name"));
  v8 = *(_QWORD **)(v5 + 248);
  if (v8)
    _PF_Leopard_CFDictionarySetValue(v8, (__CFString *)objc_msgSend(v6, "name"), v6);
  if (v7 != a3)
  {
    objc_msgSend(*(id *)(v5 + 104), "addObject:", v6);
    if (!a3)
      goto LABEL_10;
    goto LABEL_9;
  }
  -[NSSQLEntity _addColumnToFetch:]((_QWORD *)v5, v6);
  if (a3)
LABEL_9:
    a3 = (_QWORD *)a3[19];
LABEL_10:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(a3);
        -[NSSQLEntity _addForeignOrderKeyForToOne:entity:](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11), a2, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v9 = result;
    }
    while (result);
  }
  return result;
}

- (NSSQLToOne)_addVirtualToOneForToMany:(NSSQLToOne *)a3 withInheritedProperty:
{
  NSSQLToOne *v3;
  uint64_t v6;
  BOOL v7;
  int v8;
  _WORD *v9;
  NSSQLForeignEntityKey *foreignEntityKey;
  NSSQLForeignOrderKey *foreignOrderKey;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = a3;
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    v7 = *(_BYTE *)(v6 + 65) != 0;
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    *(_BYTE *)(v6 + 66) = 1;
    goto LABEL_6;
  }
  v7 = 0;
  v8 = 0;
  if (!a3)
  {
LABEL_6:
    v3 = -[NSSQLToOne initWithEntity:inverseToMany:]([NSSQLToOne alloc], "initWithEntity:inverseToMany:", a1, a2);
    v8 = 1;
  }
LABEL_7:
  v9 = -[NSSQLToOne foreignKey](v3, "foreignKey");
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, objc_msgSend(v9, "name"));
  if (!v7)
    _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(a1 + 248), (__CFString *)objc_msgSend(v9, "name"), v9);
  if (v8)
    -[NSSQLEntity _addColumnToFetch:]((_QWORD *)a1, v9);
  else
    objc_msgSend(*(id *)(a1 + 96), "addObject:", v9);
  if (v3)
  {
    foreignEntityKey = v3->_foreignEntityKey;
    if (foreignEntityKey)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", foreignEntityKey, -[NSSQLForeignEntityKey name](v3->_foreignEntityKey, "name"));
      if (!v7)
        _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(a1 + 248), (__CFString *)-[NSSQLForeignEntityKey name](foreignEntityKey, "name"), foreignEntityKey);
      if (v8)
        -[NSSQLEntity _addColumnToFetch:]((_QWORD *)a1, foreignEntityKey);
      else
        objc_msgSend(*(id *)(a1 + 88), "addObject:", foreignEntityKey);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, -[NSSQLRelationship name](v3, "name"));
  if (v7)
  {
    if (!v8)
      goto LABEL_21;
LABEL_24:
    -[NSSQLRelationship _setInverseRelationship:](v3, a2);

    if (!v3)
      goto LABEL_31;
LABEL_25:
    foreignOrderKey = v3->_foreignOrderKey;
    if (foreignOrderKey)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", foreignOrderKey, -[NSSQLForeignOrderKey name](v3->_foreignOrderKey, "name"));
      v12 = *(_QWORD **)(a1 + 248);
      if (v12)
        _PF_Leopard_CFDictionarySetValue(v12, (__CFString *)-[NSSQLForeignOrderKey name](foreignOrderKey, "name"), foreignOrderKey);
      if (v8)
        -[NSSQLEntity _addColumnToFetch:]((_QWORD *)a1, foreignOrderKey);
      else
        objc_msgSend(*(id *)(a1 + 104), "addObject:", foreignOrderKey);
    }
    goto LABEL_31;
  }
  _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(a1 + 248), (__CFString *)-[NSSQLRelationship name](v3, "name"), v3);
  if (v8)
    goto LABEL_24;
LABEL_21:
  if (v3)
    goto LABEL_25;
LABEL_31:
  v13 = *(void **)(a1 + 152);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        -[NSSQLEntity _addVirtualToOneForToMany:withInheritedProperty:](*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), a2, v3);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }
  return v3;
}

- (id)tableName
{
  return self->_tableName;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  NSSQLPrimaryKey *v5;
  uint64_t v6;
  NSSQLEntityKey *v7;
  unsigned int v8;

  self->_model = (NSSQLModel *)objc_msgSend(a3, "model");
  self->_entityDescription = (NSEntityDescription *)(id)objc_msgSend(a3, "entityDescription");
  self->_tableName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "tableName"), "copy");
  v5 = objc_alloc_init(NSSQLPrimaryKey);
  self->_primaryKey = v5;
  if (a3)
    v6 = *((_QWORD *)a3 + 16);
  else
    v6 = 0;
  -[NSSQLPrimaryKey copyValuesForReadOnlyFetch:](v5, "copyValuesForReadOnlyFetch:", v6);
  v7 = objc_alloc_init(NSSQLEntityKey);
  self->_entityKey = v7;
  if (a3)
  {
    -[NSSQLColumn copyValuesForReadOnlyFetch:](v7, "copyValuesForReadOnlyFetch:", *((_QWORD *)a3 + 17));
    self->_entityID = *((_DWORD *)a3 + 46);
    v8 = *((_DWORD *)a3 + 47);
  }
  else
  {
    -[NSSQLColumn copyValuesForReadOnlyFetch:](v7, "copyValuesForReadOnlyFetch:", 0);
    v8 = 0;
    self->_entityID = 0;
  }
  self->_subentityMaxID = v8;
  self->_columnsToFetch = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_attrColumns = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_ekColumns = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_fokColumns = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_fkColumns = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_properties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_rootEntity = self;
  self->_propertyMapping = (NSKnownKeysMappingStrategy *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
}

- (uint64_t)addPropertiesForReadOnlyFetch:(uint64_t)a3 keys:(void *)a4 context:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = result;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(a2);
          v11 = *(_QWORD **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v11)
            v11[2] = v6;
          v12 = objc_msgSend(v11, "propertyType");
          if (v12 == 7)
          {
            objc_msgSend(*(id *)(v6 + 40), "setObject:forKey:", v11, objc_msgSend(v11, "name"));
            if (v11)
            {
              v13 = v11[9];
              if (v13)
              {
                *(_QWORD *)(v13 + 16) = v6;
                -[NSSQLEntity _addColumnToFetch:]((_QWORD *)v6, (_WORD *)v13);
              }
            }
            v14 = objc_msgSend(v11, "foreignKey");
            if (v14)
              *(_QWORD *)(v14 + 16) = v6;
            -[NSSQLEntity _addColumnToFetch:]((_QWORD *)v6, (_WORD *)v14);
          }
          else
          {
            if (v12 != 1)
            {
              objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to add a non-attribute, non-to-one property to an entity: %@"), objc_msgSend(v11, "name")), 0), CFSTR("NSUnderlyingException"));
              return 0;
            }
            -[NSSQLEntity _addColumnToFetch:]((_QWORD *)v6, v11);
            objc_msgSend(*(id *)(v6 + 40), "setObject:forKey:", v11, objc_msgSend(v11, "name"));
          }
        }
        v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
    *(_QWORD *)(v6 + 240) = -[NSKnownKeysMappingStrategy initForKeys:]([NSKnownKeysMappingStrategy alloc], "initForKeys:", a3);
    return 1;
  }
  return result;
}

- (id)toManyRelationships
{
  __CFArray *propertiesAllToManysCache;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  propertiesAllToManysCache = (__CFArray *)self->_propertiesAllToManysCache;
  if (!propertiesAllToManysCache)
  {
    propertiesAllToManysCache = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)-[NSSQLEntity properties]((uint64_t)self);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v9, "isToMany", (_QWORD)v11))
            CFArrayAppendValue(propertiesAllToManysCache, v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    self->_propertiesAllToManysCache = (NSArray *)propertiesAllToManysCache;
  }
  return propertiesAllToManysCache;
}

- (id)manyToManyRelationships
{
  __CFArray *propertyManyToManyCache;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  propertyManyToManyCache = (__CFArray *)self->_propertyManyToManyCache;
  if (!propertyManyToManyCache)
  {
    propertyManyToManyCache = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)-[NSSQLEntity properties]((uint64_t)self);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_BYTE **)(*((_QWORD *)&v11 + 1) + 8 * v8);
          if (v9 && v9[24] == 9)
            CFArrayAppendValue(propertyManyToManyCache, v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    self->_propertyManyToManyCache = (NSArray *)propertyManyToManyCache;
  }
  return propertyManyToManyCache;
}

- (uint64_t)properties
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void **v7;
  CFArrayRef v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 48);
    if (!result)
    {
      v2 = (void *)objc_msgSend(*(id *)(v1 + 40), "allValues");
      v3 = objc_msgSend(v2, "count");
      v4 = MEMORY[0x1E0C80A78](v3);
      v7 = (const void **)((char *)v9 - v6);
      if (v4 > 0x200)
        v7 = (const void **)NSAllocateScannedUncollectable();
      else
        bzero((char *)v9 - v6, 8 * v5);
      objc_msgSend(v2, "getObjects:range:", v7, 0, v3);
      v8 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, v3, 0);
      if (v3 >= 0x201)
        NSZoneFree(0, v7);
      *(_QWORD *)(v1 + 48) = v8;
      return *(_QWORD *)(v1 + 48);
    }
  }
  return result;
}

- (void)dealloc
{
  CFTypeRef *fetch_entity_plan;
  _QWORD *odiousHashHackStorage;
  objc_super v5;

  if (self)
  {
    fetch_entity_plan = (CFTypeRef *)self->_fetch_entity_plan;
    if (fetch_entity_plan)
    {
      _deallocateFetchEntityPlan(fetch_entity_plan);
      self->_fetch_entity_plan = 0;
    }
  }
  odiousHashHackStorage = self->_odiousHashHackStorage;
  if (odiousHashHackStorage)
  {
    _PF_Leopard_CFDictionaryDestroy(odiousHashHackStorage);
    self->_odiousHashHackStorage = 0;
  }

  self->_superentity = 0;
  if (self->_propertyMapping)
  {

    self->_primaryKey = 0;
    self->_propertyMapping = 0;

    self->_entityKey = 0;
  }
  self->_subentities = 0;
  self->_tableName = 0;
  self->_columnsToFetch = 0;
  self->_columnsToFetchNoSubentities = 0;
  self->_fkColumns = 0;
  self->_ekColumns = 0;
  self->_fokColumns = 0;
  self->_attrColumns = 0;
  self->_entityDescription = 0;
  self->_properties = 0;
  self->_mappingGenerator = 0;
  self->_fetch_entity_plan = 0;
  self->_propertyAllCache = 0;
  self->_propertiesAllToManysCache = 0;
  self->_propertyManyToManyCache = 0;
  self->_multicolumnUniquenessConstraints = 0;
  self->_uniqueProperties = 0;
  self->_rtreeIndices = 0;
  self->_derivedAttributes = 0;
  self->_derivedAttributeExtension = 0;
  self->_compositeAttributeNameToSQLProperties = 0;
  self->_model = 0;
  v5.receiver = self;
  v5.super_class = (Class)NSSQLEntity;
  -[NSStoreMapping dealloc](&v5, sel_dealloc);
}

- (uint64_t)tempTableName
{
  if (result)
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TEMP_CD%@"), *(_QWORD *)(result + 32));
  return result;
}

+ (void)initialize
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    qword_1ECD8D7C0 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (void)entitySpecificPropertiesPassing:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((*(unsigned int (**)(uint64_t, uint64_t))(a2 + 16))(a2, objc_msgSend(v9, "propertyType")))
        {
          v10 = *(_QWORD *)(a1 + 160);
          v11 = objc_msgSend(v9, "name");
          if (!v10 || !objc_msgSend(*(id *)(v10 + 40), "objectForKey:", v11))
            objc_msgSend(v13, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  return v13;
}

uint64_t __39__NSSQLEntity_entitySpecificProperties__block_invoke(uint64_t a1, unsigned int a2)
{
  return (a2 < 0xA) & (0x382u >> a2);
}

BOOL __42__NSSQLEntity_entitySpecificRelationships__block_invoke(uint64_t a1, int a2)
{
  return (a2 - 7) < 3;
}

BOOL __39__NSSQLEntity_entitySpecificAttributes__block_invoke(uint64_t a1, int a2)
{
  return a2 == 1;
}

- (void)subhierarchyColumnMatching:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", objc_msgSend(a2, "name"));
  if (!v4
    || (v5 = v4, objc_msgSend(v4, "propertyType") != 1)
    || !objc_msgSend((id)objc_msgSend(a2, "propertyDescription"), "_isSchemaEqual:", objc_msgSend(v5, "propertyDescription"))|| (objc_msgSend((id)objc_msgSend(a2, "columnName"), "isEqual:", objc_msgSend(v5, "columnName")) & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = *(void **)(a1 + 152);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = -[NSSQLEntity subhierarchyColumnMatching:](*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), a2);
          if (v11)
            return (void *)v11;
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    return 0;
  }
  return v5;
}

- (uint64_t)_sqlPropertyWithRenamingIdentifier:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(*(id *)(result + 24), "propertiesByName");
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectForKey:", a2), "renamingIdentifier"), "isEqualToString:", a2))
    {
      return objc_msgSend(*(id *)(v3 + 40), "objectForKey:", a2);
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = (void *)objc_msgSend(v4, "allValues", 0);
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (result)
      {
        v6 = result;
        v7 = *(_QWORD *)v11;
        while (2)
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v5);
            v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
            if (objc_msgSend((id)objc_msgSend(v9, "renamingIdentifier"), "isEqualToString:", a2))
              return objc_msgSend(*(id *)(v3 + 40), "objectForKey:", objc_msgSend(v9, "name"));
            ++v8;
          }
          while (v6 != v8);
          result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          v6 = result;
          if (result)
            continue;
          break;
        }
      }
    }
  }
  return result;
}

uint64_t __34__NSSQLEntity__generateProperties__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  NSSQLAttribute *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (result)
  {
    v6 = result;
    v7 = 0x1E1EDA000uLL;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(a2);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isNSArray"))
        {
          v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v10, a3);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
            v13 = v7;
            v14 = objc_msgSend(v10, "elements");
            v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, objc_msgSend(v10, "name"));
            v16 = v14;
            v7 = v13;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v16, v15);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = objc_msgSend(v10, "name");
              v18 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, v17);
              if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v18))
              {
                v19 = -[NSSQLAttribute initWithEntity:propertyDescription:]([NSSQLAttribute alloc], "initWithEntity:propertyDescription:", *(_QWORD *)(a1 + 32), v10);
                -[NSSQLEntity _addColumnToFetch:](*(_QWORD **)(a1 + 32), v19);
                objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", v19, v18);
                if (!*(_BYTE *)(a1 + 72))
                  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v19, v18);
                if (objc_msgSend(*(id *)(a1 + 56), "_propertyType") == 6)
                  -[NSSQLEntity addDerivedAttribute:](*(_QWORD *)(a1 + 32), (uint64_t)v19);
                _PF_Leopard_CFDictionarySetValue(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 248), v18, v19);

              }
            }
          }
        }
        ++v9;
      }
      while (v6 != v9);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __35__NSSQLEntity__organizeConstraints__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (uint64_t)_collectFKSlots:(_QWORD *)a3 error:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v7 = (void *)objc_msgSend(*(id *)(a1 + 160), "foreignKeyColumns");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = a1;
  v8 = *(void **)(a1 + 96);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "slot");
        if (objc_msgSend(a2, "containsIndex:", v14)
          && (objc_msgSend(v7, "containsObject:", v13) & 1) == 0)
        {
          if (a3)
            *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend((id)objc_msgSend(v13, "toOneRelationship"), "propertyDescription"), CFSTR("relationship")));
          goto LABEL_22;
        }
        objc_msgSend(v6, "addIndex:", v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v10)
        continue;
      break;
    }
  }
  objc_msgSend(v6, "addIndexes:", a2);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = *(void **)(v22 + 152);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
LABEL_13:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v18)
        objc_enumerationMutation(v15);
      if ((-[NSSQLEntity _collectFKSlots:error:](*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19), v6, a3) & 1) != 0)
        break;
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        v20 = 0;
        if (v17)
          goto LABEL_13;
        goto LABEL_23;
      }
    }
LABEL_22:
    v20 = 1;
  }
  else
  {
    v20 = 0;
  }
LABEL_23:

  return v20;
}

- (uint64_t)_entityIsBroken:(uint64_t)a1
{
  id v5;
  uint64_t v6;

  if (!a1 || *(_QWORD *)(a1 + 168) != a1)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = -[NSSQLEntity _collectFKSlots:error:](a1, v5, a2);

  return v6;
}

- (uint64_t)sqlAttributesForCompositeAttributeName:(uint64_t)a1
{
  uint64_t v2;

  if (a1 && a2 && (v2 = objc_msgSend(*(id *)(a1 + 272), "objectForKey:", a2)) != 0)
    return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
  else
    return 0;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t entityID;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NSSQLEntity name](self, "name");
  if (self)
    entityID = self->_entityID;
  else
    entityID = 0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<NSSQLEntity %@ id=%d>"), v4, entityID);
}

- (_QWORD)rtreeIndexes
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    result = (_QWORD *)result[29];
    if (!result)
    {
      result = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v1[29] = result;
    }
  }
  return result;
}

- (id)indexForIndexDescription:(id *)result
{
  id *v3;

  if (result)
  {
    v3 = result;
    if (a2 && objc_msgSend(a2[2], "count") && !objc_msgSend((id)objc_msgSend(a2[2], "firstObject"), "collationType"))
      return (id *)-[NSSQLIndex initForIndexDescription:sqlEntity:]([NSSQLBinaryIndex alloc], "initForIndexDescription:sqlEntity:", a2, v3);
    else
      return (id *)objc_msgSend(v3[29], "objectForKey:", objc_msgSend(a2, "name"));
  }
  return result;
}

- (uint64_t)rtreeIndexForIndexNamed:(uint64_t)a1
{
  void *v3;

  if (!a1)
    return 0;
  v3 = *(void **)(a1 + 232);
  if (a2)
    return objc_msgSend(v3, "objectForKey:", a2);
  if (objc_msgSend(v3, "count") == 1)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 232), "allValues"), "firstObject");
  else
    return 0;
}

uint64_t __61__NSSQLEntity_DerivedAttributesExtension__generateTriggerSQL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)+[NSSQLDerivedAttributeSQLGenerator generateSQLForDerivedAttribute:keypaths:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", 0, 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "valueForKey:", CFSTR("dropStatements")), "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), "valueForKey:", CFSTR("dropStatements")));
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "valueForKey:", CFSTR("dataStatements")), "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), "valueForKey:", CFSTR("dataStatements")));
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "valueForKey:", CFSTR("triggerCreationStatements")), "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), "valueForKey:", CFSTR("triggerCreationStatements")));
}

@end
