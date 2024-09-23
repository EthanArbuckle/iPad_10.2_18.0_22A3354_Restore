@implementation CADDiagnosticsCalDAVTrafficLogCollector

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
  char v15;
  uint64_t v16;
  void *v17;
  NSArray *orderedOutputURLs;
  void *v19;
  CADDiagnosticsCalDAVTrafficLogCollector *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CADDiagnosticsCalDAVTrafficLogCollector findAllLogFiles:](self, "findAllLogFiles:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "log:", CFSTR("Found %lu traffic logs"), objc_msgSend(v5, "count"));
  v19 = v5;
  -[CADDiagnosticsCalDAVTrafficLogCollector _filteredLogsFromAllLogs:context:](self, "_filteredLogsFromAllLogs:context:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "log:", CFSTR("Including %lu traffic logs"), objc_msgSend(v6, "count"));
  v20 = self;
  objc_storeStrong((id *)&self->_orderedInputURLs, v6);
  v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "redactLogs"))
        {
          objc_msgSend(v13, "pathExtension");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("gz"));

          if ((v15 & 1) == 0)
          {
            objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("gz"));
            v16 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v16;
          }
        }
        objc_msgSend(v4, "temporaryFileForName:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setStatus:forFile:", 0, v17);
        -[NSArray addObject:](v7, "addObject:", v17);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  orderedOutputURLs = v20->_orderedOutputURLs;
  v20->_orderedOutputURLs = v7;

}

- (id)findAllLogFiles:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;
  id v19;
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
    objc_msgSend(v3, "logError:", CFSTR("Unable to find traffic logs: %@"), v7);
  v17 = v7;
  v18 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_opt_class(), "_shouldIncludeLogWithFilename:", v14) & 1) != 0)
        {
          objc_msgSend(v8, "URLByAppendingPathComponent:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v3, "log:", CFSTR("Found log file %@"), v14);
            objc_msgSend(v19, "addObject:", v15);
          }
          else
          {
            objc_msgSend(v3, "logError:", CFSTR("Unable to construct URL for file %@; skipping"), v14);
          }

        }
        else
        {
          objc_msgSend(v3, "log:", CFSTR("Ignoring irrelevant file %@"), v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v11);
  }

  return v19;
}

+ (BOOL)_shouldIncludeLogWithFilename:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("-latest")) & 1) != 0
    || !objc_msgSend(v3, "hasPrefix:", CFSTR("CalDAVHTTPTraffic.")))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "containsString:", CFSTR("com.apple.remindd")) ^ 1;
  }

  return v4;
}

- (id)_filteredLogsFromAllLogs:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  if (-[CADDiagnosticsCalDAVTrafficLogCollector limitedLogs](self, "limitedLogs"))
    -[CADDiagnosticsCalDAVTrafficLogCollector _limitedLogsFromAllFiles:context:](self, "_limitedLogsFromAllFiles:context:", v7, v6);
  else
    -[CADDiagnosticsCalDAVTrafficLogCollector _recentLogsFromAllFiles:context:](self, "_recentLogsFromAllFiles:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_limitedLogsFromAllFiles:(id)a3 context:(id)a4
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
  -[CADDiagnosticsCalDAVTrafficLogCollector parseFilenameDates:context:](self, "parseFilenameDates:context:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __76__CADDiagnosticsCalDAVTrafficLogCollector__limitedLogsFromAllFiles_context___block_invoke;
  v15 = &unk_1E6A37848;
  v10 = v9;
  v16 = v10;
  objc_msgSend(v8, "sortUsingComparator:", &v12);
  if ((unint64_t)objc_msgSend(v8, "count") >= 0xB)
  {
    objc_msgSend(v6, "log:", CFSTR("Too many traffic logs; only including the most recent %i"),
      10,
      v12,
      v13,
      v14,
      v15);
    objc_msgSend(v8, "removeObjectsInRange:", 10, objc_msgSend(v8, "count") - 10);
  }

  return v8;
}

uint64_t __76__CADDiagnosticsCalDAVTrafficLogCollector__limitedLogsFromAllFiles_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (id)_recentLogsFromAllFiles:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__CADDiagnosticsCalDAVTrafficLogCollector__recentLogsFromAllFiles_context___block_invoke;
  v16[3] = &unk_1E6A37CA8;
  v17 = v5;
  v18 = v9;
  v10 = v8;
  v19 = v10;
  v11 = v9;
  v12 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);

  v13 = v19;
  v14 = v10;

  return v14;
}

void __75__CADDiagnosticsCalDAVTrafficLogCollector__recentLogsFromAllFiles_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  v3 = a2;
  v14 = 0;
  v4 = *MEMORY[0x1E0C998D8];
  v13 = 0;
  v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v14, v4, &v13);
  v6 = v14;
  v7 = v13;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceDate:", v6);
    if (v8 <= 604800.0)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
      goto LABEL_7;
    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v3, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "log:", CFSTR("Excluding log %@ because it is too old"), v10);
  }
  else
  {
    v11 = *(void **)(a1 + 32);
    v12 = v6;
    objc_msgSend(v3, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logError:", CFSTR("Failed to get last modified date for file %@ (%@). Skipping it."), v10, v7);
  }

LABEL_7:
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
  uint64_t v12;
  uint64_t v13;
  CADDiagnosticsCalDAVTrafficLogCollector *v14;
  void *v15;
  int v16;
  id v17;
  char v18;
  uint64_t v19;
  NSArray *obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_orderedInputURLs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      v19 = v6;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        -[NSArray objectAtIndexedSubscript:](self->_orderedOutputURLs, "objectAtIndexedSubscript:", v7 + v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "redactLogs"))
        {
          if (+[CalDAVTrafficLogScrubber redactLog:toOutputFile:context:](CalDAVTrafficLogScrubber, "redactLog:toOutputFile:context:", v10, v11, v4))
          {
            goto LABEL_11;
          }
        }
        else
        {
          v12 = v7;
          v13 = v8;
          v14 = self;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0;
          v16 = objc_msgSend(v15, "copyItemAtURL:toURL:error:", v10, v11, &v21);
          v17 = v21;

          if (v16)
          {

            self = v14;
            v8 = v13;
            v7 = v12;
            v6 = v19;
LABEL_11:
            objc_msgSend(v4, "setStatus:forFile:", 2, v11);
            goto LABEL_13;
          }
          objc_msgSend(v4, "logError:", CFSTR("Failed to copy log from %@ to %@: %@"), v10, v11, v17);

          self = v14;
          v8 = v13;
          v7 = v12;
          v6 = v19;
        }
LABEL_13:
        v18 = objc_msgSend(v4, "canceled");

        if ((v18 & 1) != 0)
          goto LABEL_16;
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v7 += v9;
    }
    while (v6);
  }
LABEL_16:

}

- (BOOL)limitedLogs
{
  return self->_limitedLogs;
}

- (void)setLimitedLogs:(BOOL)a3
{
  self->_limitedLogs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedOutputURLs, 0);
  objc_storeStrong((id *)&self->_orderedInputURLs, 0);
}

@end
