@implementation DiskImageGraph

+ (BOOL)loadPlistDictFromURL:(id)a3 dict:(id *)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "readDataUpToLength:error:", 0x100000, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v9, 2, 0, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *a4 = objc_retainAutorelease(v10);
        v11 = 1;
      }
      else
      {
        v11 = +[DiskImageGraph failWithNoPstackError:](DiskImageGraph, "failWithNoPstackError:", a5);
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = +[DiskImageGraph failWithNoPstackError:](DiskImageGraph, "failWithNoPstackError:", a5);
  }

  return v11;
}

+ (BOOL)failWithNoPstackError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Not a pstack."), CFSTR("DIErrorVerboseInfo"));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiskImages2.ErrorDomain"), 167, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return 0;
}

+ (id)createPstackDictWithNode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "toDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "setPstackDict:", v5);

  v6 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v3, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v3, "pstackDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "arrayWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", CFSTR("1.0"), CFSTR("PstackVersion"), v8, CFSTR("ActiveNode"), v11, CFSTR("Images"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (DiskImageGraph)initWithPluginName:(id)a3 pluginParams:(id)a4 newPstackURL:(id)a5 tag:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  DiskImageGraph *v15;
  DiskImageGraph *v16;
  uint64_t v17;
  void *v18;
  PluginDiskImageGraphNode *v19;
  DiskImageGraphNode *activeNode;
  PluginDiskImageGraphNode *v21;
  uint64_t v22;
  NSMutableDictionary *pstackDB;
  NSMutableDictionary *v24;
  NSMutableDictionary *nodes;
  void *v26;
  void *v27;
  void *v28;
  DiskImageGraph *v29;
  int v30;
  NSObject *v31;
  char *v32;
  NSObject *v33;
  uint64_t v35;
  objc_super v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)DiskImageGraph;
  v15 = -[DiskImageGraph init](&v36, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_4;
  objc_storeStrong((id *)&v15->_pstackURL, a5);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    LOBYTE(v35) = 0;
    v19 = -[PluginDiskImageGraphNode initWithPluginName:pluginParams:tag:UUID:parentNode:metadata:isCache:]([PluginDiskImageGraphNode alloc], "initWithPluginName:pluginParams:tag:UUID:parentNode:metadata:isCache:", v11, v12, v14, v17, 0, 0, v35);
    activeNode = v16->_activeNode;
    v16->_activeNode = &v19->super;
    v21 = v19;

    +[DiskImageGraph createPstackDictWithNode:](DiskImageGraph, "createPstackDictWithNode:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    pstackDB = v16->_pstackDB;
    v16->_pstackDB = (NSMutableDictionary *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    nodes = v16->_nodes;
    v16->_nodes = v24;

    -[DiskImageGraph nodes](v16, "nodes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageGraphNode UUID](v21, "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, v28);

LABEL_4:
    v29 = v16;
    goto LABEL_12;
  }
  v30 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v31 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    v38 = 73;
    v39 = 2080;
    v40 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
    v32 = (char *)_os_log_send_and_compose_impl();

    if (v32)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v32);
      free(v32);
    }
  }
  else
  {
    getDIOSLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      v38 = 73;
      v39 = 2080;
      v40 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
      _os_log_impl(&dword_212EB0000, v33, OS_LOG_TYPE_ERROR, "%.*s: Failed to get UUID info of provided image.", buf, 0x12u);
    }

  }
  v29 = 0;
  *__error() = v30;
LABEL_12:

  return v29;
}

- (NSMutableArray)imagesDictsArray
{
  void *v2;
  void *v3;

  -[DiskImageGraph pstackDB](self, "pstackDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Images"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableArray *)v3;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  void *v5;
  BOOL v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("PstackVersion"), objc_opt_class(), 0, a4))
  {
    if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("ImportPstack"), objc_opt_class(), 1, a4))
    {
      v6 = 0;
      if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("ActiveNode"), objc_opt_class(), 0, a4))
      {
        v6 = 0;
        if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("Images"), objc_opt_class(), 0, a4))
        {
          if (objc_msgSend(v5, "count"))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Validation failed, input contains unexpected data."));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v7, a4);

          }
          else
          {
            v6 = 1;
          }
        }
      }
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (DiskImageGraph)initWithData:(id)a3 pstackURL:(id)a4 imported:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  DiskImageGraph *v12;
  uint64_t v13;
  NSMutableDictionary *pstackDB;
  NSMutableDictionary *v15;
  NSMutableDictionary *nodes;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  DiskImageGraphNode *activeNode;
  DiskImageGraph *v23;
  DiskImageGraph *v24;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)DiskImageGraph;
  v12 = -[DiskImageGraph init](&v26, sel_init);
  if (v12)
  {
    if (!+[DiskImageGraph validateWithDictionary:error:](DiskImageGraph, "validateWithDictionary:error:", v10, a6))goto LABEL_10;
    v12->_imported = a5;
    objc_storeStrong((id *)&v12->_pstackURL, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    pstackDB = v12->_pstackDB;
    v12->_pstackDB = (NSMutableDictionary *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    nodes = v12->_nodes;
    v12->_nodes = v15;

    -[NSMutableDictionary objectForKeyedSubscript:](v12->_pstackDB, "objectForKeyedSubscript:", CFSTR("Images"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[DiskImageGraph populateNodesDictsWithArray:pstackURL:nodesDict:isTopLevelPstack:error:](DiskImageGraph, "populateNodesDictsWithArray:pstackURL:nodesDict:isTopLevelPstack:error:", v17, v11, v12->_nodes, 1, a6);

    if (!v18 || !-[DiskImageGraph loadImportedNodesWithError:](v12, "loadImportedNodesWithError:", a6))
      goto LABEL_10;
    -[DiskImageGraph nodes](v12, "nodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v12->_pstackDB, "objectForKeyedSubscript:", CFSTR("ActiveNode"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    activeNode = v12->_activeNode;
    v12->_activeNode = (DiskImageGraphNode *)v21;

    if (!v21)
    {
      +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("Bad pstack format, node with active UUID not found."), a6);
      v23 = (DiskImageGraph *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (!+[DiskImageGraph createNodesConnectivityWithNodesDict:error:](DiskImageGraph, "createNodesConnectivityWithNodesDict:error:", v12->_nodes, a6)|| !-[DiskImageGraph checkStackValidityWithError:](v12, "checkStackValidityWithError:", a6))
    {
LABEL_10:
      v24 = 0;
      goto LABEL_11;
    }
  }
  v23 = v12;
LABEL_9:
  v24 = v23;
LABEL_11:

  return v24;
}

- (BOOL)loadImportedNodesWithError:(id *)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[DiskImageGraph pstackDB](self, "pstackDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ImportPstack"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_9;
  if (!-[DiskImageGraph imported](self, "imported"))
  {
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      v7 = CFSTR("Multiple imports are not allowed.");
      goto LABEL_6;
    }
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageGraph pstackURL](self, "pstackURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:relativeToURL:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    a3 = -[DiskImageGraph initWithPstackURL:imported:error:]([DiskImageGraph alloc], "initWithPstackURL:imported:error:", v12, 1, a3);
    if (!a3)
    {

      goto LABEL_10;
    }
    -[DiskImageGraph nodes](self, "nodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "nodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addEntriesFromDictionary:", v14);

LABEL_9:
    LOBYTE(a3) = 1;
    goto LABEL_10;
  }
  v7 = CFSTR("nested imports are not allowed.");
LABEL_6:
  LOBYTE(a3) = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, v7, a3);
LABEL_10:

  return (char)a3;
}

- (DiskImageGraph)initWithPstackURL:(id)a3 error:(id *)a4
{
  return -[DiskImageGraph initWithPstackURL:imported:error:](self, "initWithPstackURL:imported:error:", a3, 0, a4);
}

- (DiskImageGraph)initWithPstackURL:(id)a3 imported:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  _BOOL4 v9;
  id v10;
  DiskImageGraph *v11;
  id v13;

  v6 = a4;
  v8 = a3;
  v13 = 0;
  v9 = +[DiskImageGraph loadPlistDictFromURL:dict:error:](DiskImageGraph, "loadPlistDictFromURL:dict:error:", v8, &v13, a5);
  v10 = v13;
  if (v9)
  {
    self = -[DiskImageGraph initWithData:pstackURL:imported:error:](self, "initWithData:pstackURL:imported:error:", v10, v8, v6, a5);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)copyDictNodesToFolder:(id)a3 dict:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v7 = a3;
  v8 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke;
  v18[3] = &unk_24CEED530;
  v21 = &v29;
  v11 = v7;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v22 = &v23;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v18);
  v13 = v30[5];
  if (v13)
  {
    v14 = (void *)v24[5];
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke_2;
    v16[3] = &unk_24CEED558;
    v17 = v12;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);
    if (a5)
      *a5 = objc_retainAutorelease((id)v30[5]);

  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v13 == 0;
}

void __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id obj;
  id v18;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = (void *)a1[4];
    objc_msgSend(v7, "filePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)a1[5];
    objc_msgSend(v7, "filePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v14 + 40);
    LOBYTE(v12) = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v13, v11, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);

    if ((v12 & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v11);
    else
      *a4 = 1;

  }
  else
  {
    *a4 = 1;
    v15 = *(_QWORD *)(a1[6] + 8);
    v18 = *(id *)(v15 + 40);
    +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 45, CFSTR("Clone of plugin nodes is not supported."), &v18);
    v16 = v18;
    v7 = *(id *)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v16;
  }

}

uint64_t __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", a2, 0);
}

- (BOOL)cloneToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  BOOL v30;
  uint64_t v31;
  void *v33;
  void *v34;
  id *v35;
  void *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DiskImageGraph pstackURL](self, "pstackURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCED8];
  -[DiskImageGraph pstackDB](self, "pstackDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DiskImageGraph pstackDB](self, "pstackDB");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Images"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:");
  -[DiskImageGraph pstackDB](self, "pstackDB");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ImportPstack"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = CFSTR("Cannot clone a pstack with an import.");
LABEL_16:
    v31 = 22;
LABEL_17:
    v30 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", v31, v17, a4);
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    v17 = CFSTR("Destination folder URL must be of 'file' scheme.");
    goto LABEL_16;
  }
  if (!objc_msgSend(v6, "hasDirectoryPath")
    || (objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v17 = CFSTR("Destination folder URL must represent an existing folder.");
    v31 = 20;
    goto LABEL_17;
  }
  v33 = v14;
  v34 = v12;
  v35 = a4;
  v36 = v9;
  v37 = v6;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = v14;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v24 = (void *)objc_msgSend(v23, "mutableCopy");
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("FilePath"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsSeparatedByString:", CFSTR("/"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("FilePath"));

        objc_msgSend(v38, "addObject:", v24);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v20);
  }

  -[DiskImageGraph nodes](self, "nodes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v37;
  v29 = +[DiskImageGraph copyDictNodesToFolder:dict:error:](DiskImageGraph, "copyDictNodesToFolder:dict:error:", v37, v28, v35);

  if (v29)
  {
    v12 = v34;
    v9 = v36;
    v30 = +[DiskImageGraph saveToPlistWithDictionary:URL:error:](DiskImageGraph, "saveToPlistWithDictionary:URL:error:", v34, v36, v35);
  }
  else
  {
    v30 = 0;
    v9 = v36;
    v12 = v34;
  }
  v14 = v33;
LABEL_18:

  return v30;
}

- (void)setActiveNode:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_activeNode, a3);
  v5 = a3;
  objc_msgSend(v5, "UUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pstackDB, "setObject:forKeyedSubscript:", v6, CFSTR("ActiveNode"));

}

+ (BOOL)populateNodesDictsWithArray:(id)a3 pstackURL:(id)a4 nodesDict:(id)a5 isTopLevelPstack:(BOOL)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __89__DiskImageGraph_populateNodesDictsWithArray_pstackURL_nodesDict_isTopLevelPstack_error___block_invoke;
  v18[3] = &unk_24CEED580;
  v22 = a6;
  v14 = v12;
  v19 = v14;
  v21 = &v23;
  v15 = v13;
  v20 = v15;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v18);
  v16 = (void *)v24[5];
  if (a7 && v16)
    *a7 = objc_retainAutorelease(v16);

  _Block_object_dispose(&v23, 8);
  return v16 == 0;
}

void __89__DiskImageGraph_populateNodesDictsWithArray_pstackURL_nodesDict_isTopLevelPstack_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;

  v6 = *(unsigned __int8 *)(a1 + 56);
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v10 + 40);
  +[DiskImageGraphNode GraphNodeWithDictionary:updateChangesToDict:workDir:error:](DiskImageGraphNode, "GraphNodeWithDictionary:updateChangesToDict:workDir:error:", v8, v6, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v11, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v14);

  }
  else
  {
    *a4 = 1;
  }

}

+ (BOOL)createNodesConnectivityWithNodesDict:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__DiskImageGraph_createNodesConnectivityWithNodesDict_error___block_invoke;
  v9[3] = &unk_24CEED5A8;
  v6 = v5;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (void *)v13[5];
  if (a4 && v7)
    *a4 = objc_retainAutorelease(v7);

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __61__DiskImageGraph_createNodesConnectivityWithNodesDict_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "parentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v15, "parentUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v15, "setParent:", v10);
      objc_msgSend(v15, "parent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "children");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v15);

    }
    else
    {
      *a4 = 1;
      +[DIError errorWithPOSIXCode:verboseInfo:](DIError, "errorWithPOSIXCode:verboseInfo:", 22, CFSTR("Missing parent node in graph."));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }

  }
}

- (BOOL)checkStackValidityWithError:(id *)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;

  -[DiskImageGraph activeNode](self, "activeNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -1;
  while (v5)
  {
    objc_msgSend(v5, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[DiskImageGraph nodes](self, "nodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    ++v6;
    v5 = v7;
    if (v9 <= v6)
    {
      v10 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Invalid pstack, Active stack contains a loop."), a3);

      return v10;
    }
  }
  return 1;
}

- (BOOL)savePstackWithError:(id *)a3
{
  void *v5;
  void *v6;

  -[DiskImageGraph pstackDB](self, "pstackDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiskImageGraph pstackURL](self, "pstackURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[DiskImageGraph saveToPlistWithDictionary:URL:error:](DiskImageGraph, "saveToPlistWithDictionary:URL:error:", v5, v6, a3);

  return (char)a3;
}

+ (BOOL)saveToPlistWithDictionary:(id)a3 URL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 100, 0, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "writeToURL:options:error:", v7, 1, a5);
  else
    v10 = 0;

  return v10;
}

- (BOOL)setActiveNodeWithUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[DiskImageGraph nodes](self, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DiskImageGraph setActiveNode:](self, "setActiveNode:", v9);
    v10 = 1;
  }
  else
  {
    v10 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Cannot find image with provided UUID."), a4);
  }

  return v10;
}

- (id)getImageWithTag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v6 = a3;
  v17 = v6;
  -[DiskImageGraph nodes](self, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __40__DiskImageGraph_getImageWithTag_error___block_invoke;
  v15[3] = &unk_24CEED5D0;
  v15[4] = v16;
  objc_msgSend(v7, "keysOfEntriesPassingTest:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "count"))
  {
    v12 = CFSTR("Cannot find image with provided tag.");
    v13 = 2;
LABEL_6:
    +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", v13, v12, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "count") != 1)
  {
    v12 = CFSTR("More than one image in the stack has the provided tag, please specify UUID instead.");
    v13 = 22;
    goto LABEL_6;
  }
  -[DiskImageGraph nodes](self, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  _Block_object_dispose(v16, 8);

  return v11;
}

uint64_t __40__DiskImageGraph_getImageWithTag_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  return v5;
}

- (id)getImageWithUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  -[DiskImageGraph nodes](self, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 2, CFSTR("Cannot find image with provided uuid."), a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (BOOL)setActiveNodeWithTag:(id)a3 error:(id *)a4
{
  void *v5;

  -[DiskImageGraph getImageWithTag:error:](self, "getImageWithTag:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[DiskImageGraph setActiveNode:](self, "setActiveNode:", v5);

  return v5 != 0;
}

- (BOOL)removeNodeWithUUID:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;

  v6 = a4;
  v8 = a3;
  -[DiskImageGraph nodes](self, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = -[DiskImageGraph removeWithNode:recursive:error:](self, "removeWithNode:recursive:error:", v11, v6, a5);
  else
    v12 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Cannot find image with provided UUID."), a5);
  v13 = v12;

  return v13;
}

- (BOOL)removeNodeWithTag:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  BOOL v9;

  v6 = a4;
  -[DiskImageGraph getImageWithTag:error:](self, "getImageWithTag:error:", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = -[DiskImageGraph removeWithNode:recursive:error:](self, "removeWithNode:recursive:error:", v8, v6, a5);
  else
    v9 = 0;

  return v9;
}

- (BOOL)removeWithNode:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(v8, "parent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "getDescendants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count") || v6)
    {
      -[DiskImageGraph activeNode](self, "activeNode");
      v14 = objc_claimAutoreleasedReturnValue();
      if ((id)v14 == v8)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[DiskImageGraph activeNode](self, "activeNode");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v10, "containsObject:", v16);

        if (!v17)
        {
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          objc_msgSend(v8, "children", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v30 != v21)
                  objc_enumerationMutation(v18);
                -[DiskImageGraph removeWithNode:recursive:error:](self, "removeWithNode:recursive:error:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v6, 0);
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            }
            while (v20);
          }

          objc_msgSend(v8, "deleteImage");
          -[DiskImageGraph imagesDictsArray](self, "imagesDictsArray");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "pstackDict");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObject:", v24);

          -[DiskImageGraph nodes](self, "nodes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "UUIDString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeObjectForKey:", v27);

          v13 = 1;
          goto LABEL_19;
        }
      }
      v11 = CFSTR("The requested operation will delete the active node, please set another one first.");
      v12 = 22;
    }
    else
    {
      v11 = CFSTR("The requested operation will delete all children of the provided node. use recursive removal to surpress this error.");
      v12 = 1;
    }
    v13 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v12, v11, a5);
LABEL_19:

    goto LABEL_20;
  }
  v13 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Cannot delete base image node."), a5);
LABEL_20:

  return v13;
}

+ (id)getRelativeIfContainedWithChildURL:(id)a3 parentURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isFileURL") & 1) != 0)
  {
    objc_msgSend(v5, "URLByStandardizingPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByStandardizingPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "hasPrefix:", v10))
    {
      v11 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v10, "length") + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fileURLWithPath:relativeToURL:", v12, v6);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "absoluteURL");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = v5;
  }

  return v13;
}

- (id)baseNode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[DiskImageGraph activeNode](self, "activeNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      objc_msgSend(v2, "parent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "parent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (NSURL)pstackURL
{
  return self->_pstackURL;
}

- (void)setPstackURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)pstackDB
{
  return self->_pstackDB;
}

- (void)setPstackDB:(id)a3
{
  objc_storeStrong((id *)&self->_pstackDB, a3);
}

- (void)setImagesDictsArray:(id)a3
{
  objc_storeStrong((id *)&self->_imagesDictsArray, a3);
}

- (NSMutableDictionary)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_storeStrong((id *)&self->_nodes, a3);
}

- (DiskImageGraphNode)activeNode
{
  return self->_activeNode;
}

- (BOOL)imported
{
  return self->_imported;
}

- (void)setImported:(BOOL)a3
{
  self->_imported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeNode, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_imagesDictsArray, 0);
  objc_storeStrong((id *)&self->_pstackDB, 0);
  objc_storeStrong((id *)&self->_pstackURL, 0);
}

- (id)infoWithExtra:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[DiskImageGraph baseNode](self, "baseNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recursiveInfoWithExtra:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activeInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  v7 = (void *)objc_opt_new();
  -[DiskImageGraph activeNode](self, "activeNode");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    while (1)
    {
      objc_msgSend(v9, "infoWithExtra:error:", v5, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
        break;
      v11 = (void *)v10;
      objc_msgSend(v7, "addObject:", v10);
      objc_msgSend(v9, "parent");
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
      if (!v12)
        goto LABEL_5;
    }
    v13 = 0;
  }
  else
  {
LABEL_5:
    objc_msgSend(v7, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)getImageInfoDictWithURL:(id)a3 error:(id *)a4
{
  id v5;
  DIImageInfoParams *v6;
  void *v7;

  v5 = a3;
  v6 = -[DIImageInfoParams initWithURL:error:]([DIImageInfoParams alloc], "initWithURL:error:", v5, a4);

  if (v6 && -[DIImageInfoParams retrieveWithError:](v6, "retrieveWithError:", a4))
  {
    -[DIImageInfoParams imageInfo](v6, "imageInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)getImageUUIDStrWithIdentityInfo:(id)a3 stackableUUIDFallback:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("Stable UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (v6 && (objc_msgSend(v7, "objectForKey:", CFSTR("UUID")), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (void *)v9;
      v10 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        v11 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        v16 = 91;
        v17 = 2080;
        v18 = "+[DiskImageGraph(InfoPrivate) getImageUUIDStrWithIdentityInfo:stackableUUIDFallback:error:]";
        v12 = (char *)_os_log_send_and_compose_impl();

        if (v12)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v12);
          free(v12);
        }
      }
      else
      {
        getDIOSLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v16 = 91;
          v17 = 2080;
          v18 = "+[DiskImageGraph(InfoPrivate) getImageUUIDStrWithIdentityInfo:stackableUUIDFallback:error:]";
          _os_log_impl(&dword_212EB0000, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Stable UUID not found in provided image, Falling back to using Stackable UUID.", buf, 0x12u);
        }

      }
      *__error() = v10;
    }
    else
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Provided image has no UUID info."), a5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

+ (id)getImageUUIDWithURL:(id)a3 allowMissingUUID:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)objc_opt_new();
  +[DiskImageGraph getImageInfoDictWithURL:error:](DiskImageGraph, "getImageInfoDictWithURL:error:", v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Image Format"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("RAW"));

    if ((v11 & 1) != 0)
    {
      if (v6)
      {
        v12 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          v13 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68157954;
          v23 = 74;
          v24 = 2080;
          v25 = "+[DiskImageGraph(InfoPrivate) getImageUUIDWithURL:allowMissingUUID:error:]";
          v14 = (char *)_os_log_send_and_compose_impl();

          if (v14)
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v14);
            free(v14);
          }
        }
        else
        {
          getDIOSLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68157954;
            v23 = 74;
            v24 = 2080;
            v25 = "+[DiskImageGraph(InfoPrivate) getImageUUIDWithURL:allowMissingUUID:error:]";
            _os_log_impl(&dword_212EB0000, v20, OS_LOG_TYPE_DEFAULT, "%.*s: Base image is raw format, using nil UUID.", buf, 0x12u);
          }

        }
        *__error() = v12;
        v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
      }
      else
      {
        +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Provided image has no UUID info."), a5);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)v19;
      goto LABEL_20;
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("Identity Info"));
    v17 = objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Provided image has no identity info."), a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
LABEL_20:
      v15 = 0;
      goto LABEL_23;
    }
    +[DiskImageGraph getImageUUIDStrWithIdentityInfo:stackableUUIDFallback:error:](DiskImageGraph, "getImageUUIDStrWithIdentityInfo:stackableUUIDFallback:error:", v17, v6, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v15);
      if (!v18)
      {
        +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Error in new image's UUID."), a5);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)v18;
    }
    else
    {
      v16 = 0;
    }
    v8 = (void *)v17;
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
LABEL_23:

  return v16;
}

- (BOOL)appendWithURL:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[DiskImageGraph activeNode](self, "activeNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[DiskImageGraph appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:](self, "appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:", v9, 0, v8, 0, v10, 0, a5);

  return (char)a5;
}

- (BOOL)appendCacheWithURL:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[DiskImageGraph activeNode](self, "activeNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[DiskImageGraph appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:](self, "appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:", v9, 1, v8, 0, v10, 0, a5);

  return (char)a5;
}

- (BOOL)appendWithURL:(id)a3 tag:(id)a4 numBlocks:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a4;
  v11 = a3;
  -[DiskImageGraph activeNode](self, "activeNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[DiskImageGraph appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:](self, "appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:", v11, 0, v10, a5, v12, 0, a6);

  return (char)a6;
}

+ (id)getFirstNonCacheAncestorWithNode:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(v5, "isCache"))
  {
    do
    {
      objc_msgSend(v5, "parent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v6;
    }
    while ((objc_msgSend(v6, "isCache") & 1) != 0);
    if (v6)
      goto LABEL_4;
LABEL_6:
    +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Pstack corrupted, found a cache node without a non-cache ancestor."), a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v6 = v5;
  if (!v5)
    goto LABEL_6;
LABEL_4:
  v7 = v6;
LABEL_7:
  v8 = v7;

  return v8;
}

- (BOOL)validateAppendedImageWithURL:(id)a3 parentNode:(id)a4 isCache:(BOOL)a5 error:(id *)a6
{
  int v7;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v7 = a5;
  v10 = a4;
  +[DiskImageGraph getImageInfoDictWithURL:error:](DiskImageGraph, "getImageInfoDictWithURL:error:", a3, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && objc_msgSend(v10, "validateAppendedImageWithInfo:error:", v11, a6))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Image Format"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ASIF"));

    if (v13)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ASIF Info"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Is Cache"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if (v16 == v7)
      {
        -[DiskImageGraph nodes](self, "nodes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Identity Info"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Stable UUID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v18 = 1;
          goto LABEL_11;
        }
        v17 = CFSTR("Stack already contains an image with the same stable UUID.");
      }
      else
      {
        v17 = CFSTR("Image cache flag does not match the requested operation.");
      }
    }
    else
    {
      v17 = CFSTR("Can only append ASIF formatted images to pstack.");
    }
    v18 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v17, a6);
  }
  else
  {
    v18 = 0;
  }
LABEL_11:

  return v18;
}

- (DiskImageGraph)initWithBaseImageURL:(id)a3 newPstackURL:(id)a4 tag:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  DiskImageGraph *v13;
  DiskImageGraph *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  DiskImageGraphNodeNative *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  DiskImageGraph *v26;
  int v27;
  NSObject *v28;
  char *v29;
  NSObject *v30;
  objc_super v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v32.receiver = self;
  v32.super_class = (Class)DiskImageGraph;
  v13 = -[DiskImageGraph init](&v32, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_4;
  -[DiskImageGraph setPstackURL:](v13, "setPstackURL:", v11);
  +[DiskImageGraph getImageUUIDWithURL:allowMissingUUID:error:](DiskImageGraph, "getImageUUIDWithURL:allowMissingUUID:error:", v10, 1, a6);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[DiskImageGraph pstackURL](v14, "pstackURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByDeletingLastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiskImageGraph getRelativeIfContainedWithChildURL:parentURL:](DiskImageGraph, "getRelativeIfContainedWithChildURL:parentURL:", v10, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = -[DiskImageGraphNodeNative initWithURL:tag:UUID:parentNode:metadata:isCache:]([DiskImageGraphNodeNative alloc], "initWithURL:tag:UUID:parentNode:metadata:isCache:", v19, v12, v16, 0, 0, 0);
    -[DiskImageGraph setActiveNode:](v14, "setActiveNode:", v20);
    +[DiskImageGraph createPstackDictWithNode:](DiskImageGraph, "createPstackDictWithNode:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageGraph setPstackDB:](v14, "setPstackDB:", v21);

    v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[DiskImageGraph setNodes:](v14, "setNodes:", v22);

    -[DiskImageGraph nodes](v14, "nodes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageGraphNode UUID](v20, "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v25);

    v10 = (id)v19;
LABEL_4:
    v26 = v14;
    goto LABEL_12;
  }
  v27 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v28 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    v34 = 70;
    v35 = 2080;
    v36 = "-[DiskImageGraph(Append) initWithBaseImageURL:newPstackURL:tag:error:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    if (v29)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v29);
      free(v29);
    }
  }
  else
  {
    getDIOSLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      v34 = 70;
      v35 = 2080;
      v36 = "-[DiskImageGraph(Append) initWithBaseImageURL:newPstackURL:tag:error:]";
      _os_log_impl(&dword_212EB0000, v30, OS_LOG_TYPE_ERROR, "%.*s: Failed to get UUID info of provided image.", buf, 0x12u);
    }

  }
  v26 = 0;
  *__error() = v27;
LABEL_12:

  return v26;
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 tag:(id)a5 numBlocks:(unint64_t)a6 setNewActive:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v11;
  id v14;
  id v15;
  void *v16;

  v9 = a7;
  v11 = a4;
  v14 = a5;
  v15 = a3;
  -[DiskImageGraph activeNode](self, "activeNode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a8) = -[DiskImageGraph appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:](self, "appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:", v15, v11, v14, a6, v16, v9, a8);

  return (char)a8;
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 tag:(id)a5 numBlocks:(unint64_t)a6 toNode:(id)a7 setNewActive:(BOOL)a8 error:(id *)a9
{
  _BOOL4 v9;
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  BOOL v23;
  BOOL v24;
  void *v25;
  DIStackParams *v26;
  uint64_t v27;
  DIStackParams *v28;
  void *v29;
  void *v30;
  void *v31;
  DiskImageGraphNodeNative *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  NSObject *v45;
  char *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v51;
  _BOOL4 v52;
  id v53;
  void *v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  const char *v58;
  uint64_t v59;

  v9 = a8;
  v13 = a4;
  v59 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = objc_msgSend(v15, "checkResourceIsReachableAndReturnError:", 0);
  +[DiskImageGraph getFirstNonCacheAncestorWithNode:error:](DiskImageGraph, "getFirstNonCacheAncestorWithNode:error:", v17, a9);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (!v19)
  {
    v24 = 0;
    goto LABEL_7;
  }
  v21 = v18 ^ 1;
  if (!a6)
    v21 = 1;
  if ((v21 & 1) != 0)
  {
    v52 = v9;
    v53 = v17;
    v54 = (void *)v19;
    if ((v18 & 1) != 0)
    {
      if (!-[DiskImageGraph validateAppendedImageWithURL:parentNode:isCache:error:](self, "validateAppendedImageWithURL:parentNode:isCache:error:", v15, v19, v13, a9))goto LABEL_21;
LABEL_13:
      v51 = v16;
      -[DiskImageGraph pstackURL](self, "pstackURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "URLByDeletingLastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[DiskImageGraph getRelativeIfContainedWithChildURL:parentURL:](DiskImageGraph, "getRelativeIfContainedWithChildURL:parentURL:", v15, v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      +[DiskImageGraph getImageUUIDWithURL:allowMissingUUID:error:](DiskImageGraph, "getImageUUIDWithURL:allowMissingUUID:error:", v25, 0, a9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v31 != 0;
      if (v31)
      {
        v32 = -[DiskImageGraphNodeNative initWithURL:tag:UUID:parentNode:metadata:isCache:]([DiskImageGraphNodeNative alloc], "initWithURL:tag:UUID:parentNode:metadata:isCache:", v25, v51, v31, v53, 0, v13);
        -[DiskImageGraph nodes](self, "nodes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraphNode UUID](v32, "UUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "UUIDString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKey:", v32, v35);

        -[DiskImageGraph imagesDictsArray](self, "imagesDictsArray");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraphNodeNative toDictionary](v32, "toDictionary");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v37);

        -[DiskImageGraph nodes](self, "nodes");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraphNode parentUUID](v32, "parentUUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "UUIDString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraphNode setParent:](v32, "setParent:", v41);

        -[DiskImageGraph imagesDictsArray](self, "imagesDictsArray");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "lastObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraphNode setPstackDict:](v32, "setPstackDict:", v43);

        if (v52)
          -[DiskImageGraph setActiveNode:](self, "setActiveNode:", v32);

        v16 = v51;
        v17 = v53;
      }
      else
      {
        v44 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          v45 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 68157954;
          v56 = 95;
          v57 = 2080;
          v58 = "-[DiskImageGraph(AppendPrivate) appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:]";
          v46 = (char *)_os_log_send_and_compose_impl();

          if (v46)
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v46);
            free(v46);
          }
        }
        else
        {
          getDIOSLog();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68157954;
            v56 = 95;
            v57 = 2080;
            v58 = "-[DiskImageGraph(AppendPrivate) appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:]";
            _os_log_impl(&dword_212EB0000, v48, OS_LOG_TYPE_ERROR, "%.*s: Failed to get info of newly created shadow/cache, will try to delete if an image was created.", buf, 0x12u);
          }

        }
        v17 = v53;
        *__error() = v44;
        v16 = v51;
        if ((v18 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "removeItemAtURL:error:", v25, 0);

          v17 = v53;
        }
      }

      goto LABEL_28;
    }
    v26 = [DIStackParams alloc];
    objc_msgSend(v17, "URL");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = -[DIStackParams initWithURL:error:](v26, "initWithURL:error:", v27, a9);

    LOBYTE(v27) = -[DIStackParams appendWithURL:isCache:numBlocks:error:](v28, "appendWithURL:isCache:numBlocks:error:", v15, v13, a6, a9);
    if ((v27 & 1) != 0)
    {
      if (-[DiskImageGraph validateAppendedImageWithURL:parentNode:isCache:error:](self, "validateAppendedImageWithURL:parentNode:isCache:error:", v15, v54, v13, a9))
      {
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "removeItemAtURL:error:", v15, 0);

    }
LABEL_21:
    v24 = 0;
    v25 = v15;
    v17 = v53;
LABEL_28:
    v20 = v54;
    goto LABEL_29;
  }
  v22 = (void *)v19;
  v23 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Append of existing image with custom size is not supported."), a9);
  v20 = v22;
  v24 = v23;
LABEL_7:
  v25 = v15;
LABEL_29:

  return v24;
}

@end
