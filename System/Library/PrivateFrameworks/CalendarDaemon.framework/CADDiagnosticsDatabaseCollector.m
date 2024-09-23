@implementation CADDiagnosticsDatabaseCollector

- (void)determineExpectedOutputFiles:(id)a3
{
  id v4;
  id v5;
  CADDiagnosticsDatabaseCollectorDBInfo *v6;
  void *v7;
  CADDiagnosticsDatabaseCollectorDBInfo *v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CADDiagnosticsDatabaseCollectorDBInfo *v15;
  void *v16;
  CADDiagnosticsDatabaseCollectorDBInfo *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CADDiagnosticsDatabaseCollectorDBInfo *v23;
  CADDiagnosticsDatabaseCollector *v24;
  CADDiagnosticsDatabaseCollectorDBInfo *v25;
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
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = [CADDiagnosticsDatabaseCollectorDBInfo alloc];
  v7 = (void *)CalDatabaseCopyDirectoryPath();
  v8 = -[CADDiagnosticsDatabaseCollectorDBInfo initWithPossiblyUnmigratedDatabaseDirectory:context:](v6, "initWithPossiblyUnmigratedDatabaseDirectory:context:", v7, v4);

  if (v8)
    objc_msgSend(v5, "addObject:", v8);
  v9 = CalDatabaseCreateWithOptions();
  if (v9)
  {
    v10 = (const void *)v9;
    v24 = self;
    v25 = v8;
    v23 = -[CADDiagnosticsDatabaseCollectorDBInfo initWithMainDatabase:context:]([CADDiagnosticsDatabaseCollectorDBInfo alloc], "initWithMainDatabase:context:", v9, v4);
    objc_msgSend(v5, "addObject:");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)CalDatabaseCopyAllAuxDatabases();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(obj);
          v15 = -[CADDiagnosticsDatabaseCollectorDBInfo initWithMainDatabase:auxDatabase:context:]([CADDiagnosticsDatabaseCollectorDBInfo alloc], "initWithMainDatabase:auxDatabase:context:", v10, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v14), v4);
          objc_msgSend(v5, "addObject:", v15);
          v16 = (void *)CalAuxDatabaseCopyPath();
          v17 = -[CADDiagnosticsDatabaseCollectorDBInfo initWithPossiblyUnmigratedDatabaseDirectory:context:]([CADDiagnosticsDatabaseCollectorDBInfo alloc], "initWithPossiblyUnmigratedDatabaseDirectory:context:", v16, v4);
          if (v17)
            objc_msgSend(v5, "addObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v12);
    }

    CFRelease(v10);
    self = v24;
    v8 = v25;
  }
  else
  {
    objc_msgSend(v4, "logError:", CFSTR("Couldn't open main database; not going to be able to collect any databases."));
  }
  objc_storeStrong((id *)&self->_dbInfos, v5);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self->_dbInfos;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22++), "determineExpectedOutputFiles:", v4);
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

}

- (void)collect:(id)a3
{
  id v4;
  NSArray *v5;
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
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_dbInfos;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "collect:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbInfos, 0);
}

@end
