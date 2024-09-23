@implementation CCSetChangeRegistry

- (CCSetChangeRegistry)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCSetChangeRegistry)initWithFilename:(id)a3 directory:(id)a4 protectionClass:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  CCSetChangeRegistry *v12;
  CCDictionaryLog *v13;
  CCDictionaryLog *log;
  CCSetChangeRegistry *v15;
  objc_super v17;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CCSetChangeRegistry;
  v12 = -[CCSetChangeRegistry init](&v17, sel_init);
  if (v12
    && (v13 = -[CCDictionaryLog initWithFilename:protectionClass:directory:readOnly:create:error:]([CCDictionaryLog alloc], "initWithFilename:protectionClass:directory:readOnly:create:error:", v10, v7, v11, 0, 1, a6), log = v12->_log, v12->_log = v13, log, !v12->_log))
  {
    v15 = 0;
  }
  else
  {
    v15 = v12;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCSetChangeRegistry;
  -[CCSetChangeRegistry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" backed by: %@"), self->_log);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_keyForSet:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llx"), objc_msgSend(v3, "hash"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CCSetChangeRegistry _keyForSet:].cold.1((uint64_t)v3, v5);

    v4 = 0;
  }

  return v4;
}

- (id)bookmarkForSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v14;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_keyForSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_pendingUpdates, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      v8 = 0;
    }
    else if (self->_pendingClear
           || (-[CCDictionaryLog objectForKey:](self->_log, "objectForKey:", v5),
               (v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v8 = 0;
      v7 = 0;
    }
    else
    {
      v10 = (void *)v9;
      v14 = 0;
      -[CCSetChangeRegistry _unarchiveBookmark:error:](self, "_unarchiveBookmark:error:", v9, &v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      if (!v11)
      {
        __biome_log_for_category();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CCSetChangeRegistry bookmarkForSet:].cold.1((uint64_t)v4, (uint64_t)v8, v12);

      }
      v7 = v11;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)updateBookmark:(id)a3 forSet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSMutableDictionary *pendingUpdates;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0BA0];
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Unexpected bookmark: %@ for set: %@"), v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a5, v19);

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "_keyForSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v46 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to resolve key for set: %@ bookmark: %@"), v9, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a5, v22);

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_12;
    v34 = (void *)MEMORY[0x24BDD1540];
    v42 = *MEMORY[0x24BDD0BA0];
    v35 = (void *)MEMORY[0x24BDD17C8];
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("Unexpected bookmark value: %@ for set: %@"), v37, v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a5, v40);

LABEL_9:
    v23 = 0;
    goto LABEL_10;
  }
  v12 = (void *)objc_opt_class();
  objc_msgSend(v11, "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_keyForSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqual:", v14) & 1) == 0)
  {
    v41 = (void *)MEMORY[0x24BDD1540];
    v44 = *MEMORY[0x24BDD0BA0];
    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("Unexpected set: %@ (key: %@) for bookmark: %@ (key: %@)"), v30, v10, v11, v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a5, v33);

    goto LABEL_9;
  }

LABEL_12:
  pendingUpdates = self->_pendingUpdates;
  if (!pendingUpdates)
  {
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v27 = self->_pendingUpdates;
    self->_pendingUpdates = v26;

    pendingUpdates = self->_pendingUpdates;
  }
  -[NSMutableDictionary setObject:forKey:](pendingUpdates, "setObject:forKey:", v8, v10);
  v23 = 1;
LABEL_10:

  return v23;
}

- (void)clearAllBookmarks
{
  NSMutableDictionary *pendingUpdates;

  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = 0;

  self->_pendingClear = 1;
}

- (void)rollbackAllBookmarkUpdates
{
  NSMutableDictionary *pendingUpdates;

  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = 0;

  self->_pendingClear = 0;
}

- (BOOL)commitAllBookmarkUpdates:(id *)a3
{
  NSMutableDictionary **p_pendingUpdates;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  CCDictionaryLog *log;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (self->_pendingClear && !-[CCSetChangeRegistry _clear:](self, "_clear:", a3))
  {
    -[CCSetChangeRegistry rollbackAllBookmarkUpdates](self, "rollbackAllBookmarkUpdates");
    return 0;
  }
  else
  {
    p_pendingUpdates = &self->_pendingUpdates;
    if (self->_pendingUpdates)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableDictionary count](*p_pendingUpdates, "count"));
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableDictionary count](*p_pendingUpdates, "count"));
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[NSMutableDictionary allKeys](*p_pendingUpdates, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_pendingUpdates, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[CCSetChangeRegistry _archiveBookmark:error:](self, "_archiveBookmark:error:", v13, a3);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
            {
              v16 = 0;
              goto LABEL_18;
            }
            objc_msgSend(v6, "addObject:", v12);
            objc_msgSend(v7, "addObject:", v14);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v9)
            continue;
          break;
        }
      }

      log = self->_log;
      v21 = 0;
      v16 = -[CCDictionaryLog writeUpdatedObjects:forKeys:error:](log, "writeUpdatedObjects:forKeys:error:", v7, v6, &v21);
      obj = v21;
      if (!v16)
      {
        __biome_log_for_category();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[CCSetChangeRegistry commitAllBookmarkUpdates:].cold.2((uint64_t *)&self->_pendingUpdates, (uint64_t)obj, v17);

        CCSetError(a3, obj);
      }
LABEL_18:
      -[CCSetChangeRegistry rollbackAllBookmarkUpdates](self, "rollbackAllBookmarkUpdates");

    }
    else
    {
      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CCSetChangeRegistry commitAllBookmarkUpdates:].cold.1(v18);

      -[CCSetChangeRegistry rollbackAllBookmarkUpdates](self, "rollbackAllBookmarkUpdates");
      return 1;
    }
  }
  return v16;
}

- (BOOL)_clear:(id *)a3
{
  CCDictionaryLog *log;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  log = self->_log;
  v15 = 0;
  v5 = -[CCDictionaryLog clear:](log, "clear:", &v15);
  v6 = v15;
  if (!v5)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CCSetChangeRegistry _clear:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    CCSetError(a3, v6);
  }

  return v5;
}

- (BOOL)cleanupWithAllSets:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  char v27;
  objc_class *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  CCDictionaryLog *log;
  BOOL v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  BOOL v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v64;
  void *v65;
  id *v66;
  NSObject *obj;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  _BYTE v86[128];
  uint64_t v87;
  void *v88;
  uint8_t v89[128];
  uint8_t buf[4];
  _BYTE v91[10];
  _BYTE v92[10];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CCDictionaryLog allKeys](self->_log, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v91 = objc_msgSend(v7, "count");
    *(_WORD *)&v91[4] = 1024;
    *(_DWORD *)&v91[6] = objc_msgSend(v6, "count");
    *(_WORD *)v92 = 2112;
    *(_QWORD *)&v92[2] = v6;
    _os_log_impl(&dword_237B25000, v8, OS_LOG_TYPE_DEFAULT, "Starting cleanup with %u registry entries and %u available sets: %@", buf, 0x18u);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v10 = v6;
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v77 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
        objc_msgSend((id)objc_opt_class(), "_keyForSet:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v38 = (void *)MEMORY[0x24BDD1540];
          v87 = *MEMORY[0x24BDD0BA0];
          v39 = (void *)MEMORY[0x24BDD17C8];
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("Unexpected set: %@"), v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v42;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          CCSetError(a4, v44);

          v37 = 0;
          v36 = v10;
          goto LABEL_45;
        }
        v17 = (void *)v16;
        objc_msgSend(v9, "setObject:forKey:", v15, v16);

      }
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    }
    while (v12);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v7;
  v69 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
  if (!v69)
    goto LABEL_32;
  v68 = *(_QWORD *)v73;
  v65 = v7;
  v66 = a4;
  while (2)
  {
    for (j = 0; j != v69; ++j)
    {
      if (*(_QWORD *)v73 != v68)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j);
      -[CCDictionaryLog objectForKey:](self->_log, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCSetChangeRegistry _unarchiveBookmark:error:](self, "_unarchiveBookmark:error:", v20, a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_44;
      objc_msgSend(v21, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      objc_msgSend(v21, "value");
      v24 = objc_claimAutoreleasedReturnValue();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v9, "objectForKey:", v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = +[CCSetChangeBookmark currentBookmarkVersion](CCSetChangeBookmark, "currentBookmarkVersion");
          if (-[NSObject bookmarkVersion](v24, "bookmarkVersion") == (_DWORD)v26)
          {

LABEL_29:
            a4 = v66;
            goto LABEL_30;
          }
          v53 = (void *)MEMORY[0x24BDD1540];
          v82 = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Registry contains a bookmark with invalid software version (expected %d): %@"), v26, v24);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v54;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          CCSetError(v66, v56);

        }
        else
        {
          v30 = +[CCDatabaseSetChangeEnumerator sharedItemCountFromBookmark:](CCDatabaseSetChangeEnumerator, "sharedItemCountFromBookmark:", v24);
          v31 = +[CCDatabaseSetChangeEnumerator localItemInstanceCountFromBookmark:](CCDatabaseSetChangeEnumerator, "localItemInstanceCountFromBookmark:", v24);
          if (!(v30 | v31))
          {
            log = self->_log;
            v71 = 0;
            v33 = -[CCDictionaryLog clearObjectForKey:error:](log, "clearObjectForKey:error:", v19, &v71);
            v34 = v71;
            if (v33)
            {
              __biome_log_for_category();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v91 = v24;
                _os_log_impl(&dword_237B25000, v35, OS_LOG_TYPE_DEFAULT, "Registry bookmark cleaned up: %@", buf, 0xCu);
              }

              goto LABEL_29;
            }
            CCSetError(v66, v34);

            goto LABEL_43;
          }
          v57 = v31;
          v70 = (void *)MEMORY[0x24BDD1540];
          v84 = *MEMORY[0x24BDD0BA0];
          v58 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v30);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v57);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "stringWithFormat:", CFSTR("Registry bookmark reflects non-removed state: {shared items: %@, local instances: %@} for a set which is no longer available: %@"), v59, v64, v24);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v60;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, v61);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          __biome_log_for_category();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v91 = self;
            *(_WORD *)&v91[8] = 2112;
            *(_QWORD *)v92 = v54;
            _os_log_impl(&dword_237B25000, v62, OS_LOG_TYPE_DEFAULT, "Inconsistency detected in registry: %@ error: %@", buf, 0x16u);
          }

          CCSetError(v66, v54);
        }

LABEL_43:
        goto LABEL_44;
      }
      objc_opt_class();
      v27 = objc_opt_isKindOfClass();

      if ((v27 & 1) == 0)
      {
        v45 = (void *)MEMORY[0x24BDD1540];
        v80 = *MEMORY[0x24BDD0BA0];
        v46 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v21, "value");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("Unexpected bookmark value: %@ of bookmark: %@ key: %@"), v49, v21, v19);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v50;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        CCSetError(a4, v52);

LABEL_44:
        v37 = 0;
        v7 = v65;
        v36 = obj;
        goto LABEL_45;
      }
      __biome_log_for_category();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v91 = v29;
        *(_WORD *)&v91[8] = 2112;
        *(_QWORD *)v92 = v19;
        _os_log_debug_impl(&dword_237B25000, v24, OS_LOG_TYPE_DEBUG, "Skipping cleanup for serialized set bookmark (%@) key: %@", buf, 0x16u);

      }
LABEL_30:

    }
    v7 = v65;
    v69 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
    if (v69)
      continue;
    break;
  }
LABEL_32:

  __biome_log_for_category();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B25000, v36, OS_LOG_TYPE_DEFAULT, "Cleanup completed successfully", buf, 2u);
  }
  v37 = 1;
LABEL_45:

  return v37;
}

- (BOOL)clearAllBookmarksAndCommit:(id *)a3
{
  -[CCSetChangeRegistry rollbackAllBookmarkUpdates](self, "rollbackAllBookmarkUpdates");
  -[CCSetChangeRegistry clearAllBookmarks](self, "clearAllBookmarks");
  return -[CCSetChangeRegistry commitAllBookmarkUpdates:](self, "commitAllBookmarkUpdates:", a3);
}

- (BOOL)enumerateAllBookmarks:(id *)a3 usingBlock:(id)a4
{
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  NSObject *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id *v32;
  void (**v33)(id, void *, void *);
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v33 = (void (**)(id, void *, void *))a4;
  -[CCDictionaryLog allKeys](self->_log, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v40) = objc_msgSend(v6, "count");
    _os_log_impl(&dword_237B25000, v7, OS_LOG_TYPE_DEFAULT, "Enumerating %u registry entries", buf, 8u);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (!v9)
  {
    v23 = 1;
    v11 = v8;
    goto LABEL_21;
  }
  v10 = v9;
  v32 = a3;
  v11 = 0;
  v12 = *(_QWORD *)v36;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      v14 = v11;
      if (*(_QWORD *)v36 != v12)
        objc_enumerationMutation(v8);
      v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
      v16 = (void *)MEMORY[0x23B82079C]();
      -[CCDictionaryLog objectForKey:](self->_log, "objectForKey:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v11;
      -[CCSetChangeRegistry _unarchiveBookmark:error:](self, "_unarchiveBookmark:error:", v17, &v34);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v34;

      if (!v18)
      {
        objc_autoreleasePoolPop(v16);

        __biome_log_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[CCSetChangeRegistry enumerateAllBookmarks:usingBlock:].cold.1((uint64_t)v11, v24, v25, v26, v27, v28, v29, v30);

        CCSetError(v32, v11);
        v23 = 0;
        goto LABEL_21;
      }
      objc_msgSend(v18, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v18, "value");
        v21 = objc_claimAutoreleasedReturnValue();
        -[NSObject set](v21, "set");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2](v33, v22, v18);
      }
      else
      {
        __biome_log_for_category();
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        objc_msgSend(v18, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v22;
        _os_log_impl(&dword_237B25000, v21, OS_LOG_TYPE_DEFAULT, "Skipping bookmark: %@", buf, 0xCu);
      }

LABEL_14:
      objc_autoreleasePoolPop(v16);
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v10)
      continue;
    break;
  }

  v23 = 1;
LABEL_21:

  return v23;
}

- (id)descriptionForBookmark:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "value");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "description");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = (void *)MEMORY[0x24BDD17C8];
    if ((isKindOfClass & 1) == 0)
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Unsupported bookmark: %@"), v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Serialized set bookmark: %@"), v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v5;
LABEL_9:

  return v8;
}

- (id)_unarchiveBookmark:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  CCSetChangeRegistry *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD14B0], "bm_allowedClassesForSecureCodingBMBookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v7, v6, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (!v8)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v6;
      v15 = 2112;
      v16 = self;
      v17 = 2112;
      v18 = v9;
      _os_log_error_impl(&dword_237B25000, v10, OS_LOG_TYPE_ERROR, "Failed to unarchive bookmark (%@) from registry: %@ error: %@", buf, 0x20u);
    }

    CCSetError(a4, v9);
  }

  return v8;
}

- (id)_archiveBookmark:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  CCSetChangeRegistry *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (!v7)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v13 = v6;
      v14 = 2112;
      v15 = self;
      v16 = 2112;
      v17 = v8;
      _os_log_error_impl(&dword_237B25000, v9, OS_LOG_TYPE_ERROR, "Failed to archive bookmark (%@) to registry: %@ error: %@", buf, 0x20u);
    }

    CCSetError(a4, v8);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

+ (void)_keyForSet:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v4;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_0_2(&dword_237B25000, a2, v7, "Unexpected set class: %@ expected: %@", (uint8_t *)&v8);

}

- (void)bookmarkForSet:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_2(&dword_237B25000, a3, (uint64_t)a3, "failed to unarchive bookmark for set: %@ error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)commitAllBookmarkUpdates:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_237B25000, log, OS_LOG_TYPE_DEBUG, "No pending updates to commit", v1, 2u);
}

- (void)commitAllBookmarkUpdates:(NSObject *)a3 .cold.2(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_0_2(&dword_237B25000, a3, (uint64_t)a3, "Failed to commit pending updates: %@ error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)_clear:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_237B25000, a2, a3, "Failed to commit clear registry: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)enumerateAllBookmarks:(uint64_t)a3 usingBlock:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_237B25000, a2, a3, "Failed to complete bookmark enumeration: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
