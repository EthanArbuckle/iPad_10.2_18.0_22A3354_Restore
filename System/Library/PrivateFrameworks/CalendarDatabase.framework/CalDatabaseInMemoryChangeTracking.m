@implementation CalDatabaseInMemoryChangeTracking

+ (void)_setInterestedDatabasePaths:(id)a3 forContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  CalInMemoryTrackedDatabase *v24;
  void *v25;
  id obj;
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
  v5 = a3;
  v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_trackedDatabasesLock);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend((id)_trackedDatabases, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend((id)_trackedDatabases, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v5, "containsObject:", v11);
        objc_msgSend(v12, "clients");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          objc_msgSend(v14, "addObject:", v6);

          objc_msgSend(v5, "removeObject:", v11);
        }
        else
        {
          objc_msgSend(v14, "removeObject:", v6);

          if ((objc_msgSend(v12, "hasClients") & 1) == 0)
            objc_msgSend((id)_trackedDatabases, "removeObjectForKey:", v11);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }

  if (!_trackedDatabases)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = (void *)_trackedDatabases;
    _trackedDatabases = (uint64_t)v16;

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        v24 = objc_alloc_init(CalInMemoryTrackedDatabase);
        -[CalInMemoryTrackedDatabase clients](v24, "clients");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v6);

        objc_msgSend((id)_trackedDatabases, "setObject:forKeyedSubscript:", v24, v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_trackedDatabasesLock);
}

+ (void)setInterestedDatabases:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(a1, "pathForDatabase:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(a1, "_setInterestedDatabasePaths:forContext:", v8, v7, (_QWORD)v15);

}

+ (id)pathForDatabase:(CalDatabase *)a3
{
  __CFString *v4;
  void *v5;

  v4 = CalDatabaseCopyDirectoryPathForDatabase((uint64_t)a3);
  objc_msgSend(a1, "canonicalizePath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)canonicalizePath:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("/"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  return v3;
}

- (CalDatabaseInMemoryChangeTracking)init
{
  CalDatabaseInMemoryChangeTracking *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalDatabaseInMemoryChangeTracking;
  result = -[CalDatabaseInMemoryChangeTracking init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

+ (void)setInterestedDatabasePaths:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(a1, "canonicalizePath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(a1, "_setInterestedDatabasePaths:forContext:", v8, v7, (_QWORD)v15);

}

+ (void)cleanupDeallocatedClients
{
  objc_msgSend(a1, "_setInterestedDatabasePaths:forContext:", 0, 0);
}

+ (id)changeTrackingForDatabase:(CalDatabase *)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "pathForDatabase:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "changeTrackingForDatabaseWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)changeTrackingForDatabaseWithPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "canonicalizePath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_trackedDatabasesLock);
  objc_msgSend((id)_trackedDatabases, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&_trackedDatabasesLock);
  return v5;
}

- (void)clearAllChangesets
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_nextIndex = 0;
  self->_changeCount = 0;
  self->_lastPrunedTimestamp = CalMonotonicTime();
  os_unfair_lock_unlock(p_lock);
}

- (void)addChangeset:(__CFArray *)a3 deletes:(__CFArray *)a4 clientID:(unsigned int)a5 changeType:(unint64_t)a6
{
  char v6;
  uint64_t v7;
  int Count;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  unint64_t lastPrunedTimestamp;
  int v18;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  Count = CFArrayGetCount(a3);
  v12 = CFArrayGetCount(a4) + Count;
  if (v12 >= 513)
  {
    -[CalDatabaseInMemoryChangeTracking clearAllChangesets](self, "clearAllChangesets");
    return;
  }
  os_unfair_lock_lock(&self->_lock);
  v13 = self->_changeCount + v12;
  if (v13 >= 513)
  {
    if (1 - (v12 + self->_nextIndex) >= 0)
      v14 = -((1 - (v12 + self->_nextIndex)) & 0x1FF);
    else
      v14 = (v12 + self->_nextIndex - 1) & 0x1FF;
    self->_lastPrunedTimestamp = self->_changes[v14].timestamp;
  }
  v15 = CalMonotonicTime();
  v16 = -[CalDatabaseInMemoryChangeTracking _writeChanges:withTimestamp:flags:clientID:atIndex:](self, "_writeChanges:withTimestamp:flags:clientID:atIndex:", a4, v15, v6 & 3 | 4u, v7, -[CalDatabaseInMemoryChangeTracking _writeChanges:withTimestamp:flags:clientID:atIndex:](self, "_writeChanges:withTimestamp:flags:clientID:atIndex:", a3, v15, v6 & 3, v7, self->_nextIndex));
  self->_nextIndex = v16;
  if (v13 <= 512)
  {
    v18 = self->_changeCount + v12;
LABEL_17:
    self->_changeCount = v18;
    goto LABEL_18;
  }
  self->_changeCount = 512;
  lastPrunedTimestamp = self->_lastPrunedTimestamp;
  if (self->_changes[v16].timestamp == lastPrunedTimestamp)
  {
    v18 = 512;
    do
    {
      --v18;
      if (v16 == 511)
        v16 = 0;
      else
        ++v16;
    }
    while (self->_changes[v16].timestamp == lastPrunedTimestamp);
    goto LABEL_17;
  }
LABEL_18:
  os_unfair_lock_unlock(&self->_lock);
}

- (int)_writeChanges:(id)a3 withTimestamp:(unint64_t)a4 flags:(int)a5 clientID:(unsigned int)a6 atIndex:(int)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  $1A553942FAFCA5BD6C66782B992E980F *changes;
  unsigned int v17;
  uint64_t i;
  uint64_t v19;
  $1A553942FAFCA5BD6C66782B992E980F *v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    changes = self->_changes;
    v17 = ((a6 & 0x1FFFFF) << 8) | (a5 << 29);
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v20 = &changes[a7];
        v20->timestamp = a4;
        v21 = CalRecordIDGetEntityType(v19);
        *((_DWORD *)v20 + 3) = *((_DWORD *)v20 + 3) & 0xFFFFFF00 | internalEntityTypeFromExternalType(v21);
        v22 = CalRecordIDGetRowID(v19);
        v23 = v17 | *((unsigned __int8 *)v20 + 12);
        v20->rowID = v22;
        *((_DWORD *)v20 + 3) = v23;
        if (a7 == 511)
          a7 = 0;
        else
          ++a7;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  return a7;
}

- (id)changedEntityIDsBetweenMinExternalTimestamp:(unint64_t)a3 minSelfTimestamp:(unint64_t)a4 maxExternalTimestamp:(unint64_t)a5 allowIntegrationChanges:(BOOL)a6 latestSelfTimestamp:(unint64_t *)a7 client:(int)a8 changeType:(unint64_t *)a9 deleteOffset:(unint64_t *)a10
{
  unint64_t *v11;
  int changeCount;
  int nextIndex;
  int v14;
  $1A553942FAFCA5BD6C66782B992E980F *p_lastPrunedTimestamp;
  unint64_t *v16;
  unint64_t v17;
  int v19;
  BOOL v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  BOOL v29;
  int v30;
  int v31;
  int v32;
  int v33;
  __CFDictionary *Mutable;
  int v35;
  int v36;
  int v37;
  unint64_t v38;
  int v39;
  $1A553942FAFCA5BD6C66782B992E980F *changes;
  uint64_t v41;
  int v42;
  _BOOL4 v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  $1A553942FAFCA5BD6C66782B992E980F *v47;
  unint64_t timestamp;
  unint64_t v49;
  BOOL v50;
  int v52;
  int rowID;
  unsigned int Value;
  int v55;
  const __CFArray *ValueAtIndex;
  CFIndex Count;
  CFIndex v58;
  CFIndex v59;
  unsigned __int8 v60;
  const __CFDictionary *v61;
  uint64_t v62;
  size_t v63;
  void *v64;
  void *v65;
  unint64_t v66;
  uint64_t v67;
  int v68;
  unint64_t v69;
  uint64_t v70;
  _BOOL4 v74;
  _BOOL4 v76;
  int v77;
  _QWORD v78[7];
  _QWORD v79[4];
  unint64_t v80;
  unint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  CFMutableDictionaryRef v84;
  CFArrayRef v85;
  _QWORD context[3];

  v11 = a10;
  changeCount = self->_changeCount;
  if (changeCount < 1)
  {
    p_lastPrunedTimestamp = ($1A553942FAFCA5BD6C66782B992E980F *)&self->_lastPrunedTimestamp;
  }
  else
  {
    nextIndex = self->_nextIndex;
    if (nextIndex)
      v14 = nextIndex - 1;
    else
      v14 = 511;
    p_lastPrunedTimestamp = &self->_changes[v14];
  }
  v16 = a9;
  *a7 = p_lastPrunedTimestamp->timestamp;
  if (a10)
    *a10 = 0;
  if (a3 >= a4)
    v17 = a4;
  else
    v17 = a3;
  if (v17 < self->_lastPrunedTimestamp)
    return 0;
  if (changeCount)
  {
    v19 = self->_nextIndex;
    v20 = __OFSUB__(v19, changeCount);
    v21 = v19 - changeCount;
    if (v21 < 0 != v20)
      v22 = v21 + 512;
    else
      v22 = v21;
    v23 = changeCount - 1;
    v74 = a6;
    v24 = 0;
    if (changeCount > 1)
    {
      do
      {
        v25 = v23 + v24;
        if (v23 + v24 < 0 != __OFADD__(v23, v24))
          ++v25;
        v26 = v25 >> 1;
        v27 = v22 + (v25 >> 1);
        v28 = v27 & 0x1FF;
        v30 = -v27;
        v29 = v30 < 0;
        v31 = v30 & 0x1FF;
        if (v29)
          v32 = v28;
        else
          v32 = -v31;
        if (self->_changes[v32].timestamp > v17)
          v23 = v26;
        else
          v24 = v26 + 1;
      }
      while (v24 < v23);
    }
    v33 = changeCount - v24;
    Mutable = CFDictionaryCreateMutable(0, changeCount - v24, 0, 0);
    v84 = Mutable;
    v85 = 0;
    if (v33 >= 1)
    {
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v70 = 0;
      if (v24 + v22 <= 0)
        v39 = -(-(v24 + v22) & 0x1FF);
      else
        v39 = (v24 + v22) & 0x1FF;
      changes = self->_changes;
      v41 = 1;
      v43 = v74;
      v42 = a8;
      v45 = a4;
      v44 = a5;
      v46 = a3;
      while (1)
      {
        v47 = &changes[v39];
        timestamp = v47->timestamp;
        v49 = *((unsigned int *)v47 + 3);
        if (((v49 >> 8) & 0x1FFFFF) != v42)
          break;
        if (timestamp > v45)
          goto LABEL_40;
LABEL_69:
        if (v39 == 511)
          v39 = 0;
        else
          ++v39;
LABEL_72:
        if (++v35 == v33)
        {
          v61 = v84;
          v16 = a9;
          v11 = a10;
          v62 = v70;
          goto LABEL_78;
        }
      }
      v50 = timestamp <= v46 || timestamp > v44;
      if (v50)
        goto LABEL_69;
LABEL_40:
      if ((v49 & 0x60000000) == 0x40000000 && !v43)
        goto LABEL_72;
      v52 = *((_DWORD *)v47 + 3);
      rowID = changes[v39].rowID;
      v76 = v41 != ((v49 >> 29) & 3);
      v77 = v37;
      if ((v37 & 1) == 0)
        v41 = (v49 >> 29) & 3;
      v80 = 0;
      v81 = 0;
      v82 = 0;
      Value = CFDictionaryGetValue(v84, (const void *)rowID);
      LODWORD(v80) = Value;
      if (Value)
      {
        if ((Value & 0x80000000) == 0)
        {
          v55 = 0;
          while ((Value & 0x1F) != v52)
          {
            ++v55;
            v50 = Value > 0x3F;
            Value >>= 6;
            if (!v50)
            {
              LODWORD(v82) = v55;
              HIDWORD(v80) = -1;
              goto LABEL_58;
            }
          }
          HIDWORD(v80) = v55;
          if ((Value & 0x20) == 0)
          {
LABEL_63:
            if ((v49 & 0x80000000) != 0)
            {
              EntityDict_set(&v84, v49, rowID, (uint64_t)&v80, 1);
              ++v70;
              --v38;
            }
            goto LABEL_68;
          }
          goto LABEL_66;
        }
        v67 = v41;
        v68 = v36;
        v69 = v38;
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v85, Value & 0x7FFFFFFF);
        v81 = (unint64_t *)ValueAtIndex;
        Count = CFArrayGetCount(ValueAtIndex);
        if (Count >= 1)
        {
          v58 = Count;
          v59 = 0;
          while (1)
          {
            v60 = CFArrayGetValueAtIndex(ValueAtIndex, v59);
            if ((v60 & 0x1F) == v52)
              break;
            if (v58 == ++v59)
              goto LABEL_57;
          }
          HIDWORD(v80) = v59;
          v38 = v69;
          v36 = v68;
          v41 = v67;
          if ((v60 & 0x20) == 0)
            goto LABEL_63;
LABEL_66:
          if ((v49 & 0x80000000) != 0)
            goto LABEL_68;
          EntityDict_set(&v84, v49, rowID, (uint64_t)&v80, 0);
          --v70;
          goto LABEL_60;
        }
LABEL_57:
        HIDWORD(v80) = -1;
        v38 = v69;
        v36 = v68;
        v41 = v67;
      }
      else
      {
        v80 = 0xFFFFFFFF00000000;
        LODWORD(v82) = 0;
      }
LABEL_58:
      if ((v49 & 0x80000000) != 0)
      {
        EntityDict_set(&v84, v49, rowID, (uint64_t)&v80, 1);
        ++v70;
        goto LABEL_68;
      }
      EntityDict_set(&v84, v49, rowID, (uint64_t)&v80, 0);
LABEL_60:
      ++v38;
LABEL_68:
      v36 |= v77 & v76;
      v37 = 1;
      v43 = v74;
      v42 = a8;
      v45 = a4;
      v44 = a5;
      v46 = a3;
      goto LABEL_69;
    }
    v61 = Mutable;
    v62 = 0;
    v38 = 0;
    LOBYTE(v36) = 0;
    v41 = 1;
LABEL_78:
    v63 = 8 * (v38 + v62);
    v64 = malloc_type_malloc(v63, 0x100004000313F17uLL);
    v80 = 0;
    v81 = &v80;
    v82 = 0x2020000000;
    v83 = 0;
    v79[0] = 0;
    v79[1] = v79;
    v79[2] = 0x2020000000;
    v79[3] = v38;
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __194__CalDatabaseInMemoryChangeTracking_changedEntityIDsBetweenMinExternalTimestamp_minSelfTimestamp_maxExternalTimestamp_allowIntegrationChanges_latestSelfTimestamp_client_changeType_deleteOffset___block_invoke;
    v78[3] = &unk_1E4F90010;
    v78[5] = &v80;
    v78[6] = v64;
    v78[4] = v79;
    context[0] = &v84;
    context[1] = v78;
    CFDictionaryApplyFunction(v61, (CFDictionaryApplierFunction)_EntityDict_enumerate, context);
    CFRelease(v84);
    if (v85)
      CFRelease(v85);
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v64, v63, 1);
    if (v16)
    {
      if ((v36 & 1) != 0)
        v66 = 0;
      else
        v66 = v41;
      *v16 = v66;
    }
    if (v11)
      *v11 = v38;
    _Block_object_dispose(v79, 8);
    _Block_object_dispose(&v80, 8);
    return v65;
  }
  else
  {
    if (a9)
      *a9 = 1;
    return objc_alloc_init(MEMORY[0x1E0C99D50]);
  }
}

_QWORD *__194__CalDatabaseInMemoryChangeTracking_changedEntityIDsBetweenMinExternalTimestamp_minSelfTimestamp_maxExternalTimestamp_allowIntegrationChanges_latestSelfTimestamp_client_changeType_deleteOffset___block_invoke(_QWORD *result, int a2, int a3, int a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  if ((a2 - 1) > 0x13)
    v4 = -1;
  else
    v4 = dword_1A5DBB0F4[a2 - 1];
  v5 = result[6];
  if (a4)
  {
    *(_DWORD *)(v5 + 8 * *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24)) = v4;
    *(_DWORD *)(v5 + 8 * *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) + 4) = a3;
    v6 = result[4];
  }
  else
  {
    *(_DWORD *)(v5 + 8 * *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24)) = v4;
    *(_DWORD *)(v5 + 8 * *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) + 4) = a3;
    v6 = result[5];
  }
  ++*(_QWORD *)(*(_QWORD *)(v6 + 8) + 24);
  return result;
}

- (id)changedEntityIDsBetweenTimestamp:(id)a3 andTimestamp:(unint64_t)a4 allowIntegrationChanges:(BOOL)a5 latestTimestamp:(id *)a6 client:(unsigned int)a7 changeType:(unint64_t *)a8 deleteOffset:(unint64_t *)a9
{
  _BOOL8 v11;
  os_unfair_lock_s *p_lock;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CalSingleDatabaseInMemoryChangeTimestamp *v19;
  uint64_t v22;

  v11 = a5;
  p_lock = &self->_lock;
  v15 = a3;
  os_unfair_lock_lock(p_lock);
  v22 = 0;
  v16 = objc_msgSend(v15, "others");
  v17 = objc_msgSend(v15, "myself");

  -[CalDatabaseInMemoryChangeTracking changedEntityIDsBetweenMinExternalTimestamp:minSelfTimestamp:maxExternalTimestamp:allowIntegrationChanges:latestSelfTimestamp:client:changeType:deleteOffset:](self, "changedEntityIDsBetweenMinExternalTimestamp:minSelfTimestamp:maxExternalTimestamp:allowIntegrationChanges:latestSelfTimestamp:client:changeType:deleteOffset:", v16, v17, a4, v11, &v22, a7, a8, a9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    v19 = [CalSingleDatabaseInMemoryChangeTimestamp alloc];
    *a6 = -[CalSingleDatabaseInMemoryChangeTimestamp initWithTimestampForMyself:others:](v19, "initWithTimestampForMyself:others:", v22, a4);
  }
  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (id)changedEntityIDsForDatabase:(CalDatabase *)a3 sinceTimestamp:(id)a4 allowIntegrationChanges:(BOOL)a5 latestTimestamp:(id *)a6 changeType:(unint64_t *)a7 deleteOffset:(unint64_t *)a8
{
  _BOOL8 v11;
  os_unfair_lock_s *p_var9;
  id v15;
  unint64_t var21;
  uint64_t var22;
  void *v18;

  v11 = a5;
  p_var9 = &a3->var9;
  v15 = a4;
  os_unfair_lock_lock(p_var9);
  var21 = a3->var21;
  var22 = a3->var22;
  if (CDBLockingAssertionsEnabled)
    os_unfair_lock_assert_owner(p_var9);
  os_unfair_lock_unlock(p_var9);
  -[CalDatabaseInMemoryChangeTracking changedEntityIDsBetweenTimestamp:andTimestamp:allowIntegrationChanges:latestTimestamp:client:changeType:deleteOffset:](self, "changedEntityIDsBetweenTimestamp:andTimestamp:allowIntegrationChanges:latestTimestamp:client:changeType:deleteOffset:", v15, var21, v11, a6, var22, a7, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
