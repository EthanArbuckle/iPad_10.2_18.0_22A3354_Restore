@implementation NSStagedMigrationManager

- (NSStagedMigrationManager)initWithMigrationStages:(NSArray *)stages
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id v27;
  NSStagedMigrationManager *v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  NSArray *v46;
  NSStagedMigrationManager *v47;
  uint64_t v48;
  void *context;
  objc_super v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:"), "count");
  if (v5 != -[NSArray count](stages, "count"))
  {

    v39 = (void *)MEMORY[0x1E0C99DA0];
    v40 = *MEMORY[0x1E0C99778];
    v41 = CFSTR("Duplicate lightweight migration stages detected.");
    v42 = 0;
    goto LABEL_67;
  }
  v47 = self;
  if (!self)
    goto LABEL_64;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v48 = -[NSArray countByEnumeratingWithState:objects:count:](stages, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  v46 = stages;
  if (!v48)
  {
    v27 = 0;
    v26 = 1;
    goto LABEL_42;
  }
  v45 = 0;
  v9 = *(_QWORD *)v57;
LABEL_5:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v57 != v9)
      objc_enumerationMutation(stages);
    v11 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v10);
    context = (void *)MEMORY[0x18D76B4E4]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v12 = (void *)objc_msgSend(v11, "versionChecksums");
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, &v62, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v53;
        v44 = v9;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v53 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
            if (objc_msgSend(v6, "objectForKey:", v17)
              || objc_msgSend(v7, "objectForKey:", v17)
              || objc_msgSend(v8, "objectForKey:", v17))
            {
              objc_autoreleasePoolPop(context);
              goto LABEL_37;
            }
            objc_msgSend(v6, "setObject:forKey:", v17, v17);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, &v62, 16);
          stages = v46;
          v9 = v44;
          if (v14)
            continue;
          break;
        }
      }
      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
LABEL_23:
    objc_autoreleasePoolPop(context);
LABEL_28:
    if (++v10 == v48)
    {
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](stages, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      v48 = v25;
      if (!v25)
      {
        v26 = 1;
        goto LABEL_38;
      }
      goto LABEL_5;
    }
  }
  v51 = 0;
  objc_msgSend((id)objc_msgSend(v11, "currentModel"), "resolve:", &v51);
  v18 = v51;
  if (v51)
  {
    v19 = v9;
    goto LABEL_25;
  }
  v19 = v9;
  v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "currentModel"), "resolvedModel"), "versionChecksum");
  objc_msgSend((id)objc_msgSend(v11, "nextModel"), "resolve:", &v51);
  v18 = v51;
  if (v51)
  {
LABEL_25:
    v45 = v18;
    v21 = 0;
  }
  else
  {
    v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "nextModel"), "resolvedModel"), "versionChecksum");
    v43 = objc_msgSend(v7, "objectForKey:", v20);
    objc_msgSend(v7, "setObject:forKey:", v20, v20);
    v23 = objc_msgSend(v8, "objectForKey:", v22);
    objc_msgSend(v8, "setObject:forKey:", v22, v22);
    if (objc_msgSend(v6, "objectForKey:", v20)
      || (v24 = v22, v21 = (v23 | v43) == 0, objc_msgSend(v6, "objectForKey:", v24)))
    {
      v21 = 0;
    }
    stages = v46;
  }
  objc_msgSend((id)objc_msgSend(v11, "currentModel"), "unresolve");
  objc_msgSend((id)objc_msgSend(v11, "nextModel"), "unresolve");
  objc_autoreleasePoolPop(context);
  if (v21)
  {
    v9 = v19;
    goto LABEL_28;
  }
LABEL_37:
  v26 = 0;
LABEL_38:
  if (v45)
  {
    v27 = v45;
    v26 = 0;
  }
  else
  {
    v27 = 0;
  }
LABEL_42:

  if ((v26 & 1) == 0)
  {

    if (v27)
    {
      v60 = *MEMORY[0x1E0CB3388];
      v61 = v27;
      v42 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      goto LABEL_66;
    }
LABEL_64:
    v42 = 0;
LABEL_66:
    v39 = (void *)MEMORY[0x1E0C99DA0];
    v40 = *MEMORY[0x1E0C99778];
    v41 = CFSTR("Duplicate version checksums across stages detected.");
LABEL_67:
    objc_exception_throw((id)objc_msgSend(v39, "exceptionWithName:reason:userInfo:", v40, v41, v42));
  }
  v50.receiver = v47;
  v50.super_class = (Class)NSStagedMigrationManager;
  v28 = -[NSStagedMigrationManager init](&v50, sel_init);
  if (v28)
  {
    v29 = v46;
    v28->_stages = v29;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    if (v30)
    {
      v31 = v30;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v63 != v35)
            objc_enumerationMutation(v29);
          v37 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((v33 & 1) == 0)
              v34 = -[NSArray indexOfObject:](v28->_stages, "indexOfObject:", v37);
            ++v32;
            v33 = 1;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v34 >= v34 + v32)
              {
                v32 = 0;
              }
              else
              {
                do
                {
                  objc_msgSend(-[NSArray objectAtIndex:](v28->_stages, "objectAtIndex:", v34++), "setSubsequentStage:", v37);
                  --v32;
                }
                while (v32);
              }
              v33 = 0;
              v34 = 0;
            }
          }
        }
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      }
      while (v31);
    }
  }
  return v28;
}

- (int64_t)_findCurrentMigrationStageFromModelChecksum:(id)a3
{
  NSArray *stages;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  stages = self->_stages;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](stages, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(stages);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend((id)objc_msgSend(v11, "versionChecksums"), "indexOfObject:", a3) != 0x7FFFFFFFFFFFFFFFLL)
            return -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "currentModel"), "versionChecksum"), "isEqual:", a3))return -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v11);
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "nextModel"), "versionChecksum"), "isEqual:", a3))return -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v11) + 1;
          }
          else
          {
            v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "I don't know how to handle this type of migration stage %@");
            v13 = objc_opt_class();
            _NSCoreDataLog(17, v12, v14, v15, v16, v17, v18, v19, v13);
            v20 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v21 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v28 = v21;
              _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to handle this type of migration stage %@", buf, 0xCu);
            }
          }
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](stages, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v8)
        continue;
      break;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (BOOL)_shouldAttemptStagedMigrationWithStoreModelVersionChecksum:(id)a3 coordinatorModelVersionChecksum:(id)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString **v36;
  uint64_t *v37;
  id *v39;
  NSUInteger v40;
  NSUInteger v41;
  NSArray *obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint8_t buf[4];
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = self->_stages;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (!v9)
  {
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_24;
  }
  v10 = v9;
  v39 = a5;
  v11 = *(_QWORD *)v44;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v40 = 0x7FFFFFFFFFFFFFFFLL;
  v41 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v44 != v11)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend((id)objc_msgSend(v15, "versionChecksums"), "indexOfObject:", a3);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          v40 = -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v15);
        v16 = objc_msgSend((id)objc_msgSend(v15, "versionChecksums"), "indexOfObject:", a4);
        v13 = 0x7FFFFFFFFFFFFFFFLL;
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = v16;
          v41 = -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v15);
          v13 = v17;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "currentModel"), "versionChecksum"), "isEqual:", a3))v40 = -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v15);
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "currentModel"), "versionChecksum"), "isEqual:", a4) & 1) != 0
            || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "nextModel"), "versionChecksum"), "isEqual:", a4))
          {
            v41 = -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v15);
          }
        }
        else
        {
          v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "I don't know how to handle this type of migration stage %@");
          v19 = objc_opt_class();
          _NSCoreDataLog(17, v18, v20, v21, v22, v23, v24, v25, v19);
          v26 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v27 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v54 = v27;
            _os_log_fault_impl(&dword_18A253000, v26, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to handle this type of migration stage %@", buf, 0xCu);
          }
        }
      }
    }
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  }
  while (v10);
  v28 = v41;
  if (v41 == 0x7FFFFFFFFFFFFFFFLL)
  {
    a5 = v39;
    v29 = v40;
LABEL_24:
    v30 = *MEMORY[0x1E0CB28A8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52 = CFSTR("Cannot use staged migration with an unknown coordinator model version.");
    v31 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v30, 134504, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
    v32 = 0;
    v28 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_26;
  }
  v31 = 0;
  v32 = 1;
  a5 = v39;
  v29 = v40;
LABEL_26:
  if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_35;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v28 >= v29)
      goto LABEL_35;
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB28A8];
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = CFSTR("A store file cannot be migrated backwards with staged migration.");
    v35 = (void *)MEMORY[0x1E0C99D80];
    v36 = &v50;
    v37 = &v49;
    goto LABEL_34;
  }
  if (v28 <= v29 && v13 < v12)
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB28A8];
    v47 = *MEMORY[0x1E0CB2D50];
    v48 = CFSTR("A store file cannot be migrated backwards with staged migration.");
    v35 = (void *)MEMORY[0x1E0C99D80];
    v36 = &v48;
    v37 = &v47;
LABEL_34:
    v31 = (void *)objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 134506, objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, 1));
    v32 = 0;
  }
LABEL_35:
  if (a5)
    *a5 = v31;
  return v32;
}

- (void)dealloc
{
  objc_super v3;

  self->_stages = 0;
  self->_container = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSStagedMigrationManager;
  -[NSStagedMigrationManager dealloc](&v3, sel_dealloc);
}

- (NSArray)stages
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSPersistentContainer)container
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
