@implementation CADDiagnosticsCalDAVSpotlightLogCollector

- (void)determineExpectedOutputFiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSArray *orderedOutputURLs;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CADDiagnosticsCalDAVSpotlightLogCollector findAllLogFiles:](self, "findAllLogFiles:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "log:", CFSTR("Found %lu spotlight logs"), objc_msgSend(v5, "count"));
  -[CADDiagnosticsCalDAVSpotlightLogCollector sortAndTrimLogFiles:context:](self, "sortAndTrimLogFiles:context:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "log:", CFSTR("Including %lu spotlight logs"), objc_msgSend(v6, "count"));
  objc_storeStrong((id *)&self->_orderedInputURLs, v6);
  v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "temporaryFileForName:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setStatus:forFile:", 0, v14);
        -[NSArray addObject:](v7, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  orderedOutputURLs = self->_orderedOutputURLs;
  self->_orderedOutputURLs = v7;

}

- (id)findAllLogFiles:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  DACustomLogDirectory();
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;

  if (!v6)
    objc_msgSend(v3, "logError:", CFSTR("Unable to find spotlight logs: %@"), v7);
  v16 = v7;
  v17 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("SpotlightLog"))
          && (objc_msgSend(v13, "containsString:", CFSTR("-latest")) & 1) == 0)
        {
          objc_msgSend(v19, "URLByAppendingPathComponent:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v3, "log:", CFSTR("Found log file %@"), v13);
            objc_msgSend(v18, "addObject:", v14);
          }
          else
          {
            objc_msgSend(v3, "logError:", CFSTR("Unable to construct URL for file %@; skipping"), v13);
          }

        }
        else
        {
          objc_msgSend(v3, "log:", CFSTR("Ignoring irrelevant file %@"), v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v10);
  }

  return v18;
}

- (id)sortAndTrimLogFiles:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[CADDiagnosticsCalDAVSpotlightLogCollector parseFilenameDates:context:](self, "parseFilenameDates:context:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __73__CADDiagnosticsCalDAVSpotlightLogCollector_sortAndTrimLogFiles_context___block_invoke;
  v15 = &unk_1E6A37848;
  v10 = v9;
  v16 = v10;
  objc_msgSend(v8, "sortUsingComparator:", &v12);
  if ((unint64_t)objc_msgSend(v8, "count") >= 0x15)
  {
    objc_msgSend(v6, "log:", CFSTR("Too many spotlight logs; only including the most recent %i"),
      20,
      v12,
      v13,
      v14,
      v15);
    objc_msgSend(v8, "removeObjectsInRange:", 20, objc_msgSend(v8, "count") - 20);
  }

  return v8;
}

uint64_t __73__CADDiagnosticsCalDAVSpotlightLogCollector_sortAndTrimLogFiles_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = objc_msgSend(v13, "compare:", v10);
  return v14;
}

- (id)parseFilenameDates:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v17;
  uint64_t v18;
  void *v19;
  id v21;
  void *v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = a4;
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v6, "setDateStyle:", 1);
  v22 = v6;
  objc_msgSend(v6, "setDateFormat:", CFSTR("yyyy_MM_dd_HH_mm_ssZZZ"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "rangeOfString:", CFSTR(".log"));
        v14 = objc_msgSend(v12, "rangeOfString:", CFSTR("_"));
        if (v13 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0x7FFFFFFFFFFFFFFFLL || v14 >= v13)
        {
          objc_msgSend(v24, "logError:", CFSTR("Unexpected log file name: %@"), v12);
        }
        else
        {
          objc_msgSend(v12, "substringWithRange:", v14 + 1, v13 + ~v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dateFromString:", v17);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v18)
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, v11);
          else
            objc_msgSend(v24, "logError:", CFSTR("Couldn't parse %@ into a date"), v17);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  return v21;
}

- (void)collect:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  char v15;
  NSArray *obj;
  CADDiagnosticsCalDAVSpotlightLogCollector *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = self;
  obj = self->_orderedInputURLs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
      -[NSArray objectAtIndexedSubscript:](v17->_orderedOutputURLs, "objectAtIndexedSubscript:", v7 + v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v13 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v10, v11, &v18);
      v14 = v18;

      if ((v13 & 1) != 0)
        objc_msgSend(v4, "setStatus:forFile:", 2, v11);
      else
        objc_msgSend(v4, "logError:", CFSTR("Failed to copy log from %@ to %@: %@"), v10, v11, v14);
      v15 = objc_msgSend(v4, "canceled");

      if ((v15 & 1) != 0)
        break;
      if (v6 == ++v9)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v7 += v9;
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedOutputURLs, 0);
  objc_storeStrong((id *)&self->_orderedInputURLs, 0);
}

@end
