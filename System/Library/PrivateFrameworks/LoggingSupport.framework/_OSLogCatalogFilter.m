@implementation _OSLogCatalogFilter

- (BOOL)containsUUID:(id)a3
{
  return -[NSMutableSet containsObject:](self->_uuidAccept, "containsObject:", a3);
}

- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "expressionType") == 3)
  {
    objc_msgSend(v9, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("processID")) & 1) != 0
      || objc_msgSend(v7, "isEqualToString:", CFSTR("processIdentifier")))
    {
      objc_msgSend(v6, "constantValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogCatalogFilter addProcessID:](self, "addProcessID:", v8);
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("process")) & 1) != 0
           || objc_msgSend(v7, "isEqualToString:", CFSTR("processImagePath")))
    {
      objc_msgSend(v6, "constantValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogCatalogFilter addProcessLookupSubstr:](self, "addProcessLookupSubstr:", v8);
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("sender")) & 1) != 0
           || objc_msgSend(v7, "isEqualToString:", CFSTR("senderImagePath")))
    {
      objc_msgSend(v6, "constantValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogCatalogFilter addSenderLookupSubstr:](self, "addSenderLookupSubstr:", v8);
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("subsystem")))
        goto LABEL_12;
      objc_msgSend(v6, "constantValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogCatalogFilter addSubsystem:](self, "addSubsystem:", v8);
    }

LABEL_12:
  }

}

- (void)addSubsystem:(id)a3
{
  self->_hasItems = 1;
  -[NSMutableSet addObject:](self->_subsysSubstrAccept, "addObject:", a3);
}

- (BOOL)isKeptCatalog:(catalog_s *)a3
{
  _QWORD *v4;
  uint64_t v6;
  os_trace_str_map_s *var2;
  os_procinfo_map_s *var4;
  _QWORD v10[2];
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  _OSLogCatalogFilter *v13;
  uint64_t *v14;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_hasItems && !self->_hasSharedCacheItems)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __37___OSLogCatalogFilter_isKeptCatalog___block_invoke;
    v16[3] = &unk_1E4157358;
    v16[4] = self;
    v16[5] = &v17;
    _catalog_for_each_uuid((uint64_t)a3, (uint64_t)v16);
    if (*((_BYTE *)v18 + 24))
      goto LABEL_6;
    var2 = a3->var2;
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_2;
    v15[3] = &unk_1E4157380;
    v15[4] = self;
    v15[5] = &v17;
    _os_trace_str_map_for_each((uint64_t)var2, (uint64_t)v15);
    if (*((_BYTE *)v18 + 24))
    {
LABEL_6:
      LOBYTE(v4) = 1;
    }
    else
    {
      var4 = a3->var4;
      v10[0] = v6;
      v10[1] = 3221225472;
      v11 = __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_3;
      v12 = &unk_1E41573A8;
      v13 = self;
      v14 = &v17;
      if (var4)
      {
        v4 = (_QWORD *)*((_QWORD *)var4 + 2);
        if (v4)
        {
          do
          {
            v11((uint64_t)v10, v4[4]);
            v4 = (_QWORD *)*v4;
          }
          while (v4);
          LOBYTE(v4) = *((_BYTE *)v18 + 24) != 0;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return (char)v4;
}

- (BOOL)containsSubsystemSubstr:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  v5 = self->_subsysSubstrAccept;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "localizedStandardContainsString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsProcessID:(id)a3
{
  return -[NSMutableSet containsObject:](self->_pidAccept, "containsObject:", a3);
}

- (void)visitPredicate:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[_OSLogCatalogFilter processComparisonPredicate:](self, "processComparisonPredicate:", v4);

}

- (void)processComparisonPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "leftExpression");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_OSLogCatalogFilter processLeftExpression:andRightExpression:](self, "processLeftExpression:andRightExpression:", v6, v5);
  -[_OSLogCatalogFilter processLeftExpression:andRightExpression:](self, "processLeftExpression:andRightExpression:", v5, v6);

}

- (_OSLogCatalogFilter)initWithPredicate:(id)a3 collection:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  _OSLogCatalogFilter *v14;
  NSMutableSet *v15;
  NSMutableSet *pidAccept;
  NSMutableSet *v17;
  NSMutableSet *processLookupSubstr;
  NSMutableSet *v19;
  NSMutableSet *senderLookupSubstr;
  NSMutableSet *v21;
  NSMutableSet *subsysSubstrAccept;
  NSMutableSet *v23;
  NSMutableSet *uuidAccept;
  void *v25;
  _OSLogCatalogFilter *v26;
  objc_super v28;
  char __s1[1024];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = getenv("LOG_USE_CATALOGFILTER");
  if (v8 && !strcmp(v8, "0"))
    goto LABEL_10;
  objc_msgSend(v7, "UUIDTextReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileDescriptor");

  if (fcntl(v10, 50, __s1, 1024) == -1)
  {
    __error();
    _os_assumes_log();
LABEL_10:
    v26 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4165008);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4165020);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4165038);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)_OSLogCatalogFilter;
  v14 = -[_OSLogCatalogFilter init](&v28, sel_init);
  if (v14)
  {
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pidAccept = v14->_pidAccept;
    v14->_pidAccept = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    processLookupSubstr = v14->_processLookupSubstr;
    v14->_processLookupSubstr = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    senderLookupSubstr = v14->_senderLookupSubstr;
    v14->_senderLookupSubstr = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    subsysSubstrAccept = v14->_subsysSubstrAccept;
    v14->_subsysSubstrAccept = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    uuidAccept = v14->_uuidAccept;
    v14->_uuidAccept = v23;

    v14->_uuidtext_path = strdup(__s1);
    _OSLogGetSimplePredicate(v6, v11, v12, v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "acceptVisitor:flags:", v14, 0);
    if (v14->_hasItems)
      -[_OSLogCatalogFilter generateUUIDSet](v14, "generateUUIDSet");

  }
  self = v14;

  v26 = self;
LABEL_11:

  return v26;
}

- (void)generateUUIDSet
{
  if (-[NSMutableSet count](self->_processLookupSubstr, "count")
    || -[NSMutableSet count](self->_senderLookupSubstr, "count"))
  {
    -[_OSLogCatalogFilter readDSOUUIDs](self, "readDSOUUIDs");
  }
  if (-[NSMutableSet count](self->_senderLookupSubstr, "count"))
    -[_OSLogCatalogFilter readDSCUUIDs](self, "readDSCUUIDs");
}

- (void)dealloc
{
  objc_super v3;

  free(self->_uuidtext_path);
  v3.receiver = self;
  v3.super_class = (Class)_OSLogCatalogFilter;
  -[_OSLogCatalogFilter dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidAccept, 0);
  objc_storeStrong((id *)&self->_subsysSubstrAccept, 0);
  objc_storeStrong((id *)&self->_senderLookupSubstr, 0);
  objc_storeStrong((id *)&self->_processLookupSubstr, 0);
  objc_storeStrong((id *)&self->_pidAccept, 0);
}

- (void)addProcessID:(id)a3
{
  self->_hasItems = 1;
  -[NSMutableSet addObject:](self->_pidAccept, "addObject:", a3);
}

- (void)addUUID:(id)a3
{
  -[NSMutableSet addObject:](self->_uuidAccept, "addObject:", a3);
}

- (void)addProcessLookupSubstr:(id)a3
{
  self->_hasItems = 1;
  -[NSMutableSet addObject:](self->_processLookupSubstr, "addObject:", a3);
}

- (void)addSenderLookupSubstr:(id)a3
{
  self->_hasItems = 1;
  -[NSMutableSet addObject:](self->_senderLookupSubstr, "addObject:", a3);
}

- (BOOL)containsProcessLookupSubstr:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  v5 = self->_processLookupSubstr;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "localizedStandardContainsString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsSenderLookupSubstr:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  v5 = self->_senderLookupSubstr;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "localizedStandardContainsString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)readDSOUUIDs
{
  FTS *v3;
  FTS *v4;
  uint64_t v5;
  FTSENT *v6;
  FTSENT *v7;
  int fts_level;
  unint64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  char *v13[3];

  v13[2] = *(char **)MEMORY[0x1E0C80C00];
  v13[0] = self->_uuidtext_path;
  v13[1] = 0;
  v3 = fts_open(v13, 2, 0);
  if (v3)
  {
    v4 = v3;
    v5 = MEMORY[0x1E0C80978];
LABEL_3:
    while (1)
    {
      v6 = fts_read(v4);
      if (!v6)
        break;
      v7 = v6;
      fts_level = (unsigned __int16)v6->fts_level;
      if (fts_level == 2)
      {
        if (v6->fts_info == 8
          && strlen(v6->fts_name) == 30
          && (v7->fts_name[0] & 0x80000000) == 0
          && (*(_DWORD *)(v5 + 4 * v7->fts_name[0] + 60) & 0x10000) != 0)
        {
          v9 = 0;
          while (v9 != 29)
          {
            v10 = v9;
            v11 = v7->fts_name[v9 + 1];
            if ((v11 & 0x80000000) == 0)
            {
              v12 = *(_DWORD *)(v5 + 4 * v11 + 60);
              v9 = v10 + 1;
              if ((v12 & 0x10000) != 0)
                continue;
            }
            if (v10 < 0x1D)
              goto LABEL_3;
            break;
          }
          -[_OSLogCatalogFilter handleDSOFile:](self, "handleDSOFile:", v7);
        }
      }
      else if (fts_level == 1
             && (v6->fts_info != 1
              || strlen(v6->fts_name) != 2
              || v7->fts_name[0] < 0
              || (*(_DWORD *)(v5 + 4 * v7->fts_name[0] + 60) & 0x10000) == 0
              || v7->fts_name[1] < 0
              || (*(_DWORD *)(v5 + 4 * v7->fts_name[1] + 60) & 0x10000) == 0))
      {
        fts_set(v4, v7, 4);
      }
    }
    fts_close(v4);
  }
  else
  {
    _os_assumes_log();
  }
}

- (void)handleDSOFile:(_ftsent *)a3
{
  int v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = openat(-2, a3->fts_path, 0);
  if (v3 == -1)
  {
    __error();
LABEL_8:
    _os_assumes_log();
    return;
  }
  v4 = v3;
  v5 = (void *)_os_trace_mmap();
  _os_assumes_log();
  if (v5)
    munmap(v5, 0);
  if (close(v4) == -1)
  {
    v6 = *__error();
    v7 = *__error();
    if (v6 != 9)
      goto LABEL_8;
    qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1EE52EA88 = v7;
    __break(1u);
  }
}

- (void)readDSCUUIDs
{
  DIR *v3;
  DIR *v4;
  uint64_t v5;
  dirent *v6;
  char *uuidtext_path;
  _QWORD v8[5];
  __n128 v9;
  char __str[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  snprintf(__str, 0x400uLL, "%s/dsc", self->_uuidtext_path);
  v3 = opendir(__str);
  if (v3)
  {
    v4 = v3;
    v5 = MEMORY[0x1E0C809B0];
    while (1)
    {
      v6 = readdir(v4);
      if (!v6)
        break;
      if (v6->d_type == 8)
      {
        v9 = 0uLL;
        if (_convertUUIDStringToUUID(v6->d_name, (unsigned __int8 *)&v9))
        {
          uuidtext_path = self->_uuidtext_path;
          v8[0] = v5;
          v8[1] = 3221225472;
          v8[2] = __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke;
          v8[3] = &unk_1E41573F8;
          v8[4] = self;
          _os_trace_uuiddb_dsc_run_block_on_map(uuidtext_path, &v9, (uint64_t)v8);
        }
      }
    }
    closedir(v4);
  }
  else
  {
    _os_assumes_log();
  }
}

@end
