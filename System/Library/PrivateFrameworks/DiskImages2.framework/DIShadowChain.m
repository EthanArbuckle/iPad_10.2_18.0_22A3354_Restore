@implementation DIShadowChain

- (DIShadowChain)init
{
  DIShadowChain *v2;
  uint64_t v3;
  NSMutableArray *nodes;
  uint64_t v5;
  NSArray *shadowStats;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DIShadowChain;
  v2 = -[DIShadowChain init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    shadowStats = v2->_shadowStats;
    v2->_shadowStats = (NSArray *)v5;

    v2->_shouldValidate = 1;
  }
  return v2;
}

- (BOOL)addShadowURLs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DIShadowNode *v13;
  DIShadowNode *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = [DIShadowNode alloc];
        v14 = -[DIShadowNode initWithURL:isCache:](v13, "initWithURL:isCache:", v12, 0, (_QWORD)v17);
        objc_msgSend(v7, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = -[DIShadowChain addShadowNodes:error:](self, "addShadowNodes:error:", v7, a4);
  return v15;
}

- (BOOL)verifyNodes:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v7)
  {
    v15 = 1;
    goto LABEL_15;
  }
  v8 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_msgSend(v10, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isFileURL");

      if ((v12 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shadow path %@ is not a valid file"), v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v16, a4);
LABEL_14:
        v15 = v17;

        goto LABEL_15;
      }
      -[DIShadowChain nodes](self, "nodes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v10);

      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Duplicate shadow values for: %@"), v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v16, a4);
        goto LABEL_14;
      }
    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    v15 = 1;
    if (v7)
      continue;
    break;
  }
LABEL_15:

  return v15;
}

- (BOOL)addShadowNodes:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;

  v6 = a3;
  v7 = -[DIShadowChain verifyNodes:error:](self, "verifyNodes:error:", v6, a4);
  if (v7)
  {
    -[DIShadowChain nodes](self, "nodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v6);

  }
  return v7;
}

- (void)openWritable:(BOOL)a3 createNonExisting:(BOOL)a4
{
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  BOOL v10;

  -[DIShadowChain nodes](self, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__DIShadowChain_openWritable_createNonExisting___block_invoke;
  v8[3] = &unk_24CEED930;
  v9 = a3;
  v10 = a4;
  v8[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

void __48__DIShadowChain_openWritable_createNonExisting___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  void *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  v7 = 514;
  if (*(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 41))
      v7 = 514;
    else
      v7 = 2562;
  }
  if (objc_msgSend(v5, "isCache"))
  {
    objc_msgSend(v6, "createBackendWithFlags:", v7);
    v8 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      objc_msgSend(v6, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      *(_DWORD *)buf = 68158211;
      v29 = 61;
      v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      v32 = 2113;
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      getDIOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158211;
        v29 = 61;
        v30 = 2080;
        v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
        v32 = 2113;
        v33 = v16;
        _os_log_impl(&dword_212EB0000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: Cache file %{private}@ opened with RW access", buf, 0x1Cu);

      }
    }
    goto LABEL_33;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "nodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") - 1 == a3)
      v13 = v7;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v6, "createBackendWithFlags:", v13);
  if ((v13 & 3) != 0)
  {
    v8 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v17 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      objc_msgSend(v6, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      *(_DWORD *)buf = 68158211;
      v29 = 61;
      v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      v32 = 2113;
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (char *)_os_log_send_and_compose_impl();

      if (!v19)
        goto LABEL_33;
      goto LABEL_25;
    }
    getDIOSLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "URL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      v29 = 61;
      v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      v32 = 2113;
      v33 = v24;
      _os_log_impl(&dword_212EB0000, v22, OS_LOG_TYPE_DEFAULT, "%.*s: Shadow file %{private}@ opened with RW access", buf, 0x1Cu);

    }
  }
  else
  {
    v8 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v20 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      objc_msgSend(v6, "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "path");
      *(_DWORD *)buf = 68158211;
      v29 = 61;
      v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      v32 = 2113;
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (char *)_os_log_send_and_compose_impl();

      if (!v19)
        goto LABEL_33;
LABEL_25:
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v19);
      free(v19);
      goto LABEL_33;
    }
    getDIOSLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "URL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      v29 = 61;
      v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      v32 = 2113;
      v33 = v27;
      _os_log_impl(&dword_212EB0000, v25, OS_LOG_TYPE_DEFAULT, "%.*s: Using an existing shadow file: %{private}@", buf, 0x1Cu);

    }
  }
LABEL_33:
  *__error() = v8;

}

- (id)statWithError:(id *)a3
{
  void *shadowStats;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t fd_from_backend;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  DIStatFS *v21;
  DIStatFS *v22;
  NSArray *v23;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  shadowStats = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[DIShadowChain nodes](self, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
      objc_msgSend(v9, "fileBackend");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

      if (v11)
        break;
      objc_msgSend(v9, "fileBackend");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "backend");
      }
      else
      {
        v26 = 0;
        v27 = 0;
      }
      get_sink_backend((uint64_t)&v26, &v28);
      fd_from_backend = get_fd_from_backend((uint64_t)&v28);
      v15 = v29;
      if (v29)
      {
        p_shared_owners = (unint64_t *)&v29->__shared_owners_;
        do
          v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      v18 = v27;
      if (v27)
      {
        v19 = (unint64_t *)&v27->__shared_owners_;
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }

      if ((fd_from_backend & 0x80000000) != 0)
      {
        +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, CFSTR("Unexpected backend type for shadow file"), a3);
        goto LABEL_28;
      }
      v21 = -[DIStatFS initWithFileDescriptor:error:]([DIStatFS alloc], "initWithFileDescriptor:error:", fd_from_backend, a3);
      v22 = v21;
      if (!v21)
      {
        +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, CFSTR("Could not stat shadow file"), a3);
        goto LABEL_28;
      }
      -[DIStatFS logWithHeader:](v21, "logWithHeader:", CFSTR("Shadow underlying FS"));
      objc_msgSend(shadowStats, "addObject:", v22);

      if (++v8 == v6)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_24;
      }
    }
    +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, CFSTR("Bakcend not initialized for file"), a3);
LABEL_28:

    v23 = 0;
    goto LABEL_29;
  }
LABEL_24:

  v23 = shadowStats;
  shadowStats = self->_shadowStats;
  self->_shadowStats = v23;
LABEL_29:

  return v23;
}

- (NSArray)mountPoints
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[DIShadowChain shadowStats](self, "shadowStats", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "mountedOnURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[DIShadowChain nodes](self, "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (NSURL)activeShadowURL
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[DIShadowChain isEmpty](self, "isEmpty")
    || (-[DIShadowChain nodes](self, "nodes"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "lastObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isCache"),
        v4,
        v3,
        (v5 & 1) != 0))
  {
    v6 = 0;
  }
  else
  {
    -[DIShadowChain nodes](self, "nodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v6;
}

- (BOOL)hasBaseImageCache
{
  char v3;
  void *v4;
  void *v5;

  if (-[DIShadowChain isEmpty](self, "isEmpty"))
    return 0;
  -[DIShadowChain nodes](self, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "isCache");

  return v3;
}

- (NSArray)nonCacheNodes
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIShadowChain nodes](self, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

uint64_t __30__DIShadowChain_nonCacheNodes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCache") ^ 1;
}

- (int64_t)topDiskImageNumBlocks
{
  int v3;
  NSObject *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  NSObject *v12;
  int64_t v13;
  int v14;
  int v15;
  __n128 v16;
  int v17;
  NSObject *v18;
  char *v19;
  NSObject *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint8_t v24[8];
  __int16 v25;
  const char *v26;
  uint8_t buf[8];
  _BYTE v28[10];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (-[DIShadowChain isEmpty](self, "isEmpty"))
  {
    v3 = *__error();
    if (DIForwardLogs())
    {
      *(_QWORD *)v24 = 0;
      getDIOSLog();
      v4 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&buf[4] = 38;
      *(_WORD *)v28 = 2080;
      *(_QWORD *)&v28[2] = "-[DIShadowChain topDiskImageNumBlocks]";
      v5 = (char *)_os_log_send_and_compose_impl();

      if (v5)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v5);
        free(v5);
      }
    }
    else
    {
      getDIOSLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        *(_DWORD *)&buf[4] = 38;
        *(_WORD *)v28 = 2080;
        *(_QWORD *)&v28[2] = "-[DIShadowChain topDiskImageNumBlocks]";
        _os_log_impl(&dword_212EB0000, v12, OS_LOG_TYPE_ERROR, "%.*s: numBlocks queried for an empty shadowChain.", buf, 0x12u);
      }

    }
    *__error() = v3;
    return -22;
  }
  else
  {
    -[DIShadowChain nodes](self, "nodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "fileBackend");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "backend");
      v11 = *(_QWORD *)buf;
      v10 = *(std::__shared_weak_count **)v28;
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)v28 = 0;

    v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 176))(v11);
    v15 = dup(v14);
    diskimage_uio::diskimage_open_params::create(v15, 0, 0, (uint64_t)buf);
    if (v28[8]
      && (v16.n128_f64[0] = diskimage_uio::diskimage_open_params::get_nr_blocks((const std::error_category **)buf, (__n128 *)v24), BYTE6(v26)))
    {
      v13 = *(_QWORD *)v24;
    }
    else
    {
      v17 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        v18 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)v24 = 68157954;
        *(_DWORD *)&v24[4] = 38;
        v25 = 2080;
        v26 = "-[DIShadowChain topDiskImageNumBlocks]";
        v19 = (char *)_os_log_send_and_compose_impl();

        if (v19)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v19);
          free(v19);
        }
      }
      else
      {
        getDIOSLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v24 = 68157954;
          *(_DWORD *)&v24[4] = 38;
          v25 = 2080;
          v26 = "-[DIShadowChain topDiskImageNumBlocks]";
          _os_log_impl(&dword_212EB0000, v20, OS_LOG_TYPE_DEFAULT, "%.*s: Failed to open top disk image node.", v24, 0x12u);
        }

      }
      *__error() = v17;
      v13 = -22;
    }
    if (v28[8])
      diskimage_uio::diskimage_open_params::~diskimage_open_params((diskimage_uio::diskimage_open_params *)buf);
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v10->__on_zero_shared)(v10, v16);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIShadowChain)initWithCoder:(id)a3
{
  id v4;
  DIShadowChain *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *nodes;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *shadowStats;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DIShadowChain;
  v5 = -[DIShadowChain init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("nodes"));
    v9 = objc_claimAutoreleasedReturnValue();
    nodes = v5->_nodes;
    v5->_nodes = (NSMutableArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("shadowStats"));
    v14 = objc_claimAutoreleasedReturnValue();
    shadowStats = v5->_shadowStats;
    v5->_shadowStats = (NSArray *)v14;

    v5->_shouldValidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldValidate"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DIShadowChain nodes](self, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("nodes"));

  -[DIShadowChain shadowStats](self, "shadowStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("shadowStats"));

  objc_msgSend(v6, "encodeBool:forKey:", -[DIShadowChain shouldValidate](self, "shouldValidate"), CFSTR("shouldValidate"));
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[DIShadowChain nodes](self, "nodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("ShadowChain: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (NSArray)shadowStats
{
  return self->_shadowStats;
}

- (BOOL)shouldValidate
{
  return self->_shouldValidate;
}

- (void)setShouldValidate:(BOOL)a3
{
  self->_shouldValidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowStats, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
