@implementation NSSQLModel

- (BOOL)_generateModel:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSSQLEntity *v17;
  void *v18;
  unsigned int entityIDOffset;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t ii;
  id *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t jj;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t kk;
  _BYTE *v55;
  void *v56;
  uint64_t mm;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  char v61;
  _QWORD *v62;
  uint64_t v63;
  id v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  id v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  id *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
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
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v78 = a3;
  v130 = *MEMORY[0x1E0C80C00];
  v81 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v82 = -[NSSQLModel managedObjectModel](self, "managedObjectModel");
  v6 = -[NSManagedObjectModel _sortedEntitiesForConfiguration:](v82, 0);
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v117, v129, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v118 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * i), "name", v78));
      }
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v117, v129, 16);
    }
    while (v10);
  }
  v80 = v7;
  self->_entitiesByName = (NSKnownKeysDictionary *)-[NSKnownKeysDictionary initForKeys:]([NSKnownKeysDictionary alloc], "initForKeys:", v8);

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v113, v128, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v114;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v114 != v15)
          objc_enumerationMutation(v6);
        v17 = -[NSSQLEntity initWithModel:entityDescription:]([NSSQLEntity alloc], "initWithModel:entityDescription:", self, *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * j));
        -[NSKnownKeysDictionary setObject:forKey:](self->_entitiesByName, "setObject:forKey:", v17, -[NSSQLEntity name](v17, "name"));

      }
      v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v113, v128, 16);
    }
    while (v14);
  }
  v18 = (void *)-[NSKnownKeysDictionary allValues](self->_entitiesByName, "allValues", v78);
  entityIDOffset = self->_entityIDOffset;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
  if (v20)
  {
    v21 = v20;
    v22 = entityIDOffset + 1;
    v23 = *(_QWORD *)v110;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v110 != v23)
          objc_enumerationMutation(v18);
        v25 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
        if (!objc_msgSend((id)objc_msgSend(v25, "entityDescription"), "superentity"))
          v22 = -[NSSQLEntity _generateIDWithSuperEntity:nextID:]((uint64_t)v25, 0, v22);
      }
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
    }
    while (v21);
  }
  v83 = a4;
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v26 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v106;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v106 != v28)
          objc_enumerationMutation(v18);
        v30 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * m);
        v31 = (void *)MEMORY[0x18D76B4E4]();
        if (v30)
        {
          if (!*(_QWORD *)(v30 + 160))
            -[NSSQLEntity _generateProperties]((_QWORD *)v30);
          v32 = *(_DWORD *)(v30 + 184);
          if (v32 > self->_lastEntityID)
            self->_lastEntityID = v32;
        }
        objc_autoreleasePoolPop(v31);
      }
      v27 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
    }
    while (v27);
  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v33 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v101, v125, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v102;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v102 != v35)
          objc_enumerationMutation(v18);
        v37 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * n);
        v38 = (void *)MEMORY[0x18D76B4E4]();
        -[NSSQLEntity _generateInverseRelationshipsAndMore](v37);
        objc_autoreleasePoolPop(v38);
      }
      v34 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v101, v125, 16);
    }
    while (v34);
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v39 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v97, v124, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v98;
    do
    {
      for (ii = 0; ii != v40; ++ii)
      {
        if (*(_QWORD *)v98 != v41)
          objc_enumerationMutation(v18);
        v43 = *(id **)(*((_QWORD *)&v97 + 1) + 8 * ii);
        -[NSSQLEntity _generateMulticolumnUniquenessConstraints](v43);
        v44 = -[NSSQLEntity _generateAttributeDerivations:]((uint64_t)v43, (uint64_t *)a4);
        if (!v44)
          return v44;
      }
      v40 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v97, v124, 16);
    }
    while (v40);
  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v45 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v123, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v94;
    do
    {
      for (jj = 0; jj != v46; ++jj)
      {
        if (*(_QWORD *)v94 != v47)
          objc_enumerationMutation(v18);
        v49 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * jj);
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        v50 = (void *)objc_msgSend(v49, "attributes");
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v89, v122, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v90;
          do
          {
            for (kk = 0; kk != v52; ++kk)
            {
              if (*(_QWORD *)v90 != v53)
                objc_enumerationMutation(v50);
              v55 = *(_BYTE **)(*((_QWORD *)&v89 + 1) + 8 * kk);
              if (v55 && v55[24] == 1)

            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v89, v122, 16);
          }
          while (v52);
        }
      }
      v46 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v123, 16);
    }
    while (v46);
  }
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v80);
  if (v80)
  {
    for (mm = 0; mm != v80; ++mm)
      objc_msgSend(v56, "addObject:", objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_entities, "objectAtIndex:", mm), "name"));
  }

  self->_entitiesByName = (NSKnownKeysDictionary *)-[NSKnownKeysDictionary initForKeys:]([NSKnownKeysDictionary alloc], "initForKeys:", v56);
  if (v79)
  {
    v58 = objc_msgSend((id)objc_msgSend(v82, "entitiesForConfiguration:"), "valueForKey:", CFSTR("name"));
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v58);
  }
  else
  {
    v59 = 0;
  }
  v88 = 0;
  if (v80)
  {
    v60 = 0;
    v61 = 0;
    while (1)
    {
      v62 = (_QWORD *)-[NSMutableArray objectAtIndex:](self->_entities, "objectAtIndex:", v60);
      v63 = objc_msgSend(v62, "name");
      if (!v59 || objc_msgSend(v59, "containsObject:", v63))
        -[NSKnownKeysDictionary setObject:forKey:](self->_entitiesByName, "setObject:forKey:", v62, v63);
      if (self->_retainLeopardStyleDictionaries)
        goto LABEL_80;
      if (v62)
        break;
LABEL_93:
      if (v80 == ++v60)
        goto LABEL_96;
    }
    v65 = (_QWORD *)v62[31];
    if (v65)
    {
      _PF_Leopard_CFDictionaryDestroy(v65);
      v62[31] = 0;
      if (self->_retainLeopardStyleDictionaries)
      {
LABEL_80:
        if (!(!self->_hasVirtualToOnes | v61 & 1))
        {
          if (-[NSSQLEntity _entityIsBroken:]((uint64_t)v62, &v88))
          {
            if (v88)
              v64 = v88;
            v61 = 1;
          }
          else
          {
            v61 = 0;
          }
        }
        if (!v62)
          goto LABEL_93;
      }
    }
    if (!v62[20])
      -[NSSQLEntity _organizeConstraints]((uint64_t)v62);
    goto LABEL_93;
  }
  v61 = 0;
LABEL_96:
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v66 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v84, v121, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v85;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v85 != v68)
          objc_enumerationMutation(v82);
        v70 = *(_QWORD **)(*((_QWORD *)&v84 + 1) + 8 * v69);
        if (v70)
          v71 = v70[20];
        else
          v71 = 0;
        self->_entityDescriptionToSQLMap[v71] = (id)-[NSKnownKeysDictionary objectForKey:](self->_entitiesByName, "objectForKey:", objc_msgSend(v70, "name"));
        ++v69;
      }
      while (v67 != v69);
      v72 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v84, v121, 16);
      v67 = v72;
    }
    while (v72);
  }

  objc_msgSend(v81, "drain");
  v73 = self->_retainLeopardStyleDictionaries & v61;
  if (v73 == 1)
  {
    if (v83)
    {
      v74 = (void *)MEMORY[0x1E0CB35C8];
      v75 = *MEMORY[0x1E0CB28A8];
      if (v88)
        v76 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v88, *MEMORY[0x1E0CB3388]);
      else
        v76 = 0;
      *v83 = (id)objc_msgSend(v74, "errorWithDomain:code:userInfo:", v75, 134060, v76);
    }

  }
  LOBYTE(v44) = v73 ^ 1;
  return v44;
}

- (id)managedObjectModel
{
  return self->_mom;
}

- (id)entityNamed:(id)a3
{
  return (id)-[NSKnownKeysDictionary objectForKey:](self->_entitiesByName, "objectForKey:", a3);
}

- (id)entityForID:(unint64_t)a3
{
  return (id)CFArrayGetValueAtIndex((CFArrayRef)self->_entities, ~(unint64_t)self->_entityIDOffset + a3);
}

- (uint64_t)_precomputedKeyOrderForEntity:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    if (*(_BYTE *)(result + 65)
      && (v2 = *(_QWORD *)(result + 24), v3 = objc_msgSend(a2, "entityDescription"), v2)
      && (v4 = *(_QWORD *)(v2 + 16)) != 0)
    {
      if (v3)
        v5 = *(_QWORD *)(v3 + 160);
      else
        v5 = 0;
      return *(_QWORD *)(v4 + 8 * v5);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (NSSQLModel)initWithManagedObjectModel:(id)a3 configurationName:(id)a4
{
  return (NSSQLModel *)-[NSSQLModel initWithManagedObjectModel:configurationName:retainHashHack:brokenHashVersion:](self, a3, a4, 0, 0);
}

- (void)dealloc
{
  id *entityDescriptionToSQLMap;
  NSMutableArray *entities;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  entityDescriptionToSQLMap = self->_entityDescriptionToSQLMap;
  if (entityDescriptionToSQLMap)
  {
    PF_FREE_OBJECT_ARRAY(entityDescriptionToSQLMap);
    self->_entityDescriptionToSQLMap = 0;
  }
  entities = self->_entities;
  if (entities)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](entities, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(entities);
          CFRelease(*(CFTypeRef *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](entities, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
    CFRelease(self->_entities);
    self->_entities = 0;
  }

  self->_configuration = 0;
  self->_entitiesByName = 0;

  self->_mom = 0;
  v9.receiver = self;
  v9.super_class = (Class)NSSQLModel;
  -[NSStoreMapping dealloc](&v9, sel_dealloc);
}

- (id)initWithManagedObjectModel:(void *)a3 configurationName:(char)a4 retainHashHack:(uint64_t)a5 brokenHashVersion:
{
  id v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  objc_super v21;

  if (!a1)
    return 0;
  v21.receiver = a1;
  v21.super_class = (Class)NSSQLModel;
  v9 = objc_msgSendSuper2(&v21, sel_init);
  if (v9)
  {
    *((_QWORD *)v9 + 2) = objc_msgSend(a3, "copy");
    *((_QWORD *)v9 + 3) = a2;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v9 + 5) = v10;
    if (v10)
    {
      CFRetain(v10);

    }
    *((_QWORD *)v9 + 6) = PF_CALLOC_OBJECT_ARRAY(objc_msgSend((id)objc_msgSend(a2, "entitiesByName"), "count"));
    *((_QWORD *)v9 + 7) = a5;
    *((_BYTE *)v9 + 64) = a4;
    v11 = a2 && a2[2] != 0;
    *((_BYTE *)v9 + 65) = v11;
    *((_DWORD *)v9 + 17) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(a2, "_modelsReferenceIDOffset")), "unsignedIntValue");
    *((_DWORD *)v9 + 18) = 0;
    v20 = 0;
    if (!objc_msgSend(v9, "_generateModel:error:", a3, &v20))
    {
      if (PFUseToolchainBehaviors())
        v18 = 4;
      else
        v18 = 2;
      _NSCoreDataLog(v18, (uint64_t)CFSTR("Unable to generate optimized model (sql model generation failed %@)"), v12, v13, v14, v15, v16, v17, v20);

      return 0;
    }
  }
  return v9;
}

- (NSSQLModel)initWithManagedObjectModel:(id)a3 configurationName:(id)a4 brokenHashVersion:(unint64_t)a5
{
  return (NSSQLModel *)-[NSSQLModel initWithManagedObjectModel:configurationName:retainHashHack:brokenHashVersion:](self, a3, a4, 0, a5);
}

- (NSSQLModel)initWithManagedObjectModel:(id)a3 configurationName:(id)a4 retainHashHack:(BOOL)a5
{
  return (NSSQLModel *)-[NSSQLModel initWithManagedObjectModel:configurationName:retainHashHack:brokenHashVersion:](self, a3, a4, a5, 0);
}

- (id)configurationName
{
  return self->_configuration;
}

- (void)_sqlEntityWithRenamingIdentifier:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  if (v4)
  {
    v5 = v4;
    if ((objc_msgSend(a2, "isEqualToString:", objc_msgSend((id)objc_msgSend(v4, "entityDescription"), "renamingIdentifier")) & 1) != 0)return v5;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v13;
LABEL_6:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v9)
      objc_enumerationMutation(v6);
    v5 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "entityDescription"), "renamingIdentifier"), "isEqualToString:", a2) & 1) != 0)return v5;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v5 = 0;
      if (v8)
        goto LABEL_6;
      return v5;
    }
  }
}

@end
